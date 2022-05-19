Return-Path: <chanho61.park@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9E9C4332F
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 08:28:27 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mx.groups.io with SMTP id smtpd.web10.5202.1652948903905510834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 01:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@samsung.com
 header.s=mail20170921 header.b=Gi7BhImP;
 spf=pass (domain: samsung.com, ip: 203.254.224.34,
 mailfrom: chanho61.park@samsung.com)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220519082821epoutp0469fe70a45590e31cf00dcee032fbac2f~wdESRQvqn0294002940epoutp04j
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:28:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220519082821epoutp0469fe70a45590e31cf00dcee032fbac2f~wdESRQvqn0294002940epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1652948901;
	bh=ZPL7pF1aUYyJzRiatC/FC9aFmDHt+My8v9qfnsMmeuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gi7BhImPIm8KVSzHVZ1MapZ2ouF0boANBrN3WVOjWR7if3aFnYevH2CRkUESGXHOq
	 oRQcJH2/zaqb4TNVlNqaHY2XNozQE5Y3OO+cLvAbABmAiOXv7KuhjYnRo0yLZkEbgT
	 y1+cLWVDiWMWNYr/cPgvDzi6VGrG93tL5fYZEA7c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20220519082820epcas2p312f73318559645d4229d4fb47459243f~wdER6ZKmj0362203622epcas2p3p;
	Thu, 19 May 2022 08:28:20 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.91]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4L3jfq1kl9z4x9QM; Thu, 19 May
	2022 08:28:19 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	ED.14.09694.D9FF5826; Thu, 19 May 2022 17:28:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20220519082813epcas2p39cf1b2a4d20c8c7c8c0ae48955a50ac8~wdELW0ghl0198001980epcas2p3X;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20220519082813epsmtrp1d86bbf26ae127166dff9f102a5b8599b~wdELVW8h12068320683epsmtrp1d;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-59-6285ff9debd9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	24.67.08924.D9FF5826; Thu, 19 May 2022 17:28:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20220519082813epsmtip1f9340eadb1e8e67bf04dd000826b2c47~wdELIY7O_0421604216epsmtip1N;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
From: Chanho Park <chanho61.park@samsung.com>
To: openembedded-devel@lists.openembedded.org, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Randy MacLeod
	<Randy.MacLeod@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 2/2] cargo_common.bbclass: enable bitbake vendoring for
 externalsrc
