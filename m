Return-Path: <chanho61.park@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66D2C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 08:28:27 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mx.groups.io with SMTP id smtpd.web09.5156.1652948903262250646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 01:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@samsung.com
 header.s=mail20170921 header.b=Kuh3xmPN;
 spf=pass (domain: samsung.com, ip: 203.254.224.33,
 mailfrom: chanho61.park@samsung.com)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220519082820epoutp0347ebff7e5b2fcf529135bc28fe0165e7~wdERWtge11260912609epoutp03_
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:28:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220519082820epoutp0347ebff7e5b2fcf529135bc28fe0165e7~wdERWtge11260912609epoutp03_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1652948900;
	bh=Rpn4T2maMtMyNaBUMnpGxRFXSt0kV3rZGOs4k6KEUYA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Kuh3xmPNu5ZPBvXh03wN5WjS85nPGxLh8nKTvvMR5spiPSCBOI6apaZ32/3ookvSJ
	 1dCxlIgBk813+XV9A2F4EznXCzWIHDWNOUd/7GTrYdM66qd+Fz6+kl4he8HgbDDtsV
	 fExQdjrhH62RkoGutd0Pa2asq/8drNf8mfQ4OT0c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20220519082819epcas2p40f06f1c74cc2bd9230593eb7d7728885~wdEQ8r-Og3062430624epcas2p4v;
	Thu, 19 May 2022 08:28:19 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.90]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4L3jfm43Yxz4x9QL; Thu, 19 May
	2022 08:28:16 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	CD.14.09694.D9FF5826; Thu, 19 May 2022 17:28:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20220519082813epcas2p356d33ae7937121d474fcf409d70cbd51~wdELQAsP40198001980epcas2p3W;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20220519082813epsmtrp1c879f1d5f199001831e6a55ef5d4287d~wdELPX83f2068320683epsmtrp1c;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-57-6285ff9da590
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	C3.67.08924.D9FF5826; Thu, 19 May 2022 17:28:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20220519082813epsmtip18fdef7e29a2e00681ae7d94c1bfd19b3~wdEK-OFcS0534005340epsmtip1o;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
From: Chanho Park <chanho61.park@samsung.com>
To: openembedded-devel@lists.openembedded.org, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Randy MacLeod
	<Randy.MacLeod@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/2] Support cargo crate fetcher for externalsrc
