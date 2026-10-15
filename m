Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84B4CCA461
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32840.1792040647143252023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l/0QcdX1;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4207ac26so4442621f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040645; x=1792645445; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+G/sg1u6DqSts40kpqZbvyCFJBNyfcRtb7j8ot10PXE=;
        b=l/0QcdX1onL/JgNjYLLo5Fvenukpo917RyAETlgqE3JierP6XmoVrTjlxNjNUD/F2R
         uTTpi2+Wl8rkL1OI8KjtMeSjQkvtpI0zCjXbjd7F6YA43zbnQdA9KgDHys38XPl+a9ST
         rXX1IF2iJ/h2TTrZ1M6Pi3taji684pLnXUcqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040645; x=1792645445;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+G/sg1u6DqSts40kpqZbvyCFJBNyfcRtb7j8ot10PXE=;
        b=GAE2cVbPry6ucC5XwAnTYsqA4pLsrAIRsmopPWYC5b/gTxM/mN4r0YHaZh+pqyr8Dt
         94NzKx+rxsC58y90uHs93M8jZjzzB33J+c4py80Yf6WdWYTHAZfA3A5/sEdUzrYsfx9k
         Q5GeS5YHnf7sYitiBdcWjPQDkV7ebyekh1cDacRp0vHn8oEdvHWATUEV0lBjZuzfE8TI
         EIIxnviBUFQ6AvKsmwMwR/UV7iEXZZCcOw5x6VldBALGXMqnZvgybilVijftAl5f3tGi
         VGg/msUamGZLhIwtYqc7aIWnJ/iV6+WERTGCFKENLKf5BMzh3UU/KIG/Xj1rcRcSDML3
         ZnIA==
X-Gm-Message-State: AFq9FYLuuqt9kCp6eULsLkmK3xaro3XPOvkx4TWuUFxmJAqF4ULKiQZm
	WfEZUYid/z0PzST3emknfLT6mpIiueW1DhXY8GjWrPu4Q5d4MbCZb1rMEh9RiPBIasIcJ+A6Eqb
	Ob44e7/s=
X-Gm-Gg: AYBFou10IFKj0Ds7bDDjzgnu5YZx7xbMcDVo1s0pyGxI3nUM5swQQtlWNX0MyNu05st
	YS3YHAOTfnb+n7CJlIX6JzO4nZeLAX4MvYd8NXVI+jfa1/f9zSkU2bZto3ah9hgo7TdxQuWITXe
	jH3f+3yJLznKIb+6Bx5ZUXhX5n1UWZzFSr5F9c6ddlOTirCdRj2GrWi0vxV4KNDLl33Ov4XxH4/
	Agrq7cEKophevDd6Tnj5ydrQunwUjtwjwycyfm6RXNVY1a3S3WjFb4a6Bf7yYeLrerJgyAtS3f+
	NQuX9w4CXFzL8CigBO5QcdEmrB9H0mX1plF8F2snblpIckqoSGHPT1VgYnCusiJwpMRrncFK5uo
	hbrcNhlcukT7FefJq/qfCk+I7tIiLd270Cl08yGRlHuOXo87CpvmqPerlh+jQyb/nDK15odZsMF
	B58tdB4Hg+tC598IzxyJkgR1hhzwCXaLdyj57BIfhYUDx8HREP3HnDGy4nNuUZQVF0lsxfyejvT
	D/zpC7cYxOKCGtkQjmAKtH53c+Qww7s2coWcBt/ssD/NHc98Fa9ONhrmTVlKX4JbKPlxLbk+Q==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a19ecf4c20mr230109475e9.3.1792040645278;
        Wed, 14 Oct 2026 22:04:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 40/55] tzdata/tzcode-native: upgrade 2026c -> 2026d
Date: Thu, 15 Oct 2026 07:03:03 +0200
Message-ID: <82a02ea55b0e4a3e8ea9e7ce0df71a08bdac2491.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247838

From: Vijay Anusuri <vanusuri@mvista.com>

Briefly:
    Canada’s Northwest Territories moved to permanent -06 on 2026-08-21.
    Obsolescent settings like TZ="EST5EDT" now conform better to POSIX.
    Fix security, performance and porting bugs in zic and localtime.

  Changes to future timestamps

    Canada’s Northwest Territories will not fall back on 2026-11-01
    and will stay on -06 year-round, matching Alberta’s recent change.
    Model this with its traditional abbreviation CST.  Although the
    change to permanent -06 legally took place on 2026-08-21,
    temporarily model the change to occur on 2026-11-01 at 02:00
    for the same reason as other recent temporary hacks.  (Caution:
    see “NOTE FOR 2026b TEMPORARY HACK FOR CLDR AND CANADA” below.)
    This affects only America/Inuvik as the rest of the territory is
    covered by America/Edmonton, for which the equivalent change was
    released in 2026c.

  Changes to past timestamps

    Colombia’s 1992-05-02 spring forward was at 00:00, not 24:00.

    Iran’s 1979-05-26 spring forward was at 00:00, not 24:00.
    (Thanks to N.F. Hase.)

    The backward-compatibility names EST5EDT, CST6CDT, MST7MDT, and
    PST8PDT now conform better to POSIX.  For example, EST5EDT now
    always uses the abbreviation "EST" for standard time (now always 5
    hours behind UT) and "EDT" for daylight saving time, whereas it
    formerly had different UT offsets before standard time was
    introduced and sometimes used abbreviations like "LMT", "EWT" and
    "EPT", all contrary to POSIX.  Also, though not required by POSIX
    these names now use US federal rules rather than rules of places
    like New York, reverting to 2024a behavior.  This change affects
    only timestamps before 1966-10-30 at 01:00 standard time.

  Other data changes

    The temporary hacks used for North American timekeeping changes
    now work around a libstdc++ std::chrono bug in GCC 14.1-14.4,
    15.1-15.2, and 16.1; see GCC bug 124851.  This data change does
    not affect TZif files or timestamps.  The change does not work
    around the related but less serious GCC bugs 116110 and 124513.
    These GCC bugs are all fixed in GCC 16.2.

  Changes to code

    zic now rejects Link targets that would have invalid names, and
    more efficiently processes Expires, Leap and Rule lines with years
    far in the past or future.  (Thanks to Darren Carreras.)

    zic now ports to systems that report lack of link support via
    EINVAL, ENOSYS or EPERM errno values. (Thanks to Tom Lane.)

    When tzset and related functions encounter a TZif file that is too
    large for them, they now consistently fail instead of sometimes
    silently ignoring excess parts of the file.

    localtime-related functions no longer mishandle extreme timestamps
    when given TZif files holding some unlikely timezone histories.
    (Problem reported by David Sarkisyan.)

    localtime-related functions no longer check the values of TZif
    files’ standard/wall and UT/local indicators, which these
    functions have not used since 2026a’s removal of the old
    posixrules feature.

    tzcode has been ported to Haiku.

    localtime.c now works again by default on AIX and DragonFly BSD.

    zic now rejects ‘:’ and ‘\’ in Zone and Link names when running on
    Microsoft Windows.  (Problem reported by David Diaz.)

  Changes to documentation

    URLs for release tarballs in tz-link.html have been updated to
    reflect their new canonical URLs on data.iana.org.

Ref: https://www.iana.org/time-zones/releases/2026d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 400938b8ca41654fbda6c34c6eb8c12aec1f43b0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4271b306486..441dc9be998 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026c"
+PV = "2026d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
-SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
+SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
+SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"

