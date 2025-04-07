Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6008C36018
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 18:02:22 +0000 (UTC)
Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
 by mx.groups.io with SMTP id smtpd.web11.54169.1744048201473336134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 10:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=c+C2lYEw;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.69, mailfrom: jeroen@myspectrum.nl)
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4ZWcDQ6vKNzxPJL;
	Mon,  7 Apr 2025 19:49:58 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission5.mail.transip.nl (Postfix) with ESMTPSA id 4ZWcDQ1XcGz34SDmt;
	Mon,  7 Apr 2025 19:49:58 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id BD2B320338;
	Mon,  7 Apr 2025 17:49:56 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Mon, 07 Apr 2025 19:49:56 +0200
From: Jeroen Hofstee <jeroen@myspectrum.nl>
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug devices
Date: Mon,  7 Apr 2025 19:49:04 +0200
Message-ID: <20250407174904.1191173-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1744048198; h=from:subject:to:cc:date:
 mime-version; bh=p688b472cUSue3RK0mq/14o3zkhSOp200e23T0KhgOg=;
 b=c+C2lYEwzCVUAx5ax6TLtG9S0W/W7QVwsyPSu2p/BSHDhg5U813I5UJwjpwn8FgfOjnVGp
 9e1Gp6zuH+NcLnKdPliBF/rMi3THpfzLlQ2Ts9AstiVDgg3CRhrY08KUgPSSlO/Q7STj9A
 VYHMkEYNJHq7LdAEaorkGwugJiQM0Sm8shru0eIJfx4RxjomvpYoZslatoWjIkHWRPZ2rA
 k346RoqBNbPnh59PagRyWaPadOa1vqAgufQZPYEGJAOaujHBt4f+G6Nsi1aDNmlbpOlSPn
 1k0pzd8p4aN/uFEQ5+LDSMa3+Y/Vut0a6fLjj3E8p3/VYKz49DDmzEBoNcEVJA==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 18:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214474

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Commit 160f713917 (udev-extraconf: fix network.sh script did not
configure hotplugged interfaces, 2024-10-18) fixed ifupdown for
hotplug devices, but also calls it for non hotplug devices. That
can cause issue, since they might not expect the ifupdown from
udev, since it wasn't called before mentioned patch got merged.

For util-linux this can simply be fixed by adding --allow=3Dhotplug.
Unfortunately busybox doesn't have that option, so a function is
added to check if the device is marked as allow-hotplug.

Since wilcards are supported adding 'allow-hotplug *' allows to
restore behaviour of mentioned patch, while this restores the
original behaviour.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../udev/udev-extraconf/network.sh            | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/reci=
pes-core/udev/udev-extraconf/network.sh
index 500e60ae61..da79f00d5a 100644
--- a/meta/recipes-core/udev/udev-extraconf/network.sh
+++ b/meta/recipes-core/udev/udev-extraconf/network.sh
@@ -6,6 +6,34 @@ echo "$INTERFACE" | grep -q wifi && exit 0
 # udevd does clearenv(). Export shell PATH to children.
 export PATH
=20
+# udev should only trigger ifupdown for interfaces marked as allow-hotpl=
ug
+# and with util-linux that is as simple as adding --allow=3Dhotplug.
+# Busybox unfortunately doesn't have this option.
+# allow-hotplug is a pattern like eth0 /eth* /eth*/1 /eth*=3Deth.
+# This function checks if INTERFACE matches an allow-hotplug pattern.
+
+allow_hotplug() {
+    allow_hotplug=3D"$(sed -n -e 's/^allow-hotplug \+\([^=3D ]*\).*/\1/p=
' /etc/network/interfaces)"
+    for pattern in $allow_hotplug; do
+        options=3D"$(echo $pattern | sed -n -e 's,^/\?[^ /]\+/\(.*\),\1,=
p')"
+        value=3D"$(echo $pattern | sed -n -e 's,^/\?\([^ /]\+\).*,\1,p')=
"
+        interfaces=3D"$(ls -d /sys/class/net/$value 2>/dev/null | xargs =
-r -n 1 basename)"
+        if [ "$options" !=3D "" ]; then
+            interfaces=3D"$(echo $interfaces | awk -v n=3D$options '{pri=
nt $n }')"
+        fi
+        echo "$interfaces" | grep -w -q "$INTERFACE"
+        if [ $? -eq 0 ]; then
+            return 0
+        fi
+    done
+
+    return 1
+}
+
+if ! allow_hotplug; then
+    exit 0
+fi
+
 # if this interface has an entry in /etc/network/interfaces, let ifupdow=
n
 # handle it
 if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
--=20
2.43.0


