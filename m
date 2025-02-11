Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6580C021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:47 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3306.1739304580967068590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=txpeLQ8c;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa0f222530so10950805a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304580; x=1739909380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dy7IkhbKq8b7h0Bgxo9CkO1VA48fSFRioyqH87sqGSs=;
        b=txpeLQ8cx6haLR2aNuLG3KaDXZdGYalZsfd9Mi/+7JLdSvVjqxatljOlJsTxMrvktT
         8XaNjyucxEVxpzu6HtBxIraqQupP36MXGB2gwwGoekFU0wC8w8eDclTbE2NO4dlS7yBs
         nJisMV4kO8esipKc/rONRodkgkIanVIAkvMXtVJOuVLxsbLGGXFflANxs7kZLc41aQxc
         sJX/Rz4Fh4sDAYxBF35pq8ogAd7CsDYhGPPV0WPsvUZkrKeoMhjmpYBPEQxr1NQZNjbb
         dHBc350JvBtxcal28F6qKx3n15O/fLhL/8ANeLku36XD1M/b/M9ZthnJxQNs6Q7k5S0+
         U2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304580; x=1739909380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dy7IkhbKq8b7h0Bgxo9CkO1VA48fSFRioyqH87sqGSs=;
        b=pcufF/gYeN3MXMwaViOtY5Ddyykf3R6Ua6Z+uhZGUnxydCiO91WWv+82Pr69a6WJII
         hQ1ShSIDf5TSG6lB4yFoXhJlgZyhljDBj0AuF4Ne7WnUiwYkuZDFY9x4t1SylsrsGb+G
         5ha9zLEBCuo/UUrXQl+mw/F93fMG6PGu4hgfZs+hMrWlkhKWo/RcBfZBzq0GHsQ3uog+
         3wfP/WPWsOgCDTaqlADAOiR6u3pE1IaTDyPwRLgwmrruH9z+brUBsfKRdR36vi96Ry1f
         06GWIAAvBPykvuhli74PVtLa9/etIDXPDc9RS+02CWwqnP40qx2k21OtmjalzGzHYD6J
         P+9w==
X-Gm-Message-State: AOJu0Ywko5rJjSJr7icx/TiQH+L14pYo4Y71TkuzYyo2PYI3UE3ddm0z
	CmtE2WJVgftxRo9RuPNPhPIOl9FLM3HpVdwniff/rJoptszC3N+ff3hrSFigq4HOHPHTRg6ollz
	N
X-Gm-Gg: ASbGncv5uTIVSRtKPzDOIfvTG5Kq7khqpt7tLsjMfRZVbdfVLvx8tldy4Rt+q7MXVW8
	sFQG9D8BGVDM22XuseG2hkMlkIob3gRceIjP5BF/6f8ZEybSUWRxGQ3yx+v7R7QTuyKgu3DZjg3
	mZTzAUslXibEoxndWpDq+S8QsIkSi17SMIszx5gnYM8XeRA1ikDIsQB931pqHO/n+qT6xZaziRh
	4HCkE2qrawOptzwSc6V5+kLLOXppRpNUrwyo23BrjqaeD7QIpPz/6BPxs/GOWxb7Prm0DhG1ElU
	16Xv
X-Google-Smtp-Source: AGHT+IHnIJ+Om9auCWD84N1eNqeBag+GVOhzx/wPTtLLnmw7dwBqQCD5DFzZLGGWxy9lkdAYONPczA==
X-Received: by 2002:a17:90b:2549:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2fbf5bc1e3dmr673291a91.7.1739304580275;
        Tue, 11 Feb 2025 12:09:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/14] cmake: apply parallel build settings to ptest tasks
Date: Tue, 11 Feb 2025 12:09:11 -0800
Message-ID: <234f64b64e61cff4a27d2533dfc13e0c2a4fc63b.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211181

From: Peter Marko <peter.marko@siemens.com>

ptest compile and install tasks do not have parallel build settings for
cmake. On powerful build machines this can cause overload situations
and oomkills.
Observed when building qtgrpc with ptest generally enabled in distro.

Having this in ptest class is suboptimal, but creating ptest-cmake class
just for these two variables is probably overkill.

(From OE-Core rev: 3c311fbf0c2090268e9b83123d762b05b61b4074)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 3d3781ef33..e8aca0db8b 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -67,6 +67,8 @@ EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 export CMAKE_BUILD_PARALLEL_LEVEL
 CMAKE_BUILD_PARALLEL_LEVEL:task-compile = "${@oe.utils.parallel_make(d, False)}"
 CMAKE_BUILD_PARALLEL_LEVEL:task-install = "${@oe.utils.parallel_make(d, True)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-compile-ptest-base = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-install-ptest-base = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
-- 
2.43.0


