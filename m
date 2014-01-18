Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id F3C276E722
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:20 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so2186243eaj.18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rIbPzxGrnwMTeYeNOpGxpIz+848DdG9i+dBZJyrSNcI=;
	b=uV+7+4aoW9aFGdP/NjQix9m9BugChNb1wUTMKTVVR9romqilsg1ZbNGQXSYJirvHQh
	/vOJ+kOcaU8mJYdpN3tsjbuHD9+PPj602nHu7Jg+e/uh5l8519E6cPKyolX+5jn6aKov
	FmaWiBVKrb0oo7QXllp4oB7AgHo+FE5b57zogFlLAOdWvsp99RtPwHP6fFhZ0WtVnQ+Z
	kAISlxFOiLEdIYsIyjl81arbzhPZu/+hPBmFHdcREYS4betyd4ypJePpQo9/ewWUrZqQ
	BQ4nnvcot625HbmNdxwahQxzfxMc+jVbY1ZIGyqU36Yxm4mjjNEzaV98o/BbsYtm+Lhn
	oPtg==
X-Received: by 10.14.251.68 with SMTP id a44mr2858738ees.64.1390053741730;
	Sat, 18 Jan 2014 06:02:21 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n7sm35474263eef.5.2014.01.18.06.02.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:39 +0100
Message-Id: <981d02338666c368a371adb1bc0a5417b4a39138.1390052619.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052619.git.Martin.Jansa@gmail.com>
References: <cover.1390052619.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052619.git.Martin.Jansa@gmail.com>
References: <cover.1390052619.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] sstatesig: include native/cross/nativesdk deps in target signatures
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:21 -0000

* I don't have any real evidence or good statistics for this, but when
  comparing signature dumps from my big bitbake world builds I usually
  see a lot of rebuilds caused by changes in .bbclasses and only very
  rare would be the case where oe-core upgrade brings changes in -native
  recipes and no change in .bbclasses used from target recipes
* changing the default to include them shouldn't cause significant
  increase in rebuilds and sstate reuse a bit safer
* people working on toolchain (e.g. using gcc from AUTOREV) can easily
  extend sstate_rundepfilter to ignore them again (it's easier than
  removing existing filter), example how add own signature handler in
  your layer is here:
  https://github.com/openwebos/meta-webos/commit/9ac3a7c803e7793b3274e4998f167b6278db8042

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/sstatesig.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 3011f16..8b0e344 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -36,10 +36,6 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     if isPackageGroup(fn):
         return False  
 
-    # Drop native/cross/nativesdk dependencies from target recipes
-    if isNative(depname) or isCross(depname) or isNativeSDK(depname):
-        return False
-
     # Exclude well defined machine specific configurations which don't change ABI
     if depname in siggen.abisaferecipes and not isImage(fn):
         return False
-- 
1.8.5.2


