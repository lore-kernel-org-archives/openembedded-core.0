Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5E17017D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 12:49:49 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id t189so63011566wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Qz2idaacJ11gH5BancV0sWjEOQ7GWHLAObuRG/Bx77s=;
	b=b1eBC0C3D7H2UI21J4AFsfLhcwe8vjhojwU+6YDz/dZeUt0Ee1vM1kqgCraQysCuBS
	zVgJsdlC2t+/h8MbLSYfwTOy1Vs9fdar6V0ge7WQVnnxnoiecGOKAcDBB8D1l1R9BxTV
	/9/mJT31/rsT5WyBg9ZpndevnD/2+/Rcs5p+LyKURRjQro2rkUQEN1vtf8A5P9ifnhJf
	NPTB2tAJCYuYJ/TNnToXSTu/hyKuo7QwkuYtTVPDkG7YjuM+bbSFadT7jALIgWMz+wHo
	HzG4htCdE4sNEc8z46ai/MK3jLu030lu5RXvoFMSttO5x0KGkHmxDsmvOCZR388FPHzd
	F0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Qz2idaacJ11gH5BancV0sWjEOQ7GWHLAObuRG/Bx77s=;
	b=l0UoRDWAYrqIGrnjRG3Q3tfKRRxHJLz6nHYzVBRT3J33HkxdcvIIgXd/awo7SMJsSC
	ro/oHl80g+/v/UCDfjOqHKGQ0SaUnX0VxBkebQJp/IXZhNyTyEDRXajJyItcEF/ifpiT
	5IzbUMTRnvKqZYUxMJ5Gq1M+1hCB1g9rRJQ2DbF5k6Dk1bZr+va87NMkBVyZSCr6hFBm
	gUiAvkOfxMwX1nIWxQjTs14Ibnj31SBWr0cdj/3xnLVKartxPXcS0LqeG0S5EI+eXmMA
	bNFKgAiiECf4KpKz4dYXM9eCUKzMaDTI+r83nXab9mmQCdbXIglXeo3opgy/QleXdtHC
	KjIQ==
X-Gm-Message-State: AFeK/H3gsu2jZ7JanAR9PR5SLaMsA77a8jxpenJ3ntwDv8E2WsYJujquwB21RzScIVN3wIBK
X-Received: by 10.28.73.196 with SMTP id w187mr13676559wma.5.1489495790188;
	Tue, 14 Mar 2017 05:49:50 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 63sm15333646wmp.9.2017.03.14.05.49.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Mar 2017 05:49:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 12:49:47 +0000
Message-Id: <1489495787-6306-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] openssl: actually apply Use-SHA256-not-MD5-as-default-digest.patch
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
X-List-Received-Date: Tue, 14 Mar 2017 12:49:50 -0000

This patch was added to fix a CVE, but wasn't actually added to SRC_URI:

    CVE: CVE-2004-2761
    The MD5 Message-Digest Algorithm is not collision resistant,
    which makes it easier for context-dependent attackers to
    conduct spoofing attacks, as demonstrated by attacks on the
    use of MD5 in the signature algorithm of an X.509 certificate.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2k.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
index 1973f81..922819b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://configure-musl-target.patch \
             file://parallel.patch \
             file://openssl-util-perlpath.pl-cwd.patch \
+            file://Use-SHA256-not-MD5-as-default-digest.patch \
            "
 SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
 SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
-- 
2.8.1


