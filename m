Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A38FCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 02:50:21 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.12106.1756349416336006232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 19:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MgMcANWH;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so436407b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 19:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756349415; x=1756954215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5l5kHd1XxTV8uo2dbTTui6SWtStY32zzDNKQnFFpZKM=;
        b=MgMcANWHnA+igMwrpc1abrJorSyOpggNTiiUKFYfwmzcooqurSUsWFI3272xvygV2C
         do/2v6Hs0TgJy5L0E/jWvdinU95OfK6ufigbL/Hc90yZHc9nLCuw16OeEoZKkabV8OfD
         wpFlUkTyOm2tVlmSE2sgIloivrDJ/MjfYEGJXa8yPIgRs8vmvV25qXgVW8LDHqKWbUWd
         Ac5ropGj9y5FxA7eZ5c8MSHQr5AmPR7R0tzNkRqcQJ5MOrD6IdUc7+UXqhuDDVHVxVyE
         dTe2+/8jEgE5/ayhj9iH/89H3HxEcF/wkGWvySihUDydfWulEfTDHO331HNa+O7rQMHh
         6YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349415; x=1756954215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5l5kHd1XxTV8uo2dbTTui6SWtStY32zzDNKQnFFpZKM=;
        b=ARpzBwasabKwwBgOvXFWFCAiuxD3keiZpXqggPFBC9ZwCCm1B9cAvfhOU8dIiLFO0a
         n2i3qxCeSgNLe3y/eGpLN/bCaBliBgrGscaxc66kT5mpfbHU3ZnlCsevgaDmjqCrwcAG
         eMbBA8UtOALvCRq/Wdkyj7DhrSFS5HuD0xvMxwFtZewf1kNGVqmR7d8FcN5BSgiXhmLs
         11/QOhuWJdi/1L+JwvE8ZMKbW+ye7MulO7YByDYF/nIGCi1Ir5s229bvGAH8Zc/z2Ka6
         pTkjbKCE+tP/WGZ6aabBKzmf9vzsnhv7o0Jab6KmphNQa7eYr7Uya3JyO7tRiT7l3Jc+
         Bc6w==
X-Gm-Message-State: AOJu0YyDoqfPMKnZ9keNZ4CDWJsu/Tl572m2LGujgsY9sejCZvd3lwOS
	2LozrG8pMMbVzKSYcOJjCg6SG92Lg/FBJSeaVsGQP5teyt/0Sl4TAStszlFQ/NG8
X-Gm-Gg: ASbGncv9NV+oH1QHoSOad8UgwLUAsUjTad/MbNa42kK0hUVqzj74jhqfPXbCj0FNEE6
	YVyqm5N72cRYiB8VlWclTnvI8OB1/qbE0I42bKjfh15jpEyfTQ6auSHltdNlFmarDRm9Rsro0Ub
	2ebUjF6v2nYptPJIJsAGz7nu8KtmKIpMVuS8XqxU/PtEtQmHSgbBAkX1G93K78tCIkiq76VYAlG
	FdRtS/dsMsYsvBUbsRLfb5hBppkomveM8iJdgWmrGVajkvmRUEnp8WXrTSHnX112NprR9lPtLHM
	dLngWtp1hhwQCOAwfruIwS+dLLHLxMutInifUjyH100L3GiyJ11kb2sqUajrwqaCJ7JlQKv+E+0
	pPpevPRL19Jp1D5KBw4gteNfsek9yMkU1mh+Cy6y+GAhXtEfJGYPfM4NhtyGI8aQocnXgeIbaa3
	zlCT3PkB06tGXlVGa4UWdX/KwHekR1kz7YsUqpwLd1
X-Google-Smtp-Source: AGHT+IFnHLOdpgwIoToMHBRZVYUzvtUWWflspNdd9PpcaqSzIHpTSDPRFNrPKGApUA3dtzI3h9BcxA==
X-Received: by 2002:a05:6a00:bd92:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-771fc2942e2mr8761441b3a.11.1756349415259;
        Wed, 27 Aug 2025 19:50:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771e93ec735sm8864750b3a.42.2025.08.27.19.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:50:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] kea: Upgrade to 2.6.4 release
Date: Wed, 27 Aug 2025 19:50:11 -0700
Message-ID: <20250828025011.3741710-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 02:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222543

The following bug fixes have been implemented since the previous stable
release, version 2.6.3:

1. **Syslog logging fix**: We corrected an issue in logging
configuration when parsing "syslog:<facility name>" [#3921, #3992].

2. **Fix for misconfigured global reservations**: Earlier Kea versions
could crash when handling misconfigured global reservations. The problem
is now fixed [#3910, #3911, #4001].

3. **Recent Sphinx support**: Support for recent versions of Sphinx, a
tool used to generate documentation, was added. This allows Kea
documentation and packages to be built on recent systems, while
maintaining compatibility with older versions. This fix was tested with
Sphinx 1.8.4 on Debian 10, 8.1.3 on Fedora 42, and 8.2.3 on ArchLinux
[#3800].

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/kea/{kea_2.6.3.bb => kea_2.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_2.6.3.bb => kea_2.6.4.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/kea_2.6.3.bb b/meta/recipes-connectivity/kea/kea_2.6.4.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_2.6.3.bb
rename to meta/recipes-connectivity/kea/kea_2.6.4.bb
index 1df91e45225..aa725ee4374 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.3.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.4.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-make-kea-environment-available-to-lfc.patch \
            "
-SRC_URI[sha256sum] = "00241a5955ffd3d215a2c098c4527f9d7f4b203188b276f9a36250dd3d9dd612"
+SRC_URI[sha256sum] = "6806405e4d559abc10febd2c273dc6e2bc6ac42767afa5ca20b118ffba84a671"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 

