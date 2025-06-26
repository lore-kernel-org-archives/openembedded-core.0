Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643A3C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:16:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10794.1750950977314458635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ge8Vdlk4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B573443A32;
	Thu, 26 Jun 2025 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750950975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wSEHStUEmI6h55e+DwGbixMnBpxg7C3PDhzheWph/8=;
	b=Ge8Vdlk4PQ+N/Fvpm51kz/OZqRbrVwVyCQT6yTJe3wmKFS5TSdIYOxL3rWeM5f+vw438Ns
	t+9Wl6OIqb7cR8P19RDDFM7XWm3Yzbi3XqaNyL004Fs8GLyVrIGvaiItQll7CwHQtOaHcP
	ZvpZUieYuEMKrQ6RgkXabOiFk7SiIpNA1vJv6z4krg9oIITFvNZFqezkiRHg0odI9CVfY2
	qNAegFqS4Pgrrihh9XbOIEJ3XFkwXyJDNOA82cKUPw+Pp/rntyjubfdsoG9wwPHv+kLzVM
	j36FTtADUxgrLvL7PFUlDfRwXglE67EG51VUB3EAEWJocOMxYQCQrwsOJTmzUQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Jun 2025 17:15:44 +0200
Subject: [PATCH 2/3] python3-sphinx-copybutton: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-buildtools-docs-additions-v1-2-f0a80b001998@bootlin.com>
References: <20250626-buildtools-docs-additions-v1-0-f0a80b001998@bootlin.com>
In-Reply-To: <20250626-buildtools-docs-additions-v1-0-f0a80b001998@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=oqE99klmtbp72s6BSMFhYE5S0L5HOHXC3OcsvLR7jJ4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoXWQ+ELKEcF20isylAxLG2HNZ+DBNOCTdw9VwW
 0z4Ql+Zu62JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaF1kPgAKCRDRgEFAKaOo
 NnodEACGg4D4cU+L7h4LCRrHZJX2w3FU7nxcw/xzggSELbbQ5ev6JQWaL1AG0cBurHuaTLti1bN
 ephEPqqz2vI9z2MDC5QLG/yBpkh54WFeZGWoS0uljg66KFu4UBvfswNGPPnJDATf16qCVXwlvqi
 lfD41yCSNBsvish2Kye3yXvyQX6KwTO8yOKuQZDg+xIDWx+yfB8wtS4BPamsj6JlUENFPoIQfms
 K9GaYvOMy3BOH165R+UDNMcdhlIQtlRSoBRqcZQhk32n6gF0t40y59//KxMJGdiCjMSAWU6OPVn
 nskI5f5bXjhtP4F+ap1mQ889r3QMO6m74bpc8YZCB41WuSauUn2Z6nB6ogn/9EW0xPZmwYSO6hG
 e1A4cFWOy2sa+pdiAS3BIfDDbqX5ObQbxZaqzTqdUdscz+la/ZQ3AedmLi3au6d8epwrxzGos1n
 72/w/lp3HQ7eUqmj3wrl8oZWbdwApbKgwkI1IaAgVpdhgZDnfwrMot7IKUmUelW7yhd9GITB98x
 bWlcyeDWAWchNZp0uTB0Wl1yvgbIPwTUVgWs5Kn1LHWm5WV2Hz2IP4eW23aZW4eI+lS/zxnkqA/
 uJbBhWP6gHGKPLsC3wr9XQhKvtBKgnDuWE6IuZf1JgPgcmNx4OdmjQmtBeUaC5V1+FrBg+UAEer
 M1rbXWoA5aRTJoQ==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219359

The sphinx-copybutton extension can be used to add a copy button to code
blocks in the documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc                       |  1 +
 .../recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c20fd6b27b..4d51219c94 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -719,6 +719,7 @@ RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <tim.orling@konsulko
 RECIPE_MAINTAINER:pn-python3-spdx-tools = "Marta Rybczynska <marta.rybczynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-argparse = "Antonin Godard <antonin.godard@bootlin.com>"
+RECIPE_MAINTAINER:pn-python3-sphinx-copybutton = "Antonin Godard <antonin.godard@bootlin.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb b/meta/recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb
new file mode 100644
index 0000000000..0441804661
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Add a copy button to code blocks in Sphinx"
+HOMEPAGE = "https://sphinx-copybutton.readthedocs.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c60e920848b6d2ecec51ea44a1a33bf0"
+
+SRC_URI[sha256sum] = "4cf17c82fb9646d1bc9ca92ac280813a3b605d8c421225fd9913154103ee1fbd"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.49.0


