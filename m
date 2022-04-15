Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF82C6787C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.6303.1650022682391013289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BT7f0T9r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id x3so4794430wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EvVWYRSHrFd7dC0TwLv1KjvOT/q+Ynfty/5KKjlb4NQ=;
        b=BT7f0T9rB0Bu0t/bCmYzRHCENA2L1tCCyxVF9oDn9ZFRGLm1622NWnmy6SvfUXHiAI
         Sj3jQ2rdsMV3HulUVKg/Oa3MIqZ9EvIOvV86CMo1emO3RoCOzYv90dQVGH8n7M8OmvRd
         aow5IEOlH0Z4M+YCT1nDgHxCt+77Lu5eB1Yzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EvVWYRSHrFd7dC0TwLv1KjvOT/q+Ynfty/5KKjlb4NQ=;
        b=8JU0tSKU/gRzagy/9AhoRQ/L5bcDz/V5k/rUqRCy7nL2YNhOT6Bw9kXidNFUwxzWG8
         HmoK5o0lIlO6BGAIwNoQkcpisfyy75ZN14tR5B+vI46/jqV6VIqb4RMxZ3exG1+HIDMZ
         tO58LI/hBRZqHqKhAWR0psi4Bqkof2UfkVa7x63Um85BB/GbMUO2PFqFbmFz8mbLeXN7
         5kXt8bu2Pi9I616RRs3Yu7aHKpstbkm1oHCq3LP9KH/0/APcV6cWu9e7QBtQIn7yboGS
         7cn9QF5x3hjgKm7HyROnSbVABqbu4ZIvLrRDbwZyAA/mo5OQ41yq8HkpVSPWDupQqRJ7
         htGg==
X-Gm-Message-State: AOAM532GtJ016A/kkgMUtbfnksmMTMJ3D6Q+FIIH9sncaht57Wmkw6W2
	R1WfFEQ6fP1mQwhwMjP01Qrm53BJFPfU5w==
X-Google-Smtp-Source: 
 ABdhPJxQ+GPV0AMHsfjAYHVum5bzxHWaNo/a+pnMtc+MFb5pJjfFNY3V/3os8JhVlRqRKtcUXl+EXA==
X-Received: by 2002:a1c:ed18:0:b0:37e:7a1d:a507 with SMTP id
 l24-20020a1ced18000000b0037e7a1da507mr2960946wmh.187.1650022680193;
        Fri, 15 Apr 2022 04:38:00 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:11b3:ac79:b941:ad48])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a0560001acd00b002078e242847sm3776574wry.97.2022.04.15.04.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:37:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] alsa-tools: Ensure we install correctly
Date: Fri, 15 Apr 2022 12:37:55 +0100
Message-Id: <20220415113758.2290861-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164423

With the fix for #8621, cleandirs is now applied to autotools_do_install
and this results in a lot of the install targets to be removed. Ensure
cleandirs isn't set for autotools_do_install.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
index b0832f93c11..56acc84559d 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
@@ -71,6 +71,7 @@ python do_compile() {
 }
 
 python do_install() {
+    d.delVarFlag("autotools_do_install", "cleandirs")
     for subdir in d.getVar("PACKAGECONFIG").split():
         subdir = subdir.replace("--", "/")
         bb.note("Installing %s" % subdir)
-- 
2.32.0


