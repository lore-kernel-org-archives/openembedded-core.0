Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 581416B96C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:08:19 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 32so27008501ota.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0i06UE75OSMK5ENyfQ2MP3Ql5LZMneps8X3YPH1wzHk=;
	b=Id/Dus782+qBt2pY2xaT7TRziJY7VHugw3Jd3Kx3wWlGIzYXo6GfVXJO1uHMMkJCZG
	fxP1iUv2phE99+3qrSW7KS2khWWvIT9C1i4BzOtFeCGE57TGjk4uSeCCu13eRL5m2kwV
	VAhXBs1dCy8538u6L4oHdog4qs+fZtWZf0to4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0i06UE75OSMK5ENyfQ2MP3Ql5LZMneps8X3YPH1wzHk=;
	b=Y0ZlrC686u5K/gdxWwi2wTnvhid7eqICoiCSMSVw5wSeYv9zqIYi83vBnksAw3llpk
	DTMqVICKS+ecBLySdm2MMEOrbD+eJ5cOMI++qV3emJr0Xv5XxufUccEZtnY650IixLxV
	FlcpjL+0il7DSyKeFt11C1Jw4TlywXkpevp4iKQD9Tq/IezvaIfGLTHAsZiG7qlqP8JI
	3q3oKBV4RylWbWo4AuftuWU1X7zkQpL/f4hlsefj9cZD0LXPWuTxkzHxxLCPxQ+i6Vnb
	7bMrPwU+g9ITCh4s6GzEqDUPk3OEt/6NCEzlkdHM+FCl9pZRt8+DwwdgwZyP+WwJ6Qcn
	RWmA==
X-Gm-Message-State: AJcUukeZg6SoRl0pMJGgK4Rsy6bc/k0wZ3an+8/bbqBWwIDzvtnPA16r
	/l7KXpCpNzXdhU1ml7p+ZGlAqM8vPio=
X-Google-Smtp-Source: ALg8bN4DdZYFilpNR6FIOFYiSeQfPfSToBgT/rNL69JXPF7yuPgCnyD2RrWySp/kEMXBpCH2+OQN7w==
X-Received: by 2002:a9d:67ce:: with SMTP id c14mr29046232otn.341.1546445299942;
	Wed, 02 Jan 2019 08:08:19 -0800 (PST)
Received: from blackbox.Home ([200.68.140.47])
	by smtp.gmail.com with ESMTPSA id
	e6sm25275454otp.68.2019.01.02.08.08.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 08:08:19 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 10:08:13 -0600
Message-Id: <20190102160813.25934-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCHv3] meta/classes/testimage.bbclass: Only validate IMAGE_FSTYPES when is QEMU
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
X-List-Received-Date: Wed, 02 Jan 2019 16:08:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When use simpleremote target the flash/boot process is executed
manually, the IMAGE_FSTYPES validation is only needed when execute
testimage against qemu.

The supported_fstypes comes from oeqa.core.target.qemu module.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/testimage.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e8fa4a3b32..3c2209af91 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -201,12 +201,13 @@ def testimage_main(d):
     machine = d.getVar("MACHINE")
 
     # Get rootfs
-    fstypes = [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')
-                  if fs in supported_fstypes]
-    if not fstypes:
-        bb.fatal('Unsupported image type built. Add a comptible image to '
-                 'IMAGE_FSTYPES. Supported types: %s' %
-                 ', '.join(supported_fstypes))
+    fstypes = d.getVar('IMAGE_FSTYPES').split()
+    if d.getVar("TEST_TARGET") == "qemu":
+        fstypes = [fs for fs in fstypes if fs in supported_fstypes]
+        if not fstypes:
+            bb.fatal('Unsupported image type built. Add a comptible image to '
+                     'IMAGE_FSTYPES. Supported types: %s' %
+                     ', '.join(supported_fstypes))
     rootfs = '%s.%s' % (image_name, fstypes[0])
 
     # Get tmpdir (not really used, just for compatibility)
-- 
2.19.2


