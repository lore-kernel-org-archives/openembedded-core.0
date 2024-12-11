Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B290E77183
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 21:59:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6607.1733954353836923002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 13:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jak9uCDS;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e27c75f4so5257598f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733954352; x=1734559152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cNNviIoa8QXy0mweKmzVrVZKmKqQ21eUG0Zu1E6tlc=;
        b=Jak9uCDSGuC02Rq7ndokEx0x/xDnS+Jy7zCSqXeCNpuRxZFToV8U0WQumwXAxzlanC
         1YtcqLdvwqGS32y5yA9RuIboyocv5L+UMd+u4dRCAmsGkQ+ZcSSdpqYTWJKL7zRfe7lg
         5Ww5FpoUEv9Jl+N2XOtJ6lUCwopNIJTzOy6+C+g2ZqQZGGa7vFsUVMcIy0GZC5Ws2SxA
         27Wwb1g9wBJyDrvO7m0jg57MZoaOOZ26w4X8v970wRLXOZ84CuoQv2Qx182ByPYi8Spu
         rK84xSr2vLJymzFRU6h3Gnk2QGesQBMhZpL/Jbvq8bFN3OxJ39+HIAzB1VH+Q6M05FCL
         Q7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733954352; x=1734559152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cNNviIoa8QXy0mweKmzVrVZKmKqQ21eUG0Zu1E6tlc=;
        b=TgfCK8cYp91Dq+zS44nCuit3e3GiUun3AHCvhF0EwJ4TpWtRdRVHUudeRGzRhYO2zb
         EdXDsTwsvNI+sFqWMvB+YpThH1fLoWcrc1TNsNMojZ+r6BWixsV+QrTSyu+3WKl8uKSz
         Yip+7nY3GH9yYvny9zlvwAlOCUu7XVSBGMUpVTCCj18MiDYTISgXxhhWoq1Gm2/wyE6e
         g/1XMJNC13957/W1AZouYaSPGDZiWJuE7e8l64oHaZ+Bq4riIPTzQNsPBc94jFykivkq
         6YBCFr7S24SEAU0PvFef5U1i1hAuCKsljCnIb2/DyrKEL7jjTR4dx0cbRY2rzv/AYzX7
         OX+g==
X-Gm-Message-State: AOJu0YwzdlHVi3FN1rLeRFQTwqJYwHQqvrGC8EY6D965r4kdvr5tumXN
	oiZYp1Dgj3sqnGWnSl/x0PmdDxG+9bNIEdXud2t5eXSOi5a68pW3HD+mQQ==
X-Gm-Gg: ASbGncv5YHvnucEwPJBxhA4cFv+66SW3g+p9G/Dr28YoR89fQFai2fIk5Y/Ws7VqDMu
	IE+ec7bWLcDEsEMAmunE4y9PZoS0CeWo/rMxulTD4vhjHjoJ4YaJjF3lsBtsE7CnvoI7Hx2rAYp
	nrQec3lAPs2a9Rl68lTqciwQvOHaSUUE2CCkeX2gHqMmEGcRtH2LVEiRfovyxeVRtXGDvkkY/Bh
	DAP6wPscqhEEZs0Wih8W4wsY/pZinOjCamJYgERy5t55XA4gGgOJS2BUFY3c1UWYqLCusJ2pg==
X-Google-Smtp-Source: AGHT+IHNYOGOkS6OTmaUERDiuZE9Yi+oytbsBgkouSzy88IukhouFtsHpgJZ2CeVNordmqN2Jq1Cgw==
X-Received: by 2002:a5d:6483:0:b0:385:e176:4420 with SMTP id ffacd0b85a97d-3864ce7ff3emr4461562f8f.10.1733954351773;
        Wed, 11 Dec 2024 13:59:11 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c5c98sm2180792f8f.58.2024.12.11.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:59:10 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/5] systemd.bbclass: do not automatically add Also services
Date: Wed, 11 Dec 2024 22:58:40 +0100
Message-ID: <20241211215859.2187259-5-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
References: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 21:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208615

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Starting a systemd service “Also” does not mean that both services
must be in the same package. However, the systemd.bbclass enforces
this.

Example:
  a.service:
    [Install]
    Also=b.service
If a.service is packed in package A, b.service is automatically packed
into package A as well. This happens even if b.service is explicitly
added to package B using FILES and SYSTEMD_SERVICE variables.

The automatic packing of socket files with the corresponding service
files is probably a widely used feature of systemd.bbclass. This bahavior
does not change.

Adding regular service files to a package just because it is another
service in the same package that "Also" uses the service is a bug that
this commit fixes.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/systemd.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index be77da48125..4b4470b7b34 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -132,18 +132,18 @@ python systemd_populate_packages() {
                 # for *.service add *@.service
                 service_base = service.replace('.service', '')
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service')
+                # Add the socket unit which is referred by the Also= in this service file to the same package.
+                with open(fullpath, 'r') as unit_f:
+                    for line in unit_f:
+                        if line.startswith('Also'):
+                            also_unit = line.split('=', 1)[1].strip()
+                            if also_unit.find('.socket') != -1:
+                                systemd_add_files_and_parse(pkg_systemd, path, also_unit)
             if service.find('.socket') != -1:
                 # for *.socket add *.service and *@.service
                 service_base = service.replace('.socket', '')
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service')
                 systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service')
-            # Add all units which have an Also= referring a unit in this package to this package as well.
-            with open(fullpath, 'r') as unit_f:
-                for line in unit_f:
-                    if line.startswith('Also'):
-                        also_unit = line.split('=', 1)[1].strip()
-                        bb.warn("also: %s" % also_unit)
-                        systemd_add_files_and_parse(pkg_systemd, path, also_unit)
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-- 
2.47.0


