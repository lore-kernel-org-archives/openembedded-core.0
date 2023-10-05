Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B15E9371D
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 20:55:34 +0000 (UTC)
Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net [46.105.41.146])
 by mx.groups.io with SMTP id smtpd.web10.27116.1696539325287145184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 13:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.41.146, mailfrom: louis.rannou@syslinbit.com)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.4.200])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 84859291DB
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Oct 2023 20:55:23 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wkk7s (unknown [10.110.208.177])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 83F0B1FD2B;
	Thu,  5 Oct 2023 20:55:22 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.107])
	by ghost-submission-6684bf9d7b-wkk7s with ESMTPSA
	id 6aBnFboiH2VZ8T0AXEzvBQ
	(envelope-from <louis.rannou@syslinbit.com>); Thu, 05 Oct 2023 20:55:22 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-107S001222c1352-f553-4e14-a562-73857f318815,
                    A259665E654FE42822A5C0823C1B5AAC1FDAC875) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 193.33.56.84
From: Louis Rannou <louis.rannou@syslinbit.com>
Date: Thu, 05 Oct 2023 22:55:08 +0200
Subject: [PATCH v2] systemd: sysusersd: change how the root home directory
 is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231005-sysusers3-v2-1-938c9cca79b7@syslinbit.com>
X-B4-Tracking: v=1; b=H4sIAKsiH2UC/z3MQQ6CMBCF4auQWTtm2qIFV97DGFNgKk2EmikSC
 eHuNi5Y/sl73wqJJXCCS7GC8BxSiGMOfSig7d34ZAxdbtCkjSI6YVrSJ3+SQV+WlSXjdV16yPu
 3sA/fv3W75/YSB5x6YbcLZLXdhYfEOOGsUCGburFn0l1FfG3c8gqN8LGNA2zbD9zgwFCjAAAA
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com, Qi.Chen@windriver.com, 
 Louis Rannou <lrannou@baylibre.com>, 
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 Louis Rannou <louis.rannou@syslinbit.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696539322; l=4397;
 i=louis.rannou@syslinbit.com; s=20230525; h=from:subject:message-id;
 bh=iiskJ1OCwgOT3C+jkBqlUsD8yr8xnj+6iZ/q4D7QzrU=;
 b=xAR7V8UKzvwOgnAgOGgBYyjN4yIjr50xFiAIpOyzfFHaMiv+uQp/ekm+cgCzEeU9kB4jgnGlH
 z4VIPdx4QGWDE9N3CZB5q4XETYhhqkmx8YKTO/pwJE52mftktS1Lvzx
X-Developer-Key: i=louis.rannou@syslinbit.com; a=ed25519;
 pk=YvNJAioiQmOQYTta3eRaRV3xzOzDE0YgBIwM3nJXa4c=
X-Ovh-Tracer-Id: 2502594019816365392
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeggdduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnhepvddvteegjeduvdefleegveevgeehteejfeejtdeivdetleehleefffdugfeffeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptghonhhfrdhinhdpghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdduleefrdeffedrheeirdekgedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 20:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188739

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
 ...usersd-Change-the-user-root-s-home-direct.patch | 31 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_254.4.bb         | 11 ++++----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
new file mode 100644
index 0000000000..dd0d96d11b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-sysusersd-Change-the-user-root-s-home-direct.patch
@@ -0,0 +1,31 @@
+From bf97001978cdefad644f7b4b909f281368e5a4dd Mon Sep 17 00:00:00 2001
+From: Kas User <kas@example.com>
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
diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 77724eb822..3adf62935d 100644
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
+           file://0029-sysusersd-Change-the-user-root-s-home-direct.patch \
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


