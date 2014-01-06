Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 06D4560D27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 17:17:35 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so18473294pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2014 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=jCpOhs1sRjzKa98OZ6QkW/7SR/C9YPX7V37Znn5fs9c=;
	b=NBbsdWWdfGVkWwVqRkvXh1mdn0qaXtCFnPCcP7ZsjNin4sTyjxtms1Uj4D3VaYO0t1
	0ysfCGNSVTUb+U8hVUwxC00MijNeHjKBa9YwPqPVsfNESyQXOw7+mS4de2lms1O6IkPl
	iQPKR/K9CUUHnxiI6XJvlffUW6FmHxzzDB5qbvo5ZmT8Ct3mcoZKsN9Ynn3MbexoIc5v
	KWYsCkng9/WRMASDncY2qAb6ww/bN/agG+s+j+6wDxk1g4Fv4cZsOSkMp+OETuHpvSxf
	4IKAO0OCbSifpK4vGqZBV26FFl0goQEv9qNKT/l7wFIIhnoCBZ7LcCa1LYxu5pQB6REG
	YnKw==
X-Received: by 10.68.164.4 with SMTP id ym4mr83269294pbb.53.1389028653221;
	Mon, 06 Jan 2014 09:17:33 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	ic7sm130136768pbc.29.2014.01.06.09.17.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 Jan 2014 09:17:31 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 10:17:27 -0700
Message-Id: <1389028647-450-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] base.bbclass: pull in file-native for src.rpm
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
X-List-Received-Date: Mon, 06 Jan 2014 17:17:35 -0000

Unpacking an src.rpm uses rpm2cpio.sh, which requires 'file'.

Without this, builds of rpm on a host without 'file' installed will fail with
very strange messages.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 73920fd..2e5217b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -582,6 +582,10 @@ python () {
     if ".zip" in srcuri:
         d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
+    # file is needed by rpm2cpio.sh
+    if ".src.rpm" in srcuri:
+        d.appendVarFlag('do_unpack', 'depends', ' file-native:do_populate_sysroot')
+
     set_packagetriplet(d)
 
     # 'multimachine' handling
-- 
1.8.3.4


