Return-Path: <chanho61.park@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CD5C433FE
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 08:28:27 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mx.groups.io with SMTP id smtpd.web12.5164.1652948903668148150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 01:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@samsung.com
 header.s=mail20170921 header.b=XRX1GtVD;
 spf=pass (domain: samsung.com, ip: 203.254.224.33,
 mailfrom: chanho61.park@samsung.com)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220519082821epoutp03e73003c6d379b2d3f8b1dac0ccf92afb~wdESfrKit1260912609epoutp03A
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:28:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220519082821epoutp03e73003c6d379b2d3f8b1dac0ccf92afb~wdESfrKit1260912609epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1652948901;
	bh=7CvkQpDXDNM8PYIHCX8FV7iDLKVSrdt8G12DMjvdgfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XRX1GtVDsgIoTH1+TOK+F6MmuRBJ15w9SklAbe+XvY1S+8eBzX4vRuOSWU+vdmFBR
	 USV4Lz+ae+x/kBjDQNt0b++Z9IMqGnAPm7nf09em34nXG9WTARSRL+RqiIBvdsT7cW
	 hskaDze2Tj8EDqfvaqiw8XS75+u36VjOR56Ts3LE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20220519082821epcas2p4557a22dc0348a083415157ba09ad52c9~wdESN7SzM3062430624epcas2p4z;
	Thu, 19 May 2022 08:28:21 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4L3jfp6Q0xz4x9QF; Thu, 19 May
	2022 08:28:18 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	DD.14.09694.D9FF5826; Thu, 19 May 2022 17:28:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20220519082813epcas2p367c8f9a368328c9ae6030ee804b91d3e~wdELRrwwk0362203622epcas2p3T;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220519082813epsmtrp23ffa9d64530cb3f6df586e90318ed876~wdELQfuir2809628096epsmtrp2h;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-58-6285ff9d1729
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	91.5B.11276.D9FF5826; Thu, 19 May 2022 17:28:13 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20220519082813epsmtip117f07a089a7a877a32f48364bf05f55d~wdELD0LJi0417504175epsmtip1d;
	Thu, 19 May 2022 08:28:13 +0000 (GMT)
From: Chanho Park <chanho61.park@samsung.com>
To: openembedded-devel@lists.openembedded.org, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Randy MacLeod
	<Randy.MacLeod@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 1/2] externalsrc.bbclass: support crate fetcher on
 externalsrc
