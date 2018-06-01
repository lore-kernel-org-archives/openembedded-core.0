Return-Path: <nick83ola@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 124AC74A17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 09:30:46 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 18-v6so1741267wml.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 02:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=VsAzOqpthiL+Am8/j1N9VDYUwUrlgq65IbSRPlIyew4=;
	b=KSZQy/88DRfkdY9R5fsmAAK9efEQ5fDE1/5bMyQKjWKRBSKmGUjyVLmj+0cRow54kE
	mD3a6+wPSQGL0BdK1qkLvux1+ZqJ1ymBaFMur3upNc6eiygJKSyXnTxCYzPxBCm67zLW
	pYMELzhH6OQtnvfZdmQMGSoyV6T21996ZQlcD7YbMW5rnGQQLcBzOiGp3ioQvuwn8HEs
	roqFngt4MA7oR2KhzLy/nH35bvNKklTfn1kpOiyx35Fa1ZH7jxEUHDuXURsfhCQ/plPf
	YFhpmWHU4Sif184cwQuPMmKOPvw/yxiU4I/LH2jJJkEU6d8d5W7PS3vQ7Bz7TQU9vCh8
	R0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VsAzOqpthiL+Am8/j1N9VDYUwUrlgq65IbSRPlIyew4=;
	b=aI5e2NxCS6www1fHRlN/YXyvVckaqXkzNifxsYJQgR1p7S1sHCk3+Hm/FJFpDSaZnO
	eGZ/o0lcOfuRWNDhNSMdYLew8Si1onDL5QnAmAaIdc//RqKP5s1AGhcYZEmRFftp6t4P
	MENsD/UOjcxGdScxxh9mRih2aoVlMWJ9XofW4zpVldtUpRDfwgz6BzwkiTlxA6OAV6ce
	w8RTVgAXX1Nhquu/1FgFNWIkSEDkQ+UPZctdzXopsJGsMuOtIERL5ync4J1jRhmTdyj3
	TGKR/jPBmD5mqa6ABz63hLuTupZNx2MhomoCGtjNA8djYt5+9OhzJ+qydj6RwQxbjXH5
	tVMw==
X-Gm-Message-State: ALKqPwe+x28tKyk1Aay9a4Pk9nCtZQ4F2NvMngR0NNw4gV8U88ELo1Wu
	DN2XCyd/Rpy/I0wpbP/e2VQ+rg==
X-Google-Smtp-Source: ADUXVKLAzJeBCFy7ATZH4UVzTA9cir8NKeZ4Q99eyYz1ZGfWF2gCZXzjdjz1OniaH+OwhAeY56vPLA==
X-Received: by 2002:aa7:d419:: with SMTP id
	z25-v6mr11371140edq.203.1527845447369; 
	Fri, 01 Jun 2018 02:30:47 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w26-v6sm21417210edq.77.2018.06.01.02.30.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 02:30:46 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 10:30:44 +0100
Message-Id: <20180601093044.10062-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH v2] core: fix /sbin/nologin path
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
X-List-Received-Date: Fri, 01 Jun 2018 09:30:47 -0000

In some yocto recipes the /sbin/nologin path is incorrectly set to
/bin/nologin. set it to the correct path ${base_sbindir}/nologin

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-selftest/files/static-passwd        | 20 ++++++++++----------
 meta/classes/rootfs-postcommands.bbclass |  4 ++--
 meta/recipes-core/systemd/systemd_237.bb | 19 +++++++++++--------
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 412f85d469..fe1f3247d4 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -1,11 +1,11 @@
 messagebus:x:500:500::/var/lib/dbus:/bin/false
-systemd-bus-proxy:x:501:501::/:/bin/nologin
-systemd-network:x:502:502::/:/bin/nologin
-systemd-resolve:x:503:503::/:/bin/nologin
-systemd-timesync:x:504:504::/:/bin/nologin
-polkitd:x:505:505::/:/bin/nologin
-avahi:x:509:509::/:/bin/nologin
-avahi-autoipd:x:510:510::/:/bin/nologin
-rpc:x:511:511::/:/bin/nologin
-distcc:x:512:nogroup::/:/bin/nologin
-rpcuser:x:513:513::/var/lib/nfs:/bin/nologin
+systemd-bus-proxy:x:501:501::/:/sbin/nologin
+systemd-network:x:502:502::/:/sbin/nologin
+systemd-resolve:x:503:503::/:/sbin/nologin
+systemd-timesync:x:504:504::/:/sbin/nologin
+polkitd:x:505:505::/:/sbin/nologin
+avahi:x:509:509::/:/sbin/nologin
+avahi-autoipd:x:510:510::/:/sbin/nologin
+rpc:x:511:511::/:/sbin/nologin
+distcc:x:512:nogroup::/:/sbin/nologin
+rpcuser:x:513:513::/var/lib/nfs:/sbin/nologin
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index a4e627fef8..31f630af81 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -63,7 +63,7 @@ systemd_create_users () {
 		[ -e $conffile ] || continue
 		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
 		if [ "$type" = "u" ]; then
-			useradd_params="--shell /sbin/nologin"
+			useradd_params="--shell ${base_sbindir}/nologin"
 			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
 			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
 			useradd_params="$useradd_params --system $name"
@@ -79,7 +79,7 @@ systemd_create_users () {
 				eval groupadd --root ${IMAGE_ROOTFS} --system $group
 			fi
 			if [ ! `grep -q "^${name}:" ${IMAGE_ROOTFS}${sysconfdir}/passwd` ]; then
-				eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system $name
+				eval useradd --root ${IMAGE_ROOTFS} --shell ${base_sbindir}/nologin --system $name
 			fi
 			eval usermod --root ${IMAGE_ROOTFS} -a -G $group $name
 		fi
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 7ef42b2eae..b55614158d 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -300,16 +300,19 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
+
+base_useradd_params = "--system -d / -M --shell ${base_sbindir}/nologin"
+
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${base_useradd_params} systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${base_useradd_params} systemd-journal-remote;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${base_useradd_params} systemd-journal-upload;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '${base_useradd_params} systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '${base_useradd_params} systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '${base_useradd_params} systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '${base_useradd_params} systemd-resolve;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
-USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
+USERADD_PARAM_${PN}-extra-utils += "${base_useradd_params} systemd-bus-proxy;"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
2.17.0


