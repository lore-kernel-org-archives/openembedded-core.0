Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 07A366FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:43:55 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n63so67123825qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=VFYIesXQ0P3TyaZLRiGY/TSWgtkFSx8Z36T85ehBvYk=;
	b=fBOG7J8srdkGUQ3Zc2EploH0Id727VkKOdrVQBkI0t3b40DWhy6J1KUxTBbvS2n+oa
	ir9HwTSImv5HIisp9Fl2nbtSzPEXVJVncfvqhXXLYY3cVSbM+eeKB8MSdJS9UDaBFttl
	RxfeUPBuqfERvwwUmJ9yK7bAzTrjf6b0NDojdjG6Ati4/AiHRlzgDZzLVAVpQO48EEr3
	MChKAg2uK/0E9NJYeGoXJ77fxI/88a5nGoSw393IlepG3+YtQjdyHP/BlSHsF+7/GKjM
	W01CCVuE3Au+MuzvwXVK0jClmkiIkr4o6I3lcwCxfKFYWop0D+MDEXJ8k1/0s4AiXgc9
	ByFw==
X-Gm-Message-State: AOPr4FXIVgvENOMIs37b1KcpmBX4hbkt9ag0M58ICCvl0bKTF30JL+d4lrikEr228ZF3ug==
X-Received: by 10.55.26.1 with SMTP id a1mr234602qka.85.1462567436115;
	Fri, 06 May 2016 13:43:56 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	x202sm6423085qhx.30.2016.05.06.13.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:43:54 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:43:49 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:30 -0300
Message-Id: <1462567419-3459-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 01/10] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Fri, 06 May 2016 20:43:56 -0000

When the DISTRO has X11 and Wayland support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 16a788d..124a16c 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
-- 
2.8.2


