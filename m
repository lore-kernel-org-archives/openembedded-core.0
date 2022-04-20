Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA41C55187
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.8029.1650463721103708197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=F/x0guge;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id p8so2020052pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=om6JYXtNYlHEGyop9cdUUarI52pL8APQ9WC4zbTWGN0=;
        b=F/x0gugeMkLhMYUerN2RI5h1C3xLKJzARR0bcu7cmh43QI8GDtvmiVYAaIzPLvUwnr
         fzIHzLTmlp7joBizC0Ex5rd+f6o3AlYvLpEAE1EpumUP9YE0HnDrFdc4dupo59bGY8m7
         ZOeaoEOQxUIMhBG2HOP78FxEFx8+t+NxXfHqsP6fxW6ihTQE6rBxt4EhQC4hjFLq58+e
         nR+WJ8muO63JKzkBvRMSzt27jZc9kN7gCRW0Kg7FwFETQn43FeP6uluerwGNq3UxdGS/
         KVW+sihiQoVPYtW/A10UYmhoZkbR2F+0Nq36/BGXAMJilDhiwutjoNTuNhACt08BXvKL
         tmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=om6JYXtNYlHEGyop9cdUUarI52pL8APQ9WC4zbTWGN0=;
        b=GXqugKL3OUb1YOxhQ5xZaCFUWwAYhMeg5ZaLa4ihrInqVtBHgr2t+jwb0yYcoWHzAJ
         Rx4kRamCW2hTDysga+F0QpI0SX2DB0+fU3BtvbUTHgkiX/8BwMPUdRYCpIEuO9ce0t+0
         x7XIE56QJnPwfA2aAt+5qL+bQatnD2J4Pt5Km37uCuckSP6sii0E96irYbvcpa4MQEvj
         GtpUfu4+38Wij5kUgPxxFB+hrAGSi4aTO00Xh4N1iYbMvSmmGlJxL94l7AbMYef0NCUG
         HJfA9J5/HJY5UIamcWFTuMBkoi2aVvwYChPd4/960uSX1tE7EtWBYgtr33nqkIOsGjFp
         o4Ow==
X-Gm-Message-State: AOAM530y7h2fO3W6rUFv1m3x9EQwF0HJVn1RW+guMmnywD70q2ZlRPvi
	j4ipYIkNOnuUTytu4OWa9WuzTmG/tqIxKERHf4U=
X-Google-Smtp-Source: 
 ABdhPJxGUj9dwrhMwy7/op1/j8bd8R5MhYZSmAVF57j62CL1N+npxUSI3lO1pGBqrO9ZNFIr4qvSYg==
X-Received: by 2002:a65:5286:0:b0:398:dad:c3d8 with SMTP id
 y6-20020a655286000000b003980dadc3d8mr19646113pgp.228.1650463720145;
        Wed, 20 Apr 2022 07:08:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/27] selftest/lic_checksum: Add test for
 filename containing space
Date: Wed, 20 Apr 2022 04:07:51 -1000
Message-Id: 
 <46349013561e0e4b376a845c1cce029a74e613d9.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164671

From: Paulo Neves <ptsneves@gmail.com>

A fix is being added to bitbake to correctly handle spaces inside
checksum filenames. Add a test to oe-selftest to ensure this is
tested and doesn't regress in future.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 324109f034f069ee3e91a1a705b3449911a448de)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/lic_checksum.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index f8681ed755..8f1226e6a5 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -4,12 +4,30 @@
 
 import os
 import tempfile
+import urllib
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
 class LicenseTests(OESelftestTestCase):
 
+    def test_checksum_with_space(self):
+        bitbake_cmd = '-c populate_lic emptytest'
+
+        lic_file, lic_path = tempfile.mkstemp(" -afterspace")
+        os.close(lic_file)
+        #self.track_for_cleanup(lic_path)
+
+        self.write_config("INHERIT:remove = \"report-error\"")
+
+        self.write_recipeinc('emptytest', """
+INHIBIT_DEFAULT_DEPS = "1"
+LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
+SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
+""" % (urllib.parse.quote(lic_path), urllib.parse.quote(lic_path)))
+        result = bitbake(bitbake_cmd)
+
+
     # Verify that changing a license file that has an absolute path causes
     # the license qa to fail due to a mismatched md5sum.
     def test_nonmatching_checksum(self):
-- 
2.25.1


