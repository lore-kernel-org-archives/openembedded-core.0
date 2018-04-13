Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4E30C607AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 14:38:16 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y7so8707317wrh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wJJP0GDGqgLqncUijBynEjjCUi23471HkbyjkFPsWUY=;
	b=A3b1CK7sHdyx9Lw3XV5wc+qb5auDiDHyXdwEcsS84ddCJQgDsVS2zQVihupiujMRUH
	KQUgZA8ggDh9bn48G0oHFft1TtOpOTdVSfQ0hkybPr2sYcPMbHiDgiUNJdJjwq/d5qp+
	PNwo2NaReMH1ZM7217y/aXcwZzjljbccSzc1goYPVJcgNZPSTkgzk4/YwQ1QbPmigubY
	Y9qmKwpCHPVLDgd/aLf4H1MtprZDpYtjk7Pkn/Y7+ujgSbvEB94NYwLCiikKBWICSg2X
	Ll/G0Gf5B16spi2fOCxQNqY7XYWtRMKio3PEEL5nHrb7tZmSSKcr4fW2HBfhqXfY1CYC
	I/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wJJP0GDGqgLqncUijBynEjjCUi23471HkbyjkFPsWUY=;
	b=l9EyBs/oZOMqWvJEOijKaChwDp2WOSvxLEb22F2AaOAPONphB8ib5uC0GHhO+FbJ9t
	DbwrsPixMeRT0pNuZIK6DdSnebahynib1b6LP1nDMAncU0CTN3ItifJpvPQ/5xtNlSS7
	sx3l09zIkwexES1ke7EmM0xj+F+nBWdayigPwOVHYR+UE8Hwimxvc+VFnhBMSIX6Ha15
	FHNXcKVROYiV90Uy2wF+UyWW29f4p7Z0CswmSldWw3MjGJ0NpjiKLs8h6EN5wskFSN9Z
	ZiZ9AIPFm8pAlaBbxfNJg5Wyt8hAaP74hTnc3w0bt7HPGOzEc60bC3sp+l8UDhZPI4Kj
	appw==
X-Gm-Message-State: ALQs6tBJmLnyggDJ80jwdaq904d5PkeSdJAoRyWS5SfVkaPs49i1TL3i
	7yZtw9wHwIagQvYHDRwTuKK1sE62
X-Google-Smtp-Source: AIpwx49gDwadRKz3UdePiepwuYclqqFHr/J8o8LHAjsfRV0ncHGoYBgiArz76SXd7OlVe7qTJNaXXg==
X-Received: by 10.223.132.65 with SMTP id 59mr1841491wrf.21.1523630297241;
	Fri, 13 Apr 2018 07:38:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r28sm6334384wra.78.2018.04.13.07.38.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 07:38:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 15:38:14 +0100
Message-Id: <20180413143814.4513-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] systemtap: don't build under musl
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
X-List-Received-Date: Fri, 13 Apr 2018 14:38:17 -0000

systemtap uses obstack.h and FTW_SKIP_SUBTREE, both of which are GNU extensions
in glibc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index e1b7789aedc..e2f5204a020 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -26,6 +26,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
+COMPATIBLE_HOST_libc-musl = 'null'
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


