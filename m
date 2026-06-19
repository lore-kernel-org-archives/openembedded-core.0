Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB5DCDB46D
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:33:13 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48972.1781893985406111931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=dRmpDm3A;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=QXe9XxSv;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id BD3ED1D000AB
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:33:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 19 Jun 2026 14:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781893984;
	 x=1781980384; bh=EpIw6pkvvsWEr9KDGFlcjuMbmv6gCwbVr6skS5OO14A=; b=
	dRmpDm3AZt1ZYx9BJwJNVQteV+Zo6ZqiH6qmr2xnlu/aywBRynSH84Ku+B4McpO+
	YsHiq3GzPUmACnlkKwwXn9tAj4e3AGk7qO7bUVvFkwSdfsRxOl9RAz42i4riQtgQ
	3dEdXOsfb36/TupSTx5XbSwxFySKDM4TTJ0MfFQjV9tbi3MbYgDI6A/B0DAC7q1a
	tcaBIiQnr9mWYNTbi5ILhpTV45VGV3F1336BjtX472C0srglUwjx5ktdBz0y+4ay
	T8vOprwgrgDkflw0dCnLGYmDVjJxrjP/XyOB4f2MNz1PACWp+wbnTxwK0TQmyCvn
	3Wea4N0rFupkFqm9xMl/nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781893984; x=1781980384; bh=E
	pIw6pkvvsWEr9KDGFlcjuMbmv6gCwbVr6skS5OO14A=; b=QXe9XxSv9tXJe13GK
	5p/qAEXSmh0MI81G2TawSyzjS5hszGDHJtjcpCPRCqoahTD/sILIXXbUPvU3kzhf
	bFRamqvUJBuZXVzu9yUZzG1I2S4fot+YHD16KwYdqo38jSVPIOk9K7LKYlD1ITdG
	J7TsltD3MlFrw3MGfOtgIGW6B/q7X0SMsdl1vnBmPbqbkYSUqWa+Qz5aFK7ETVBa
	dtxu1a/s/JbBrAK1iMUlkg49RPOZZeBDiX7+9y0a0wSuGpC3LnEqkc/u2wpX7FIL
	Qu53B1RI1eI9ATM7rWVMFI8XjRlKLuJKmVBCXw+GxrWNZaZI80RAh0j8IjdVnyaL
	mzf3Q==
X-ME-Sender: <xms:YIs1arJqm2WlC_u4Ux3rY-usBqRYM4PB_1x_OgkFZekS5DzYGiSvcA>
    <xme:YIs1amFuwEPcvRlw9cq5FkDEVWmt_UFybOLd8U4rseQExmMP6T6LC6WxbAcR1iiBs
    geBonCsHqWrcZysNc8NzOrRu_yl8XgZJLqYYWt_SBS4ve8EcuJcvAM>
X-ME-Received: <xmr:YIs1apWQqBegx_Lj4anTrp0Sk9royeTAULlg0Bh60YpbdU_yE2JB2DjQZild9UhwDQkFLlYickmTl1BoiZkxWlfWuYiSiQM>
X-ME-Proxy-Cause: dmFkZTGiUBlIS/8H4WxzncoYD4x2/SGXa9O5mkWCZInzGBhoIi1cwvKqdPbglLoRVVShR1
    RHERCsCaIk/ODfcbeid1Mshm9Iq0Kpa1r1T216pHphicF3DIVKG26Gb4U9dQBcpBZZrAeW
    q+VfSePwXvMm53rVubOHd1Wjh20ykfBJF233qChMKn/c9Q2B6sw3DSiDwM9Mv0zJjIaXC6
    aaRIiQp+AK2orX9IuU5a/MHYyIkPNIu3RC5s9000i2oim6PXl1P0crGSwqVSOFzv6SWDd7
    TueZbRKuuH5MGqfjf1ix4IhFzxfI9kubPGOqNEzGSay1FStMBWJejHbg7+8/0POzaI2kmV
    ZzLZNetu75wC6QhRaabHbn4AjcQ1HJcVC/ApHrVIN8EkUszTwL49WROW4NDdCCEE83z/BS
    Uibo3OignW3UYwydxXz4ZCm51F9WYto/oobZXTJd9qa6ujaf8xltvbCQ3I20iQ12ehPQEt
    REevwxUea/IcQUaxCV+93sO8LjED4zpAk85d+DtWCX+pbFMh5uGlcIpyurUlQPLClvp1Gk
    9zgCKCha9Jl/bW5ps2M0cvQnV8+5jIE+UMdWfwilZMxd8c9ER3aLFcGwBXHD1FrZD8OGay
    UmzqoNbFpkrEBnBOh2exp+5H48tla+pTL1u+OQkDXvQaSXprmp7wpHJk5y1w
X-ME-Proxy: <xmx:YIs1apjufGyTt2d6YIcHAewdy_HCvogVu7rG6YKa3pGfbfxt-HyFtA>
    <xmx:YIs1aiQc09Q8h53o78xBPRU_MDlM_XCKStDwuvyzM5uVa5b1PoFvww>
    <xmx:YIs1akFABjS31-XMo_LOBNg9tiqHmeTRGlFjD40z6XxaY-PKWTxTLA>
    <xmx:YIs1ainLTm0FU34j8_blilTgUfi9_E5JtzFs_16vsVqLJW_Pd03R8A>
    <xmx:YIs1aq6PtmznJVS5OO3WtZyG_a45s_2KaVmgDPttazOpriEoxw3d8s5e>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 19 Jun 2026 14:33:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 19 Jun 2026 19:32:22 +0100
Subject: [PATCH 4/5] python3-dtschema: upgrade 2026.4 -> 2026.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-auh-v1-4-62299dbd8231@pbarker.dev>
References: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
In-Reply-To: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=XTp61Ae2U3xnbssLEhni3mcuisQ1pDsjxTjGq+/nA/s=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSZdsc0MXiw1DIyfHsmP9toGsODc+v/vrghZFLNku7xv
 ZXpcoZsRykLgxgXg6yYIsvmnq/3n/Y68maE3FKAmcPKBDKEgYtTACay+w/D/9xNO09bPF326HCs
 I9OZVae/bdlkOMNGLpT3VNnjlueHA50Z/gfuToyfNJX1+qu3FmJ7HIJjd/NsPc4yu8BJTW7J29l
 JojwA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 18:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239188

Tools:
- Fix a case of stderr output not be atomic and getting interleaved
- Relax checks on overlapping types
- Fix handling of matrix types with unbounded dimensions
- Apply fixups under "definitions"

Meta-schemas:
- Ensure matrix properties have 2 levels of items
- Exclude "xlnx,channels" from vendor properties as it can be a node
  name, too

Schemas:
- New PCI properties "aspm-no-l1ss" and "aspm-no-l1". Add constraints
  for T_POWER_ON property.
- Drop constraints on iommu-map to support variable #iommu-cells

For more details, see:
  https://github.com/devicetree-org/dt-schema/releases/tag/v2026.06

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../python/{python3-dtschema_2026.4.bb => python3-dtschema_2026.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2026.4.bb b/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2026.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2026.6.bb
index cbd459c151bd..7e463ed1ad18 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2026.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2026.6.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "10cd0ffe239f8d88913390ac5d8213fae382e87a20643b21c65714ded82a4460"
+SRC_URI[sha256sum] = "05188e3727393334b99abb74ae220ccb8158eec67d6bec793326253f9e76d57a"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\

-- 
2.43.0


