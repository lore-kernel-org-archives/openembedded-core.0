Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ABD10706F1
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 18:02:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14775.1773511322987558750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 11:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hb0Nupqd;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48534237460so35723375e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 11:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773511321; x=1774116121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0Wk57qeLQFX51DpqSq9eIbftnDbh6OUeG2ga4SHVJk=;
        b=Hb0NupqdfJDRR+3Xf61e1WvsDAir01dunQypCGkqPh2PtKAleCSHzDDNRZF75CVKH2
         IeB5BVWxlvhcx4DaobLoJwCsLgCx+pDORGwdECYWGCz5E8+yWhqslDFsQF+qA6Oh+wkO
         kp1XoTQdap5XnMmsUkBksgVNiAa1/u36cNeyfzC+lkr8c9eQbi+96EXrFFcbo936qADO
         NDuCMa8oWPtQgwZBDOwOag5NYP0pWE9ePkJsDEyC62J9sLm68y/rcZyZ3JcHWR6KS135
         1UI7JJEYBPvZWpE63aE5kBpzE3QTFprXey7rfaxjrZXWdkmdbnRrIKL1WDowKaso+B2W
         qc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773511321; x=1774116121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0Wk57qeLQFX51DpqSq9eIbftnDbh6OUeG2ga4SHVJk=;
        b=D1iENNGEgJMFUBOPJ9BgWBgRQugcs6WPgayMcR2XYhga3pgkgpWOWAmNVPXY6Y/bL5
         q79tXP6aLWyP/fVKjzMJx95ukFbOWXuvXYzBA5wbxICypuwVaA3k2KIRb3Kzg5MWKoBo
         Mf0xfQqAbkxIAvK3y9wr0s4k3xCsw6xWj1rHqzro3cJfTXAfChqKl3XmdgzUIK1poYVb
         wdfrFOTkWCs8vI2PN1r9Rsx1X68DnSgCAQx+8Cm1f+kHSRBrVan3b5JmjURcgMcH70Pr
         t4J/Qn9XHgttfpB5mXbEW/RqI519EFBUDxVJopvuF43lXFRYs5UWkepVa1Diflt8cO5S
         CzKA==
X-Gm-Message-State: AOJu0Yypnc3WgKJ1T9JcoGQ3HaiEjB2oc7vr4aan4e09MWWeYgnWdKUH
	LQBi8HXK8tNQW+CDdbAhvUDrO/ZFyogzHvT0l29gujKWHY+uygVaS4+0tQI4DA==
X-Gm-Gg: ATEYQzwkL4oLNAq7g/ACg014tm8jJ3aZj4+3oXNyu4IY1D+oTTNcSAW//Lks/ZwpAmJ
	xKJzQuIRRNTKa+s0MEMj1qqGeCKsfpcfTlVhwt0KKCCdPo76HcMI/MkSvL4ZJv1F+cyAI6mlV65
	G+Dpeopoe2/Se4ZSVgdkvDUimXU31vG55XPFzTnLctY1q24fONbfi8aklWHkVmEFo7FHB7sksSN
	6YrbdSonKP6sJrFemAva5rgOovxHz3Me+ivorcNTKhgSfnI4T4Ttdvg3E7D/dovGOUGGsB94i7h
	VkvwtpX7YIVARS/+hA9TTlzW3foojOU/kbfh7wXtjRPWxx/AQ0COa8qQD3VRL1B15ITM8/uIzGd
	mXbkR25TxwtGekguCh/sOnBJEGnnotAdldCP7Wb3gnt1DaQHfBNAqQSnV2y6x+w7aC5e7ajemHC
	+VKvmeJfjO+ujz8mPTPkojt70RcEJiA6rgv/ufIA+ZkSwPBDRtf3wrwAlZNMn1MGHNWf8aWx82X
	jO/CXyWVz/ZfWpCCw==
X-Received: by 2002:a05:600c:3552:b0:485:46fd:100a with SMTP id 5b1f17b1804b1-4855670299dmr120244585e9.25.1773511321275;
        Sat, 14 Mar 2026 11:02:01 -0700 (PDT)
Received: from acert-swift3.. (178-221-163-183.dynamic.isp.telekom.rs. [178.221.163.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66e3f8sm285902825e9.14.2026.03.14.11.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 11:01:59 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [whinlatter][PATCH] scripts/install-buildtools: Update to 5.3.2
Date: Sat, 14 Mar 2026 19:01:51 +0100
Message-ID: <20260314180151.43501-3-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314180151.43501-1-aleksandar.nikolic22@pm.me>
References: <20260314180151.43501-1-aleksandar.nikolic22@pm.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 18:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233095

Update to the 5.3.2 release of the 5.3 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c3f257ff93..b9c008a2ec 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.1'
-DEFAULT_INSTALLER_VERSION = '5.3.1'
+DEFAULT_RELEASE = 'yocto-5.3.2'
+DEFAULT_INSTALLER_VERSION = '5.3.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


