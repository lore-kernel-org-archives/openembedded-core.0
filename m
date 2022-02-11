Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3065C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:13:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.8409.1644592393761892261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 07:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y6AagF+5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7443198wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 07:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q3BU5o21MCbsuDIBB0WdMP/s3JDq/9aU9NwFZ8EPTkw=;
        b=Y6AagF+5SOUFnR0VVQD+a8cYnJdqe+Rm48GTcplc5F1AtiGK8htmt8ud9kG3C/6cje
         +VHCTeunyzbKGxMz+LH5On4J6HVRFvZNTyhlzGp8/9iOFBsREILvstY+ZNN39o2bAAfu
         yPvxUjiLx9VRVkt0zF2qrqf+tSNcBlF634kw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q3BU5o21MCbsuDIBB0WdMP/s3JDq/9aU9NwFZ8EPTkw=;
        b=aXsdJ4yqQfcXFet0vn+50zi3O3mznlZiXyR9xQ8aK5FjOYY1JFKxH1t4wc4HIu7Nwa
         ydsa/zpNRbnA3zW/Rp/ctAIpY5h6O9ygwMCXc/y1MiOJ/vj6kAIxWeTedyWxmbCSah+E
         YWj8my0Gz+JZXDwLF0fFLTKpJxZZgCCgeS8eyIPrsV34MI0W+5MKzJslghO73ICNdfcs
         i4ryoeLX/3x/Vu/dGD1/dgcLriIO6wyhFWMDEI2ek0LALHy0TmxwMFDpK3pXi7qQkmVA
         N+acBenJIduLSrPVrLTuBLzV3ojcvCxgAvuHVbaxHUwxEq6xnRmaK+oCaiE5jM32K/z/
         vt/A==
X-Gm-Message-State: AOAM533uziA0Zj4yUqLuUDSiZ3Nv9dWpniCQJ6zmhpBT70ajuxBkAJm/
	YgVt9QyPtmArHdCaBrfCJVjbZQne+W1nkUHl
X-Google-Smtp-Source: 
 ABdhPJyiRD8uj+KA2a5H6dJgKiFBF5vyWBY/5uEVfT5yDE8rWlf5hJSQe53vjCLiKwPOxxdaVtA2tg==
X-Received: by 2002:a05:600c:1d92:: with SMTP id
 p18mr634674wms.93.1644592391555;
        Fri, 11 Feb 2022 07:13:11 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e5fe:2e7c:731b:5924])
        by smtp.gmail.com with ESMTPSA id
 x5sm13536693wrv.63.2022.02.11.07.13.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:13:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] selftest/bbtests: Add tests for git floating tag
 resolution
Date: Fri, 11 Feb 2022 15:13:09 +0000
Message-Id: <20220211151309.2724289-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 15:13:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161655

This test ensures that where a floating tag is used for a git url, there
aren't a number of different bugs such as inconsistent source revisions
for the tag within a given build and that the recipe is reparsed at each
run to ensure the tag is checked.

A test is also added to ensure that the build fails if SRCPV (get_srcrev())
isn't used yet there is a floating tag.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2 - fix failures in universe builds
   - improve test documentation
   - ensure floating revs not parsed by default

 .../gitunpackoffline/gitunpackoffline-fail.bb | 16 +++++++++++++
 .../gitunpackoffline/gitunpackoffline.bb      |  5 ++++
 meta/lib/oeqa/selftest/cases/bbtests.py       | 24 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
 create mode 100644 meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb

diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
new file mode 100644
index 00000000000..602e895199b
--- /dev/null
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Test recipe for fetching git submodules"
+HOMEPAGE = "https://git.yoctoproject.org/git/matchbox-panel-2"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+TAGVALUE = "2.10"
+
+# Deliberately have a tag which has to be resolved but ensure do_unpack doesn't access the network again.
+SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https"
+SRC_URI:append:gitunpack-enable-recipe = ";tag=${TAGVALUE}"
+SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
+SRCREV:gitunpack-enable-recipe = ""
+
+S = "${WORKDIR}/git"
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
new file mode 100644
index 00000000000..597c89b1993
--- /dev/null
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
@@ -0,0 +1,5 @@
+require gitunpackoffline-fail.bb
+
+TAGVALUE = "2.11"
+
+PV = "0.0+git${SRCPV}"
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 246cb032bfb..695cabef8ac 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -312,3 +312,27 @@ INHERIT:remove = \"report-error\"
         self.assertFalse(fatal, "Failed to patch using PATCHTOOL=\"git\"")
         self.delete_recipeinc(test_recipe)
         bitbake('-cclean man-db')
+
+    def test_git_unpack_nonetwork(self):
+        """
+        Test that a recipe with a floating tag that needs to be resolved upstream doesn't
+        access the network in a patch task run in a separate builld invocation
+        """
+
+        # Enable the recipe to float using a distro override
+        self.write_config("DISTROOVERRIDES .= \":gitunpack-enable-recipe\"")
+
+        bitbake('gitunpackoffline -c fetch')
+        bitbake('gitunpackoffline -c patch')
+
+    def test_git_unpack_nonetwork_fail(self):
+        """
+        Test that a recipe with a floating tag which doesn't call get_srcrev() in the fetcher
+        raises an error when the fetcher is called.
+        """
+
+        # Enable the recipe to float using a distro override
+        self.write_config("DISTROOVERRIDES .= \":gitunpack-enable-recipe\"")
+
+        result = bitbake('gitunpackoffline-fail -c fetch', ignore_status=True)
+        self.assertTrue("Recipe uses a floating tag/branch without a fixed SRCREV" in result.output, msg = "Recipe without PV set to SRCPV should have failed: %s" % result.output)
-- 
2.32.0


