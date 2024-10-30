Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A32D6B6BA
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 18:18:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.22290.1730312275082684021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 11:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DpudURI4;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d447de11dso135567f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 11:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730312273; x=1730917073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1yA9Iayk5EKnr0T0YNxdPSOTdVcqRvROnwGpcih800=;
        b=DpudURI4CadzbnRkTNWfkIlgHzxcXJ2AJPE+MEaaEnqvVNvkw5wj/f8pKJDlnbf29u
         1NZnsqM+rxgwqolwarhz62Jkwti5NDbm4SsHPlUCddoKFbt+ACv7zkUmfgG7RgnpHXAB
         6oVL13EnQzNTHZvaOb80WBer9/Opnz1OYfjPt/Ds3uZo258CaTDMIexMDnsAtp2gPLO5
         BUVXvYHAGOu9RxlwiA6pYHx6dcpZfRG1ccP+Un/iAYZ1szRRY3iAQPXtkZgQnKc0oEhX
         0A9pix2Ph6hFYDxlqYSiUiznrHolFiCnkAiHvkiO3um6YIOAQWxF6O11LvLYlV1fbAcz
         QNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730312273; x=1730917073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1yA9Iayk5EKnr0T0YNxdPSOTdVcqRvROnwGpcih800=;
        b=kFfFLaUMQCUaL7+vOd4PiqGD5tTU+uN/ry9qj4/A6N4WRHWbmd7MFSMjnOXFyI3MGo
         vl3MNmnCVm6bPeJjLKFHevkzBRtbqV2BsYj6F8HWdpv2FwmAhZS6xa6SixNhkQN95HjL
         /xIQFCvlmXYNReq+f34tM4sIAH7D2622Kz2Q6y8ErIW5SI+nZDu5dgYRZLwXBMDVJDvu
         m4OA9KZ53lxlMH2DIXLAxkoLdpcKLuLo5+4xcxpL3dnAyJ6fOHoJ8b6cG+9TSoaexnwP
         Uy65WZTig5NLdVeRx/j+ma2DVDUIHVlmXjY4B8Clc1ASitbFAd2a3YbLz/drWfSaeIXy
         ej2g==
X-Gm-Message-State: AOJu0YxxEPmIQI0bD4g0HEJ03+d0rvd2ERkfePmEf+aOLxNY7hbCubEr
	fRW4FgwDIA3ad5LaN2VIz2tCBsMRq9fsxAnooL6V1kdpix8GmhHcy8/9gTC5aQk=
X-Google-Smtp-Source: AGHT+IE8EiBahRl8LSOLJk7FuOwhiwQ2YtXD3FwkhX7TDp2ZQskHDVCF2fhjdKrvw0QYQpo49gbwyA==
X-Received: by 2002:a05:6000:400e:b0:37d:4e03:635c with SMTP id ffacd0b85a97d-381be7c8142mr481548f8f.21.1730312273113;
        Wed, 30 Oct 2024 11:17:53 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b46bffsm15917718f8f.46.2024.10.30.11.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:17:51 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 2/2] go-runtime: fixme: buildpaths
Date: Wed, 30 Oct 2024 18:17:25 +0000
Message-ID: <20241030181725.214754-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030181725.214754-1-jose.quaresma@foundries.io>
References: <20241030181725.214754-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 18:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206557

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/go-runtime_1.23.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-runtime_1.23.0.bb b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
index 63464a1501..a9a4e2a044 100644
--- a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
@@ -1,3 +1,4 @@
 require go-${PV}.inc
 require go-runtime.inc
 
+INSANE_SKIP:${PN} += "buildpaths"
-- 
2.47.0


