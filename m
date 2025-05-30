Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52864C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.457.1748640142707067832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lqa6S47d;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23539a1a421so7990745ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640142; x=1749244942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HM5iCE6m0Xd8GXfGMi4z6ZnO1cJhuVHBJu8gBoCpFA=;
        b=lqa6S47dFA6Kgm3Qmk+lDsPy6qJperYJ3otUiNX/c4ybIovEYltteVFHQjv5bjiwe4
         SDbquvuL1p0XPz7+ipP9ttdCURaoi/LtAbNbGhMp1LnBncmATHjnOiUfGTz0+6dUXWH6
         8AgHBSGzNQGUvr8vjLlr2ypobKU51SpVVC3loYNnsQYiBSp5iFVGvidFLJXHl9cAtilw
         q1vSVKkyz3e1ZZS1A2gmtg74FzczpNLyj2CMmJ54tIB7Et9+Ne0Fa6ipuNYVbgPJSzub
         wGSW3uk3cbvguMzMkmj9GF9cPTXl2HGDb+nsAxStm4DG+m4JnhJ+HG2WYfhlkswwn2pY
         Xtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640142; x=1749244942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HM5iCE6m0Xd8GXfGMi4z6ZnO1cJhuVHBJu8gBoCpFA=;
        b=LAe3ioqKWv27ZIlBf1EmJpOAL348jUmX0cWNqtPxLYmSIjKs5ur/NS0GWUdIiVGD0K
         fn2pOTSH/72Ocgi0k8ogisZVy+4ZaH+D9zLJcrEEKELonpZhoTKkFwZOVLGJTuKKb0vj
         Bpi0gqgCddcbPP0UErQICwRi7PtMFiIA8zcC9PfSrtwV2twt/nhCfiiw43+gMeWN4gNg
         AV3ad1wjqUeparLDTiZiWNU4ZsTJQFbW0KEEvJIBLtaBZQzJ8u5rVhe0Tdj4I3z0/H6K
         RHdmjzDS6MgpAj8fTkL1gBVIKonGzUMa1ypEWbvERwZQdb9x2yY7sMR+oHaEQULyfX8a
         BlaA==
X-Gm-Message-State: AOJu0YxnHRymtZMoqWqL8FnBDbHCpJxdJmt091QJdHMytd+EOVQK3Opn
	r/kWgxgdfsKzNOgFVTRMRNCeTmn/HJX98kkNK9Z98sSOXqtSIuzw6N7Em3QOelWKV+Qxpoe+7Ql
	uVYMF
X-Gm-Gg: ASbGncv3QjiAa6Sf6gqIO6/zLcFDC6+p9p+jsPdTXuc3BCY8fQ1LOvnv+e7Z6PBFm/s
	R3AHc3Zjml+vIQP8t3YwlNBPbRiiw1NdPFTBG1o0dVVeLYpZuwpQhkrZfvxJPLb2uK4/7Sm7RP0
	5iqw6rpzZ7D3gC3XuCx40+0UiY4K8GTnb+26hI/5KdyfKpdvjrpgfp+ubO+bChFjKIgl8tvSri5
	/s0VTrBKpHMe/VtViRTs7sBwX8lOzvq5NGZ5P+v8HRKBxC1goKwg0y+VZH9nb6LuZlC40lOlRtP
	Ymn+Lth0bPzVjbQLsrINd+p7us7hlZkCibnnLVjyoYLELUVzTbKvtg==
X-Google-Smtp-Source: AGHT+IGewfNCGMCFrIGhDfSgxqSl/E+zE3FD8JppIrSk6iFZk6nEC97lLoIu+o3cGtV1ZtSYbBH+zA==
X-Received: by 2002:a17:902:e801:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23529a076dcmr72064415ad.43.1748640141936;
        Fri, 30 May 2025 14:22:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/14] linux-yocto/6.6: fix beaglebone ethernet
Date: Fri, 30 May 2025 14:21:55 -0700
Message-ID: <2cfbfa009094edb1445418598231c5ad2c20a507.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217543

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Colin Foster
    Email: colin.foster@in-advantage.com
    Subject: ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    Date: Fri, 31 May 2024 13:38:17 -0500

    Prior to commit df16c1c51d81 ("net: phy: mdio_device: Reset device only
    when necessary") MDIO reset deasserts were performed twice during boot.
    Now that the second deassert is no longer performed, device probe
    failures happen due to the change in timing with the following error
    message:

    SMSC LAN8710/LAN8720: probe of 4a101000.mdio:00 failed with error -5

    Restore the original effective timing, which resolves the probe
    failures.

    Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
    Link: https://lore.kernel.org/r/20240531183817.2698445-1-colin.foster@in-advantage.com
    Signed-off-by: Kevin Hilman <khilman@baylibre.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c3f2c35b1f..e0006035fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0588a366e1193d9ac23855c4a3c2c784d5ca512b"
+SRCREV_machine ?= "4c94a7140a0416421cd82fe18703e99d7c4eec8e"
 SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ae0316dade..8c0617be10 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "93714069321a8e2f7d01f51038cc1d9afd64a57b"
+SRCREV_machine ?= "50111c8145a573a5eb34859736492d3914d74f26"
 SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 55304a1929..061837ec88 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "00f5a7d26256a6c96f4c624ed2fcc2915baf69ed"
-SRCREV_machine:qemuarm64 ?= "44c07335c9354d22e1059b773cc5acc6d5997acb"
-SRCREV_machine:qemuloongarch64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemumips ?= "6f7f7ea73242088f08c504a73144e7c3649548f8"
-SRCREV_machine:qemuppc ?= "af203c26b7349967003580d373f7bb4e32b53c5a"
-SRCREV_machine:qemuriscv64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemuriscv32 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemux86 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemux86-64 ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
-SRCREV_machine:qemumips64 ?= "98b3401fbd220385715648e6bea870482419e7c1"
-SRCREV_machine ?= "aa6b73545c4594842542c8943dce67fe397e91cc"
+SRCREV_machine:qemuarm ?= "c7fc26b463b6d492177ab4f3133ac709f72959e6"
+SRCREV_machine:qemuarm64 ?= "a2123abde1b536e17d6f8b41c07006b1b78fc14e"
+SRCREV_machine:qemuloongarch64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemumips ?= "441ff4147581f8866ccb145ee1fcecb418543a46"
+SRCREV_machine:qemuppc ?= "c186535e4a16fe6524c963f40744f56d56cc37ae"
+SRCREV_machine:qemuriscv64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemuriscv32 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemux86 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemux86-64 ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
+SRCREV_machine:qemumips64 ?= "ef983636bee26dd17055fbff877a6ca4cd10e4ed"
+SRCREV_machine ?= "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
 SRCREV_meta ?= "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.43.0


