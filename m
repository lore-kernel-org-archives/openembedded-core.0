Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DF9EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:14:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6841.1686917664824504248
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mf9HWYnS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55315b4ca9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAc43B015286
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:14:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=VQzqfVh7qPBnruVgOPCpjxDKGBvjnOu/69TYgsHsqDc=;
 b=mf9HWYnSti/Q3aP03pxNp6GG1giBEh+enbcPn5LEnxWXYTXhEpQHZpqFYQ0/53L2vFEO
 LGvAZT5ZjLnUjlkGmqnI4OFNt/o3AmhzDJrTf67t+aZfcALN3as5qCBfS6aRPm8SZZ0y
 xPFF9ajRekVhl3MMTVJ/EFssVpFkTmvHuRj0qW27UDYoHMEH1gQ8ZYMuakVuAaOgwiTT
 F0kHb+r+Jf+e+yxNVcVWeL+v3WDVTSCIWbcnnaWL342euyz2q+8Vbyf86Wb04v6yUypx
 3zgVehFuiViFzZOv3XkUtAar+JtG7gNXyYpEQ0UbEChRQlnFkVd6D9/umtr+qLo4qF0e zQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphnswj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcA5Kh/CSKPQQbILGZMGfy7q4nTiZBQZWzP0Rmjo7068DjOd8tpPzZuEu9/I0vizv2qL7TehBi6073ndzaWzv0N5zO6ZRZzVr3AhU3zo/lof1fDUl8hDaTII63CD0rWO49tkjimZs6mzWxZoXXuW5j0lsEFDEw1E/4dRB9N47FDpBKLcHeG/OUEszN9tTRmz8kunlyBC9oI8/VhQIOLD6JWMB00aGmxVu6P4+6AJ+ts+T6Oh2uzylts6yJFWCsp8KZcvZ5XCdLPR1wE2NR+NRzEHmDQxuHCh/khLp1ADDVTO212B7lW9n9lr6bnMTihMmYO0N1hw0LzGZwrkI9CINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQzqfVh7qPBnruVgOPCpjxDKGBvjnOu/69TYgsHsqDc=;
 b=PjIXAtYDNi79TtVFuAGhjxOueW1tUcd8CSuQW+vug3DHTWCyAUArAbw4faeLr9Dl9Li6y2FFjtu5355HsFuInvD39EzgKoeFRqnR5YucimtRSvhTKPGFJjsAgiXzBtIP3tBOlCj/za8iZjTJ29mSyAWLmW3p/cyGyq1JYULmwaq+vJpzvgb5O5VzHidQH0jCh+8kFuFMySf1o/QKAQ+LFz9eSX+AW5nsO6NxBh5l5Eq8xYj7p/rEWDbNRYiyCT58PZwE3i5aFx8Qe4DENc/GkT6hXA+VEaCLGAQb9DjaN62yte/7DBhGvUK236PfeXIlVc0i2VkTfjd0wkhoDKjOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 12:14:20 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Fri, 16 Jun 2023
 12:14:20 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] samba:
 fix CVE-2022-3437
Thread-Topic: [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] samba:
 fix CVE-2022-3437
Thread-Index: AQHZoEvK1gvtkx+1Kk2FhXZVhc3ola+NV3kK
Date: Fri, 16 Jun 2023 12:14:20 +0000
Message-ID: 
 <MW4PR11MB582212EA2E51E248C704E3EC8458A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <1769227C79DC136A.12727@lists.openembedded.org>
