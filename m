Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id BEE796072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:09 +0000 (UTC)
Received: by qkao63 with SMTP id o63so27736578qka.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ow6Kq5DnhrcfBEngfaQsmXMCQIzq7pMpW4t/5xt3BPY=;
	b=WD9YIN86qaKtGxZ3yZkdJQdyf+zyaRAofA68nt5HG5lF9/oD0B3pviOr9h6jcYCwED
	aya2cNiT2yOa6pyIibStn/ja1qU+OjVJGO/GP8oIdyjKZvTapQKocGA8C/13iYVi0Qz2
	743PNEnpwNfkftz9TYQPPKBCK/ePJQNQ7mJMYFgToy/QSa74AKORaOo9VKAqUbzF9OCd
	ruz3liSCAAfOF6fcGS7dDgMid0n7X9kj6IvS+ySxkpmRDF2PS050mNyEOjP9eJZSG+G3
	6QtmMhecj0byk2iQp8x1/HXIr5hG/eI/+4+mwwv1fftmqyR1s3y5lvmvKBnll2mfo84J
	P05w==
X-Received: by 10.55.21.65 with SMTP id f62mr8213650qkh.46.1447953070151;
	Thu, 19 Nov 2015 09:11:10 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:56 +0000
Message-Id: <be6fc2d65d654b67f122994920eee90984ea5334.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:10 -0000

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


