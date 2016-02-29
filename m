Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E3F5360588
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 19:08:55 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p65so3191686wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ocBg/v7fmwdIwmMBHhiToFSZwiqYvrP1m9mZepaeW68=;
	b=Cr7c/RvMxBV+uTcjOnYr8No9ISpuq2462DsfvIzEe7IgmzEVZWQfYT05s7Uddi/b8z
	5VOEedBWXZ3YrjAN2X89WIrS+Wu4lTU11NRatMARVK/LFzqTzVReIQM0TfCyAAUtqzON
	O7Ruhj/RELf9tG5cVuYJ9nVuYETS4GQ54mo+hpNiHy8SAUX3mOhd/x2nH8/RVOmqT73o
	U0r4mCG40917bUE2+MmDVh+3OZJa9ZMRyErQjei8BYHVqdacT4P+sJIDjaPFxz9W+GKy
	UKNDhd/zsuFNj+BESqQgqbdjPnkoxYu/s9bzjPLXlT06mC3sfdTG3yud8tEUJixBJnGa
	zL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ocBg/v7fmwdIwmMBHhiToFSZwiqYvrP1m9mZepaeW68=;
	b=EUXugVYiMma/Tx4c2b9Kw5nNBZBjteLvT//9XnQmr+nfxPBVfbhejrS9Pkg3oXBL6Q
	XbE6Nkz7vq5pjO5ux9/cx9TkwaBCfpJyR3OBp/kodzxx83xG8jRmMiZdMrNkNtG2aGiv
	tSricw6bLYfrTIAL1sf8j5p5b01YcZC3Ah8cdWyULVnKz1P8OU1UBsQzSmaLDrTP0mZU
	x0swiD00CLiISG8rNI7l3Sg8BDN7RPPzJZePwhm1vwAaM9QrKP+V3NH7q9MLane04/7c
	qIXO30UBVINa91QjhURCFAICzBHzCSbvH0NeDJNHXF1F2dYFSZOB34nRuXyi/9b6dD0d
	x+kg==
X-Gm-Message-State: AD7BkJIdzY2zan3rJYg4aqqShDBpwsoJVpHk1MQnWr9ToKpdanlRLBtx+8LF1OdRSJMg2w==
X-Received: by 10.28.223.8 with SMTP id w8mr13902154wmg.54.1456772935927;
	Mon, 29 Feb 2016 11:08:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z65sm16063483wmg.1.2016.02.29.11.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 11:08:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 20:10:39 +0100
Message-Id: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Mon, 29 Feb 2016 19:08:56 -0000

* gdb has own bundled version of readline and do_compile fails with:
  | config.status: creating config.h
  | make[2]: *** No rule to make target '../readline/libreadline.a', needed by 'gdb'.  Stop.
  | make[2]: *** Waiting for unfinished jobs....

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/no-static-libs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 6c0f859..0bb6647 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -13,6 +13,8 @@ DISABLE_STATIC_pn-libcap-native = ""
 DISABLE_STATIC_pn-libpcap = ""
 # needed by gdb
 DISABLE_STATIC_pn-readline = ""
+# builds it's own static readline
+DISABLE_STATIC_pn-gdb = ""
 # needed by pseudo
 DISABLE_STATIC_pn-sqlite3 = ""
 DISABLE_STATIC_pn-sqlite3-native = ""
-- 
2.7.2


