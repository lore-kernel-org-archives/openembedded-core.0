Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mpnorman@gmail.com>) id 1SMIRE-0007v5-VJ
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 14:32:17 +0200
Received: by dakh32 with SMTP id h32so16750892dak.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yFRyQ6SicWu/TbZyAIB/XfGHe0PMRAGSBvTYkd3Z5eo=;
	b=WxzahU40LJrRqUKzqWR/bqI14zJmqJflAJKjbXIO4gA53xCRLRAtj4tZ3JnmM1g00t
	mLbPCC9SPclcP6MGvLi7qAkhu/J7lPBlSgYq+UrYTZ69FZWOGYmH/xzpMxsA8SK5kGb7
	kwuFSG3qyr4L3E3U5AiLIlepZ+gqjXTQ1YHSA3F+e648qczL97UcjBiT/EAEKLOZo99U
	xwg4iI1Dco77CUWn5RJjBfShG9n6hepAvIkXJ8kJgnNAziSpWEBHmHRGOYPE9vXLi5cm
	VoC2zy0Yl7lR2ELAut+LIfS33OglMZq14LFpbzY//sLYgO/KmVBcjY2wJFwkMr8/l0qi
	Rw/Q==
Received: by 10.68.220.161 with SMTP id px1mr21532875pbc.12.1335183763009;
	Mon, 23 Apr 2012 05:22:43 -0700 (PDT)
Received: from localhost.localdomain (182-239-169-239.ip.adam.com.au.
	[182.239.169.239])
	by mx.google.com with ESMTPS id os8sm13546168pbc.14.2012.04.23.05.22.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 05:22:42 -0700 (PDT)
From: Mark Norman <mpnorman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2012 21:52:21 +0930
Message-Id: <1335183741-2902-1-git-send-email-mpnorman@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] uclibc SDK not including libpthread_nonshared.a
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
X-List-Received-Date: Mon, 23 Apr 2012 12:32:17 -0000

Modified the uclibc PACKAGES list order to ensure the uclibc-dev package is
processed before uclibc-staticdev to allow *_nonshared.a libraries to be
packaged in the uclibc-dev package.  The *_nonshared.a libraries are required
by the SDK.
---
 meta/recipes-core/uclibc/uclibc.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 893d8fd..9316e26 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -48,9 +48,9 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
-PACKAGES =+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm"
-PACKAGES =+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
+# Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
+# *_nonshared.a libraries to be packaged in the uclibc-dev package.
+PACKAGES = "${PN}-dbg ${PN} ldd ${PN}-utils ${PN}-utils-dbg uclibc-thread-db uclibc-gconv ${PN}-dev ${PN}-staticdev ${PN}-doc uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
 
 FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
 FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
-- 
1.7.1



