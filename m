Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF0065CBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 20:21:22 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r129so146259282wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 12:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=kvEEyeNjrGwgmbQBV4Q/mGmFgWcwEPQttHPmGlLu4NA=;
	b=o2a+qW0yPoqfpAKZiCZuiq2fvzO0GNbOXZ05eKC5uP/DdTgI8B478JD7XWNLOyfOQa
	kx/ZVumIeZqW5jGvtE5MWl8kG45+tFfZW6/t1nKVbMM8QXoWHzTWIIGgo4prwfpCSjqM
	CwtFRlVP1w6reodhO7jKKrx7sNz7xl1s0R++teTZ+CAyUnIV1aJ8AtigU80SuHjuixQl
	fW2jOF0NDrYhBV6aZKkhRPPnRHDBJnH5H6Y0DDakdmpIcST2oFS87OIT90iibT+SXI+M
	ed819NEwXftjl/tRw8xcVu8ncPyA7BUwkU7AoSs8Wp5N891SAoJC5GL6PGW4tJQk8Op+
	2vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kvEEyeNjrGwgmbQBV4Q/mGmFgWcwEPQttHPmGlLu4NA=;
	b=PKKLQdKoyb4ecJ5+VGh9/6K+M5FKsWxzAtxp9NsAltxCgRm7PGzbzoSafUtBeT+Fxl
	qSfI8Bs8XNbOZ8Sik9su8gw26HfubxjkWp0Ifvon8KtVxwPpwNnjU/nYIzWjoPUW/teV
	2Np/bzv09MbPM7m1+3U3eR5xgKjJEqmD2jxP8Z2s0HGTTrlUVMDMf2/bOoY6j1Gqtsb8
	69MpIyPf3yRPqULmCbKugIpRi2f63YrP0Vba7GJQEBrTlXyPsEwJnTChf0Ve9iBod4CG
	2E4y/r0rk3T6vOsvkNvy8ge238P/QiLB1/ExTZJI+3jKvuafhKWP3xstKknM0tcNiaFF
	1Ljw==
X-Gm-Message-State: ALoCoQmUjJZFzqn/bXHEYW8ow4OEdF7Zjwau+TM9cUCoMdxcHY5r6m1THMHoo9P+5IcAiR/sH23D2sh4PD7Kg7p7xqLAoyPR+Q==
X-Received: by 10.194.6.98 with SMTP id z2mr37788149wjz.101.1453321282403;
	Wed, 20 Jan 2016 12:21:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id n5sm26648240wmf.3.2016.01.20.12.21.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 12:21:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 20:21:19 +0000
Message-Id: <1453321279-14701-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] gawk: fix libexecdir/libdir/BPN confusion
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
X-List-Received-Date: Wed, 20 Jan 2016 20:21:25 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/gawk/gawk_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index bc188fa..7c92bde 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -26,7 +26,7 @@ inherit autotools gettext texinfo update-alternatives
 PACKAGES += "gawk-common pgawk"
 
 FILES_${PN} = "${bindir}/gawk* ${bindir}/igawk"
-FILES_gawk-common += "${datadir}/awk/* ${libdir}/gawk/awk/*"
+FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/*"
 FILES_pgawk = "${bindir}/pgawk*"
 
 ALTERNATIVE_${PN} = "awk"
-- 
2.6.4


