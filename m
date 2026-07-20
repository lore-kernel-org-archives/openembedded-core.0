Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E72C44531
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2887.1784568230362778133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M6EelP1j;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b966dd74so44198725e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568228; x=1785173028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cvl40ylSj//ZYPWpz58sDO4+jy9TZukzrtBVAq5y9lo=;
        b=M6EelP1jcw+YcMq1KvR/f5nyf2+i5O+FFrWbC/jK7HlM0Fs2RNxjPMo5QpftT30GiC
         3fqw0aKfvey5iq96vJ45scl0nCHBomK3o3vEpO1O1mq/q84KIRArZC5GSko4ajzNwyy7
         3vGwPWTIcSZoVaYjDbLrfizmPzN4a8S9yfDy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568228; x=1785173028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cvl40ylSj//ZYPWpz58sDO4+jy9TZukzrtBVAq5y9lo=;
        b=mZQEFxy/hI9Wcktyfj4Qh6JGiv3+xaVjqsZ5+ODa3QPVvKDZLX661cE7VNqXqqSYy3
         MX0rhrCADVw4oqs4n/F/yfZhpdztxdK8dQRGhiqj3CApokLKEq3fROASOjgUXPmC9qMC
         04+3nqneFMomDLtxaST0nw5cUvtxeLqiXkoejDilmorbTXMq4HSe72h2OJ3p/M953yon
         8aXNxTZ4iaw3klV58fHzSvAAEWKZjhQwXQwlfS0GhJgXHUuKGUHRIu9hodRUAXVGdugu
         jlmLjeypKUKNr1GjoFTSF2JgNkx8ZEW2NR2UTlnSky3JKTiOAtCVRsd1dCXSeYawcYva
         XQeQ==
X-Gm-Message-State: AOJu0YyOIizfXGRYFhcePn4P5IvkSXXWnFH7rxuHOh00DJ8WicPn9dBP
	IEmy6t3Q46kEKDCQg4m4BORpwtPZQPHh7MK4p7oKn1Pbqb4OSKj4ARUcK3cCVUtA1aqAmKKaHw3
	nTTdjtsI=
X-Gm-Gg: AfdE7cmobbhOqcrtjbKbxdSmmt3oIjj7aoVebDF03UWYBrNYO9zaHxUGIryN9pA2ES3
	8VxJoJwHN0tRS333YGbX29nptiaeDDER+C91dkBvbFNs2MZHfzF3Nn7ORNCvcbbwIRiCKDkwy3M
	wUuuN9ic1FmSYFIYx8YeVcliGi3h2BozQg9CG3YaLEGdgQbOtejEhp7ZHUuKVtWKpoM42I0G+fa
	o37uIMneiGsMN6e7T18nj4R26jmcSSn5PE1uZ4TBcf98NfVldxcInnRDBggJ+4B+lQdR32sPe+J
	AMDDI6ieXhnWU0p+77Y014p8tCSCE1eCz4yHJdRQW+UjRiYphHlNe8bp8+LDhyFjhiCe9Icwqkh
	3V2qDKRGcVG6YT+z/IDnIoPiacYGIv48nnwcIEl5iR/9Wxa7OSH2irf+oyBoFyE75RNFM07OHqM
	nqJU338p1yPyhJTuUzgyVKnOH30iZDL7C2+D9p8MMw/NswaWOjEWY04jmkEZGxHJemKOI36SvN/
	rF6NHtw
X-Received: by 2002:a05:600c:6212:b0:495:5375:2510 with SMTP id 5b1f17b1804b1-495537526b4mr105901575e9.24.1784568228501;
        Mon, 20 Jul 2026 10:23:48 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/33] xmlto: update SRC_URI
Date: Mon, 20 Jul 2026 19:23:01 +0200
Message-ID: <bba1b56e487dac60074b24adbe4c536882c8ce61.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241462

From: Ross Burton <ross.burton@arm.com>

xmlto was previously hosted on Fedora's pagure.io server, but this is
being decomissioned. As xmlto isn't Fedora-specific the repository has
migrated to codeberg.org.

>From discussion with Michal Schorm <mschorm@redhat.com>:

  I became the new maintainer of the project upstream and after a
  discussion with Kevin Fenzi, migrated it to a new home on the
  codeberg.org: https://codeberg.org/xmlto/xmlto

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0046c780bf612aa7946023f8993c45f0c0b65c08)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index d5a0e69849e..b7bfdb69bf0 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
 UPSTREAM_CHECK_COMMITS = "1"
-SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
+SRC_URI = "git://codeberg.org/xmlto/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 PV .= "+0.0.29+git"

