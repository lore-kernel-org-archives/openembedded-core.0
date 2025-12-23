Return-Path: <k.kurematsu@nskint.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1ACCE6B260
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 00:05:39 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91895.1766448336921659904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 16:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nskint.onmicrosoft.com header.s=selector1-nskint-onmicrosoft-com header.b=Y62WXeyu;
 spf=pass (domain: nskint.co.jp, ip: 40.107.74.126, mailfrom: k.kurematsu@nskint.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6Jqtk2W0nHQcFr7GjfI/8PuZIQweLB2q7u611G0yIo1lMJ6KZq4KBivgPNqJtWfgngOBMRtm82Uzb+3agizpNKWE2wW8T+4uYqEyZPJYIO5mi9okiBpBkTTTF4v49sWG+e92SMgQ6m9NcLYxVKZNkKl94X7lMvuTPqKyxuze1cGwAncaYj1VHhRpSUNy70kz3tr8nRTYN9KHDcOU5gAx45oqOMhM7MxeyL1Akb2yvSrfaNsaCNdpE7NI+SPOXmzqvFySMwCRvJn+U157B6paEbPIwcFwCG/4h7PzdISgWleQtnV0YIq+CenPvpeJmJO+lvf1kp0NoMRZeJIWHOo5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdS0SU9q5L4DPkniLBepLatDGxVSaUibcG8Wn24lI+s=;
 b=TB1/fnQysQB+m1QzSnd4Hxysh8a3tRpwWUu1kgXtO/nKyaqLXccchdv9rXwG2WHwp9u+dQjUSnOb1zUpv59QGYJyeUW/5tZ+sWsOmwABD8owKNGlFVE3RRrYbSVcyl1NoLCEokP0hhtgv5b4PLwK/H1VFGXXjvcPJtECcj7jd8eP1xILinI/hV7PT3M1IQ4P17P7f0wC2CsrJti3IHbKVEVLeCZXXMoErsFMIpU8ja220nMKypYhNdeWS3RpG3i4IgWXbL8spWdKuvxdkmVBDg6X0IemV42aVJ2PbEuqZAATTJ6lAjeS3Nk7w+D9Oj4RdFp9ShPUbcEhJ/+Bj2t6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdS0SU9q5L4DPkniLBepLatDGxVSaUibcG8Wn24lI+s=;
 b=Y62WXeyu3Lp0ALLCah/k7c9Q2OGbXrNPHV+8vGwW2ZfbqN3Kl4y4OdZ6SSYu7b+mJQrAfsJhnjKNONxY7cu9lmpaWGdNyT/avXtqKomT7T78fML06lazKMQ5i1EfD9myRNjyLE/TAARfdYPe3gqcuFUVTncW2h/j99Dlwbi1my4=
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ef::11)
 by TY7P286MB7124.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 00:05:32 +0000
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a]) by TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8871:189c:6e56:c54a%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 00:05:32 +0000
From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
To: Ken Kurematsu <k.kurematsu@nskint.co.jp>, Randy MacLeod
	<randy.macleod@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Masahiro Mizutani <m.mizutani@nskint.co.jp>, Yoshitaka Ikeda
	<ikeda@nskint.co.jp>
Subject: RE: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
Thread-Index: Adxwm3RV7PLHzcUFTp6yQbLT2jCIAwC2WhaAAAnYezAAANmfQA==
Date: Tue, 23 Dec 2025 00:05:32 +0000
Message-ID: 
 <TYRP286MB59955A29B4B18B89EF4E939ADBB5A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
 <1883AE2C045A1BB3.1614991@lists.openembedded.org>
