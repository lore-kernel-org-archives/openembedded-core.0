Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26EBCA100B
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:22:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.5860.1756880555512581399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kcv03bP/;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-248d5074ff7so4528475ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 23:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756880555; x=1757485355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rubw35jNCwO+fXXtrQKVWVE3FpVoiEyqmwZjnB4e3aM=;
        b=Kcv03bP/PJca7zY3dESkVzG/Qez0t8JOOrAu92TlKIKSIOOE8PZLBCXpJZSJZqheM+
         xjuuSuPegtJlqgWWenC5TXBi8wAnt/xVSXT6syi/aTl3fhvHYuFLbY4qnust26yd5Ojo
         4Q6hzfSyp1e0MwZknBpGTFgZMbPRG6QM6p+IBShgtU3shQeYOEec3AkBH9cPLgeUbS/T
         4cV5/Rah/3JLInnYGdPr6UEUO57LH1LoxeL1NYY6unbkUyQIVdOn3MXB+57uabqkARZZ
         +Gj9h7HQkVLXHH61ICl72kVlT67NIRlnDmqMhf62We+CtpRLoEkkefR0e1wT5146m1FG
         Jmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756880555; x=1757485355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rubw35jNCwO+fXXtrQKVWVE3FpVoiEyqmwZjnB4e3aM=;
        b=Kh0O71l0bBj6AxIAEvQU/K6yphTznLYEqcUEsbimcGFWmQJKvaNyDxhHwcvZLMurs7
         3ne+sz1PojMQyxGplIaDCm6RL6+4ViI9MUk0Qi4GCbHrRHcR3PARrS/p7OkGCCKBNjIY
         TzULEH5TvDD+JZ7obPZnPLLLCR+NT7C8CL+pwMnJiKqCXXnElypnY8pAwTUxQhZaI33u
         3vkLPIcB4bw4fHVKGLxByPE/Xnu5DYBDtFhKgkLyCUu2DEmorNAQd8C690XAMWg2fCty
         0baaP3yA/iQxn7A31UIeQPEeX+Tquqz4yBelqtvEKSJgcqrJeoqYxaqW8CYN7ReBkF1Z
         0spA==
X-Gm-Message-State: AOJu0YxvktgwDwLC7KCsJUWpxrGnkHu59l0PjS83dbu2x/XS1muOVOjr
	L8V/OGX0aCIHUVsD8bnbFBs0rSSz41RUsFj6aqiE45fagDm+OpPdlpjJntbQTJLM
X-Gm-Gg: ASbGncsXUDLNAyddV8psL0G2lKYQhCjs464wEoFRnAnb6PxvjAwmTlj4CdrU1cKNb0f
	rauBblwd0k5So3wsxZGB4KE6OEtsyUb9e3l/WYvPbSowJLfTp+ta6QguWHLa+khMRPkxMhRkDEF
	MZi8iPVy5yIHBFSLuvU2gxSXRgwUVhYlWeRVu+gbOkEYWXzzcIpx//chnT1t17RSpXp7DSz7JKR
	bVa7whA/hUEzrPhI/bUs97oi/0c2OVcVEnB2p/kLPQdfA4wbBeS8IG3Mjtg1OABenVVG6ZiCRDM
	nQEC339UIbNYZYLjCJATLBeWKjtn5vPU8FEZFo24iZG3favQxoJVCzyKnFxvf7hgWb2ZMajICLg
	YGoPU8Use2+rNZkcdtyJRGG55ypKFd0KgQByxZQoZx2wfEVqPRjkHDlZI2IabSsoUzI8qOebRWD
	ghzX9YQAInIgSnars7uz21rJ5Vml9Zz6K/VMg2Fz5g
X-Google-Smtp-Source: AGHT+IF3bCwhceq/GCQ4/OsQiSJiQtFDK+7Hjr44QvGa/OS0FhM0fCWcCXuk9O/9hmwq+HvewohtHw==
X-Received: by 2002:a17:903:3207:b0:248:ac4d:239a with SMTP id d9443c01a7336-24944ac24eamr129835045ad.18.1756880554442;
        Tue, 02 Sep 2025 23:22:34 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da2a05sm147564915ad.72.2025.09.02.23.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:22:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 2/3] boost: upgrade 1.88.0 -> 1.89.0
Date: Tue,  2 Sep 2025 23:22:29 -0700
Message-ID: <20250903062230.3959250-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903062230.3959250-1-raj.khem@gmail.com>
References: <20250903062230.3959250-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222844

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog: https://www.boost.org/releases/1.89.0/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased
v3: No change
v4: No change

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

