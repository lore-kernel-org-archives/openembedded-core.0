Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975EDD6D236
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:59:12 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.80586.1732737548651363071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zrw7lWff;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2128383b86eso593595ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 11:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737548; x=1733342348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF2uGsGMOUadHoG3HTDFPl9W3TZuViS91e4qkLTwOo8=;
        b=Zrw7lWffm0VStiYkiGEN/Q0LxupF5VslFELIuqhsJ7GJwXrjWHwuVU4VPgIR4ww5sc
         H/IjVV6jSULq4mq0rzUp0n3RtV9/OCAKrbRiJc+IvSvMH8oO6Bnk+J5/6+Mm6WiD5v2q
         w8gm2hh0xw2+UZnoNd2A2HmnzkCK8qaqAh4GAhF3lUgkmx4UJ+JlGoUxXWG0cf5/ByHk
         PbYn3mSCWLUTXzJ2yEcvWhxlwSlMgtYOg3i5MBomjmgKS+agsH73jomiftQ8m6X+HiG7
         5Vmn9Lg5rfoXZJtIjLyZuTjAZwVva5XBOw66RHL+bfQGB+tgEY1KGBjRJV8cJJNG1d0/
         L2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737548; x=1733342348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fF2uGsGMOUadHoG3HTDFPl9W3TZuViS91e4qkLTwOo8=;
        b=lKZlQ8dHvE0GKG5QpCZ5VosrNJZoGJY1ebjexT6BJcWSRp6SLJ1Rppk4/4cqSZuOqP
         XBBWxwyomAS0m+PCR4lKHxAHJ6MsSOdzlzAAR747BWfcwRZ3YmPeV4c4Yo1xcVfCLY+X
         cpjjVNUyJmpsFtpkh2KQil6dB9RNstvImbFU3d+Tn3HfUAza65u+/wDBQ1WT9krxOyAi
         UyzXgJrnSmdfzm6XrpDLIhKHP1fCeFHr45qjMNVAOxqsX9GlirGSe5CSuIPQZ2Sc5c+7
         MahQP0uNQidg81vHVwClXsIl7+tyoJNMRLreffLO+CiZ+YH523e0MA+/EY/RWSsjqFSX
         GPfA==
X-Gm-Message-State: AOJu0YxWVCxuOGBqH5pWEYNgbGLkOsRuOfkQNiTiLG9eYN/jNLzAui16
	Cw7gRJdh49wdppSML7BTRCY5z5gyoI5uTB9xLDNPa6x/HyMRtQmN67txOZrp
X-Gm-Gg: ASbGncttivIMrY1StR5qN0aHEinMUscYX6uq8OEJe1H3K5A25Y7aEzD+nqNenJtuk8j
	4CdIZ+ykEZitLL0wZoyeMQUbpv6gBMcf9mXtJSHn+sUX9U4DjBfGATZEK5kSgbGawGnZGowW9Vb
	jCqUZNzTW/JR4JDppOHnY6lBNXEQ7pvr9cN+m0CjnotHax1/P0KPjYnYUjur+CsMH3dGjeWLqPf
	Q8nt3edPBlioAB7vEFv8Pr+HeVJSjbKJeDeLCWgVHYV9m8oHf4C
X-Google-Smtp-Source: AGHT+IE/dJ1Va08iALTpypyDsVIFbUseMFx40Zu63XHsJlko0q4e9JsoAF+6Dw+8pLpwmMKYgD5HBA==
X-Received: by 2002:a17:902:db03:b0:211:ef94:7a92 with SMTP id d9443c01a7336-21501d58398mr41347025ad.55.1732737547786;
        Wed, 27 Nov 2024 11:59:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4338])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba5a7esm106958465ad.83.2024.11.27.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:59:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] weston-init: Make weston user member of seat group
Date: Wed, 27 Nov 2024 11:59:04 -0800
Message-ID: <20241127195904.91647-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241127195904.91647-1-raj.khem@gmail.com>
References: <20241127195904.91647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 19:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207962

This enables weston launch to access the seatd socket
/run/seatd.sock to communicate properly to acquire seat

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Create seat group as well

 meta/recipes-graphics/wayland/weston-init.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 3de697ec34e..5723655a9bb 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -102,6 +102,5 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,wayland weston"
-GROUPADD_PARAM:${PN} = "-r wayland; -r render"
-
+USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,seat,wayland weston"
+GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r seat"

