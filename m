Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A566EC02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:44:35 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.42923.1738853067662755841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UJZinSR4;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5440d5aae5cso1098217e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 06:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738853066; x=1739457866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3k2E360cSwEGwtHk2vivgdYS88g5eIEgAPvtq9morc=;
        b=UJZinSR405YVYPHUtqe2Wj4g2ERLw3d/6Ja69RtwHSXmBJ0M90cBn0iX+sIdGTpiJC
         k6v2s+x2ScJiFmOfM8LMS8UM7JlPxDqoUdDRkagnSYEDEyOUWbmVXX5PneZGJ1Bu8JD7
         Kdz8myx/w4KgUlqyqY36jp2Uft//F5mpSQuNZDNjhB+C+kLgsBnqvGB0t4oBXe5n2plu
         O4PoENNFTsMEaO8lThf9m9Jl0epUzhyioZ2q7Rl/bFRrhfxtGHsyR9Wb24wmuS0l39N+
         OTglyFLvoA03z64QGTDmGo8hX5ydtaeaC3+hebH/CQcIRP8Hrmfp/4fDI235aRVyMzFP
         aWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853066; x=1739457866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3k2E360cSwEGwtHk2vivgdYS88g5eIEgAPvtq9morc=;
        b=nx9IsoZ04y7cud9MHX2IHikyHpnxMX8K89WqnwwXwwfPzTI9KYukWmrbQl91cvK6A8
         72z3+x6JtS6eeNJo8bCR650s439WwXynXddIRrWBrfzJsv66JxlUVWlbm71y6PWE72GI
         X8gWG0r+pSSyNCg1RngKr19AEusowwObVpp/VRXI1+E/28kZ+d/3SmMv9aMxSzAebcjT
         PuGclkXljcsh845zZHpEXqx5S36OGHCCt75exbj8V+XV3Qqh0/nE1G3pJZ8IviOj5elB
         T7aroXHg8RwHKb5Angp6wP8ZH/s4F0/I5QhgN+1Ggqj5ub2psJxQEKlDVfq2aMWrlX4t
         0Lag==
X-Gm-Message-State: AOJu0YxMyfsEJtSdJj/C6Igty2Q+d+WqaV4NeEToL4ip2IV3feZ9dR9M
	mrLqUaJaAmBHaYrIrR/66rb9/XnnY8nbYUjOICOClJmnLSb2hjKIL2NdUDXqLpMIRVfXFMdCzej
	YPKI=
X-Gm-Gg: ASbGncsOfqOwKGn2o2+OxxVphR8uAG0nwe+nQSozY6NV7bvmnW3cJclmMXTE61K8ZiO
	NOnBYYNHJJSd6zPwS3Y8C9Ch8fwe6PiMgftMCCEzKmA34i25e3rAj49+mQMmVyu8PoP/FwMkMZL
	FZhup0CpjmGYcjzQEPXZalKryZWHAhIH+K+riyzQ5quRAFGQZn695uqc1gTvmx5EQbITObLML32
	lU2Yy7MIF+t+ZIhICwKtjTV9QNsPnpsQvbRqsDFTcMXRlPIMJtfJMcr/eGPWMu+T2X0sTRkF+44
	Ixbs1ABU8Pptk7ThneG0eglTfDKOBTjfKKbceztZetb71FhdASvmmoYPTUD3
X-Google-Smtp-Source: AGHT+IERrxwf2DNCzpqbtls71TRCy0winpdXF5GRM2YVfyvUct8KHx/NOrq34AlHL6F/IdgA5o4t6A==
X-Received: by 2002:a05:6512:2343:b0:544:124f:1721 with SMTP id 2adb3069b0e04-544124f1842mr614312e87.6.1738853065750;
        Thu, 06 Feb 2025 06:44:25 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544106040b4sm147434e87.226.2025.02.06.06.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:44:24 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: poky@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] psplash: start via udev if framebuffer device detected
Date: Thu,  6 Feb 2025 16:44:06 +0200
Message-ID: <20250206144406.1328276-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210939

psplash-start.service expected to find /dev/fb0 and failed
if device was not found. This failure breaks systemd
oeqa runtime test with "runqemu nographic". Starting
psplash based on detected framebuffer device fixes systemd
boot status and systemd oeqa runtime tests for qemu
boots with and without graphics support.

