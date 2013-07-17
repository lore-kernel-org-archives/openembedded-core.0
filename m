Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9C86AF13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 15:17:51 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so2077397pad.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6TqRLOj946Xj8xHjOs3uLaFu9mymnuGFzdOhcP4Ob10=;
	b=Ffm4ty/eKgR9/9Pcpb2Cwc3sLAe6XWqVLpWGSHQIjIR22JwVFK1tj6DLGt7ZBzoCnO
	xsyXaOMq5557HILcR3XUgOkXQGxnP+EdAhFf50oYdpOZFGWndFmPa5y6ydd6Y/Y5LqpH
	qVscyAvEGPfUrTzvx6ojUYa1OY/9qyvSkstbF9GWKOcav72JnzVsrLxS/O+5QzagC+CI
	sJel6ON7mbSHpxlYxWZTjAXo9uJ4yJz5UDVLFJbj3EzxO8ExZvVrKY/8q5O34+YPCQH4
	B9RwHg4sF+3ZPDaEUxnK7MBTJ5y4hjiWIzjK6MCuV40RHPq/q9G7QbAVkblvGktZ5Ojw
	e3Zw==
X-Received: by 10.68.223.225 with SMTP id qx1mr7250597pbc.157.1374074271985;
	Wed, 17 Jul 2013 08:17:51 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id cx3sm8377016pbb.30.2013.07.17.08.17.50
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 08:17:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2013 08:17:42 -0700
Message-Id: <1374074262-3614-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] uclibc: Build ldd/ldcondif/iconv for main uclibc recipe
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
X-List-Received-Date: Wed, 17 Jul 2013 15:17:51 -0000

Currently these were not building as a result
uclibc based systems were missing ldd and any package
depending on ldd package were broken since the package
was empty.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 86a7417..29bc62b 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -156,5 +156,10 @@ do_configure() {
 
 do_install() {
         oe_runmake PREFIX=${D} install
-        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" install_utils
 }
+
+# build ldd, ldconfig and friends but only for full uclibc
+do_install_append_pn-uclibc () {
+        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" -C utils utils_install
+}
+
-- 
1.7.9.5


