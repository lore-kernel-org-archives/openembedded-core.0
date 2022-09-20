Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7B3C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:16:44 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.7301.1663640197824248407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MJ+J6YHl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640196; i=@fujitsu.com;
	bh=5AAIifY0yPk5naOcZn8goj6p4f0VOmqBLmvb4PyJOls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MJ+J6YHljvabQrIMEEH7Wo7SpQIIDMj5TK+JSe0tRBgaISDFtpgOfC/KuwwO/pjYx
	 csQYVU4RcDa3RR1FRukp004THtyMGiOkHc8zW64oKZ+UNN5A1PpjGkYZxNoEEoYoOI
	 Fd19Yt1Dvrwnh9IPqwiN6ZTT/+gcBjyatNjHGFI0aR+YHkD8/AloQY5FJjJmw/C9so
	 tCuvFvhptLJq7Ko748UTn1mAqF0zFzL1SxIyWTRzqWixV0AjFjFtwSlQbgcplxsFSu
	 NlxLgs4URxYesbOukOhaftiBooAwt8GnAgOpXQbSF2O+jEchNMLaYEyzXaiOWGN8Jy
	 8p/vgY9Dtn2EA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxSbdZSTP
  Z4PA1bos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePbwUa2gp0iFSfe3GZtYHwi2MXIySEk8JhR
  Yu/ryC5GLiD7GpPEgnk3WSESexglWs8GgthsAmoS02/dAIpzcIgI6Elc/ScKEmYWUJF48buHH
  cQWFjCWmLSwiRHEZhFQlXi3+xYbiM0r4CRx7cUrsBoJAQWJKQ/fM0PEBSVOznzCAjFHQuLgix
  fMEDWKErMvN7NA2BUSjdMPMUHYahJXz21insDIPwtJ+ywk7QsYmVYxWiUVZaZnlOQmZuboGho
  Y6BoamuoCSVMTvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwIBMKWaYtYNx
  Vt9PvUOMkhxMSqK8XHUayUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeO0FNZOFBItS01Mr0jJzg
  NEBk5bg4FES4WWTAkrzFhck5hZnpkOkTjEac3z8c3EvM8fMr20HmIVY8vLzUqXEeVMUgEoFQE
  ozSvPgBsGi9hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5wOaApPJl5JXD7XgGdwgR0yg0
  VdZBTShIRUlINTAUBpy86zEznX/7X7sWf9Zz+TMs0zac1bT9QHCR5/l9HR9n0gydfeOjv09MV
  cjxx0mVCtlz2hjLdRXs0vhxLOX7nGG/RP1s9Vr0NIUwRlmX2vqp+MewXb9/flcv3ddnsI4yVQ
  oqbuOfweDhXfXm62DgnNOfA7999bgbcN/UW6OUfKNmatnpqcdTPQzv/+lq8/1Fy6V+JT+xsjn
  IVc7+jC+/v++X2buX2p44B/fHxRfsu798k9rPYp57N0G1H1o12lfZNcZpyOtMvHbwU/tEh9dw
  2xjjFUK4jX92NuH76phkfrGqK/mS2amOIttMecQUlp7VfZnb5eyZ433LsOzWn5NfWZMPmOP2r
  fXfmLmpNV2Ipzkg01GIuKk4EAObSZiNVAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1663640194!191993!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6207 invoked from network); 20 Sep 2022 02:16:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:16:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CD5731000CD
	for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:16:34 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C0A91100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:16:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:16:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] less: upgrade 600 -> 608
Date: Tue, 20 Sep 2022 10:16:11 +0800
Message-ID: <1663640171-27164-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 02:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170885

Remove mark of upstream version as unknown because 608 is the general release.

Changelog:
==========
Add the --header option.
Add the --no-number-headers option.
Add the --status-line option.
Add the --redraw-on-quit option.
Add the --search-options option.
Add the --exit-follow-on-close option.
Add 'H' color type to set color of header lines.
Add #version conditional to lesskey.
Add += syntax to variable section in lesskey files.
Allow option name in -- command to end with '=' in addition to '\n'.
Add $HOME/.config to possible locations of lesskey file.
Add $XDG_STATE_HOME and $HOME/.local/state to possible locations of history file.
Don't read or write history file in secure mode.
Fix display of multibyte and double-width chars in prompt.
Fix ESC-BACKSPACE command when BACKSPACE key does not send 0x08.
Add more \k codes to lesskey format.
Fix bug when empty file is modified while viewing it.
Fix bug when parsing a malformed lesskey file.
Fix bug scrolling history when --incsearch is set.
Fix buffer overflow when invoking lessecho with more than 63 -m/-n options.
Fix buffer overflow in bin_file.
Fix bug restoring color at end of highlighted text.
Fix bug in parsing lesskey file.
Defer moving cursor to lower left in some more cases.
Suppress TAB filename expansion in some cases where it doesn't make sense.
Fix termlib detection when compiler doesn't accept calls to undeclared functions.
Fix bug in input of non-ASCII characters on Windows.
Escape filenames when invoking LESSCLOSE.
Fix bug using multibyte UTF-8 char in search string with --incsearch.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/less/{less_600.bb => less_608.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_600.bb => less_608.bb} (91%)

diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_608.bb
similarity index 91%
rename from meta/recipes-extended/less/less_600.bb
rename to meta/recipes-extended/less/less_608.bb
index f51083e1de..f411a8fb53 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_608.bb
@@ -28,10 +28,9 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
+SRC_URI[sha256sum] = "a69abe2e0a126777e021d3b73aa3222e1b261f10e64624d41ec079685a6ac209"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 inherit autotools update-alternatives
 
-- 
2.25.1


