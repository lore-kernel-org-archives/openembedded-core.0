Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B988C7618E
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.454.1679092988586651486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yN/cYtKP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so6788795pjz.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/WHw+1GrJT008LHZgharZ7jYRSXiQSnTSrnXAUiifY=;
        b=yN/cYtKPx1hjt8QuT+6iLOonFzlj2V8Q0ukuV9GherMBGvg8oq1WH6nLa+DgBbsLgN
         OnA6zwPTIY/sGmwcBeq4meTdaxneDUDlyzOMDoy254RX0M7Xm839RNvxMXUMuLOdJpCK
         XjuCB/D3cgGvYg0Mpx9cNAYn78JW92BA6QWfY9vNdn+Q0WgGhQsrxm7Q64SAcyBkek/W
         YrKe9Mt0K0b0TmZohEKdD6fdEDWdO9yE+4uMlzwAd+WVJpc3mnCuZ3YAapEfVHD7CwD/
         tJDOSugblB1xhhTDyI3jI22VVhQaRwWY4bQcXoHaKfSLkq/GY/UWF0NVz/VA7U8o5uV3
         YKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/WHw+1GrJT008LHZgharZ7jYRSXiQSnTSrnXAUiifY=;
        b=LezFs2vGkpFxdv+uCG4ijG67pqGE7WnGRN2gO+pqRHzuElq7GxteTFB811tpRDbGsW
         6GZsR28eA4eqM2IIst9apstYBhZ12odIqdiNtitCAJ53FjfWkBJk68qSdSqKJHz1jtk3
         ZX+vp9aMP334P6tXFBQ9OwU3WmfssaN3fRZL6aRh+rrV21n56K+adEKbsRlvT0bTk2Lc
         Sseqdp8HFfRpWRoSHTaDiSvXNqdQjpCR09E8w6fn1Z1HMgFmEgi65+59T2HVjG9LQcW4
         GwsXT6sZXiRAIfmglWI27TvII5278EMiQM1N9hNHNnytd4HDCX8NqLGtBvRT9XtJvBO5
         RZCw==
X-Gm-Message-State: AO0yUKVuQWCvI6Ow5AJDkq1Fq1m8FEcurll1JFQGlBGwD14rJltgjiRs
	2oVtqoVq2qBkDJY2z9JpATCegly2vYyqgPGlEDY=
X-Google-Smtp-Source: AK7set/h/LlSBpPuOkdtNZnqdbytGHRkS7u5rJjvGfiKv/WVxqs3Q8fCmFF2xgUSIpFHPXFm+ARV5w==
X-Received: by 2002:a17:902:ceca:b0:1a1:86c9:e30b with SMTP id d10-20020a170902ceca00b001a186c9e30bmr10203477plg.53.1679092987790;
        Fri, 17 Mar 2023 15:43:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/21] cups: use BUILDROOT instead of DESTDIR
Date: Fri, 17 Mar 2023 12:42:28 -1000
Message-Id: <a42066657c002679adcb471f329f09c8996e1b64.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178775

From: Trevor Woerner <twoerner@gmail.com>

The cups documentation is clear that the correct way to install into an
alternate root directory is to use the BUILDROOT variable. From INSTALL.md:

	Use the `BUILDROOT` variable to install to an alternate root directory:

	    make BUILDROOT=/some/other/root/directory install

DESTDIR works, but we should use the mechanism the project specifically
created for this purpose.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f8fc70674e0ea5df46969a06da62f8ed135cae4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 4592980766..cf06c9f1b8 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -67,7 +67,7 @@ EXTRA_OECONF = " \
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
 do_install () {
-	oe_runmake "DESTDIR=${D}" install
+	oe_runmake "BUILDROOT=${D}" install
 
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
-- 
2.34.1


