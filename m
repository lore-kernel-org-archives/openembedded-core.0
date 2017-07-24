Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id EF6C678352
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:14:20 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v6OBEJF0017318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 13:14:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1500894860;
	bh=GhXpxWE0cCXyFj+eEssrGb1KVLkyTFKpd0tPdhMVYs4=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=A+6iXgFOKRldQt0vKyxhy7Xj3mTkNxRbnkRCkB+dm3mblUb5D/PJ1gqngxH2nhMbr
	lnbVw/JCXQ6tOgLQkHGcjjAl6FotXpYO7FaJjGYtOnMWCmc/VL1iIlCoVS981YzCYP
	h8vGTzLKNGjcCfMPVYzCf0zbxH125PrijbhjQhj0=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v6OBEC50024559 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 24 Jul 2017 13:14:13 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1D4E411E9BB;
	Mon, 24 Jul 2017 13:10:18 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v6OBE9OJ024555
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 24 Jul 2017 13:14:10 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1dZbJR-0007v4-Nc; Mon, 24 Jul 2017 13:14:09 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 13:14:02 +0200
Message-Id: <20170724111402.30340-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] externalsrc: place copy of git index into /tmp and do not use copyfile2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 11:14:21 -0000

Using shutil.copy2() to copy .git/index to a temporary file tries to
copy SELinux attributes which might fail for confined users in SELinux
environments.

E.g. our builders are running in docker containers and modification of
sources (inclusive updated of .git/index) is done outside.  Trying to
copy .git/index fails with

| $ python3 -c 'import shutil; shutil.copy2("index", "a")'
| ...
| PermissionError: [Errno 13] Permission denied: 'a'

and an AVC like

| denied  { relabelto } for  pid=18043 comm="python3" name="a" dev="dm-29" ino=1067553 scontext=system_u:system_r:container_t:s0:c39,c558 tcontext=unconfined_u:object_r:build_file_t:s0 tclass=file permissive=0

is created.  This can not be solved by adapting the SELinux policy because
this is a very deep constraint violation:

| constrain file { create relabelfrom relabelto } ((u1 == u2 -Fail-)  or (t1 == can_change_object_identity -Fail-) ); Constraint DENIED
|
| Possible cause is the source user (system_u) and target user (unconfined_u) are different.


I do not see much sense in using 'shutil.copy2()' here; 'shutil.copyfile()'
seems to be a better choice (target file is created in a secure way by
tempfile.NamedTemporaryFile()).

By placing the tempfile into /tmp we avoid potential problems related to
git's 'core.sharedRepository'.  As a (positive) side effect, the source
tree will not be modified anymore (at least by this part of code) which
prevented to mount it read-only from somewhere else.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/externalsrc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 529be49..9aabb42 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -189,9 +189,9 @@ def srctree_hash_files(d, srcdir=None):
 
     ret = " "
     if os.path.exists(git_dir):
-        with tempfile.NamedTemporaryFile(dir=git_dir, prefix='oe-devtool-index') as tmp_index:
+        with tempfile.NamedTemporaryFile(prefix='oe-devtool-index') as tmp_index:
             # Clone index
-            shutil.copy2(os.path.join(git_dir, 'index'), tmp_index.name)
+            shutil.copyfile(os.path.join(git_dir, 'index'), tmp_index.name)
             # Update our custom index
             env = os.environ.copy()
             env['GIT_INDEX_FILE'] = tmp_index.name
-- 
2.9.4


