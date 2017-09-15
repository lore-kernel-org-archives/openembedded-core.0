Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C62737864D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:58:50 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i189so7697710wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HMsMLUxASOMLOlWrEzUgrJ4OuYeUf5KZ6fmvfOtgrTQ=;
	b=R5ye83P+a1JCJ6oT3tRX24UcqUsRN2+x4yV76Nwmzig4FHC0o4lu3m3y3E1gRP19cZ
	8yJTvvb8nHuaLmZTk3bB9FyxIX3gI6dLDDU+7XaFv2LoaKO+mv8w3/k/LFEk/jRiM/hN
	K7QrHqerjDTkymVKxYMVvN3jtUlBirPRt42tPLd3sEIJ+X+fThadylCh9XuOx4F8A3lM
	Nfv394wiV4ct38QVCjsR1IxZjWsuNEiNTE9pqJMuhjsZnUzs1/v031621w07gA1hcoao
	d3n5W0N5Ay/UuGD3hHgpxRV2BvcnoXYYTZHXf25ORAr3MwfAA0dzj8WWijOLEc53201B
	zkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HMsMLUxASOMLOlWrEzUgrJ4OuYeUf5KZ6fmvfOtgrTQ=;
	b=mVER/vkJA1DMp/x/AUZ+QXiP2yLvHOtetbLOU8xLq2KQwiv9asXxR9s93i/VW5LMUd
	B6Pxk5CIEpzVa3/KqRBxqy1TyhOPcTK1NLEutHNPSGrT45aLzp6o50ia3b+SJxcgefO8
	CNrBbwxj2u6qdutHuls5YhtHvVICicDIwQVLRLlmv9DThtzQM9w7APu9HzKbVGxRy5tl
	rkH1FhVaJTxJ1icjU3EUs0NFnZsMFFXj//xyRbcXbpa74JH4fujjRYfIuhCgNGHUtJld
	g0aXJWIjDrEI0FLsTwkkJS5LoFbUKvSpdQGW0W5OjCNipSZwxPGSUDsgbL32leyM3HXa
	WLsg==
X-Gm-Message-State: AHPjjUjSWYuoHLgnZ+CtFJEYEorvGV7jjW6wpVwuwtbuZT+z6a2004Iy
	nnJAd1ZuZLM3f6Y19+8=
X-Google-Smtp-Source: AOwi7QARD8ZJr1PCy/ryMJH5hO9qLPmXJXoYjKk9ulYGK3iMenoP76XLxYK2B8E72Q7WVx6HyyJ/sQ==
X-Received: by 10.28.226.84 with SMTP id z81mr2483032wmg.108.1505476731222;
	Fri, 15 Sep 2017 04:58:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id b58sm743981wrg.86.2017.09.15.04.58.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Sep 2017 04:58:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 12:58:48 +0100
Message-Id: <20170915115848.4939-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] useradd: don't override pseudo environment
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
X-List-Received-Date: Fri, 15 Sep 2017 11:58:51 -0000

Back in the dark days before recipe-specific-sysroots the paths being passed in
this manual construction of the pseudo environment made sense, but now they're
incorrect and result in pseudo writing to two different databases during a
single build.  The result is that pseudo doesn't follow changes to /etc/passwd
in the sysroot, and warns in the logs.

Remove the PSEUDO_LOCALSTATEDIR assignment and inherit the correct assignment in
FAKEROOTENV.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/useradd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 6017ded8601..0f51e5522b1 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -100,7 +100,7 @@ useradd_sysroot () {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_setscene) be running 
 	# at this point so we're explicit about the environment so pseudo can load if 
 	# not already present.
-	export PSEUDO="${FAKEROOTENV} PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo ${PSEUDO_SYSROOT}${bindir_native}/pseudo"
+	export PSEUDO="${FAKEROOTENV} ${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 
 	# Explicitly set $D since it isn't set to anything
 	# before do_prepare_recipe_sysroot
-- 
2.11.0


