Return-Path: <anibal.limon@linaro.org>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id CF7386079E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 23:21:50 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id y20-v6so23034755eds.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lY8JZIgG090puD4Hr4J8giIJ3yCE3c678jX2ifelBcc=;
	b=eFL+S2ikBMSSx0RSRdAh14Ltwsy/em+FGVW7ZTA9xyMtAEIuOwimPtnecV/TCZFKax
	Ff3u7B1YRghsDnwzOvVL+OsUzQdqX4W6oPeiviYF5sNUf4zxQst7uu1ngWYSPw7ctIEX
	VqyXYg42Okh8kYxaRWYrEF8vfZeIq6gdhnK+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lY8JZIgG090puD4Hr4J8giIJ3yCE3c678jX2ifelBcc=;
	b=R71oi4h+vCsA57VMouH5eykBbqzZ9xEBLbXskeWZ2VniHR1GBOHen48xvjHZ0fHt2L
	d+jTUmTIV9zuXtaptXYBDx3DmzHWgwFTsdSEEfouvMjgE5boD+6ZHHX1Q5H7HDsAtOq9
	s86B9LC3B7l8kIe4KTp9KqYNxIG7bqF2wvMoQrpqrAywMRysCxFGcRmhKlT3e20oZbIt
	5DYC2UHmuNOMJWsSlmVI1J5pmYABt7L2Kn8uZolXhqiadEPY+W8pFSiA1BJXidnX+mp1
	Jl2C0bMAIy50CVcufP2glFoGXvz9x/BNTLARYo5NxJcQ4fdZyONBqtzQqceDwyt1YXkE
	OXUQ==
X-Gm-Message-State: ABuFfojan2pJ/RSEEzskSz1RaflmRVnF6S3cZcMguampVtm/+1j5Yknt
	nOzXCgTWGtR86ySAmTFrub28+xVkFDs=
X-Google-Smtp-Source: ACcGV61R2pYfSboi+YiDTOrFZrISJiCawR57jIof14Beflz2xp/kNO0z8Kb2VrthIBUHdG2BMuz7Ww==
X-Received: by 2002:a50:8878:: with SMTP id
	c53-v6mr31787548edc.146.1539732111217; 
	Tue, 16 Oct 2018 16:21:51 -0700 (PDT)
Received: from blackbox.Home ([200.95.170.198])
	by smtp.gmail.com with ESMTPSA id
	w31-v6sm7596929edb.8.2018.10.16.16.21.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 16:21:50 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2018 18:21:43 -0500
Message-Id: <20181016232143.5016-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] meta/classes/testimage.bbclass: Only validate IMAGE_FSTYPES when is QEMU
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
X-List-Received-Date: Tue, 16 Oct 2018 23:21:51 -0000
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
index 2642a722e7..734cb7caae 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -194,12 +194,13 @@ def testimage_main(d):
     machine = d.getVar("MACHINE")
 
     # Get rootfs
-    fstypes = [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')
-                  if fs in supported_fstypes]
-    if not fstypes:
-        bb.fatal('Unsupported image type built. Add a comptible image to '
-                 'IMAGE_FSTYPES. Supported types: %s' %
-                 ', '.join(supported_fstypes))
+    fstypes = d.getVar('IMAGE_FSTYPES')
+    if d.getVar("TEST_TARGET") == "qemu":
+        fstypes = [fs for fs in fstypes if fs in supported_fstypes]
+        if not fstypes:
+            bb.fatal('Unsupported image type built. Add a comptible image to '
+                     'IMAGE_FSTYPES. Supported types: %s' %
+                     ', '.join(supported_fstypes))
     rootfs = '%s.%s' % (image_name, fstypes[0])
 
     # Get tmpdir (not really used, just for compatibility)
-- 
2.11.0


