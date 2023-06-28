Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1587AEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 07:10:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.10671.1687936208546782661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 00:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=NQejJiId;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fb10fd9ae9so28624955e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1687936206; x=1690528206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuwF+hGT5R4dvZ12owqJlwcWsiV432sS0cI63e5xb/M=;
        b=NQejJiIdOAtoPU0tSZ420JwG+JG5nPO3v1zH5XioLXaEtld0rjdmIUSQtbXIO0kPKB
         BFDG2ZjnUw7HLdt1s/DN0+nUANRLprk71b23WAZEb76vnaL8GVATwYUY8h9Cm352U2Y0
         Sall0keyNho68TALFwW4oNz8dJ+DXtl9pJyAQfMuAokx3ESXf35VzGCBPuY96YgJ2EXc
         IIVmEN0nQB5ctzkgsd67D/rMBZn2mng5z8B86LVBahBFr/5acvUp8VL5JeiCGddPhVbH
         FTd0v4kCcYxvjK+hoM5aim40I8zQhGoh79qG/KmhOQWaEPWhiXET5LjUUssw1MzumJXL
         i2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687936206; x=1690528206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuwF+hGT5R4dvZ12owqJlwcWsiV432sS0cI63e5xb/M=;
        b=Xf60P9FYB3IFDE+oWEf/fKDMYcoUFe3xyP9MXIBx4peBmQRn9sbEPYBPGiIa0MhtX4
         tYuNbrQVOx/b3iLvO66loZvZN33Naw9lBE8BtEYVrOa6qP02hz6kSe4dS/wO5BonxOHo
         eDuHAKbrY2/Tm4JhjkhhHm+spsa2jxwhxtcgNnasep6soMs3enVzZ1cAfLiEsxUYaSoB
         cFr19yO469pAxa8EgxeSKkV5RE9kZ/qzz+3/LvyIbUoRmOI7lTjHxg0ufcfq8iVjZUNJ
         SeNiHF+1FGZlRKgeSJUyPtlTnPz6v96TEwVzP1OyOprAPA4yQLiz+zgdPPVmLjkOvSZV
         hc1A==
X-Gm-Message-State: AC+VfDyXO4L0fnkZEKXVkn5ZYVEzx/wOJlzdvN0zoS0yoNLIzFtYnAQI
	pmnfXXhMuazCrO88mAb2HkyxtSFg+bw1FxexL6w=
X-Google-Smtp-Source: ACHHUZ58ZN/LCHPpPZydIcnDThZbFXYgFLUBNRZMXKpvwLUNGK/BiANGbEGrBzuZbu0+ZqSAv/6SnA==
X-Received: by 2002:a7b:cc0c:0:b0:3f8:fb7c:6793 with SMTP id f12-20020a7bcc0c000000b003f8fb7c6793mr22212901wmh.24.1687936206600;
        Wed, 28 Jun 2023 00:10:06 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([2a04:cec0:1003:a5b7:e391:4c22:e22b:1c45])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c00c800b003f70a7b4537sm15799440wmm.36.2023.06.28.00.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 00:10:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest/devtool: add unit test for "devtool add -b"
Date: Wed, 28 Jun 2023 09:09:39 +0200
Message-Id: <20230628070939.1298739-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183543

From: Fawzi KHABER <fawzi.khaber@smile.fr>

Fix [Yocto #15085]

Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 4c8e375d00..c5ed8f5720 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -366,6 +366,29 @@ class DevtoolAddTests(DevtoolBase):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
+    def test_devtool_add_binary(self):
+        # Test "devtool add -b" with an arbitrary binary package from Yocto mirrors
+        pn = 'pvr-bin-cdv-devel'
+        pv = '1.0.3-1.1'
+        url = 'http://downloads.yoctoproject.org/mirror/sources/pvr-bin-cdv-devel-1.0.3-1.1.i586.rpm'
+
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        # Test devtool add -b
+        result = runCmd('devtool add  -b %s %s' % (pn, url))
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
+
+        # Test devtool build
+        result = runCmd('devtool build %s' % pn)
+        bb_vars = get_bb_vars(['D', 'bindir'], pn)
+        installdir = bb_vars['D']
+        self.assertTrue(installdir, 'Could not query installdir variable')
+
+        # Check that a known file from the binary package has indeed been installed
+        self.assertTrue(os.path.isfile(os.path.join(installdir, 'usr', 'include', 'EGL', 'egl.h')), 'egl.h not found in D')
+
     def test_devtool_add_git_local(self):
         # We need dbus built so that DEPENDS recognition works
         bitbake('dbus')
-- 
2.30.2


