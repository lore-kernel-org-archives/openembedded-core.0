Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B04CD5BAE
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1000.1779233429687626668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KjodVWFr;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44e1860558fso2575284f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233428; x=1779838228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4JXqQByZ+Me07AwHDolIqgwY/x5/y5/bEcE24PbIYA=;
        b=KjodVWFrL5xlpSKFp55MLBlIJxuu1240GgcnSd9Z9djMUyXrXyN3O170gaXZWVat56
         pmmuW/042RyhUMpGYziboYoTNka1tipdCLvS13MpM4miJJE+YqsSzF3tEj5KW+SFGqf/
         7NNUxRPgQe7kk2U0xUVkPYPPHqtoqhqEIMxSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233428; x=1779838228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4JXqQByZ+Me07AwHDolIqgwY/x5/y5/bEcE24PbIYA=;
        b=V3Y5WE61ena/3+pC0cDwfnF2Nlh9IpMbdg2M8mEayNpEE5K5zDjb7KvbkwJfHv1+xa
         u9yXjJOISf2zuMGQw5G8FxvUSs5zznsAta54J9F6iOEe9msQUsKFR6SEMOGd5FNz7TZn
         PB76PJFsiKZxviJ95rfpTqRjpu4AZKhcHlGbn/EEsqFbJVrQe/z5q5CnfPjhu2o+hWBG
         /B6bAVcebuAKyPH5b8aWwIXylS4iyf2zrI5fPx52SuLNcH/G4kvpp5+q+wIRhGOfTEGQ
         jYR/dUMAPziAouGNI+q09EX5cx9Iipasx0PmXQrAgE2DuQ/qjU4sINHR5qs2mKpXFCi4
         AtcQ==
X-Gm-Message-State: AOJu0YxYcnd70Pj0YV/6h9x+c5u4k+ug6yYEtpuW+wcO0MTi9enHovxk
	9P+0d8SuPv/JbYMx4cxdatbkKvgzj9DOPTvvyRh+iFWci0qe0xPGcamMSG8z4khp2+bWWIoDrJW
	Vkq1t
X-Gm-Gg: Acq92OF8kiOzX+vhKKg412G4QQCuAhdfeQirqEqrGyXtw76TZRV+xglFNuMBaYk+fUf
	zTnr/GcHLm9D3HkFLSeN/t4jEQIJYEiF8w9USvBE4jnmRXtyBdYQK/Jav10Chz2LHyKf80LfQ3z
	UVpmgXGlQJhJflgfvSbY01FWwOxmGdLdaQ+ywAJTf8qvPOge+25Iq/HD2c6ftl9OuvWW5OkdQe8
	CcKWGrVR3o3cK/OoobnUaDsXlH815uWbs4uiBt2o3q1Ls13kQbmpRgiitrZpjDjnCS88Fhd1f7l
	9jNO8ZYxnzVPYTdw11vd+zvWJYMRQkWpRYR34tYT3/nT8bOxcztO6LC/Ncw3clqZgFFn88vUNdC
	UJZvas5APgIqUUugkLiHet/Ft3PujSOl+EnuQ9aqsGcty1w+fbC7VRdDQiRl1IeMYYVy78calMA
	x4BAx/GK7IYvxrzfQNjy+D2qukLp9A4h7GrmXgEzFXzou6bWwOrkLiU8GOb35Sp2BYQzyyKRxGz
	xcUyNOTkKlUIcx0PoolKZyznr0=
X-Received: by 2002:a05:600c:8209:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48fe61f2a2fmr339504075e9.16.1779233427758;
        Tue, 19 May 2026 16:30:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/28] tzdata/tzcode-native: upgrade 2026a -> 2026b
Date: Wed, 20 May 2026 01:29:40 +0200
Message-ID: <aa4b81c7f4ae6cf2f495e557199f8fc8a15eceec.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237350

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The 2026b release contains the following changes:

Briefly:
    British Columbia moved to permanent -07 on 2026-03-09.
    Some more overflow bugs have been fixed in zic.

Changes to future timestamps

    British Columbia’s 2026-03-08 spring forward was its last
    foreseeable clock change, as it moved to permanent -07 thereafter.
    (Thanks to Arthur David Olson.)  Although the change to permanent
    -07 legally took place on 2026-03-09, temporarily model the change
    to occur on 2026-11-01 at 02:00 instead.  This works around a
    limitation in CLDR v48.2 (2026-03-17).  This temporary hack is
    planned to be removed after CLDR is fixed.

Changes to code

    zic no longer mishandles a last transition to a new time type.
    zic no longer overflows a buffer when generating a TZ string like
    "PST-167:59:58PDT-167:59:59,M11.5.6/-167:59:59,M12.5.6/-167:59:59",
    which can occur with adversarial input.  (Thanks to Naveed Khan.)

    zic no longer generates a longer TZif file than necessary when
    an earlier time zone abbreviation is a suffix of a later one.
    As a nice side effect, zic no longer overflows a buffer when given
    a long series of abbreviations, each a suffix of the next.
    (Buffer overflow reported by Arthur Chan.)

    zic no longer overflows an int when processing input like ‘Zone
    Ouch 2147483648:00:00 - LMT’.  The int overflow can lead to buffer
    overflow in adversarial cases.  (Thanks to Naveed Khan.)

    zic now checks for signals more often.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit dda7d55396e0c5258cba58af7e990ab3813bf108)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 00bb704e360..ff02416ed3e 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026a"
+PV = "2026b"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
-SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
+SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
+SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"

