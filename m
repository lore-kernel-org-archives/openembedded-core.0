Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB801CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20442.1782220468298262584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tLj5u1c4;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49230a567a9so27426705e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220466; x=1782825266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWT6QzVXv/ZRn4fXwCA9Gf6z5vdbWetVKd/vio4rYXQ=;
        b=tLj5u1c4ZcbrrjlDqFLELF9QUkICBYbhFWlGcuN/Jo1eApZfU6qVskH24imS0xUlWE
         voUwQYTG0tnnFOpiBkGmyQ+wjHn+ua9R99covWXZ+mIeLR3odtKjWk3u8gpy62u80uKU
         tBmCaliYDzvJ6eOYAJIb6usL5jnRUleNm+0fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220466; x=1782825266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWT6QzVXv/ZRn4fXwCA9Gf6z5vdbWetVKd/vio4rYXQ=;
        b=A02gFMECs9NxG+8b5rHHPiZRdCWIkZT8Bw0tFlcwDq/HtCLyipWOhm+/+jH4DKokjL
         o2FMqSqBZeT5SeQsvJSxLpN/jpFejHCb+g56J0oijHX3DZRA0skwyx1vWSO67oyn3+PT
         NL+9/xzIglHIWv3PcjnBXUc+Mt9/lUL3oUeDD7eZ3hP52Z45lqmaLjux/4pqFSjL08fJ
         cqdp2hsIGhQ9dlHxWt3+pWFkRCtPpwaTMrviv0aIo7xyN6iud7GTVjD8qMT+MrdNhwQO
         FraUD0nPc4aX3YrjP2hvxZ+eSJ15t9H+foNyM+GtZYeI0ayTJwKWVRRVU5JzINj3iFxF
         GzDQ==
X-Gm-Message-State: AOJu0YyLJXLKKpEMZ/yojxfSmG31zhPPPUShFBpv2Vtw+EfRs0HmQDo7
	pf+AnOhzmRXq6AHmYzJHnfxRykcGYJMFwgNxJ9P4/RmjFP7U+VyJ0xSkA6j/Q3Zd7sps/bpvVoG
	3r2oz
X-Gm-Gg: AfdE7ckFqhj8eClc+hReE1CCgmal6KMRSWohyZ9iIr+kEpO6XYyPDZOAfK+FWhCNiPD
	tdarNwK8yZhYBTlgD+qV//I0QoDH8weuTUzguJdFhCyUGpzOvcWbN09NssIHCZyJUlBU2djz6B3
	N3HRRg4SwbjENsC/w0PmP9TTDDGClUZJdtnAOvUz0hFcJ+GOary9hY8P6qpusxFdn5bARp+kdDh
	rJua05O0w0TVsK6QOVtNkdu8TjZcbmCDaypk6OcUcGOlrK71UqqhEuoU6Bg+b75q9ZZO+6MqKa6
	2RxLrb5oewTZw/FcrjIAC/cp7fLMp0WHObhKyIhyzZEF8AJnr9vPaeM7XuOyy2ijQcY4WbpwXtx
	nbPdE0J+vQDwo1vm3VQUiwwhGxD0QbJXgV4lcUjWXPDlUTBR0t/xKHKcEssFEpn21ZtGi8xDSjg
	ZtlLQAzDHNUKX/b07EBsr7HuujufmO+aWYE7wBDnCOelYh5A+BbN5nmLE2amCaOy5/4IOdTZ13h
	t9PRLfGa6FIf7MOBw==
X-Received: by 2002:a05:600c:8716:b0:490:c032:ae92 with SMTP id 5b1f17b1804b1-49240ea870emr289029655e9.33.1782220466488;
        Tue, 23 Jun 2026 06:14:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/26] openssh: fix CVE-2026-35386
Date: Tue, 23 Jun 2026 15:13:43 +0200
Message-ID: <36ee08f01311253bca4c4f8387446d35a55cc840.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239368

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVE-2026-35386 is already fixed by the existing CVE-2025-61984 backport.

Rename CVE-2025-61984.patch to CVE-2025-61984_CVE-2026-35386.patch and
add the second CVE tag to document that one patch covers both CVEs.

https://nvd.nist.gov/vuln/detail/CVE-2026-35386

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...CVE-2025-61984.patch => CVE-2025-61984_CVE-2026-35386.patch} | 2 +-
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/openssh/{CVE-2025-61984.patch => CVE-2025-61984_CVE-2026-35386.patch} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-35386.patch
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
rename to meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-35386.patch
index f705410b240..7fcb02d613e 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61984_CVE-2026-35386.patch
@@ -32,7 +32,7 @@ Slightly modified since variable expansion of user names was
 first released in 10.0, commit bd30cf784d6e8"
 
 Upstream-Status: Backport [Upstream commit https://github.com/openssh/openssh-portable/commit/35d5917652106aede47621bb3f64044604164043]
-CVE: CVE-2025-61984
+CVE: CVE-2025-61984 CVE-2026-35386
 Signed-off-by: David Nyström <david.nystrom@est.tech>
 ---
  ssh.c | 26 +++++++++++++++++++++++---
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index a1b5d4a5535..ea158b56b41 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
-           file://CVE-2025-61984.patch \
+           file://CVE-2025-61984_CVE-2026-35386.patch \
            file://CVE-2026-35385.patch \
            file://CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \

