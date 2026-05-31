Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DB5CD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 15:55:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9826.1780242921589141610
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 08:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=cgVxcWv5;
 spf=pass (domain: navimatix.de, ip: 40.107.162.81, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7jS7Zc5zFM+Pvz7ug7DxhXca6+k02loYdIP/4RC+Btgl3Dyj6fOlQHeKS3QTeuvrYWZTPKX5W3o7/XuMCKKeBANa8KVvWApe/BHkECN85y4obXuMcRMEYvJ6CtJioy5vntbP6ZqoDrXpRWBQBD52r+edG9wQOCH/JIAyQqe7AG4NIBTHdc8diD5T2+i1SaJDbplIOuZf3oAS89y2kuMEyIDH+m49zGA5I4vAPGEj+RhO37CKY6oYezK6l4uH+8WwqCHz5KYLIpVcrovWjz6M0fY2MTvYJ8UUQuW8OiedLEWvTOypszqwPaM0m3D0tBj3+HcGfQTUZZamoetKMhwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIvMF/W2MwZJglOKznsIuJTzPamLoNWGZRP+6t+HaHI=;
 b=tRuVYBUCkSco1moytTNKYk62vxQOpKMMF5McvfL47gJ7Mt1Am0xVuhNbavdOAWFTErFxWTUGtRXRausnivp7MSwKF0DS7jnhoyR7mx+Ae1cLP0JqHlbEB1kdf//N3JfNodjaAzRCW+bs24JcLGZjZ5lK3z5k2Z3BeiTLWWn6TowJ9iQ8wwIpEkjdMUxi2zCgul6ZfQ6qLelut0DCJ1hZH1IJG7uCZAIbRR2xbc+zcBZOlZ8gVYXDqqTkNeb3+PkcvoffkTaEroPy1HVT3PZmfQJH52a38fV30kOfwby/Z5uMIuwq6lcx9UVT3zaPmiw20d2VjT6hls6B4ty/ir+pqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIvMF/W2MwZJglOKznsIuJTzPamLoNWGZRP+6t+HaHI=;
 b=cgVxcWv5UQ48slqOxP8t1hgaAx0RWLAy+PBnz1W+HWjzSF/axtqVUnyY+WJErMkM0GdQFPs2VRVskoiecd/2+EQQ7P+DpaefqUUVFpBRgtga9e2twbZPIcHOgOzbStQxj+CTM33fXKk7QfnmnoX38QwzxmStD6tfBt6gGQEMn0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMDPR01MB11673.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:71d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Sun, 31 May
 2026 15:55:16 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0071.014; Sun, 31 May 2026 15:55:16 +0000
Date: Sun, 31 May 2026 17:55:15 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] diffoscope: Upgrade 317 -> 318
Message-ID: <04c4e72c83eef28744f518b6bc9cf4117a92e60f.1780242914.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BEXP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::25)
 To GV2PR01MB11835.eurprd01.prod.exchangelabs.com (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMDPR01MB11673:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f465220-602a-4de8-d722-08debf2d0235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Q2pAaoNeuBziPKBS0hwAV+ESQS+spD161rUnGZ+xnW1Loi0F/HMwbc00t6FE8sVvQ43gmasZU3CZWLe12uls+AgvBYz5qoEI8u48TbnIJMzogKfI6cyKV8qqFVlSiSqBN32VdZgnFJxQSLBcmqMnM8hwghD2OJsK7rO7Bf/Vx5OWIAVboALvRj8SR7DA1FCIY7O3KbxJwXrobDMxwt5jpkbLcXnEi5MkS38y8jnBAKneuKwc1iKO3ct8e51VCZqbCbuM1XnOSh04xZRFg6n/Ayl/jn0ULghsAfgzBXURTVrmekBjguHONE6bzVwp/hr2hv5Ku4ESn1tdEvc7zEB6w2KdMb9I6e94+UL7kT0JVUbEsfUpuB710RFdF+9LmC80Rd0w8fAtDyMk81DAd4YxQdqhkrzozJ3LPTBPa+BQyBftKqvn2yBjppLfvoe+QaARPLH/fxY++0J9Z7A2C+sbAdoEfVP46oJ4ccslT0LBMFKI0F8AvlMMVJHEsvkuJaFIRzXWSMIg7sFsTFyyZx/0umHVJ+VmjnGbGhb/fxJgVdWCb3qW6Y5o7JR/hTLUEeQZpIngL6O8r+l5dUNNOVvPTClJBWtFmSUiFwWGIlU/OQlQOfSLl66uIQoy1cL+wl+lpZtvVHr3Cqu/k/n7F0W4ng5LkoyE2fyLOM44MfXyBx775GsHZAMLFQ584nADBWlco3kqWD0QKvo+oN1z4s9IgQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lPk7COgsWt/3jNwY8IPCS6TMd+pRuOFWLZs7+Nz8Q8jOGMqQuV2SqtM/6fAZ?=
 =?us-ascii?Q?ZjoaFsPPQdmYk60Yp/KY+PzG30og2xSp5ceW5M52rUc8wNzijtCOU8gX1v8t?=
 =?us-ascii?Q?TGSPOi/sguTsDiaFFQnk2ZCO5cxU99d065L/G+QMmv2bnvIGrJZ5eYyhn47x?=
 =?us-ascii?Q?BWyvduwDs0XhjC7OLhKYdqOwqRfT9QOKrKXuVFPbmyo9RPouXdWebfvZk8Ql?=
 =?us-ascii?Q?BvGGCUsNbNx9h/K3smu73sqaPL4Wm+QOrinZjEm0ifL66yiRzjXhPOnL5BJk?=
 =?us-ascii?Q?fIRSl1f/onJTvrXzrUHIYiRklT/sDWQPpP1eQ/vJH4MeSkfOiifTGGh+HFF0?=
 =?us-ascii?Q?bFKkfGD/NP9rkesS0gaiVEstl2dBpD+RuwUyOgEQOXbI65qjyLLFFkSicdcA?=
 =?us-ascii?Q?24EwcwQZ9dkPbyIeVQTnKhuj/maL2fg3pwRx2zPN92tY43r2YmWGDsytqj27?=
 =?us-ascii?Q?8wxb+DYKomiMeuiBd44o/Q0eOpa2PUghtX+hXpFa0g43UmzgRdM41JvkcUl6?=
 =?us-ascii?Q?ll4D8aZg/eOpDhmbQ/UgHmnZbrpz9s7bNGNB0Wj8qrEyOst5peq7S/nDr0tw?=
 =?us-ascii?Q?YWmL8C2JCBP2f3sVB0RYgH3MeGZczNx9u2jIDeKTjzEXFsLN8L1GrxhLnOlQ?=
 =?us-ascii?Q?Jwb/iaLJVflfSrb56GA38AG1GmKoiFS8SmzJLpMj/uuoqKjsaZy0VSXaZzxg?=
 =?us-ascii?Q?HkBsj34ohx6Hzu/I6O9XTKPw00tDgdNpfb1xDgSCb28W56GgNLBBbOiYlXs0?=
 =?us-ascii?Q?m/bJC06xfgv42X1DIzZ3Qn0L/lKRR0dmpBOa9H1ngtgWm9Qaa7y4wwvDa+le?=
 =?us-ascii?Q?P8Yt2Q+w8FVKoSMQOt3k3vupQZMYjcEDrniyQxV7E8ncYGi2E1F19klTO8x7?=
 =?us-ascii?Q?7iZUugkQCeQTnhu+QhnT+QlvhciR+lYchtufuHy0HygV+WfspBnIkZHrruAy?=
 =?us-ascii?Q?9jD2Jgvzi6iC1o0g1R/7QpxMPU5s5yPp7bAUbe0yJH+zGkcEhWT6DMi3i2Ff?=
 =?us-ascii?Q?i745PoLlnt74E07OMP0MsogR9bF9hFbg4W3QcDeupPacPsM+/9HKAlKnEBVx?=
 =?us-ascii?Q?3aFyisJX95BnA0MVxn//oYu79TKvieCEzQGEspmfHgzgtoKuNH11wSHyXY5X?=
 =?us-ascii?Q?h81xHlwy6tF+zFieEgREiDzIdv3vqyEQDZd5C5L+JhsAz84lY/Q3lnp1QNtO?=
 =?us-ascii?Q?ftHNTo6YvgZG3DmZUNVP9A7C6JrGbSJOqGmQ9cj0S0eaKltbotc0uug87Uz5?=
 =?us-ascii?Q?UEpvIP2O+A6G0Zdp4qVrUBZ+Be+tIs8pUox+2+Jh7A9J/8CB9VJcHqzzwBxr?=
 =?us-ascii?Q?+GjTAQ0wSUtN0Lg6l7940TbvDsY1VL9mJ5nVieY14cj+o9zZVXr+9XB5W6gD?=
 =?us-ascii?Q?Itcu0TDWSF6GhnJM2yHK+rF+HxQ1QO5jCD/bocoYbiU+EqU3vqv/8SlcC4cm?=
 =?us-ascii?Q?G4xzLPS5kSTPL3Zb6wQsYmj2SJRqZY1tBL3NrlslXJYW5Bu5UMyfnKSQ9p8s?=
 =?us-ascii?Q?W83/pEE6LWY0TYXvlR62rY7XvqGs1TOKbX4wHsSKTpv3ygyGDYf7niW/hQGE?=
 =?us-ascii?Q?aKtdED6Ga+DvG9BB52tPp4W9U4r9i7ye4PHMfqSRMS22plnVaPPGsW8NiTjP?=
 =?us-ascii?Q?mJlvTghRiwdrNT28lawWlA6fVK/4t+lDXUF4GJ+qy/LwC8+NZnSqCj9bbw3H?=
 =?us-ascii?Q?IzfgLEA4cVenjabiwvFVPJNuwHhOclJpb5g+4xhLN/Kap4mH77j2+pOiOC1U?=
 =?us-ascii?Q?nEMfzRbjaovnjS66IPqnbani+dzXwi8=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f465220-602a-4de8-d722-08debf2d0235
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 15:55:16.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+w2LZBSdFK7LT+KZdRBjvlzREm+0WiPILDtdf7YodXdsgxvEneunrEK/iG7wPq0vDMhibFVnYSRERTG55dWCwp9p5Fu19ICp5WquDZ8O2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR01MB11673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 15:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237795

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Remove PYPI_PACKAGE, because it is the default value set by pypi.

Changelog:

[ Chris Lamb ]
* Upload to test PyPI integration.
* Bump Standards-Version to 4.7.4.

[ Manuel Jacob ]
* Remove a misleading comment.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../diffoscope/{diffoscope_317.bb =3D> diffoscope_318.bb}       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_317.bb =3D> diffoscope_=
318.bb} (91%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_317.bb b/meta/recip=
es-support/diffoscope/diffoscope_318.bb
similarity index 91%
rename from meta/recipes-support/diffoscope/diffoscope_317.bb
rename to meta/recipes-support/diffoscope/diffoscope_318.bb
index 06c3ee1a30..e874d2bce4 100644
--- a/meta/recipes-support/diffoscope/diffoscope_317.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_318.bb
@@ -8,11 +8,9 @@ BUGTRACKER =3D "https://salsa.debian.org/reproducible-buil=
ds/diffoscope/-/issues"
 LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
=20
-PYPI_PACKAGE =3D "diffoscope"
-
 inherit pypi setuptools3
=20
-SRC_URI[sha256sum] =3D "9c8741f76bcbd1faec59227da31981a524abca63e19d03f3a5=
94c19f326de542"
+SRC_URI[sha256sum] =3D "313261c0da6b6c02e525a6b8a898a00aaba32cb7c5511364d5=
939fc0394295d9"
=20
 RDEPENDS:${PN} +=3D "\
         binutils \
--=20
2.53.0


