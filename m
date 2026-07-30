Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF44C55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 08:33:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6910.1785400428662016067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 01:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=23zG1tzx;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955158f26aso12364685e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785400427; x=1786005227; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kZMfcYAPSy/wnxtjZWpPNKejdfwUIxgFuYGNhkG80U=;
        b=23zG1tzxeJ3bw1XSvyEkNurebWAHgmERgOMiB7zj09MT1EY+d1S/6hwG9FfdT2s1gq
         CQKvaBExan18njgTn5Fq5ZdLoXRx0LGNFuaDEL9I9FqdJrMIVge1b1LPoYL7xEz+eJeW
         vcYRokddCuEVomrBHW6Ku3SXLBkC2LWWDfYBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400427; x=1786005227;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1kZMfcYAPSy/wnxtjZWpPNKejdfwUIxgFuYGNhkG80U=;
        b=aRWnt8H0yMaGLemevmgxQFPRmt7rl1eksMrv3Dv76wPHCHshHPIp4E+p0JIAtW5d99
         1W8LUFUG0+xmmu1CmXQSJ4BOwCMFqW3nzxaU5rPttC0bkZcWK84MXtrhjVZOBg6tFvIT
         6Y/V9vntUssPgNjd9dk9o8JpQCYpOs93k+QtFhuBo/USBlUHqIbe4q6DVFwJFymEPV6P
         TE9ko3sBNM65QV9eFHytuJYngOOK/Ng43H8UH1A9pV5K+8TwoWCnLF9StMzAHtiZ32pm
         HFwfhTBH3bB95mn/+DqdWWtIcu2mq/Yq24oWe7kHnDIx5P1Vx4K0XFXTerNOfQJNDCnn
         LegQ==
X-Gm-Message-State: AOJu0Ywkf1DqPi4N9eO9ppAIN0giyhCFA+5AulmrQz2rYXP6I+UsGTbK
	OplA8s672LLm5o9elYfb7G8g/dC8H7V3nAVBNHiBfx7/TVRLST0vZrPXrhczLoaabcfn6tWkad+
	gFeyOOA4=
X-Gm-Gg: AR+sD11UbAHL2fifv6XFkLwAbEaMVyXnUw1gn8XUp141T3gOi+RQgtoRp+m95vljE0M
	UgXBsV4/pJ5LfhkJ9BEw4iTBNFCiaqm5yn3BvisBPN5M0U4qNTfjpx+1mxdBYuOPP8umV7Mz7Op
	KF6VNf0gr/JwxLvLr3MfoIXMWakzyWjz8HJyXYTXJ0e4YQSpSgz0sUsAK7ADranQl2xEKnqIzDY
	N7eI2WEq8w1BYf/sJv7i7UfR9QAH83EkRMCGduXVvk3bn5W7WDEENp/+NlWEv9B6FYYSxATNMwf
	waqfRyjxnGA3SuTdRvIRAXoDhxDJgFXRNVe64N/DgYHqXCPBVTyUPBnOZovzFsBNgChFz7umfqm
	kRxOEPNpVMEN9xm/EOwoAxvjIEzD7AEKg++UqUwnAiGc7T+a87ZY2v9CpBgUk+MqroXF+rwolGA
	qBcfrkHLV1J7mjyr/2s5TtNVIuDvjBzCUR4jsxYsg4QbnITl2ovM0yfSnhhkx2xGplofdJRqyqr
	fUE1xkuPhupouRzbN+XzF5sr79Gi3uOylWHqhQsPnupDo27OFiZm/EqXVNqCnI9vRpinYZbouU=
X-Received: by 2002:a05:600c:628d:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49800e6d270mr18851235e9.5.1785400426238;
        Thu, 30 Jul 2026 01:33:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc8940da6sm4127562f8f.32.2026.07.30.01.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:33:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/30] Pull request (cover letter only)
Date: Thu, 30 Jul 2026 10:33:32 +0200
Message-ID: <cover.1785400140.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 08:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242327

Warning: this contains a linux-yocto upgrade that must be merged with the
corresponding yocto-bsps upgrade in meta-yocto.

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1785190123.git.yoann.congal@smile.fr/T/#u
From this series, the rsync patches where removed:
* rsync: Fix CVE-2026-29518
* rsync: Fix CVE-2026-43619
* rsync: Fix CVE-2026-43618
* rsync: Fix CVE-2026-43620
* rsync: Fix CVE-2026-43617
* rsync: Fix CVE-2026-45232
See: https://lore.kernel.org/all/DKAZFDFRUHBF.2SVVF2X00US95@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4313

