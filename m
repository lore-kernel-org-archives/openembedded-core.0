Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405B2C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.20184.1637901382190017132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HHIHYpYM;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id y7so5913825plp.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6vJuPRVeBMyGsGaG6HjVmDqv5w5KRsuJmj2SF0AAl1Q=;
        b=HHIHYpYMDmwlyOIA5TXNK2ajErxVNqUFh8hIJW3ICAA6vUbmOJaHvrDsca55grQs65
         gFmJrAPX3b1xoSz/rbw76nwjKL6Zw8+j0R0dyTtwdMi62N75341AXJbAKB4c9C7VI6a9
         IybQO7qTWLubYnPPq2/n4pvnOq+J8u84uxRtCQolKObYl40IKN7ejr2fAIyS7/CSkQOr
         6kAg8XZq0VCs6JgVx/UPgxLjWhJdKC8LDPE+Ub1i7yz0oS2Mr1O55L/colfJ3BqsiDbv
         Ow8kEXKA5b/EABHOsoyD25eWti6Auo6vgJinm5xiTdpRNxmTxa9JOKBq2UY0mJpfq22h
         fd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6vJuPRVeBMyGsGaG6HjVmDqv5w5KRsuJmj2SF0AAl1Q=;
        b=paC27F3Rz7enuQwAIisan/4GnQqhqt46mOdrSUwwZUa1Y4/Jc1MXTPrFkri7x3Hcwx
         YQXHDDq5/CUTsMfwA3TIcvP7BTFgvuK1IQMFmJGH93EeYvMQC5THya2/y3Ktm2HyWIkR
         n7mfuSiIF6J16DLOB3ub61i5VA7HK25xtiDiH3EvfXM2KLuBR+pCGwm1OTUgYOJzf2xB
         6KPOdXqxcBEbyedslF4NFyYtBeLayqocv0XHuXXGeqkkqLroaVT+Jot6Zd3pm67rkgaT
         gXcCJ5/8QZJ3DMPUrnTx2Qa71Iz1yr7YF9ImQRaxtlaSM97+77N3aXwVIvYErOoabuTa
         sceg==
X-Gm-Message-State: AOAM531tIBeMTvE+Dkv2vCt1MfUTMBmrTxGP2mHzjPmn5Xl82aiqtgOJ
	EhS9Ank4Y3IitBkvJgK5se1wVuwIpu8=
X-Google-Smtp-Source: 
 ABdhPJxBotb5B5tHGAuO2ZYtmSh7FwZx0CSzOHnpZQBrlScJm8s3bUydlNCK6yVSWvKvakQ3OLs1jg==
X-Received: by 2002:a17:90a:98f:: with SMTP id
 15mr12616922pjo.166.1637901381509;
        Thu, 25 Nov 2021 20:36:21 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 09/26] systemtap: use setuptools-base not distutils
Date: Thu, 25 Nov 2021 20:35:48 -0800
Message-Id: 
 <4c0de0b46c78230ac31a5079360b2439f2ba6e43.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158805

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index d11d9b93a2d..04f7e03ab50 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
 PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,python3-setuptools-native"
 
 inherit autotools gettext pkgconfig systemd
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
 
 # exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
-- 
2.30.2


