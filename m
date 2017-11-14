Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 64E3B7853C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 21:45:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b189so18044159wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 13:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xVhCPgcq5cvuH0Z8lOT/YmBGJaORx8rnau/KcrNq3p8=;
	b=LhXtMkjEtigYoRUWeVpLgPsmOZzhDerBmkUCpJkZy1A0WcoJW5xQaiYtV+NP0RH2HY
	upL5Bww6r2RSWjMt7RSGInmcei4hLTZqj+VYOf7fy3JCmGVqTXyvzTnwwWR8bfhlH/nw
	gQ6igrhXAkQices5PnLl0kMqWWiFHChXBf4nkFxnBQFu/y3O8jPyW+R1gfhQFbIWSqXq
	0tjex02OuCbppNv0/4OIQVwWDhLsYr4a+5uGmaxM8OleT+/Qf1XPgLrdpez4mWE2siP9
	iaIpso8l6Wtq44eL3M2XJM/1BHMk1fEKVYFoagS/VafYTLrKJAvHDrseF/EHa9mz93EW
	DKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xVhCPgcq5cvuH0Z8lOT/YmBGJaORx8rnau/KcrNq3p8=;
	b=PpsKX891bEbV4dGEJdw/MT/cshTNj3adoHJid8vLky92H2gZewxKBnotmTANkPlQiR
	/4TcvOX5jJnrh4YZnw25HU8GbFglPxTwURHK0DXi3PQ3xMRjGSnZU8FqTn9vPE9vTNbd
	Oroved3v0IpzAUKiVfDIqc7233qvuKjXuiObMXQCK0ssdzXKBwjwQY868Ur4a+KMYfyy
	NehfmI/5Eg1svhNORU6X0H00wAzEc/W0KKnMYkrIHmW/qiBnIuKFxSafvlVt5Ld9G37b
	da3UjDa4f5A/omCNyXn8nhSv6SofDAfAREKeawwMNwod6DN71DSVK7zknE08mium1//H
	9IAw==
X-Gm-Message-State: AJaThX4lmO5tuy8s9+Kf73MDxKCNr7ELBxskFhW+Biho18huGLN9VNYK
	QeW4cPrSRyTTlnJxkTu7GJGbnA==
X-Google-Smtp-Source: AGs4zMaGN1qCEA+dF/cKcRtBt1hGGPm9hbfg21xCOyZHgP12QQ4hpi+jSAlxxHzNDM37oejEXatCEw==
X-Received: by 10.80.193.26 with SMTP id l26mr18812053edf.97.1510695919976;
	Tue, 14 Nov 2017 13:45:19 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host101-38-dynamic.45-79-r.retail.telecomitalia.it. [79.45.38.101])
	by smtp.gmail.com with ESMTPSA id
	b8sm13607401eda.59.2017.11.14.13.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 13:45:19 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 22:44:42 +0100
Message-Id: <1510695882-31186-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] musl: use arm instruction set for armv4 and armv5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 21:45:19 -0000

thumb1 is not supported with musl.

Fixes: [YOCTO #12336]

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-core/musl/musl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 56c9d7f..b4b0de9 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -26,3 +26,7 @@ INSANE_SKIP_${PN} = "dev-so"
 # Doesn't compile in MIPS16e mode due to use of hand-written
 # assembly
 MIPS_INSTRUCTION_SET = "mips"
+
+# Doesn't support thumb1
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.7.4


