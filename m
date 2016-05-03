Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id ACE1B7318F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:01:08 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id iv1so14275405pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=4+hy25gLVZhIkSFMfDzCdsNjuVTRHde2EpFlyNkO1Zc=;
	b=BeH0KnAK/raxfVVnx7h12Alxd4mPZ/f0QS7PosCVVDPKnSMc43lDSPEM50PfglgNbe
	AetSgYWq6ks47euZpll4qgTjU8LJarerGh13HjnmeUJZEffbYlal3pMeKZdKT/m54oCw
	Yn2U3GMlLigmDLrQSya7mNeiOIYg4e2bJZdej9kcaS9/z6NzK2XCeSsfoPwKDeVIi6lY
	rvkegSbDfiA4MaenZ4kzy55fUaiMBAswThunDsKErT/ICq2O9s6ST8WNJfavTBKAFEFV
	dh9rqmH8HdO78XOOmURSCaCiLSu90+H78jgoBUioBxOk23aSX/K3kJgNoVUUBu7IfJfy
	0FCQ==
X-Gm-Message-State: AOPr4FXtVWZlZW8RU3vzEkbJjk0HXOyBH1/97AnshPWqGyPY3djLMDdRavVjeiR6bAt/DA==
X-Received: by 10.66.166.78 with SMTP id ze14mr6177666pab.149.1462305669533;
	Tue, 03 May 2016 13:01:09 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id r73sm107530pfi.4.2016.05.03.13.01.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 13:01:08 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 17:01:02 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 May 2016 17:00:45 -0300
Message-Id: <1462305651-16593-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
References: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v2 1/7] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Tue, 03 May 2016 20:01:10 -0000

When the DISTRO has X11 and Wayland support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