In-Reply-To: <1769227C79DC136A.12727@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH7PR11MB6007:EE_
x-ms-office365-filtering-correlation-id: 15b17d4e-38ac-4740-b71e-08db6e6336b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7T0pO63eORR2E25ag5j0VBo4xtlMo++p34WVHFF2dp8Pxn54Iz9qf3PZaQbZX03yjpScCPvDt25VV2nnasuireuhqp2bdB1We5MP4C045p9xVcav7Xfq4q8YqUk7joW0NyR89VOkuCi4LjSXZ+J4w3DWt0KAOY++3+0bAL4M4iSGh/ayjYDiNG5VKVKUmj+4dUNPvNAqq1S1Dj9zCpXb+pTLhkTKSqRyJmvmV2dRoHn/WttxXvuSulZk/lR7JqtQDo4WhzZLr7l5AvuiBnlikAOjE+C0oMQqWRf0uE4/FMI4wMea673mK+lgGAbLon+25cnBsEKGbXjEQq3gVarlkAYwP5AMN+Wd7AniBZd/okDjHbaNLFUMbDcAIVPwx2Lf4//7Cf0iCfotqZnB7iLYYgbB8ZiRfrGNUzN99NCOU3K4C7dn7RZqCA4mydjxxqMUGsq2szJmxIvMf1Tytx8UdgCKLHaPLqDIzlQmQqTdRkjIpy15F0z9aDZXkCl7ggisH9NbKYVSYWUZrvY6lkl/VGxH5uJd6ww2Rlu8+cEpVGZXw43zPBCoL7PecEYTKBVYAlhR4IhlWCq8/Blqi3gSiOSef35B3RJ7c1jfhld80BQhiftKXFKcj+M32SImPVjaez8XzOkTVExPCvqiCb9oAg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(110136005)(41300700001)(8676002)(86362001)(7696005)(64756008)(66946007)(66476007)(66556008)(66446008)(8936002)(316002)(33656002)(71200400001)(19627405001)(91956017)(4326008)(76116006)(38070700005)(478600001)(107886003)(9686003)(30864003)(55016003)(26005)(5660300002)(166002)(966005)(52536014)(83380400001)(6506007)(55236004)(2906002)(186003)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2B3vk9gZVbiYLv//OjbQFFZ7QqYB+bfgPw3nduxQEm2u2gDISl/FOb4jYsUA?=
 =?us-ascii?Q?xOFt8JmTpOyJM997NdHo4T1FhSRYrqaZbtaKWBxRBbiyn2hjDHBE4sT2VRy3?=
 =?us-ascii?Q?rdo3y2K8KMAye5QBWvEwQsu4xTUVmy+mSMMfXc8dEmKE6f0liC6+fA0u7RQr?=
 =?us-ascii?Q?LcaMMuT3G4eOcLPQveh3QCQpI3pySbPXxkJQQqd6wjPwaVFJh069gsc+ICQO?=
 =?us-ascii?Q?ECUF19RSuFruSI7XK7lxvMhReju7NjnDxvTjOugiwV0QnlYe8DZ7Ji/VFL5y?=
 =?us-ascii?Q?57SDejNhpG22kepgmEsLTNDRoGFs/n8rLmiJsfviuJFqlFYpxS4cFnJpkcMn?=
 =?us-ascii?Q?bNPu0iJUHD52E2+06wIRnse6RR5QxxNDB0iLzBxzfWXVwuyrmh0bdE4c4a4A?=
 =?us-ascii?Q?5ME86QCwhGg15tGwVKiY7fRJS326uh5FV6i5KGHi+FY5rTSnoS0Pms+PwDOz?=
 =?us-ascii?Q?aOecp4TEQVmdaQnyapck4TQvU5/gFvzZandApJCqx4o05yLby5Dp+jzuvHVb?=
 =?us-ascii?Q?1Kb1Bx6f/JSNznZ95eNFyyoo9c0J+15XgKK4aha5PnrFQz4Csnxn5lWJsm+s?=
 =?us-ascii?Q?CzWt1PcX+JJy1RhjvD1452a6RYi7P+7zkAFTdx3DsK8c8xOtRieAGfacJOCR?=
 =?us-ascii?Q?Vt+UJQAG7q4jzw5NnuXfcZuRY34AtneUwsCYJnE9mgagYd1AvsbKnZmCXjzJ?=
 =?us-ascii?Q?+WKCO3e8eayOVkOhHswjaS+F1+PE1OlRfXIiJKz2eoeYKMoN1yk+LkmUgtyp?=
 =?us-ascii?Q?EHe8V6VvLpqPKlQd5R8P0/w9LIUK1vxXNlAUx3Stay5kL14nqe2VYzhu2Ctw?=
 =?us-ascii?Q?nqoIlkTIW52UrLo0OP18WAywrquIHBiQ1BJkijwBehfRD1CwzFDh4Fx9IPOr?=
 =?us-ascii?Q?H5RIlVqjsWWE/wz/vg6Y0RKzAAR7MQ4d9uysd7LFnOKbfkfYHvRUZJZEtzNw?=
 =?us-ascii?Q?9hc5vbP153rQhK8EjD1/gixZnpCLOZvrCba6lzTm9Nzpx2dHgDg9MTP5168x?=
 =?us-ascii?Q?xa96OuRkmptTdWaU4YZUOEOqOrdUl/TLqbUTDbS0LSlBSlyD7DNHkNSWwAAm?=
 =?us-ascii?Q?z/FOrrkmcDrYIfNmAsL+prl4HOtg8fxPa3/5fy+Qx94Bsew9Wlq7ATJGCs5z?=
 =?us-ascii?Q?Vch36LWN5YRHfTfDvDXXRPk/K6qRWkj/lDpZroi9izvxJEYGsmNDCIRUZDgV?=
 =?us-ascii?Q?ueXx9yPdtAoL2sH9I+byT60Bf95FeuEhJRK+VkniN1RnEt4hJZD7YvwwEoI/?=
 =?us-ascii?Q?x3U11sdaP4A2KccrCM2yWPwpBnuCzirsG0heagw7zLw92mGbIgoCdk+TFo5z?=
 =?us-ascii?Q?v8rYSXm/cJ0N8yJ0hvRwh3ClEH3jz7U72T5ta6wH8Li61bDFjlimJaQ1jF6X?=
 =?us-ascii?Q?Twfbi8V4FBhwBmm/WgjkzZOAy0bdp/Cqjqew7YEgYiAZF2h8PEVqbZXZmD+B?=
 =?us-ascii?Q?n90o2rmkggTXWmk/nvYQz+w3t3LHe+uXZP/BRo9xMXfi1HLyFe0Phv2VCMsn?=
 =?us-ascii?Q?P6jn7KsqGwKYE6Pl251hduOINyo0olwwXKkidQPvGg9RtkswC+npHjimNDfC?=
 =?us-ascii?Q?jdQOaAKUC0kMlwL3CZMtpVA7DUIEMxTJwBzjhCj1aWJ6G5bKaKt6K2CHKlIJ?=
 =?us-ascii?Q?CA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582212EA2E51E248C704E3EC8458AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b17d4e-38ac-4740-b71e-08db6e6336b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 12:14:20.1170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcHfZXA6Oi/RD/hxjt2S4aOViPCwv7hGJSKHf1lkVs6tNDOfeL97eT/K4iePboTDVxeYGzMHngo6ZqdV23DL9DT9c/AQB930goWfrKEQncafdDaCvEyYc1XLwAC+Fitq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-Proofpoint-ORIG-GUID: mEaS9w_NsIi0jCgc_TXEJwC2GqfOqWVH
X-Proofpoint-GUID: mEaS9w_NsIi0jCgc_TXEJwC2GqfOqWVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183015

--_000_MW4PR11MB582212EA2E51E248C704E3EC8458AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, June 16, 2023 5:40 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] samba: fi=
x CVE-2022-3437

A heap-based buffer overflow vulnerability was found in Samba within
the GSSAPI unwrap_des() and unwrap_des3() routines of Heimdal. The
DES and Triple-DES decryption routines in the Heimdal GSSAPI library
allow a length-limited write buffer overflow on malloc() allocated
memory when presented with a maliciously small packet. This flaw
allows a remote user to send specially crafted malicious data to the
application, possibly resulting in a denial of service (DoS) attack.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-3437

Upstream patches:
https://github.com/heimdal/heimdal/commit/f6edaafcfefd843ca1b1a041f942a853d=
85ee7c3
https://github.com/heimdal/heimdal/commit/c9cc34334bd64b08fe91a2f720262462e=
9f6bb49
https://github.com/heimdal/heimdal/commit/a587a4bcb28d5b9047f332573b1e7c8f8=
9ca3edd
https://github.com/heimdal/heimdal/commit/c758910eaad3c0de2cfb68830a661c473=
9675a7d
https://github.com/heimdal/heimdal/commit/414b2a77fd61c26d64562e3800dc5578d=
9d0f15d
https://github.com/heimdal/heimdal/commit/be9bbd93ed8f204b4bc1b92d1bc3c16aa=
c194696
https://github.com/heimdal/heimdal/commit/c8407ca079294d76a5ed140ba5b546f87=
0d23ed2
https://github.com/heimdal/heimdal/commit/8fb508a25a6a47289c73e3f4339352a73=
a396eef

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-3437-0001.patch      | 77 +++++++++++++++++++
 .../samba/samba/CVE-2022-3437-0002.patch      | 35 +++++++++
 .../samba/samba/CVE-2022-3437-0003.patch      | 50 ++++++++++++
 .../samba/samba/CVE-2022-3437-0004.patch      | 57 ++++++++++++++
 .../samba/samba/CVE-2022-3437-0005.patch      | 37 +++++++++
 .../samba/samba/CVE-2022-3437-0006.patch      | 65 ++++++++++++++++
 .../samba/samba/CVE-2022-3437-0007.patch      | 39 ++++++++++
 .../samba/samba/CVE-2022-3437-0008.patch      | 48 ++++++++++++
 .../samba/samba_4.14.14.bb                    |  8 ++
 9 files changed, 416 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0002.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0003.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0004.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0005.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0006.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0007.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-3437-0008.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0001.patch
