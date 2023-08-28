Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E63DC83F15
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:48:59 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.12634.1693226928781548746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 05:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=GdfYuW9E;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uT3sgcTfsX+QhIqTGvwok3EOS0ZwcOUEPeBrH9OLFmU=; b=GdfYuW9E+Wz1RKWsOGyrgzNVCP
	2luaFugjWnVLT6NVQ9xjLwk+OCQ2zKJ4zslRAsWSQt2saTCglIK5VvqgCMRtAnvvPCCO7ODhYRm8E
	2+xogVsJ7QSdYoIaLUDOCRekSkBhWg3wBkNQYkNIkMbuu5ZUT5Yf2mGwZ/6L1GeyjeFMXaPQQmplM
	bh2opxi9NF4i2oHstkxTAsxRVVnBtv+UimllmOdxmOUkK1NsBN+bTwm5jO9KJflABwBd47DVrHcPq
	imS5AfJN9zAQukxOQIw7t1cjjNam5gzoViQa3pwuFFrqyaTlNlQBcDgcbGxBenmknD4xTiO7g5zBC
	GBloEYHQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qabfi-0009Gc-MD; Mon, 28 Aug 2023 14:48:46 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qabfi-000BNd-6x; Mon, 28 Aug 2023 14:48:46 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [RFC PATCH 4/5] qemu: enable parallel builds when using the jobserver class
Date: Mon, 28 Aug 2023 14:48:28 +0200
Message-ID: <20230828124834.376779-4-martin@geanix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828124834.376779-1-martin@geanix.com>
References: <20230828124834.376779-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 12:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186827

If the jobserver class is enabled, the PARALLEL_MAKE variable is unset in
favor of configuring a shared jobserver in the MAKEFLAGS variable. However,
the qemu makefile translates the missing `-j<N>` argument to `-j1` when
calling into meson / ninja. Avoid this by setting `-j` without a value.
For normal/GNU make, this can result in a fork bomb, but for ninja, it
simply makes it use the jobserver fifa instead.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ea02bf0c73..7da05fcbf4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -110,6 +110,11 @@ EXTRA_OECONF = " \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
+# Avoid the qemu makefile treating a missing `-j<N>` argument as `-j1` when
+# calling meson / ninja. This happens when the `jobserver` class is used, since
+# it manages parallelism in the MAKEFLAGS variable instead of PARALLEL_MAKE.
+EXTRA_OEMAKE:append = "${@' -j' if d.getVar('JOBSERVER_FIFO') else ''}"
+
 B = "${WORKDIR}/build"
 
 #EXTRA_OECONF:append = " --python=${HOSTTOOLS_DIR}/python3"
-- 
2.41.0


