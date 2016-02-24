Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9C26077180
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 23:59:41 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g62so5511164wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 15:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0pYd61QOnQ7bCMSFq+ZhT//VZULgHiDcW+y+SGBTscI=;
	b=Gk1FrHsHwa1OOC1u0Ngiflmz9D+3tFKTZz/bXHrGxHO32WaTcqdvjMJKscRqvSQuWD
	zDPsOIthaqo3F3QkAujH/qxppWkKxVVGHN6+GvW1fuTGfz61I9EzHRi/5pxTtseVLqmb
	dpgqMs+nib2LPYUl3gz3qQ0WgHrMIHA4J8kJ3HA7NqslbaZXYY3G+UZMc7uBC9LcJggh
	r6n1HWtr0w4mCuga4bFXhFZ/C4EsC6GHqfPJTpexoRDUt9WCLBQYOXrHY5X2hM2ulb56
	o0Tc7rJuO5SMkyiww+5ZvkrYlTjPxJVH51vFkPvph4BL016p5qHU0NqjcfTTql+7MdT3
	kq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0pYd61QOnQ7bCMSFq+ZhT//VZULgHiDcW+y+SGBTscI=;
	b=RuWhtL/ICXvt3EIuyHEDPnGoHeA7al7D1R21C2N4HB0mWSqbSIIUcCJyLWExedHW2o
	qQAzbBRfk8ZtKOx408QKP9REQF9NhUZIf76DiCzhErXJggNhgHMq/z+gmrsnmXyChpJh
	D5dYiBBp+kd1vfaBilop5YHpgQSNFGRjCbNa3+CcXyZtbIuwpz7k5lLQVAAbYVSidtrn
	xRjlb2Xqo9h2iZ7kRC+5mBNzyYkGKUgYolmyAQg2hBY0Aecly0K/zSP/OLWoGvcPVZlM
	PqStfg0yRR0YtYjwikleu0xXaar0C9AVwIx9fZdVyQ+FeLhN7ZqYXhdDAwfO+qlvxSlC
	iYNA==
X-Gm-Message-State: AG10YOTctnH+9/JykCjiuNOF0ttdj/YlMyrLHzfDZrRn8UWdF9tqFgQjwd5GkKDYJiDUwjph
X-Received: by 10.28.49.69 with SMTP id x66mr338975wmx.11.1456358381670;
	Wed, 24 Feb 2016 15:59:41 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	u201sm486219wmu.11.2016.02.24.15.59.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 15:59:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 23:59:35 +0000
Message-Id: <1456358375-25624-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] package: check inherit instead of PN to decide if a recipe is a packagegroup
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
X-List-Received-Date: Wed, 24 Feb 2016 23:59:41 -0000

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


