Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id E9B937D69D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2019 13:06:23 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id k21so76339350edq.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2019 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yiMAZpJlgynn2eVdZ6ac5jupAvaTp5Ph/QnArf/xsMQ=;
	b=fivHyCRUsjgk7H2aXJTiudUKZQD3vfTvSsWwjR3794MLWOyv5FTsfnkI1Qj7GLxz4p
	DqiYdennyXvP1z4qKwrCfV4phjsOWFqmPiBVaxv5uvJuYKHQWEMO8FZhSrROVPTWhgZo
	s2TRErxymCtLOTtTjcaFHBEuUSW8gQPCuklxFX7uH121HYcrpe0uHWx339SPWzREgZlA
	I+NqrFqvMMGQd6PKeRvkoL8JTwvsPwDxg+FYfBKAGuFBdMo7S6wSWenCxpoYzUjus7CB
	Ux8V1ESSGe8eUBx/AARS5/9mVaLjpkINIT7vM994GFaUwPRXp1T+ZP95FpiPksFdoLKK
	DOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yiMAZpJlgynn2eVdZ6ac5jupAvaTp5Ph/QnArf/xsMQ=;
	b=nJKXCHfQtaTas3FPY676WP7ZE8462alM7Q9X07UbvQq7QD5bvTrRHyY8f+4IlwiQYY
	M5OGEBXeBHDH9JnYQvu6PVJBIuVTeuUrSnZMBjugA2S+z9873CWde7TudRpszJAXC0nf
	bcM0OwIvzeZ2KPiq8l6krUYZ8prNXCJxImgZieUYcT1UdAPmPk1INlgL/T5o55CaUntN
	9M4uZXyaWenDD0RQZlyTsFX4jGGWEx1eR68HxLw/ZicxRNQgNaonOdpcs7pb4rWf+Gc3
	CmdEpV51/COagS6eq9Xgg/QVBRfzGejLfO3yjUx70ZsXjA2CTghhikWdOjcc6fS2Ze1u
	6RVw==
X-Gm-Message-State: APjAAAUJoNAyCeIVmmb7o4RRmwSUGJFWRbRrDIiVq7DyqX3is5Oh6But
	gp3qEctMR/OY7N17nQdKXQQe2K9+tOs=
X-Google-Smtp-Source: APXvYqzTyMacD3iQy4ooFE7P4kuo0kTz0RkFbqhSQI01PCbZqYYEB/coLwmkQKlzmIk5OhTC/vHQqg==
X-Received: by 2002:a50:9646:: with SMTP id
	y64mr128614711eda.111.1564923984424; 
	Sun, 04 Aug 2019 06:06:24 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.200.33])
	by smtp.gmail.com with ESMTPSA id
	a18sm11127076ejp.2.2019.08.04.06.06.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 Aug 2019 06:06:24 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2019 21:06:17 +0800
Message-Id: <1564923977-13917-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <ming.liu@toradex.com>, max.krummenacher@toradex.com
Subject: [PATCH] image.bbclass: fix EXTRA_IMAGEDEPENDS dependencies
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
X-List-Received-Date: Sun, 04 Aug 2019 13:06:24 -0000

From: Ming Liu <ming.liu@toradex.com>

Sometimes the deploy tasks of EXTRA_IMAGEDEPENDS are also needed by
image, for instance, in qemuriscv64/qemuriscv machines:
- EXTRA_IMAGEDEPENDS += "u-boot"
- EXTRA_IMAGEDEPENDS += "opensbi"

and there are also a lot of similar usuages in some BSP layers like
meta-freescale.

So we change to let image's do_image_complete depend on do_build task
of EXTRA_IMAGEDEPENDS recipes, to be able to depend on do_deploy task
as well as do_populate_sysroot task.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 682858d..89ec2b4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -144,7 +144,7 @@ python () {
             deps += " %s:%s" % (dep, task)
         return deps
 
-    d.appendVarFlag('do_image_complete', 'depends', extraimage_getdepends('do_populate_sysroot'))
+    d.appendVarFlag('do_image_complete', 'depends', extraimage_getdepends(d.getVar('RM_WORK_BUILD_WITHOUT') or 'do_build'))
 
     deps = " " + imagetypes_getdepends(d)
     d.appendVarFlag('do_rootfs', 'depends', deps)
-- 
2.7.4


