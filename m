Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id EFDE178548
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:38:00 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id x24so8156532ywj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LNRsRpsvj1bFle+2e0+cV636VvCKifxLEuwN86tegC0=;
	b=ZpKKwdalXGCfFlp8LDULd97U/t289elSXu43/bFo+YRmpdyMca4z/Dt0SeeANOIbKu
	N5KZLbzmgDk809AxOsclAmQPSQnIbjSSDkWsWk/GWMbRiXnBPUL3T+uzjuc7p1D2w1Ju
	Z7OtyXttejWM+TVpVKv8DeGxYJR7kyNL537E4Ffl6W6bCiPeq0nAT/TEV/tnqDqgjqgH
	LS8Djflh5nmOiBDjs9hOHa2v3RDG2fMy8E3nDmnkf+ZDH6Ae9nKogjFI8WusUwkDGG3n
	7S5iDk5E9BdXcV4RAF68qJyIQ0XMqfn24i/eFfxshGkgENg453akRh0yeYXnmNLi2o/v
	3x+g==
X-Gm-Message-State: AKwxytepXWipojvbZ4LbaWJSPyMI5ETJ8E7swHy+bUq73y9avEvrV7bJ
	xdIXXbLl5T3NPkU2KDrSyq+C
X-Google-Smtp-Source: AH8x226QkTx0bB4wzDJKujtp8dFKYY6Su8TuqzOMJ+m5f76+smgKNoVR7OVW1HHMUtp7zIU0hBymtA==
X-Received: by 10.37.188.8 with SMTP id i8mr23247183ybh.404.1517420281732;
	Wed, 31 Jan 2018 09:38:01 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68])
	by smtp.gmail.com with ESMTPSA id t82sm6322132ywa.6.2018.01.31.09.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Jan 2018 09:38:01 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 12:37:57 -0500
Message-Id: <1517420277-6542-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] security_flags.inc: Use SECURITY_X_LDFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2018 17:38:01 -0000

We need to ensure that all xorg modules are linked with
SECURITY_X_LDFLAGS to ensure that they will be able to resolve their run
time dependencies.  Replace the incomplete list here with globs for both
video and input modules.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
I admit that I'm not sure if this, or an explicit list of all of the
modules in both oe-core (we are missing some today) and
meta-openembedded (or per-recipe updates there) would be best.  I'm
starting with a patch that does a glob as that will cover what we have
today as well as in the future.
---
 meta/conf/distro/include/security_flags.inc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 7ea1049edff8..732972e85136 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -59,12 +59,9 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
-SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-omap = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
-SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
+# All xorg module drivers need to be linked this way
+SECURITY_LDFLAGS_pn-xf86-video-% = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-input-% = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
 
 TARGET_CC_ARCH_append_pn-binutils = " ${SELECTED_OPTIMIZATION}"
-- 
2.7.4


