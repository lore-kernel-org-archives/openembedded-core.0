Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 691326FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:43 +0000 (UTC)
Received: by qgec40 with SMTP id c40so9970171qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ow6Kq5DnhrcfBEngfaQsmXMCQIzq7pMpW4t/5xt3BPY=;
	b=s2rjHTo3rwgSDJ+uCY57RzrhKKXGJQEZKOqERMc3EYf828eqp6LOk2lASrumUbUX6P
	U237z0XyQmE72cgWPBv9mX9DMqOJAT910dhEfOF2/R0HQzy1zdLlzn5kdZmL4b9pEIht
	mj3lK5MBHldOtuIc4AlOfEjbzzijPy61a+T3ioJ3TK59/d35idg0bEJqjEAolJcxJmzW
	gvQVQ9NOSDDyBF2MehSFCTGxSQUKVGFIP78K8UIVHFyGMLDZawkHgxlwBWbdfHaAfy36
	qiSNoP/IcDtzeiMcT0JrwT5PJEcj4J3RK+GnnOz3UFfFv+dyE7Gubuwf1OS7SSNi+Kdf
	OVGw==
X-Received: by 10.140.100.175 with SMTP id s44mr2713757qge.47.1449562364598;
	Tue, 08 Dec 2015 00:12:44 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:29 +0000
Message-Id: <18f9e395d969a0d33d4d78da4be0237b5cb1ea18.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
References: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 09/13] gettext: Delete libintl.h and charset.alias
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:46 -0000

libintl.h is already provided by musl and charset.alias is regenerated
by packages themselves

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 5 +++++
 meta/recipes-core/gettext/gettext_0.19.4.bb | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index f9f7a7f..cd0b759 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -39,6 +39,11 @@ do_configure_prepend() {
 	rm -f ${S}/config/m4/libtool.m4
 }
 
+do_install_append_libc-musl () {
+	rm -f ${D}${libdir}/charset.alias
+	rm -f ${D}${includedir}/libintl.h
+}
+
 # these lack the .x behind the .so, but shouldn't be in the -dev package
 # Otherwise you get the following results:
 # 7.4M    glibc/images/ep93xx/Angstrom-console-image-glibc-ipk-2008.1-test-20080104-ep93xx.rootfs.tar.gz
diff --git a/meta/recipes-core/gettext/gettext_0.19.4.bb b/meta/recipes-core/gettext/gettext_0.19.4.bb
index cebf6c7..a9c919a 100644
--- a/meta/recipes-core/gettext/gettext_0.19.4.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.4.bb
@@ -42,6 +42,10 @@ EXTRA_OECONF += "--without-lispdir \
 acpaths = '-I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
 
+do_install_append_libc-musl () {
+	rm -f ${D}${libdir}/charset.alias
+	rm -f ${D}${includedir}/libintl.h
+}
 
 # these lack the .x behind the .so, but shouldn't be in the -dev package
 # Otherwise you get the following results:
-- 
2.6.3


