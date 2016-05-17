Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 160C3731BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:37:18 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i7so1955495qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=JYgnYvK2wBYz8bvzDx8IV6hzcFjQW5B0wyFlzBiXBEM=;
	b=g/R44zaEwdYJvOIqF42QUwPJ9esEQVJ5Ox53IK+yset3dlTCIMfvTcTZvAa+jS4Vi7
	+bopml8kRfPKOF2ba7kqdu2IP5mwTBDrMQ4hjf3+xAx16h7yuNqlqu9HqtYZgdFgGMt0
	0NLBULc2a5ntTGo0RR1Le4IWYTKDiBQGvAGWrCAr55dwTr6c3uhSSsyumTWKvWuPOK71
	UhCZyof6V3tW8LtCqTvUgI4DujdQVhRt+z/9pLBtYl5ebcy1gw9bnrtHDj0YfbVd8iMe
	9jZYgPd78CO3+8WxS2Fw87II+Uz82Xfbzh7JXgwMf5zVcnfPnTy5iA9QzdOIq7xZPjZe
	NlOQ==
X-Gm-Message-State: AOPr4FVqvWAjhD8BXGd3R2DZ3QXQEcD/meTCeQQprmmhy84bop4y+oRETY+KpPgAh4bxkQ==
X-Received: by 10.55.42.146 with SMTP id q18mr2722752qkq.64.1463503039564;
	Tue, 17 May 2016 09:37:19 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id n4sm1719434qkd.21.2016.05.17.09.37.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:37:18 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:37:09 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:16 -0300
Message-Id: <1463502985-5428-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 04/13] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Tue, 17 May 2016 16:37:20 -0000

When the DISTRO has X11 and Wayland support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 16e961d..3ab7c4c 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    clients"
-- 
2.8.2


