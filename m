Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 272417F4DC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:37:00 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id b10so337735plr.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bfzJBDCpPRYH7DogVTsp9vkZeyEKZVcZIs4eOkcAO7g=;
	b=Z5YBEbbs9bgB4YIEge1E/F6zQQY9Fwvfr8IbUo/ORAU+7V5Oit1fgxMpasaD1fCwbh
	mnyqvQcviySwnqC4oihRtl8/iYCUMkI4vKW1QdOl2LiSl385hcweX44nK2yXoFVgGhR8
	iwIBBEj9KcsFzMp1iR8ZiOOwifS/SllqA3EPMraFQ+zcBmTtwMm/58DHJqu57P5Y0SLu
	Ze6DdqiF49sM8EK0sc8uJquwBNc8sFFnzTv8tsLduhNT+0+Oy/SKfhKESE6RFYY/jILq
	hEXlVzHCAknjEefWILqP4QhHV4WP+RmjBp3R4DqLpqkhVr1BdlnPz5hwJGBeVtUVFDEq
	tnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bfzJBDCpPRYH7DogVTsp9vkZeyEKZVcZIs4eOkcAO7g=;
	b=tNO09gs6ifdo5OcMnWEEP/V9/8t5MSl1FfYFKdc7ZtGkv5z+PtmidZHWIO2zj7QFbH
	DdrTE4zMHbkJIjkLrCVht60wZwuRjxXmhoaDs6YbvXnIawTn/U6DuNVIZvoPU9r5adlJ
	ghf4xJ0Jg8zYi1PAoydo8jtbccaFsP5aROG3WDYe8IpwdehO8f0FeAyXKfoaK7oPfFUz
	p2cxVNt02d6yNHSya7lvZN7Xc0lRHzONTt1mmpy5w/7998Ny+VYcalvBy3Jr0T+zLV2l
	E66GQJz24iyQjT3PBVR8w5guY1fMGUvxsQYOq/xpLLboRYdHkhfIyCqId9mgTGsnAjya
	G1Xw==
X-Gm-Message-State: APjAAAV8Qgknl5oFh7J1KwrXlGVzPkUiOgMI42wjoDZ6/Xu1VASkLCoF
	MuSz72/wLN+CtKhbQt9cUW4CIA56
X-Google-Smtp-Source: APXvYqx3ZmfvVJrX5wmSBBdVmcJ0P/Ys7w/FVL88MNrolknQY4E+7tlUFyFTaT0cDjc/44+t6+1Azg==
X-Received: by 2002:a17:902:9a8d:: with SMTP id
	w13mr25037060plp.157.1567348621209; 
	Sun, 01 Sep 2019 07:37:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.37.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:37:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:17 -0700
Message-Id: <566ee3feb2cfa343b84d03cbc455da119c1234a8.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 39/43] glibc: Fix multilibs + usrmerge builds
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
X-List-Received-Date: Sun, 01 Sep 2019 14:37:00 -0000

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


