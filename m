Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8A4C79FAC
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2590.1788641123320811011
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=toVlawPQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1334651f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641121; x=1789245921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=10nuvAhDMx3wwWeoSWDSjS9j62VcGKBKpFMqm3Fp1B0=;
        b=toVlawPQ/D7mVRlEdR7CQoiUTfMR6nWzRTOCpNtrfVdDwivpH7m4yr4bH0Hyzi4oOF
         A4vhZ8PQTpOcgpsvysZ55hMcDQwzCAwp4OAMnJe+s/X6aZ9OBtkbmGGXY5Qo+jRE1OLu
         auD7j0wn7X9eLX7xEuEC4B1IkgpU4HlkPZvmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641121; x=1789245921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=10nuvAhDMx3wwWeoSWDSjS9j62VcGKBKpFMqm3Fp1B0=;
        b=GCgtAh+4+tuASHNPVgc/hJSrMwC9n1dwIdworpQBHwQLJ9jkNjlN4+XjYOmvqtrCIB
         8UtiHD2LCdFr9XstFeBriL++8AyJgaUIfSCJXahIoJh+GMvk5J1kbSnFr6h20oWeS/vi
         8jfgy79s1WBfy60P61zEOLR2LMvp1dcGFgtCSPL+F/DhwBPI1yg0xf3zZguy5WoitVaO
         y0UNmqQrIYZlTvToGRDWTNnes8q0G4tEojXW+jCCKmrgjxQppDln/fBlb6gM67P4KvSF
         HJ7eP+lQFBMqagfQEgmglZ1p75Uyl6jHvonMoCoo0WWRakE9Z3IPbJuPRyjhZdmv5Q6R
         xLNw==
X-Gm-Message-State: AFuF++lyCXAtVSRECtK3g0LnZ1jRYtlQ+M/9diJXVRIzxKje86uW2dtj
	6fWY0Sx4BLW/Jvx1vdqiRMdtRGNkQWad75sl8ZVaOMZYSOPjHh6lZCImAjGCpHGH1lM0iIxtzKN
	yKZW5YYs=
X-Gm-Gg: AYBFou2wyEotVwMefPh8ZSQtcy0YXrzANk+Oqfnq98Q7CTRnMICR+Kpeb9fy06zxFww
	9ko9+qx9RDhrxF/C725Q1ivOQMIyjcHrwxNW2Xvnh0NtIiEhBcXB2xnOZD6WMwmNdC8EnfzUxNT
	BeuUuSDdKvAWIBCS5TTJ1hR0ne0fCLp8D2Qiz8eYh9kWM7Vgu4NzsJnuSUoMXxoCtdGri70lVaX
	RJW0ld9fvMExC4oq1kXn2Fvcq9YTAP7z/gXcvbezdfE6HbM1STxfozDuKzzHSyPLcLtxML7AOC4
	r86dojHb2FhzulLavWYbeJVCbKFlPp06dbh8glIOYJimafJA7fpXzFx3OFqhXdeTj7scDO7XZ8D
	LmulY0b5WRBq4YYQU3PEqDFPCbsOozfFLMB5LWfbNnn1VmNPU3jp4OoPtEBKOB/ZTgSX34F2FZG
	CRbyTBnoRmw5zAD3pFL237dQDkZ1v979PQFzYWKElIRH2ZKTYLhqJjL98+LMqlYrsgp3HOP7lEX
	yJTbn7izIpDbeQbiq8rjgc8EDQKJ5JCPO0RQDVkkoF2RRw1y9GFMx3iGP96D/Ykyw==
X-Received: by 2002:a05:6000:4710:b0:485:8a47:5b83 with SMTP id ffacd0b85a97d-4858a475c60mr11730000f8f.32.1788641121650;
        Sat, 05 Sep 2026 13:45:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/40] libevent: set status for CVE-2026-63380
Date: Sat,  5 Sep 2026 22:44:21 +0200
Message-ID: <bb412e457daaa501a781a1dcab4570a149abd9b6.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245172

From: Peter Marko <peter.marko@siemens.com>

Per [1] this only affects 2.2.1-alpha.
Also [2] markes their versions as not-affected.

[1] https://github.com/libevent/libevent/security/advisories/GHSA-3rpf-frgx-xq34
[2] https://security-tracker.debian.org/tracker/CVE-2026-63380

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libevent/libevent_2.1.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevent/libevent_2.1.13.bb b/meta/recipes-support/libevent/libevent_2.1.13.bb
index 431018f0f35..222d4fd5b3c 100644
--- a/meta/recipes-support/libevent/libevent_2.1.13.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -55,3 +55,5 @@ do_install_ptest() {
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
+
+CVE_STATUS[CVE-2026-63380] = "fixed-version: only affects 2.2.1-alpha"