Note that psplash-systemd.service still depends on /dev/fb0
so startup with multiple framebuffer devices may not work
correctly. I don't have devices with multiple framebuffer
devices to test with.

On qemu machine with graphics, psplash displays yocto
logo correctly and boot progress bar as well. Once boot completes
to systemd "running" state, the logo is replaced by login prompt.
On qemu machine without graphics, boot completes without psplash
or failures and login over serial console works normally.
Tested with genericarm64 machine poky-altcfg distro and core-image-base
image on qemu. AMD kv260 tested as well but graphics stack is not yet
working there so boot is similar to qemu without graphics.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/psplash/files/fb.rules                 | 1 +
 .../{psplash-start.service => psplash-start@.service}    | 5 ++---
 meta/recipes-core/psplash/files/psplash-systemd.service  | 8 +++-----
 meta/recipes-core/psplash/psplash_git.bb                 | 9 ++++++---
 4 files changed, 12 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-core/psplash/files/fb.rules
 rename meta/recipes-core/psplash/files/{psplash-start.service => psplash-start@.service} (84%)

diff --git a/meta/recipes-core/psplash/files/fb.rules b/meta/recipes-core/psplash/files/fb.rules
new file mode 100644
index 0000000000..accdb8386c
--- /dev/null
+++ b/meta/recipes-core/psplash/files/fb.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="graphics", KERNEL=="fb[0-9]*", TAG+="systemd", ENV{SYSTEMD_WANTS}+="psplash-start@%k.service psplash-systemd.service"
diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start@.service
similarity index 84%
rename from meta/recipes-core/psplash/files/psplash-start.service
rename to meta/recipes-core/psplash/files/psplash-start@.service
index bec9368427..1bc3642fc2 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start@.service
@@ -3,11 +3,10 @@ Description=Start psplash boot splash screen
 DefaultDependencies=no
 RequiresMountsFor=/run
 ConditionFileIsExecutable=/usr/bin/psplash
+After=dev-%i.device
+Wants=dev-%i.device
 
 [Service]
 Type=notify
 ExecStart=/usr/bin/psplash
 RemainAfterExit=yes
-
-[Install]
-WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index e93e3deb35..f9aaa2db3d 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -1,14 +1,12 @@
 [Unit]
 Description=Start psplash-systemd progress communication helper
 DefaultDependencies=no
-After=psplash-start.service
-Requires=psplash-start.service
+After=psplash-start@fb0.service
+Requires=psplash-start@fb0.service
 RequiresMountsFor=/run
 ConditionFileIsExecutable=/usr/bin/psplash
+ConditionFileExists=/run/psplash_fifo
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
 RemainAfterExit=yes
-
-[Install]
-WantedBy=sysinit.target
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 30cf61a2cb..fce5995efe 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -11,8 +11,9 @@ PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
            file://psplash-init \
-           file://psplash-start.service \
+           file://psplash-start@.service \
            file://psplash-systemd.service \
+           file://fb.rules \
            ${SPLASH_IMAGES}"
 UPSTREAM_CHECK_COMMITS = "1"
 
@@ -112,8 +113,10 @@ do_install:append() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${systemd_system_unitdir}
-		install -m 644 ${UNPACKDIR}/psplash-start.service ${D}/${systemd_system_unitdir}
+		install -m 644 ${UNPACKDIR}/psplash-start@.service ${D}/${systemd_system_unitdir}
 		install -m 644 ${UNPACKDIR}/psplash-systemd.service ${D}/${systemd_system_unitdir}
+		install -d ${D}${sysconfdir}/udev/rules.d
+		install -m 0644 ${UNPACKDIR}/fb.rules ${D}${sysconfdir}/udev/rules.d/
 	fi
 
 	install -d ${D}${bindir}
@@ -124,7 +127,7 @@ do_install:append() {
 }
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
-SYSTEMD_SERVICE:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'psplash-start.service psplash-systemd.service', '', d)}"
+SYSTEMD_SERVICE:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'psplash-start@.service psplash-systemd.service', '', d)}"
 
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
-- 
2.43.0


