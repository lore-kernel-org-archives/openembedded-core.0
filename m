Return-Path: <nick83ola@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D23B74F00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 17:25:07 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id q4-v6so3571031wmq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 10:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ooEdkBvizlY9yOT/nmbaCo4hJPN8CCqabVPBQ6pMb28=;
	b=tI6P/NT7aGXDU5kv6ScPxL/WcwPXN8RpHpP/NGbgAx7NYXVJZPHcH88wPAtLBeU5Yu
	s9mVBJm2TKDH8dPTb3rUJkW/8zEcgqdqPrp6Fe8FkiFcXw2iVdom0Sivvy6KM+m80+9C
	p51VAMQFa12VFnc8XjMfd0URfr0T7Pej3zOTO1JnvFp+wQRO+Ghij9mo7lBm9Rs3HB1i
	Ns7TeAC/MLdfpyq418FT7hrPE9zOc9hcPVRuf+Hl/u6dUajflXB+upsHqWX3vjCLf9tn
	2LhmHuqLwTSwVV4jjacDROTV+GTWW8E7PJmmiznwvn7PcfWHMC9G4X5Rx2I3YtYcYy8W
	RK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ooEdkBvizlY9yOT/nmbaCo4hJPN8CCqabVPBQ6pMb28=;
	b=ee3J0h7H5XpqfAVwRjML9YlMRzxMOUKXqyRVeJtZ4JMuqE9SCVLkW+5Naqfpk3XeVF
	I5ofJYFcYteLQjT+x6MB5+hOoNM/sWNpJKi1bzHy6FqdxvyWnovNUXRmxiUO2gpfumk/
	LqRp1QP4FLgGGa3LxhorOTnrqPkJ2G9dBEGJfLPuAfnzixwtMQVEurYU3Fzedc1NykEn
	T/ySAqaz/S8RkGZ1vq1ZeXNthp3TGBZug0iTZ4NsLeDt82E51XPnPWzXo1lPUm/Ntc5V
	ENGvXLLL9QnlrFUxvk5+51qAnEDeNxfp61wOOrM2g3uuIsJcKl+u/slQvNy7NeJxiBg2
	y1kQ==
X-Gm-Message-State: ALKqPwdus4NMvzKJkexB9FcMUBuiQ5MDw7JkZNTTo4Kyo6i6ETw2epCt
	VhI95074hRkdoP0JfXvVZ/j2W/ZV
X-Google-Smtp-Source: ADUXVKJvQuG4HW84AKKpe4Gr3xqnL9ZmkhtCQqfBbvxWPQUG1RbofZTnl6VTY+d9ynhzyRqhMfHGxg==
X-Received: by 2002:a50:bb41:: with SMTP id
	y59-v6mr2749614ede.175.1527787507592; 
	Thu, 31 May 2018 10:25:07 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w1-v6sm22849508edk.7.2018.05.31.10.25.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 May 2018 10:25:06 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 18:25:04 +0100
Message-Id: <20180531172504.28519-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] core: fix /sbin/nologin path
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
X-List-Received-Date: Thu, 31 May 2018 17:25:07 -0000

In some yocto recipes the /sbin/nologin path is incorrectly set to
/bin/nologin. set it to the correct path ${base_sbindir}/nologin

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-selftest/files/static-passwd        | 20 ++++++++++----------
 meta/classes/rootfs-postcommands.bbclass |  6 +++---
 meta/recipes-core/systemd/systemd_237.bb | 19 +++++++++++--------
 3 files changed, 24 insertions(+), 21 deletions(-)

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
index a4e627fef8..0ee7391957 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -62,8 +62,8 @@ systemd_create_users () {
 	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
 		[ -e $conffile ] || continue
 		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
-		if [ "$type" = "u" ]; then
-			useradd_params="--shell /sbin/nologin"
+		if [ "$type" = "u" ]; then:w
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


