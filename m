Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2FBE81E04
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 14:50:41 +0000 (UTC)
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net [46.105.63.121])
 by mx.groups.io with SMTP id smtpd.web10.14786.1696603839882770264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 07:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.63.121, mailfrom: louis.rannou@syslinbit.com)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.4.132])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id C25DD299AD
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Oct 2023 14:50:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-hmzjd (unknown [10.110.208.218])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 189BA1FD9C;
	Fri,  6 Oct 2023 14:50:36 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-hmzjd with ESMTPSA
	id NXmHArweIGVCJAEAuQbhwA
	(envelope-from <louis.rannou@syslinbit.com>); Fri, 06 Oct 2023 14:50:36 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001f4024ba7-385a-4d55-b37a-50dab57d6e83,
                    666F94273B0C2A13EFE8D098A373195B3BD46C53) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 193.33.56.84
From: Louis Rannou <louis.rannou@syslinbit.com>
Date: Fri, 06 Oct 2023 16:50:21 +0200
Subject: [PATCH v3] systemd: sysusersd: change how the root home directory
 is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-sysusers3-v3-1-518388ee09b6@syslinbit.com>
X-B4-Tracking: v=1; b=H4sIAKweIGUC/23OQQ6DIBAF0KsY1qVBsEW78h6NaQCHOomVBiipM
 d696MJVlz8z/+UvJIBHCORWLMRDwoBuykGcCmIGNT2BYp8z4YyLkrELDXP45E4Q1FZVLZmwvKk
 syf9vDxa/u3XvcrbevWgcPKhDYJLLQ3h45yJNJS0piEbLK+N9zaDVah5Rezgb99rcAUN0ft4nJ
 r7p/9Yknp1G1KYxRsnMtfk24qQx7lC3rusPwX24NO4AAAA=
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, Qi.Chen@windriver.co, 
 jstephan@baylibre.com, Louis Rannou <lrannou@baylibre.com>, 
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 Louis Rannou <louis.rannou@syslinbit.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696603835; l=6487;
 i=louis.rannou@syslinbit.com; s=20230525; h=from:subject:message-id;
 bh=WxMa47SqFgKPmL3/IpXw2o4xmP+YDBgjgD1NGrco1LI=;
 b=BAa5Ir2XXeEnKDE+iFrOgDt0gQZv+N/4T6+gNFVWAJ6tkwnqTOsJYTmvqsPYQUsropm5iYYOo
 oXJ0w4b8ioWAVG6uRGIaSxAxWXsFBDtqz06UeTwnTZ4cikoA6R6A/RX
X-Developer-Key: i=louis.rannou@syslinbit.com; a=ed25519;
 pk=YvNJAioiQmOQYTta3eRaRV3xzOzDE0YgBIwM3nJXa4c=
X-Ovh-Tracer-Id: 2214926591956409707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmqeenucggtffrrghtthgvrhhnpedvvdetgeejuddvfeelgeevveegheetjeefjedtiedvteelheelfeffudfgfeefteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgtohhnfhdrihhnpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpudelfedrfeefrdehiedrkeegpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 14:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188773

From: Louis Rannou <lrannou@baylibre.com>

Modifying the sources brings troubles in the devtool command. Therefore it is
better to patch the source with a custom variable, and later replace it with the
correct root path.

Suggestion from :
<https://lore.kernel.org/all/DB5PR02MB102137939DE6D43E423A9D296EF03A@DB5PR02MB10213.eurprd02.prod.outlook.com/>

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
Changes in v3:
- remove file basic.conf.in
- fix patch 'From'  line
- Link to v2: https://lore.kernel.org/r/20231005-sysusers3-v2-1-938c9cca79b7@syslinbit.com
---
 ...usersd-Change-the-user-root-s-home-direct.patch | 31 +++++++++++++++++
 meta/recipes-core/systemd/systemd/basic.conf.in    | 40 ----------------------
 meta/recipes-core/systemd/systemd_254.4.bb         | 11 +++---
 3 files changed, 37 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0030-sysusersd-Change-the-user-root-s-home-direct.patch b/meta/recipes-core/systemd/systemd/0030-sysusersd-Change-the-user-root-s-home-direct.patch