In-Reply-To: <1883AE2C045A1BB3.1614991@lists.openembedded.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRP286MB5995:EE_|TY7P286MB7124:EE_
x-ms-office365-filtering-correlation-id: 458aea4b-9098-49e9-8f45-08de41b6fd85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?OcePjypOLCIge5IMcw37jNgZMlhfUhTnrAwWVQlUKv/+Qr5F/ORoF5aAP6EV?=
 =?us-ascii?Q?wBJntkZfJLDzAe5pWuAEHvuxCk/97U7jqUi51UdjVlARof67+IaKZeOY/KP6?=
 =?us-ascii?Q?0ijencZDlPGHiJUgnRp62RmtslaMs0RoQfOXbFGu6pje6Mkbrrcy+bkAvKQt?=
 =?us-ascii?Q?bKjxHwvygcXq7D+Wkxt3HQ6ZLzxsA0folsM0VXrSezyG8SjHManBEv9f7rxk?=
 =?us-ascii?Q?33tcE82vFhWx67u1DWvMr5lElDpYk9gKS1jVMUwEc6GFpl91pzYYoUIMrNL9?=
 =?us-ascii?Q?EGt1Ov4F0Y2RxK9I6DDKEb/wkrn0gzGHhwysLXCrL+wMKwOvFBw4phJG1TT1?=
 =?us-ascii?Q?yafycSlXtsLJAUapaDDB/CdYuMxr9j09Whif/75SUMioKS7jpv9yano7xLU/?=
 =?us-ascii?Q?IPxZkNVQeTPO8hVHSExr2dUUrpsWB4w/hzGstfL47wRDBQvn94eVMdJVC3MV?=
 =?us-ascii?Q?NxnOQavBv8vxVQ6PUgTkeEcSvRXuBbgcZvYlel04YxT4vXiEWzRMHLZsxJNc?=
 =?us-ascii?Q?IU1XZgGPzXl49LEaybjX3YCLNuS3JT9XDy0js4epIfuJBn3sfUhUDh6JBQnj?=
 =?us-ascii?Q?28qZFyIPQBqTOtBArJuISXunqyINq0TK8pDizQVfnDX/QhX+QZ7ux7meyRnE?=
 =?us-ascii?Q?pL2smmDdk3dvQ8hDKRc/+X46jIMt4+hKkMFh4BBFSWqU5dkiSv/SV6/WnoNj?=
 =?us-ascii?Q?Uc6gfT1iUedgPAyrogRfszbAU0S2MZhU/iRpMqWl33aaKOuWryVM6E1z6ERh?=
 =?us-ascii?Q?zqA4LKq6EgRV1HdP7RYDTCufxRt8lolt9LEqyABbR1uPTcKXWra+7HQx/QPt?=
 =?us-ascii?Q?63Lik4hkeu6vSt/upKZGX8gfEQQ8LvjntdT1R+nPfwd4im4ceNorbjcZgLeZ?=
 =?us-ascii?Q?lSRxqSZ9/cXFprMs0bRNAxJd7jRjGW7krRGlxG/Yo3JF7CSDfpCn7NjBM0aN?=
 =?us-ascii?Q?EpIJY2ZK0YWPGoO+PONZ+Dw3obr+3kBS9yOvVfdpi7wN4h4SXStC7ZbV2K88?=
 =?us-ascii?Q?DuvlRBbDR8coGRm0aerqg5Q0+2YnETTPajEK7ZIEPRt6lMgGNYiPXLXM+O0N?=
 =?us-ascii?Q?5xvCjQuvq2M47DqSja88spBgTZbNGaSjotIxTmpEpIVUDiw9pL+ia/8RbbL1?=
 =?us-ascii?Q?4xFimVjr1LLuea9eqRA6z/pT/VOh3x2Lg4U/NsHTKWoCG/aRVaJuunnBaSut?=
 =?us-ascii?Q?vzth8Um2FBaki74l/F8v44r/9ZXq56RwxujeWtx4ub8nGVBlpkqNaMQicXJd?=
 =?us-ascii?Q?6Yz5KuPH7J1P8MYK4FKyW65X2COg4sdlhykkKYPIjvsHty2tBLHjVAKrkREs?=
 =?us-ascii?Q?OmwaWot1OrXaDSkZXuN7Z0koRQU3z7fZtYpHFJ1CxBOd0ycxMRSjvFWMTUjN?=
 =?us-ascii?Q?Q489uKyViRs8ewON1R/5+WQkzHKN3NL82vMPyW4/XcQRCP231c3XMuvhfgu9?=
 =?us-ascii?Q?v4hTQ5Vs8snA1fhaJ3mFc3gDhb0Yra6nhOjkX7sowSd5b9+qLH3qu8c5mE9c?=
 =?us-ascii?Q?z61FRqVzPKBMsZqtMCFaA4p5trcNLVcvO2YB?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(8096899003)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GnMYrOet24QdCqRiUW11BIYmDbc2lnqY+3cBb3mzcaL0aGIkbtz6UAS9Peix?=
 =?us-ascii?Q?7RG9AF0XIG4Aw7g1/utlsIr0icbinjkqGkdWb+mVxH+3zQZZdPY+kY4BeFK8?=
 =?us-ascii?Q?2+7GBiMxkPJzYwVBmWerfpSdSQZ1I/unFEQdNbJi7rekAKNUc6m6yUXXc2pm?=
 =?us-ascii?Q?FfeV4hs28CuJ/sjqhtpuhhE4hcfhaj8Kt9l4vH2aEZKQPsX20TrOkQqfnF3y?=
 =?us-ascii?Q?bEwI38bIbsBaaFMG8JM3IGOeUi37tlTBd3GJSjbVMKeFayG/xlNBNpZPbhgC?=
 =?us-ascii?Q?+6HR/3hd/UlCMgp/Lk5/ZXcK5NFF4+szLK0iGX/KNCX3tU8uQmq8IkA6xfM8?=
 =?us-ascii?Q?E7wz9GUxTtLNsUjgp5gFmkq3wpqPd0FiWC/5D3/c/lsg+/CdULtNm0bzyb8H?=
 =?us-ascii?Q?a2ZcoArJdz9LQ4sHLDgBpZvmrjlmwO0BVdeDAx1I0AelSxKSGiuzAFl/OW0B?=
 =?us-ascii?Q?0OvqTw6JEWe0rOJL+6VCfnfFgSDf3EHzpKu8ieCyL7JSd4lEzX+JdIBDenUw?=
 =?us-ascii?Q?pk4hnuNjD5CUAKxd8lYQ9cUG+7RfaEVgz6ITCn/0lDmQp3yov5SdUs92gUz9?=
 =?us-ascii?Q?UWwTNno/dQ4s2x48anN4K9H79dRA5kN3VhtmJ4I6AifKuv9achQLjfiK0qVp?=
 =?us-ascii?Q?sWuvMzXPgTe4IXzYmNTa6ixeHAQxv9dWvDVNMVLLQxNaFKSFWOw9daZdX60+?=
 =?us-ascii?Q?9+UGtBJv3//Jiw61kRuJTh2jF1KXHfOZbZdvoarqyBgYm1J3/j+QYVK8Dn3s?=
 =?us-ascii?Q?VclpaDVNjM1bnkSxXWjp7Ugk8Xvobtj+/ObWfdqMD33enjp80ioC/wGSUyE6?=
 =?us-ascii?Q?eFyoEwi0RRc3ob+Gep5I2ztT5mctpRMkdvuU6IH43NZUZOMpx8ScdnbWoxZ8?=
 =?us-ascii?Q?CmlW5YfCIk+dP2mfEtRNZvFDqoNLEOjc+1PPiaGU/bPV/nK0vNrTSO9H5/FR?=
 =?us-ascii?Q?OXdzrIsfL0wzKdh6VAXlYZFqzOaomuEJtcRgH/akBT+ih1RN/n+cJPFIGpDE?=
 =?us-ascii?Q?AEdIPAduchdZsIy579jgnEes2BS8YtZGrwq/fOUTDWgFJPTHKm54o9hCJ57v?=
 =?us-ascii?Q?zxU5IfDahLyC8GpFRv+u2lUD+s+DPys5lOnqnxBzAyIpLYNRkD0ErWYCFOcQ?=
 =?us-ascii?Q?6QE2wcFrG5az/7HNDeV3tofMc10yYP39tMTwHmucOea+PF6BlwjeICChFvNz?=
 =?us-ascii?Q?CbdyLEnOL1pVSWVtnpVvyL0jA2HDI6aJ6VGYk8MIlLGsZebTDdzfIEcvi7gZ?=
 =?us-ascii?Q?9IlhcqjbWReZaHpDAz9s0GLF/GlwADEo34p/BOrDSo6aazHIjKTF3Cb4zEat?=
 =?us-ascii?Q?Ks6z6mTgUyTQ9F4j/HRywNkjkG2SGpE+dbYH6BwtAX3Ynhw+iSthErmK7Biz?=
 =?us-ascii?Q?6x6vT8lDLIpVkKmCpTb326fr+NjzyVL27JekDBYrL6ZzWPSPiSoks0hXiZtU?=
 =?us-ascii?Q?gVDh5+ZkhbGFlxV5Fjedb8XPv9echDBbHgG9GHZ3w6hAJ+SSc2Qhx35+sEwH?=
 =?us-ascii?Q?FAhMRSAINDLFBRqnEdOit8Y1qPWNckAeqeuI3he6+N8Zl3jcNEqHSKFyf9OP?=
 =?us-ascii?Q?oKR9cCRZ0tFart0X72zixVAdJjyVn2iaSf5Qt6mAvLDuoS49kOAiMVfZk1xJ?=
 =?us-ascii?Q?bdyJMlS9OdcAq1KVCrpwEwN2zp2hQB602yKpeAJymKH1siiHP4OtgApRyl90?=
 =?us-ascii?Q?oLil+JFD4pI/XXsh3qPllI4P0TCMqQGRiK4s9AhNEgQ6sVxo2V0pS99gJMWk?=
 =?us-ascii?Q?pNCw6FeIZw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TYRP286MB59955A29B4B18B89EF4E939ADBB5ATYRP286MB5995JPNP_"
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 458aea4b-9098-49e9-8f45-08de41b6fd85
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 00:05:32.6398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2biT8FXqvn9Xtbone0EgE+zhnzt5RNoJ4WWeBn7GYX7Y/C64rpfrDJUOBhEeoQuCM4EzEe+KqHku/RVhjYjyQYu7+b6qQxHJb8/f/ClWoCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB7124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 00:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228443

