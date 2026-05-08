Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B153CCD37B4
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8157.1778224337812069570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bFgMjGVm;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so1752402f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224336; x=1778829136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxBQmos8KFdr980iDjnUONpCJDYp5VtFUTD6Czhtd08=;
        b=bFgMjGVmy1MtJB5YUlDBcw9VE4hlKRtvJCixNxfYLGncOL60DzzZZqSUK7N9g9e+pT
         29yuM77t8LgTvA4H2IMuww2MPqVuuaBPc9fWEvcTTqM2CbOsAU/FN/rn8pBqT3KWyTfV
         97L89eAbGlIJnJ2IkTbewTRJLSlb07BFHusII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224336; x=1778829136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FxBQmos8KFdr980iDjnUONpCJDYp5VtFUTD6Czhtd08=;
        b=SLls69x5lzPfb3uwFoHh/XunNwheDqOTwzm4iSQ+fzC5cKxZIFfJtURt6ernhF7qvt
         4HLPXQMg2p2hws+FFaMH+RFQI6az6srbIKJm1UFcjnGtSix1nKpTnpGC7Zi4ZJzki0Bp
         Wb+SlEaAFXtW/JpR3Y5lA177yds0WxOkvjDdpOPL/LmieK9I7djmf7DJrbBtNc93LOj6
         IOPJvXK0IOtWsM37N4WQmbjkoOrNEVzIIMQl1F2sR8RHBMX5WJagZOZrwh7intxQnXRN
         cbtYG7+wYrUu3ogaKic2+PD1Q1FYFZXqMSBNWIB2riSyl93dk+1zAlDEbY3MZOQqjo6I
         Xm0g==
X-Gm-Message-State: AOJu0YydDa0DfKW1PCjqJkG6brgg9bftwbQIhufi+fN3z2HaQlk8u9YC
	Fzu83n8oMpsbNNT0U20Y8i4tDyrhqqpEhvdg6BDrebnCRGp+cgS031vjPGR3lVPBK87wMaNjXY7
	/FWhgKsc=
X-Gm-Gg: Acq92OFmzSZwlcLBabQNE8CTkXrN2yVNFqMZ14YoIqfgnN8KvZlqdHrBflag2HEblgK
	gqYg0cwIRNcj9rW6RvVe/qHh5BsHHBqSTNwd0QZUhH2sB5kmiSYRUBOG5UEniADC0xYgVz5WoPH
	CNIHhzGxoHvMnWH1FhDzT+rJFNzA98Vm8oJzgqieDUjOOU8RE9zWIzSE/HlSgMUQuiQkakF4ajW
	9pSOF8V2FpSIu60ZcHOtDOvkrxfPcGnYdRzj1gTjBD6knRKMAr7TaCRofsGKyLhhKoukXNF6/GT
	+Rvnqb3VRNWggCMbHlA3O+9XDI0gDiLUDkSqw3e0sjebit7jLoG12ovNHb+AX0eckSzOa00+/LM
	rCEwwNH2UoA/GxeU4AkoyC1wuQPqZUt6JAVFHhuOfS1Az+mdCe/HN/Tu0rWM47MqGHKq/NWH1yD
	quu8w+Y7PiMZ5snaRQ11czERNBYUiJE5eQZ4VAsJ343IeF9A2w1qGIHkQ/cdvWWG32ycQB++Ll9
	QVuNQpCTRFm8NhNheq1KxnBIsg=
X-Received: by 2002:a5d:568b:0:b0:44f:69f4:39b5 with SMTP id ffacd0b85a97d-452ea742f47mr6810127f8f.29.1778224335580;
        Fri, 08 May 2026 00:12:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/52] bind: set status for CVE-2017-3139
Date: Fri,  8 May 2026 09:11:02 +0200
Message-ID: <6217ad12ccd6d24d5d00722c3339bc5b42763461.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236651

From: Peter Marko <peter.marko@siemens.com>

NVD [1] has only redhat cpes.
Debian [2] says RHEL6 specific.
cvelistV5 [3] has unparseable (so assumes affected):
  "version": "shipped in Red Hat Enterprise Linux 6"

[1] https://nvd.nist.gov/vuln/detail/CVE-2017-3139
[2] https://security-tracker.debian.org/tracker/CVE-2017-3139
[3] https://github.com/CVEProject/cvelistV5/blob/main/cves/2017/3xxx/CVE-2017-3139.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e416859782de4f09ce01f273616a4835fd226bd)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bind/bind_9.20.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.22.bb b/meta/recipes-connectivity/bind/bind_9.20.22.bb
index c459cf28c9f..318412a62c0 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.22.bb
@@ -108,3 +108,5 @@ FILES_SOLIBSDEV = "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
 FILES:${PN}-libs = "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
 
 DEV_PKG_DEPENDENCY = ""
+
+CVE_STATUS[CVE-2017-3139] = "not-applicable-platform: RedHat specific issue"

