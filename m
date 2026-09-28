Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D461EC9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:49:21 +0000 (UTC)
Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57650.1790599753510280350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LtK+l137;
 spf=pass (domain: mvista.com, ip: 74.125.227.168, mailfrom: vanusuri@mvista.com)
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e2a68e185cso5552405ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790599753; x=1791204553; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t5ai+aGzslxzuJ6Pq6zvdA3IQllC0BOx+pwa/TLH5Vc=;
        b=LtK+l1376nsLeUIwDaBJ3IuMxTQyHvcW7P//SWWjbhUVZ3NGJ3Ea+YyVKNCCSWM4Ee
         uFPfIWrlrw2r6ExVMPiWaAJ7i0Ze6T2LKT/5TnTZSv/2zIax9bP8ns8hcw3a5U6TBcKk
         Kl4w91IAcWmKssZTmZtIWtF0FW3TcA5BHg2/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599753; x=1791204553;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5ai+aGzslxzuJ6Pq6zvdA3IQllC0BOx+pwa/TLH5Vc=;
        b=hdb1rpGKAt8Y2YnHZ1qrdT9LSCFwSGdyCHuQKw/KCbpAdbW6ZiYQGIsk7QZbzjpRfO
         gIzmkfBiD5bRfH2O/mJhSgHa7qQ3vG3Se7+nOVo1+ba6uJq60YIipcK9xSYVQDcxr1TR
         MW0YDAdOj5GR522OmceRxwoZLPFLoDfEwNasMX+8nKHmUwe7mXo/jfue9fUY+ESY37rq
         tpEBvTYi2C5Uz5n8AcPPmTj15Y2jScR9aHyqiWyIRI8PAk8MVnj//e549cUe+smVlq6N
         seMHaU3VssfV2esYi5gPJrdUwJssaftO0W5mIaWr694SN1/lCwCAE1ZzcIxACYTPtZKC
         cCCQ==
X-Gm-Message-State: AFq9FYIM3Rr4aF0Nk12LFW6QqPrUiYUzgORAjRKCB/YY0Lwkuzu7BsHO
	spCvt1xvy/wj2uNtYuhQfCWudd19peJyFaGckqtJeteF1Cu8HtfHe4uwmrrxCMBXbB2rdlAKm+p
	JhZM5fag=
X-Gm-Gg: AYBFou1x2EpcRtzIjAgSUY7B9dGi1wT+3jdNwFAAs26rGC6QKd4wqmJ5oTaJqt06VDF
	Yev94LQ+EDwpK5aQHWBGbMV5d8INyqgiGtnr2MPvWgQknVyvjxmjN98KOQgw9EOJHZZpCR3o90u
	Xi1hDS/IwKR8XhVU7AcifWOc2miTGnBC68j6muLunEl2R41GpOLQ2MiUSk4+NSJmvZ+n+P2uR1C
	jpn6dlRbUlSDhM9+NK4eqOPF25Qwi97HHo/Fx9OVuim935EQweVZMAthh3P6TTmjIBBLijINwdZ
	+EmaYFoojVl/7Fk0ERP9xRE3Lwj4djehzUaI6mSLO3EWyx+B/1mFWI8LMgPo0iqaRD0Z5qG890S
	5H1sMHYD36BJCg5eg65v1V1usSgrqWHbzhov6sZYEnglWnmN0v2mfxtgeTKSYq56GuHleIFiLQ7
	8M/pLSYrqufFSAD79Z/5K1HApcCrYyt9dKyqM1LvnvqlMZ9dBY+ZMw2XO2O8c2Yv5KwIUdeTdW/
	VYpoPYjPRiCnPpBSZs=
X-Received: by 2002:a17:902:d4c8:b0:2dd:ad73:c938 with SMTP id d9443c01a7336-2df7daa9ba8mr93133805ad.25.1790599752690;
        Mon, 28 Sep 2026 05:49:12 -0700 (PDT)
Received: from MVIN00352.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913dfe98sm40971515ad.22.2026.09.28.05.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:49:12 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose][patch 2/2] tzdata/tzcode-native: upgrade 2026c -> 2026d
Date: Mon, 28 Sep 2026 18:18:48 +0530
Message-ID: <20260928124848.1781687-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928124848.1781687-1-vanusuri@mvista.com>
References: <20260928124848.1781687-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 12:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246762

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
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index a09da2617f..6a65f2deb2 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026c"
+PV = "2026d"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "b1cffc3ace4c4c7cd0efba2f7add86ec3d0b79da48bcf03582671fd3c8feace8"
-SRC_URI[tzdata.sha256sum] = "e4a178a4477f3d0ea77cc31828ff72aa38feff8d61aa13e7e99e142e9d902be4"
+SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
+SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
-- 
2.43.0


