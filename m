Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4690C4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 09:46:19 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3167.1784367977451912163
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 02:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JC+VSPVU;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so10198562b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 02:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784367977; x=1784972777; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjND7NC32gMjd9em1wTEnwsOKOjtcTGzbR+IO9XDHxI=;
        b=JC+VSPVUZnCdcBfcz5+ySY09IJZegAkBsGZYQC9B0QLmedSftvVGcIKEiLIASPYf34
         N6lNme/iAn8P4QP5hCEq6M3RQKAq3euURqUsgXcESl2a+tyTHefaQ/8qn16GxXhCKT8M
         2KQQwINR6RqIx4bPP3qPg8uN9kmtrh42ygc3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784367977; x=1784972777;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TjND7NC32gMjd9em1wTEnwsOKOjtcTGzbR+IO9XDHxI=;
        b=CoJQ5gBnSzwBOj7GuW2RC/AH3qgV3H7nz70/B9+2g/jwHCZQL4zPiaQLMfTxEWkXSh
         2yt78MnHyWE/vgvAYA0V3xgER5t4r+98ayomdeZMSeSU987/PZZEo9c9O9FmOkn/pTsY
         nhgmhmF+cj0jaP+SE1vjbQR5gP3MuTfgaPQzJGtPnXZVtT9yw+9nelh6rqA23Xukl0Gg
         RLlVm4RTBtfaSA4xhcUYL6E4km6TppslFEODwOVwayIKvpjVANkateTMoJGcuegdvze9
         QNWVyfjXU61LeU/KK8fAEtpxZ5twjuSHWBVEoQLq6es7+Tt3YyvnTZNLeUgs7yiQhA2Y
         xC0w==
X-Gm-Message-State: AOJu0YwwTy/CPKEfB4dBe+yxiyvn6uxLVTgqxTynZPBiEeThLGQ0r4k2
	AZpO3hA6YrnjQR+3yEZAaJf3eI+oP7HxrFQv/dRumX2HJ6FlT4K/Wx+9ZP31a/eYuBa+c9T0ZO5
	z1ssUwhw=
X-Gm-Gg: AfdE7cn9J5BWh3gMQbwz5d4yrmF3fAHXzbzajuvMls7C9G33fpvalWwz+D+8zvJVde3
	Smlq9/el6qgV8nPKf/Hd3AId6aaigC0qYeOdjPHSX1In1BQD3ov/80MtkAfl3ui726EyRaDF95i
	TyUV8Z2t7nDMvPhHgZIgJaSF7rdqHm1X+pYlxA9lM/xVjmM3Ud5b4T5K84MeIpcQTREkENrndBj
	l/93DrMU5OLXFFZh56yx0dy0O0Npt87i3BJzvlDhUKxSR7BJIlxvFAOLisH+1IVpU+6DfdUT0sx
	Y8vaYoPM5LEYQCMQL6hriLAFiO1ShdW4SyjiI50FC5KQ0jBtmb1SECZC3XZUI5GnfweogAvkZd2
	r4GZRlVJxFzJiCd0o6fgkJwO221lNCoC4MrAuwPXw80YT4e+JP2RNF6jbp1ROvV99STO6+TWmTH
	HHPJXF4OYoEx7PlA==
X-Received: by 2002:a05:6300:2289:b0:3c3:a7ab:135a with SMTP id adf61e73a8af0-3c3ad7a32f0mr6101935637.20.1784367976606;
        Sat, 18 Jul 2026 02:46:16 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1cc5:b43f:a4a2:6dfc:fd70:87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm17073433eec.18.2026.07.18.02.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 02:46:15 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][patch] tzdata/tzcode-native: upgrade 2026b -> 2026c
Date: Sat, 18 Jul 2026 15:16:05 +0530
Message-ID: <20260718094605.2567681-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 09:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241257

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
index a477437066..4271b30648 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026b"
+PV = "2026c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
-SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"
+SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
+SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
-- 
2.43.0


