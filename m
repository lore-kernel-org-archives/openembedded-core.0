Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 92F267EF1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:35:07 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p13so28484376wru.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZTKzzE9UPkNPlwD7wevrogkeBDRTpE41SzL6XZpMajo=;
	b=JTi3+6hUqrF54bs4+69mVqD0TVtJv6er++Lm+Q5TSkNxH+q5PawXgK4wWs79GTw4Ud
	AwIbKlHlsZMKgbFJOhYXJS4SLsYFqY+io9ArX10jLdi/kNpEsQfgIl7d0sZeeIk5MMn6
	hTR+vuix5HPn5xJBboktJNuQjsr825rYQtfTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZTKzzE9UPkNPlwD7wevrogkeBDRTpE41SzL6XZpMajo=;
	b=bKEIjybLj2V2zSgg707wILDbcmOaEVTacrHsVlmo/FtRmHh5uT7tbOXck63ncU5WbW
	kLUbRKfsg84iwqwxpihF/xDger57cRKS/+UdjAhDifuFNobCBPO7OhIlr3i3xqXJUzzr
	JbRZ0nCepkL9nLGc92e/P3fPPjPkfaVWjjjRNm0xqlg9ADtFXS54n5/WWO1ezscziOyA
	OkCCmUQO1I6TZRY6OIA66QKXOPMq9QFGjDSFSbKL2nJUToHhw7GDR2795VPABQxkxIt+
	CtekN6W1z22jpBJD0/omvZ8u33+XuYXvl7/aWWlvMIi5G/+96Srrs8Ve4ldI5wPUi2PT
	rF2Q==
X-Gm-Message-State: APjAAAXnX6jFwxVbqAzwJlcgc3XuttYPwHzrG4ykx7s6M9J2IyfsqBII
	RF0RR0j0+6bP7noeYn03OPIaTUSH+Lc=
X-Google-Smtp-Source: APXvYqxEuEYp+KQknpjD0wltMWoxRJgShTQbdpRzeHwwO0tbQjrnvs8X9/uYKgTrxZI4bXwXBoO3KA==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr50002671wrq.28.1563453308134; 
	Thu, 18 Jul 2019 05:35:08 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j33sm61540812wre.42.2019.07.18.05.35.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 05:35:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 13:35:06 +0100
Message-Id: <20190718123506.30788-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] staging: Drop clean_recipe_sysroot
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
X-List-Received-Date: Thu, 18 Jul 2019 12:35:07 -0000
Content-Transfer-Encoding: 8bit

With recent changes to runqueue, this fuction is unsafe as setscene tasks can run
at the same time as normal ones and doing things before do_fetch no longer
offers any guarantees.

There is other code which cleans out things from the sysroots as tasks rerun so
we should rely upon that instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 94c85248daf..cdc342dbb94 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -577,17 +577,6 @@ python do_prepare_recipe_sysroot () {
 }
 addtask do_prepare_recipe_sysroot before do_configure after do_fetch
 
-# Clean out the recipe specific sysroots before do_fetch
-# (use a prefunc so we can order before extend_recipe_sysroot if it gets added)
-python clean_recipe_sysroot() {
-    # We remove these stamps since we're removing any content they'd have added with
-    # cleandirs. This removes the sigdata too, likely not a big deal,
-    oe.path.remove(d.getVar("STAMP") + "*addto_recipe_sysroot*")
-    return
-}
-clean_recipe_sysroot[cleandirs] += "${RECIPE_SYSROOT} ${RECIPE_SYSROOT_NATIVE}"
-do_fetch[prefuncs] += "clean_recipe_sysroot"
-
 python staging_taskhandler() {
     bbtasks = e.tasklist
     for task in bbtasks:
-- 
2.20.1


