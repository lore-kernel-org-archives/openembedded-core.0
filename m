Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 642D071BEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:31 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id i30so6694365pgl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bfzJBDCpPRYH7DogVTsp9vkZeyEKZVcZIs4eOkcAO7g=;
	b=VbV1e0x7sGDa1HmsNM69PnyklAyo9OzsjNDVPyfY1+zx7JO3/N6jCSU8GmetpXTNfY
	A02IRFxpmVmzYV26vtGVyCgvppN08GVIqErQNy9qfgMx0kNE6m2dnzEcgJRKPD07SfEe
	LSxGE9EWMzcotxDf2b4vauPhEnbiXc1tjcpiWnLas7EZgkDrETPW+ozr25nefbSDMMLE
	CkrhlARNjTonN4ULIgEZP1hUl/PUe7lkRNZi58h4tYsI0kAq+elAzi+WQVUXCxIYlx9R
	CyGMit7iJbZafcdQRN+YwlStKn+81q1IcYiOrU5fzQVuYy5dS20YOu4H94ySqoRzOdAc
	WI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bfzJBDCpPRYH7DogVTsp9vkZeyEKZVcZIs4eOkcAO7g=;
	b=d9u939yxpaMytkREAfOP4Iz0c8iMbdZMZxp/0cZF4Fy0jPe1RpClQz7VYLkWgHZM4o
	Hqb+n56jQtCWBwsIHNsx/OlI+4XS3z22/GUZZmsHDZMaczoISMbNXnPPezpSaY2HZFOe
	5RWnjs0EJSGxGvUXbrKqRrQqOa88206xxpl6Fe31t8INhkbLvF3kUZw4/K/adOIxXsrN
	G2S9HHfNwFKCGRb81crJTs5olv7V3b+h6KuGIJWGbmldM4TkMpaKNEH8wOLp7hbSP0c3
	L6cuCoIhnC4KqK5LQ++5sOj73o4z9Dvw6o6Q9DWwB06VwKPvAf7R/Lpl//To6nL3/loH
	xEag==
X-Gm-Message-State: APjAAAUkmDliCQ+UyvLxd/5W81CLpR8Oz8OWLWHuHBAj3DQH37K5T61v
	qNva6vawlXcv7A/ZDohXyH/p505oB2o=
X-Google-Smtp-Source: APXvYqwNCHZ/ADBkACNBQzOqRMYVxy0wlNzaWuMC4tiFc66MCmEZlsEFhnDdR3bBA8UA1XZk39J/Gg==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr22216408pgo.133.1569818912153; 
	Sun, 29 Sep 2019 21:48:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:33 -0700
Message-Id: <273571804567a4520f1e17f5f8a28b85325d0eb2.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 38/54] glibc: Fix multilibs + usrmerge builds
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:31 -0000

From: Jason Wessel <jason.wessel@windriver.com>

The build of glibc fails when you have multilibs enabled + the distro
feature usrmerge.  Here is an example configuration:

===
MACHINE = "qemux86-64"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_append = " systemd "
DISTRO_FEATURES_append += " usrmerge"

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
===

This will fail with the following error:

NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: glibc-2.28-r0 do_poststash_install_cleanup: Function failed: do_poststash_install_cleanup (log file is located at /poky/build/tmp/work/core2-64-poky-linux/glibc/2.28-r0/temp/log.do_poststash_install_cleanup.107893)
ERROR: Logfile of failure stored in: /poky/build/tmp/work/core2-64-poky-linux/glibc/2.28-r0/temp/log.do_poststash_install_cleanup.107893

The fix is to not perform the rmdir check when using the multilib + usr/merge, namely:

if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then

This will evaluate as follows (collecting the output from bitbake -e glibc)

* no multilibs no usrmerge
        if [ "/usr/lib" != "/usr/lib" ] && [ "/lib" != "/usr/lib" ]; then
* no multilibs yes usrmerge
        if [ "/usr/lib" != "/usr/lib" ] && [ "/usr/lib" != "/usr/lib" ]; then
* yes multilibs no usrmerge
        if [ "/usr/lib64" != "/usr/lib" ] && [ "/lib" != "/usr/lib" ]; then
* yes multilibs yes user merge
        if [ "/usr/lib64" != "/usr/lib" ] && [ "/usr/lib" != "/usr/lib" ]; then

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index b7c64a0..a1d79b3 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -214,7 +214,7 @@ do_poststash_install_cleanup () {
 	rm -rf ${D}${libdir}/gconv
 	rm -rf ${D}/${localedir}
 	rm -rf ${D}${datadir}/locale
-	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
+	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
 	    if [ -d "${D}${exec_prefix}/lib" ]; then
 		if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
 		     ! -e "${D}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
-- 
2.7.4


