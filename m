Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625F1C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:16:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10582.1750950977361387414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nPPR/TS7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91A3243A25;
	Thu, 26 Jun 2025 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750950975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ShHVbtlZB68NHS/JRnOciXAzlxmOXczR/unovLPENA=;
	b=nPPR/TS7+tWzPvUPvGbcGZckTS/Q+tur2mJmn5lmv5PK78FnDPznIIyQ+e9I+xDswlXqlU
	gDvUY+p87S6LYhFCHoD11mLsktiL6E1IK/ujmcgXfTgJkES8SSQtP6xgVPmG0alGLrQ3Sv
	GD/Rr0yC2DBozv3+8foQpprftpK/LP/puLDNf/ddv0oKrrr0n44oZah8vG+o4wbMUUYkwc
	wQs6kGXdxc6lhW42KnMyBZyS1KaUsxlqsZuE1mYfjlJpSr3DNbfaRFyG+n1bBlj4gyjXCk
	hB0e+4G366UVmHTvNimNXe+DQek10dVyLMj6rwWA8YIhEcc3Dm+enS2Yo1Mcgw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Jun 2025 17:15:43 +0200
Subject: [PATCH 1/3] python3-sphinx-argparse: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-buildtools-docs-additions-v1-1-f0a80b001998@bootlin.com>
References: <20250626-buildtools-docs-additions-v1-0-f0a80b001998@bootlin.com>
In-Reply-To: <20250626-buildtools-docs-additions-v1-0-f0a80b001998@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dXxXew0xlKRPqqEAFMb9sH1SQ6A1SMn+TUNpOq7vbFw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoXWQ+xHXJGD+SFNzw5r2TuHqsj12wAGCrV5Ml6
 VelR7VixHmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaF1kPgAKCRDRgEFAKaOo
 NqCOD/9DPDgVIlHmAgwqzsTpeB2Zj5H0AeE5jChDTkpG5++MsLxWQCM8oYWiSxg5dqu6gbQo9qv
 h/oSdclGCwQgoj70+9r0QAOE562sAnc4x0kSXI76g4AREzV1lg2L7sNFpdP8PZzhaN8CKXmtxUy
 wavSH64oUZECfHnL1dJ56r0tnq1VjjWbKAJQe1XtInUh4oLyO3fECw2Nrskv0/W9n3s1smys6EQ
 um4NW2aGGb79Apc/o1cF50F8lXulVYI6FbNgVxMvUcPmEr6J3sRWPtZjHVIVVD/Ht3188r2fzqS
 t0qxIp+H4huN0TgAmgdNvuXf5iVAobJztqgfOXkhQabqzKPZoG6eowFMF77n9QXbbnvRZDOXK7x
 WwLHcA7pZ23l/jOl8egJAbL4osiWOeAKQ5+Q8wgCVyMCa6MsYuBQ24GiOGRvM13w+rZUuRfVGwh
 kdj1WYFvG7dW2oy8tleUFIzIYau1E4j4uZJCb1NC48YyKEovA7lSkA//l2P5QDpeDg/puKrzAJJ
 ic3lrj591rdkZgX0MgLMVJLDg9eEgJ5TDTx6RTM6IHdLC/zGhjw3fhKxWbsR1OvsoUZYhLhbZIj
 mwU2LuwGn9OFK2K172QBqWHalu6UQlbMpfZ5gV+EUI6nKbKQV3GIGQd/63zeT83VVA+/xwQ5eZP
 9X7eviu4ejZADyA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeuhffghfeuueevffetteffleevfffhudffkeeuvdekgfdufeejgfehhffhudenucffohhmrghinheprhgvrgguthhhvgguohgtshdrihhonecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 15:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219360

This Sphinx extension can be used to autogenerate documentation for any
python module returning an argument parser from argparse. It can used in
places of the documentation where the --help output is currently
hardcoded, and generate formatted documentation instead.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                    |  1 +
 .../python/python3-sphinx-argparse_0.5.2.bb                 | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d94fb693e3..c20fd6b27b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -718,6 +718,7 @@ RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.
 RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx = "Trevor Gamblin <tgamblin@baylibre.com>"
+RECIPE_MAINTAINER:pn-python3-sphinx-argparse = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb b/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb
new file mode 100644
index 0000000000..554fb3eb51
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx-argparse_0.5.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A sphinx extension that automatically documents argparse commands and options"
+HOMEPAGE = "https://sphinx-argparse.readthedocs.io/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=5c1cd8f13774629fee215681e66a1056"
+
+SRC_URI[sha256sum] = "e5352f8fa894b6fb6fda0498ba28a9f8d435971ef4bbc1a6c9c6414e7644f032"
+
+PYPI_PACKAGE = "sphinx_argparse"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+inherit pypi python_flit_core
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.49.0


