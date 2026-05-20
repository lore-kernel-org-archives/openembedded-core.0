Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8EDCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7274.1779265257980519861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dOT0wDW3;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso4253006f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265256; x=1779870056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4JXqQByZ+Me07AwHDolIqgwY/x5/y5/bEcE24PbIYA=;
        b=dOT0wDW3deJ2pH4R8hxljiRweKIMxXXOGkPGYxp52ooiyJZGC+RNjA+OZkYKuUU3pi
         BnsKFR3joSEjdcjfpPq1sula9i0rg3lE+reTflmPHBtIhrIDhTGEdJBBllqHb3sfcKlB
         CZYPQt4ENY3K/860/nZ5oLqZ7fVIxO8LD9FY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265256; x=1779870056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M4JXqQByZ+Me07AwHDolIqgwY/x5/y5/bEcE24PbIYA=;
        b=PLiFg8cP9IHug3uBxLzdtcbtWonQXRncmjANCvrQXKYnMOk1RYn51WLc8w+bER2+w6
         bvgxyh08qtFXBBe3mpAAyidFcJ4gHv6JFWYwz9GI1sJQRnhp2igNsDeyzhp3sbD1DzsY
         SH7w8UOpF3za7Q9T0vB7weEt3xFLoz4VqL0qRj9qLVGrsRTp6dLh0RR5clkcYpYx3iMF
         syErGHMWEbJZuB+HhuksCXFj4br37UfjRHMaY6dF3AdDa8Sq7oYgwDBhNBHEazqnK2N/
         Rn75vIIz2uKvXVHy+CBHPxmDxrd/+8z9kMAM7AaxN+otegwo6Zut6PIzZ/N+JGs0fOGl
         4Fyw==
X-Gm-Message-State: AOJu0YxqULEmenQ3i0B/U/zqT0bWHup6T1+5krVBplp8fqmh38URSQ7U
	2I8+RtU28cTjQfFQTlbRLA/a2gngNzdHtrPuqaB7jp77KAvRtCbJqIlAW8NUui801rm0Wg0URc/
	k5IBM
X-Gm-Gg: Acq92OHlarlONITQMnE9n2KuFNk6fDRIyEM0bYsURU2NBnAogEMC8P9cDDbljEpg6oM
	8ZoTIVS6+lnzHnDZfRtQ/2KBT32VC4d1fcK2KSZIBeJdiHmnUrkoF5ZL5BuJIp7DVZLRLUPudtL
	y3oYj79KVF3jJR9J3n1QqHbzLroHJavBUgZMKOFY36a2YVmZy2PKfH0lSxKzm5tJd2+nKKQJpR4
	xUKZ1We5r/CzzX7/CwUexqVkSZ+1bhxOsIZ2k1FB8e/o41Ib8CIN5olMW2RyHW0+9zjMD5mTWjA
	eKKrXU9Vx8orLL9SFDRbLv+kLzpOoGbSsjJIJL5xCvxZn4WdkF4n0gWnCxvn4UwpkhrmnnwAKWZ
	OAUvqU7dQ0uxxlavTjvd6KDHwqYp+ps/Yv2U/+b9zM/nSoruFDQPk4IDyiqactgtQ3ynx19NZlY
	2dt3Ro1rDax/a2PwmPnS/YgxEZ1Mg3CCs+AtIe/safmK+xpi7zfDqlxMW4/ECtb5fiXIb0vedrj
	CPSCzUjjb1ieoKqsHWGllMIBU7QDHR/V0nTkgQ=
X-Received: by 2002:a05:6000:2489:b0:44f:da26:cbb4 with SMTP id ffacd0b85a97d-45e5c58d51cmr34763139f8f.21.1779265255874;
        Wed, 20 May 2026 01:20:55 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:20:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 03/28] tzdata/tzcode-native: upgrade 2026a -> 2026b
Date: Wed, 20 May 2026 10:20:04 +0200
Message-ID: <aa4b81c7f4ae6cf2f495e557199f8fc8a15eceec.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237402

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

