Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1801EC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:53:17 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.15905.1707393195444414823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkljH6Tl;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: andreaskleist@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-558f523c072so2258056a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 03:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707393194; x=1707997994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OfhZ4hEn3pu+YEqGahw06P6yiRFo9F6ywbJUrUqtJp8=;
        b=bkljH6TlrH0fFUqe6+ptRek1FiWdVPhqobEpYITX86OkreuWGescYFJwz0WjeS0WMn
         sxk1v2PgPfZPzyinzmMIEkzoKzBR8K3h1+ynnoD4emXZWjtqhLiaOqrwYCTJeI+bqSAE
         WTMyvTrqA4LOfzJUjIK3FteyEMEHTEg65Thubf2KJcRSIxt3+mhifJG33dZk/LkXE2Cd
         bCEvoBtIDlhEt1eIrtSjvjtRe9my8PMWv+334h/YR1ZNQSgtDyl8+AKAbrY8R/SExUnd
         WRzJLwLP5PO++Hen//fpJwwoed0ERIvyTmDL8qScbLkSlFIV/kGW8c2xBqH3ymUL+CTb
         HAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707393194; x=1707997994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfhZ4hEn3pu+YEqGahw06P6yiRFo9F6ywbJUrUqtJp8=;
        b=KXX/gPPiVtr1PxHCW4LCbRRRDQJWoXnjKhw1s+otKG2YJa9xVWDY7YiMWjRtm9hc71
         5GEj2+qC2uDRSCO80ueiwZ5ERzNx5YTYcLeUdkdEaDFhUoygun37f+HpvwK96e/EoY+1
         +FzPGSKtqMwOQxmH4P7yd7e99eQLmoWHiDeLORRDKyakwlUQy5iGHqkBBZeGpd2zQBoc
         V2EtYlzdnu0euD9Dpy8J9B4GSeoAfPUzwODehKExmAzvgOUgG14T0Dso7j14Dy/UUhm5
         m0SEK3Kay5qpCzIzXkkOcx8hvmVN6GNYhNlL1qOwF6fL92zasPWcWXLAY0EvgbT+JLy9
         g6ZA==
X-Gm-Message-State: AOJu0Yxwd55gJtElFsDjnCD4OMefXqViZM6JFiu/EX5mCX7nnt4zBOne
	3y3vw+NVYw7/sOpPVGRAgusoIB/LSVNyqkrDdy/DPb6SZ518vqNbO3asHy3w
X-Google-Smtp-Source: AGHT+IFy4DuWGlnLpcKUuUQIUGr1nRRsUnsDSlB3++ztzIodmmScerRLcwhUczLKwA6Jd7G5McZBdw==
X-Received: by 2002:a17:906:319b:b0:a38:405c:a96 with SMTP id 27-20020a170906319b00b00a38405c0a96mr5386785ejy.64.1707393193421;
        Thu, 08 Feb 2024 03:53:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8MGHT1U+stUDU/fu8aNlU9/0P3Y5qt1oRsbSCCZYCD2w0N+sl7gvSt/4dlBGmPNXjsWR/XlkKFDCtuDqHuLIdmrEETDFWfIAEt9f4zCBDjxK836ysAu8XxNWnqpyZFh+aydVpoX9G0ShYXg==
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id x27-20020a170906135b00b00a359afad88dsm1844459ejb.10.2024.02.08.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 03:53:13 -0800 (PST)
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>
Subject: [kirkstone][PATCH] kernel: fix localversion in v6.3+
Date: Thu,  8 Feb 2024 12:52:45 +0100
Message-ID: <20240208115245.3492168-1-andreaskleist@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195141

From: Bruce Ashfield <bruce.ashfield@gmail.com>

During testing of the v6.4 reference kernel, it was noticed that
on-target modules no longer matched the magic value of the running
kernel.

This was due to a different localversion in the cross built kernel
and the scripts / resources created on target.

This was due to changes in the setlocalversion script introduced
in the v6.3 series.

The .scmversion file is no longer used (or packaged) to inhibit
the addition of a "+" (through querying of the git status of the
kernel) or the setting of a local version.

We recently introduced the KERNEL_LOCALVERSION variable to allow
recipes to place a value in .scmversion, so we extend the use of
that variable to kernel-arch.bbclass and use it to set the
exported variable LOCALVERSION.

We must do it at the kernel-arch level, as the variable must be
exported in any kernel build to ensure that setlocalversion always
correctly sets the localversion.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
---
 meta/classes/kernel-arch.bbclass |  7 +++++++
 meta/classes/kernel.bbclass      | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 4cd08b96fb..0a79dea0af 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -66,3 +66,10 @@ KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
 
+# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
+# the local version. Having it empty means nothing will be added, and any
+# value will be appended to the local kernel version. This replaces the
+# use of .scmversion file for setting a localversion without using
+# the CONFIG_LOCALVERSION option.
+KERNEL_LOCALVERSION ??= ""
+export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5951347361..940f1a3cf4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -418,7 +418,7 @@ do_compile_kernelmodules() {
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
 
-		# Module.symvers gets updated during the 
+		# Module.symvers gets updated during the
 		# building of the kernel modules. We need to
 		# update this in the shared workdir since some
 		# external kernel modules has a dependency on
@@ -635,7 +635,13 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion ${S}/.scmversion
+	# See kernel-arch.bbclass for post v6.3 removal of the extra
+	# + in localversion. .scmversion is no longer used, and the
+	# variable LOCALVERSION must be used
+	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
+		echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+		echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+	fi
 
 	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
 		mv "${S}/.config" "${B}/.config"
-- 
2.43.0


