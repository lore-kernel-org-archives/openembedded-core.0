Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.5962.1609856781153091127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wVRBc+si;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 30so16676977pgr.6
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Dfaekm/VSqEGj/2V1vxdWyRAVm4rWV5oFJBrOePjmmg=;
        b=wVRBc+sij7vD6Ykdka0t8UPsHENXqeE0uRFXqw0qHnJ5ij4ZqiJVfS5feLLDSvPfgA
         n+gqg/eOYPcoRehHtMdf8rEtJ+7El+PIE7amG6rHhLQAGioHfztIe4dEstWt1VodQ4Nt
         I5+UWJIFlZjAT18wl9h8Sok9PSLolfLwJe9fWgsZypi4nSVE4Ov9Jqljb/gK6SjBahgz
         hlkpxZKNNzAZZBCY5iFNlh+y6cRnCMrrqYrWsX9z0UN2htuvxpgLuOhdyogH6yC+eCQV
         JHEkbREwr4EBrtwGzK5jSlehu19PcN8050/Hxu3AXNJSxAaUFSJxTDzHJ5VhyybmrynF
         GmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Dfaekm/VSqEGj/2V1vxdWyRAVm4rWV5oFJBrOePjmmg=;
        b=Pm3s8YvZcvxRpdIDoD3PnN36iqSwUGZMAWeL3Q3GUJT7w6NqIdmOsqRGFCPry+/+2L
         DnfNZTSuB6DDLnkWIcAHlcuexpAQF8lJq8N87f/u4nf0A4jKhi5frnO5/qyibaPhFLHK
         7ftf5BFisRGz+5GuSn5RGAuseLTxs2daoeYfPVt17wC69g77xoBCV83B7cf5SeQmerUa
         nFBL7MZoZ1hR2Vb3kqYdAzaeo3gabiBNDsvWQPXkmAi5iKPGGpq25LPBEd5R/VIl8FXG
         Jfq/XebrtwKhMiCamN9KsiZNbK2oco17Gx14XMtFQijIYoDDggK+tW4qKdt2a54JZjXS
         5Z9w==
X-Gm-Message-State: AOAM533VV2Fiw+XmYQm5tYPGfI9hhr0iswsELNn2SYE7xq6/+4rDnwuC
	ZdQa1FEA10+MXWFIyE3COGJ8EGJDE+9uaxvTLFo=
X-Google-Smtp-Source: ABdhPJyk0OmyPJCJB6MjAwqx+CJejMculrtuQE7V7f4YVkgaB5lH/e6heXYwzxQx92ip9EX+8thklQ==
X-Received: by 2002:a65:684d:: with SMTP id q13mr75472464pgt.372.1609856780290;
        Tue, 05 Jan 2021 06:26:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/30] timezone: upgrade to 2020e
Date: Tue,  5 Jan 2021 04:23:49 -1000
Message-Id: <a787dc37d47e1ccab11c7d867721d832ee57d73a.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Briefly:
  Volgograd switches to Moscow time on 2020-12-27 at 02:00.

Changes to future timestamps

  Volgograd changes time zone from +04 to +03 on 2020-12-27 at 02:00.
  (Thanks to Alexander Krivenyshev and Stepan Golosunov.)

Changes to past timestamps

  Correct many pre-1986 transitions, fixing entries originally
  derived from Shanks.  The fixes include:
    - Australia: several 1917 through 1971 transitions
    - Bahamas: several 1941 through 1945 transitions
    - Bermuda: several 1917 through 1956 transitions
    - Belize: several 1942 through 1968 transitions
    - Ghana: several 1915 through 1956 transitions
    - Israel and Palestine: several 1940 through 1985 transitions
    - Kenya and adjacent: several 1908 through 1960 transitions
    - Nigeria and adjacent: correcting LMT in Lagos, and several 1905
      through 1919 transitions
    - Seychelles: the introduction of standard time in 1907, not 1906
    - Vanuatu: DST in 1973-1974, and a corrected 1984 transition
  (Thanks to P Chan.)

  Because of the Australia change, Australia/Currie (King Island) is
  no longer needed, as it is identical to Australia/Hobart for all
  timestamps since 1970 and was therefore created by mistake.
  Australia/Currie has been moved to the 'backward' file and its
  corrected data moved to the 'backzone' file.

Changes to past time zone abbreviations and DST flags

  To better match legislation in Turks and Caicos, the 2015 shift to
  year-round observance of -04 is now modeled as AST throughout before
  returning to Eastern Time with US DST in 2018, rather than as
  maintaining EDT until 2015-11-01.  (Thanks to P Chan.)

Changes to documentation

  The zic man page now documents zic's coalescing of transitions
  when a zone falls back just before DST springs forward.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d7643339b4db6609b2bad1f76599a54da9d17f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 5368464f30..d175f0d4a0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020d"
+PV = "2020e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "6cf050ba28e8053029d3f32d71341d11a794c6b5dd51a77fc769d6dae364fad5"
-SRC_URI[tzdata.sha256sum] = "8d813957de363387696f05af8a8889afa282ab5016a764c701a20758d39cbaf3"
+SRC_URI[tzcode.sha256sum] = "3e10308976b09305d15cb4a32ff75483421f2063bfa24a9be366a027e7cd2902"
+SRC_URI[tzdata.sha256sum] = "0be1ba329eae29ae1b54057c3547b3e672f73b3ae7643aa87dac85122bec037e"
-- 
2.17.1

