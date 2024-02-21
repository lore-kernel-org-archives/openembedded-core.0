Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C970C5478B
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.464.1708544450443263429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jz415+th;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33d6bd39470so506680f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544449; x=1709149249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8tfzimZjDkoqv1DWfEruJTtwJF+/ErC9UenZzjdzZk=;
        b=jz415+th13kLqVCgEf1xGlGbSLT4V69OjVKmg16WW226sSVXj+uPiU8v3Ji3drVSy3
         dGuMCcbC0UeYbhIrWC+qKpMsW88gHthqSYwTU3e70WiIv7tNsLhoKqAymPUpL1aW9DUr
         zlc3RdTDCXKcBLkDmjgg0vjx37krdOEp+rhhCry+ZBlaHRFha422xTKJQBNOzoSBmt3y
         lgwNRM/vpsU9i/z4PHd8O5XYB2Du0mpZgA+eXmYRRiLVtCZ5zaT/VLZ5ySU4wwVtk015
         Rg5yzydUnBAb9G4NhVYF+0/k5ay0o+tOmyvkou/uT2wp2Xr0fgTzYO26e0TmHSkeU6+2
         cT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544449; x=1709149249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8tfzimZjDkoqv1DWfEruJTtwJF+/ErC9UenZzjdzZk=;
        b=SHeZRB1FcetLWAOe9KRfNV4ZMoaETX6pvoV55LZDJ3XZHsF2mG2eXrTwJJ5VnEcZN4
         F7jGGbM7hOqSKNrxsWw8MrIypGDgB4DXcaaFFgrzP1kDCNAQP2QWUnOBOiB4oSkJgVLJ
         WXFEK/G+iMxgBGb/gZCIfHadrDPPPpdPDBmX2NGsRIgt5alWFuET9io8HVv0M3jebsd0
         euB1NwQyds3CGBDIiUQApC7bvWX6Hucah+gBBzh5oYc/BbgA3/fQKTBLJZm3CRkn2dKm
         tRS0hnlrq5+Eq25341vx1cYQnFI49sPQvIqvNQQoTXbZYGgnSMX/sQuug4H0/9xcjrPb
         2OJg==
X-Gm-Message-State: AOJu0Yxa6EPqsAl8PimGvM6gsoi4ZYKfsF5JaSJ3GQAsE38TtGNHXtkZ
	UxJypofz3jno4RK5CO12Ok24orl6Z+ksScaqTWjHbhbo2WBfqAX9rIZGb+pY
X-Google-Smtp-Source: AGHT+IEC8fH73CE6GS5CASxRVPHaofL+VWOBl9J9PHN1ia/MMeCQzMyWCaAfoJ+8hjOjQ0/HTuVqDw==
X-Received: by 2002:a5d:630c:0:b0:33d:6ac0:bf0c with SMTP id i12-20020a5d630c000000b0033d6ac0bf0cmr3901892wru.48.1708544448675;
        Wed, 21 Feb 2024 11:40:48 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:48 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 10/13] feature-microblaze-versions.inc: python 3.12 regex
Date: Wed, 21 Feb 2024 20:37:02 +0100
Message-ID: <20240221194036.1804463-11-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195994

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

feature-microblaze-versions.inc#

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 662f52f1713c9f070550fc0c874eb62312218ea4

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../machine/include/microblaze/feature-microblaze-versions.inc  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 5c37f49abb..658e87b8cd 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -16,7 +16,7 @@ def microblaze_current_version(d, gcc = False):
     # find the current version, and convert it to major/minor integers
     version = None
     for t in (d.getVar("TUNE_FEATURES") or "").split():
-        m = re.search("^v(\d+)\.(\d+)", t)
+        m = re.search(r"^v(\d+)\.(\d+)", t)
         if m:
             version = int(m.group(1)), int(m.group(2))
             break
-- 
2.43.1


