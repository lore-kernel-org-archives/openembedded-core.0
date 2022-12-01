Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C72BC47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.44788.1669904629420619671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vmxdPhau;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id g10so1761303plo.11
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysF8occMlJ8PD17TNpCn/Co+RAg1mCuk3hn8f6SstSk=;
        b=vmxdPhauZdPrjU5xYpLsJgxxX6i95HTg79S4sy0fVQDECRWe0iXfaGg4qISkrQzBJ/
         XeO/NNk7sysaXlSlppqgPIRC8zPWXzT6azXhWvtI609IpoOD7Z+8ABrI6xNGGcjE7onJ
         iazWN2mYhM2WIPbgYtECqGfvkb4ITqMNDv3Baph4QK4lrhICkiS1f9tgWZ34BX63USUk
         tXBc2Y6a4oL/kBwI0ITYfnCrOZStnRSjWdRtvpWEa/qedHgUbO5qE6k90l3erxyt6Loy
         SJWMhxuxDmzXCJcGGwaG+xJj5l7TZi5obFLju0Z4U7KpJlW3UKFHJOBxp2cFyRQvyfXG
         /dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysF8occMlJ8PD17TNpCn/Co+RAg1mCuk3hn8f6SstSk=;
        b=BS1TUtnklFRqsFg0hXYwwEIyu53XE/2nGccminfCza0RIXUqBmXY4jjmT42UF4uZOF
         /TNdDmYHFC9p/lKQucSeElyxkTv1AmYKxSC91elFc0My9f7zbAQ+T+thlSy+6b8TTNm4
         SxVLffywAQcFU+NkgPyTeclpOnHlxUfvRsSKQowgTVqVHoBY3WkS1OXc+ud0yetHwbfu
         LUaBPYTenu+FVlN+t4EK18KCxhAzvTYwZ7KOmSnqjebKFlMqhh5nhFQWvqrUVyDAC4O3
         OlqVMUcNU/WFcYGfRagfIkEfW3/p4xEaSSM8w4or9S7fizKHJ+GFP8TkWU92+DnmYurp
         buug==
X-Gm-Message-State: ANoB5pni/vUrJdwKRGMVhCRPrLU/OCqillOMVMOv9/okUerjB6jzyl4E
	S9SmARzZg5e8q4e629GC55qwpm2SJybJ3DKFw0U=
X-Google-Smtp-Source: AA0mqf6vYiaNdjRQE/mWRnq1C/5jkeWkiAaCnszN92x+RQnqEe5ZCXEPdBIwOyDix1nXmVQ9gb58dQ==
X-Received: by 2002:a17:902:f609:b0:188:a8a2:f43a with SMTP id n9-20020a170902f60900b00188a8a2f43amr57776778plg.130.1669904628295;
        Thu, 01 Dec 2022 06:23:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/22] dhcpcd: fix to work with systemd
Date: Thu,  1 Dec 2022 04:22:50 -1000
Message-Id: <a56579912c5fa9c0d1f1e4fcefdbf75c1d13ab1f.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174083

From: Chen Qi <Qi.Chen@windriver.com>

Currently, dhcpcd does not work well with systemd. When using dhcpcd
to configure network, the /etc/resolv.conf contents are not correct.
This issue could easily be reproduced by using 'qemu + slirp' to
start a systemd based image and using dhcpcd to configure network.
The expected 'nameserver 10.0.2.3' is not in /etc/resolv.conf.

The root cause of this problem is that dhcpcd assumes the resolvconf
should recognize .protocol suffix[1]. But systemd's resolvconf (which
is a symlink to resolvectl) has a limited support for traditional
resolvconf interface[2], and "may not work with all clients"[3]. This
of cource includes the clients that use the .protocol suffix.

The current situation is:
1. systemd is not going to support the .protocol suffix in the foreseeable
   near future[4].
2. dhcpcd does not want to merge systemd specific patch and insists
   systemd needs to consider the .protocol suffix[5][6].

It's a normal thing that people have different opinions. As a build system
that supports such combination, however, we do need to come up with a
solution to fix this typical integration problem, making dhcpcd and systemd
work together.

This patch solves this integration problem by relying on dhcpcd's ability
to manage its own resolv.conf contents. But instead of letting it to write
to /etc/resolv.conf directly, we supply the generated contents to resolvconf.
In this way, the resolvconf still stands in the central place and dhcpcd remains
a supplier to it. And the /etc/resolv.conf can get the correct contents.
With this patch, dhcpcd could work with both sysvinit and systemd.

