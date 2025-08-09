Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8BECA0EC1
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:44:41 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.7402.1754750675257755813
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=as4ESmgS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31efefd2655so2483674a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754750674; x=1755355474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBvgGtZKPI8w9qMxvi4/MbuWwPXgdgqmJhnut2jZkU4=;
        b=as4ESmgS0I+tthu/amGA8Mul8RHknYMD6lXaSCPa5TInPYDcDFA0r1Gb+l2ZgKgStX
         jQfzvQ3NrmP7x95vx6SSjw9PnkujQrC72ERV5qy1SncQOZJmDoOJEzE3KpNtlVoRTYvd
         +tKoB1C0mw3uBVO7Yu/8DxhOeUPQDQf9BeGI+eYvzto5yX3ADBSljp67PjWXgAPa2++c
         IKvus27Agt5I+zla8qNDRUFW+BXp26nx036jPG8WqeyWoxME8GBK9yGUgAjKBtjyH1Nq
         ta1J6csMygBIwxxAFRe94IZMswIHReWTSKhfG8aWVwdcZ1Zoxc8vsQsF7EFaPzGf/okk
         j0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750674; x=1755355474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBvgGtZKPI8w9qMxvi4/MbuWwPXgdgqmJhnut2jZkU4=;
        b=H4i6bs4QCqktUJwf4odlJG7+n3I7Ey7Nqo0Hu9Hs/HyYEBfVcaR8kXk1OoYb8+rUxC
         1eqWBIMcLqJFZJ8/MF5DWjxvBHX9pwVylSCYkX9ZZLA0eZEkmsAXeuG7F9Sv4NRFWXLY
         S8IAWezWz55nzwV0nFAHKElgnDUsyPYTtAV8hjebqi5Cv7/aZkyTiUgqxeVlSNmM5448
         ls+YtdTnchevfwz154bsxKoHyXJ6XD9CeID8Yg5jEyyHuyOAfd6pi0cnjSBmY9nQumxN
         NtxQOFvblvy2XtyqOxM6hC7Nc9/+mA9yG5Fxl4cHqAJ3ToK1al7o3yUx1yTNTBLbvRrv
         OTdA==
X-Gm-Message-State: AOJu0Yxf7vEzmfSa9LWnCP1Db4tP+fpVBbzu60sa1GLYdGh34v56v3cO
	qUuNLrBVgmLBXtKXAT11mqgDPtv3xcycuqt5VTv7XcK/p4QKejPURuDt+IbP6e1fRjRnYt1DTw8
	hR9L7
X-Gm-Gg: ASbGncvWSiu1szpcZTb1Pv73n2hrRTn8MU5kV/oqIExKBJZUv1QiRgX+LYYKQjbQkwC
	/3PIJ/RDQrmycf6gkETmDjVvTx+8UkRpWvfJbu9oqJIvyyNOl1G6B/I20ZHodYMtwNk+PdtYkrB
	TnA7x0tO8mjitvLVLLuJWt/YGA+Oen6jv09DcdoMAEaWuzS61U8+PMCmljphiYQniSli08UZkWg
	2TpvV1O8UVEYJdtlcr46AtBSgyWxtUrxEUDhCC+pnSPFmYSh76bnnwRS9FD6Yf96V2aAS14G2q4
	Jyknr/LysEFc9U+YKjlwTjB+aEE0yB0WXsvMzht2k/C6VZYq/VTzEp30/o7Om3nKPid6zw4Nw2w
	RHZMM2asuVm4u4qhBao0/yLyj
X-Google-Smtp-Source: AGHT+IEIB2nhfBiVBCrrGDFKkx/UEknsffDAVBfGwjeRSe+nEoZWhrIfKH4oNFOvIOp2eCu0eqMW3g==
X-Received: by 2002:a17:90b:2c90:b0:31e:a8c4:c188 with SMTP id 98e67ed59e1d1-321846522d7mr9542469a91.14.1754750674386;
        Sat, 09 Aug 2025 07:44:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e40b:779f:346e:b2b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b428f4c8639sm5736428a12.43.2025.08.09.07.44.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 5/6] gnutls: upgrade 3.8.9 -> 3.8.10
Date: Sat,  9 Aug 2025 07:44:21 -0700
Message-ID: <26207963abdaeb7767e15c5fdb51b8396c80ab71.1754750560.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754750560.git.steve@sakoman.com>
References: <cover.1754750560.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221680

From: Gyorgy Sarvari <skandigraun@gmail.com>

Skip compress-cert-conf test when running ptests, because it requires
gnutls to be compiled with brotli PACKAGECONFIG, however brotli is not
part of oe-core.

Changelog: https://gitlab.com/gnutls/gnutls/-/blob/master/NEWS

(From OE-Core rev: 2ad41436acdc5f37803ade51c98ae0dc06103e45)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnutls/gnutls/run-ptest                    | 1 +
 .../gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb}                | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-support/gnutls/gnutls/run-ptest
index 17e26eae70..b7827e1358 100644
--- a/meta/recipes-support/gnutls/gnutls/run-ptest
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -37,6 +37,7 @@ is_disallowed() {
 # currently not exported to target.
 
 test_disallowlist=""
+test_disallowlist="${test_disallowlist} compress-cert-conf"
 test_disallowlist="${test_disallowlist} dtls-stress"
 test_disallowlist="${test_disallowlist} handshake-large-cert"
 test_disallowlist="${test_disallowlist} id-on-xmppAddr"
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.9.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.10.bb
index f2b7ac7bb8..600f23683e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed"
+SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.43.0


