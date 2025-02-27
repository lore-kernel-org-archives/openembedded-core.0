Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45117C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:33:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9484.1740659581232996494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=esrh8HQg;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2210d92292eso20729505ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659580; x=1741264380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnF2LSkFZJd3VuPsajuyMEBEay/POgWHD40riOWeAoM=;
        b=esrh8HQgBTUBWpY3HBZ8JzsTM3Z7dug49fx5/hJZ5nxzAt8js+wZtt/aVetKanizA6
         khFV4bgq131UAxYxes55/XnbvIKmra0lbeCC8qkvjCtJskmAtaTSWe92aXgAjbaS0w8E
         6A5vW8aMH+HHTm/WL6VknrUbSlQdsLcxcDXM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659580; x=1741264380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnF2LSkFZJd3VuPsajuyMEBEay/POgWHD40riOWeAoM=;
        b=U4lgcnH2Mgkz3LP58FKXA5AZHzW3B65TjRl6xbqSjf/WJtoK534FviZApTlyTalNw1
         tTe4l4T6wB7SOMxAY4vuELXYxttcRcRazjqsdQG3zT0rMKJ7YVY75QhUUcpANt6oR62O
         +GdxGqzHbvuiaFqi3j2aMK01a9akVo8w9P98R+babRU3vbnRuIIpksNBFffe5zm9Kpfp
         +7PeDR+u19mavHPRQcOusbwhVAcTOByUvzj7S2Oa2SOrGFX/jNlJTWx0fPZkhSQ7+XLf
         bi3p5yV4xRMZpIlR6WiVg/4H9dW8ZmdLpok2cLpcpnAhs+T2TdQdvGjTFc70OIQ/RDZl
         VcsQ==
X-Gm-Message-State: AOJu0Yx3LRiXOXp5xkQfeBhikju7MEyvKLeCLzSzjlcLiFvg7XjH22F/
	r4w8xQ39KzTWM5GJkZiBI6i31bg+5zagkJqdogazS83DfMWrj1cFMoRkp8vCAEUiPKLUdI94Yqi
	LI9M=
X-Gm-Gg: ASbGncsZgu395YiRScAWjsaRsiW/pRGzT2ljyDlTECjjOGpcdHAd41VMCXaoxXocHlR
	uiVukt0jQTgghm3syKChNQyra5wStjIBWGRWC1eR+E2AiCXWme7ZhiTimnDIhE0ujXxEb0QtXYz
	ktkdvMCsbgZYzfSpMRfyyVwsAPokR/3+bzjHTKEyAXv0jFk9Jhc0xXrR4C2vUXV4RYNUk+HoZQ0
	rr2MCnm0ZkE7K+ZW5Z/VLiZOzGVyNCnDxTvs655AvCg/n0Zadz13QrcPNbcQvjXjfNaHjqwSqk4
	2I7OLy5dfZ9qLKIatP56hzZ1IWZ2qtHjHbA=
X-Google-Smtp-Source: AGHT+IHJ4/XRypuTE5hhDSXqzj61OFO7d1UYg3aE+PRUSYF+acY2csrmne7cYFlk2HI2eJuqJ+uTug==
X-Received: by 2002:a17:903:186:b0:223:5c33:56b4 with SMTP id d9443c01a7336-2235c3358edmr16288095ad.20.1740659579937;
        Thu, 27 Feb 2025 04:32:59 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:59 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 9/9] bind: Upgrade 9.18.28 -> 9.18.33
Date: Thu, 27 Feb 2025 18:02:07 +0530
Message-Id: <20250227123207.270978-9-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123207.270978-1-vanusuri@mvista.com>
References: <20250227123207.270978-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212000

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fixes for CVE-2024-12705 CVE-2024-11187 and other bug
fixes

Release Notes:
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-33
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-32
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-31
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-30
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-29

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../bind/{bind_9.18.28.bb => bind_9.18.33.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.28.bb => bind_9.18.33.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.28.bb b/meta/recipes-connectivity/bind/bind_9.18.33.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.28.bb
rename to meta/recipes-connectivity/bind/bind_9.18.33.bb
index 67628a8650..ceea149699 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.28.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.33.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
+SRC_URI[sha256sum] = "fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


