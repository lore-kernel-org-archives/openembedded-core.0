Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id D8EEA7F2AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:11 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y10so285061plp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bfzJBDCpPRYH7DogVTsp9vkZeyEKZVcZIs4eOkcAO7g=;
	b=AjFXa10Ub2h5SsH5RvFg4L1iZg1TNdWIY35X1Cyh7AECrAprNV9BBXQIqgYv3JLCGm
	cP4zDWl1BOw/SJ9Cpjs++R7icnFWUglTsCys23Dt/zQPS4xv6cY5yO/6+KJdLOBTALnG
	8OLy0I00wvIwe1WasNCzD0yu3ZgMft3csrGOvsFLEoSGGStZOy3iGnXc3y2rpprOSEhQ
	XQIXDRs5n7EsP9G/D2KCsuwMr08iRD4RcHfoENX/ueeAMhhFeeoXyGO2y2yCgnAC5dn7
	he5q3073RLo6ysThvLQ96lGd2KYyzKFl2ruZXdEVtCnviZeQIn98yjx7NM1lTMafImg3
	tbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bfzJBDCpPRYH7DogVTsp9vkZeyEKZVcZIs4eOkcAO7g=;
	b=iAbXxlNXQhyi7I9pXQHyenC5QEXh87B4C7LaAhiGFsYvAwQvNqlraxyGvKYyjqSSXg
	7k55Xr3c1BlS83lbegCvGsIZs1ptWMx/YNhbFPbJo0oqbNq3FE0PrMawA7+8ld9L5tBB
	5vwzQnVdTrz7g2sHt7Qs9X0B/H27j6DFk5Qm9a8NFZ/rnXIj2mAeEZfLzsj/OPNvXYjI
	KrRZszeKpQU5uK90IwxOHMixlUdDZTlO0pOpzRQ5y4J86kFoMRwFyPHn9K2awz5c2gLB
	EmFEjXWCuWA5/5W/7r97LICpqMJgA1wq7pwaaCRfBhJ/X7TAgQzczT1EqzXAvPQHXKU/
	qALA==
X-Gm-Message-State: APjAAAVYtGflAxYDp5n/15HtvjORLi0md6GGIdUZeoFk7DTASAX0kXn1
	lolbBzD21fSYLd5pepRcD2MU3K5Aokw=
X-Google-Smtp-Source: APXvYqxQomLSginRdoVrii/RLo+br2Ocff9kVgPiZ+sp91zB/u46vXe1nsoVG3cTVSSwiHzUhgq7ow==
X-Received: by 2002:a17:902:9305:: with SMTP id
	bc5mr472277plb.63.1569293412922; 
	Mon, 23 Sep 2019 19:50:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:19 -0700
Message-Id: <566ee3feb2cfa343b84d03cbc455da119c1234a8.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 39/50] glibc: Fix multilibs + usrmerge builds
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:12 -0000

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


