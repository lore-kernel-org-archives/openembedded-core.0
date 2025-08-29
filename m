Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDCDCA0FF6
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 03:36:48 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.5166.1756438602022624789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 20:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OxeYdBwz;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77033293ed8so1486987b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756438601; x=1757043401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMOzf4Gp1+Uo/ik1AoEGf6zokQRHn8INPErA92+lELs=;
        b=OxeYdBwzaTAra4xtuVFUKzkhJC0InMSkNVQ/MWRUe0ZH6o7pgvFV3nhJYJ6eYrsymi
         2egoLXqg8B0XhZWEyeIbsTGzPHZd2TcDYZSVZ2REcloUPo2GIFG9fRN7YNS8m+Xzlenm
         JWx9EKedErm+IBq1bm/eTEd/1tgc/LK8IqXXg/inKVT0Y9rZOFQoGvngrq1DT7NZO0et
         WCHj1ie1J/KmH7fq/ZMh2dftvIXte+rthiBfuzE4eFyzKDpdGto1w5tQyEVIpBagsN/X
         6OgpNHye2dEeh23WKD46/pLzLTP+f0voeBm77VRwCntdB8PT8Ip/1E+5pefcGMXZate8
         3SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756438601; x=1757043401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMOzf4Gp1+Uo/ik1AoEGf6zokQRHn8INPErA92+lELs=;
        b=hM2mjbL8l8iADs64qPiOdk99de/UY3JPKUXqoOLXbDFDvDrkNJgWNuICFU1uNNjv3z
         uY1txNp96cIOXX3AcUCNvx9t63X0RvBlBa8UU7O7dsCvjXI6hxBJgmanxQKjPetmwKK4
         ptMt8C9eznu9Il3isHLBuY+eeHax3LBabw6xZfLoOq5tZmhUqUYyDXTYTZCAj9Wx8s3Y
         IzvyGsQQ06i6ZyDhTYHzx2aBqDgHtIm30lLD7/Qh3t/v/iPHSzpwUpNDpoydzh7VvV6U
         iKXNjwiBHtq93Gxpbcz38NCGpnEINoJseOMg0Hmb9kQdyyi5z7pomHNz1PgoqoyzCMhG
         DrxA==
X-Gm-Message-State: AOJu0YxWeHENBcu9ukYovsW+0b9ZRkfxYF8CXPdcd4rGODrRoYK9kL7W
	p0ak9MCsJpH7kDgTSt9oAAZVOxXjb9TOU8D4YFno/KtI46J5OMRuqoMBzAmQ5i6f
X-Gm-Gg: ASbGncsM40hYCzLXdY9G+ORQtqErRGEssrd/M89oDELHfkXmfytN7pQjU/E6fXfNxye
	u9IWz9MRefjagpY7J3eqy0SCjeZKPIXfn7JMHLWhSSV5NPW1POimi9p0zNZtae3qW81qrJiYsaD
	95uFQ5+X0tsfqFtcj252zjguKP5UFJ3tetbpmTx8MsMqFn/wi72q5O7wIqiKRQth/xehqNmH5bc
	DVAGL5Ry4UFvhu1zGPVkKX8Vrt9NnQuZMppjbfe2W1iWScJsBMIFbk6eZ4G0zbbsb4hDO/fmFEj
	ZuD88oElnr/ICtKHr874fVWzyDFjasoScOm39RcFIrr2QRFzgMh6RMzrubmvUWz9NPd6S1XZ0R9
	c1V9SYRfVcdF3KYHbYLu/tWjreQuyGMLZv08EXbGkVOh/gMq4bJ2ip78w46+1p7OLieWKcCPOyI
	ODUthrEsDdWG52Zqf7KtnXZDQmw8XI3V1je2YI4jRu
X-Google-Smtp-Source: AGHT+IEMdBXrGEt1+Jx6Pdno6j4cbdUnr91V+LHhkXZeHv+AcKPo26jIrhTVulll7P5aD4cvdx2dYQ==
X-Received: by 2002:a05:6a21:3393:b0:243:9ae7:f891 with SMTP id adf61e73a8af0-2439ae7fc54mr15156596637.40.1756438600980;
        Thu, 28 Aug 2025 20:36:40 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26abbbsm923763b3a.5.2025.08.28.20.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 20:36:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] boost: upgrade 1.88.0 -> 1.89.0
Date: Thu, 28 Aug 2025 20:36:33 -0700
Message-ID: <20250829033635.115107-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829033635.115107-1-raj.khem@gmail.com>
References: <20250829033635.115107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 03:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222597

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 .../boost/{boost-1.88.0.inc => boost-1.89.0.inc}                | 2 +-
 ...1-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch | 2 +-
 .../boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch    | 2 +-
 meta/recipes-support/boost/{boost_1.88.0.bb => boost_1.89.0.bb} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/boost/{boost-1.88.0.inc => boost-1.89.0.inc} (90%)
 rename meta/recipes-support/boost/{boost_1.88.0.bb => boost_1.89.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.88.0.inc b/meta/recipes-support/boost/boost-1.89.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.88.0.inc
rename to meta/recipes-support/boost/boost-1.89.0.inc
index 96bd986f6a9..ea2827ec14c 100644
--- a/meta/recipes-support/boost/boost-1.88.0.inc
+++ b/meta/recipes-support/boost/boost-1.89.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5b12f7b"
+SRC_URI[sha256sum] = "85a33fa22621b4f314f8e85e1a5e2a9363d22e4f4992925d4bb3bc631b5a0c7a"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 04bede45787..25512d582be 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -16,7 +16,7 @@ diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
 index b7825d4e6..ed7e39baf 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1144,156 +1144,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1143,156 +1143,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
diff --git a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
index db1ee038987..d23cf03b1a1 100644
--- a/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
+++ b/meta/recipes-support/boost/boost/0001-dont-setup-compiler-flags-m32-m64.patch
@@ -16,7 +16,7 @@ diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
 index ed7e39baf..90513f84a 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -377,22 +377,6 @@ local rule compile-link-flags ( * )
+@@ -375,22 +375,6 @@ local rule compile-link-flags ( * )
      compile-link-flags <link>shared/<target-os>$(non-windows) : -fPIC ;
  }
  
diff --git a/meta/recipes-support/boost/boost_1.88.0.bb b/meta/recipes-support/boost/boost_1.89.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.88.0.bb
rename to meta/recipes-support/boost/boost_1.89.0.bb

