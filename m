Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92A7C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:37:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.197117.1698316653921836386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AopLcT4h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so11053485e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698316652; x=1698921452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Qq2Cqo/jYrlRoYtF/p63XtUeRGfEqcdKCRLihGNTug=;
        b=AopLcT4hiRm/N1IRyTf/9oxbRZm1SQEVQsY24kNyM9810cK82vqLbrUz6yxORqE5Lc
         iAGj3vdEVIM9MsvhgAoppDi2J/qlaAGgogLgOHIfC14B0IprSkpBFEHWlCurXhEYxXK+
         5P5RGww929SXQ3d9QTLgn6zgrFpXI6TAqjLr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316652; x=1698921452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Qq2Cqo/jYrlRoYtF/p63XtUeRGfEqcdKCRLihGNTug=;
        b=c+laIM5uchfm+j7TxNYmSpv2RKoG960D75MIZmTJmQOYdy9M6W+6iUBmrKPMBG/Siy
         yhc+bMsu4m7gHMMYhwhhzXdDlH7zH+EB2UC0MWDPthFHnCJqgQWg10gN2HWGNevcCG98
         hIAo4MbtV1HkOpHt7+F3OC89fCW+dKaSOZ2g/XJUSxUyew564A/5wggzu3H54I7Nlt10
         wQIV4n7vD4zwOi9Fm4PjhMzm5p0W2/Sm15jVEG+oIGbZ/QDiDc3HKg8cF9MumCZ1nOXi
         sMi0Cu08I/Nn0wjRU2UJe+DktoLrIdUwUd+gYV6WOnQ0h0YCr76gomeHmAXJldCDORrw
         NpKA==
X-Gm-Message-State: AOJu0Ywcp9eT0bG+8BlLmKnnrrUjHqGHC47szeXKEs+T18DdFOtx9Q6K
	NplrawlarkdVlXTjAeMWr9tVvuqBfWsn1nXt67Q=
X-Google-Smtp-Source: AGHT+IGMpkb3tVqdDmIE/UcQdbVsLQuTJScM2Jia2aNNZHS4iFqFCW2+SFwvpeam+TKaa3s+/IY98w==
X-Received: by 2002:a05:600c:4f50:b0:405:409e:1fcb with SMTP id m16-20020a05600c4f5000b00405409e1fcbmr2615245wmq.5.1698316651931;
        Thu, 26 Oct 2023 03:37:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id ay32-20020a05600c1e2000b004065daba6casm2185391wmb.46.2023.10.26.03.37.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:37:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: Ensure recipes using mercurial-native have certificates
Date: Thu, 26 Oct 2023 11:37:30 +0100
Message-Id: <20231026103730.1480297-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189709

If you try and fetch using mercurial-native, you see certificate errors since
it is configured to find ones in the sysroot, not the system. Add the missing
dependency so that mercurial recipes using the native tool work.

Found trying to make mirroring for old meta-oe stable branches work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index f57f9cf827a..ac84312a87f 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -634,7 +634,7 @@ python () {
         # Mercurial packages should DEPEND on mercurial-native
         elif uri.scheme == "hg":
             d.appendVar("EXTRANATIVEPATH", ' python3-native ')
-            d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
+            d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot ca-certificates-native:do_populate_sysroot')
 
         # OSC packages should DEPEND on osc-native
         elif uri.scheme == "osc":
-- 
2.39.2


