Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FF0C61DC6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:41:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1890.1787906504957230888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 01:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DiJh4UOA;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e61a34e5so248977f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787906503; x=1788511303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1D7NBeAi7bijlUa+A5rLnuU9a7EypBddi/dcDSKseCA=;
        b=DiJh4UOA3JcG7qKSomWuJuRaJbeVG1KvupOS8DyCx5lpbseyUZtNxTgQRVL1xdBizk
         XLc/MLmdybQQ9yppwLcTlf1CMgV0RBK5k4Il6FJINWcHLa0gOiSAT7gf0TmQrZNE/OxI
         r73YYmp2Moybe3Cbho84Kj+u3AoDHUY4mP/bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906503; x=1788511303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1D7NBeAi7bijlUa+A5rLnuU9a7EypBddi/dcDSKseCA=;
        b=e9/H3bpIcq/3bRLXioK/KFzluebLrCxHUcucYCGolwQbpiokeTEWHw3qiwDuR6Y67x
         0BP9sf8rHEvf3jRg1JdVgZzHLVHPbMqzpUxil98jqYFoDPIg+v5webSYOlEF4uAEwc78
         VpVb1cXOBm3On+Yw9BVJPAwyOLgxdotpDsaBcqzYpVOpCeL5uy7Yg24Nd+XYNx2NIHCO
         PLQ/+X3jclLK1xs9NrlWvu9z/grb+rFah82xHY5FwhuWQhCtTUPIlroHsqBWlGvyF4XA
         J7Ts6SOXCG3keQFQ2hc9I5DeOEdt4BD05Ac4Iv8IokzlvdYp/5eaX88u72qSo+Gv1N8R
         jyzg==
X-Gm-Message-State: AFuF++l6VC+b3NVStoHmsoCTudp+ntR64m7MSGLiYy0wI548AWuNhhxA
	S3hx/eD93wKFlFtCXBB6kbCgg+6ieEftJJXPfxeej0FVg5prCFSUnN0Kx1TSAvbM17mCAL1Iplo
	GvRxNXpU=
X-Gm-Gg: AR+sD10mf6DL7Kd0b2RhAiYCK22pOBpoKcLkEUjcJ/VIzL4JbxQIE2vHkY8eCJVUtwi
	ySdu5w5PpaXT4jikr7yRASuZ2M/3/st1euNfyvUDxH96iJzaUx/8Cjkmh6j7WrJUJqy42Y+tPj7
	tFJ1weeMlm/eW7QyopywFRupIGz5e4cKmGI2ARRhQFimLESh0Kuki/eSR7NDKlDgUGHw2SdGWlZ
	Nv1vlD3JML8oR02RBYTKDIE5Kul6UMaOjmfPv0rA94P5XSXWRlQN/5pQXcXNqRfRCl+KXc26pFz
	djWIlwCKl9q+TxtFU4g3VvIQ2OMLBGOHsfDkQrBlZ+bKJtRAFQquwAMVS5KHBnfJuto+Bjkz6Ny
	hFxyvDJEhLDYjdKchrkUrAr9HwPKBhFIBU8/PVSXwqAaq6Bix0l4kthfPwEFPQpocBstlvxLNoz
	eXwnbMzNIAfdLQwkwW5WmfLlrzmLvTGOHy6uAH4Cw6LHv2Y5v7lJ2BL6+UVCRDxHY/s6UJ6GVZp
	MPXZEj0G9sCYZgEmEg6LqCP7IBj16Q40YiZfggrRFH/tQNu9IegPA1I6GDegavM
X-Received: by 2002:a5d:5f8d:0:b0:482:ee81:f0ca with SMTP id ffacd0b85a97d-482f79c94eemr7137826f8f.12.1787906502865;
        Fri, 28 Aug 2026 01:41:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm2279223f8f.17.2026.08.28.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:41:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap 00/11] Pull request (cover letter only)
Date: Fri, 28 Aug 2026 10:41:25 +0200
Message-ID: <cover.1787906349.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244525

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1787652331.git.yoann.congal@smile.fr/
(No changes)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4569

The following changes since commit 70dc15941dd33270a92d1001174efb3093e79bdf:

  build-appliance-image: Update to scarthgap head revision (2026-08-24 14:28:47 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to b7007d82eec734bab6760ae325645ae5b199e384:

  rpcbind: Fix CVE-2026-16277 (2026-08-25 07:01:14 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  libssh2: fix CVE-2026-58050

Deepak Rathore (2):
  nghttp2: set status for CVE-2026-58055
  glib-2.0: fix CVE-2026-58015

Etienne Cordonnier (1):
  curl: fix CVE-2025-10148 backport for websockets on 8.7.1

Jaipaul Cheernam (4):
  binutils: fix CVE-2025-1147
  binutils: fix CVE-2025-8224
  binutils: fix CVE-2026-15003
  binutils: fix CVE-2026-18220

Peter Marko (1):
  bison: patch CVE-2026-56389

Ross Burton (1):
  bitbake.conf: add TMPDIR to GIT_CEILING_DIRECTORIES

Vijay Anusuri (1):
  rpcbind: Fix CVE-2026-16277

 meta/conf/bitbake.conf                        |   6 +-
 .../glib-2.0/glib-2.0/CVE-2026-58015_p1.patch |  97 +++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p2.patch |  55 +++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p3.patch | 198 +++++++++
 .../glib-2.0/glib-2.0/CVE-2026-58015_p4.patch | 222 ++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   4 +
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../binutils/binutils-2.42.inc                |   4 +
 .../binutils/binutils/CVE-2025-1147.patch     | 110 +++++
 .../binutils/binutils/CVE-2025-8224.patch     |  54 +++
 .../binutils/binutils/CVE-2026-15003.patch    | 400 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 .../bison/bison/CVE-2026-56389.patch          |  56 +++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 .../rpcbind/rpcbind/CVE-2026-16277.patch      |  34 ++
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |   1 +
 .../curl/curl/CVE-2025-10148.patch            |  24 +-
 .../libssh2/libssh2/CVE-2026-58050.patch      |  45 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 .../recipes-support/nghttp2/nghttp2_1.61.0.bb |   2 +
 20 files changed, 1367 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p2.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p3.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58015_p4.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56389.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch


