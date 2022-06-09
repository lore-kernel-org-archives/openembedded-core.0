Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92014C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:42:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.8569.1654767732535555269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 02:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Thm5Y/en;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id x17so31606698wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 02:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sGYAXAGqAls8lQekdG/uxfX5p6qN1YfWgzjL0G1u36k=;
        b=Thm5Y/envV2xHJDgSeFWMeDqMdHBp6JmpjDmQgtX6FccVEjGt0Y/dwp+YcD1zO3Adg
         x4PhPbbDhOZtSL0DJgAyfkJ8citOajV/Fng6iPmGlEOCPo6lFJAuy8PA6Y7a5HHiw9oN
         bqcgwsEMOcc0MH1vIzFjb9GAOGso6oU7KbTdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sGYAXAGqAls8lQekdG/uxfX5p6qN1YfWgzjL0G1u36k=;
        b=7W1XHdwXdzC0dAxyz4KtQ1aY6PqZJ+nqA+6fWUj9La3OFOk+hcz1+bhct97P1QbBIg
         0W5IQfZ6LOxb0uKSmWJ0QbPds1HJxAlZqfCOk0QFNdvfAjS8lIyiabF8t+rSi/Z99M8I
         GeiMa2fko897asKvfhHHz6zf7SbYdPABBj2p3xfD3BXpT5QV6iVP9lgo7KB6PhvCf8XE
         +YmfXNqXELY0M11JpVbRUXNdq36c3WHu2xcdnQXYaS2Nu4EXxftdEJfcT6dMxH+wYVp4
         WkqZQTXev+HETa7M/DkFOX2c/RrA4KVyClCTuI9bdLilIMM/a+6kIOJjXe6R/ofwcyRO
         af0g==
X-Gm-Message-State: AOAM5324724mA9Il4nymedq+uSZyZuMC3Qdx9CcxrquZgmKtANpwUL1I
	YAS8h6IrwExoL8OQ1om1S77NYrpJPL1Ljw==
X-Google-Smtp-Source: 
 ABdhPJwkXt4j9D7iOb5ZyvV7aNsMmH36Ny4tHWtgHohEuXvUlqk1gaQ3vY/Ov1r9L3r3ILFq2euomA==
X-Received: by 2002:a5d:64c2:0:b0:20f:cc15:3563 with SMTP id
 f2-20020a5d64c2000000b0020fcc153563mr37259003wri.388.1654767730611;
        Thu, 09 Jun 2022 02:42:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c2cce00b0039751bb8c62sm33918031wmc.24.2022.06.09.02.42.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 02:42:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/multiconfig: Test that multiconfigs in separate
 layers works
Date: Thu,  9 Jun 2022 10:42:09 +0100
Message-Id: <20220609094209.41221-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 09:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166767

We should test that mutliconfigs from a layer work, not just build/conf.
This adds such a test.

[YOCTO #13566]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/multiconfig/muslmc.conf  |  2 ++
 meta/lib/oeqa/selftest/cases/multiconfig.py | 13 +++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-selftest/conf/multiconfig/muslmc.conf

diff --git a/meta-selftest/conf/multiconfig/muslmc.conf b/meta-selftest/conf/multiconfig/muslmc.conf
new file mode 100644
index 00000000000..043cd1ccc3b
--- /dev/null
+++ b/meta-selftest/conf/multiconfig/muslmc.conf
@@ -0,0 +1,2 @@
+TCLIBC = "musl"
+TMPDIR = "${TOPDIR}/tmp-mc-musl"
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
index baae9b456f5..83cbd1345da 100644
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -70,3 +70,16 @@ TMPDIR = "${TOPDIR}/tmp-mc-tiny"
 
         result = bitbake('mc:test:multiconfig-test-parse -c showvar')
         self.assertIn('MCTESTVAR=test2', result.output.splitlines())
+
+    def test_multiconfig_inlayer(self):
+        """
+        Test that a multiconfig from meta-selftest works.
+        """
+
+        config = """
+BBMULTICONFIG = "muslmc"
+"""
+        self.write_config(config)
+
+        # Build a core-image-minimal, only dry run needed to check config is present
+        bitbake('mc:muslmc:bash -n')
-- 
2.34.1