new file mode 100644
index 000000000..abc778b73
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.p=
atch
@@ -0,0 +1,77 @@
+From f6edaafcfefd843ca1b1a041f942a853d85ee7c3 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:13 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Use constant-time memcmp() for arc=
four
+ unwrap
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/f6eda=
afcfefd843ca1b1a041f942a853d85ee7c3]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/arcfour.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/lib/gssapi/krb5/arcfour.c b/lib/gssapi/krb5/arcfour.c
+index a61f768..4fc46ce 100644
+--- a/lib/gssapi/krb5/arcfour.c
++++ b/lib/gssapi/krb5/arcfour.c
+@@ -365,7 +365,7 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,
+       return GSS_S_FAILURE;
+     }
+
+-    cmp =3D ct_memcmp(cksum_data, p + 8, 8);
++    cmp =3D (ct_memcmp(cksum_data, p + 8, 8) =3D=3D 0);
+     if (cmp) {
+       *minor_status =3D 0;
+       return GSS_S_BAD_MIC;
+@@ -385,9 +385,9 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,
+     _gsskrb5_decode_be_om_uint32(SND_SEQ, &seq_number);
+
+     if (context_handle->more_flags & LOCAL)
+-      cmp =3D memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4);
++      cmp =3D (ct_memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4) !=3D 0);
+     else
+-      cmp =3D memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4);
++      cmp =3D (ct_memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4) !=3D 0);
+
+     memset(SND_SEQ, 0, sizeof(SND_SEQ));
+     if (cmp !=3D 0) {
+@@ -656,9 +656,9 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_stat=
us,
+     _gsskrb5_decode_be_om_uint32(SND_SEQ, &seq_number);
+
+     if (context_handle->more_flags & LOCAL)
+-      cmp =3D memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4);
++      cmp =3D (ct_memcmp(&SND_SEQ[4], "\xff\xff\xff\xff", 4) !=3D 0);
+     else
+-      cmp =3D memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4);
++      cmp =3D (ct_memcmp(&SND_SEQ[4], "\x00\x00\x00\x00", 4) !=3D 0);
+
+     if (cmp !=3D 0) {
+       *minor_status =3D 0;
+@@ -730,7 +730,7 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_stat=
us,
+       return GSS_S_FAILURE;
+     }
+
+-    cmp =3D ct_memcmp(cksum_data, p0 + 16, 8); /* SGN_CKSUM */
++    cmp =3D (ct_memcmp(cksum_data, p0 + 16, 8) =3D=3D 0); /* SGN_CKSUM */
+     if (cmp) {
+       _gsskrb5_release_buffer(minor_status, output_message_buffer);
+       *minor_status =3D 0;
+@@ -1266,9 +1266,9 @@ _gssapi_unwrap_iov_arcfour(OM_uint32 *minor_status,
+     _gsskrb5_decode_be_om_uint32(snd_seq, &seq_number);
+
+     if (ctx->more_flags & LOCAL) {
+-      cmp =3D memcmp(&snd_seq[4], "\xff\xff\xff\xff", 4);
++      cmp =3D (ct_memcmp(&snd_seq[4], "\xff\xff\xff\xff", 4) !=3D 0);
+     } else {
+-      cmp =3D memcmp(&snd_seq[4], "\x00\x00\x00\x00", 4);
++      cmp =3D (ct_memcmp(&snd_seq[4], "\x00\x00\x00\x00", 4) !=3D 0);
+     }
+     if (cmp !=3D 0) {
+       *minor_status =3D 0;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0002.patch
new file mode 100644
index 000000000..5686df78e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.p=
atch
@@ -0,0 +1,35 @@
+From c9cc34334bd64b08fe91a2f720262462e9f6bb49 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:55 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Use constant-time memcmp() in
+ unwrap_des3()
+
+The surrounding checks all use ct_memcmp(), so this one was presumably
+meant to as well.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/c9cc3=
4334bd64b08fe91a2f720262462e9f6bb49]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index da939c0529..61a341ee43 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -227,7 +227,7 @@ unwrap_des3
+   if (ret)
+       return ret;
+
+-  if (memcmp (p, "\x04\x00", 2) !=3D 0) /* HMAC SHA1 DES3_KD */
++  if (ct_memcmp (p, "\x04\x00", 2) !=3D 0) /* HMAC SHA1 DES3_KD */
+     return GSS_S_BAD_SIG;
+   p +=3D 2;
+   if (ct_memcmp (p, "\x02\x00", 2) =3D=3D 0) {
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0003.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0003.patch
new file mode 100644
index 000000000..55239356e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.p=
atch
@@ -0,0 +1,50 @@
+From a587a4bcb28d5b9047f332573b1e7c8f89ca3edd Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:42 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Don't pass NULL pointers to memcpy=
()
+ in DES unwrap
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/a587a=
4bcb28d5b9047f332573b1e7c8f89ca3edd]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index 61a341ee43..d3987240dd 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -180,9 +180,10 @@ unwrap_des
+   output_message_buffer->value  =3D malloc(output_message_buffer->length)=
;
+   if(output_message_buffer->length !=3D 0 && output_message_buffer->value=
 =3D=3D NULL)
+       return GSS_S_FAILURE;
+-  memcpy (output_message_buffer->value,
+-        p + 24,
+-        output_message_buffer->length);
++  if (output_message_buffer->value !=3D NULL)
++      memcpy (output_message_buffer->value,
++            p + 24,
++            output_message_buffer->length);
+   return GSS_S_COMPLETE;
+ }
+ #endif
+@@ -374,9 +375,10 @@ unwrap_des3
+   output_message_buffer->value  =3D malloc(output_message_buffer->length)=
;
+   if(output_message_buffer->length !=3D 0 && output_message_buffer->value=
 =3D=3D NULL)
+       return GSS_S_FAILURE;
+-  memcpy (output_message_buffer->value,
+-        p + 36,
+-        output_message_buffer->length);
++  if (output_message_buffer->value !=3D NULL)
++      memcpy (output_message_buffer->value,
++            p + 36,
++            output_message_buffer->length);
+   return GSS_S_COMPLETE;
+ }
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0004.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0004.patch
new file mode 100644
index 000000000..4e750f0dc
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.p=
atch
@@ -0,0 +1,57 @@
+From c758910eaad3c0de2cfb68830a661c4739675a7d Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 15 Aug 2022 16:53:45 +1200
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Avoid undefined behaviour in
+ _gssapi_verify_pad()
+
+By decrementing 'pad' only when we know it's safe, we ensure we can't
+stray backwards past the start of a buffer, which would be undefined
+behaviour.
+
+In the previous version of the loop, 'i' is the number of bytes left to
+check, and 'pad' is the current byte we're checking. 'pad' was
+decremented at the end of each loop iteration. If 'i' was 1 (so we
+checked the final byte), 'pad' could potentially be pointing to the
+first byte of the input buffer, and the decrement would put it one
+byte behind the buffer.
+
+That would be undefined behaviour.
+
+The patch changes it so that 'pad' is the byte we previously checked,
+which allows us to ensure that we only decrement it when we know we
+have a byte to check.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/c7589=
10eaad3c0de2cfb68830a661c4739675a7d]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/decapsulate.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c
+index 86085f5695..4e3fcd659e 100644
+--- a/lib/gssapi/krb5/decapsulate.c
++++ b/lib/gssapi/krb5/decapsulate.c
+@@ -193,13 +193,13 @@ _gssapi_verify_pad(gss_buffer_t wrapped_token,
+     if (wrapped_token->length < 1)
+       return GSS_S_BAD_MECH;
+
+-    pad =3D (u_char *)wrapped_token->value + wrapped_token->length - 1;
+-    padlength =3D *pad;
++    pad =3D (u_char *)wrapped_token->value + wrapped_token->length;
++    padlength =3D pad[-1];
+
+     if (padlength > datalen)
+       return GSS_S_BAD_MECH;
+
+-    for (i =3D padlength; i > 0 && *pad =3D=3D padlength; i--, pad--)
++    for (i =3D padlength; i > 0 && *--pad =3D=3D padlength; i--)
+       ;
+     if (i !=3D 0)
+       return GSS_S_BAD_MIC;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0005.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0005.patch
new file mode 100644
index 000000000..d6ea22e3d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.p=
atch
@@ -0,0 +1,37 @@
+From 414b2a77fd61c26d64562e3800dc5578d9d0f15d Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 15 Aug 2022 16:53:55 +1200
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check the result of
+ _gsskrb5_get_mech()
+
+We should make sure that the result of 'total_len - mech_len' won't
+overflow, and that we don't memcmp() past the end of the buffer.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/414b2=
a77fd61c26d64562e3800dc5578d9d0f15d]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/decapsulate.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c
+index 4e3fcd659e..031a621eab 100644
+--- a/lib/gssapi/krb5/decapsulate.c
++++ b/lib/gssapi/krb5/decapsulate.c
+@@ -80,6 +80,10 @@ _gssapi_verify_mech_header(u_char **str,
+
+     if (mech_len !=3D mech->length)
+       return GSS_S_BAD_MECH;
++    if (mech_len > total_len)
++      return GSS_S_BAD_MECH;
++    if (p - *str > total_len - mech_len)
++      return GSS_S_BAD_MECH;
+     if (ct_memcmp(p,
+                 mech->elements,
+                 mech->length) !=3D 0)
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0006.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0006.patch
new file mode 100644
index 000000000..9fa59c29b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.p=
atch
@@ -0,0 +1,65 @@
+From be9bbd93ed8f204b4bc1b92d1bc3c16aac194696 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 15 Aug 2022 16:54:23 +1200
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check buffer length against overfl=
ow
+ for DES{,3} unwrap
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/be9bb=
d93ed8f204b4bc1b92d1bc3c16aac194696]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index d3987240dd..fddb64bc53 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -64,6 +64,8 @@ unwrap_des
+
+   if (IS_DCE_STYLE(context_handle)) {
+      token_len =3D 22 + 8 + 15; /* 45 */
++     if (input_message_buffer->length < token_len)
++        return GSS_S_BAD_MECH;
+   } else {
+      token_len =3D input_message_buffer->length;
+   }
+@@ -76,6 +78,11 @@ unwrap_des
+   if (ret)
+       return ret;
+
++  len =3D (p - (u_char *)input_message_buffer->value)
++      + 22 + 8;
++  if (input_message_buffer->length < len)
++      return GSS_S_BAD_MECH;
++
+   if (memcmp (p, "\x00\x00", 2) !=3D 0)
+     return GSS_S_BAD_SIG;
+   p +=3D 2;
+@@ -216,6 +223,8 @@ unwrap_des3
+
+   if (IS_DCE_STYLE(context_handle)) {
+      token_len =3D 34 + 8 + 15; /* 57 */
++     if (input_message_buffer->length < token_len)
++        return GSS_S_BAD_MECH;
+   } else {
+      token_len =3D input_message_buffer->length;
+   }
+@@ -228,6 +237,11 @@ unwrap_des3
+   if (ret)
+       return ret;
+
++  len =3D (p - (u_char *)input_message_buffer->value)
++      + 34 + 8;
++  if (input_message_buffer->length < len)
++      return GSS_S_BAD_MECH;
++
+   if (ct_memcmp (p, "\x04\x00", 2) !=3D 0) /* HMAC SHA1 DES3_KD */
+     return GSS_S_BAD_SIG;
+   p +=3D 2;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0007.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0007.patch
new file mode 100644
index 000000000..b3197afc3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.p=
atch
@@ -0,0 +1,39 @@
+From c8407ca079294d76a5ed140ba5b546f870d23ed2 Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Mon, 10 Oct 2022 20:33:09 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check for overflow in
+ _gsskrb5_get_mech()
+
+If len_len is equal to total_len - 1 (i.e. the input consists only of a
+0x60 byte and a length), the expression 'total_len - 1 - len_len - 1',
+used as the 'len' parameter to der_get_length(), will overflow to
+SIZE_MAX. Then der_get_length() will proceed to read, unconstrained,
+whatever data follows in memory. Add a check to ensure that doesn't
+happen.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/c8407=
ca079294d76a5ed140ba5b546f870d23ed2]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/decapsulate.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c
+index 031a621eab..d7b75a6422 100644
+--- a/lib/gssapi/krb5/decapsulate.c
++++ b/lib/gssapi/krb5/decapsulate.c
+@@ -54,6 +54,8 @@ _gsskrb5_get_mech (const u_char *ptr,
+     e =3D der_get_length (p, total_len - 1, &len, &len_len);
+     if (e || 1 + len_len + len !=3D total_len)
+       return -1;
++    if (total_len < 1 + len_len + 1)
++      return -1;
+     p +=3D len_len;
+     if (*p++ !=3D 0x06)
+       return -1;
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0008.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0008.patch
new file mode 100644
index 000000000..6d6431221
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.p=
atch
@@ -0,0 +1,48 @@
+From 8fb508a25a6a47289c73e3f4339352a73a396eef Mon Sep 17 00:00:00 2001
+From: Joseph Sutton <josephsutton@catalyst.net.nz>
+Date: Wed, 12 Oct 2022 13:57:33 +1300
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Pass correct length to
+ _gssapi_verify_pad()
+
+We later subtract 8 when calculating the length of the output message
+buffer. If padlength is excessively high, this calculation can underflow
+and result in a very large positive value.
+
+Now we properly constrain the value of padlength so underflow shouldn't
+be possible.
+
+Samba BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15134
+
+Signed-off-by: Joseph Sutton <josephsutton@catalyst.net.nz>
+Reviewed-by: Andrew Bartlett <abartlet@samba.org>
+
+Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/8fb50=
8a25a6a47289c73e3f4339352a73a396eef]
+CVE: CVE-2022-3437
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/unwrap.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c
+index fddb64bc53..bab30f4501 100644
+--- a/lib/gssapi/krb5/unwrap.c
++++ b/lib/gssapi/krb5/unwrap.c
+@@ -124,7 +124,7 @@ unwrap_des
+   } else {
+     /* check pad */
+     ret =3D _gssapi_verify_pad(input_message_buffer,
+-                           input_message_buffer->length - len,
++                           input_message_buffer->length - len - 8,
+                            &padlength);
+     if (ret)
+         return ret;
+@@ -289,7 +289,7 @@ unwrap_des3
+   } else {
+     /* check pad */
+     ret =3D _gssapi_verify_pad(input_message_buffer,
+-                           input_message_buffer->length - len,
++                           input_message_buffer->length - len - 8,
+                            &padlength);
+     if (ret)
+         return ret;
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 53526a26b..39ba85194 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -22,6 +22,14 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0005-samba-build-dnsserver_common-code.patch \
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
+           file://CVE-2022-3437-0001.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-3437-0002.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-3437-0003.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-3437-0004.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-3437-0005.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-3437-0006.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-3437-0007.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-3437-0008.patch;patchdir=3Dsource4/heimdal \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0


--_000_MW4PR11MB582212EA2E51E248C704E3EC8458AMW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Please ignore this patch</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, June 16, 2023 5:40 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] sa=
mba: fix CVE-2022-3437</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">A heap-based buffer overflow vulnerability was fou=
nd in Samba within<br>
the GSSAPI unwrap_des() and unwrap_des3() routines of Heimdal. The<br>
DES and Triple-DES decryption routines in the Heimdal GSSAPI library<br>
allow a length-limited write buffer overflow on malloc() allocated<br>
memory when presented with a maliciously small packet. This flaw<br>
allows a remote user to send specially crafted malicious data to the<br>
application, possibly resulting in a denial of service (DoS) attack.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-3437">https://nvd.nist=
.gov/vuln/detail/CVE-2022-3437</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/heimdal/heimdal/commit/f6edaafcfefd843ca1b1a0=
41f942a853d85ee7c3">https://github.com/heimdal/heimdal/commit/f6edaafcfefd8=
43ca1b1a041f942a853d85ee7c3</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/c9cc34334bd64b08fe91a2=
f720262462e9f6bb49">https://github.com/heimdal/heimdal/commit/c9cc34334bd64=
b08fe91a2f720262462e9f6bb49</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/a587a4bcb28d5b9047f332=
573b1e7c8f89ca3edd">https://github.com/heimdal/heimdal/commit/a587a4bcb28d5=
b9047f332573b1e7c8f89ca3edd</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/c758910eaad3c0de2cfb68=
830a661c4739675a7d">https://github.com/heimdal/heimdal/commit/c758910eaad3c=
0de2cfb68830a661c4739675a7d</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/414b2a77fd61c26d64562e=
3800dc5578d9d0f15d">https://github.com/heimdal/heimdal/commit/414b2a77fd61c=
26d64562e3800dc5578d9d0f15d</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/be9bbd93ed8f204b4bc1b9=
2d1bc3c16aac194696">https://github.com/heimdal/heimdal/commit/be9bbd93ed8f2=
04b4bc1b92d1bc3c16aac194696</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/c8407ca079294d76a5ed14=
0ba5b546f870d23ed2">https://github.com/heimdal/heimdal/commit/c8407ca079294=
d76a5ed140ba5b546f870d23ed2</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/8fb508a25a6a47289c73e3=
f4339352a73a396eef">https://github.com/heimdal/heimdal/commit/8fb508a25a6a4=
7289c73e3f4339352a73a396eef</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../samba/samba/CVE-2022-3437-0001.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 77 +++++++++++++++++++<br>
&nbsp;.../samba/samba/CVE-2022-3437-0002.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 35 +++++++++<br>
&nbsp;.../samba/samba/CVE-2022-3437-0003.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 50 ++++++++++++<br>
&nbsp;.../samba/samba/CVE-2022-3437-0004.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 57 ++++++++++++++<br>
&nbsp;.../samba/samba/CVE-2022-3437-0005.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 37 +++++++++<br>
&nbsp;.../samba/samba/CVE-2022-3437-0006.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 65 ++++++++++++++++<br>
&nbsp;.../samba/samba/CVE-2022-3437-0007.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 39 ++++++++++<br>
&nbsp;.../samba/samba/CVE-2022-3437-0008.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 48 ++++++++++++<br>
&nbsp;.../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 8 ++<br>
&nbsp;9 files changed, 416 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0001.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0002.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0003.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0004.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0005.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0006.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0007.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-3437-0008.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0001.patch<br>
new file mode 100644<br>
index 000000000..abc778b73<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.p=
atch<br>
@@ -0,0 +1,77 @@<br>
+From f6edaafcfefd843ca1b1a041f942a853d85ee7c3 Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Wed, 12 Oct 2022 13:57:13 +1300<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Use constant-time memcmp() for arc=
four<br>
+ unwrap<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/f6edaafcfefd843ca1b1a041f942a853d85ee7c3">https://github.com/heimdal/=
heimdal/commit/f6edaafcfefd843ca1b1a041f942a853d85ee7c3</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/arcfour.c | 16 ++++++++--------<br>
+ 1 file changed, 8 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/lib/gssapi/krb5/arcfour.c b/lib/gssapi/krb5/arcfour.c<br>
+index a61f768..4fc46ce 100644<br>
+--- a/lib/gssapi/krb5/arcfour.c<br>
++++ b/lib/gssapi/krb5/arcfour.c<br>
+@@ -365,7 +365,7 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_FAILURE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; cmp =3D ct_memcmp(cksum_data, p + 8, 8);<br>
++&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(cksum_data, p + 8, 8) =3D=3D 0);<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cmp) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *minor_status =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MIC;<br>
+@@ -385,9 +385,9 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp; _gsskrb5_decode_be_om_uint32(SND_SEQ, &amp;seq_nu=
mber);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (context_handle-&gt;more_flags &amp; LOCAL)<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D memcmp(&amp;SND_SEQ[4], &quot;\xff=
\xff\xff\xff&quot;, 4);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(&amp;SND_SEQ[4], &quot;=
\xff\xff\xff\xff&quot;, 4) !=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D memcmp(&amp;SND_SEQ[4], &quot;\x00=
\x00\x00\x00&quot;, 4);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(&amp;SND_SEQ[4], &quot;=
\x00\x00\x00\x00&quot;, 4) !=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; memset(SND_SEQ, 0, sizeof(SND_SEQ));<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cmp !=3D 0) {<br>
+@@ -656,9 +656,9 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_stat=
us,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; _gsskrb5_decode_be_om_uint32(SND_SEQ, &amp;seq_nu=
mber);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (context_handle-&gt;more_flags &amp; LOCAL)<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D memcmp(&amp;SND_SEQ[4], &quot;\xff=
\xff\xff\xff&quot;, 4);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(&amp;SND_SEQ[4], &quot;=
\xff\xff\xff\xff&quot;, 4) !=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D memcmp(&amp;SND_SEQ[4], &quot;\x00=
\x00\x00\x00&quot;, 4);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(&amp;SND_SEQ[4], &quot;=
\x00\x00\x00\x00&quot;, 4) !=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cmp !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *minor_status =3D 0;<br>
+@@ -730,7 +730,7 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_stat=
us,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_FAILURE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; cmp =3D ct_memcmp(cksum_data, p0 + 16, 8); /* SGN_CKSU=
M */<br>
++&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(cksum_data, p0 + 16, 8) =3D=3D 0); =
/* SGN_CKSUM */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cmp) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _gsskrb5_release_buffer(minor_status,=
 output_message_buffer);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *minor_status =3D 0;<br>
