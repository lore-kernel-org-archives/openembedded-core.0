Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 254EE760A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 12:24:22 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b205so65329842wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0pYd61QOnQ7bCMSFq+ZhT//VZULgHiDcW+y+SGBTscI=;
	b=PcVErEfd+w0dyahI9Of9YWrKHLQ+8cKEpwTBpD1G1suAhW4WwpihGW+HHuy7lD4xUq
	BDspHrIQQiz5H1Z3+vhFI8zC+eQsmn9wKZk34G38NNj/kYTnUqT6I/3mcGlvNo/MFFER
	3SLMf4hMSrnxZR5V7UHygO+ufzK2I4edBBH2h5nTkAlTdUUjZy1vd0vP4TqsOolRZfgf
	LZlvmGcTtDX6jNXtj4M++NNqtijTtqTUVwC5RjtB1Be+AB9WHBOR6IZxFn71UD79F6fz
	JMvMpUPN+wzSL0HIntzgz7YOLaw7uTRA6zBO1lwiA6/xbGYs/SOOUMQ977sH5YbhixcK
	t1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0pYd61QOnQ7bCMSFq+ZhT//VZULgHiDcW+y+SGBTscI=;
	b=BQW8D6WRsKSMNJrK7AKb99wKJHeSukDFaBkAQRSq7gP3RPQzqmMRgNmzYl+v2B6zgv
	qWtNshQNuH5+K6jOaKdi1uYkvZekfhAH8JzjxpAYjivkbJqjFKssUaCnsIw4YmfwQXbp
	ATR39wOd9d9xbhH8A4UhXCXE9lOf3U61E2ZeT9rCCF6FF2Gz5tViT2/uv4ekj0HX1711
	/d2ktWzvjy1Co9+IjsWfU9rQnpXfgt/ZrTArkyWfVVtotpDeV3OA2E3n75RpnyYEycQQ
	BMc8hJt2Ua1HnvV/GvyRK82lETx2lmE0a82j4wQV845nvXzQ6QMUziO4SFG9+Br3EVWE
	RuFw==
X-Gm-Message-State: AG10YOTao2JM7LsBiZ16SQxJnNzoFNPVz0ys/4I3pQzTFYCAfC3Xrsreh7hY3o1hS+nQsVzH
X-Received: by 10.194.78.83 with SMTP id z19mr15468883wjw.5.1455539063053;
	Mon, 15 Feb 2016 04:24:23 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	jc7sm25198553wjb.33.2016.02.15.04.24.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 04:24:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 12:24:19 +0000
Message-Id: <1455539060-15714-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] package: check inherit instead of PN to decide if a recipe is a packagegroup
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
X-List-Received-Date: Mon, 15 Feb 2016 12:24:23 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 93b275c..ef80e50 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1911,8 +1911,7 @@ python package_depchains() {
         for pkg in pkglibdeps:
             for k in pkglibdeps[pkg]:
                 add_dep(pkglibdeplist, k)
-        # FIXME this should not look at PN once all task recipes inherit from task.bbclass
-        dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (d.getVar('PN', True) or '').startswith('packagegroup-'))
+        dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (bb.data.inherits_class('packagegroup', d)))
 
     for suffix in pkgs:
         for pkg in pkgs[suffix]:
-- 
2.7.0


