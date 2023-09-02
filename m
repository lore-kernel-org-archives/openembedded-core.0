Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F5FCA0FF8
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 07:14:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.4169.1693638843027529344
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 00:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cni5oFXq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-401b0d97850so27892195e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693638841; x=1694243641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdlVDULMbPG0jtNv12/N4arr9x+O5dspVIUJPtLad2c=;
        b=cni5oFXqvb06ISIYH1/sz7FV+IbM85PPWDhlz+m0Rcc3MqLkSqST9e3woLAg9pSRSB
         EfbxDpzdWyvintvCmfUV13Iy9TAHHMyHbbtNOH1kn9nP5K1lLiI6G1C2FfRsvOq8t6ms
         HhDNtUHsXKhHN5WF8Q2Qh3cAbZa5t91hRHk/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693638841; x=1694243641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdlVDULMbPG0jtNv12/N4arr9x+O5dspVIUJPtLad2c=;
        b=C1QCkFgRLZzCkkCZPJMLT4mP3qTQIZF32dDL3FQotEEJq0L2NGlFh47hOKlbiV5lYF
         obrZSqAOK80MWdeGwarcMbezWaqJwhQXDc9CxLxNc+q2okxR3KNmnT1XFdMzJRGoNUTr
         7lZBpulmOGTdmAQ+dNXRMbuhBkd9uGp3PTb9PRtjJvSTxT60iRkW/t0Lb1ds/44aDH3/
         Cf/M9UW51Ok/tPRGgmNqC2mvcyHJfVyqcLk7jTwP9NsCxMxugltGqgvKGJGuO54I8sAC
         P/Osf1HB9Cpy3WOv7aQSwa4iDl6FFWDh5mEBm5auWOknM/Xx4V+yd+hSxdSMKhHPwaHP
         W3qQ==
X-Gm-Message-State: AOJu0YxpvfxXssj93T8vxRcDy5A22dVe739nfWdUlNANfhatEXuvgwhs
	bSIIndFe3cMjNavR8TT8Ov9wdZDn20w5t6qey0g=
X-Google-Smtp-Source: AGHT+IHgUZf4Dj27wpqPILUy6x0dt3hFJHw7wnwS2WxqQtcEXPP8wvxkdqqYaTZ93bZLO6oto9ykrg==
X-Received: by 2002:a05:600c:364c:b0:401:b0f2:88b4 with SMTP id y12-20020a05600c364c00b00401b0f288b4mr3188604wmq.26.1693638840815;
        Sat, 02 Sep 2023 00:14:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bb30:48fe:2031:d024])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b0031c7682607asm7501861wrs.111.2023.09.02.00.14.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 00:14:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] DOCS-WIP: Add some notes about WORKDIR name and SRCPV changes
Date: Sat,  2 Sep 2023 08:13:58 +0100
Message-Id: <20230902071358.2409016-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230902071358.2409016-1-richard.purdie@linuxfoundation.org>
References: <20230902071358.2409016-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 07:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187023

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 DOCS-WIP | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/DOCS-WIP b/DOCS-WIP
index 0e2baf9e0bf..0286d50a059 100644
--- a/DOCS-WIP
+++ b/DOCS-WIP
@@ -2,3 +2,22 @@ This file is intended to note docs changes that are being made by commits so
 that people working on the documentation know that changes are needed. This
 includes entries that would make sense for the migration guide or release notes.
 
+The path names in WORKDIR have been simplified to remove PE and PR and just use PV. This change
+also applies to the path to stamp files via STAMP.
+
+Changes have been made to the way source control versions are handled in PV. Instead
+of being injected into PV, these are now injected via PKGV at package generation time.
+This further simplifies directory names using PV and means the resolution of revsisions
+can be more controled and predictable at the bitbake level. Previously, PV could be
+expanded at any point during parsing, the expansion point is now much more predicatable.
+
+The code now only injects the revsision information to PKGV, if ends with a "+"
+character, which was our standard convention for this. As such, SRCPV is no longer
+needed/used and is now simply empty. The variable can be removed from PV.
+
+One change of behaviour is that for git SRC_URI entries, invalid revisions that could never
+be a sha will be assumed to be tags and a resolution will be attempted during parsing. This
+will trigger parsing errors. Recipes should raise SkipRecipe rather than set dummy invalid
+revisions.
+
+
-- 
2.39.2


