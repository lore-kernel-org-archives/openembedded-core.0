Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF9DD232DD
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 04:55:15 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4125.1767934504236058205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 20:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXumPy23;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: alistair23@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so2405811a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 20:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767934503; x=1768539303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YVoHWJ+9hpi+mU19d276S2XPwKOYEynfkUCDy+dHbs=;
        b=bXumPy23Q58b3vXblkbAg9biaco+06JVztZSrztLKGQqFnkIQbWUuSuWAUtiiLAt0g
         SMiCjgH2gluyqURr14/Yt3CV0Bu5b3MnULXX2cjuCILsA4EpiwmvIQCdgCbSoCWSqSo7
         asZ91HQPU5NkTDcYPBszpLZtYudTTFCiF+M+zaGYmz6CZwZqG0/Brx2tgMK9FvWY+KQm
         f1saKOHJS7eJ4EdxiM5tM5tfLd7Fvt4hCd2tRrCkB94IthVcfZsFuXlvSOF4pAk8efgL
         /tAZlpacLj/K/ru/dO9VoXVaz8spjiV3xhQh5OlzPm+bEX9RU1he5dSrY51zeW6tgV9Z
         EnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767934503; x=1768539303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YVoHWJ+9hpi+mU19d276S2XPwKOYEynfkUCDy+dHbs=;
        b=fU8P1OJflqIBH6ZU0TJZ0sJJF9rSNsZf2qCVh2T0/9GgWgtDQrSNXMQC84KQ5mWP8E
         s6M54og2y2+S7AH/ZYl84Tt788XiOp6Tp9CMvLNlSqYoamP/ZJ6b9+gRCSLUTYKg8lJU
         dYual4z5zdHDKMWGe9zuBTtSZtgGXl18gHnNoL2MkttY4PJ+YTJD+8Mb127GtC5KZor2
         9Bmju2p9HyfHgUMbE0hMdsRobf5lw/5/X2rfnbPALom44nFo1ryoo8JArg65m4EiobbU
         xOS/WWJxvKYtlv5j92AHMDdD0xmYJFBvphrNi7o7hX70lPk3lCsXne3MOgd6RXI3XweF
         bGiA==
X-Gm-Message-State: AOJu0YysRHtXDKdi/ADRLSs/dNoJOSWbXdmaLuvcEtUrk1SkRr6UF+/z
	P1rm65wirRk7yiZpnOA9DqZ0m5REE89ZoJqcMYiXswxdMbd+3d1JOMWR5MO5KDiK
X-Gm-Gg: AY/fxX7VAldi67PSwrzJt9z7Ff433pWjfix3EjKio0K48utCyzTz3+VRbtXhTFFtUYq
	fy8ojRLlSh40+kKYq6MwQf2ZqRp/H3+HlfhEJwKboAk1lfoSjsPZVAs4dMHbK/GhLIqC4c9k9Up
	fwO1G4eKDmjQVcgFQKRIJ1rujFsW24dnpzvfUb+2YYQHn+lU/QHiMZqnvz1vcXX+zf/NkO2qrtv
	u2yZ3yEBFvk2EzhvaCLUNT7ZQ+ILWYkxLmtDvQ9hjFGptd+AVESL8uxmALz2k0EYyeKSQ8nvl8t
	nqKPZGrOP56iB3FIJ7Qa7/VLSV6YQ4VTx0FAPjWBPI/6ja2MdjDUTf5kWVbOuDKy8GYbHZk1nAy
	GYXULwZmMKHfvhzn+Cu0OUKtQoMnqkTA+In9Wkb0SV8r078fmxE3RcUBz85qgxh2ROacdYFEsXB
	+BDccJZhoU4HIGwHCRf7xib6euq3GcCrVTnGJ+gMyCc8QFEW1p6VDtZov8qIVxd3EvRTMtT8lU/
	phFBK9R2DPIBDS/ar0=
X-Google-Smtp-Source: AGHT+IHgKWwHe/9gghQjj1aTRI1x/NxFAtsqVq4tIwV56lHU1lSU+0cevD+4e511cj3vqQ0qBQnwlA==
X-Received: by 2002:a17:90b:3a90:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-34f68b4c514mr10022372a91.7.1767934503189;
        Thu, 08 Jan 2026 20:55:03 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1922sm9393807a91.4.2026.01.08.20.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:55:02 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [OE-Core][PATCH 2/2] cml1.bbclass: Support the rustavailable task
Date: Fri,  9 Jan 2026 14:54:47 +1000
Message-ID: <20260109045447.1933604-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109045447.1933604-1-alistair.francis@wdc.com>
References: <20260109045447.1933604-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 04:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229092

From: Alistair Francis <alistair.francis@wdc.com>

Allow the user to run the rustavailable kernel make command to determine
if Rust is avaliable for kernel builds.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/classes-recipe/cml1.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 3c2b4da4af..efbdd2a795 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -107,6 +107,15 @@ do_diffconfig[nostamp] = "1"
 do_diffconfig[dirs] = "${KCONFIG_CONFIG_ROOTDIR}"
 addtask diffconfig
 
+python do_rustavailable() {
+    oe_terminal("sh -c 'make rustavailable; if [ $? -ne 0 ]; then echo \"Command failed.\"; fi; printf \"Press any key to continue... \"; read r;'",
+                d.getVar('PN') + ' Configuration', d)
+}
+
+do_rustavailable[nostamp] = "1"
+do_rustavailable[dirs] = "${KCONFIG_CONFIG_ROOTDIR}"
+addtask rustavailable after do_configure
+
 do_showconfig() {
     bbplain "Config file written to ${KCONFIG_CONFIG_ROOTDIR}/.config"
 }
-- 
2.52.0


