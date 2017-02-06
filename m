Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 35BB871987
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 03:42:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 19so5870022pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2017 19:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GBRG/nykEMDZhQhjBy0CbeyXOzt7OvlgV+TKoPnfPGY=;
	b=ThyFVYz89XuzQuTYmMO7euN91tbpbMp9tB7fUDv6qEn8R9wKzeTTzqPN32GRJ41u/F
	RBf691mwPCL5M/j50xCsrnIIcUAm8bGAxhHrpvyUrMV0ac1o4zAdrvCTcdCPv4vFZw/b
	uMdDaKzybDZUGVzqNYO5v1Wr+6/hgki652PytjWcUPl/cVMyXGYaVZnK/ges5R6hQVp5
	yrSkXGS6mBorqDTjvwapN5VUai9cwPNmhCx/giDVEnuNRyzjcrhkE/vWnMMogHui9iKq
	m2kq6b9nlM1lNmAnU7Ndqaz8LkDU/ItlOfURiF7n6IlFrpJyn70ibc6SMvVC7X2ADmtF
	Sr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GBRG/nykEMDZhQhjBy0CbeyXOzt7OvlgV+TKoPnfPGY=;
	b=SnJlJoXFxG0TUCygmjJIaqh+YZN7OGOd04ozQhu9UiHfyx/WdAyaAKEXOARztxSHCz
	hVnkohLUpUPvUj95/u7NUM9gHW6SyCOlYdqhbKBmdNddwxzp9ZZuBRU3Q8MwUEOaC7vh
	HJbtyhuuyoo5l6ptri1Byni2bD+LT7fIuouybtwfjylqtPlptKDmLF+oBmEQD/kRGy4p
	H8/oUsvCSExdHP2QPBK0YUWPpiyxOR5+hJ91Py9OezZ4TiPe+WVc/zVjIqVqd2I5TgMm
	nicTaNO0N+nvNT9btcC3F98SFflsjcrnTdX8zk7vBtW6UzwowjiKNiRiVGvTAqY/sENi
	xKpw==
X-Gm-Message-State: AIkVDXITjQOIV3pv+7DP2dQBpax3aqJicNktsfrM93GODDJlXNxuR6bJpZ53PEWi620mvA==
X-Received: by 10.98.196.1 with SMTP id y1mr10844069pff.105.1486352576315;
	Sun, 05 Feb 2017 19:42:56 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-240.dsl.dynamic.fusionbroadband.com. [173.228.90.240])
	by smtp.gmail.com with ESMTPSA id
	19sm84195987pft.46.2017.02.05.19.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Feb 2017 19:42:55 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2017 19:42:48 -0800
Message-Id: <1486352568-3145-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image_types.bbclass: fix image dependency chain collection
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2017 03:42:56 -0000

If image type "foo" depends on image type "bar.xz", then dependencies
should be collected from the base image type (ie "IMAGE_DEPENDS_bar")
not from "IMAGE_DEPENDS_bar.xz".

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 4c1c065..d2eb99d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -33,8 +33,8 @@ def imagetypes_getdepends(d):
 
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype) or "").split():
             base, rest = split_types(typedepends)
+            adddep(d.getVar('IMAGE_DEPENDS_%s' % base) , deps)
             resttypes += rest
-            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends) , deps)
 
         for ctype in resttypes:
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype), deps)
-- 
1.9.1


