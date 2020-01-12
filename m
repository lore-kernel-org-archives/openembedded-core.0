Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id C640A7FDAA
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:36:36 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id l24so3114516pgk.2
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=bK8e7/zhTbKoIw45SNKE+5y+8dRo1u0e/KanC/2xzutVLTfydGjwp2W3qb17FNgBJI
	9iLUd60sYoNEXbIDKrYwsyK4RM9BZaKH3ND1W5hDKGIwDUEbgHfORKf/jSHLR6ZB9l1o
	NyRBH/SokKPpghAUnTuUzwt6MRgya0lNQTLgCDDBpU83FL14sgjH1XvTeCx3QYBIDLVF
	VVAQyNQjr86jJX5Cy7KPG1qsZ5eYweA1kNPjHzJVseTVw67xJb9qIM9CngOrQaKX6X4+
	DQujUymL68tFjANtSvKcHLmYYdKK8QqKqtvPAWOnIpnCH7bEz1fbu9inPrup4bXWtq4n
	6s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VfJ2gSZ07RiZFgZLAiLGHm+gAKb7lDM/1Thz/mBkeGY=;
	b=DniNdRRkOLAnY58PgtYvWz3dhs1ckcUF8rGuODspHsDYgb8lISQgCiKDZAkof+T8kY
	qrY+iU/ftbSh8kGEc+rAI8OKOdLoo8xE0sCI/QBWO4GICqMBHvSK/tKn4ACKVjqaL6r4
	5UBC2V/EQay+bnrMAgXgVXgm2ckfOWMWp/zHP1VbuRsdWU6eYkLNueYl8ACvzJygx2qw
	LFYTrbZ21YV+zrH6ly3eYUjyu48srjWuR06ku5/fJr5kMHJ0BZuul7d4Yms+pdtwKDUF
	sgbmpxLqjxy5qvAGhQzRvt15CjsN/qKYbUTsVfJE9ei38s3+F4CIEwV+rMAz28WUHbga
	YYhw==
X-Gm-Message-State: APjAAAV5aZh8SLBL4adXZSRqgxS8q7dwQd1rTpHNlmSSggU60A/lQlFl
	r1IrNXCWrZnBvI0NlwUFIkYISfUG
X-Google-Smtp-Source: APXvYqyYxCK0m1m0oI0FPZp8GuCzIzE0NQil8jMQVDrUv2e96DfWa/bvwqyX4pnYsifcKSBPu1X0Tw==
X-Received: by 2002:aa7:968d:: with SMTP id f13mr13435572pfk.67.1578810997749; 
	Sat, 11 Jan 2020 22:36:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id
	136sm8437493pgg.74.2020.01.11.22.36.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:36:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:36:32 -0800
Message-Id: <20200112063633.11144-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200112063633.11144-1-akuster808@gmail.com>
References: <20200112063633.11144-1-akuster808@gmail.com>
Cc: Ferry Toth <ftoth@exalondelft.nl>
Subject: [warror][PATCH 3/4] sudo: Fix fetching sources
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
X-List-Received-Date: Sun, 12 Jan 2020 06:36:37 -0000

From: Ferry Toth <ftoth@exalondelft.nl>

It looks like https://www.sudo.ws/download.html changed certificate
and directory structure. This breaks fetching sources.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit f02e9f46ce54fed3c7ddfad7d1003a2fb7ba3a67)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index bbca8395b9..43c27bf37f 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.17.1


