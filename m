Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1621DD7361D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:46 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9323.1766114560550402694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOFjVnaK;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1190377b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114560; x=1766719360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnyq+w1u7IWASyKOdZKhQ6M/7AvkW5AKHAiXB2omocc=;
        b=JOFjVnaKcdbStoI/EjfQ4HRvdhIQhF54cf9qOK29QAIiBVJFQ9fX+igwbjXkiErtpS
         gfWbA6NSxr5CrSk0s4KkMlaoBQL895nwxjMIMdzDqjWcnPLQ/3dG1idzbS/6CbfAhwty
         DYdW7AYGH96AHfYsmgsX/+8bWzKDOPdzzt+lJjZ7wMnBorPDVeFsrxtHARVQrh1ZQOin
         s8Sr7od2EqcDxPumIs4nMQKfKdlZqX6F8SlxaggOCqk3JQr3cbP/E7GJyYZeNiTiLjwk
         NsGWmt4fXe69fCjWVcrFV/ejxqM/TEW5qaMsttCC++rLoEro6K32lEDIUP70pwgZfZjf
         TfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114560; x=1766719360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rnyq+w1u7IWASyKOdZKhQ6M/7AvkW5AKHAiXB2omocc=;
        b=gXZo6rF5SunbZ1BMWl4zUnK72qTVkwGILMOY5eR9l4xu1z7MgDOP6i7ZLTbFIeRMZH
         1PvdbXyEZXCVD0ocLTDipJn0f2YX/uCndDLegeblHx/kFsk+U78OV0xVz4ZKpy+dR5Pl
         pS9OJhdb3HpEVJVPPDyni1fPnpFi35c3jl12AV6OGGM7jC3czEev34G9ztBoQZ25bs6A
         IlV2LleTkdXlmeWNfFVmNvakceOd2bmC3G4yI1pmZdiLowB3Ls5gV5y98SfT+tWDmzqw
         YZItEx0j+6MSPWdK2Pz52QMyngGAvlL8ovsGphCHRPJVA/U+Qew8aaFE3hVlMEo1aRSE
         gk/Q==
X-Gm-Message-State: AOJu0YzLT9NEQhlV/FOXmDhejhVJGgpIGAFk/k+6uJ5WoO43225P7twH
	Wa5JzpTfbFR3AjmtC+K8jM4TKmxjCuucVrTFKZmosuE8mHbnjbGa1SyueWkMXA==
X-Gm-Gg: AY/fxX7u6lVpdu83xp1kUGclrJB6MhkpUaPpFJ0o9zdPrc70tmfpRZNVjJ5C/tCJiXt
	26biFqxtI1wsSzYonpCdCgd25pFABxI/g9sKcCOr1EcxaRzfYtM19aIOYwG7+aZReo8FRE9wVjD
	ocFOfI8JeEiQKzRwwb3dJHMZrnabYN6ph/zREwTpxquyW0UHgKj7q2yRWub/eLSvLH5a1IT9445
	hszpx0afKyy9yLWhnu/mVymRoSJi/1vxihW53dlzCBSbwk62JPRJGj91cHcWVVFJczvUFNcQStu
	cHSOcwR4o0zoSB947mttwLZPhMyj46iGN/lOG/4M1JtqHiMht9dLDriENZi19Lb9hICq3dcH8cE
	nNvcqUddcDw5q+pcfrWvLmLyI4f+u2jxHj4cjQgU04F2cfNsmxJYQviwhcj+NZ2jypNWztFFpUb
	CBxwTLB1YsgkpJH6bd4mdUj6cK
X-Google-Smtp-Source: AGHT+IER1jH2BRD6RjDkJcmIuom0CitSuHrLh8rf9NVSWQKeCtLDZOK9dkIC5eKdCHSP3eo2SCO6GQ==
X-Received: by 2002:a05:6a00:600c:b0:7e8:4471:8d9 with SMTP id d2e1a72fcca58-7ff66974f9amr1299388b3a.58.1766114559744;
        Thu, 18 Dec 2025 19:22:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 09/29] gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
Date: Fri, 19 Dec 2025 08:51:48 +0530
Message-ID: <20251219032209.960840-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228177

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit aa9909912ad4734a2a2f6e4fb4e49baebfe7b099)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
index c1d416c2bc..f19979c4b4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9890f262f3b2a9564dcb629e9eb697d77b93d1f71897eda1a8170b7dcfe73294"
+SRC_URI[sha256sum] = "a0ab17dddd4c029ecd7a423c30badd5a3c7599ea42707016d1d57545f5723ccf"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 

