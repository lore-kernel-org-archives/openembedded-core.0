Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517CDC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.13238.1685712904695153327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=OoqhZsqX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so2033679f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712903; x=1688304903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA+Mypp4vBTiQuWyXoFmJYzNn/bVcn4eLXRGUhSct7Q=;
        b=OoqhZsqXYTCjioqyiJ9TI71DORVQZKDDDIfZ4pYCQN81VrFx9psfCeH3DQmqo8jIBn
         ghEX571Np+G2NeU3xGtD/arm+s+ykB7hn3ebnNdSh70XvDPgQT7breBqTrUGwpcqtyvY
         ec6J2h/o+BB+YEsBvoIDtzlfqrf4KEnCOy21g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712903; x=1688304903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA+Mypp4vBTiQuWyXoFmJYzNn/bVcn4eLXRGUhSct7Q=;
        b=JyLXPKHvrMK4QI2xwV6UUCo+S4ScXDyyBoaavZnt8R8vpxec4H4TyFsZWvp4mBNE4y
         rmSmTmUIySE9W5KPVXvi4TxeXWs+h3+K+BcvN+bF9fBGmpAFtFmBnEcneFbQiO0DIlEj
         GrBSmFsSmjORF+dL9QqVeakMW6veKZC8GpPvNUps8CSl1MwVFcnjO0iHsOhQKLh3UR2e
         lvgvajeoY3SCn4QWCltdE8QC1jWo6VQ/zcztJxl6eD2uLwFTrseuoBF10tAHMmcJcU3D
         QHd6S2ta/oi0TgcSZp7azXMZAGfseOU8dcwp0Fw2tJKQ14Lj5SLVoAcJJq2fRXLl4tWY
         tg3Q==
X-Gm-Message-State: AC+VfDw4XJk0nZto30KGI8TDx5V/OTb50w7yRxFsOy4VvQA71m0CorOf
	bYUi94V52auEbLivv7tUjp+T46np93PsovgkFFI=
X-Google-Smtp-Source: ACHHUZ5In44HMLE/1EGx6XWzJ4+OrruLoxHgRFfV/+nR9sJm7rUjEJkiJdUpNGfzwPJlN+nguTAYgw==
X-Received: by 2002:a5d:6210:0:b0:30a:f17e:e02e with SMTP id y16-20020a5d6210000000b0030af17ee02emr19196wru.12.1685712903001;
        Fri, 02 Jun 2023 06:35:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.35.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:35:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] oeqa/selftest/sstatetests: Add easier debug option
Date: Fri,  2 Jun 2023 14:34:52 +0100
Message-Id: <20230602133453.229023-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182328

In order to debug these selftest failures you end up having to comment out
the file cleanup. Make this an option at the top of the file to make it
a bit easier, I've had to do this too many times now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index e978313c61f..febafdb2f7a 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -18,6 +18,9 @@ from oeqa.selftest.case import OESelftestTestCase
 import oe
 import bb.siggen
 
+# Set to True to preserve stamp files after test execution for debugging failures
+keep_temp_files = False
+
 class SStateBase(OESelftestTestCase):
 
     def setUpLocal(self):
@@ -35,6 +38,10 @@ class SStateBase(OESelftestTestCase):
         self.target_os = bb_vars['TARGET_OS']
         self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
 
+    def track_for_cleanup(self, path):
+        if not keep_temp_files:
+            super().track_for_cleanup(path)
+
     # Creates a special sstate configuration with the option to add sstate mirrors
     def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
         self.temp_sstate_location = temp_sstate_location
-- 
2.39.2


