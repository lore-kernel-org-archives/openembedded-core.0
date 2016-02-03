Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B3B7577339
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 16:37:35 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 128so174009735wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9E7ZybwOnLCTfcE4NGXqvWgsxf40/IH17G+TojVfOtA=;
	b=R1KJn7kdvaXLdyJsKBVTW2aSsgTzeqm0NmOiwWp3YTY7RW/mZZvpjTpNJHTB5lq03P
	0gGY5jKtfAurQZF+q3pTZBnXRAB4bkSNDaA/KPQg8BGaHbjq8S1gsGw9s118wq2zjvvw
	wjgpYswt4S/6enlSG6aCi9zXXO1UwkemmIQhJwbokHwPZlq2I6VaqiOQxTf9DuAi6kXp
	mzHbzKclf47oeiqVLrJmXupbAJb0hNY468UDUb9LDZCS5fGQtLH/3nRJ6zwSQR2Ho91p
	YzZw+j3woht1L59haaREyOqnFYpt3fIUk4M/dbutJ0k4wm6l3YmBqxv1bRwG4ASPQ0ih
	qtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9E7ZybwOnLCTfcE4NGXqvWgsxf40/IH17G+TojVfOtA=;
	b=SBoshx2AFCpzHzAmlAUrFJSUAD1XqOJOMouii6xxxrEH212s/WnFudp3/iyNuAdtaY
	dTjOpS9y76+ujgkhTZfUKpfK6Uaql2QYhU5OvvUzaS+bdtoGb+8vKwGuhk/2B61R15pW
	6UR9HIkEDHmWtPd5Pr0SNpdq/H3SKtWyU3FueGYX8SHihLl4HOZ7G5YyuLdKMotmPPyJ
	XejWsCbEjI4npKUip75YhMQckWIaqr94aeJi4phMwp0SWHIOMDrAmGLUIB7ye+vJi1I3
	pRxLxxEo656U7IVowZlQVFu3rve4mU/i+QopsxHbC98+uv3I51/uHUTVXH7Fj1VcWq4c
	DrOg==
X-Gm-Message-State: AG10YOTwzOT1lua/VBmuuDI3KQfXBJoyv2R2GzO40jUz8IMYZgGsSGKvCRh/KQupfymVNHcz
X-Received: by 10.195.17.198 with SMTP id gg6mr2925092wjd.15.1454517455917;
	Wed, 03 Feb 2016 08:37:35 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x186sm22157537wmg.19.2016.02.03.08.37.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Feb 2016 08:37:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 16:37:33 +0000
Message-Id: <1454517453-32480-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] license.bbclass: add LICENSE_CREATE_PACKAGE to perform_packagecopy vardeps
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
X-List-Received-Date: Wed, 03 Feb 2016 16:37:36 -0000

This class has a perform_packagecopy_prepend() that uses LICENSE_CREATE_PACKAGE,
but the BitBake variable dependency code doesn't know that oe.data.typed_value()
is a getter.  Until BitBake knows this, add an explicit vardeps.

[ YOCTO #5635 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index fe38d21..a7f3773 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -312,6 +312,7 @@ python perform_packagecopy_prepend () {
         copy_license_files(lic_files_paths, destdir)
         add_package_and_files(d)
 }
+perform_packagecopy[vardeps] += "LICENSE_CREATE_PACKAGE"
 
 def get_recipe_info(d):
     info = {}
-- 
2.7.0


