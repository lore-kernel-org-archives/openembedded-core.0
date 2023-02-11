Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CC6C64EC4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:47 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.19582.1676150678598042114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iXjHS4I5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 7so5940357pga.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALxWNtOlKGigu8qYqfWNxs1CYFjbbV4Zc4ZBYjXFvqo=;
        b=iXjHS4I5nqxHZun21XwtTuBny5Ytoaw3JATtjp6OYDXs8IQ21ymAoP1Tzqgknx+Vjz
         rgNqX/ooZIzPqzv+Qh+fl9UZu6LbfGZ54MYRr5SmAA8y2BpEOx72O7Uh+u+6y4AYZfbj
         KviOekZDv8F1GcihIg4I+6FqgDFxMiJc8suhX/+fr5SAwXwLcobJJYNhy3eney+xcTTz
         X9fgTi4Txa12gDo/cOat6RGpp/2j+1GIcaTPPOL9eoe7jk5UX0vLBQvUtDI2UUMlp+7L
         GPD8XF48XjdLkRrM3vwk4zmtX/rri8DGycLXsgE2/PgaPQ+icA98Wm7wTNW8L7w46cVS
         znBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALxWNtOlKGigu8qYqfWNxs1CYFjbbV4Zc4ZBYjXFvqo=;
        b=NaDZU6fWpK1Ui00d66wMLttH8dao7FcYupaRbeZ1bD+XPWg5y/06q0haxT1C3yGdYf
         rugJ9QHTu2Y3KTRzdyfzSoboMa5lLCFIU481mJhWtQxxnk39vz+81BPyfD48hqImbf/B
         4xvvXYSqiLIupRrCYzx/RQFmR/Tcyx7CokV7olNnqrRyioewy3UTTX35ULV1XezD1tch
         0+ZkwSrsfov/eufY58o9DRKz7q8mE1jU3o/Z6WGJPjeTWqdySD4KGafBIsmQV1KKwmi9
         1XhAOk/1tnYSJMpdMIqzJTv/5l4ThxsEFIvzMaHstvpdDZ/5dbuC1+F0NYdK4uWDM/sD
         XyHw==
X-Gm-Message-State: AO0yUKXsuN3Sh7JDqniV/KVJcDyKj0rUrLS2TAtThPb9PLoXS2pNBetN
	F+s9qeAC0X+HC3nn8R//YSOYJAHKqBpV+P0CX+8=
X-Google-Smtp-Source: AK7set/fgyubzyty+nce/XAuJ8ZUZFpzTOLgYD2IlXgon4ovCyuolh0EV/yYN5DXAnT+dYNRuWdK1g==
X-Received: by 2002:a62:6457:0:b0:591:3d20:3827 with SMTP id y84-20020a626457000000b005913d203827mr16493569pfb.21.1676150677658;
        Sat, 11 Feb 2023 13:24:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/28] perf: Enable debug/source packaging
Date: Sat, 11 Feb 2023 11:23:46 -1000
Message-Id: <c1f148fa51c541bd806376f5eec93fd348e87583.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177033

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was disabled in 2014[1] due to an error message which as far
as I can tell, no longer occurs.

Having debug information and source files present will make debugging
reproducibility issues much easier so remove this line as it appears
no longer needed.

Fix up a few files which have buildpaths in them to avoid QA warnings
and reproducubility issues.

[1] OE-Core revision c1b5a262c0201faf2c6bf545d6acb32dfe383ba3

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95983108121c8b96f5659d110498bf2afc6189d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c1b0bd22d8..4088c67662 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -356,6 +356,16 @@ FILES:${PN}-python = " \
                        "
 FILES:${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
 
-
-INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"
+
+PACKAGESPLITFUNCS =+ "perf_fix_sources"
+
+perf_fix_sources () {
+	for f in util/parse-events-flex.h util/parse-events-flex.c util/pmu-flex.c \
+			util/expr-flex.h util/expr-flex.c; do
+		f=${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/$f
+		if [ -e $f ]; then
+			sed -i -e 's#${S}/##g' $f
+		fi
+	done
+}
-- 
2.34.1


