Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19166C44514
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 10:44:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10846.1784285043099308093
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 03:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XWZ4fLs9;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad8076b01so94326075ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784285042; x=1784889842; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wq/e9zmfFDWMmYgyZX+zwP2GcySmn3bhLvUjCPW8Z58=;
        b=XWZ4fLs9Ofv3CbQyNrgK1uCI+K1P8oHTdSOe9NqDEhJG7mqUwos4u9r++rTVxRzUM7
         INvo/m6Y9ej7E1JyIcvjI7WgLcYUymh4HVz1eGQ7RUadW64oQSstsVR90B0bNMIhWL6G
         rKZRzuGkNVjdCAk8Z1ThP0mQAtF1tTaGfgRXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285042; x=1784889842;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wq/e9zmfFDWMmYgyZX+zwP2GcySmn3bhLvUjCPW8Z58=;
        b=d5W3IvrTjTPy2MyQL+/nCHGvU+bkhXhmigQbpfKWDYYIpATeuUSA3ZFcK+3y+LCtyU
         K1t+JyR80VvBia8qiREkxSRCoc8Y/FpUWIhTenmqmgsakf/wgTRaOQCPAivZ8q06UUs9
         pr9+hmamW9oB62WnBbvGGiDdh7kY4bw/TPSt4tp3J+kH5xHPUC/auKpRi6J5qRH8T8sI
         5ss11aukfzLSEMHKQilMD3bN4nKYC/64eanltS8piuylLxkMKW4rsUPUjk7DSlWOKCXA
         YwgLjhqifUULiJiHNBw1Yh68Kuiaph1tF4aDbhaG9pPR2u/rNtOmXW+CX6bh8YgaYSr/
         6OlQ==
X-Gm-Message-State: AOJu0Yw1FigUwZezJt/GrzfpOt1iHxppgUR7vpGQL3zwV7y19YIGg8Zu
	zxxOnW7IFprdDDBIDda96GfUm2hvx/va8WlFUSULOGdfOixAiES2A6sApLcGTqXVFyn8yTGCDc/
	Jnfgnb3M=
X-Gm-Gg: AfdE7cnGz/ovmhMDZmAly9/ipGWSog3UCJDuUxxcMhKx4bV8qWNpcrMrMAX5AdB/V0D
	8e24W7a+G6Mp21PkeS5f8FYNwhtFTxZi4lHQwEr8t2+zyml05+Ta7pw5wvIIFM6SgPpRTpB49V/
	mNPY2J4XveB/AHZzFtskiRPQCiunvMJIcj2vHQmPKJgnorZfzRA5dmBAywUam1S/PvQgSzr36Ns
	2vkBrIzP3A4gEf0vr2ffeDFolZGIedubUw2lIuq1ilOJshl2jQo4lBDRgrPPHlTJCm7CyBWkkMV
	u2Yd1iFWfk6fdlIw/pj3d+/7Cb3vNGlgihYdrDErD81C5UHgK8XRBjGegyVDJa5MeBi0gn/bU2q
	BxuzdM9lrhIn5evB8NSZ2cDI9eRbyzm8PHnS0HCJTB5p/PzwQAXP13dEfqHJ2cX5BWvsYw/ifBj
	/34Z/bSVCcfS2g1miZcA==
X-Received: by 2002:a17:902:ce89:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2cf3485ea4emr20191735ad.15.1784285042295;
        Fri, 17 Jul 2026 03:44:02 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:52ca:d098:7ca9:749a:92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm3930749c88.9.2026.07.17.03.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:44:01 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose][patch] tzdata/tzcode-native: upgrade 2026b -> 2026c
Date: Fri, 17 Jul 2026 16:13:51 +0530
Message-ID: <20260717104351.3145983-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 10:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241161

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33a7e1170b0c8ba83cdb4c7d6d9f83f6c194baed)
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


