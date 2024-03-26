Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECD0CD1282
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7878.1711413455932819648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b1vhqkhT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413456; x=1742949456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/RhI4Lnwvu9uxBzr+YGn77gTnLzqSvuNY8bSqnkQRWA=;
  b=b1vhqkhTBPu/X1Sszvg2sUtysxgk3lavcDE8asBbfu+egk5gTVprYF2Y
   6Qmrw5uxeF5U9dpTrK0jhxbqln0hMFyFs9EwkRPf5Eq8+AMJlKCp3tJUk
   IKWFIov638Jj2l5ajK7oYrghDTpsvB9JxQdwpWw0Ut9Y7Xd/xBoewWJaM
   u5WtYEFRywNo95+W7UknRj5XoCbMFJcpp6WRJSGQSKoNZvX5XwryPATtt
   IUtC9rASv2zpWwO+UYmjminAYjb6vUb5LHUUJCO5edWTV+XxE9M5l46m/
   qUL9E8nDXVFFQbT1qLEOkWBBM0v61Eaps5CqiYM7ZI7jp3ECuh5YckHM4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="152784604"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="152784604"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 574C0C6820
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 88242D595D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E9B620097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B0BD11A006D;
	Tue, 26 Mar 2024 08:37:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 18/34] openssh: upgrade 9.6p1 -> 9.7p1
Date: Tue, 26 Mar 2024 08:34:36 +0800
Message-Id: <1711413292-3025-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--1.931300-10.000000
X-TMASE-MatchedRID: yX2NuvXOYO2jz0nOeth/yaoXHZz/dXlxnJdsOLB4zv4H4DTIEE89jGzd
	Jo28x4enjSLgBhtUjisPXwd5LFzMJ4xxTMlLewfdTPsVRSNcbWNgg7HO8z2tNh0zI+Wuf+4mlmG
	OZvTvMRcqpUY2qAsZh5GWiJbUqB+1v2sAeJ15zQYyByMiwk6+3vZbiRNt1WioTnjJtxuptE2tbj
	X4EGqr7/m95P3ynKSCk9st3EnK5LGIKyp7CdRkYD9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlu6wgz8PTKAFh4Juo6fy8ZbVxLdJTZK3jf031Nfxfj2zM8y4ak9CnjYonKODnJzIFKj3dZ
	SyALReLdo277NJ7kpCALCLzh5l7hWEFKOiC02IGVd49c0zgWM/50iOrqKDEZM/dZg2GSzOVU+LS
	nmZXjGCC7b2E4pswctWKNR2epAFaR9GF2J2xqMxRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07Yjdp2
	MG2wysmbyxBQtVFD/PjO+qfg3m6Br1fDUNGPhTXNxTDRjrctTHCDVeSXA8J43tqEPZD+SQjo3l1
	2bHEk2bxx1WBwP8pj+ywqB9n0kA8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197508

From: Wang Mingyu <wangmy@fujitsu.com>

0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
refresh for 9.7p1

Changelog:
============
New features
------------
 * ssh(1), sshd(8): add a "global" ChannelTimeout type that watches
   all open channels and will close all open channels if there is no
   traffic on any of them for the specified interval. This is in
   addition to the existing per-channel timeouts added recently.
 * All: make DSA key support compile-time optional, defaulting to on.

Bugfixes
--------
 * sshd(8): don't append an unnecessary space to the end of subsystem
   arguments
 * ssh(1): fix the multiplexing "channel proxy" mode, broken when
   keystroke timing obfuscation was added.
 * ssh(1), sshd(8): fix spurious configuration parsing errors when
   options that accept array arguments are overridden
 * ssh-agent(1): fix potential spin in signal handler
 * Many fixes to manual pages and other documentation
 * Greatly improve interop testing against PuTTY.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...optional-support-for-systemd-sd_notify.patch | 17 +++++++----------
 .../{openssh_9.6p1.bb => openssh_9.7p1.bb}      |  2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.6p1.bb => openssh_9.7p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index acda8f1ce9..f079d936a4 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -1,4 +1,4 @@
-From be187435911cde6cc3cef6982a508261074f1e56 Mon Sep 17 00:00:00 2001
+From b02ef7621758f06eb686ef4f620636dbad086eda Mon Sep 17 00:00:00 2001
 From: Matt Jolly <Matt.Jolly@footclan.ninja>
 Date: Thu, 2 Feb 2023 21:05:40 +1100
 Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
@@ -15,10 +15,10 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
  2 files changed, 37 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 22fee70f..486c189f 100644
+index 82e8bb7..d1145d3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4835,6 +4835,29 @@ AC_SUBST([GSSLIBS])
+@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])
  AC_SUBST([K5LIBS])
  AC_SUBST([CHANNELLIBS])
  
@@ -48,7 +48,7 @@ index 22fee70f..486c189f 100644
  # Looking for programs, paths and files
  
  PRIVSEP_PATH=/var/empty
-@@ -5634,6 +5657,7 @@ echo "                   libldns support: $LDNS_MSG"
+@@ -5688,6 +5711,7 @@ echo "                   libldns support: $LDNS_MSG"
  echo "  Solaris process contract support: $SPC_MSG"
  echo "           Solaris project support: $SP_MSG"
  echo "         Solaris privilege support: $SPP_MSG"
@@ -57,7 +57,7 @@ index 22fee70f..486c189f 100644
  echo "           Translate v4 in v6 hack: $IPV4_IN6_HACK_MSG"
  echo "                  BSD Auth support: $BSD_AUTH_MSG"
 diff --git a/sshd.c b/sshd.c
-index 6321936c..859d6a0b 100644
+index b4f2b97..6820a41 100644
 --- a/sshd.c
 +++ b/sshd.c
 @@ -88,6 +88,10 @@
@@ -71,7 +71,7 @@ index 6321936c..859d6a0b 100644
  #include "xmalloc.h"
  #include "ssh.h"
  #include "ssh2.h"
-@@ -310,6 +314,10 @@ static void
+@@ -308,6 +312,10 @@ static void
  sighup_restart(void)
  {
  	logit("Received SIGHUP; restarting.");
@@ -82,7 +82,7 @@ index 6321936c..859d6a0b 100644
  	if (options.pid_file != NULL)
  		unlink(options.pid_file);
  	platform_pre_restart();
-@@ -2086,6 +2094,11 @@ main(int ac, char **av)
+@@ -2093,6 +2101,11 @@ main(int ac, char **av)
  			}
  		}
  
@@ -94,6 +94,3 @@ index 6321936c..859d6a0b 100644
  		/* Accept a connection and return in a forked child */
  		server_accept_loop(&sock_in, &sock_out,
  		    &newsock, config_s);
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index 26cddec942..0a202b3b78 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            "
-SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
+SRC_URI[sha256sum] = "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.34.1


