Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6665CC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:26:00 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.8671.1644308758252805094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DGAnWBM+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308756; i=@fujitsu.com;
	bh=KHIOuXnPzowTeDgthbXr4oS2ZihnyaqsFdPqyYHNU/0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DGAnWBM+GJIzEdQTS9o7zexWYEfHKHaDqEkW3hFTKiHJtBCW6uCgdLo++TQ3YaQfO
	 bBjKQOfnOfHduITvPuHsyqX1E5lp/HFyb2a26XAVnPqqDPA68+71RinJC/yv7hwMa8
	 6nQi3dunvqu49qXjEyDso9irwp96iAGXSymyYvKcDzOO5j0xs2X5vxwgv71sf7bgD+
	 OMNsciB5a/AncLo0ltSgOacSWBy+GEj0uTVhV8kBNYh5bN4BSTP3jKsRhd6/NjBqp4
	 XJB9Qq4I44PgqAWw92DJO8Ib/fp893N9kIwLdWGbCz2W/Y+hrK0tvqCeEG4WYUkMek
	 CDAstVPKSJDDQ==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 97/9E-12986-41922026;
 Tue, 08 Feb 2022 08:25:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqCusyZR
  k0HdP2eLOz3fsDowe5zauYAxgjGLNzEvKr0hgzfiwZQp7wRzxiqc3/jI3MH4W7mLk4hASeMwo
  seLQcRYI5zyTxJ8/TUwQznFGidmN75m7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwFji9LcjYDYLUPz2nI2MIDavgKPE2tcLWUFsCQEFiSkPIUbyCghKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRMKspMzyjJTczM0TU
  0MNA1NDTVNda1MNNLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMyZRi5rAd
  jH96f+odYpTkYFIS5U1SZUoS4kvKT6nMSCzOiC8qzUktPsQow8GhJMF7RhwoJ1iUmp5akZaZA
  4wPmLQEB4+SCO9xdaA0b3FBYm5xZjpE6hSjopQ4bzJIQgAkkVGaB9cGi8lLjLJSwryMDAwMQj
  wFqUW5mSWo8q8YxTkYlYR5b4JM4cnMK4Gb/gpoMRPQ4q+L/iUCLS5JREhJNTBtejyvYFXwLm4
  /Fr2qxD/R+lJ817bF7tJPu8TL3Tfl5I5Ts1UcquW+zftTLjLlim2pks8v13chkxy/RL/ctedK
  2sKpU3muy5eybe11SG68aXPlpbZ6lPf+knm8PkuUbfe1TpU6Fn964ZakcI3z1av6Yi9rfNi1R
  LZMd9mqmgudzvXCalpzDrZb87m7JXV+lfMWTGmZ/tIw/k6i+qLqunsdB80Z9CV6TNpOv9/YkL
  TeTaxd83t+7sF7z72YU1JeH3g7482qHCGLnR2JSSatlo/tnu4xeLTpVs6aj0a5awtCPWcVLF4
  c7rrLw0pFdv8+nc8z+Uw68zLfdx+NYIzcNP9kvFquGfOBiwm5IVWlskosxRmJhlrMRcWJAMAq
  nzZEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1644308755!1320!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19139 invoked from network); 8 Feb 2022 08:25:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:25:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 04FA2100189
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id ECC50100185
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:54 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:25:33 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ed: upgrade 1.17 -> 1.18
Date: Tue, 8 Feb 2022 16:25:22 +0800
Message-ID: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161477

License-Update:
year updated to 2022.
license changed from GNU3 to GNU2.

Changelog:
=========
* main_loop.c (get_shell_command): Flush stdout after printing cmd.
* signal.c (sighup_handler): Fix a memory leak just before exiting.
* carg_parser.c (ap_init): Likewise.
* io.c (read_file, write_file): Check ptr returned by strip_escapes.
* main_loop.c (get_shell_command, exec_command): Likewise.
* main_loop.c (get_shell_command): Remove backslash from escaped '%'.
* main_loop.c, regex.c: Implement case-insensitive REs.
* regex.c (compile_regex): Don't overwrite previous regex if error.
* main.c: New option '--strip-trailing-cr'.
* buffer.c (push_undo_atom): Fail if stack grows larger than INT_MAX.
  (too_many_lines): Fail if buffer grows larger than INT_MAX lines.
* global.c (set_active_node): Fail if list grows larger than INT_MAX.
* signal.c (resize_buffer): Fail if a line grows longer than INT_MAX.
* io.c (read_file): Return -2 for fatal errors.
* main_loop.c (main_loop): Set error status if fatal error from main.
* main.c [restricted_]: New message "Directory access restricted".
* ed.texi: New chapter "The 's' Command".
* COPYING: Restored.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ed/{ed_1.17.bb => ed_1.18.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.17.bb => ed_1.18.bb} (74%)

diff --git a/meta/recipes-extended/ed/ed_1.17.bb b/meta/recipes-extended/ed/ed_1.18.bb
similarity index 74%
rename from meta/recipes-extended/ed/ed_1.17.bb
rename to meta/recipes-extended/ed/ed_1.18.bb
index addf652d52..57e883d342 100644
--- a/meta/recipes-extended/ed/ed_1.17.bb
+++ b/meta/recipes-extended/ed/ed_1.18.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://www.gnu.org/software/ed/"
 DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
-                    file://ed.h;endline=20;md5=b72aa5eaafef318c6bfc37f858469113 \
-                    file://main.c;endline=17;md5=2c93e24f4db3528a00a24c7df5618e41 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+                    file://ed.h;endline=20;md5=6e6a818b0593f937fc63ba08d5e314bf \
+                    file://main.c;endline=17;md5=8419a08bb12936f32384a0d1c0f9e74c \
                     "
 
 SECTION = "base"
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54"
+SRC_URI[sha256sum] = "aca8efad9800c587724a20b97aa8fc47e6b5a47df81606feaba831b074462b4f"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.25.1