--_000_TYRP286MB59955A29B4B18B89EF4E939ADBB5ATYRP286MB5995JPNP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Let me confirm one thing about your comment.

If I make the corrections as suggested in the comment, when I retrieve CVE_=
PRODUCT with bitbake-getvar,
only "theora" is included, not "libtheora".
(This is the result of an old test environment, but it was the same in 1.2.=
0)

$ bitbake-getvar -r libtheora CVE_PRODUCT
#
# $CVE_PRODUCT [2 operations]
#   set xxx/create-spdx-2.2.bbclass:11
#     [_defaultval] "${BPN}"
#   append xxx/libtheora_1.1.1.bb:23
#     "theora"
# pre-expansion value:
#   " theora"
CVE_PRODUCT=3D" theora"

If libtheora should be included, I think the following correction would be =
best. What do you think?
Sorry if I misunderstood.

CVE_PRODUCT =3D "${BPN} theora"


By the way, the NVD records have the following values, so I think theora al=
one will be fine.
(itheora is a different product)

$ sqlite3 downloads/CVE_CHECK/nvdcve_2-2.db .dump | grep theora
:
INSERT INTO PRODUCTS VALUES('CVE-2008-0797', 'itheora','itheora','1.0_rc1',=
'=3D','','');
INSERT INTO PRODUCTS VALUES('CVE-2024-56431', 'xiph','theora','','','1.2.0'=
,'<');
$

