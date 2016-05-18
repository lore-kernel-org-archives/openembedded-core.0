Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24D8277086
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:43:24 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id e35so4640642qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=xGRH0x3iE/Et0Jgdk6r2MyDpuaqk0MHvhYPLKbINB0Y=;
	b=UGnYrWLt85wGPEd6nt0UCSIhli6jnZltFTbCYMd/ANV4nIGBfRUO/beagdGEAWa73B
	QJt6gzty4LZjxoWaE2aY9pXqX66byBsI4ADJJf30W0BPL2gYXujlbq93FwxSgHqHPJob
	a0kl9M7tgKfNRw9R+s12CYScdnXiDcgkabEzQkYgMUURMjNJHzsG/pjoEf40AYGuVSL2
	O1KEQqWclbo9tjitHVnYJyolCYL0F0f3Tug/tYLwVjg1zAYPfIrjgrRkRDsITnWncBt6
	Cjq7I7iiTUgLDcbfzKjVVHy/+LnnSYiV9VhPo2aewWFfo7sWfjk3EeDvcBjwI3pQ7foU
	ZFuA==
X-Gm-Message-State: AOPr4FV2qeV+Dotg8lqHv83dzZeSAoGMVmJnj6y9X4pZrTkLXwbZYrP/WYjBa8EKaR2cFA==
X-Received: by 10.140.178.15 with SMTP id y15mr9021275qhy.44.1463589804932;
	Wed, 18 May 2016 09:43:24 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	t81sm4528347qhc.11.2016.05.18.09.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:43:23 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:43:14 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:48 -0300
Message-Id: <1463589648-28641-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 13/13] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Wed, 18 May 2016 16:43:24 -0000

When the distribution has X11 and Wayland backends, we enable XWayland
support and include XTerm as a test application for the XWayland
backend.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8:
- Install weston-xwayland package (Ross)

Changes in v7: None
Changes in v6:
- Add xterm

Changes in v5: None
Changes in v4: None
Changes in v3:
- New patch.

Changes in v2: None

 meta/recipes-graphics/images/core-image-weston.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 52e271d..f62f9d7 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -9,3 +9,4 @@ inherit core-image distro_features_check
 REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland xterm', '', d)}"
-- 
2.8.2


