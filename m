Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FDEC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 17:39:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.18645.1737740372684312118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 09:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NWPdEJu7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f796586so25368565e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737740371; x=1738345171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jphgwZiLrzAJKehpB3JlKkQgayT1lCVBRU1GkbjPuk=;
        b=NWPdEJu7mO/wT8dzFlmF2CZXsVOGkO5XCXzjNYkS0DLxFCv1v2AmT1hEs+HdlYzkvo
         0VXFGFCCz3ARpzL3UnOmKwGDAMUDxHwR5vyrXQ1W6BCUjHZ9yxbMfgATggVw7L85wDCP
         5OuHn8bvDpnh46RwdW/ebrOyhSOK9MnfBvb7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737740371; x=1738345171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jphgwZiLrzAJKehpB3JlKkQgayT1lCVBRU1GkbjPuk=;
        b=dlhRW+mWsDYQFn4NuVcmbkmpOiswMr2hojoFdRV5uX0s1newjsKbhEdfiYXfMwPg9F
         1ubgkcXB53Lmgg77pDD8eKbsh7WFKE72yhCbJgVvs7YPaLjTPBbQTB2NCjCTgdTC5n/0
         W3ztexd1aS2V013LX2wMFPIN+HU19sTuBohNO9PRstUjBMA67JgGKCi1nbYsK0d4uJ6N
         PqdP7HkNbCfIhiNUEoPr1MnYADpXbJOwex0xqeV2Os+ucuWLdsaqU4re50O91zerajqA
         7p0ZnkvU1o5Epmz+pnsypBUvuph0wvsEJDX2e1NjO0vSkbD61RgHO03ERroV2O42lvI/
         mgDw==
X-Gm-Message-State: AOJu0YwPiWYi4gbUw12x5WpflB+dQ6Y7L3Hypd8c3FzZZljHEAjCFuoj
	3CMygt3Oick9WVPnRpffk3hNRmHQfxqu/CCppE88Z7+0vLsziD3vSC1yCzq4byxmwLdqvXR7Te9
	pQ8g=
X-Gm-Gg: ASbGncucyd2RFnKB7WenunEigQRjegTBtancI22KJ/Jc5rPo/nm8vPt1VmPEPChKejl
	JqqknxGTPL0/zAOMhtKpV/fErA0f+1eN+fEsEU3uhM/lkQSSSHeoFzpnAyUberkKL+oNsuefapd
	Bo8rcbMGAVbm3RNtM+3+o2oQgnvG/G8/FRn54UvtifxSXRncpBuOv/JHLnc9koJ3GIYdfOAzvmn
	wTfwTROAn+z/FRSajUcevyjjAc08HSgadI3enBdbXmWm6Ck5Jb6Tl7YB9eAPiHxF34NX0S4SMUG
	MWH0C+tIEGZSIKiUW6wZY5VrppxTQBp1aw==
X-Google-Smtp-Source: AGHT+IHE7xfkzARN3JBT6AhSNToZXBqTEWv2kEWaUPFCDStmV+6rLrwup+w70WIXyLkoKbTY64gbKg==
X-Received: by 2002:a05:600c:1554:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-4389143b41fmr290366615e9.23.1737740370782;
        Fri, 24 Jan 2025 09:39:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6369:e73e:59c4:8223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd5732edsm33123235e9.36.2025.01.24.09.39.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 09:39:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] bitbake.conf: Handle empty BB_CURRENT_MC
Date: Fri, 24 Jan 2025 17:39:26 +0000
Message-ID: <20250124173926.2369699-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250124173926.2369699-1-richard.purdie@linuxfoundation.org>
References: <20250124173926.2369699-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 17:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210244

Bitbake is about to change the default value of this from "default" to "". The
original reason for this was to make this kind of include file usage easier.
Instead we were going to complicate bitbake code having to map one value into
the other.

Instead, stop using "default" and put a slightly horrible bit of code in bitbake.conf
as an alternative.

This means a "default.conf" in the multiconfig directory will stop working but this
was never something anyone was expected to use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8878a54a5a8..19bd7ecc7bb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,7 +830,7 @@ OE_FRAGMENTS_PREFIX ?= "conf/fragments"
 OE_FRAGMENTS_METADATA_VARS ?= "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FRAGMENT_DESCRIPTION"
 addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADATA_VARS
 
-require conf/multiconfig/${BB_CURRENT_MC}.conf
+require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURRENT_MC}" != "" else ""}
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
 require conf/cve-check-map.conf

