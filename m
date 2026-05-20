Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C85FCD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7374.1779265263310739611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WBiWVjXQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so50431005e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265261; x=1779870061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owxyeNTpFLoX7jgSo52BHKsuNG2I2KAe8k4y9f6oelE=;
        b=WBiWVjXQ+ZkhJ4MCMM8gSwnrEjWexgUk+lLKYmVCprWVtVQLQ7HknVTDInCrVWgXX3
         UAlqbnm/Xk9VLeBgc/+jzaJIiypFh4u9wJ9KQHoCuUb3HssUTrdTB1daQyWdlMQtL0An
         79BvfUR75aulwD8lZe/88yWwjwPdk/5WXoMwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265261; x=1779870061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=owxyeNTpFLoX7jgSo52BHKsuNG2I2KAe8k4y9f6oelE=;
        b=QQoeaA3V3BOH1dBZEVMW8zzX91YI7OovEFZ3EVelbjMwGjfQBV2c4CEYKifQryvHg4
         8z9xHK2ekYSPTMw/q19PnB8hegH3Cx1yoruslQ/nfFZ9uQ22QNSYPnknVlIOThEpbdok
         +aumYdkichwSY0qIt+ArBd1csrspThlQvTsfPoJrBhzw90YKBq9rIEUnOw13582Os0v3
         KBqYw8GAz+x6HG1pJ45nYMr7fx3ZXpuucJ9PJx8bAzTnBIpJgbWC3gUeUaR0rer07PEF
         vh8lMh5DdRtDiaSy2a4EofCIk0lbS28iAu70TbKeQW/0WlUNHxW1mwQYTfDirvjNYN/D
         oKZA==
X-Gm-Message-State: AOJu0Yw2IYrE7o1M2lEdUoJCEUYhKsRNA7Nfug7f+kd2848OsktyBtON
	/ZXvJdrz6oub/kpOyA4qjVX99PZ4Lfn579SCe2X2KU2U+gRBin8BZIBlfgnUuU4XeNcuLQc4RyS
	Samk2
X-Gm-Gg: Acq92OH9kWmNxxTr/B86N9W0tgabW8juve1lNwt8YEUdSV9xslI2fnDYtkzAbe4rX4D
	P1mhReonreK5/tzwAaGZlReEXt4xFthLUFB4oFMh9qcnrr1Z9fsMLSOeeCnAfPbJqe+iBE/zVLt
	ucn9r+P0l7iOSkiwZddc6SEcTm4l9uPZ68MUu/jbOutOWe9BTYBR8z9zbIfHXZcke7bCTUEy/9q
	bIjC2opzEKxMzDkBYACpVQdjMxOyP7ASuYh7PmNHsTWXgcFIF7kW4O9KzGkUIn0nz9qMa8EOIFa
	X5WVmU3Y98kOQsXi0eDoxI8xQjSw5yZ9iWpFYQRyNPpU4Quu7Iq8LLKSxtSh7OAhBmgczNFMP0w
	Vm4VRTOAtLghxubO1Vg32qz73ijsBMfO+TaBScPrDe2PQAGw9x+Z5eF9yGePQFLycBxxM10Trzm
	YIuhjQvuB0wC27rq1QoFcydTfXWeZd1o7R6A5gOuaPl1zE9iMVhqPOK/7VPMsbMybma4FOxl34+
	QrM/3pf1XGs6S3jXoUbV7FMhlVr
X-Received: by 2002:a05:600c:8b01:b0:48a:53ea:13eb with SMTP id 5b1f17b1804b1-48ff3345725mr290800855e9.5.1779265261383;
        Wed, 20 May 2026 01:21:01 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 08/28] busybox: patch CVE-2024-58251
Date: Wed, 20 May 2026 10:20:09 +0200
Message-ID: <8f344d46b96fb16632501749dc39b97aa3e11836.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237407

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
---
 .../busybox/busybox/CVE-2024-58251.patch      | 51 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
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
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 61ff602be6f..47908996843 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -63,6 +63,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \
            file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch \
            file://0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch \
+           file://CVE-2024-58251.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

