Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E489C49EA1
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 17:59:12 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.24085.1722362344132944435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 10:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=A2hbQ05v;
 spf=pass (domain: mvista.com, ip: 209.85.210.54, mailfrom: asharma@mvista.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7093997dffdso1508980a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722362343; x=1722967143; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRqs9Nk8IYQwqVgdbSzC3yvkAjVpY9gce/QvNQFqcH0=;
        b=A2hbQ05vU9yiVGUjgVUCcN11pDtTCU7E9KS4upoutCwzYE01DSYYlGHNRB/hwaodnK
         vRc587bSRax2tyZDo32OfBcyJ5xa8UnacxBCiakzJR4go3cReXxWrvA2RRn5OWBzDndS
         GGWWB6f+Gbkv+iIupNF+Q2MJhLYsjpB8wkedo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722362343; x=1722967143;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRqs9Nk8IYQwqVgdbSzC3yvkAjVpY9gce/QvNQFqcH0=;
        b=v+aBJqpEJv8t8c6p7lGceObbIufN5b35jWBfZUgchnlUii0/QW0qTSpy6DGpyDLvUc
         pcP/2/Xe70V+DLBEf1cnfsYUdKrNvvU4hsjeIKq1+sL4CXqqWaojnYm5K+WnQd5ULT2j
         Lu/9Lw55WU4flt/Bli8594hOZP0K+CBM2WphkA4wzekCCOQytFNjuwGMKwLG8zp/NTlV
         SG7+tAK8/6jkWwnh61532mXuVisw4y06uXLziq8yALmHAqNBsUGnkIdUt6zOJKPu61fW
         vusy14Z8bgsm+8ExbtQm9RTHTAR5iHdNUReFcIuh2ddmdDA1r/FZ3RXG9Nha1aRz4VZR
         /7Ug==
X-Gm-Message-State: AOJu0YyvLabJDTtHg3ACnU9pFJOyw8xsCDYg8P87kpihT1yU01bGN+7g
	VQ+jtUAvwlT892AEcIAfQndL8JFED0LD219ZKTaxkvvqE42yd/ZZwrb1ob5vhW0yhT2CGfzUaCl
	l
X-Google-Smtp-Source: AGHT+IG2h3cmDZ7U8opBO2HZZ6jfueCYTsBsxekD9prPbiaV51KEal4K7wh6qMU3Assb/WGE0eyY3A==
X-Received: by 2002:a05:6871:520f:b0:261:13b6:16ce with SMTP id 586e51a60fabf-267d4d0185bmr14200920fac.1.1722362343023;
        Tue, 30 Jul 2024 10:59:03 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c30:2930:4c22:347d:8445:7c05])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ad01e3552esm5907390a12.3.2024.07.30.10.59.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 10:59:02 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 30 Jul 2024 23:28:57 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][master][PATCH] bind: Upgrade 9.18.27 -> 9.18.28
Date: Tue, 30 Jul 2024 23:28:56 +0530
Message-Id: <20240730175856.23008-1-asharma@mvista.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 17:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202681

Includes security fixes for:
			CVE-2024-1975
			CVE-2024-1737
			CVE-2024-0760
			CVE-2024-4076

Changelog:
=========
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/CHANGES

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../bind/{bind_9.18.27.bb => bind_9.18.28.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.27.bb => bind_9.18.28.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.27.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.27.bb
rename to meta/recipes-connectivity/bind/bind_9.18.28.bb
index 98b8bb5513..3c8ccdb89a 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.27.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "ea3f3d8cfa2f6ae78c8722751d008f54bc17a3aed2be3f7399eb7bf5f4cda8f1"
+SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.17.1


