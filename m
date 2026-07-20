Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64662C44530
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2879.1784568223538791403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SGIE4Vwr;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49558ce01afso14150435e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568222; x=1785173022; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8nlBN7ahjCswgSCrCH4GXkguPBZV495W3nTc3ZXx7Q=;
        b=SGIE4VwrUrxVkqnPgK74D1tZBVnE0vh4ntYqJtdVm2sBCuE+rluTAkVHKuN5ZY/ft1
         vBqyKRGdyA+zwAc1M9CwOPHXd0sxyubs62puhgsPKUpTANmWeAWl/Vciy0CpKuFJjPu8
         jrERcJ0ixREZ4XcWssIqU5QPEU3bXcjPUnSvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568222; x=1785173022;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8nlBN7ahjCswgSCrCH4GXkguPBZV495W3nTc3ZXx7Q=;
        b=ECJIbhErj2m2vAgPuAyHM+awpDt7viwvb6Ce5BJre7eQuzED2e9cyQfTmoVg2vkKfV
         948C21/EPiSr/s7dkjWzrP2UG14PanvEXXg8VOXzd1XXDJikh4mpDzCkQ8ZB3F163tuZ
         VeCVIsc0wWiGudcyl5Hp02BP+nFFg9AGfqgGJ60+mp0o35gaXGgmZJNlZIydeC+jbtSW
         5PiULSH/w/ijmwumbhlfMCR2bBVff+pxI7YXGWXrWUWiCNugQNSThXppsrzdW4JyBhrb
         bA/KgdmmNLpDYKVS1UGDkFHfSYd+883hN/lkTAgcSoWP1L3DvYJ1zrBxE/jxfZLVtiDS
         dWEw==
X-Gm-Message-State: AOJu0YyPq55Is35vYDN1lCBB/0M/MHmIJBKqPxiI+zkT4W4/6/Lsiv3w
	NPCPTsmY1p3/NUJQ0WtNydmGtRGRufPJ+Y6aVA3mEB1zuS+9VbR/Ig0h7D8p+/8RwQ4ZTOmcfhZ
	n/3sjWII=
X-Gm-Gg: AfdE7ck/8hhBHrGPG6EVfU23vqDVTDRWgTNnhMW7Rt/xJdfgxovEff6uSY0vDw2zpdS
	jVVjpgTv/63k2E/lX5BQurrXCCTqqb6uFaCEqqKUmykKzHJYqGr7hqMZOA4xOYVd/KRCfEfP9q5
	v1zr5cDfpirIESGf8gdjLyFTkT5UAFqYb2Ei3jtz9kqNVW8tr/AYNyOLpZJEHA+OQPmqpcWkTJf
	59OrfABfleVuQk9nDihiiLjiftdeNyDgyTlvu51otDtbPebVhVVh2l0VV2n6LFByej45feTMI9i
	ZXg6SKAWcYDKE38hzjFzeGI3gPzdgwXBuSneGpxYzQoYUUR9oqo9b2F4OJ6PjF+3xTlaSMvtyFo
	bw9iSln2ljhSS7yIbAEkqHqF/e6FuB9UR07XiHYnfBeCBru2imw980DwCQXPppwom2w9xm1cM8n
	pua5SrZQx4ErNfL/Zxsdy0fvh/akhWzsw1piqJq/6XMx9heRXG6Dazo9kxrI0KORFqVYzI95Y0L
	YFl/K88
X-Received: by 2002:a05:600c:3590:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-4954a8e3616mr166198165e9.0.1784568221690;
        Mon, 20 Jul 2026 10:23:41 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/33] tzdata/tzcode-native: upgrade 2026b -> 2026c
Date: Mon, 20 Jul 2026 19:22:52 +0200
Message-ID: <59c98bd008a9611be2fd87d869d23049cae7d759.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241453

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
index a4774370662..4271b306486 100644
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

