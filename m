Return-Path: <danismostlikely@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB2360169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 16:09:15 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id at20so3095568iec.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 08:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xYItEWAEhOeOCd8Ti+GyfeJvuwC59Qc2PW1nhDgrRis=;
	b=JDh6xK2FE8N9Z5uRxrHccN36AnX0D61r7Oxc9hEBRVHOZSh4qXtEPNkWekFgupYKcy
	VOh6bXUdmFcJWepK6jExkChLonMXH55NEdcFzycqZS5TLf/4OH/JkJ6lKA2yCxnCcZPI
	CmE1wf+nkNLzXzJQIH/OA7VM0zXWkU35ZHDiLS/0z3QyacD7e7WJglaQB6T0OO3zfjZe
	fXz0ljOB57I+Z/KmJWDeH8l2ToW213yWlIZjKrxrqm9maksEpeEabysG/WdbxwVpWeJn
	y5GfuUU9aqw2ES6BnOt+Uo11H8pdQb8CAMLsM7/KCWZnlM4YVYBRZr6uJ0ki8R7RWrCM
	mu5g==
X-Received: by 10.50.234.194 with SMTP id ug2mr25134733igc.39.1423066157106;
	Wed, 04 Feb 2015 08:09:17 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id g15sm1067481ioi.22.2015.02.04.08.09.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 08:09:16 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Feb 2015 10:09:13 -0600
Message-Id: <1423066153-24933-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
References: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 2/2] openssh: Fix non-deterministic build behaviour
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
X-List-Received-Date: Wed, 04 Feb 2015 16:09:18 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

If maillock.h is found, a dependency on liblockfile will be created.
liblockfile is in meta-oe, so we don't want that in an oe-core recipe.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-connectivity/openssh/openssh_6.7p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
index dcbc181..a272629 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
@@ -62,6 +62,9 @@ CACHED_CONFIGUREVARS += "ac_cv_header_bsd_libutil_h=no ac_cv_header_libutil_h=no
 # passwd path is hardcoded in sshd
 CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 
+# We don't want to depend on libblockfile
+CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
+
 # This is a workaround for uclibc because including stdio.h
 # pulls in pthreads.h and causes conflicts in function prototypes.
 # This results in compilation failure, so unless this is fixed,
-- 
2.1.0


