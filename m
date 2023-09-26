Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2123E7F138
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.3616.1695764615117947125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VMIuycma;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c5cd27b1acso87269485ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764614; x=1696369414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH03L8IWduQ98NEjm2WuYgRGFzggEERXCTxCS85bs6c=;
        b=VMIuycmarvQ8ttBcsepV6BfHz7BniIaFAJ3GwPcP7mpx2ZzLaXxN861IxYRJSRYpZX
         uM+bWkK5m0LG9i5WAN5J/QKCDe2gGuFFveGY72zP7ZE6S00MchsFT31rka4b9X51OxdY
         Ef8hOcA4VRAOeV5Qr+mEQ3fN2m4kFOLldikc6j5J9PR7ID+jHiSb8FVNjVOTjLeZKICV
         pdQfKOBmemda1QZFduZB7qd03wUO6hmeGkTTX2shf0NUmOfKKX/NYh3Wi1KjN4UW1yju
         01xIzn2Cch9g61hn+kJKCNMxNXC3OZIj7gwBm9DE16NI1zZ7QG/3FF6ocHGqGp5f7tQf
         XFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764614; x=1696369414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GH03L8IWduQ98NEjm2WuYgRGFzggEERXCTxCS85bs6c=;
        b=R1/FWvHdeu6YpZwpDEQNiwMUVEoXPcqRjVIlCDWHq6WCLKInUgCuAlEOQRowezL4bE
         DetsbyNz7rbIEyUEc1Bswx/CwbJDGAUw94rwg8UOPbdYsf6J/0kJ3EXUdps8i3VHHvMW
         qiIBIupNe+RscpmYdvZ0DxMYhitJSplGBU0F40yGwY8Z7Ci+Dh4qLY9Vp6aaxld1rSb9
         zKC4uQJnib4Gw30p4LZqNP0MC0+ulTxf6Q3ZYqffeLNSWM5HF4p+44z96JM5eT3YoVt5
         hA1yFcr74uSjkRB3bPU3UCuR3PPuh4q75k4l7RlCj/J9JIuMaEUgvMQem1wpeQgwkxcq
         D5sw==
X-Gm-Message-State: AOJu0YwCbeQdDpwd5vFyVtqhucxiEVI0MCu5J2NYneDGuHliF4pxLwyw
	NgP83Q6PKdXV30aVMwalF1D+IdANNA6nhGIAEFw=
X-Google-Smtp-Source: AGHT+IEOZnV0KKL0w67A24e+VKGBm84g7hzVMTUgklNxiC20JtGevc8oRcGJmyicIbQ9HH54yvBaOA==
X-Received: by 2002:a17:902:d506:b0:1c0:b17a:7576 with SMTP id b6-20020a170902d50600b001c0b17a7576mr8634plg.42.1695764614200;
        Tue, 26 Sep 2023 14:43:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/10] bind: upgrade 9.18.17 -> 9.18.18
Date: Tue, 26 Sep 2023 11:43:14 -1000
Message-Id: <3cb92c8746f589ef74e337e5866378e04a8133ef.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188273

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Deprecate the 'dialup' and 'heartbeat-interval' options.
 Ignore 'max-zone-ttl' on 'dnssec-policy insecure'.
 Return REFUSED to GSS-API TKEY requests if GSS-API support is not configured.
 Mark a primary server as temporarily unreachable if the TCP connection attempt times out.
 Don't process detach and close netmgr events when the netmgr has been paused.

(cherry-pick from commit e78ec619beea6e541b2d83a5dc845ce57ff12564)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.17.bb => bind_9.18.18.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.17.bb => bind_9.18.18.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.17.bb b/meta/recipes-connectivity/bind/bind_9.18.18.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.17.bb
rename to meta/recipes-connectivity/bind/bind_9.18.18.bb
index fa1249b370..b9579ab52a 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.17.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.18.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bde1c5017b81d1d79c69eb8f537f2e5032fd3623acdd5ee830d4f74bc2483458"
+SRC_URI[sha256sum] = "d735cdc127a6c5709bde475b5bf16fa2133f36fdba202f7c3c37d134e5192160"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


