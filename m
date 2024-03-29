Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89058CD128D
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 16:17:56 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.410.1711729067687647482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 09:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O/q2hkXg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d718ee7344so9294121fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1711729065; x=1712333865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kgi+JRHNTGLitdNxMNuuVo1P43xvDMB57eA3DxF4rD8=;
        b=O/q2hkXgyguk2Z0Wm/GuoAarcPm/qXD1c4juq6Ejl2d6ddmGRSYosOoKlZjqwrrgAx
         /VHFVK0n3Cw6FLi25F25zmcuWFu0H00b/v3UXlyBEQOcxb8t/N2/fxQ2L7v0x2zh8hwC
         FVIk95U7vKJXPGKEvEJB6hB4YNotInx8s0IpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711729065; x=1712333865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kgi+JRHNTGLitdNxMNuuVo1P43xvDMB57eA3DxF4rD8=;
        b=bJjfcaB97/h17puriE7hdt5o2twvgUWO7Y1fMvw5xu7SK9ltY8EqMzBX9ZO6g6dapb
         0geWa6PnIN9hgCQenR2eh6smzxKuJSwgrEmxbAlYFUv8WV+9e8JJEigQnE66leeQgW4T
         2YCoZOGbSWJ3CarKbQ23lzrIZUyBGAuN4nyXMK5N2OCXg/6FjFtxt8MRcnVXDjVv+49R
         dRYuRXJtPodn+v2tOw6Sgm3olMMzbQeNlyZTyTnDNjt2J/m3JtxszPR/FqXhlfkz2TX2
         uFU6usAZ+O1+7mrwwu2DfUNIUb8m1LxxCAA7megBNcsKCNJ27CoT/NgpK7BQfbwNnSSy
         IVDg==
X-Gm-Message-State: AOJu0Yy3QnN3M/bXxmTRtndmLhZsCT4IWh9qP8pNaZ6enyQvC7ou4FYi
	uo2IVoQ2PION6PN49OHdDPCEksZ81SrmysJviKhpYabop61hkkvB780uAmtiEYSeEf1dXFbZFoy
	B
X-Google-Smtp-Source: AGHT+IEWH2HPxwonx8C1Z8cxH+SS/NPwTMqBtcUvkHVhkfRJRewt5XVwni1J/nHoLbLfBjKOOX/eFA==
X-Received: by 2002:a2e:a4c1:0:b0:2d7:b78:4109 with SMTP id p1-20020a2ea4c1000000b002d70b784109mr1331000ljm.53.1711729065486;
        Fri, 29 Mar 2024 09:17:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fdd:6f2d:e3d5:9b0e])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c311000b004148670f9ecsm5954702wmo.23.2024.03.29.09.17.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 09:17:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] run-postinsts: Add workaround for locking deadlock issue
Date: Fri, 29 Mar 2024 16:17:42 +0000
Message-Id: <20240329161742.910250-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240329161742.910250-1-richard.purdie@linuxfoundation.org>
References: <20240329161742.910250-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 16:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197642

When run-postinsts is installed, a service is added for system which can run
while the package is still being installed. This calls "opkg configure" and if
package management is still running, it can deadlock and error.

To work around this, call fcntl-lock on the opkg lock file and if the lock
was held, it would wait to obtain it. This wait gives the package management
time to finish the install before the configure can then take the lock and run.

Note the dependency in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS otherwise we'd see
sstate selftest failures.

Also ensure that if the configure fails, the scripts returns an error. This
applies to opkg and dpkg.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf                                  |  1 +
 .../run-postinsts/run-postinsts/run-postinsts         | 11 +++++++++--
 .../run-postinsts/run-postinsts_1.0.bb                |  2 ++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 62f86f361ad..efbf2610f99 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -87,6 +87,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   sato-icon-theme->gtk+3 \
   adwaita-icon-theme->gdk-pixbuf \
   adwaita-icon-theme->gtk+3 \
+  run-postinsts->util-linux \
 "
 
 # Avoid adding bison-native to the sysroot without a specific
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 95dccb9cae1..1f3e692029c 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -81,11 +81,18 @@ remove_rcsd_link=1
 if $pm_installed; then
 	case $pm in
 		"ipk")
-			eval opkg configure $append_log
+			if ! `fcntl-lock --wait 30 /run/opkg.lock true`; then
+				eval echo "Unable to obtain the opkg lock, deadlock?" $append_log
+			fi
+			if ! eval "opkg configure $append_log"; then
+			    exit 1
+			fi
 			;;
 
 		"deb")
-			eval dpkg --configure -a $append_log
+			if ! eval "eval dpkg --configure -a $append_log"; then
+			    exit 1
+			fi
 			;;
 	esac
 else
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 72ba8c02270..e977942de87 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}"
 
 inherit allarch systemd update-rc.d
 
+RDEPENDS:${PN} = "util-linux-fcntl-lock"
+
 INITSCRIPT_NAME = "run-postinsts"
 INITSCRIPT_PARAMS = "start 99 S ."
 
-- 
2.40.1


