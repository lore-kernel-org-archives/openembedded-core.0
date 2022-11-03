Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DE4C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:31:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.16126.1667453478748179206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TkKxCpma;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453476; i=@fujitsu.com;
	bh=fQQTdkYmDJr+KlikEzUMJ/jNCBR5WBFsQEeFNP5AHjo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TkKxCpmaEAeGDhubCMn9YwPR1fn3VcmqclZ2a/NQItkIzEcEJbDMR4agxN1+2SZHV
	 xXWR08hRT4grgO2zLQtQFVL3GMG88UFqtqo7o8NOocjABVKK3fc5hMWVzwBDVThIS6
	 g4A7+STi4gG97DXpLQ4L/NDJW9Er7ygaiNqVqRVC6hZ+yrCOUzvXBqnM82MJIz2KdJ
	 xW9UbQEfLUy11BbtthYS8PBTEzhzJ/aonyp4xyeHTHdJh1a/vDzBNvfvzimrUXaVnE
	 GmV5mZ3y+1etZ5ytoP8B59rN9tQ5DmmBJi/vB/Y72jQ0J2dfGkisTP4TrSiBq1uFq8
	 KCgSCU7TheJEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxSVclKDn
  ZYOJ8bos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNplmDBV6WKeQdnsTYwTpTrYuTiEBJ4zCix
  ff8hFgjnGpPEnMYuVghnN6PExKvtbF2MnBxsAlISN+7/B7I5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC1hIHLlzhxXEZgGKT767jwXE5hVwkphz7xNYXEJAQWLKw/fMIDangLPEz/ZZYLYQUM3KHW
  ug6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGlrqJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgSGbkqx4rodjNOX/dE7xCjJwaQkyntlZ1KyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQler
  cDkZCHBotT01Iq0zBxgHMGkJTh4lER4r/sBpXmLCxJzizPTIVKnGO05ps7+t5+ZYzmYnPm17Q
  Azx6Z9XQeYhVjy8vNSpcR5I0GmCoC0ZZTmwQ2Fxf0lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hy
  MSsK8W0GW82TmlcDtfgV0FhPQWduqk0DOKklESEk1MC02k8mWeZ2w7gbv3sjMeDb/Nz8Oapgc
  6lo5/83q9XXGLiWWP/65OX5neazwMuHPlh4Tdvkwa/v57KuPVv5euEV4lZITj/1dgb1rBC4lf
  zUqXa5z/t7j47cD0iUX77xsKpBgdLFJY47tvQWbnT5pCG9sU2LhyL5f8ONy5xlz7fPya0sWFQ
  r5WBb7Tdlju8BHOWTll6fpytv3q3O4FaYvmHuv90TZWv9+rr5qU4YpUjUs0d8jCkL9bqXmnH9
  ov0OZX36t4ATxfacezNHiPPHX7MWTTUVbGXwey3i+4JT+8K/zt87LH9nGNexuVSx7OXp0DDtS
  Ss90/8mbnK8eZGilwCdQI1jUHmU6pXdqQ8g1JZbijERDLeai4kQAUAQk93YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1667453476!134287!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6979 invoked from network); 3 Nov 2022 05:31:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:31:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DE8EC1000DC
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D26C11000DB
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:31:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:31:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] inetutils: upgrade 2.3 -> 2.4
Date: Thu, 3 Nov 2022 13:30:48 +0800
Message-ID: <1667453448-28192-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
References: <1667453448-28192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172606

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2022-39028.patch
removed since it's included in 2.4

Changelog:
==========
ifconfig
------------
Support specifying prefix netmask lengths in -A.
Hurd: tell pfinet translator interfaces to configure

ftp
----------
Avoid crash caused by signed integer overflow resulting in out-of-bounds buffer access.
Avoid crash caused by heap buffer overflow.
Avoid crash caused by NULL pointer dereference.
Avoid crash caused by infinite macro recursion.

telnetd
-----------
Avoid crash on 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).  CVE-2022-39028

telnet
-----------
Fix a buffer overflow problem.  CVE-2019-0053

tftp
-----------
Avoid crashing when given unexpected or invalid commands from tty.
Various bugs fixes, internal improvements and clean ups.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 -------------------
 .../{inetutils_2.3.bb => inetutils_2.4.bb}    |  3 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
 rename meta/recipes-connectivity/inetutils/{inetutils_2.3.bb => inetutils_2.4.bb} (98%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
deleted file mode 100644
index 3b07515c7b..0000000000
--- a/meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From d52349fa1b6baac77ffa2c74769636aa2ece2ec5 Mon Sep 17 00:00:00 2001
-From: Erik Auerswald <auerswal@unix-ag.uni-kl.de>
-Date: Sat, 3 Sep 2022 16:58:16 +0200
-Subject: [PATCH] telnetd: Handle early IAC EC or IAC EL receipt
-
-Fix telnetd crash if the first two bytes of a new connection
-are 0xff 0xf7 (IAC EC) or 0xff 0xf8 (IAC EL).
-
-The problem was reported in:
-<https://pierrekim.github.io/blog/2022-08-24-2-byte-dos-freebsd-netbsd-telnetd-netkit-telnetd-inetutils-telnetd-kerberos-telnetd.html>.
-
-* NEWS: Mention fix.
-* telnetd/state.c (telrcv): Handle zero slctab[SLC_EC].sptr and
-zero slctab[SLC_EL].sptr.
-
-CVE: CVE-2022-39028
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=fae8263e467380483c28513c0e5fac143e46f94f]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- telnetd/state.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/telnetd/state.c b/telnetd/state.c
-index ffc6cba..c2d760f 100644
---- a/telnetd/state.c
-+++ b/telnetd/state.c
-@@ -312,15 +312,21 @@ telrcv (void)
- 	    case EC:
- 	    case EL:
- 	      {
--		cc_t ch;
-+		cc_t ch = (cc_t) (_POSIX_VDISABLE);
- 
- 		DEBUG (debug_options, 1, printoption ("td: recv IAC", c));
- 		ptyflush ();	/* half-hearted */
- 		init_termbuf ();
- 		if (c == EC)
--		  ch = *slctab[SLC_EC].sptr;
-+		  {
-+		    if (slctab[SLC_EC].sptr)
-+		      ch = *slctab[SLC_EC].sptr;
-+		  }
- 		else
--		  ch = *slctab[SLC_EL].sptr;
-+		  {
-+		    if (slctab[SLC_EL].sptr)
-+		      ch = *slctab[SLC_EL].sptr;
-+		  }
- 		if (ch != (cc_t) (_POSIX_VDISABLE))
- 		  pty_output_byte ((unsigned char) ch);
- 		break;
--- 
-2.37.3
-
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.3.bb b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
similarity index 98%
rename from meta/recipes-connectivity/inetutils/inetutils_2.3.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.4.bb
index 2fce84374d..6519331141 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.3.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.4.bb
@@ -10,7 +10,7 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "0b01bb08e29623c4e3b940f233c961451d9af8c5066301add76a52a95d51772c"
+SRC_URI[sha256sum] = "1789d6b1b1a57dfe2a7ab7b533ee9f5dfd9cbf5b59bb1bb3c2612ed08d0f68b2"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
@@ -21,7 +21,6 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
-           file://CVE-2022-39028.patch \
 "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.25.1


