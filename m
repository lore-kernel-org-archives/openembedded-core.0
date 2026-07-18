Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C17C44525
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2522.1784364805868677317
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ow/uhZZZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso376895e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364804; x=1784969604; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HvNcAZa28dwWsJ7HmSe6jC9I3KAZZtaXJM8wixSznw=;
        b=Ow/uhZZZNHI6y/ZhXRrmrl6wCHAXGc5GhPwBXAuCZOXBvKy0tM+Zq8GS/559r6vhLN
         o0bT5OcJwyKLvrg27AuVbvQ6hNOfphKE1z5rYQQUWFzLLHZ5qnq31jkMcX1sut0Ejq5Y
         QHn6mOKaFLwLQwpXroVYfapI9SJRriOQhRjSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364804; x=1784969604;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HvNcAZa28dwWsJ7HmSe6jC9I3KAZZtaXJM8wixSznw=;
        b=EztxHJlR+HroWVB1U/CkN2UC9WAYfbMFxQZ1Fy1eJNUoFXaOt1HV2/dGPqVXdyQ5Zd
         GHpiaaW3CSccCY2lrc5WovbIhYfN9eicMbDnyeRXKAvbEovdrSAvBvu30Y5jgsocGd9q
         76lPjpVtn5vdXx5lsoH6msQk1vX8IYFJx1xKDHEgtsFu8mgcqu1c7Tof9Jz/teblX76s
         pKPUwUWkbpPOjPP+Havjd2t5s1dGheIsy70DyeApUTM3V4wDajn+6y0xy23dzhuhKDYV
         yLmkYxG/su+dH32MkSoJWilJZnGWrQsbZJe9rTIhgr1WJT1XPft6vQahOGuWefTxBEJN
         ANQw==
X-Gm-Message-State: AOJu0YxrIF3XnIObHQbsnQXIbkD8Zl4Pf+geGjZitK0d6EuVP43X/Xrp
	vxxqd+DBxfzKmAEpIzTwmNGVB2K1L67IQRSe3QE1WqbBzC6zBh6SLgl2MAxXiKXE5nRsumoSpfV
	5mqQT8TY=
X-Gm-Gg: AfdE7ckusSD7fF+9rODHQFR6hJbtmzV7ZbwkKZVi8zOvjiD8+L+UI7uce5RILjcWQ/m
	qk/jt3KINJCW7k0J9Kov0ozjdZiSBECJEiTd1v9UXbc8GagtZ/wOcI0mKkwWFtqFnqfB0DGi7yw
	cs6NcOSDypzUK2j7aC2RU3lihmSs+IVC36/i/b84L+CKCUTu7N6Xyt8jx2Xqbjtd6FFLMVjx2Yo
	ltbOQUYpWzp8aTKTTBwD4YY9rZ/dhhmIunuQ34t/O6Psi+mz4EXgmt+tuCxAsmcVf3grSiyNMzj
	2rAnrsbTYEI04S4WGKeuL2A1f+4KH9gn+p6Xzj4bdHXP5gZTOdDSj4diRXrKCAAEjDxnKcX17DX
	BJXXhC29JAY+v8ukr7+SH7nTNY2OmYECPnJPcqso9lwHXwqdIcJ/Xged95fcmPTue77lyrWc/+X
	U9F+rDBTaLpc/zY9eBv3qwpQkfM+7AGJpae0ax3ec2tS8nArb+dnuH8eqL+w1/ZszJNSa+siYcJ
	/uuMHLAO5zzz/lPtA==
X-Received: by 2002:a05:600c:154e:b0:495:49eb:1ccc with SMTP id 5b1f17b1804b1-4954a3eff56mr70128125e9.13.1784364804044;
        Sat, 18 Jul 2026 01:53:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/17] tzdata/tzcode-native: upgrade 2026b -> 2026c
Date: Sat, 18 Jul 2026 10:52:46 +0200
Message-ID: <b7ed80d7c7773624577521f711e7d9850f4273be.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241244

From: Vijay Anusuri <vanusuri@mvista.com>

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ff02416ed3e..47f9ac2855f 100644
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

