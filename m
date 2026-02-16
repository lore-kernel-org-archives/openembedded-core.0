Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EED5E83826
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 19:14:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23898.1771260333308465504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 08:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ANr8mS4o;
 spf=pass (domain: baylibre.com, ip: 209.85.221.54, mailfrom: ukleinek@baylibre.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43945763558so975389f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771260331; x=1771865131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFgadvH2sUf10EZSSr/AfWIPyM8ScxW1seQiAsPZt1c=;
        b=ANr8mS4o3c5i/81Mdeip6IkRWIMvQMrOs26ruyjuUPJZJuvO9881SVys9mD0eEJ4aG
         APu334fTuE7i9C54Vr634BRKKdJGaOqW/FeUSQyVZvFTlxiNW5I5vTvC4DbYWCbdzstI
         BQApSWNwuBoCEYcC6lXn67BRiTIGz3DtDjCsNSwnmri3BjIL30NOz4zY13nnfORCSTZA
         NTQCtCw/5sB6+4VB6ygTA6krH84lma8lMNWqGMT2prwMlgAT81R5VYosItybZAPKuO1W
         //6cSEHOiajz07MGf0ePPGvwxHJxGiZxF8/UoaqhzTrqV0bwf0QBeIgDBQljkKu7TN9M
         ob3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771260331; x=1771865131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFgadvH2sUf10EZSSr/AfWIPyM8ScxW1seQiAsPZt1c=;
        b=QOF1yP2TwpAagd5k5XyFDXuYi26p65TqounMJ0kYjFMEeJjFamFs2y6VRqP2bQGIJX
         RiyytkKTK5h3rNSuxYrxZlNlp6wzDwqj8JvcZ7grpKFJ7MFex0lZpXMAghMyZ820CEYp
         49veHAGzrlHAsiwSHQzkdbTBx4Cf+tSxUd3QhaKiBrSQekWfhK0uhAe5n1+v0pa0nS6/
         djRBUXu7PZ8y0XdlhtsI30hsNS2HUqQDHbgXU0ID1chLr0u5hHLKdPWYV5hGcak9cUOZ
         yMJpKHjk6tDY/nVLz8r+gTgNkcNRL7r8utpLH4a14OPgnMRf3zzDqD7uEssiMg50yz81
         St+A==
X-Gm-Message-State: AOJu0YwWkU/tUuWSHB72F15JfUdFmr0WPWsBF3hFrF636yXY1qsevF5O
	57JjCpVjQwQtzVTr2nFrsoa99765qFuPAUbgBGuyGXNmtuEF9SYTEvZqOrbo2yKxP2e7/3zOdd/
	BkwTS
X-Gm-Gg: AZuq6aKtAEMt9c2+XKBDkf7B66qcEtUZX4no0+E+Vcvzytzc/wEMmjVFb/UYntl+fOw
	zJA/k67aW8zf29ZuKgb6lpl2uPXO2uQSc9nKpyGwkT5wv99sFFrCME0t5uDIaiBX2VZwP0v6q7B
	sHepUPpuOCpiEMmP7JycxIa0n7q1WiTeowkZG1kCM5tDqG+QRIiMR35mM+ihAhcd+3jb6K3r5C4
	DXg3Lz7iF+L4nnilA4VyXB491HGi3jfWSxZ2tmszKj/JPBWoILYi8dumqwx7FynEd0Pbm2n87m1
	01w9aLBKMEmL2BWhNAYnpUBS+7TSCfAzMz1LSWnp5o2BKscP99i3fOwRD3rPu8NAM6ry46JOEHT
	A9p08E9mN4zfxVbX44F7GJ30L/l+qQnJK+zgQIoYeA2mEI6Rn0q67tFxHLLpH4il8yydDBRrEHj
	B3of3vQPXAIT+d53JrE9nR58cF2ApRlLQzyw5phjHtxkQZxMrOfSE6dHa0AFtU+YGEMQMhurDf1
	AsUX5EDH7FiYmU=
X-Received: by 2002:a5d:588d:0:b0:436:369f:39fa with SMTP id ffacd0b85a97d-43796af9ed9mr20738556f8f.44.1771260331239;
        Mon, 16 Feb 2026 08:45:31 -0800 (PST)
Received: from localhost (p200300f65f20eb04a4685b56fbf85197.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:a468:5b56:fbf8:5197])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796ad015bsm29181427f8f.38.2026.02.16.08.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:45:30 -0800 (PST)
From: =?UTF-8?B?IlV3ZSBLbGVpbmUtS8O2bmln?= <ukleinek@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Joe MacDonald <joe.macdonald@siemens.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [PATCH] busybox: Enable SELinux support if DISTRO_FEATURES contains 'selinux'
Date: Mon, 16 Feb 2026 17:45:27 +0100
Message-ID: <20260216164527.864396-1-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=uwe@kleine-koenig.org; h=from:subject; bh=STr5HgrSYzQ+Feuw87fBDoYMAFgB2/+gWJQi6r83Jkw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpk0lcGtlbIeUNUm0NVXwuEDkWAD2nI7E1ijWlP I0lA4pfaGKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZNJXAAKCRCPgPtYfRL+ ThWJCACj2lMqnW1RVLMDn4baT9O2Bt19Re+vvpZv+ZZu6fT/eBlEzTNMQ0nvt5PrqN5JNXc3DMB RoMSE7ZowIdVJL9SGHMbqDO331s4Q/zbhWzN+MceAuhCIcZ3fl2r+5K3dKEuq5MjXcT4yHKp11Y 4Cwz8qTw7WWXhLowkAEdfKUL/tJA9LY43jxv+n58QxCKTO+m2/n8yq1WzGAXQ93LQFCwmpLCp0r vSsx5vqzXwEiUX5yWFSi02BRQZXKWySDNlacqaNbjkn5oNRYbbIPIXr/qU1fHkgnmWtfX8u9zz2 ZnK3g5cwykWCeVS/cnvrj1sxOVmnzg4JPpMqDmkki5kA7KaY
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 19:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231219

If selinux is contained in DISTRO_FEATURES, enable CONFIG_SELINUX which
needs a dependency on libselinux.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this targets oe-core master, but it would be great if it could be
backported to scarthgap which is what I'm currently using.

Best regards
Uwe

 meta/recipes-core/busybox/busybox.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c85117efc80f..355c01973848 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -4,6 +4,7 @@ HOMEPAGE = "https://www.busybox.net"
 BUGTRACKER = "https://bugs.busybox.net/"
 
 DEPENDS += "kern-tools-native virtual/crypt"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
@@ -86,6 +87,7 @@ def features_to_busybox_settings(d):
     busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
     busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
     busybox_cfg(bb.utils.contains_any('DISTRO_FEATURES', 'bluetooth wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
+    busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d), 'CONFIG_SELINUX', cnf, rem)
     return "\n".join(cnf), "\n".join(rem)
 
 # X, Y = ${@features_to_busybox_settings(d)}

base-commit: 2c20c05b324e5d6564c8554381019170839509bb
-- 
2.47.3


