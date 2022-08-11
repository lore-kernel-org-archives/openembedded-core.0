Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03976C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 14:28:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7091.1660228097286714215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OE8Gbbf2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j7so21583327wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=8Y7hfn4xSsvnkkUrH6FeviVoaxtDRJl8r1oyMqlxfW8=;
        b=OE8Gbbf2riJaP4pChpDfICXC5snvmUaIW/HRRT/bQFT/IBCv4HRjHyPOvBbKh2jMsY
         CCEiuLqRZY28cLaO5sp5ylQi4we9I+agwXn66sjfmOkAXHADa/iJJU93HYufrGyxXCW4
         htUfgptTHfhCnGNLe1/CWdNf7R1PoQqwSCon4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=8Y7hfn4xSsvnkkUrH6FeviVoaxtDRJl8r1oyMqlxfW8=;
        b=GXYjXqrntx5O4s7wrZkgfjzAghyR9K2USRSyb0933iF0z95Oc9WLlANggoNGIxwKuv
         g463M8gydJrp52gPx8mRU57j9BN9XDm6mPJap+h3u6hvpKxkPW0/jQubBzSd8+yKSJ8m
         TneJ9zYlnWDhwduA2KmpGd71yFZHm459ZiibKzASbMrQPbYcbkPY6wSQY6ZS2GFl9wUD
         7wNfMUYnA+SMpSLfDFHfxwUKBSpL5N30xGfcLu54Ay9sCt4majeRNxNZblyEkSSJA6GJ
         M3HuwJOYzjzLWkkBytVJMPAJsMg4pB3p53X/QDi6T+o64LYhsmWpaAIQXuav0tbshq/U
         ws+Q==
X-Gm-Message-State: ACgBeo3kTVv5G3yFNoAew0fWMyAvFs/7jozmtbKKOWdBgS27wgigYIYR
	/n1OGGPS0xDh3O02x6Rho0Rd0lXqgAHSgA==
X-Google-Smtp-Source: 
 AA6agR7sn4q3YDwFWbyGYumD8yUDUJ9FKSBdP+lkARpg5kdM7E4Dxnx//Z1utXX55ENsLcpxZzrO0g==
X-Received: by 2002:a05:6000:c3:b0:21e:e081:4cc4 with SMTP id
 q3-20020a05600000c300b0021ee0814cc4mr19707185wrx.93.1660228095354;
        Thu, 11 Aug 2022 07:28:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 17-20020a05600c26d100b003a2f2bb72d5sm7367178wmv.45.2022.08.11.07.28.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 07:28:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] perf: Fix reproducibility issues with 5.19 onwards
Date: Thu, 11 Aug 2022 15:28:11 +0100
Message-Id: <20220811142812.651737-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811142812.651737-1-richard.purdie@linuxfoundation.org>
References: <20220811142812.651737-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 14:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169245

In 5.19 onwards the build process changed and encoded full build paths
into the output. Adapt the code to look more like our setuptools class
calls. This seems to work ok with older kernels too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 95e7eae9fee..95b4362958b 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -203,7 +203,7 @@ do_configure:prepend () {
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/Makefile.perf
-        sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
+        sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(PYTHON_SITEPACKAGES_DIR)' --root='\$(DESTDIR)',g" \
             ${S}/tools/perf/Makefile.perf
         # backport https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
         sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC) $(arch_errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \
-- 
2.34.1


