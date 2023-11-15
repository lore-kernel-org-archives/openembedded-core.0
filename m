Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689FCC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:16:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8609.1700036164472360418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="127737259"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="127737259"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:16:01 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 875ADD7AE3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:15:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6AF5BF4B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:15:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F32B26B806;
	Wed, 15 Nov 2023 17:15:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gawk: upgrade 5.2.2 -> 5.3.0
Date: Wed, 15 Nov 2023 16:10:29 +0800
Message-Id: <1700035829-1053-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.005
X-TMASE-Result: 10--2.245200-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrDkGqqFtcAKmhLh9e7qvSIn+j
	vhRCUKYACqIlUwwPgewNYIDF+TyWATyDV8RhnfzbL7p//vLv4bMQOcMSo0926s42FQxklqQfBk0
	sRysFrTB4h7gdDyV0VjpjKkcQso9FjRM7rJP1es9rzsINdopFUja6AaQm7fhmquRH0gOc9z9th1
	r0fdARdeh3HSbFm9e65tPA3/kabXpaQiLka9EcSj9B1SHosSXQwTlc9CcHMZerwqxtE531VGlF7
	OhYLlct64z3m7e5JGx5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFGYOQ5hyKEr7tu0o
	3rAH+Lx1GuFftrhJJqj0tElRYzhG5RrQpNiOnoQZieWvuluwyeABPHHOoFhYkwpm+yWT9kALEvA
	ieHFGvux9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190561

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
1. Infrastructure changes: Removed the use of libsigsegv. The
   value-add was never very much and it caused problems in some
   environments.
2. In keeping with new features in BWK awk, gawk now has built-in
   CSV file parsing. The behavior is intended to be identical to
   that of the "One True AWK" when --csv is applied. See the
   manual for details.
3. Also in keeping with BWK awk, gawk now supports a new \u escape
   sequence. This should be followed by 1-8 hexadecimal digits. The
   given code point is converted to its corresponding multibyte encoding
   for storage inside gawk. See the manual.
4. If PROCINFO["BUFFERPIPE"] exists, then pipe output is buffered.
   You can also use PROCINFO["command", "BUFFERPIPE"]. See the manual
   for details.
5. Because of the additional `do_csv' variable in the API, which breaks
   binary compatibility, the API major version was updated to 4 and
   the minor version was reset to zero.  The API remains source code
   compatible; that is, existing extensions should only require recompilation.
6. The manual now requires Texinfo 7.1 and its texinfo.tex for formatting.
   As a result, we no longer need to pre-process it, removing the need
   for gawktexi.in and leaving just gawk.texi.
7. And of course, there have been several minor code cleanups and bug fixes.
   See the ChangeLog for details.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} (97%)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.2.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
similarity index 97%
rename from meta/recipes-extended/gawk/gawk_5.2.2.bb
rename to meta/recipes-extended/gawk/gawk_5.3.0.bb
index 3c18b6911a..3d652da6e5 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650"
+SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.34.1