[1] https://man.archlinux.org/man/resolvconf.8.en
[2] https://man.archlinux.org/man/resolvectl.1#COMPATIBILITY_WITH_RESOLVCONF(8)
[3] https://wiki.archlinux.org/title/systemd-resolved
[4] https://github.com/systemd/systemd/issues/25032
[5] https://github.com/NetworkConfiguration/dhcpcd/pull/152
[6] https://github.com/NetworkConfiguration/dhcpcd/issues/146

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 935ae419f51d911c73f5dc7b4a2e5e9a7b206985)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...mprove-the-sitation-of-working-with-.patch | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index ab6ffe986c..1d03de09c8 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -13,6 +13,7 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
+           file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
new file mode 100644
index 0000000000..6f90c88249
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -0,0 +1,82 @@
+From 02acc4d875ee81e6fd19ef66d69c9f55b4b4a7e7 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 9 Nov 2022 16:33:18 +0800
+Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
+
+systemd's resolvconf implementation ignores the protocol part.
+See https://github.com/systemd/systemd/issues/25032.
+
+When using 'dhcp server + dns server + dhcpcd + systemd', we
+get an integration issue, that is dhcpcd runs 'resolvconf -d eth0.ra',
+yet systemd's resolvconf treats it as eth0. This will delete the
+DNS information set by 'resolvconf -a eth0.dhcp'.
+
+Fortunately, 20-resolv.conf has the ability to build the resolv.conf
+file contents itself. We can just pass the generated contents to
+systemd's resolvconf. This way, the DNS information is not incorrectly
+deleted. Also, it does not cause behavior regression for dhcpcd
+in other cases.
+
+Upstream-Status: Inappropriate [OE Specific]
+This patch has been rejected by dhcpcd upstream.
+See details in https://github.com/NetworkConfiguration/dhcpcd/pull/152
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ hooks/20-resolv.conf | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/hooks/20-resolv.conf b/hooks/20-resolv.conf
+index 504a6c53..eb6e5845 100644
+--- a/hooks/20-resolv.conf
++++ b/hooks/20-resolv.conf
+@@ -11,8 +11,12 @@ nocarrier_roaming_dir="$state_dir/roaming"
+ NL="
+ "
+ : ${resolvconf:=resolvconf}
++resolvconf_from_systemd=false
+ if type "$resolvconf" >/dev/null 2>&1; then
+ 	have_resolvconf=true
++	if [ $(basename $(readlink -f $(which $resolvconf))) = resolvectl ]; then
++		resolvconf_from_systemd=true
++	fi
+ else
+ 	have_resolvconf=false
+ fi
+@@ -69,8 +73,13 @@ build_resolv_conf()
+ 	else
+ 		echo "# /etc/resolv.conf.tail can replace this line" >> "$cf"
+ 	fi
+-	if change_file /etc/resolv.conf "$cf"; then
+-		chmod 644 /etc/resolv.conf
++	if $resolvconf_from_systemd; then
++		[ -n "$ifmetric" ] && export IF_METRIC="$ifmetric"
++		"$resolvconf" -a "$ifname" <"$cf"
++	else
++		if change_file /etc/resolv.conf "$cf"; then
++			chmod 644 /etc/resolv.conf
++		fi
+ 	fi
+ 	rm -f "$cf"
+ }
+@@ -170,7 +179,7 @@ add_resolv_conf()
+ 	for x in ${new_domain_name_servers}; do
+ 		conf="${conf}nameserver $x$NL"
+ 	done
+-	if $have_resolvconf; then
++	if $have_resolvconf && ! $resolvconf_from_systemd; then
+ 		[ -n "$ifmetric" ] && export IF_METRIC="$ifmetric"
+ 		printf %s "$conf" | "$resolvconf" -a "$ifname"
+ 		return $?
+@@ -186,7 +195,7 @@ add_resolv_conf()
+ 
+ remove_resolv_conf()
+ {
+-	if $have_resolvconf; then
++	if $have_resolvconf && ($if_down || ! $resolvconf_from_systemd); then
+ 		"$resolvconf" -d "$ifname" -f
+ 	else
+ 		if [ -e "$resolv_conf_dir/$ifname" ]; then
+-- 
+2.17.1
+
-- 
2.25.1