Date: Thu, 19 May 2022 17:28:59 +0900
Message-Id: <20220519082901.148142-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7bCmme7c/61JBh/PG1tc3q9tcefnO3aL
	i4eXMlv8+DuB1eLHs4msDqwe++euYfc4t3EFo0ffllWMHuu3bGUKYInKtslITUxJLVJIzUvO
	T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB2qukUJaYUwoUCkgsLlbSt7Mp
	yi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM74++MJc8E5loqOhq1s
	DYwvmLsYOTgkBEwkzi3L6WLk4hAS2MEo0fS0ixHC+cQoMX3TZFYI5zOjxJuT74E6OME6dj74
	wgSR2MUocebXXqiWj4wST0+9A6tiE9CV2PL8FVhCRGAvo8TdeddYQRLMAtoSnZ+nsIPYwgIO
	EvdnQdgsAqoSTybvA2vmFbCXePxhKQvEOnmJDfN7oeKCEidnPmGBmCMv0bx1NjPIAgmBTewS
	kxavhbrPReLNnG3sELawxKvjW6BsKYmX/W1QdrHE0lmfmCCaGxglLm/7xQaRMJaY9aydERQ0
	zAKaEut36UNCSVniyC2ovXwSHYf/skOEeSU62oQgGtUlDmyfDnWyrET3nM+sELaHxIxLk5hA
	bCGBWImnb9+yTWCUn4Xkm1lIvpmFsHcBI/MqRrHUguLc9NRiowITeKwm5+duYgSnPS2PHYyz
	337QO8TIxMF4iFGCg1lJhJcxtyVJiDclsbIqtSg/vqg0J7X4EKMpMHwnMkuJJucDE29eSbyh
	iaWBiZmZobmRqYG5kjivV8qGRCGB9MSS1OzU1ILUIpg+Jg5OqQam9j8MmfJBsV8med+3mtz8
	+F2AR3H2stB9J9kN16ZunC0uaOugcbHv44S6e30rPWf+3nbOseyG4YXP+9k2P+Q/yfL8td32
	xdv0GJzVasOmm89TK/XsfmXvu/tT/c7GT6G/Ngsk5iR1R8Z+CJvC5ZrDO+2a5m2B1SqpQfEJ
	T08eEvkVc/3cT6ELluEJ6S+/aBreqppxj9MgL87rwJXGm8ccxDlL5xmoz1v0ue/+RO0X7QvM
	spccniIlvl7v846Qt11LL6xcESa2ry3u6fzORX2O920tTYU9xONyTT6azeM6JzDv7/yIV1q1
	NW5395vl/Fi4VWuuYsWWd0fLJHc+OKCl73yrrrgpZ/FaTw95xTV6SizFGYmGWsxFxYkA1rBh
	TgQEAAA=
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsWy7bCSnO7c/61JBnMbJS0u79e2uPPzHbvF
	xcNLmS1+/J3AavHj2URWB1aP/XPXsHuc27iC0aNvyypGj/VbtjIFsERx2aSk5mSWpRbp2yVw
	Zfz98YS54BxLRUfDVrYGxhfMXYycHBICJhI7H3xh6mLk4hAS2MEoMXdGPyNEQlbi2bsd7BC2
	sMT9liOsEEXvGSXap91gAkmwCehKbHn+CqxBRGA/o8T5GekgNrOAtkTn5ylgzcICDhL3Z0HY
	LAKqEk8m7wPbzCtgL/H4w1IWiAXyEhvm90LFBSVOznzCAjFHXqJ562zmCYx8s5CkZiFJLWBk
	WsUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERyIWlo7GPes+qB3iJGJg/EQowQHs5II
	L2NuS5IQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTGvE
	f9U6rC1etftAH79qKVu+78uaibWnFrXW21x+7Tpnabpk9o+ndTe3MD5TurayIr57oVPRPMm5
	U9bxLHy9Jy/6lWvfMQE9hpsMi/g4T5x/4S21b+bru5s63h4tvrw4emtX3GyLD4cmdSvE8hlL
	J7NGcEfMUMiQaVPa3Mf1fenP/FcVSj83nq71P6vjfD5rrWJA+7bsqkf9q3QP7Vlv+ZdLhc/z
	z4pz2womrnrlVR3vmm4oY+67bkXda8eI9M+Z74/FT7w5w2SxrLe6Wp/1oe/P1puHix1zzbwb
	+UrTn9uvPmbNtH3GeiV/7jE4SDS/dunRPHFkCReXWMWODI8P+mctw0/MTpE16RLYt8z5uhJL
	cUaioRZzUXEiAKv3InWzAgAA
X-CMS-MailID: 20220519082813epcas2p356d33ae7937121d474fcf409d70cbd51
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220519082813epcas2p356d33ae7937121d474fcf409d70cbd51
References: 
 <CGME20220519082813epcas2p356d33ae7937121d474fcf409d70cbd51@epcas2p3.samsung.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 08:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165868

When we use externalsrc.bbclass with devtool, it is not possible to
fetch crates via bb/fetch2/crate.py even though crate:// is defined in
SRC_URI. To be working with externalsrc, we should not remove from
externalsrc and remove "-z ${EXTERNALSRC}" check from
cargo_common.bbclass.

Chanho Park (2):
  externalsrc.bbclass: support crate fetcher on externalsrc
  cargo_common.bbclass: enable bitbake vendoring for externalsrc

 meta/classes/cargo_common.bbclass | 2 +-
 meta/classes/externalsrc.bbclass  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.36.1


