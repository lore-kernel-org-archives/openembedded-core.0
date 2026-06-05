Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8126CD6E7E
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1780698867537521086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rFg506xp;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2072591f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698866; x=1781303666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1HElx6OlQuR9MwXY1AIbg/jBNyWMky8TLXkOXCdlDk=;
        b=rFg506xpHaJE4PQVSWrzGB96n03ifpBw3oJEv2Rw+0o067NTxJn+AClw32TO2Obqnw
         KQsE346W6zhAQ+th9esT/hA3j56olR6UoeVItrytRGJpxR1KaMUZAeh0QGt6piB8gKNn
         TlGSH9JDI+UHGwEpUwEmO9w4RP9hrKn4oT89E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698866; x=1781303666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S1HElx6OlQuR9MwXY1AIbg/jBNyWMky8TLXkOXCdlDk=;
        b=CuwMUCsMwzFTRO67P/heIDsGDlpGELGkbMoxpxv9wA/I+bz9Rge/3j+8eNe6PM1eEh
         v2I9JKwKCH9Fg4G7uHykeP8iKVR545jYiyyfKree2O89kF7Lhl5f8yWi4WjQN/MUsWP1
         Bnq8JNTMFOJDmSURgXzpyFfPG3T6RZFTIunBDEsGxG05zBJCcNIjSbu8ggTOIUV3M7NM
         Fa9BDETkz0rEyrqxYAQb2ApK/iHRs5stfIj1/5szA7Lp37OZfKm7U+U8nh2ioyz8Hg10
         ejUjup6lqk6rRVNhA8dyQ75Qaln3iVKNhipD95Zl2tQTqNRIftieO92b9w+9iHExJWA4
         KT0A==
X-Gm-Message-State: AOJu0Ywqwpda0HmxCo2F7X1BF4sFa52wGgW3RTBb/L0TWVGU9Pv0OaN4
	Pte+/hMwMKl4w+CZFEOlrpbdji0X2oJE6e0v6wXLWC0CwI/Qir2Nb3FTeWbMfRox2dKIxaLwulE
	iFbuL
X-Gm-Gg: Acq92OEhaPlhBabe+ZqfaxM58z8k07MnWlED03H13yl52YH8R9rN9xoahG3QyA9yKzh
	eDhqeprnLi57Sy1LzvCEMTgb/c/jtm16P//Bhq0dZQ/fVxio96ftrduM9RwzMkLpd24sKBg1XqP
	3pDeZkGYNlIIxqLd52o/6ShXgSTLbqQQYvJH9dBSHtGfSHSOQKbQAPBelNTBXik4XgAcW4CVkLI
	mX6pCXH8VUPNBjmUc5uDq/Bbd1H4NPmaDaQ/k4HrTcZoiHxerBc6pdy180mB4N/LSZI2EelPh88
	wHRw5ilEmFKYicaH1XkJoLyBODR8e4jWhW1x9Ql//KP6dERP110Ua5PhiVTctilq1RJEP3MOQag
	84fqy4/ng2lC24K3xVT8+dy0q56JyDG3N97UgqQbh7uWPDEBfjrjX5sw5aBG6L3ZFnpUqdPglzV
	oJNqRNkkB8VwyubcOVYOVBBc7QQ4I5byxVeQxiFderx4yOCGRKF2m3nCbh/LwIPcgEOgjwKhLEV
	Pu/opXreyqdsxldWVR68sTsaeG8hCTj4hfVR/E=
X-Received: by 2002:a05:6000:25c4:b0:43d:7c6c:a0dd with SMTP id ffacd0b85a97d-460306226c3mr9997754f8f.35.1780698865935;
        Fri, 05 Jun 2026 15:34:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/25] tzdata/tzcode-native: upgrade 2026a -> 2026b
Date: Sat,  6 Jun 2026 00:34:06 +0200
Message-ID: <37dab321242e06d2940c4221e4a13e68265d696f.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238207

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit dda7d55396e0c5258cba58af7e990ab3813bf108)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 71b034d1581..a4774370662 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026a"
+PV = "2026b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
-SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
+SRC_URI[tzcode.sha256sum] = "37e9ed8427f5d3521c22fc58e293cbfb043d70eedf1003870b33f363f61ca344"
+SRC_URI[tzdata.sha256sum] = "114543d9f19a6bfeb5bca43686aea173d38755a3db1f2eec112647ae92c6f544"

