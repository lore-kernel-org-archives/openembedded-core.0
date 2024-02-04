Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6048AC4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 19:03:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.45246.1707073389338783698
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 11:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YMrTWb3S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso30764055e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 11:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707073387; x=1707678187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQWbAul4uHSURwbAgZ282B2wA99bcQoOey3gPMXPOsI=;
        b=YMrTWb3SejPHi3vURnPWC/+U4USJzDSdrwvnC5Oc+0vHthiGwOZmCaaI5ueQEAvPCY
         Y+2QidG7ZXHlpN0362p4215IsN26HmQAX60G9xcaZmk4iVLKqqukh8srmI5QFOakThu9
         qdZmDweDd8BVnBytAExo73gW1kCBlkbCHZbXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707073387; x=1707678187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQWbAul4uHSURwbAgZ282B2wA99bcQoOey3gPMXPOsI=;
        b=RQvI6i5TXH4Z6TsmBcLw2U8/CBqEa7Ql1KYRGaZ0dKtLg4dJQ1hsNgR/H5GCeu8wA2
         JrdcB0E2DiNYvVDHd84gLOgZWqL4hC+XHE539SvPOke8x1EbK8lUPYHGQaqik6dytMhv
         CBZqyHINTWRz1gQ9nvOFTVYBODBnuw8Mmt4NXXGYp59zxRygwiWFxTMVpqv31veTxc7t
         uYLIVIMUJ1GHcK/oAHin0E/TQym+i93fWem46c+n896A04gN+K5CKzgHEYwKJvoHWzrQ
         sr3rTbxLZZnEHyMKDJBxjxws+pQTD2ZHPV/SaYDGZiPPwHfUzxgyV9noYPmpDdZ+NMiV
         jEdQ==
X-Gm-Message-State: AOJu0YzB8nMOeYzNQ9muXArvet/u8td3o4TuY4sOkrxBHDocFF8DeIsJ
	yzN0NTdtVCnrcXjB2SOIB4F3iivOeapIyTivfbLMh1trwlm+q/62M4HizvFIQbdgfrW58CB6pbW
	1
X-Google-Smtp-Source: AGHT+IFiYDemURUROiXfsNt/kkpfmO6xZ7jNilfC4GfRENWmIh+JDPBY+oUxuTxADkqAAjBaQkg5lw==
X-Received: by 2002:a05:600c:1395:b0:40e:55ca:5a48 with SMTP id u21-20020a05600c139500b0040e55ca5a48mr3250527wmf.16.1707073387557;
        Sun, 04 Feb 2024 11:03:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8ea0:9a0d:a119:2213])
        by smtp.gmail.com with ESMTPSA id x5-20020adfdd85000000b0033afe6968bfsm6446025wrl.64.2024.02.04.11.03.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 11:03:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] bbtests: Tweak to use no-gplv3 inc file
Date: Sun,  4 Feb 2024 19:03:05 +0000
Message-Id: <20240204190305.2332461-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240204190305.2332461-1-richard.purdie@linuxfoundation.org>
References: <20240204190305.2332461-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 19:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194907

With changes to gcc-runtime around improving debugging, python modules
are needed but this pulls in bash which breaks the tests.

Add an exclusion to the no-gplv3 include file to handle this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/no-gplv3.inc   | 4 ++++
 meta/lib/oeqa/selftest/cases/bbtests.py | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
index 48cff29ad4a..bb2e836f982 100644
--- a/meta/conf/distro/include/no-gplv3.inc
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -22,3 +22,7 @@ CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston += "rpm"
 
 # matchbox-terminal depends on vte, which is gpl3
 CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
+
+# Some python-tests use bash outside of ptest
+RDEPENDS:${PN}-tests:remove:class-target:pn-python3 = "${MLPREFIX}bash"
+INSANE_SKIP:${PN}-tests:pn-python3 = "file-rdeps"
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 0da59e0f581..98e9f816610 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -232,7 +232,9 @@ INHERIT:remove = \"report-error\"
         self.assertLess(errorpos,continuepos, msg = "bitbake didn't pass do_fail_task. bitbake output: %s" % result.output)
 
     def test_non_gplv3(self):
-        self.write_config('INCOMPATIBLE_LICENSE = "GPL-3.0-or-later"')
+        self.write_config('''INCOMPATIBLE_LICENSE = "GPL-3.0-or-later"
+require conf/distro/include/no-gplv3.inc
+''')
         result = bitbake('selftest-ed', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         lic_dir = get_bb_var('LICENSE_DIRECTORY')
-- 
2.40.1


