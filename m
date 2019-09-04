Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0647F290
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 07:44:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h7so18749775wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LF1M5x7EzbOyPTv9zG780FGV9/DZMjEBk6nS89yt9rE=;
	b=RCgR+njERbTqp34ltJSIIbMrJybRekFWKU8JyZ7Ie8ISmQqK8i3NhLAKvlkS7hcVl9
	yUurQc4DROB2Kk6/RBaG/6etHvSYcF8pCUklDI527/ymNowYpb75jDgAZWCzpIyWIDz1
	4Wim4r8xBbUuO62APqcvhpjn/dbAIGLAJozPDE65K6q/xmAXI1laOQXeRxFVVrkudrvV
	ksHMjZ/eXNFEV22SBJBhaoavkZ95ipuR6hwP1qDQnfCMEe9IoLrxInvOUoY7PcCsCAzx
	FxhU3J3wAF6ybAP9QH/l8xrfGvm+93FyvVA+Dp0zgmCKZWlxwePD07muZOZCbpD3tTSR
	kOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LF1M5x7EzbOyPTv9zG780FGV9/DZMjEBk6nS89yt9rE=;
	b=kF9b8kvYT079E65HYhKBhnjFxBrWcRHXBVzm8GChMtevj3M/l3xhUVaNOL6fcMRkiZ
	NY2n+UuRYvTMTnswOnxOV5IxQh/wtyiiQIlkPUUJ2dKFjEQOg0JPhQSGQ51vjacfy/tH
	AA39K6yLIfOjS1rTG+d74H3N+8P9i+X5TW2GTTa327SMi82zfB5UjBfQZ2h/HfEDEhoz
	MKVFzv6lF56p/5zW+WobMl9xOR2E/GSfnuC1vjWq+cev8VY7lnLoB40v5S7eUN4+X5KD
	ZWvXgWFdycRiJBFISsLxWDlgf/vvo0qjTnmwB8VW+d1rq94mjf0MAQduEkQpPFEe5fki
	NVWQ==
X-Gm-Message-State: APjAAAUeMwQ3o2uw/dcQJKg9/qbLDfYjM8acSof2kon4C0iM52jRZlBK
	WHeL+uQWuIJtMbEfA7cCOW2qqtWj
X-Google-Smtp-Source: APXvYqxccyZ48EMU/XXcaqbqCcqVe80euh0++fHiMpp7FCHl0w5SZ5Kn9as1NM/ToJTI9IGVstz09A==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr46889629wrw.139.1567583057701;
	Wed, 04 Sep 2019 00:44:17 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id l7sm1838072wrb.19.2019.09.04.00.44.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 00:44:16 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 08:43:44 +0100
Message-Id: <20190904074344.12701-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] iputils: Set prefix correctly for usrmerge
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
X-List-Received-Date: Wed, 04 Sep 2019 07:44:17 -0000

Fix build with usrmerge enabled:

  WARNING: iputils-s20190709-r0 do_package: iputils: alternative target (/usr/bin/ping or /usr/bin/ping.iputils) does not exist, skipping...
  WARNING: iputils-s20190709-r0 do_package: iputils: NOT adding alternative provide /usr/bin/ping: /usr/bin/ping.iputils does not exist
  ERROR: iputils-s20190709-r0 do_package: QA Issue: iputils: Files/directories were installed but not shipped in any package:
    /bin/tftpd
    /bin/tracepath
    /bin/arping
    /bin/clockdiff
    /bin/ping
    /bin/traceroute6
    /sbin/rarpd
    /sbin/ninfod
    /sbin/rdisc
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  iputils: 9 installed and not shipped files. [installed-vs-shipped]
  WARNING: iputils-s20190709-r0 do_package: iputils: alt_link == alt_target: /usr/bin/ping == /usr/bin/ping

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- use root_prefix, not prefix, so non-usrmerge case installs into /bin (and friends)

 meta/recipes-extended/iputils/iputils_s20190709.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 34a6c682607a..d8f2470d0c5c 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson update-alternatives
 
-EXTRA_OEMESON += "--prefix=/"
+EXTRA_OEMESON += "--prefix=${root_prefix}/"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.17.1