Best Regards.
--
Ken Kurematsu k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp>

From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Ken Kurematsu via lists.openembedded.org
Sent: Tuesday, December 23, 2025 8:43 AM
To: Randy MacLeod <randy.macleod@windriver.com>; openembedded-core@lists.op=
enembedded.org
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp>; Yoshitaka Ikeda <ikeda@nsk=
int.co.jp>; Ken Kurematsu <k.kurematsu@nskint.co.jp>
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT

Hi Randy,

Thank you for your review.
I will reflect your comments and post v2.

Best regards.
--
Ken Kurematsu <k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp>>

From: Randy MacLeod <randy.macleod@windriver.com<mailto:randy.macleod@windr=
iver.com>>
Sent: Tuesday, December 23, 2025 3:58 AM
To: Ken Kurematsu <k.kurematsu@nskint.co.jp<mailto:k.kurematsu@nskint.co.jp=
>>; openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp<mailto:m.mizutani@nskint.co.=
jp>>; Yoshitaka Ikeda <ikeda@nskint.co.jp<mailto:ikeda@nskint.co.jp>>
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT

Hi Ken,

On 2025-12-18 11:01 p.m., Ken Kurematsu via lists.openembedded.org wrote:

In the NVD database, the product name of libtheora is theora.

This was set to ensure that cve-check works correctly.



