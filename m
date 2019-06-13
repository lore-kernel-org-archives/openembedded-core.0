Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E20DF7E1CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 08:17:35 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k11so1527775wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 01:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YeV35QzamRYdCbQDHjE6Yz8lREpZVUyydtE49/Yh30U=;
	b=ZUsUfNeDnblV1PbwdNuH1SCKoc9dxSXJZflDy0RInKCIaak8C2O5qhNiV8eEm1zsSc
	B5cOOzeJd4HR0sM7geOjaR9nBmlOxD6Tt4ELEJaJ7dQhyBrj6eCt5m7xSkGONAfDD5Wy
	xHtjnRA6mTe046RYYlwkRjWMWTMza1JFHMZ0LXOUET3IiKnTIaO/abrOdsCau8ZvEXE6
	TqFEF9f5vQrw6ZaiZAh/Qgkzvwg2naOniTiUc/OH0oV7Df8o/MparWwVD682cbOVK3Oq
	sa/uLfKzmHS0rrDb2cVxZ0i3hVhHTzd1EyDNVL7lQ2lXZsgy2KNNIFzpM2cKijQpR/ei
	SEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YeV35QzamRYdCbQDHjE6Yz8lREpZVUyydtE49/Yh30U=;
	b=pv7e7R9Jj5yf+aJXSbKJv572o9s0X3Mx5wqnaWLT73/atUa0YOIXJn3c03k+CbYFZb
	HDli8i78V1YMsuTHw6V4FUn2OQQYAqAMSwbCaZfZjZSlaJuBZmHgg3QmenofI9lV6icZ
	7Vfrw3apLJOkUd5gvSdh11juOv9wtkLINTqtOxOL+NN7gEpF639NvicLvlgcLQgGboQm
	qwn2ohpco69F8WcBMqM1oOerXtGG8TVih7CVAgG7S3xtIxQyUUwlv8m79VJjcGhNRYDi
	XPVQqPNJlXZ1wfleWZUAIZtO5Bhfs4uzAZujBPrTfEoEfzoYthE7CmYuhv1hPYFzrLj8
	srIw==
X-Gm-Message-State: APjAAAVBeRfsdbSl2KhWui9iIL3QNYySOzCwFkDtIz3qFd5QE+0iDrUF
	C907/ikqWLv719PrVcDUtooXtExo
X-Google-Smtp-Source: APXvYqxgDaAgEnK33W6yTA2Z0aSEKkQMUVP7qTCwlG9gxk/tnqrYA2QC/0DjKxt+pvcySfVCfUvCZA==
X-Received: by 2002:a5d:53d2:: with SMTP id a18mr8799375wrw.98.1560413856332; 
	Thu, 13 Jun 2019 01:17:36 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e7sm1666196wmd.0.2019.06.13.01.17.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Jun 2019 01:17:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 08:17:34 +0000
Message-Id: <20190613081734.60-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] bc: use u-a for bc as well
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
X-List-Received-Date: Thu, 13 Jun 2019 08:17:36 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* bc can be provided by busybox as well (e.g. if you have your own
  defconfig and forget to explicitly disable it:
  ...
  *
  * Miscellaneous Utilities
  *
  adjtimex (4.7 kb) (ADJTIMEX) [N/y/?] n
  bbconfig (9.7 kb) (BBCONFIG) [N/y/?] n
  bc (45 kb) (BC) [Y/n/?] (NEW) dc (36 kb) (DC) [Y/n/?] y
    Use bc code base for dc (larger, more features) (FEATURE_DC_BIG) [Y] (NEW) y
      Interactive mode (+4kb) (FEATURE_BC_INTERACTIVE) [Y/n/?] (NEW)     Enable bc/dc long options (FEATURE_BC_LONG_OPTIONS) [Y/n] (NEW) beep (2.4 kb) (BEEP) [N/y/?] n
  chat (6.3 kb) (CHAT) [N/y/?] n
  conspy (10 kb) (CONSPY) [N/y/?] n
  ...
  ), causing conflict in u-a:

  update-alternatives: Error: not linking /usr/bin/bc to /bin/busybox.nosuid since /usr/bin/bc exists and is not a link

  and then whole do_rootfs or do_populate_sdk to fail because busybox postinst is failing:

  do_populate_sdk: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
  then please place them into pkg_postinst_ontarget_${PN} (). Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index e80857745e..809b864c1a 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -27,7 +27,7 @@ do_compile_prepend() {
     cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
 }
 
-ALTERNATIVE_${PN} = "dc"
+ALTERNATIVE_${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
\ No newline at end of file
+BBCLASSEXTEND = "native"
-- 
2.17.1


