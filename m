Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9026EC9830E
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 03:39:56 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5436.1790739589980959198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 20:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DFFm9Rct;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso2196046a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 20:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739589; x=1791344389; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7L4zwfTiMGfavto/F7hfx3hWYN370+YU6fIoJnl8300=;
        b=DFFm9RctC6ZI1MlVw49dbF5lbCXeVjUSUQfDiVlDcCyqSTs6eFnLyrc9DuIhNLlzL1
         VAdtXqIKkgIXi9raAEaL29sJI8zxXSwwSvl+2boZcTQJP86k3yA6F4cgw5WbcVJdNwGp
         VNgfrAccP4XP1+4KcrnoKwGDDJpb1z2xXzjgwLUzkxxO6XUmSevEtQxQ1KGuELJoAL1i
         P1jSKpyDyHCmw1hTP11M11qeNQGWqE2q3svRkM6ELW1eUAvYZzsrupj6dIXBBIXsy5m8
         kW5SSTsiWHKJUzvfSE/3zwqlb+PFCnRoTwPzFKrGBFMXwsIXkQ9E7jGh8c4xcwhRPFT1
         ywUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739589; x=1791344389;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7L4zwfTiMGfavto/F7hfx3hWYN370+YU6fIoJnl8300=;
        b=jT4WNwz9iEw+9dg0gHCgVW5dfX065p4xTAtsuaqi8IqH2U/xXPh0M1FBLhBlLYB0eg
         qYUi4uWAFSUNovH8r6G/HH8qmPtE2xToDfXglgzoYePCY0aPGp4nFjohsdnvFTB69QCK
         JT4hHBzjSKau7MbSTBfVIbWGgMfnGMrfZEckn+ZLTgHW48Id9VeSriCHSBpcCXzyfZPS
         Zb5ddBCi+YjFE6uVwLQ4Rz89JqkMYckkE1hqMx2oDrkPU09XINfRIYciKqNQivWF+BIt
         AV3z1ahTs8awIfsX77b1wjHqveH5xD9UVpe2a/odeldvWXMecbjLWzhadgP/3gwX2qTk
         HBWg==
X-Gm-Message-State: AFq9FYLequG4lBjiJywoEwdOlB88R5AgdVPsKk6foiE26kmreDj59nix
	v7l+BRRv/BEE78LlYehr/8K5AkgRRJeNVQ8n9g6jkp3e8LzQ62KgA4LdjQGDsw==
X-Gm-Gg: AYBFou2VA0DI8xMmQlvxeguCTWINcAMTTS6B3OpNxe4eKz8i3g8S2sw9xhNqgXjXikR
	d07q6aPpqZwhqJajJTtWfmFDeCSXUShUk+Q0BwnweFuQdKQrio2HTdjyvNSrzsYtYyTfZ2g32P5
	yPUBAlcDKJ18DBnhFeDJaD3q40oNq2FsiPpJ2I0JnxZplbi++QNPXToOcHk4f7j068RIecFDq+U
	onGMaiEl41e0z2iyPFEpIycnBScnhFrjG5ng/M5p+muuZ8xE5TYvEAn5mTImpdIoltRLwtF4n4W
	iARORjYpq9ADKyE4lKv7f6r3QwrFoVpIP0c77Wp4phaRL0DiMnfWJ6caCh6Pmy3fBsu3V8J7FE1
	ZB7OEUD4O2Q6hjfrzlygBsSv9yuw7fQfpB+lI8nbv9YROoudH4+pVq1EuLmesOMsGRtsSmZ0JUt
	nFFSgo/naCwuy8EEF80JTjtWc7lUuS7EBWc8O2VuXM3DVisWG0Weh6s0VNRVahKfzyOHHqVVXTL
	MixDq1SBXZbABHEYfxq9ARuxkOHZnR1stnL
X-Received: by 2002:a17:90b:3849:b0:3a0:c3d4:f3b2 with SMTP id 98e67ed59e1d1-3a4d1b9ed6fmr107452a91.56.1790739589266;
        Tue, 29 Sep 2026 20:39:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4caec0f28sm1109768a91.17.2026.09.29.20.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:39:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH] tzdata/tzcode-native: upgrade 2026c -> 2026d
Date: Wed, 30 Sep 2026 16:39:41 +1300
Message-ID: <20260930033942.3470416-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 03:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246904

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
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4271b30648..441dc9be99 100644
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