The following changes since commit f66b182e2ff431b624dfc3a506d25dc8f1fc6db2:

  gzip: Fix CVE-2026-41991 (2026-07-27 09:47:02 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 243aa188889c765564c75247b7314e3f6168520a:

  vim: Security Fix for CVE-2026-57452 (2026-07-28 15:32:17 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  gnutls: fix CVE-2026-3833

AshishKumar Mishra (1):
  package.bbclass: hardcode emit_pkgdata to run last

Bruce Ashfield (4):
  linux-yocto/6.18: update to v6.18.36
  linux-yocto/6.18: update to v6.18.38
  linux-yocto/6.18: update to v6.18.39
  linux-yocto/6.18: drm/virtio: fix deadlock in display_info_cb by
    removing hotplug from dequeue worker

Daniel Turull (2):
  systemd-systemctl-native: disable libpam meson option
  xmlto: correct srcrev to point to released version

Darsh Kelaiya (5):
  gawk: Fix CVE-2026-40467
  gawk: Fix CVE-2026-40468
  gawk: Fix CVE-2026-40469
  gawk: Fix CVE-2026-40553
  python3-setuptools: Fix CVE-2026-59890

Deepak Rathore (2):
  curl: fix CVE-2026-7168
  sqlite3: fix CVE-2026-11822 and CVE-2026-11824

Devansh Patel (1):
  openssh: set status for CVE-2026-59998

João Marcos Costa (1):
  curl: add annotation for CVE-2026-10536

Leonid Iziumtsev (2):
  libgcrypt: fix CVE-2026-41989
  libgcrypt: fix CVE-2026-41990

Peter Marko (1):
  libpng: set status for CVE-2026-40930

Siddharth Doshi (6):
  vim: Security Fix for CVE-2026-42307
  vim: Security Fix for CVE-2026-43961
  vim: Security Fix for CVE-2026-47162
  vim: Security Fix for CVE-2026-47167
  vim: Security Fix for CVE-2026-55892
  vim: Security Fix for CVE-2026-57452

Siva Balasubramanian (1):
  util-linux: upgrade 2.41.3 -> 2.41.5

mark.yang (3):
  python3-cryptography: set CVE_PRODUCT
  python3-ply: set CVE_PRODUCT
  python3-pyasn1: set CVE_PRODUCT

 meta/classes-global/package.bbclass           |   7 +-
 .../openssh/openssh_10.3p1.bb                 |   1 +
 .../systemd/systemd-systemctl-native_259.5.bb |   1 +
 ...2.41.3.bb => util-linux-libuuid_2.41.5.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   4 +-
 ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch | 114 ------
 .../util-linux/CVE-2026-13595.patch           | 148 -------
 ...l-linux_2.41.3.bb => util-linux_2.41.5.bb} |   0
 .../python/python3-cryptography.bb            |   2 +
 .../python/python3-ply_3.11.bb                |   2 +
 .../python/python3-pyasn1_0.6.2.bb            |   2 +
 .../python3-setuptools/CVE-2026-59890.patch   | 194 +++++++++
 .../python/python3-setuptools_82.0.1.bb       |   3 +-
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb   |   4 +-
 .../gawk/gawk/CVE-2026-40467.patch            |  62 +++
 .../gawk/gawk/CVE-2026-40468.patch            |  61 +++
 .../gawk/gawk/CVE-2026-40469.patch            |  90 +++++
 .../gawk/gawk/CVE-2026-40553_p1.patch         |  50 +++
 .../gawk/gawk/CVE-2026-40553_p2.patch         |  44 ++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |   5 +
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
 .../libpng/libpng_1.6.56.bb                   |   2 +
 .../curl/curl/CVE-2026-7168.patch             | 376 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 .../gnutls/gnutls/CVE-2026-3833.patch         |  90 +++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 .../libgcrypt/files/CVE-2026-41989.patch      |  42 ++
 .../libgcrypt/files/CVE-2026-41990.patch      | 316 +++++++++++++++
 .../libgcrypt/libgcrypt_1.12.1.bb             |   2 +
 .../CVE-2026-11822_CVE-2026-11824.patch       |  41 ++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |   5 +-
 .../vim/files/CVE-2026-42307.patch            | 177 +++++++++
 .../vim/files/CVE-2026-43961.patch            | 104 +++++
 .../vim/files/CVE-2026-47162.patch            |  83 ++++
 .../vim/files/CVE-2026-47167.patch            | 102 +++++
 .../vim/files/CVE-2026-55892.patch            |  95 +++++
 .../vim/files/CVE-2026-57452.patch            |  90 +++++
 meta/recipes-support/vim/vim.inc              |   6 +
 40 files changed, 2075 insertions(+), 289 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.3.bb => util-linux-libuuid_2.41.5.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.3.bb => util-linux_2.41.5.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch


