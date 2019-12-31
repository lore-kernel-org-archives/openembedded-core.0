Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id F3E8C7F9AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 00:44:53 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id a6so501501pjh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 16:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pIZ4um5rPa6FoTGXnmSyC5dTd2WZNCUk+DXuLYb/RaI=;
	b=kPLypyEhQNJkUSUxPSPIcSNkftXA8YzzoqMv+KAQy/oaDFhYYuP3Y32B7yCplf0kVj
	dnIIpX7C0YprcXFkxiFPCQwwXf2xaub3YlMKf+yGkgxks6uQXKDMKmkHrvv82AcRbawq
	FGwzYsahF/kz721v8M7sCVIhyvfdzOg3ihHUQavQEq2Dlui3PsA7r9DDGafJAntcISc8
	0bVsPNJmbMPkE6S/pi0yOFWvyAoG3aSdDj9ViWuQmVSbNTLZTP5+jS1zP+zla5af/DyT
	1j5y7cqpFKK31DcRuUpp1rOS6Xxk0q1/F1hAf8b+uPkwf/s65WV73iVS3s/Cl4MDZZCr
	koNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pIZ4um5rPa6FoTGXnmSyC5dTd2WZNCUk+DXuLYb/RaI=;
	b=hlsXi0CkRtG2vO1BE/8sMteHQ6B3KCLs0NysCqagqic5IIer8VGc9QsLjnWmY2HeMr
	dq7dkLUmmhtaounuCxWzVaVogUARMOYRXTAOYnPjhmDIJgmeXtnqzux6+DCq7k1lJjyl
	eg4T4kkzIOzIbrtz/tkqdFR/utcA+5aOi3ASUkdKSDp/HemCIdJ/qr6mS3tnzaTmAlE4
	XHGFXqTFWvWNGSiXivHoh9Eaho2RyoaonrkD24O2qN/aRcLhJs01Zi9uA0MOrF3IWdQW
	FYRdc5flrEEIecPwccjHhSbdQemVWnbi4LiZjcDMS+FIJWIPK5iMrx+l2fV66zNtBKUn
	3nag==
X-Gm-Message-State: APjAAAX1bQsNW1vNR6xDHa5KFWdQHbbCj4gy8U7dMjc5bxWvUVkbk0q7
	mfbE0n9P5YooeyVusXZP/r4khpwhFmo=
X-Google-Smtp-Source: APXvYqzW1bvV5WYC6naeOWnBr7OyuuGCrz3G1rliLek6uKRPCjvhPW3xo8v7gwPLoipyAL4GIyP+dw==
X-Received: by 2002:a17:90a:8043:: with SMTP id
	e3mr2661488pjw.24.1577753094392; 
	Mon, 30 Dec 2019 16:44:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	z130sm49806277pgz.6.2019.12.30.16.44.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 16:44:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 16:44:48 -0800
Message-Id: <20191231004448.3140350-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH V2] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Tue, 31 Dec 2019 00:44:54 -0000
Content-Transfer-Encoding: 8bit

Use PCRE, this enables using posix extended Regexps on cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Document the pcre2 pkgconfig usage

 meta/recipes-core/util-linux/util-linux.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1fa82363b1..179cb3dac5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -106,6 +106,11 @@ EXTRA_OECONF_append_class-target = " --enable-setpriv"
 EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
 EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
 
+# enable pcre2 for native/nativesdk to match host distros
+# this helps to keep same expectations when using the SDK or
+# build host versions during development
+#
+PACKAGECONFIG ?= "pcre2"
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 # inherit manpages requires this to be present, however util-linux does not have 
 # configuration options, and installs manpages always
@@ -117,6 +122,8 @@ PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_s
 PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-python --disable-pylibmount,python3"
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+# PCRE support in hardlink
+PACKAGECONFIG[pcre2] = ",,libpcre2"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
-- 
2.24.1