new file mode 100644
index 0000000000..30d800df72
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0030-sysusersd-Change-the-user-root-s-home-direct.patch
@@ -0,0 +1,31 @@
+From bf97001978cdefad644f7b4b909f281368e5a4dd Mon Sep 17 00:00:00 2001
+From: Louis Rannou <lrannou@baylibre.com>
+Date: Thu, 27 Jul 2023 08:23:06 +0000
+Subject: [PATCH] sysusers.d: Change the user root's home directory
+
+The default sysusers basic.conf.in file sets the root home directory to `/root`
+and does not permit its configuration. Change this to `:ROOT_HOME:` which must
+be set before the installation.
+
+The upstream considers the root home directory should not be changed
+<https://github.com/systemd/systemd/issues/27959>
+
+Upstream-Status: Denied
+Signed-off-by: Louis Rannou <lrannou@baylibre.com>
+---
+ sysusers.d/basic.conf.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysusers.d/basic.conf.in b/sysusers.d/basic.conf.in
+index 0aec080a4c..f26c224341 100644
+--- a/sysusers.d/basic.conf.in
++++ b/sysusers.d/basic.conf.in
+@@ -7,7 +7,7 @@
+ 
+ # The superuser
+ g root    0       -            -
+-u root    0:0     "Super User" /root
++u root    0:0     "Super User" :ROOT_HOME:
+ 
+ # The nobody user/group for NFS file systems
+ g {{NOBODY_GROUP_NAME}} 65534       -            -
diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
deleted file mode 100644
index fac288f7fa..0000000000
--- a/meta/recipes-core/systemd/systemd/basic.conf.in
+++ /dev/null
@@ -1,40 +0,0 @@
-#  This file is part of systemd.
-#
-#  systemd is free software; you can redistribute it and/or modify it
-#  under the terms of the GNU Lesser General Public License as published by
-#  the Free Software Foundation; either version 2.1 of the License, or
-#  (at your option) any later version.
-
-# The superuser
-u root    0     "root" :ROOT_HOME:
-
-# The nobody user/group for NFS file systems
-g {{NOBODY_GROUP_NAME}} 65534       -            -
-u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
-
-# Administrator group: can *see* more than normal users
-g adm     {{ADM_GID    }}     -            -
-
-# Administrator group: can *do* more than normal users
-g wheel   {{WHEEL_GID  }}     -            -
-
-# Access to shared database of users on the system
-g utmp    {{UTMP_GID   }}     -            -
-
-# Physical and virtual hardware access groups
-g audio   {{AUDIO_GID  }}     -            -
-g cdrom   {{CDROM_GID  }}     -            -
-g dialout {{DIALOUT_GID}}     -            -
-g disk    {{DISK_GID   }}     -            -
-g input   {{INPUT_GID  }}     -            -
-g kmem    {{KMEM_GID   }}     -            -
-g kvm     {{KVM_GID    }}     -            -
-g lp      {{LP_GID     }}     -            -
-g render  {{RENDER_GID }}     -            -
-g sgx     {{SGX_GID    }}     -            -
-g tape    {{TAPE_GID   }}     -            -
-g tty     {{TTY_GID    }}     -            -
-g video   {{VIDEO_GID  }}     -            -
-
-# Default group for normal users
-g users   {{USERS_GID  }}     -            -
diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 77724eb822..c408035696 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += "systemd"
 SRC_URI += " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-           file://basic.conf.in \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
            file://init \
@@ -30,6 +29,7 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0030-sysusersd-Change-the-user-root-s-home-direct.patch \
            "
 
 # patches needed by musl
@@ -260,10 +260,6 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??= "60"
 
-do_configure:prepend() {
-  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
-}
-
 do_install() {
 	meson_do_install
 	install -d ${D}/${base_sbindir}
@@ -375,6 +371,11 @@ do_install() {
         sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
             ${D}/${sysconfdir}/systemd/system.conf
     fi
+
+	# The root home directory specified in sysusers.d/ was patched to
+	# `:ROOT_HOME:`. Change now to the correct path given by ${ROOT_HOME}.
+	[ ! -f ${D}${libdir}/sysusers.d/basic.conf ] ||
+		sed -i s@:ROOT_HOME:@${ROOT_HOME}@g ${D}${libdir}/sysusers.d/basic.conf
 }
 
 python populate_packages:prepend (){

---
base-commit: 095021ac61c1df357e5f1868badd38038004317f
change-id: 20231005-sysusers3-f448703f294f

Best regards,
-- 
Louis Rannou <louis.rannou@syslinbit.com>


