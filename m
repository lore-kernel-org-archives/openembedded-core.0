Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26389C369D9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 01:28:39 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.2219.1746062912776663698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 18:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J9gqUsSA;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f4cd4c07c3so4605946d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 18:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746062911; x=1746667711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt7/O6ne+n63W/XNRotiW1OEFamd/GOVMWTpHEWmyBA=;
        b=J9gqUsSABw8WWK3n/jSltiha+vmErSoVU6E8ykeAmv/stuAHE6ZzGKxCmIM6dEz58M
         uP7tGloeVgYYNm45as7uhUGv0HFymtleaEZS6siRrqlEDZs5W9m72oVmglYr+H5XyAMi
         59/+7hcAqNfhRKB1PW2a1C8PKWCO/U2oIPnIX15NULpNbxoetYvs0x0Kt9X769xVBX2h
         zCtIxdwa/KZHjbjRpz108ehbRzyFgDo4sRFAND+b25RPg4WVSyc1QBiLNDbJpX1aPj8+
         iwdApJRFbiYVtFX+vc/Jw9hx8wm05oMIIirFN6ZmI63SE/ICBfgujaJw9Z4bBBpELERQ
         6X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746062911; x=1746667711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt7/O6ne+n63W/XNRotiW1OEFamd/GOVMWTpHEWmyBA=;
        b=ILhnlJzzrBWE8Hv+iRznMrFTjk50WfXNJYKlv7MEH+SdfsBWnfRQclSmSD3GEVOL5v
         4NG8i18h1++4uYEQEO28THL4TJOUe5B/pVapq3bbGWaIrFQQMg1bQE2d7O6SzYj7enxv
         brXIOE4kgMJ2YZH8FrHJ0xDWYgfNWm4WI/wdmAfijV+TGW95B4/fy8SKEr+BjeX0bwtI
         gN49BPsSz5fz925dTjqYa6CFY1Ppz3cmHuKqf/00u7gxWBoM78lRB6rMuC1EZoFQsL5h
         SlQMWm3wnNwhIijvx+04W2oHA4iU6aEVYTfE/zg/2ug4QCc6PoLT0c20U2LEMoTMy8mq
         6xLA==
X-Gm-Message-State: AOJu0YxR0c9AbK9Td3TADXXheY/eA0QnKY1ykoOJfMclPxkyFNyAw18U
	biq4Tw2auuVL5FNIQaEn2sTWuSOtgZOfAPVy2wY/r2BP1Lwk1x+vva9HPQ==
X-Gm-Gg: ASbGncu5MOGo/In5Lk/Y30Gu7ElDK3ORmDEf1ADQIxzbkX98PH38K+YmcdmtmXS0myI
	+mWfgZZQTJN4C6vfshDVISQLrzwvnHei11xfxBGWYc0LX1CbXyzKaj8jnEu7cvpZc6fGVwRCvhr
	oMlbmjkjcghG7ArYNNQGh/AAkPfMoRwZ8V6MpL0uwp66GO/JxkgDZ/f6JcF3/BoXzIB+NSdBFF2
	Zmf/XJhZN72QnkzATGAOVZ1bn8Chzfw+nScpZzcs/jajKCbUtizX9Quy1ZxmLn4336joQynnS3T
	gUYFfqRWG+sS18vc0Ai/qUCn8q/K/CTWHtgrjNxqxG4MBptDttqfRvJ/0JFRpHyztOri2IUIxBm
	zx0k0lANacRfbVT8RNDk=
X-Google-Smtp-Source: AGHT+IFZpmCT0tPGfPMbtXC9/rER3oakB+OEQKq3yJwX9LIzi2zCAM1wuySENJGjELDb2FO4+ZiqxA==
X-Received: by 2002:a05:6214:1c48:b0:6e6:6aa5:2326 with SMTP id 6a1803df08f44-6f4fcef61f9mr78247686d6.24.1746062908191;
        Wed, 30 Apr 2025 18:28:28 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a07esm15474276d6.57.2025.04.30.18.28.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 18:28:27 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oe-selftest.wic: add native sysroot handling
Date: Wed, 30 Apr 2025 21:28:25 -0400
Message-ID: <20250501012825.36492-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 01:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215758

The wic test_exclude_path_with_extra_space test succeeds on non-debian AB
workers. Add native sysroot handling so parted from the wic-tools can be
found on debian-based AB workers.

Fixes [YOCTO #15838]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- It was previously suggested that the fix might be to copy the PATH
  handling with a try...finally block that other tests perform; that did
  not work on the debian workers either. The proper fix is this one
  which is to explicitly pass the native sysroot path to wic explicitly.
  In fact the wic help message explaining the purpose of the -n argument
  explicitly mentions that it is for passing "the path to the native
  sysroot containing the tools(parted and mtools) to use".
- This was tested by moving my system /usr/sbin/parted out of the path
  so it could not be invoked by this test. A test with parted out of the
  way was done to demonstrate it would fail, then (with parted still out
  of the way) this change was tested to demonstrate it working.
---
 meta/lib/oeqa/selftest/cases/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d98af8713a19..267c7105c5ec 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -564,8 +564,9 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
         bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'], 'core-image-minimal')
         deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
         machine = bb_vars['MACHINE']
+        nativesysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
         wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
-        size_of_root_partition = int(runCmd("wic ls %s" % wicout).output.split('\n')[2].split()[3])
+        size_of_root_partition = int(runCmd("wic ls %s --native-sysroot %s" % (wicout, nativesysroot)).output.split('\n')[2].split()[3])
         self.assertGreater(size_of_root_partition, 500000000)
 
     def test_include_path(self):
-- 
2.44.0.501.g19981daefd7c


