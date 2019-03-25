Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3FAD67D074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 09:38:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so1551581wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QEMY+sIykqNlZcn7RmruBdOKICzJSrEqSQWhKMksOhA=;
	b=jjnoDeM4cls/GISFBXQ6fmsJFKNXJZsllKgByY6ubkClelM8S2A1YcakWFVVVoGucc
	QFseRZmlVL0/nH7K57M7O51iYMzgwZnc+ACxK+YodyoHvvtXvJhXFeg4aQP8fIKy0mcD
	E36JVLillEDPANETiwOI7SZHdcQSlbldQgcdpOZTXpMe4CwdER9dWIE6U7J1x1KbUBSE
	IJhf7A9lJRySnxyKP4NHzw0W2XPwXzsfqzdhfwWo/eTgPwfBgDBM4CbbLDEhVP1bC8rN
	f1qllCn/GgyYHQ9MLXIoxEuURAeTskoIDQlOWJlILEaxNirlAtHOw+Y9vkeBR1fUIdFE
	jsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QEMY+sIykqNlZcn7RmruBdOKICzJSrEqSQWhKMksOhA=;
	b=Q/IZxY8QzRF9JdXw10diQ6By6p93ZpCcx1+dFaxpLmQXCQCPrRuCjfQOHXQS/znZQt
	JhST3YEzKlNROqOh+qyhq82YTW9GKBdzs9VwA4v4XMWPQQNDbUdwFenJ7GkojJ8KB810
	P3HrDaCo7oxI9j58k7N+7+3lZXxvt4odMp56g2PSzv7mzMjsd4EOCuk91LmdntFOEMYj
	S9TDdGNc3S2j0684ho0cxzcd65ztqUk+/XwGeOfYFn5GPyRgLs4b17krPsmuNtXZZqRO
	GdS93dE3JW3oOIWrZ13clicxTchku+MjzRj94WVOlrO30r10vUgiIyqClI5KG7MwUD0Q
	TSwg==
X-Gm-Message-State: APjAAAW42KfoMl3RFLavTPLLC4STfATKiPmFtetCBEMh+31bLUUw0eM3
	rAb/KzyFMgT+fOKEWVnRRE6/7A96D48=
X-Google-Smtp-Source: APXvYqz+GOMVevTwfrMnMnTuK2xCTnAEci3AxWJdc6oF/0LqmtWAyaAmj5QagJ1pTReNecKExYoYXQ==
X-Received: by 2002:adf:e60d:: with SMTP id p13mr14162868wrm.265.1553506680930;
	Mon, 25 Mar 2019 02:38:00 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	d14sm12249776wro.79.2019.03.25.02.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 02:38:00 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 09:37:55 +0000
Message-Id: <1553506675-11519-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553506675-11519-1-git-send-email-alex.kiernan@gmail.com>
References: <1553506675-11519-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH v2 2/2] wget: Convert EXTRA_OECONF to PACKAGECONFIG, extend PACKAGECONFIG
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
X-List-Received-Date: Mon, 25 Mar 2019 09:38:01 -0000

Convert existing EXTRA_OECONF and DEPENDS to PACKAGECONFIG, fill out
remaining PACKAGECONFIG options. When building without libpsl we pass in
--without-libpsl, which we didn't previously, but all this actually ends
up doing is silencing a warning from the configure script, the code
still uses an internal implemention when using this option.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- drop ac_cv_header_uuid_uuid_h hack

 meta/recipes-extended/wget/wget.inc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 3cff656a68d9..2f63e2138595 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -3,12 +3,11 @@ HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
-DEPENDS = "gnutls zlib libpcre"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
-EXTRA_OECONF = "--with-ssl=gnutls --disable-rpath --disable-iri \
-                --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
+EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
+                --disable-rpath"
 
 EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
                  DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}"'
@@ -21,9 +20,17 @@ RRECOMMENDS_${PN} += "ca-certificates"
 
 BBCLASSEXTEND = "nativesdk"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
+PACKAGECONFIG ??= "gnutls pcre zlib \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ares] = "--with-cares,,c-ares"
+PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[iri] = ",--disable-iri,libidn2"
+PACKAGECONFIG[libpsl] = ",--without-libpsl,libpsl"
+PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
+PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
+PACKAGECONFIG[pcre] = ",--disable-pcre,libpcre"
+PACKAGECONFIG[zlib] = ",--without-zlib,zlib"
 
 # Let aclocal use the relative path for the m4 file rather than
 # absolute, otherwise there might be an "Argument list too long" error
-- 
2.7.4


