Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17348.1793294341839798930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=nO9YrX6Y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261029171900611fa2975500020757-cfysqr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261029171900611fa2975500020757
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:19:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vXcQh0J9nbHVFtGUUwCLaDBH1M6Rh6Ur09o/yF1ml0c=;
 b=nO9YrX6YxTmS3ga7ItTgsRQ+1oC3k2ApeXmZW/Yb5e2DVnfmFUB7P4PB8h2PAp8mD/Dpsw
 v/524QqEcucvgo20PhIkqT/RqxM0FvbIyKU9vZ0uLxf+dQIYv1zViDjNhJbushYSbQ9g5vEP
 mbkH2mKc3Hh8p4DECgPcJLJ9Rjwt15eU9pcTz0nyJupiuFyzqrAQ/+5Y67211vjZP1Qbhpwn
 v7p3nET1jcWLVf4Alm8jowmktO6xf8jZdLHnVhbglkyqFMz6h7dYbyHuyW1BsaE6exTt/717
 7+LiUN3IiRjh8nKfVvRWmkx2Af3M9QqbhNu09RI1rY/aSTQE1XBvFi8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 3/4] systemd: add iproute2-devlink runtime dependency to udev
Date: Thu, 29 Oct 2026 18:18:12 +0100
Message-ID: <20261029171813.2842605-3-peter.marko@siemens.com>
In-Reply-To: <20261029171813.2842605-1-peter.marko@siemens.com>
References: <20261029171813.2842605-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248967
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
 meta/recipes-core/systemd/systemd_259.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index e924884bf9..3c74754532 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -760,6 +760,7 @@ FILES:libsystemd-shared = "${libdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
+RDEPENDS:udev += "iproute2-devlink"
 RDEPENDS:udev-bash-completion += "bash-completion"
 RDEPENDS:udev-hwdb += "udev"
 
