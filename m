Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1STyXD-00045x-ER
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 18:54:11 +0200
Received: by yhjj56 with SMTP id j56so4629037yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jGJyvV7ksgRc1mStGlc5/JajddAYj3Xe8f1v8+ElZqw=;
	b=oc763IazCL3v5q0Xaa1BUc2ObOQ2pbhUXo+c4JHEalh6iXuK6wWKTtmmkvg6aStpsF
	EF4kPXnMrGXBezzLHs+hGX4TsDreStZBwhe9jZ2iskEzwBa66DnBlzwhQZyKnTX7Bbv4
	DYwChRDH0qvMDduBqSbKcSOIv3ywaPtwsKxi2dXBWRBrybcU7Ch+vlliVqiCSKiAm4ZF
	AkWzb5YIs7yAMkygPn1iEEx/ho3Biga5laJDCawSTTZhTSGJ1hFq2H2TjvpuupmsqJGh
	3l+SU1c0mpNV8tMBiwBs50NOjyPodbjATfMRPOU7CYMIlfe3U8gI2FuilCsVO1DnybRN
	9cWw==
Received: by 10.60.30.3 with SMTP id o3mr12895897oeh.9.1337013851933;
	Mon, 14 May 2012 09:44:11 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs8sm8863380obb.14.2012.05.14.09.44.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 09:44:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2012 11:45:03 -0500
Message-Id: <ee330617f6247dce01dccb23dcded5d2cc5edf87.1337013858.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1337013858.git.chris_larson@mentor.com>
References: <cover.1337013858.git.chris_larson@mentor.com>
In-Reply-To: <cover.1337013858.git.chris_larson@mentor.com>
References: <cover.1337013858.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] tcmode-external-csl: avoid hardcoding a list of ia32 archs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2012 16:54:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 0a48658..deabd49 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -70,7 +70,9 @@ python toolchain_metadata_setup () {
 
     d = e.data
 
-    if d.getVar('TUNE_PKGARCH', True) in ('i586', 'i686'):
+    l = d.createCopy()
+    l.finalize()
+    if os.path.exists(bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/gcc', l)):
         d.setVar('TOOLCHAIN_PATH_ADD', '')
 }
 addhandler toolchain_metadata_setup
@@ -81,7 +83,7 @@ python toolchain_setup () {
 
     d = e.data
 
-    if d.getVar('TUNE_PKGARCH', True) in ('i586', 'i686'):
+    if not d.getVar('TOOLCHAIN_PATH_ADD', True):
         populate_toolchain_links(d)
 }
 addhandler toolchain_setup
-- 
1.7.7