+@@ -1266,9 +1266,9 @@ _gssapi_unwrap_iov_arcfour(OM_uint32 *minor_status,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp; _gsskrb5_decode_be_om_uint32(snd_seq, &amp;seq_nu=
mber);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (ctx-&gt;more_flags &amp; LOCAL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D memcmp(&amp;snd_seq[4], &quot;\xff=
\xff\xff\xff&quot;, 4);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(&amp;snd_seq[4], &quot;=
\xff\xff\xff\xff&quot;, 4) !=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D memcmp(&amp;snd_seq[4], &quot;\x00=
\x00\x00\x00&quot;, 4);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(&amp;snd_seq[4], &quot;=
\x00\x00\x00\x00&quot;, 4) !=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cmp !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *minor_status =3D 0;<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0002.patch<br>
new file mode 100644<br>
index 000000000..5686df78e<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.p=
atch<br>
@@ -0,0 +1,35 @@<br>
+From c9cc34334bd64b08fe91a2f720262462e9f6bb49 Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Wed, 12 Oct 2022 13:57:55 +1300<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Use constant-time memcmp() in<br>
+ unwrap_des3()<br>
+<br>
+The surrounding checks all use ct_memcmp(), so this one was presumably<br>
+meant to as well.<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/c9cc34334bd64b08fe91a2f720262462e9f6bb49">https://github.com/heimdal/=
heimdal/commit/c9cc34334bd64b08fe91a2f720262462e9f6bb49</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/unwrap.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c<br>
+index da939c0529..61a341ee43 100644<br>
+--- a/lib/gssapi/krb5/unwrap.c<br>
++++ b/lib/gssapi/krb5/unwrap.c<br>
+@@ -227,7 +227,7 @@ unwrap_des3<br>
+&nbsp;&nbsp; if (ret)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
+<br>
+-&nbsp; if (memcmp (p, &quot;\x04\x00&quot;, 2) !=3D 0) /* HMAC SHA1 DES3_=
KD */<br>
++&nbsp; if (ct_memcmp (p, &quot;\x04\x00&quot;, 2) !=3D 0) /* HMAC SHA1 DE=
S3_KD */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_SIG;<br>
+&nbsp;&nbsp; p +=3D 2;<br>
+&nbsp;&nbsp; if (ct_memcmp (p, &quot;\x02\x00&quot;, 2) =3D=3D 0) {<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0003.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0003.patch<br>
new file mode 100644<br>
index 000000000..55239356e<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.p=
atch<br>
@@ -0,0 +1,50 @@<br>
+From a587a4bcb28d5b9047f332573b1e7c8f89ca3edd Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Wed, 12 Oct 2022 13:57:42 +1300<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Don't pass NULL pointers to memcpy=
()<br>
+ in DES unwrap<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/a587a4bcb28d5b9047f332573b1e7c8f89ca3edd">https://github.com/heimdal/=
heimdal/commit/a587a4bcb28d5b9047f332573b1e7c8f89ca3edd</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/unwrap.c | 14 ++++++++------<br>
+ 1 file changed, 8 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c<br>
+index 61a341ee43..d3987240dd 100644<br>
+--- a/lib/gssapi/krb5/unwrap.c<br>
++++ b/lib/gssapi/krb5/unwrap.c<br>
+@@ -180,9 +180,10 @@ unwrap_des<br>
+&nbsp;&nbsp; output_message_buffer-&gt;value&nbsp; =3D malloc(output_messa=
ge_buffer-&gt;length);<br>
+&nbsp;&nbsp; if(output_message_buffer-&gt;length !=3D 0 &amp;&amp; output_=
message_buffer-&gt;value =3D=3D NULL)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_FAILURE;<br>
+-&nbsp; memcpy (output_message_buffer-&gt;value,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p + 24,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_message_buffer-&gt;leng=
th);<br>
++&nbsp; if (output_message_buffer-&gt;value !=3D NULL)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy (output_message_buffer-&gt;value,<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p + 24=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output=
_message_buffer-&gt;length);<br>
+&nbsp;&nbsp; return GSS_S_COMPLETE;<br>
+ }<br>
+ #endif<br>
+@@ -374,9 +375,10 @@ unwrap_des3<br>
+&nbsp;&nbsp; output_message_buffer-&gt;value&nbsp; =3D malloc(output_messa=
ge_buffer-&gt;length);<br>
+&nbsp;&nbsp; if(output_message_buffer-&gt;length !=3D 0 &amp;&amp; output_=
message_buffer-&gt;value =3D=3D NULL)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_FAILURE;<br>
+-&nbsp; memcpy (output_message_buffer-&gt;value,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p + 36,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output_message_buffer-&gt;leng=
th);<br>
++&nbsp; if (output_message_buffer-&gt;value !=3D NULL)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy (output_message_buffer-&gt;value,<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p + 36=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output=
_message_buffer-&gt;length);<br>
+&nbsp;&nbsp; return GSS_S_COMPLETE;<br>
+ }<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0004.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0004.patch<br>
new file mode 100644<br>
index 000000000..4e750f0dc<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.p=
atch<br>
@@ -0,0 +1,57 @@<br>
+From c758910eaad3c0de2cfb68830a661c4739675a7d Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Mon, 15 Aug 2022 16:53:45 +1200<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Avoid undefined behaviour in<br>
+ _gssapi_verify_pad()<br>
+<br>
+By decrementing 'pad' only when we know it's safe, we ensure we can't<br>
+stray backwards past the start of a buffer, which would be undefined<br>
+behaviour.<br>
+<br>
+In the previous version of the loop, 'i' is the number of bytes left to<br=
>
+check, and 'pad' is the current byte we're checking. 'pad' was<br>
+decremented at the end of each loop iteration. If 'i' was 1 (so we<br>
+checked the final byte), 'pad' could potentially be pointing to the<br>
+first byte of the input buffer, and the decrement would put it one<br>
+byte behind the buffer.<br>
+<br>
+That would be undefined behaviour.<br>
+<br>
+The patch changes it so that 'pad' is the byte we previously checked,<br>
+which allows us to ensure that we only decrement it when we know we<br>
+have a byte to check.<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/c758910eaad3c0de2cfb68830a661c4739675a7d">https://github.com/heimdal/=
heimdal/commit/c758910eaad3c0de2cfb68830a661c4739675a7d</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/decapsulate.c | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c=
<br>
+index 86085f5695..4e3fcd659e 100644<br>
+--- a/lib/gssapi/krb5/decapsulate.c<br>
++++ b/lib/gssapi/krb5/decapsulate.c<br>
+@@ -193,13 +193,13 @@ _gssapi_verify_pad(gss_buffer_t wrapped_token,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (wrapped_token-&gt;length &lt; 1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
+<br>
+-&nbsp;&nbsp;&nbsp; pad =3D (u_char *)wrapped_token-&gt;value + wrapped_to=
ken-&gt;length - 1;<br>
+-&nbsp;&nbsp;&nbsp; padlength =3D *pad;<br>
++&nbsp;&nbsp;&nbsp; pad =3D (u_char *)wrapped_token-&gt;value + wrapped_to=
ken-&gt;length;<br>
++&nbsp;&nbsp;&nbsp; padlength =3D pad[-1];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (padlength &gt; datalen)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
+<br>
+-&nbsp;&nbsp;&nbsp; for (i =3D padlength; i &gt; 0 &amp;&amp; *pad =3D=3D =
padlength; i--, pad--)<br>
++&nbsp;&nbsp;&nbsp; for (i =3D padlength; i &gt; 0 &amp;&amp; *--pad =3D=
=3D padlength; i--)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (i !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MIC;<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0005.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0005.patch<br>
new file mode 100644<br>
index 000000000..d6ea22e3d<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.p=
atch<br>
@@ -0,0 +1,37 @@<br>
+From 414b2a77fd61c26d64562e3800dc5578d9d0f15d Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Mon, 15 Aug 2022 16:53:55 +1200<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check the result of<br>
+ _gsskrb5_get_mech()<br>
+<br>
+We should make sure that the result of 'total_len - mech_len' won't<br>
+overflow, and that we don't memcmp() past the end of the buffer.<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/414b2a77fd61c26d64562e3800dc5578d9d0f15d">https://github.com/heimdal/=
heimdal/commit/414b2a77fd61c26d64562e3800dc5578d9d0f15d</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/decapsulate.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c=
<br>
+index 4e3fcd659e..031a621eab 100644<br>
+--- a/lib/gssapi/krb5/decapsulate.c<br>
++++ b/lib/gssapi/krb5/decapsulate.c<br>
+@@ -80,6 +80,10 @@ _gssapi_verify_mech_header(u_char **str,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (mech_len !=3D mech-&gt;length)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
++&nbsp;&nbsp;&nbsp; if (mech_len &gt; total_len)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
++&nbsp;&nbsp;&nbsp; if (p - *str &gt; total_len - mech_len)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (ct_memcmp(p,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; mech-&gt;elements,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; mech-&gt;length) !=3D 0)<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0006.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0006.patch<br>
new file mode 100644<br>
index 000000000..9fa59c29b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.p=
atch<br>
@@ -0,0 +1,65 @@<br>
+From be9bbd93ed8f204b4bc1b92d1bc3c16aac194696 Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Mon, 15 Aug 2022 16:54:23 +1200<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check buffer length against overfl=
ow<br>
+ for DES{,3} unwrap<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/be9bbd93ed8f204b4bc1b92d1bc3c16aac194696">https://github.com/heimdal/=
heimdal/commit/be9bbd93ed8f204b4bc1b92d1bc3c16aac194696</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/unwrap.c | 14 ++++++++++++++<br>
+ 1 file changed, 14 insertions(+)<br>
+<br>
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c<br>
+index d3987240dd..fddb64bc53 100644<br>
+--- a/lib/gssapi/krb5/unwrap.c<br>
++++ b/lib/gssapi/krb5/unwrap.c<br>
+@@ -64,6 +64,8 @@ unwrap_des<br>
+<br>
+&nbsp;&nbsp; if (IS_DCE_STYLE(context_handle)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token_len =3D 22 + 8 + 15; /* 45 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp; if (input_message_buffer-&gt;length &lt; token_l=
en)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
+&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token_len =3D input_message_buffer-&gt;leng=
th;<br>
+&nbsp;&nbsp; }<br>
+@@ -76,6 +78,11 @@ unwrap_des<br>
+&nbsp;&nbsp; if (ret)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
+<br>
++&nbsp; len =3D (p - (u_char *)input_message_buffer-&gt;value)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + 22 + 8;<br>
++&nbsp; if (input_message_buffer-&gt;length &lt; len)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
++<br>
+&nbsp;&nbsp; if (memcmp (p, &quot;\x00\x00&quot;, 2) !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_SIG;<br>
+&nbsp;&nbsp; p +=3D 2;<br>
+@@ -216,6 +223,8 @@ unwrap_des3<br>
+<br>
+&nbsp;&nbsp; if (IS_DCE_STYLE(context_handle)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token_len =3D 34 + 8 + 15; /* 57 */<br>
++&nbsp;&nbsp;&nbsp;&nbsp; if (input_message_buffer-&gt;length &lt; token_l=
en)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
+&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; token_len =3D input_message_buffer-&gt;leng=
th;<br>
+&nbsp;&nbsp; }<br>
+@@ -228,6 +237,11 @@ unwrap_des3<br>
+&nbsp;&nbsp; if (ret)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
+<br>
++&nbsp; len =3D (p - (u_char *)input_message_buffer-&gt;value)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; + 34 + 8;<br>
++&nbsp; if (input_message_buffer-&gt;length &lt; len)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MECH;<br>
++<br>
+&nbsp;&nbsp; if (ct_memcmp (p, &quot;\x04\x00&quot;, 2) !=3D 0) /* HMAC SH=
A1 DES3_KD */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_SIG;<br>
+&nbsp;&nbsp; p +=3D 2;<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0007.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0007.patch<br>
new file mode 100644<br>
index 000000000..b3197afc3<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.p=
atch<br>
@@ -0,0 +1,39 @@<br>
+From c8407ca079294d76a5ed140ba5b546f870d23ed2 Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Mon, 10 Oct 2022 20:33:09 +1300<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Check for overflow in<br>
+ _gsskrb5_get_mech()<br>
+<br>
+If len_len is equal to total_len - 1 (i.e. the input consists only of a<br=
>
+0x60 byte and a length), the expression 'total_len - 1 - len_len - 1',<br>
+used as the 'len' parameter to der_get_length(), will overflow to<br>
+SIZE_MAX. Then der_get_length() will proceed to read, unconstrained,<br>
+whatever data follows in memory. Add a check to ensure that doesn't<br>
+happen.<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/c8407ca079294d76a5ed140ba5b546f870d23ed2">https://github.com/heimdal/=
heimdal/commit/c8407ca079294d76a5ed140ba5b546f870d23ed2</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/decapsulate.c | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/lib/gssapi/krb5/decapsulate.c b/lib/gssapi/krb5/decapsulate.c=
<br>
+index 031a621eab..d7b75a6422 100644<br>
+--- a/lib/gssapi/krb5/decapsulate.c<br>
++++ b/lib/gssapi/krb5/decapsulate.c<br>
+@@ -54,6 +54,8 @@ _gsskrb5_get_mech (const u_char *ptr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; e =3D der_get_length (p, total_len - 1, &amp;len,=
 &amp;len_len);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (e || 1 + len_len + len !=3D total_len)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp; if (total_len &lt; 1 + len_len + 1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; p +=3D len_len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (*p++ !=3D 0x06)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437=
-0008.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-343=
7-0008.patch<br>
new file mode 100644<br>
index 000000000..6d6431221<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.p=
atch<br>
@@ -0,0 +1,48 @@<br>
+From 8fb508a25a6a47289c73e3f4339352a73a396eef Mon Sep 17 00:00:00 2001<br>
+From: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Date: Wed, 12 Oct 2022 13:57:33 +1300<br>
+Subject: [PATCH] gsskrb5: CVE-2022-3437 Pass correct length to<br>
+ _gssapi_verify_pad()<br>
+<br>
+We later subtract 8 when calculating the length of the output message<br>
+buffer. If padlength is excessively high, this calculation can underflow<b=
r>
+and result in a very large positive value.<br>
+<br>
+Now we properly constrain the value of padlength so underflow shouldn't<br=
>
+be possible.<br>
+<br>
+Samba BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15134">=
https://bugzilla.samba.org/show_bug.cgi?id=3D15134</a><br>
+<br>
+Signed-off-by: Joseph Sutton &lt;josephsutton@catalyst.net.nz&gt;<br>
+Reviewed-by: Andrew Bartlett &lt;abartlet@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/c=
ommit/8fb508a25a6a47289c73e3f4339352a73a396eef">https://github.com/heimdal/=
heimdal/commit/8fb508a25a6a47289c73e3f4339352a73a396eef</a>]<br>
+CVE: CVE-2022-3437<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/unwrap.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/gssapi/krb5/unwrap.c b/lib/gssapi/krb5/unwrap.c<br>
+index fddb64bc53..bab30f4501 100644<br>
+--- a/lib/gssapi/krb5/unwrap.c<br>
++++ b/lib/gssapi/krb5/unwrap.c<br>
+@@ -124,7 +124,7 @@ unwrap_des<br>
+&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* check pad */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; ret =3D _gssapi_verify_pad(input_message_buffer,<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; input_message_buffer-&gt;length - len,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; input_message_buffer-&gt;length - len - 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &amp;padlength);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
+@@ -289,7 +289,7 @@ unwrap_des3<br>
+&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* check pad */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; ret =3D _gssapi_verify_pad(input_message_buffer,<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; input_message_buffer-&gt;length - len,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; input_message_buffer-&gt;length - len - 8,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; &amp;padlength);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
index 53526a26b..39ba85194 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
@@ -22,6 +22,14 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar=
.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0005-samba-build-dnsserver_common-code.patch">file://0005-samba-=
build-dnsserver_common-code.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch">file://0001-=
Fix-pyext_PATTERN-for-cross-compilation.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch">
file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0001.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0001.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0002.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0002.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0003.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0003.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0004.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0004.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0005.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0005.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0006.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0006.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0007.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0007.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-3437-0008.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-3=
437-0008.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI:append:libc-musl =3D &quot; \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB582212EA2E51E248C704E3EC8458AMW4PR11MB5822namp_--

