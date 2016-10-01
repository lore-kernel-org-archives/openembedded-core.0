Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E8F596FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b184so5768956wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6O8YmR2gd8KcaInkOJUmOPFEZ9WMvlf4YKtrRCaBIoI=;
	b=YJj4bfqS7z45ar8fkhUoKjANv67HcZ2oHPNDuFF4/5sdGn1uFVqt2D1hO7S4SV0n2n
	hvolyGKkTDIGNIqPIZ95/mYinNImnDLnTraZChl/LTU2gIsr9P41uUGTibvEaSfAjieV
	2P674XDFDYQ48L6+24p9KVbLBVJNWrg3UzRpYFu2UZ6gYg9vwZZg7z+HZ3WPeAlivO1/
	7Am+2ZtDvMM9V/E8biZN3rfEO2arLBEC7R06qUwA2wI6NXcS6NLIPVrEVVB1quQNQwea
	2eCwXs87sBlBkZGt5T75S+vSOQJgFforjc9G8T5woh6vA6GDa6VpOEEcPTnd2TDsYVYg
	HzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6O8YmR2gd8KcaInkOJUmOPFEZ9WMvlf4YKtrRCaBIoI=;
	b=gjySl3g/PpQPKy/lAA5SgYnvM+Qv6lcefewP3Sxk/1L8Q4oHOBQe+BDY7Bb5F82dXb
	QZ2ZdyfglwmCEE7so/ldDTHaLUulRx7EqUobmBVpJiPXmaIKfFcDwMvhrbf57W6R/xqr
	yC9yMwXAPMSMfyV6Ja4BAHNugmz1Z6or2got/iXEIJv5yf1VXsTMh1/m5G46GQ/cLdlH
	c3/RMcz61hsoneiDlibM4OZ6rfm5oONgB1CeBUN/Hb3CdCcNObZxccOHHK8VmVFUzgS5
	pd7kaPi/7jSLLVSymHZzvHKMLWJwAjk2DSeYp578YnLfMEHR26y5sgWO0UDhjAsvFtMf
	QDWA==
X-Gm-Message-State: AA6/9RkzU7T8vf88FJGIsF094esfBbPH9Xqw/omMOkEoaUggOKW78u/ZyJsNSofuMRHUpg==
X-Received: by 10.194.84.199 with SMTP id b7mr8662185wjz.147.1475290070234;
	Fri, 30 Sep 2016 19:47:50 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:49 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:03 +0200
Message-Id: <1475290031-20568-15-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 14/22] useradd.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:49 -0000

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
 meta/classes/useradd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index bf62ada..3cff08e 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -171,7 +171,7 @@ def update_useradd_after_parse(d):
     useradd_packages = d.getVar('USERADD_PACKAGES', True)
 
     if not useradd_packages:
-        raise bb.build.FuncFailed("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
+        bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
         if not d.getVar('USERADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPADD_PARAM_%s' % pkg, True) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg, True):
-- 
2.7.4


