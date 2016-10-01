Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E97CE6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b184so5768982wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gD+6AIhijcrdqvg329fR2GYsYVAgX+gLflQBahnNcFI=;
	b=y+M7F5CNg6dT0fhP+yJgP7iNfmzpZ9Hxqq0+sSrHVMBHMqA6sFSj75CqIeAUb2hC24
	ChJx1Gd4nhY/db7xusV0uweW+Fugf9X5WBD8Ewb5VlyhC2m7cmJ0UwXBB/lv3OYY/h0S
	nLm27r0cQ0kyRIVsJ0pWJvhJlOpgZGlcQl069iUSN5XBa2otzzSOwjGrfi5D1Lte0QfM
	DIiQRKThonxkkgdpuWTbv+mfi3CifLL+xgrMtwitoz/oHhuoOCDlfLixKaZcSNjCb6RJ
	FQ/t5gqBma7rGYatu1lWtpqLAeOOHTKcrFWlyr8SbM+K+kZfWbLfeFlkOMmXMXs19rlm
	uGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gD+6AIhijcrdqvg329fR2GYsYVAgX+gLflQBahnNcFI=;
	b=dNB6+hclmm2JXiCGTgk4NwoBQMvtpiGX98S/8qNVhzuqFFx0MUhGymGsF6SIO1HBlw
	tJuJsxJvn1N8WKR3xwKjeYTVBbvt4i9WxeS+uvY409TV6t4jyzD1f4XmKBS5hMKRWzk/
	r0PUd3kcwJfVZuaKuv/WvGqyg2BllYQt+FPaYfESAwfraoHiUEGt9uI3VKE9pW+pNCRM
	+Tqv7x1il8Eo8iCaTiXXMqyV+OCabUsFN1Dijs4w1kklr6CLNcCCfUGjxZA3edmnxtnK
	gdsScpcLvvGnnqG9krVnU5fPHNddP2MwyO6ym0G7cQJfvulFMtOxbEqm863mj2CI+oQn
	Z7vQ==
X-Gm-Message-State: AA6/9RmSHCUwLNUu9cc7xC2cG/sBVC9Nv3Un/swPaxXk4DzbfgTJkvjWAYudc9P77Zr+lA==
X-Received: by 10.194.239.226 with SMTP id vv2mr5504383wjc.219.1475290071079; 
	Fri, 30 Sep 2016 19:47:51 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:50 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:04 +0200
Message-Id: <1475290031-20568-16-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 15/22] sstate.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:50 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ac9d77d..6f0c791 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -658,7 +658,7 @@ def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
     accelerate = sstate_installpkg(shared_state, d)
     if not accelerate:
-        raise bb.build.FuncFailed("No suitable staging package found")
+        bb.fatal("No suitable staging package found")
 
 python sstate_task_prefunc () {
     shared_state = sstate_state_fromvars(d)
-- 
2.7.4


