Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17320.1793294289527536559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kKiHe4SN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261029171807a8e9707ebd00020702-uqyf1g@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261029171807a8e9707ebd00020702
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:18:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=x/Xuvf6unqg6EitbgF8kpbug3vn1ccWAjEl2ou96soM=;
 b=kKiHe4SNhqA7iZlrCoxCjR9yjt/AmRvnK06CyzomU0IEP77obHwaaGiQ7phuAoabq9mKUr
 5TFotR0zGu2+oyhrJHlFPIyqs1RavHZvNURs8EQwjMb1uKND3Me4UBPVIkMTwyMzvpCZyDf/
 DhZAkZOYBwvjwm88LtxJkGuW0rjMtQjyhw0BP+8AguadHurbaNUUDc7QilT0SjiTDRB7fX+h
 YiDsNmaahL/v4DIbYR+0Yfsa9a0QLaoanqwwfDSiZKTxjrxF7eeGK5kp2W14bFGGYCqP6bKd
 OsnXfsnxr84EE2Xl/UasLEUx1gbEl9k2De4xFTepa8cEZXO9x2dGL8zg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 3/8] systemd: add iproute2-devlink runtime dependency to udev
Date: Thu, 29 Oct 2026 18:17:01 +0100
Message-ID: <20261029171709.2842512-3-peter.marko@siemens.com>
In-Reply-To: <20261029171709.2842512-1-peter.marko@siemens.com>
References: <20261029171709.2842512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248959
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Service file ${nonarch_libdir}/udev/rules.d/81-net-bridge.rules executes
/usr/sbin/devlink which causes errors seen in journal on systems which
don't install this package explicitly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 69bf564780353d34cfd87bf73960cfadd8b2c6ac)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd_261.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_261.3.bb b/meta/recipes-core/systemd/systemd_261.3.bb
index 0901736e7c..1f482d988e 100644
--- a/meta/recipes-core/systemd/systemd_261.3.bb
+++ b/meta/recipes-core/systemd/systemd_261.3.bb
@@ -764,6 +764,7 @@ FILES:libsystemd-shared = "${libdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
+RDEPENDS:udev += "iproute2-devlink"
 RDEPENDS:udev-bash-completion += "bash-completion"
 RDEPENDS:udev-hwdb += "udev"
 
