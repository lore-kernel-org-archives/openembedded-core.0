Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9664EEF48E8
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67364.1770970228667011229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WMbwZOZn;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43622089851so529647f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970227; x=1771575027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpvzdfDOLoeboG7h0SbQ9Qb0IIptQ3lYFgVgGl7eH0s=;
        b=WMbwZOZnkNu3bwH1tJQPWiPHq5SW/3tTM7eQNeL8CQQWJ5JPzA/Lm8t0K6pLW4W3AX
         5x7ggpWBO7FBOxmpx0PJ7QHLrAgwqhSsNsEKT2crth5Vx4AWv0QVRXoTRag3HcPByfn2
         3f/z1fNvONv5tv2zuB8oHHkWosTBy6Ze6vbX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970227; x=1771575027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpvzdfDOLoeboG7h0SbQ9Qb0IIptQ3lYFgVgGl7eH0s=;
        b=kdv7b/fV6IvXvTumKu9oBpu98MLYDdpq3i2w2lrc4PRMrzez7xpGvpPFICf3FQnqUb
         eUijPNjXV/rOjGZMM1Ev9IgH+noCT8Mgn+mMcil8UpzT1NH09Hx+Q5Xml3iRgV4tIE8F
         0knTnROWXOWsXqZSUFEXlEh1gAakSiZa3o0UJD0U+OZ1W7LlYAxcx+AEUphVFCaiEA+1
         nLX06bpZW1QkiEPKKkQzXotDeE/JoT1lw89d7DVDwgmf9DvtAcDRLtPp+a3Y9aCpivKl
         jkDGp7ztPPhU3NKJ/j+b9tIHNPHf6NkWtoSHQ3Bxw/MoyIbQ4/Nw5zg6lSUuwWcuTI/0
         hC4w==
X-Gm-Message-State: AOJu0YxlNJuYf5cLAOx/gb4scz8BRq/2H1bdGSX0abrPQg/W9aMNyXX4
	3rajQ1l0qMTUdzbobPnplKFmnh5CS/tD5oPx8yQmdWLlNKugCvLkz03mUUqkhCmBG6ytYFdH6nF
	GAt4I
X-Gm-Gg: AZuq6aKMcYu/rvdllHYtGmr6rKRBTCRN6ClWU0JPrJ5/XK6yFsa8KhmVbWlM3PkBsFq
	XMkRcmQMsfEkM9ehcTNK+NExKSySE9HOcsq11CMFYYYYcHOf3bP2A2EX0nU4+IAOfdF3DJ4ZlKv
	bdQLodEa3VEjINFiAMd84Y9/3gcb/EY5cs43cViakdc0ec+cZhLWeO2h0Vd5ip0hTZRKBeCs+Za
	h4J/RvA0wMOH512QsNxdnEfbkpawN+1SWluUwwVp/+MnfULL/Z9c7IFcIwX5K2diob9ozEHCb8b
	8O+AVAvpgOZEsPHnofYImbU/54OiX14pU+SgfdkqnYv5rwkGS2nDo0B+6by5huhhiWll0aruYS4
	ICVXlj3HvSMuDqjGNRWleuQ7vjvn2eaaFwoTtk1ejrPknDibMLDYj/MDoz5QmqMt9lX8iuwULMn
	Eumj79hsvaiLId5x5eTqBkoA6isFRx5dt3NlofA753ePHx32qRIwhdyiI2d1rCcbb5P9dneSrbr
	0C9+1ppWPAiOe4NZmXYh3kYn/c=
X-Received: by 2002:a05:6000:24c8:b0:436:f7e5:e057 with SMTP id ffacd0b85a97d-43797929439mr1795151f8f.49.1770970226727;
        Fri, 13 Feb 2026 00:10:26 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 13/19] avahi: patch CVE-2025-68468
Date: Fri, 13 Feb 2026 09:08:31 +0100
Message-ID: <c7fb05492763f99edda08a4954faf55754f61689.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231096

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
(cherry picked from commit 9f2ed8adc37a42b561b3c4853cf8106fba39889e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 35f779c9143..0a1137ba433 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
            file://CVE-2025-68276.patch \
+           file://CVE-2025-68468.patch \
            file://CVE-2026-24401.patch \
            "
 
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
new file mode 100644
index 00000000000..3635cc8d53e
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
@@ -0,0 +1,32 @@
+From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179d309a]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 86e4432..79595fe 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback */
+-                assert(avahi_key_equal(b->key, l->key));
+ 
+                 b->callback(b, interface, protocol, event, r, flags, b->userdata);
+             }
+-- 
+2.43.0
+

