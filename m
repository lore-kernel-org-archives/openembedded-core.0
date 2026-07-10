Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD77BC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 06:57:32 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7251.1783666648613022500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 23:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H6zqsCZa;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so5227055ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783666648; x=1784271448; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=868Xi56BT/vFfLdmyA7Rv71aBwx1Mq2lDwVlu6Jy91c=;
        b=H6zqsCZaWj7ICB4/3UJP7EFN0zWyWbzhBR7Tq4o9fUko4j6OJ1YaRRRztLvKGQHETT
         SkDDe9J6GDPcoSdYDOvk7ZsfqJMu7aqoGX7XPKYZBlsEwfvE2OL5BR3uZ8BHpW3jsqjp
         Qn7hT07pqqG62j6dRvUEg9X44craefYULTvxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666648; x=1784271448;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=868Xi56BT/vFfLdmyA7Rv71aBwx1Mq2lDwVlu6Jy91c=;
        b=c+06t1nuBlOdoTGebvK1krj2XLlhJSw/Cze0U8eSQ+DVth387d9eEl3FFpbPDJDK1R
         sCuljUYYNE9P9prLmkO0ohQz7oYlh8pbQ4FjG+flVJoFNRGRnk+gCcDDzJzJITkzsPHk
         Wp0ryHuFQU5ehtALfSpwmjjXvnd4NMzRGJGYfkALX96ySHFQq6lCQXTrmgrBl9wSw1re
         2e5x+BHivUaa0Y7QZjD45AtHfp6RerX1KVPKbN2EK5EcS6f1uN04gJ256lBOL1wdFUc4
         VKZhqDGS9UjbNtKDz79vHvygBWNwSX+W92Brd93RDrk8jM0IYYIiN7o1CHEjkqZmaRS5
         52LA==
X-Gm-Message-State: AOJu0YzTMsykp0/nMXBjfbl8Aqy3HI1gD1GFegoWPbqU55wHOk+WM5k3
	1GZst3+P03FhTFzp/gRnwV2RJsRMzV/XC9+IF+rrRTVOQQzWADzNg9WifsI2jlMiRS0nXDO8WT2
	5Q3bGzVM=
X-Gm-Gg: AfdE7ckGgBVyk/3Mze0QC93N6ZjXM+1q7+B5hHfV8HAIWiQHABhvKoOhyKzDenQ14cm
	1WbsynJNsRKnSSewqMv9R2gdn25fKE5bsp7uFucQWWgxPIqfZL4NzopZb2CR8+zB+87CJnsB/Cz
	VLDrvsKtb+BcOcJU2dI+0/movpZDwiJ1vyLyOM7u7JSSHRgVunZpdpRqZSzbn74pJidqcFYp6K5
	mI+5CNIVe9mfVV6dvpSxhaZJ98jyVAgTVTHaHZSpFlM+wjTf4LYQLN5Dqy8JrkcVcXJK6WJtOYh
	teSgYJ08g6lfrL3pXjAXETkZqxLXCgkSjUaQBIgVfpouI8tmJ4N1GErwbL2mUc27N2Wde9h9PIn
	lPacC6BCV4c8FefumVWS8OJDbZgZO9LCDaGn67puOFH0/Q4LMdJikupHpfXP1/i8NLxdrlb6R6p
	XqoCm6IDinwRHYPqx2TGkFnl3IUno3
X-Received: by 2002:a05:6a21:a38d:b0:3a3:327:c5c8 with SMTP id adf61e73a8af0-3c0bcb58531mr12143035637.0.1783666647733;
        Thu, 09 Jul 2026 23:57:27 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:6156:5a18:8857:b507:5e46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm18490611eec.26.2026.07.09.23.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:57:26 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][patch] tzdata/tzcode-native: upgrade 2026b -> 2026c
Date: Fri, 10 Jul 2026 12:27:15 +0530
Message-ID: <20260710065715.41949-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 06:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240595

This release contains the following changes:

   Briefly:
     Alberta moved to permanent -06 on 2026-06-18.
     Morocco moves to permanent +00 on 2026-09-20.
     More integer overflow bugs have been fixed in zic.

   Changes to future timestamps

     Alberta’s 2026-03-08 spring forward was its last foreseeable clock
     change, as it moved to permanent -06 thereafter.  (Thanks to Roozbeh
     Pournader and others.)  Model this with its traditional abbreviation
     CST.  Although the change to permanent -06 legally took place on
     2026-06-18, temporarily model the change to occur on 2026-11-01 at
     02:00 instead, for the same reason we introduced a similarly
     temporary hack for British Columbia in 2026b.

       Although another TZDB release will likely be needed soon because
       Northwest Territories will likely follow Alberta, the legal
       formalities have not yet taken place.

     Morocco plans to move back to permanent UTC, without daylight
     saving time transitions, on 2026-09-20 at 02:00.  This also
     affects Western Sahara.

   Changes to code

     zic no longer overflows integers when processing outlandish input
     like ‘Zone Ouch 0 - LMT 9223372036854775807’, ‘Zone Ouch 0
     2562047788015215 LMT’, ‘Zone Ouch -2562047788015215:30:08 - LMT’,
     and ‘Zone Ouch -2562047788015215:30:08 - %%z’.  This avoids
     undefined behavior in C.  (Problems reported by Naveed Khan.)

     On platforms that have EFTYPE, tzalloc now fails with errno set to
     EFTYPE, not EINVAL, if it detects that the TZif file has an
     invalid format or is not a regular file.  Formerly it did this
     only on NetBSD, and only when the file was not a regular file.

     Unprivileged programs no longer require TZif files to be regular
     files or reject relative names containing ".." components.  This
     reverts to the more-permissive 2025b behavior, as the stricter
     behavior did not catch on in FreeBSD.

     zic now reports any failure to remove a temporary file when
     cleaning up after a previous failure.  (Problem reported by Tom
     Lane.)

   Changes to commentary

     Northwest Territories is expected to move to permanent -06 prior to
     2026-11-01 02:00, when clocks would otherwise fall back.  (Thanks to
     Tim Parenti and James Bellaire.)  Model this with its traditional
     abbreviation CST.  Unfortunately the change is not yet official, so
     it is currently present only as comments that can be uncommented as
     needed.

   Changes to build procedure

     The undocumented ‘typecheck’ Makefile check rule has been removed.
     It stopped working in 2025a and evidently nobody noticed.
     The rule was superseded by ‘check_time_t_alternatives’ in 2013d.

Ref: https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/NVHSX2PAQIT44U5FCCEVNJJYXQMMTJSA/

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ff02416ed3..47f9ac2855 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026b"
+PV = "2026c"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
-SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"
+SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
+SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
-- 
2.43.0