Date: Thu, 19 May 2022 17:29:00 +0900
Message-Id: <20220519082901.148142-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519082901.148142-1-chanho61.park@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmue7c/61JBjtaTS0u79e2uPPzHbvF
	xcNLmS1+/J3AavHj2URWB1aP/XPXsHuc27iC0aNvyypGj/VbtjIFsERl22SkJqakFimk5iXn
	p2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA7VVSKEvMKQUKBSQWFyvp29kU
	5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGf8OzSVseAOW8XChduY
	Ghi/snQxcnJICJhI/Ly2hhXEFhLYwSgx87FvFyMXkP2JUeL0h/NMEM43oMSGL3AdPy68YYdI
	7GWUWNT4gxnC+cgo0XNvKzNIFZuArsSW568YQRIiIFV3510DW8IsoC3R+XkKO4gtLBAgcbvj
	GpjNIqAqcfvLNrAaXgF7iT37m6DWyUtsmN8LNpRTwEHi6pVTLBA1ghInZz5hgZgpL9G8dTYz
	RP05dokVk8UgbBeJVZ0/mSBsYYlXx7ewQ9hSEp/f7WWDsIslls76BPanhEADo8Tlbb+gEsYS
	s561A33AAbRAU2L9Ln0QU0JAWeLILai1fBIdh/+yQ4R5JTrahCAa1SUObJ8Odb2sRPecz6wQ
	tofE4wk3WSFhNZlRYvq+BewTGBVmIflmFpJvZiEsXsDIvIpRLLWgODc9tdiowAQew8n5uZsY
	welQy2MH4+y3H/QOMTJxMB5ilOBgVhLhZcxtSRLiTUmsrEotyo8vKs1JLT7EaAoM64nMUqLJ
	+cCEnFcSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUIpo+Jg1Oqgclxn3R2XL1k
	7IKWwh+ul14rXtxzW/+OshhDANO67GqLpJtnDPxuTrjesu2zhJLIkvhziien7uP/veGTgfEC
	1x/PPfZ1RsvblejPrJ+6sG5lyvvPQcaMr7yX8oQdmua19XV1wezLbLcTg2J2ii7krL9Vx+u2
	U3NbqbrC0sduXbMqI9PXfTBQvX6/+UL2r4PCV/2zJj27KnRsZ+S6Z2ri563MVzAckNmXHN58
	zMnJgPtS55SLh/t2eme+39C0sdp+puPfrrSb0/jX/AnZu3s7D+PJc9uNGH1srNhvyh+zYD58
	7Q4fZ7s1o1Dkz/QAr0VLI106f/wq3Na8Ko03YU6BknJdvm7tP/cfFzTfz/5p66LEUpyRaKjF
	XFScCAByOrzhEAQAAA==
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWy7bCSnO7c/61JBvf/y1hc3q9tcefnO3aL
	i4eXMlv8+DuB1eLHs4msDqwe++euYfc4t3EFo0ffllWMHuu3bGUKYInisklJzcksSy3St0vg
	yvh3aCpjwR22ioULtzE1MH5l6WLk5JAQMJH4ceENexcjF4eQwG5Gied7LrBDJGQlnr3bAWUL
	S9xvOcIKUfSeUeLrq36wBJuArsSW568YQWwRgf2MEudnpIPYzALaEp2fp4DVCAv4Sfw7P5kJ
	xGYRUJW4/WUbK4jNK2AvsWd/E9QV8hIb5vcyg9icAg4SV6+cAosLAdWsvLmQGaJeUOLkzCcs
	EPPlJZq3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwYGr
	pbmDcfuqD3qHGJk4GA8xSnAwK4nwMua2JAnxpiRWVqUW5ccXleakFh9ilOZgURLnvdB1Ml5I
	ID2xJDU7NbUgtQgmy8TBKdXApDRlxuqYI07TxOLuXmXR/RnKubus3Ghyrb+B3F8mo9jD/+5P
	aEo91xF4T9M31+7R7eaAJJ2pm1v7bztyVxR9yj+/OfmTjtdBDqnpf624drhX3E0oDj95h6Hv
	i3tzL2v6FOnQ4J2OT5/l79Hm6K1ymhRY9lxpS5Hv8+CpR02CK9Y8ei6908F4ywxX5oR3CeJz
	Lf5Pt0rj1JzOv2aqT8VFrrwXz3iClu+Mfva/TE9AtnDLrQ+WZyR3ctiueKV45eq8kyqnuXKP
	PrpgkauSsaN75oGn2nLSc5/cPTMl6sziEl//rRXPF/65I6RsvWPetYqfG+0vLXz6c/aD2tA9
	irP8XGc/tRWRFNu9/1X72XCrZCWW4oxEQy3mouJEADHgM8bLAgAA
X-CMS-MailID: 20220519082813epcas2p367c8f9a368328c9ae6030ee804b91d3e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220519082813epcas2p367c8f9a368328c9ae6030ee804b91d3e
References: <20220519082901.148142-1-chanho61.park@samsung.com>
	<CGME20220519082813epcas2p367c8f9a368328c9ae6030ee804b91d3e@epcas2p3.samsung.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 08:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165869

To support crate:// fetcher on externalsrc, we need to make pass-through
the URIs in SRC_URI.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
index b2f216f361d1..90792a737b1b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -68,7 +68,7 @@ python () {
             url_data =3D fetch.ud[url]
             parm =3D url_data.parm
             if (url_data.type =3D=3D 'file' or
-                    url_data.type =3D=3D 'npmsw' or
+                    url_data.type =3D=3D 'npmsw' or url_data.type =3D=3D=
 'crate' or
                     'type' in parm and parm['type'] =3D=3D 'kmeta'):
                 local_srcuri.append(url)
=20
--=20
2.36.1


