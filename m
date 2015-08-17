Return-Path: <clemens.lang@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 81428606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:37:51 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:23119
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1ZRFvQ-00041r-0j; Mon, 17 Aug 2015 10:37:48 +0200
Received: from localhost (172.20.20.163) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Mon, 17 Aug 2015 10:37:47 +0200
X-CTCH-RefID: str=0001.0A0C0201.55D19D5C.00F8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 17 Aug 2015 10:37:47 +0200
Message-ID: <1439800667-31696-1-git-send-email-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <CAJTo0LZ4u-Q2nc+_phmq4NxR9o7Xyyij=tGmE-KxgsODhQdN5A@mail.gmail.com>
References: <CAJTo0LZ4u-Q2nc+_phmq4NxR9o7Xyyij=tGmE-KxgsODhQdN5A@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.20.163]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] archiver.bbclass: Run deploy_archives in $WORKDIR
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
X-List-Received-Date: Mon, 17 Aug 2015 08:37:53 -0000
Content-Type: text/plain

In recipes that are exempt from source code archiving due to
COPYLEFT_LICENSE_EXCLUDE, do_deploy_archives does not have a transitive
dependency on do_unpack. Given enough parallelism, this means
do_deploy_archives can run at the same time or before do_unpack.

Because do_deploy_archives did not specify a working directory, its
working directory was ${B}, which defaults to ${S}, which may be set by
a recipe to a directory that is created by do_unpack.

In this case, do_deploy_archives can fail because do_unpack deletes and
re-creates the directory and do_deploy_archives cannot change into the
non-existent directory. Avoid this problem by explicitly specifying
a working directory for do_deploy_archives (and for
do_deploy_all_archives as well for good measure).

Signed-off-by: Clemens Lang <clemens.lang@bmw-carit.de>
---
 meta/classes/archiver.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index d908d16..f9c439e 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -45,6 +45,11 @@ ARCHIVER_WORKDIR = "${WORKDIR}/archiver-work/"
 do_dumpdata[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_recipe[dirs] = "${ARCHIVER_OUTDIR}"
 do_ar_original[dirs] = "${ARCHIVER_OUTDIR} ${ARCHIVER_WORKDIR}"
+# When not set, the working directory for the following tasks can default to
+# a location that will be deleted and re-created by do_unpack, which can lead
+# to failure; avoid that by explicitly setting them.
+do_deploy_archives[dirs] = "${WORKDIR}"
+do_deploy_all_archives[dirs] = "${WORKDIR}"
 
 # This is a convenience for the shell script to use it
 
-- 
2.1.0