Signed-off-by: Ken Kurematsu <k.kurematsu@nskint.co.jp><mailto:k.kurematsu@=
nskint.co.jp>

---

 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++

 1 file changed, 2 insertions(+)



diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/re=
cipes-multimedia/libtheora/libtheora_1.2.0.bb

index 04de8507fb..bacaf3aee6 100644

--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb

+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb

@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D "ebdf77a8f5c0a8f7a9e42323844fa0950=
2b34eb1d1fece7b5f54da41fe



 UPSTREAM_CHECK_REGEX =3D "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"



+CVE_PRODUCT =3D "theora"

+



From YP patch review,
Please use:

CVE_PRODUCT +=3D "theora"



to catch both libtheora and theora





Thanks,



../Randy





 inherit autotools pkgconfig



 EXTRA_OECONF =3D "--disable-examples --disable-doc"








--

# Randy MacLeod

# Wind River Linux

--_000_TYRP286MB59955A29B4B18B89EF4E939ADBB5ATYRP286MB5995JPNP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"MS PGothic";}
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	font-size:12.0pt;
	font-family:"MS PGothic";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	margin:0mm;
	font-size:12.0pt;
	font-family:"MS Gothic";}
span.HTML
	{mso-style-name:"HTML \66F8\5F0F\4ED8\304D \(\6587\5B57\)";
	mso-style-priority:99;
	mso-style-link:"HTML \66F8\5F0F\4ED8\304D";
	font-family:"Courier New";}
span.23
	{mso-style-type:personal-reply;
	font-family:"Yu Gothic";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:99.25pt 30.0mm 30.0mm 30.0mm;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"JA" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-w=
ord">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Hi Randy,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Let me confirm one thing about your comment.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">If I make the corrections as suggested in the=
 comment, when I retrieve CVE_PRODUCT with bitbake-getvar,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">only &quot;theora&quot; is included, not &quo=
t;libtheora&quot;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">(This is the result of an old test environmen=
t, but it was the same in 1.2.0)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">$ bitbake-getvar -r libtheora CVE_PRODUCT<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"># $CVE_PRODUCT [2 operations]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp; set xxx/create-spdx-2.2.bbclass=
:11<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp; [_defaultval] &quot=
;${BPN}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp; append xxx/libtheora_1.1.1.bb:2=
3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp;&nbsp;&nbsp; &quot;theora&quot;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"># pre-expansion value:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">#&nbsp;&nbsp; &quot; theora&quot;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">CVE_PRODUCT=3D&quot; theora&quot;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">If libtheora should be included, I think the =
following correction would be best. What do you think?<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Sorry if I misunderstood.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">CVE_PRODUCT =3D &quot;${BPN} theora&quot;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">By the way, the NVD records have the followin=
g values, so I think theora alone will be fine.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">(itheora is a different product)<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">$ sqlite3 downloads/CVE_CHECK/nvdcve_2-2.db .=
dump | grep theora<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">INSERT INTO PRODUCTS VALUES('CVE-2008-0797', =
'itheora','itheora','1.0_rc1','=3D','','');<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">INSERT INTO PRODUCTS VALUES('CVE-2024-56431',=
 'xiph','theora','','','1.2.0','&lt;');<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">$<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Best Regards.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">--<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Ken Kurematsu
