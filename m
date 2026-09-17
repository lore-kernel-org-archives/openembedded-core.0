Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCDAC982D3
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 09:42:46 +0000 (UTC)
Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35580.1789638160040347316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 02:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j3mzVz44;
 spf=pass (domain: mvista.com, ip: 74.125.227.142, mailfrom: vanusuri@mvista.com)
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f0135fso5942755ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789638159; x=1790242959; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukI5OJaMXBFKzCLLsokG1InFqwmqX33GXZ6Cd8ddrmg=;
        b=j3mzVz44Y8yRG8nlB69uvxsR4I4mx2YdK4U0aozRrVQ1kcpkSVVKrzkJemx4sq6qbF
         7rIxu9KNdUNbCS8jP+VwKmj2JLZmTKk1boBBHZBpyEhjhZgUQFYM9zTQ587hPqIgwd0h
         vLGYeZnrla16iyEAgn7i10tCEP1XQjKqtTHGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638159; x=1790242959;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukI5OJaMXBFKzCLLsokG1InFqwmqX33GXZ6Cd8ddrmg=;
        b=qpWv748DZhbx19kikPyNZy9G9wjrDsBGL8T1D9vYy9mvfVZ8WnodDM5RSHW7kXZ9eD
         sGwZQqSDS4ZT06wPKPm/6i6WRj9E8Wfi4eW9aeKNXb03LcHVeeNnxf4r/8ttCCQkxAYM
         1q+zuwUJsfbDMR4WVhbJPdhJ8YEcDVfPq4VgCHPCAUBQHChD7DSImB+opRIYpqqEJ0id
         BCi8PGixzdT0k86Jrh62AwQcG5f5G/j5ca96yxafrbgpih5QmrG4dI38Pnrcj5OI0gMO
         rI2APtPvnXcBhRQYCOApDtDGbPuKbIcYPT6fP6Df6JlVxs7IgKuh19CMR1tqnT1RPmFi
         tV6g==
X-Gm-Message-State: AFuF++nciwsqL/MDfmBmY2IsFTy22/VFJRkOcu4aMXVyBz0DETcAOdBx
	Jq0hzDC2FFGkja2tK8EDceUV5Lkeq9JpjcsF+3w065J3U8cspsj6BQ3DdqIVMF5F2vLmG8zXFy1
	CM+t7
X-Gm-Gg: AYBFou01NNT8KwAtQf0qbTgRLFO0EHYaGIPB/Qf2a8hYiusm41Pm0H5JkmnPL7l8nfc
	QLSGkzdG9SUzSuXXBEJFgF2hBQM5Ardzrav8vcZb7yw7WSHuXog0jl95R3cYAQpVI3sLJNzeMu7
	p6yCrn5qliyua1BKK+McMrCr8Iar+y4FwgtyvbDMANtMnV7FcD5O9bcbNUy/hFFvdy9Ex4yW6H5
	9On66x+gWv7UOw6w+HLebP9ns6jduNPf/NqdVz6koZtCpp8Biqw++INc38rv+whCMU8Gph0p5FW
	b+7c+n1hldsgxFNKbBwWLBTBtLHwNBb0U94r1ZHazm8+KmIahqF3TvLwUs8r93gVFgUQHFDVHJ3
	F7BShC4B1Pzkpu0sYO83avFnJpQohx4qCE7IMb5ode7Q7PzQcKX22cfbVl7v/Fspu29+s+tymlM
	H6+pAfCCzqqmXUm3qxM7Z73AQ9YjQi2NE25isXXjV4o4OEV6yk6ejMxWMUrIfGIO2qSkcgOw==
X-Received: by 2002:a17:903:1b2f:b0:2d0:cc92:f7c2 with SMTP id d9443c01a7336-2dd8dd1a7e8mr130622545ad.1.1789638158822;
        Thu, 17 Sep 2026 02:42:38 -0700 (PDT)
Received: from MVIN00352.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a93f1fsm14757870eec.11.2026.09.17.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:42:38 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][patch] tzdata/tzcode-native: upgrade 2026c -> 2026d
Date: Thu, 17 Sep 2026 15:12:29 +0530
Message-ID: <20260917094229.68711-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 09:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246050

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
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 8939cd2cb5..38f7f7bc38 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026c"
+PV = "2026d"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
-SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
+SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
+SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
-- 
2.43.0


