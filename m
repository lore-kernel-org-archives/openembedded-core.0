Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26926EF585D
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:38:40 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150140.1772411919388667618
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBVc/dH1;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899c97c5afeso27811236d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772411918; x=1773016718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9cmgWp0dXccz277AGUUDUEJdF3gZ8ONdZQAfxaDBWI=;
        b=MBVc/dH1kl/MUYIMt/CeXBAMUWpE1vTe0rUxg0opPgQkpDP+tTnpqqdWOcdxWSBzTk
         VMLZI/+WmtkqlSH4mmx7U/wA1+7TPPnztRm158QEPtdZ0lQnHRz7JwJ1vXNSj8HJhoIm
         7qXqxeBA7IHirxtCsD+era/0RpcMMlYwjZsIgPHcNG3QMuKuzIfiVd4ZeSbUkdXJOHNL
         x3cuvT0j3nOlpu09GmfsUffRYjID+lZhfS9L5p9YorCnj3fXR2m8F+JuO7Qv4pCardvI
         kGxTFYdbPcFcrWSz8BfHMThN/rGqm9QzjZzJqGfgRVihUwDniDYrEXmUyzrQOuPvy/30
         nDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411918; x=1773016718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y9cmgWp0dXccz277AGUUDUEJdF3gZ8ONdZQAfxaDBWI=;
        b=VyvlEV/6eAeE+Wkpln4UsL+LCQ8381OO1phMTmOEWLBFkIgQRJwfjL9dATkztsrM9m
         fdVOP4CMqCNNx2v98O6AagbUmdOjrOQt9KI9BjwWFNd+NTtFViAs/oMGwMpDQFUKbIMQ
         vzaMzQGC1zvdsoqhsNWc4xNodkH7VeK0bJ6TyadzG2Ceok4qsqYjI9b8ayOlf5YAXqbB
         AHOrdfmGyvbRf6+pPQcYlGpRBZM59O7nLSxTeS4Pkfi0PbaB5qwfIpJ5D9VrjK3uy+6D
         FjIwDafaXd7t6qmbU7dYy0yo38LlR9uBi6/kEk3sVuI4tc54SBiSuCYMZvI2USMAj9Kw
         VnCg==
X-Gm-Message-State: AOJu0Yxfc8FNTuQzkK2P3Rrc9ovdKAElSnR2gQdemQsI8zw09IUdPPSX
	VJrGflPePm+DQQN1Vn6Es0Sp6dVi7jqSXzb5IAKeDe4e+Wlcp0b5KlQNWQtbZHgv
X-Gm-Gg: ATEYQzwV9qgV6YPs1mcij8J0W8KOTZ/71F7Qlqp9nySfJYMPXTb8jVw4YoEws9ViY3O
	B2zBbvaHJmMNzbLONCHcnnEyxhvA7QHxWchvLhlUxdZOnqpe0QMwXXP4mzMwbBfM+DYp30SOqEj
	iU8/Z2E0gu0ibSDlBQRhfnH29qGW1n2Z6jk8jBYNsKR6+uftcJs0XfUKQLGaGWzw3s4gA/SU7sV
	S030Mg82y634h3YwpPCRXGg7b5vHjAVXz9g9oBdGo/HB6zKE0up1zgkX/D2MA6ZUmw4vVReU3M6
	RlkHcsvMT+T8vwty8FiEJ//V4bOhHQdUr34DgItTKeprPIBS1to9J+hVF2rY+CE8MQrxqL6T8xc
	uyvIEzA/tFHeXK6pr2VEhi4gelWcSeQ0DMexskZwWSld29IwaqZ433Pfa6MvyuQ4Ms6TsdCH8Go
	vovTawEAFYnzJK1uF+s9wsFFQQw7A+5MmIa1X9nYYy8iUaR7gQClA+pxnVt6qM15sK7A==
X-Received: by 2002:a05:622a:1484:b0:501:47d3:2176 with SMTP id d75a77b69052e-5075289de0cmr128694101cf.26.1772411917550;
        Sun, 01 Mar 2026 16:38:37 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm33710356d6.12.2026.03.01.16.38.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:38:36 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 5/9] oe-selftest/cases/wic.py: update WicTestCase
Date: Sun,  1 Mar 2026 19:38:22 -0500
Message-ID: <20260302003826.3995222-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260302003826.3995222-1-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232150

The wic oe-selftest defines its own class, WicTestCase, for handling
setup, teardown, and other pieces needed to run the individual wic
oe-selftests. Now that wic is a tool external to oe-core, it, and the
tools on which it depends, need to be built natively before the test
can be run, need to be made available to the tests, and need to remain
available while the test is running.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v7:
- none

changes in v6:
- none

changes in v5:
- rebase with master
- split back out into smaller patches

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 7ad61fa700f7..e9c28baf51eb 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -57,12 +57,22 @@ class WicTestCase(OESelftestTestCase):
 
     image_is_ready = False
     wicenv_cache = {}
+    oldpath = ""
+    envfile = ""
 
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.resultdir = os.path.join(self.builddir, "wic-tmp")
         super(WicTestCase, self).setUpLocal()
 
+        config = 'DEPENDS:pn-core-image-minimal += " %s"' % get_bb_var("DEPENDS", "wic-tools")
+        self.append_config(config)
+        bitbake('wic-tools core-image-minimal core-image-minimal-mtdutils')
+        WicTestCase.oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools") + ":" + os.environ['PATH']
+        image = 'core-image-minimal'
+        WicTestCase.envfile = os.path.join(self._get_image_env_path(image), image) + '.env'
+
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
@@ -78,6 +88,7 @@ class WicTestCase(OESelftestTestCase):
         """Remove resultdir as it may contain images."""
         rmtree(self.resultdir, ignore_errors=True)
         super(WicTestCase, self).tearDownLocal()
+        os.environ['PATH'] = WicTestCase.oldpath
 
     def _get_image_env_path(self, image):
         """Generate and obtain the path to <image>.env"""
-- 
2.51.0


