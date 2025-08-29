Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFADCA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 18:55:50 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.2940.1756493744310309218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 11:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XmyDHidm;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so1232253b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756493743; x=1757098543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9TuJpfM/AzRNKX3oYkHEIdqz3qR2XOAExFqjQNBf2A=;
        b=XmyDHidmlkCxGNLY0kpTRqErYf2tuy/fmebmRB1li5AQqlEFeUnLBhi3tjxv4wHi+S
         iNFpftwODPjjQ+23d0mtdl45kueUZYVAzSvGQG6nbHUAyCUH6E3hxM6IUBGrbHONeo3Q
         wp76/14o63sQ2ZX5H/8UNA2gf/Kfb8T39+jP/UR2bijiZgvTWINxtSvlPxX+KX0+YzYj
         a/jsfjLnZ4aOnPaVRlWVpvLA/NScDSQxfW0G5F4FQyeal/lp+cjJtEKyYw3eZxf+AjYI
         ctRgcTSqdUBzycANHGHgm586SzSiPp260q50a+xRuNUCYjTUgg2MRIW18y4VFu1ny3aI
         RYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493743; x=1757098543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9TuJpfM/AzRNKX3oYkHEIdqz3qR2XOAExFqjQNBf2A=;
        b=luL4Aw/gRc5f3iPuN5OpO8yuNDTUpmTotVLOBgnec0TzUTiIiaWmVDZ3uOZ3qnI6u4
         lsS6UD5FK7gavBco56p1OEnuSAnvtBRIlburz9gmr4j0GHYNmAagWKWm9c7hvu2JOK8X
         q8g9HVgNzvm7bdxQsMOFbRypinPZ4K+AqdcahLUUF3Jf9XKNNL9wZo2+EM+M+CU4eDQS
         yjdmFbx2ZMRvhS9+lIGWbUrPY7p0paG1EZo7H6j8kgXNw5LVr6hyNphLSQLP8f4SXif0
         4Wdcaf7gBZ0OmJLms0+BwllBf/GtbbFDk3v3FlWGo/Mz08DAR6wnjIdXdBwVLO5lcOLW
         cj6Q==
X-Gm-Message-State: AOJu0YxxisXZOaWl9CE/dzh9KI0DM8w85pokweBd5mKWwUM3RriLkBMC
	j/c+2eMk1F7tRnwKPNvVFe9/x1J4S/t7XDbaOX4EdQv22ohlZ6YoRrSNXW0561Z/
X-Gm-Gg: ASbGncsNpUKSdgFlUbPthMDAfuzc7glsjp7jlf4+g0U5Fameidm43lEmYPEHUK68teE
	7JlMUsMjCcWSIglMpGMQwbv1iQ5qUnWJOt1hLVQymeTdEGt4IS3+M6sd3Cc2rZWkenMNEtOLpN3
	U1ohZxAeqNdsj7DFzmMSc6gg0IpVI7zoEeChb8tMNdsHf1962/U0Z/cr7JfeCb9DiRLpH2VBisu
	DL907ZNN3FGM2L09UkYzeNrGMY5hTF6P+HSCyWGNPyVjxEPEWChgJM863zDMjKT30h9IyFj2T0Q
	9JPIsJkD/Ib9ee9wkIzM487+2LtBXW/mVIviHEP9WYvMzu4FP80ouTpv8oOTl4u4YkikpGNdQwg
	lebR7aC6/TkvvQxJhl7sZHndeSWW3wWviU43WbWo908imCFmEgC/+9u2mTDFak9QlkmxF/3L7hI
	PxCuO4vlwke37XyLl45ZNwgpalMGez9SuFS4IvdkFuNds+mYbFpkk=
X-Google-Smtp-Source: AGHT+IG89z7Fq26j4KTlcQdLQwMRIj9z0dftxXCOyMLivMjtmP7J3HmCyPZBr3e76Qefm6mPjNjV6Q==
X-Received: by 2002:a05:6a20:9191:b0:243:c16b:3f87 with SMTP id adf61e73a8af0-243c16b5f84mr6282316637.29.1756493743285;
        Fri, 29 Aug 2025 11:55:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26ac0esm3049863b3a.2.2025.08.29.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 11:55:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/3] boost: upgrade 1.88.0 -> 1.89.0
Date: Fri, 29 Aug 2025 11:55:36 -0700
Message-ID: <20250829185539.3379514-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829185539.3379514-1-raj.khem@gmail.com>
References: <20250829185539.3379514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 18:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222622

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased
v3: No change

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

