Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CA8CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 03:00:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.6227.1756263604912470413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 20:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I03qS6KC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756263605; x=1787799605;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iAelrBI4HlDbzkX/kTwFBprtFmRYXc2d+mNpvmIPgok=;
  b=I03qS6KCN2bSseBncaKb42xXB/kW3nBfeEe1j4Umub2Tm6eNass9rXDa
   pbHImPCGKGPNWmk9IXvAns8tOoYrKTLjLJftmaAkitcm00YyZc1U/z5wX
   NFT6F0kIdg27Wvq6CzWMvOZwy5c/mN6glQzqZzGp9q5YtSYCAM/4VDwMV
   jHh+10qZWmFYTMo5clAeSRZ1hiZLZJi/snCh7ikyY/Fn4McFSHDyEzKeP
   dG2MBtZ3ExGgPcN8g4RU4H2wivaA/EndSxMTl1+MmSiusClS4KcdvQqg8
   D5/vC+e7MVz3n0Zz3fU0r3Fuyp5lnFjNmnGy0dmVXFWp25wEFewimT6p2
   w==;
X-CSE-ConnectionGUID: kR7DJXf5QQ2AR0qsebOZUQ==
X-CSE-MsgGUID: kFLzvILcQjmzZ136NR6ypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="210773181"
X-IronPort-AV: E=Sophos;i="6.18,214,1751209200"; 
   d="scan'208";a="210773181"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 12:00:04 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E33BF1C1C70B
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 03:00:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9CCDB14003CF
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 03:00:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 8D81310023C8;
	Wed, 27 Aug 2025 03:00:00 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10FB41A0074;
	Wed, 27 Aug 2025 10:59:57 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH v2] readline: backport a patch to fix issue that readline can't work with samba
Date: Wed, 27 Aug 2025 10:59:50 +0800
Message-ID: <20250827025950.1391-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 03:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222485

smbclient can't accept input after readline upgrade to 8.3
| root # smbclient //192.168.2.16/test -N
|       Try "help" to get a list of possible commands.
|       smb: \>

similar issue has been reported:
https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00011.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../fix-for-readline-event-hook.patch         | 54 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.3.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline/fix-for-readline-ev=
ent-hook.patch

diff --git a/meta/recipes-core/readline/readline/fix-for-readline-event-hoo=
k.patch b/meta/recipes-core/readline/readline/fix-for-readline-event-hook.p=
atch
new file mode 100644
index 0000000000..f3b9d88d15
--- /dev/null
+++ b/meta/recipes-core/readline/readline/fix-for-readline-event-hook.patch
@@ -0,0 +1,54 @@
+From 15970c431517a046099d8294c91d778b1da9b29d Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Fri, 11 Jul 2025 11:51:15 -0400
+Subject: Readline-8.3 patch 1: fix for readline event hook
+
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readline=
.git/commit/?id=3D15970c431517a046099d8294c91d778b1da9b29d]=0D
+Signed-off-by: Chet Ramey <chet.ramey@case.edu>
+---
+ input.c    | 6 +++++-
+ patchlevel | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/input.c b/input.c
+index e6a39e2..3383edb 100644
+--- a/input.c
++++ b/input.c
+@@ -261,13 +261,16 @@ rl_gather_tyi (void)
+   input =3D 0;
+   tty =3D fileno (rl_instream);
+=20
+-  /* Move this up here to give it first shot, but it can't set chars_avai=
l */
++  /* Move this up here to give it first shot, but it can't set chars_avai=
l,
++     so we assume a single character is available. */
+   /* XXX - need rl_chars_available_hook? */
+   if (rl_input_available_hook)
+     {
+       result =3D (*rl_input_available_hook) ();
+       if (result =3D=3D 0)
+         result =3D -1;
++      else
++        chars_avail =3D 1;
+     }
+=20
+ #if defined (HAVE_PSELECT) || defined (HAVE_SELECT)
+@@ -285,6 +288,7 @@ rl_gather_tyi (void)
+ #endif
+       if (result <=3D 0)
+ 	return 0;	/* Nothing to read. */
++      result =3D -1;	/* there is something, so check how many chars below=
 */
+     }
+ #endif
+=20
+diff --git a/patchlevel b/patchlevel
+index d8c9df7..fdf4740 100644
+--- a/patchlevel
++++ b/patchlevel
+@@ -1,3 +1,3 @@
+ # Do not edit -- exists only for use by patch
+=20
+-0
++1
+--=20
+cgit v1.2.3
+
diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-core=
/readline/readline_8.3.bb
index ff5dec6c0a..a2f23eb353 100644
--- a/meta/recipes-core/readline/readline_8.3.bb
+++ b/meta/recipes-core/readline/readline_8.3.bb
@@ -1,6 +1,7 @@
 require readline.inc
=20
 SRC_URI +=3D "file://norpath.patch \
+            file://fix-for-readline-event-hook.patch \
             "
=20
 SRC_URI[archive.sha256sum] =3D "fe5383204467828cd495ee8d1d3c037a7eba1389c2=
2bc6a041f627976f9061cc"
--=20
2.43.0


