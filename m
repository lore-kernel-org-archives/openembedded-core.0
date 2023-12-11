Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C2FC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 13:41:03 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.8384.1702302054772179306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 05:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pdQNorYS;
 spf=pass (domain: baylibre.com, ip: 209.85.218.41, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a1ceae92ab6so599470566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 05:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702302053; x=1702906853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fmBjgbRgcEjXFwGoz8zCFCn4vHEthZXswY8tb2WZTA=;
        b=pdQNorYSSw21i6R/RPR/5Lmo41MSRcTzmV5T6G3MMf4GQeRh5ntVfWqXjJhYJMCWJP
         RKcffbry4C+O9tgHf7t2Eu7qUrp0t7YcOIVfZsli8RCc3X0fwosOFFfuC3eopsIf3dD9
         sMd5B7e3zyJX3zIw3mdBD9Hi+wn14qaADV7AslWwUvcF4Clh9SL+Hzj6isg0V5wGPz+r
         ce357hwcx+i9+jfnPY5Bb8cLQmIdBEToTc2uvm7bFcbaESoDBMN1Upm6bLeRLr8aS5iN
         RKJaCfbjBIg4liy/iPzNsIC9g6hX4iqLz9mHIHrsK3S5ZqFhhqo3koWLnTf2g0kJGO2l
         LeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702302053; x=1702906853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fmBjgbRgcEjXFwGoz8zCFCn4vHEthZXswY8tb2WZTA=;
        b=lRtYq25C1gTxFnoK8p7DWw1IQn18WiMz60hTKnhixXYwL0egIvrYwl/c7u5nqZC9lr
         rEFfVXmO+DJetF4FTVWp6M2DPibGrX8F9W2FQpvEqTv9nJfqzhnUAB/qJjDO3a4VAiqf
         fojaRZd68eVs6qbpy3ZsN9//VRRfkr1EXIGDbPBbf391fw86v1rOoAsvP4G2Zp77ovNS
         kBfalqOuVdycZopIAPkyL874ankKGiPqk0mAb8U0A4XNK9+QzbXtqruH/+k3K4TJLSRk
         9TC7383RA74Nn016RqWp4FdOY9/WEWh3RlvqKPvAZwSrXvQsMjRmPZ0LWko4D+zN5PSb
         xfkg==
X-Gm-Message-State: AOJu0YxMWCpaXekuW5GsytUeREE+xdcEZZ2EI0kS0so+NmQeb+GEoxQ5
	lUQ5p2rkHQ7KZhMFv+OQ6uCcbJNIAPUeieZNxifMCA==
X-Google-Smtp-Source: AGHT+IEetmESdW+UU4n820KSfho3hRlsGQ4ko8vJsogs6Ty48OuZuVQuoT4kR6HzWVoLFhYHMHCCTg==
X-Received: by 2002:a17:907:6d11:b0:9e0:2319:16d4 with SMTP id sa17-20020a1709076d1100b009e0231916d4mr2505788ejc.40.1702302052602;
        Mon, 11 Dec 2023 05:40:52 -0800 (PST)
Received: from jstephan-bl.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id qo14-20020a170907874e00b00a1f6737be65sm4622662ejc.82.2023.12.11.05.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 05:40:52 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [OE-core][PATCH] oeqa/selftest/recipetool: add back checksum checks on pypi tests
Date: Mon, 11 Dec 2023 14:40:42 +0100
Message-ID: <20231211134042.2502593-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 13:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192166

recipetool pypi plugin was originally clobbering SRC_URI checksums.

Now it doesn't do this anymore:
78ef0313ee6 - recipetool: pypi: do not clobber SRC_URI checksums
so add back the checksum checks on pypi tests.

Also this commit restrict the checksums:
45d2f8d4bc2 - recipetool: create: Only include the expected SRC_URI checksums
so add only the needed ones.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index d10d61bc5b0..233912b4c4d 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -487,6 +487,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars = {}
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
+        checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
         inherits = ['setuptools3', 'pypi']
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -508,6 +509,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars = {}
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
+        checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
         inherits = ['setuptools3', "pypi"]
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -521,6 +523,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars = {}
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
+        checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
         checkvars['PYPI_PACKAGE'] = pn
         inherits = ['setuptools3', "pypi"]
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -543,7 +546,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         latest_pv = match.group(1)
         self.assertTrue(latest_pv != pv)
         recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, latest_pv))
-        # Do not check LIC_FILES_CHKSUM here to avoid having updating the test on each release
+        # Do not check LIC_FILES_CHKSUM and SRC_URI checksum here to avoid having updating the test on each release
         checkvars = {}
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['PYPI_PACKAGE'] = pn
@@ -574,6 +577,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['SUMMARY'] = 'A library for working with the color formats defined by HTML and CSS.'
         checkvars['LICENSE'] = set(['BSD-3-Clause'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19'
+        checkvars['SRC_URI[sha256sum]'] = 'c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a'
         inherits = ['python_setuptools_build_meta', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -602,6 +606,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['SUMMARY'] = 'Simple module to parse ISO 8601 dates'
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=aab31f2ef7ba214a5a341eaa47a7f367'
+        checkvars['SRC_URI[sha256sum]'] = '6b1d3829ee8921c4301998c909f7829fa9ed3cbdac0d3b16af2d743aed1ba8df'
         inherits = ['python_poetry_core', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -630,6 +635,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['SUMMARY'] = 'Backported and Experimental Type Hints for Python 3.8+'
         checkvars['LICENSE'] = set(['PSF-2.0'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2'
+        checkvars['SRC_URI[sha256sum]'] = 'df8e4339e9cb77357558cbdbceca33c303714cf861d1eef15e1070055ae8b7ef'
         inherits = ['python_flit_core', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -659,6 +665,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['HOMEPAGE'] = 'https://github.com/python-jsonschema/jsonschema'
         checkvars['LICENSE'] = set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af'
+        checkvars['SRC_URI[sha256sum]'] = 'ec84cc37cfa703ef7cd4928db24f9cb31428a5d0fa77747b8b51a847458e0bbf'
         inherits = ['python_hatchling', 'pypi']
 
         self._test_recipe_contents(recipefile, checkvars, inherits)
-- 
2.42.0


