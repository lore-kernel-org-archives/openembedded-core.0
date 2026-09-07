Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B88C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35232.1788788171726196002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XrjUso1t;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so35017875e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788170; x=1789392970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RdTkEA8KR7xRi0mq5K1fT3ITsXYBddIrXGOJwmCY4eU=;
        b=XrjUso1tc7gwUWWPH3K09ZzZZ+febnHGKmyQfiaR3hg637IzSdoKPJbWRqumPGcDl0
         b+0ntgfXWCPxRoZj1KzPvV86cGqZX02FEKlEJtPtH9vhtPtsgsmcEwGvq7t/nAQxSpI6
         NNxDOOHI0OMiqUfZgO2mZcg5O5xmm35e3+5YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788170; x=1789392970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RdTkEA8KR7xRi0mq5K1fT3ITsXYBddIrXGOJwmCY4eU=;
        b=ZlKRnot0No21AfUs5pdI0px1jndQ+dgoulhCFHvyMw6fqQSESoUuHOGUZeXMEu62Fx
         HGlvtPsCBeWFT8BXGX3MV+9Q41VJvlRhwpk1xAB7Au5+b+cH0iWY+yEEsneq/xMMjDyO
         b30hCIWFLVVr4wE0fB3L31rS/7S8FasGM+rp6vOukPqvPso3jiiFnAKMQS73/4BrylRz
         LmnSdeqdhmiQO1QN2IpjmgoYpEaaWLnIoIvG/6jCfLmXV40n45nLJAB6hmnJjw9qAYjR
         CeYAtvMLmkceqMrTVOStYVxLUKmd8+r3m8Bjja1qMVyg4m+hYDYZ4L6wjelwhVePex0b
         CFkw==
X-Gm-Message-State: AFuF++ne0dZJGbF3h9PhXt4XX7IcpjCcSzGwGVeliEfwbgQDOpuCaOhL
	dCNOtKtxtwP7OMGrFRKjThBueifIIxEYeTid6Lhps3s1aJPVx8UU0Yxw5izN5dD6zT5VXr8RSp9
	7G14Ua6s=
X-Gm-Gg: AYBFou3gc8xyUgo6YZrSraEjIF/b5sres+JQ4u1PhJ8AkHu8jc2P/Cb+QmdcyUBcR2H
	TXKsi9vaS30jb/7n+xw8YWZoiDDslZseZew9iUQP/xbz49Sb4SAyhRIdYflA/IpEeb6LGPUh3Fl
	hoCGfLW16VZSdDw+NqcrvsKvX83xYw/5lwpeI8k08HDrApHrQlxOb/HHbDJgz0f74Q0o5XHS6/j
	wdbNnwDoiSMki8TkPyEzek3E87bGiIDC/RsKq6zIp9VSp5FC28Vv5A4/knXihb9G6upyTaKgSdH
	M3XvRe1f66U0H76UMPyxD+hGRAmIPAmE0yKgY+7kUDM5EwRto5Rtx5ekmiyLREUxrXXwtlo1XM8
	5K1eNvWkpOoPUSaEAM5bejJwExV/0Nwmle15d9onVQLn9Diwmuy+jsNG/GORfgGbnKKG02+w0zg
	4fyTzahZWVYa5OcZnFOG0/o2kuJdwVp5Y8D8/Ggq8vNLxOxZzSv0BEsKDIag9TofmWwDVsD0TmB
	PDNijAiCQcJa3tyhMJfKu/u1UzcwcJJEZKo0aAhOwAm/7lJi9m5wVPvUPIee5OT
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr271048805e9.5.1788788169831;
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/35] busybox: patch CVE-2024-58251
Date: Mon,  7 Sep 2026 15:35:30 +0200
Message-ID: <6c0b6e39336686590820dce96913f143a45edadf.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245291

From: Peter Marko <peter.marko@siemens.com>

Pick patch applied by Debian [1].

I did not find any reference on busybox mailing list that this patch was
submitted. Submitting patch for someone else would be inappropriate,
and busybox is currently known to be very inactive, hence the unwanted
Pending Upstream-Status status.
Also note that the related busybox bugreport [2] is currently not
public, so it is possible that it was submitted there.

[1] https://sources.debian.org/patches/busybox/1:1.37.0-10.1/netstat-sanitize-argv0-for-p-CVE-2024-58251.patch/
[2] https://bugs.busybox.net/show_bug.cgi?id=15922

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
(cherry picked from commit 7261144785aa508377c995e52d7e2410a814f00b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
(cherry picked from commit 8f344d46b96fb16632501749dc39b97aa3e11836)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../busybox/busybox/CVE-2024-58251.patch      | 51 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2024-58251.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch b/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
new file mode 100644
index 00000000000..713d345ca83
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2024-58251.patch
@@ -0,0 +1,51 @@
+From: Valery Ushakov <valery.ushakov@bell-sw.com>
+Date: Thu, 21 Aug 2025 12:31:53 +0000
+Subject: netstat: CVE-2024-58251 - sanitize argv0 for -p
+Bug-Debian: https://bugs.debian.org/1104009
+
+Signed-off-by: Valery Ushakov <valery.ushakov@bell-sw.com>
+
+CVE: CVE-2024-58251
+Upstream-Status: Pending
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ networking/netstat.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/networking/netstat.c b/networking/netstat.c
+index 807800a62..d979f6079 100644
+--- a/networking/netstat.c
++++ b/networking/netstat.c
+@@ -41,6 +41,7 @@
+ 
+ #include "libbb.h"
+ #include "inet_common.h"
++#include "unicode.h"
+ 
+ //usage:#define netstat_trivial_usage
+ //usage:       "[-"IF_ROUTE("r")"al] [-tuwx] [-en"IF_FEATURE_NETSTAT_WIDE("W")IF_FEATURE_NETSTAT_PRG("p")"]"
+@@ -314,9 +315,12 @@ static int FAST_FUNC dir_act(struct recursive_state *state,
+ 		return FALSE;
+ 	cmdline_buf[n] = '\0';
+ 
++	/* don't write process-controlled argv[0] to the user's terminal as-is */
++	const char *argv0base = printable_string(bb_basename(cmdline_buf));
++
+ 	/* go through all files in /proc/PID/fd and check whether they are sockets */
+ 	strcpy(proc_pid_fname + len - (sizeof("cmdline")-1), "fd");
+-	pid_slash_progname = concat_path_file(pid, bb_basename(cmdline_buf)); /* "PID/argv0" */
++	pid_slash_progname = concat_path_file(pid, argv0base); /* "PID/argv0" */
+ 	n = recursive_action(proc_pid_fname,
+ 			ACTION_RECURSE | ACTION_QUIET,
+ 			add_to_prg_cache_if_socket,
+@@ -686,6 +690,7 @@ int netstat_main(int argc UNUSED_PARAM, char **argv)
+ 	unsigned opt;
+ 
+ 	INIT_G();
++	init_unicode();
+ 
+ 	/* Option string must match NETSTAT_xxx constants */
+ 	opt = getopt32(argv, NETSTAT_OPTS);
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 60796de9ce2..70d984b7c6e 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -67,6 +67,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2026-29004-01.patch \
            file://CVE-2026-29004-02.patch \
            file://CVE-2026-38754.patch \
+           file://CVE-2024-58251.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