<a href=3D"mailto:k.kurematsu@nskint.co.jp">k.kurematsu@nskint.co.jp</a><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;
<b>On Behalf Of </b>Ken Kurematsu via lists.openembedded.org<br>
<b>Sent:</b> Tuesday, December 23, 2025 8:43 AM<br>
<b>To:</b> Randy MacLeod &lt;randy.macleod@windriver.com&gt;; openembedded-=
core@lists.openembedded.org<br>
<b>Cc:</b> Masahiro Mizutani &lt;m.mizutani@nskint.co.jp&gt;; Yoshitaka Ike=
da &lt;ikeda@nskint.co.jp&gt;; Ken Kurematsu &lt;k.kurematsu@nskint.co.jp&g=
t;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT<o:p></o:p>=
</span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Hi Randy,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Thank you for your review.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">I will reflect your comments and post v2.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Best regards.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">--<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;">Ken Kurematsu &lt;<a href=3D"mailto:k.kuremat=
su@nskint.co.jp">k.kurematsu@nskint.co.jp</a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Yu Gothic&quot;"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0mm 0mm 0mm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0mm =
0mm 0mm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macl=
eod@windriver.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, December 23, 2025 3:58 AM<br>
<b>To:</b> Ken Kurematsu &lt;<a href=3D"mailto:k.kurematsu@nskint.co.jp">k.=
kurematsu@nskint.co.jp</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-co=
re@lists.openembedded.org</a><br>
<b>Cc:</b> Masahiro Mizutani &lt;<a href=3D"mailto:m.mizutani@nskint.co.jp"=
>m.mizutani@nskint.co.jp</a>&gt;; Yoshitaka Ikeda &lt;<a href=3D"mailto:ike=
da@nskint.co.jp">ikeda@nskint.co.jp</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT<o:p></o:p>=
</span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Ken,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 2025-12-18 11:01 p.m., Ken K=
urematsu via lists.openembedded.org wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><span lang=3D"EN-US">In the NVD database, the product name of libtheor=
a is theora.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">This was set to ensure that cve-check works corre=
ctly.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">Signed-off-by: Ken Kurematsu <a href=3D"mailto:k.=
kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a><o:p></o:p></sp=
an></pre>
<pre><span lang=3D"EN-US">---<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"> meta/recipes-multimedia/libtheora/libtheora_1.2.=
0.bb | 2 ++<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"> 1 file changed, 2 insertions(+)<o:p></o:p></span=
></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">diff --git a/meta/recipes-multimedia/libtheora/li=
btheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb<o:p=
></o:p></span></pre>
<pre><span lang=3D"EN-US">index 04de8507fb..bacaf3aee6 100644<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US">--- a/meta/recipes-multimedia/libtheora/libtheora=
_1.2.0.bb<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">+++ b/meta/recipes-multimedia/libtheora/libtheora=
_1.2.0.bb<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">@@ -14,6 +14,8 @@ SRC_URI[sha256sum] =3D &quot;eb=
df77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe<o:p></o:p></span><=
/pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"> UPSTREAM_CHECK_REGEX =3D &quot;libtheora-(?P&lt;=
pver&gt;\d+(\.\d)+)\.(tar\.gz|tgz)&quot;<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">+CVE_PRODUCT =3D &quot;theora&quot;<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US">+<o:p></o:p></span></pre>
</blockquote>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">From YP patch review,<o:p></o:p></span></pre>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
Please use:<o:p></o:p></span></p>
<pre><span lang=3D"EN-US">CVE_PRODUCT +=3D &quot;theora&quot;<o:p></o:p></s=
pan></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">to catch both libtheora and theora<o:p></o:p></sp=
an></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">Thanks, <o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">../Randy<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"> inherit autotools pkgconfig<o:p></o:p></span></p=
re>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"> EXTRA_OECONF =3D &quot;--disable-examples --disa=
ble-doc&quot;<o:p></o:p></span></pre>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
<o:p>&nbsp;</o:p></span></p>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
</blockquote>
<p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<pre><span lang=3D"EN-US">-- <o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"># Randy MacLeod<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"># Wind River Linux<o:p></o:p></span></pre>
</div>
</div>
</div>
</body>
</html>

--_000_TYRP286MB59955A29B4B18B89EF4E939ADBB5ATYRP286MB5995JPNP_--

