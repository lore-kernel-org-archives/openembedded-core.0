Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81801FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:09:50 +0000 (UTC)
Received: from mailrelay6-2.pub.mailoutpod2-cph3.one.com (mailrelay6-2.pub.mailoutpod2-cph3.one.com [46.30.211.187])
 by mx.groups.io with SMTP id smtpd.web10.1441.1667250582904417078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=WokOOO4A;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.187, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=GxeaRtb0QK5ARMwIgJ/1nAeizNWnyw9euiDTJL9bww0=;
	b=WokOOO4ALTLYa74mSi/vG7kgSd06YgOec8Y65mr+wYyUGz5FqOZOxKwthbwncR7Ua2wRFvats7YM0
	 cZnzNgh79lJRx/MCe067PhgQAxsTxRKr1SiyV0wKY7nlE0Ha7afVo172n0O0dgkKohmptB5hlsYw7u
	 iUvbXqBESiyX9H5Wj8kxZxENF0XOJgUAMtAlso9eBEdW9BIRGBnBWEFVW6Bpr6cCl+D8EDMGbtDT8v
	 YHaVV6JAjFwfKKYYtuU0Wthz+6t3HZNRmdqhj6q27cE4ioyffq4hxBhAXDqIfGG2TKfADbLP+LbkBZ
	 WrYZ1MAHwINHsgzRShrSkt/p37S5TZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=GxeaRtb0QK5ARMwIgJ/1nAeizNWnyw9euiDTJL9bww0=;
	b=AYjZUg/prB0iHAoyqjOnWkiXxmm8ndBM+SAsiy5iy6ORKsGDPD0vviFHiCbQKyHixsXrPLjN2NY2x
	 4q0sZxQCA==
X-HalOne-ID: 537a596d-5960-11ed-8191-a782043f7fe3
Received: from pbergin-7420.. (ua-213-113-159-147.bbcust.telenor.se [213.113.159.147])
	by mailrelay6 (Halon) with ESMTPSA
	id 537a596d-5960-11ed-8191-a782043f7fe3;
	Mon, 31 Oct 2022 21:09:40 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] systemd: change syntax for SRC_URI append
Date: Mon, 31 Oct 2022 22:09:02 +0100
Message-Id: <20221031210902.169924-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172335

In order to be able to override the git repo used in a bbappend
file the additions of files to SRC_URI needs to be done with :append
instead of +=, otherwise those will not be added.

My use case for this change is to try to build latest
systemd that is located in another repo than the one used
by the recipe (systemd.git instead of systemd-stable.git).
With this change this is possible to do by having SRC_URI, SRCREV
and SRCBRANCH in a bbappend.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-core/systemd/systemd_251.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.4.bb
index 87668cadc7..f6c9640823 100644
--- a/meta/recipes-core/systemd/systemd_251.4.bb
+++ b/meta/recipes-core/systemd/systemd_251.4.bb
@@ -14,7 +14,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
 # that we don't build both udev and systemd in world builds.
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI += " \
+SRC_URI:append = " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
-- 
2.34.1


