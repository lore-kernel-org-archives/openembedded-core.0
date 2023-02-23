Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83667C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 17:56:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.17971.1677174997693715068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 09:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bB0Ry2C2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j2so11175543wrh.9
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 09:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmlXYEqwq6Jt3gXDU8X+PKMsrGB8MHSjV0aOlzCq82c=;
        b=bB0Ry2C2exr9A3+jg0Vq79slsMVRxWjp0xeGExZzjeNw6JJz36evskE5tGJGuJMRs3
         8nR/s2ybF8IWHh8IoAIP/JwnzOC8dp9zF8TrfmrQLGcFJ/btUu985upBPWkcl38JR7oL
         LfyNiStwMGiJDKKY/Crn5Hs00kgONLWAL0G0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmlXYEqwq6Jt3gXDU8X+PKMsrGB8MHSjV0aOlzCq82c=;
        b=FuCCV2uq5UUwEqly8awWuyRhLFzrXIJ4FveHS1QcN9UD6+MoZUIT0x2V3LZogLFN0u
         L5rimH06ZAzpnvRknAtYb4gDRn6vZZ2I2gVC0dyDC7/sW1tE5tUBGtElWEcaDcfPNRd8
         n4RUAj9fca52EonMRpWx0sQZOqCfm+U9durfWXapv+mPTopgM1uvFLVJ71m0qUHztEGU
         gIl0IVt75OKSKeThrD3Mv/Ds0Y3G7dOTgVDvKTaZieMSAEYlsBRddwcNhOAkU3hl9JWh
         hixK0gnlhzgtoATHi3aLyZVwcV4S7IRA3u1nc8V0B3DFwMvnxsEOlQMqMfjWbj1Pag+7
         nUnQ==
X-Gm-Message-State: AO0yUKV60rZJZUo0dHhNhcyq53mY7ytmVxGxtGosVwncC4NWYRWiZav9
	UYz5WAblgLCuhLBXmwlTqu6/go5M4yuB4Lrc
X-Google-Smtp-Source: AK7set/xfblme6vdmtN6SYNwoi2Au/GABO9qkQzV4C9OHFxqYazgD73uxb9Qe2mFrVXmtjrM9cEdAw==
X-Received: by 2002:adf:f50f:0:b0:2c5:7eb5:9797 with SMTP id q15-20020adff50f000000b002c57eb59797mr10855558wro.8.1677174995501;
        Thu, 23 Feb 2023 09:56:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b127:77d0:f034:5d8a])
        by smtp.gmail.com with ESMTPSA id t26-20020a05600c2f9a00b003eae73f0fc1sm43413wmn.18.2023.02.23.09.56.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 09:56:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] binutils: Fix nativesdk ld.so search
Date: Thu, 23 Feb 2023 17:56:34 +0000
Message-Id: <20230223175634.1073050-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 17:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177618

Currently binutils in buildtools is searching for /etc/etc/ld.so.conf
which makes no sense. ld_sysconfdir already contains /etc so we need to
drop the /etc from the fixed string.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...3-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 8e5e2be81dd..54967b9362f 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -65,7 +65,7 @@ index eff6693e052..95787012b89 100644
        info.path = NULL;
        info.len = info.alloc = 0;
 -      tmppath = concat (ld_sysroot, prefix, "/etc/ld.so.conf",
-+      tmppath = concat (ld_sysconfdir, "/etc/ld.so.conf",
++      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
  			(const char *) NULL);
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
-- 
2.37.2


