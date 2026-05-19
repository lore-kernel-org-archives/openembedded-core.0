Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520F0CD5BA6
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1004.1779233432349882762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KDz2TjMe;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso34241695e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233430; x=1779838230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owxyeNTpFLoX7jgSo52BHKsuNG2I2KAe8k4y9f6oelE=;
        b=KDz2TjMe0dCF4x5SEL3zRTtxpi2vgjyTHxTLCh1ZMzBYe2L4CTZ8mleklgzBRoWTjC
         dmiQx75/nspTmUSbQfHQz1oL5JkieX1fclIj+dosh/leNKSIU+xMDTWQ1O92LJcebgci
         lXbuj6l7MHVWC9CH+yoGq2EvBUb9brc5yBhiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233430; x=1779838230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=owxyeNTpFLoX7jgSo52BHKsuNG2I2KAe8k4y9f6oelE=;
        b=LgeYfrasuI6wqQM5zCSAWrWGnG7tnB1GRcISwm+nJnHWmF2v33BoUO7P3D5T5DbD0N
         Pf/Uy6ayEGnoxTrEnj8vHglce6RFYumvpePxfAc+NdfUbBgL3efiMaUvp2agcBk8QGMd
         tK2AVD1G/Y+A74Ax1ou+dN5Kf7IgJ0VK5HNZ+ITxHxAnf+gyXc3uePqtLaiME6F/48aW
         z6aEkO2Yh5u+w/t3vwXXXrjzcr3dou9Up6XvPpVe7QfiSm1muHEg9xcsRXZR5EtJP3ly
         nF6wdsK1A4J91zW4KeRtIm1yofKqW0EmUQ4VKBHOZ9lwo2ynPecKb7oXTcHdBbU2ro/K
         8dnw==
X-Gm-Message-State: AOJu0YzSXlj5TZMCRR+uftQLvSY9g6exipXCspl0+3hhfDvib/2CrsRt
	ENx141P21aZfO2OV0Xp0WuP3g0XuMZzs4Rx/tCL9ToFL23Vv2/QEOJ5dJ6ydkNr98LR3GlZV391
	+Ppbs
X-Gm-Gg: Acq92OFa0hsydELbEmFOqubYQKjec1ZoGClXlpW5rkXW6pkU79fYO+sJo1WUsBqqrwy
	RQa6y1vSPw7/QoMyZU0IpqgyrhS3JqD5OTks+xBQwsrKfqQHPEp9mwup6m0Fne2oC8rDeFIh0Vj
	iq/qABoBHb2gSPA4dvNbbhHHqjOvbwIJG5VMxJCdzhv107Ok3d4XyYHN6jabxn6bCoxKOBdj1T0
	5QdnPDOg1RaxzZzLEZppp9JR8mZtDAIceSFFzHWpxHFp554UurverUgTe0EgJ6MovFqIqFsizwG
	pDndONl2CY9L3F/QZZYRG5NuLqG1llr5L07Fk8zlw9OZQYovvg0VL61SNmBjJmQn3fYri58dOyM
	++AxU3+FXt4RbQttROXLFxZQWu897eCDS649x1ak44jxUgxWtt9uWWWAhD0S80ebeJrWgxdilEU
	+SBox7Egg/nIBNTfOMIfh93e10QSjUhT/ZWravDOBfyTkT8nhLQhlrFEZI/7dkqJ5xKq2aLZnn7
	5ocnMXTQqs1cg36f2X/E163/D4=
X-Received: by 2002:a05:600c:6d2:b0:48f:f199:4c02 with SMTP id 5b1f17b1804b1-48ff1994c86mr164563255e9.9.1779233430501;
        Tue, 19 May 2026 16:30:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/28] busybox: patch CVE-2024-58251
Date: Wed, 20 May 2026 01:29:45 +0200
Message-ID: <8f344d46b96fb16632501749dc39b97aa3e11836.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237355

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

