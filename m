Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918FFC531DB
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 12:22:25 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.82771.1723206140828227337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 05:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SiH5DPCH;
 spf=pass (domain: baylibre.com, ip: 209.85.219.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso1667717276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723206140; x=1723810940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wgb9OCtcuxvERYLRr2N8r6KvRLi/1HvVyZC5oQjebAA=;
        b=SiH5DPCHMt9DGtad6abNalEObnSZ/dyvtEL4o1CnQZW+D+Xc6/N0KNkpFam9baukvm
         ZGl2VfDcWG0BZ8tc4MPAiQjVYpcLfZ/y6xvr+sDJrsoaK733xJGEfgPPzyb8ndxtnZxN
         m6ibnO+A3qgEwB8p0nh080m2BHmx+3KLCr0ib6v6t1snZkMOeCtCj9qo8MJtGEjhwwp+
         hrcO47jhKSRYB20L0UaK4u/ToT+icuTVJ2kPQ7sfFXFbG895DFSOydKo5ua729RNgSXQ
         UFwFOU//LLgRqcU5TbYUvkkwXu3J8qYo/z0iD8kPEzJ7jIHW75TT8uvBRWDZFVxaFbdk
         zhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206140; x=1723810940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wgb9OCtcuxvERYLRr2N8r6KvRLi/1HvVyZC5oQjebAA=;
        b=nF6kx/fvsC91mxJhqSz45pH53oTlc0nrOD3qQFujTv7chICU/PwpZj+X7djNS08V+9
         ezQKKaXXFBi75m5WeOdlfGxoSESK64mIziaemt/ghCOBqMoSzvjzTAtZa5VHRJHNvfN6
         XtbfeAFMV11Vss6Vq9wLF71I2OtMlU7Lu298TEVOJddu5IwN94u1RHSEMPKRl1eFgCzx
         tmOdaPTBEGZZMxVMnOQ3yBtrHptNi8C6kuIqaD/UcPy/n+wrC6hNSusu4iGbu5eKQnDu
         w9/a74+sZzz2X0u1QepAmBHoNM1kkflnM8mC1L/Yn4Qm3WT6xCh2wq/mb8pn8QlD5LaU
         Nysg==
X-Gm-Message-State: AOJu0YwDdBKuzAWpWkvAZap8tOuLKU4uWOHtkzHGEDQ/ea0m/YymNBvJ
	K7/LG05jiIYkzVSWPzj+rEg3fsKwPSohdwfviU9GMRWYGYpyZOPgcVS93QF4VRyqL6HHSLMaYmW
	u
X-Google-Smtp-Source: AGHT+IETpvha3J1eUiqsxL2RYayWIcvK55GSQYUA3fX1tpuQY6T/2i5LCfbtp3D1xJUStAyrJJi7Fg==
X-Received: by 2002:a05:6902:2313:b0:e0b:b83e:7c59 with SMTP id 3f1490d57ef6-e0eb9a6f442mr1448813276.53.1723206139828;
        Fri, 09 Aug 2024 05:22:19 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c87183bfsm21059361cf.37.2024.08.09.05.22.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:22:19 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] python3-setuptools: upgrade 71.1.0 -> 72.1.0
Date: Fri,  9 Aug 2024 08:22:16 -0400
Message-Id: <20240809122217.3825274-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809122217.3825274-1-tgamblin@baylibre.com>
References: <20240809122217.3825274-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 12:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203169

Changelog (https://github.com/pypa/setuptools/blob/main/NEWS.rst#v7210):

Features
  - Restore the tests command and deprecate access to the module. (#4519) (#4520)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-setuptools_71.1.0.bb => python3-setuptools_72.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_71.1.0.bb => python3-setuptools_72.1.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_71.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_71.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
index 9503c36bb6..945d443aff 100644
--- a/meta/recipes-devtools/python/python3-setuptools_71.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "032d42ee9fb536e33087fb66cac5f840eb9391ed05637b3f2a76a7c8fb477936"
+SRC_URI[sha256sum] = "8d243eff56d095e5817f796ede6ae32941278f542e0f941867cc05ae52b162ec"
 
 DEPENDS += "python3"
 
-- 
2.39.2