Date: Thu, 19 May 2022 17:29:01 +0900
Message-Id: <20220519082901.148142-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519082901.148142-1-chanho61.park@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7bCmue7c/61JBrffmllc3q9tcefnO3aL
	i4eXMlv8+DuB1eLHs4msDqwe++euYfc4t3EFo0ffllWMHuu3bGUKYInKtslITUxJLVJIzUvO
	T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB2qukUJaYUwoUCkgsLlbSt7Mp
	yi8tSVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM643NvMWLCcveL5g+cs
	DYyT2boYOTgkBEwk3izn6GLk4hAS2MEo0f5oKTuE84lR4vTqXywQzmdGifs3bzHBdNzcyQ8R
	38UosfnoJUYI5yOjxLm/34CKODnYBHQltjx/BZYQEdjLKHF33jVWkASzgLZE5+cp7CC2sECo
	xNN/LxhBprIIqEpcbwoDCfMK2Ets27qYGcSWEJCX2DC/F8zmFHCQuHrlFAtEjaDEyZlPWCBG
	yks0b53NDLJLQuAau8TF3afYIS51kbiywgFijrDEq+Nb2CFsKYmX/W1QdrHE0lmfmCB6Gxgl
	Lm/7xQaRMJaY9awd7DZmAU2J9bv0IUYqSxy5BbWWT6Lj8F+oTbwSHW1CEI3qEge2T2eBsGUl
	uud8ZoWwPSS2bu0Eh46QwGRGid3b4yYwKsxC8swsJM/MQti7gJF5FaNYakFxbnpqsVGBCTx6
	k/NzNzGCE6GWxw7G2W8/6B1iZOJgPMQowcGsJMLLmNuSJMSbklhZlVqUH19UmpNafIjRFBjS
	E5mlRJPzgak4ryTe0MTSwMTMzNDcyNTAXEmc1ytlQ6KQQHpiSWp2ampBahFMHxMHp1QD06Sf
	wb63qtSrnZxurY3UeT37sMZ2Pff//qUi4fIWop8mBasbZeYvLppxsa8h37jl4O2w6bH+MuI6
	ptMv1/keXzgt4f+EYxwRYTZ/Is9MWB/a+mjnFA2RbzH/hZZkFj3nnGK21vVopeWVDBHjPzvL
	ZBa6zVee/UzAd8uyNu2odTdet+t6ec8JOcC/dtsd/8aEZO01b/T/X3K1eZjbpq7+IbkkbYfP
	conZqo5T2UoevtW+JRRV9G1bgNsTXrv2lp2iaud/3E5pdDit7ZQzh6n75/arS889zu2fMfnX
	t2W3eKyPlZtI5rGkMy3cvfLhe4VU8VDVHYc4bomcc/lif2vWonOfHreI6Wv4Fks/ztwXrcRS
	nJFoqMVcVJwIAC0uUPMNBAAA
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsWy7bCSnO7c/61JBld3KFpc3q9tcefnO3aL
	i4eXMlv8+DuB1eLHs4msDqwe++euYfc4t3EFo0ffllWMHuu3bGUKYInisklJzcksSy3St0vg
	yrjc28xYsJy94vmD5ywNjJPZuhg5OCQETCRu7uTvYuTiEBLYwSixaMNjpi5GTqC4rMSzdzvY
	IWxhifstR1ghit4zSjw7e40ZJMEmoCux5fkrRhBbRGA/o8T5GekgNrOAtkTn5ylgzcICwRKn
	rrYxgixjEVCVuN4UBhLmFbCX2LZ1MTPEfHmJDfN7wWxOAQeJq1dOsYDYQkA1K28uZIaoF5Q4
	OfMJC8R4eYnmrbOZJzAKzEKSmoUktYCRaRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4m
	RnDQamntYNyz6oPeIUYmDsZDjBIczEoivIy5LUlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90
	nYwXEkhPLEnNTk0tSC2CyTJxcEo1MNmnyqQatl8IzOX04+P+mrbowxUXtxVnb98xqX0mbc++
	aPFzz85nTC2fLyxatvtb2Ja761halq9/WLHWv/rYirZj3gyKtnuWX3jI2VKr2HV00q3OfSsf
	mF76y3Ty4EJf3btr/O6yvdzcdbQlUHYz29GZIu/1jUU0r09vbTBUtNkXrrq8xfnPmeq5KeJR
	i/vvsUdmzLCwffNJ9U1P/A7nh5vy0zc4vOU+NJfn6MSQq7rZKbOrZ+a/7Lz197f8jc7FRhPO
	7Qztzun8tOnqnaQSNfbSNWFW1uUXYzurDr12T7GbKZcqFi7gEZc7KXAK/yZ/zzRDpo5SZiPH
	bcd5xB8FPfPmXNe4webckXltwhPWT1ZiKc5INNRiLipOBADc7t6ZyQIAAA==
X-CMS-MailID: 20220519082813epcas2p39cf1b2a4d20c8c7c8c0ae48955a50ac8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220519082813epcas2p39cf1b2a4d20c8c7c8c0ae48955a50ac8
References: <20220519082901.148142-1-chanho61.park@samsung.com>
	<CGME20220519082813epcas2p39cf1b2a4d20c8c7c8c0ae48955a50ac8@epcas2p3.samsung.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 08:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165870

To support crate:// fetcher on externalsrc, we need to remove "-z
${EXTERNALSRC} check of bitbake vendoring. It is possible to disable
vendoring by CARGO_DISABLE_BITBAKE_VENDORING =3D "1" if externalsrc-ed
project does not want to enablt it.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 meta/classes/cargo_common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_commo=
n.bbclass
index 90fad7541530..39f32829fd44 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -45,7 +45,7 @@ cargo_common_do_configure () {
 	directory =3D "${CARGO_VENDORING_DIRECTORY}"
 	EOF
=20
-	if [ -z "${EXTERNALSRC}" ] && [ ${CARGO_DISABLE_BITBAKE_VENDORING} =3D =
"0" ]; then
+	if [ ${CARGO_DISABLE_BITBAKE_VENDORING} =3D "0" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
=20
 		[source.crates-io]
--=20
2.36.1


