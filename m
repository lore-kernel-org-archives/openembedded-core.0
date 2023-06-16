Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A49EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:15:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6863.1686917737377137018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iyeF7zDk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55315b4ca9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GApK5t005855
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=x+G6WPqItD6ZRcbDsQYqrGaYLk5meJhau7QTmExbQvA=;
 b=iyeF7zDkT3NgmsJN6kYRsHu76x4lFri6O8enl96k/+s/Y9toarkfBo5FeIQFGvHMg8HI
 dv443dn6jnm1aTFkXidI00KtW7+RjdtR1LL/V2FwyKCtCRetea/3q2n2RPSV4p1DlyHf
 SPxYJpGtmUPwpS26MhuVqLHgYJ0A77SGV6PH23r6Pgq+JwRvYQWyI6YFaJib2i4npaH8
 zHi5TfnvSx+MqGKfZezxSZMS2kmWQMSBHwFeijGkrk+XyHQB11gBkOm4PFUPd8Pb4zMk
 KviUv4U64nfyWTueHLh/NNI1nxKKPrt1oxtkTLk0f53YGfIej5VdF7O4zUn7AugVcCwD dw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed064tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/AN6vZLK5WgyXGuwkGoROjCYHJ7Ha1fvc4W0J2aWkO7FlKOuBhO2nQlinpU2BMbop5k3jmC2LrCERzogqSMTOIcnYRSyzkw3MRLxZCFKzLeaka7BG9LhcFgcA2MEQhldR9IoSnTO2ZZ4bmDR99Y2aSGywqxIhIuaUyetFfd52uG2T5rJCTwYDeAC5O/XSM2jZ98Gu8yKB+1zZ9DJ0W7W91dBZaBXsRQzjPFlzUBvRLizgRgh638pSFhe5wgsnwA7tZ7W6P7aPpubdYJsGR8+ZUQydnmoOzmcn1K46bq3pYQAW+SXhm2hqER0ayqlU/cGIh31FAnTxkgbjP0yrnxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+G6WPqItD6ZRcbDsQYqrGaYLk5meJhau7QTmExbQvA=;
 b=C2MFJyQbGIWFOCzEGZJ0/wXSC92fBGzJMdOqAsU/U3yZlaPm7AeAAfpAs9f5lmks8s+k9YjRFyScax3NeI1jQMQUKp7BobVZQHlhCxzeAEfmGxhqFKZsZJw6woxQeeRdFstM9j3xDFzw8cOqfQgGrk3AEfAD+7ss3HhNV81GVbbyzrOfFdPcQjcX9hU8u5Lrz9B0e3JDAzacs7r2+sBl0Q2wduP/FBH9vOtm6ZdIY2oNQXzB6wIrEw3Va197aPwGapb6H79tJDDfnEHrwWQKNY+sxTgBFIZZInrkj5SdeAb73+0DJGuE05toboZ7wLpDeZEHdb1z5FUTfUXmBSBN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 12:15:34 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Fri, 16 Jun 2023
 12:15:34 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [OE-core] [PATCH] samba: fix CVE-2022-45142
Thread-Topic: [OE-core] [PATCH] samba: fix CVE-2022-45142
Thread-Index: AQHZoEre1M5tB18GYkKzCExWiYpKAa+NV9tS
Date: Fri, 16 Jun 2023 12:15:34 +0000
Message-ID: 
 <MW4PR11MB582295ABA5EA9C9973B410858458A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <1769222C6D03EE17.19085@lists.openembedded.org>
In-Reply-To: <1769222C6D03EE17.19085@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH7PR11MB6007:EE_
x-ms-office365-filtering-correlation-id: 73c8058e-2f7e-40a5-b379-08db6e6362eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +AIWryX6MorUFLP5qmNuHMGtkuq9tHkLneCbHNVnVXpBCV60P0+VovElGQjureaU/nVC6qe7fwzICHeduWVmBgnABqcLfb9SJYbqKY7rZU1yDKF3a+JR7t0Iva7A50HiJ9jpARrq3DuzebLmcekUUzumO9qGJm+akY7KK/AB9sWkhfQoIL9Y6fG/B4YHy/nKHhNGJeLo7rH7GnqXpu5vtdBxrvgwVoBA4wyzQ5SqpRpjfUn7Kvs6eb6GsLq04hfcgrOHgtSpVbjZgUfy1h8Y4CBE1IGT2ZVwzUcP0Ke1dyT9rAAllX2ekCldQIEXbOync+8JaoAp0IZUXFcer8vG11Mw0rbZ+Mlig/aWcaXQK42boTOUXH7j/Uso47lwnk0qTXwgcWt2SwxMP4kf17m7O2k2J+ikX7pmKFUCUkTJlEe45aTGtzQDLza0AjxUiCjpjxEgMQHaoAIGg3Um+eiglZorhyi/xHBzSJMR6xLk0x54w4qN3Opg9MHikMzJ1VHYm41Z1yzUIT/0ZsOJFyKhjEEt9egMYLItFsecUZol1x2ypblelti8YaLHuZe4CY6KHRSslD7uogSomBWlnUN4wIwGn9W+kTffnX9apGy4xb8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(110136005)(41300700001)(8676002)(86362001)(7696005)(64756008)(66946007)(66476007)(66556008)(66446008)(8936002)(316002)(33656002)(71200400001)(19627405001)(91956017)(4326008)(76116006)(38070700005)(478600001)(107886003)(9686003)(55016003)(26005)(5660300002)(166002)(966005)(52536014)(83380400001)(6506007)(55236004)(2906002)(186003)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?F9ZIHqM5Go+AKDCnHUPfXtTYumVJJWl5lbGwUscISBefjOCCafFvhv9CSU5j?=
 =?us-ascii?Q?kAk52LjEjByNKmSZYI1pjv9Y7mo/thLjewnn4rjEZGzaN7gUX76IUHMWU4Zr?=
 =?us-ascii?Q?UjEgdKI3f4Hr1OTqFiZu8Z66zxh3v9HsDbLN70NLNbr+MJL68k9LXaHMqP58?=
 =?us-ascii?Q?kPz9AXatDsuuyJKr5NyXPdepky+/SkqjlFPjhj6xJj2O+2NhnQe6K+Jnwuq2?=
 =?us-ascii?Q?GJFDTNA0w5BkOmLkwR3ntxDBVDMRTETgjIJpkWX3ntsSUrRt6PuWQOIhUS8u?=
 =?us-ascii?Q?1dHoSRtAg3lDUVxNxaW2nB2NPFF3w08Fih1qdfy7RivNL8b8Fw2Zd3sjQ+UN?=
 =?us-ascii?Q?4gHG6n5ygyseVbGW9WiPrQ8KclVbf4lRAVjUeX7w/waKvrc5ebDUQJJ5TMLI?=
 =?us-ascii?Q?hxZll2Qg8yv1s79V+1q8Q2xDVy0g/Ws08L2HqnpYBXaKru7u46kbMN4JUnCX?=
 =?us-ascii?Q?wxisk7OJWjINS/Sz9xpeXMrmM309iotk3iXWuOMo0VUFGOhTDX0j4FpJRfEc?=
 =?us-ascii?Q?QCm62CAnSzHK3lVbKEmcnhfiapUnTV22VKuA/QOV4tOrjHJgZPxMhCpE5GJs?=
 =?us-ascii?Q?MST9CoEivCrubzIn9y5EszAvAXQLwAKpQzEab1XfeUH43BxpLuYv5T4MOu8H?=
 =?us-ascii?Q?T2U3UJf6o4W07aP9A43hQa7y3xf3zb+JdlmVqDVDSznrxaK3NHF4ZOwQlJb3?=
 =?us-ascii?Q?aJEkgCp4CkNX/AyreyA4vXZoao8mmnXm4n5S/FtyqyABFM8XpSz7mt6APoA8?=
 =?us-ascii?Q?tYw7M96FPCbXdFgDNjto4Dmei6zI2vKPCoUYB0WQWhEKfpQeVEcxG6HCQQJG?=
 =?us-ascii?Q?Rx7FojQZlbgTAXO8CO2fXpnY3LZDRxdaJMt0wPDXho2G0AVzEHrdWBY/Emcf?=
 =?us-ascii?Q?62oWVsIFvQtO6++LUgLT/IQSAj0gksJdbB9ByHu+Y5HNGDfky7JxLug3QsIv?=
 =?us-ascii?Q?vPqriDC+sp6IDljqIvt6S9tRnuQTv3BHpMqKTW+OQHdJU6dykp4/il9YNV9N?=
 =?us-ascii?Q?wF3zWsgnS0WtiL8rN4BYseQRHib1L+ZyH5Rl+hTJLqK5RifrF1kT1WL74gSC?=
 =?us-ascii?Q?RlQJlkcXkSAS+G/jUh4Qc2WHLqEBxteKISzREc6rTCYKO2Zl6vtc1y9PusZb?=
 =?us-ascii?Q?vMmj6NE7cHZwz8RFNO/83ncbKEmwEROGqZbQ2zsYCPr8Ww25TydVov3oMWCA?=
 =?us-ascii?Q?NqVXk99VS8cWeoHHyB7c3Dt/vQ1fmCXHH5OBlBnpsXtwW6PE4jeszykB7Svc?=
 =?us-ascii?Q?1vkZxV/WbmPEBzoS5WHIAuXcw/V0gpmaS+huQtzWd33jPEMH9pfn2vu0fkgC?=
 =?us-ascii?Q?slSJhLrWwqQ73YoOmDqhrfVr8PsDHGNo/PHBWwAdhELn8NvyN8bKL2S6v3oa?=
 =?us-ascii?Q?nMzMlpG5M59GDU8SEsiv3f2c4Hj9E9XpkmTVkPPDOy1dFNHxELfsEBWfY2oj?=
 =?us-ascii?Q?hXORxve99jL3qbWZLkVAllwDqtx5L8KwCI34fKkERznjw4ASPVzlqT1btcMw?=
 =?us-ascii?Q?hTZ35IALR/2cXm2646KqWgzXC1ZUEAFfUuBOxpc2sRAIiiA7d54E3DeM6d8v?=
 =?us-ascii?Q?5ROqH61pxytONI2kdc1HXuPOr0hKBBONOP+UjbHLyqgGJ4Uz3ceQNGa6x50k?=
 =?us-ascii?Q?XQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582295ABA5EA9C9973B410858458AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c8058e-2f7e-40a5-b379-08db6e6362eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 12:15:34.3077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4xSx2CBDjSzrxWUWwW1AbWkssVcijYUGqLUsOE5o9ILmaBmXeiW/3Obyvrd+gcPvLlAtj1tqeD/j5V9o8HAAzTq5mh/9MRPs4uslNmXZIs6ukJEagnk76PgI2fljKNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-Proofpoint-GUID: 3m4rRpN4Hk_Kz1TUnURJ-YbpZDWYzhcA
X-Proofpoint-ORIG-GUID: 3m4rRpN4Hk_Kz1TUnURJ-YbpZDWYzhcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183018

--_000_MW4PR11MB582295ABA5EA9C9973B410858458AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, June 16, 2023 5:34 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [OE-core] [PATCH] samba: fix CVE-2022-45142

The fix for CVE-2022-3437 included changing memcmp to be constant
time and a workaround for a compiler bug by adding "!=3D 0"
comparisons to the result of memcmp. When these patches were
backported to the heimdal-7.7.1 and heimdal-7.8.0 branches (and
possibly other branches) a logic inversion sneaked in causing the
validation of message integrity codes in gssapi/arcfour to be inverted.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-45142

Upstream patches:
https://www.openwall.com/lists/oss-security/2023/02/08/1
https://github.com/heimdal/heimdal/commit/5f63215d0d82678233fdfb1c07f4b421f=
57c528b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-45142.patch          | 51 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-45142.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-4514=
2.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.p=
atch
new file mode 100644
index 000000000..d6b9826e4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch
@@ -0,0 +1,51 @@
+From: Helmut Grohne <helmut@...divi.de>
+Subject: [PATCH v3] CVE-2022-45142: gsskrb5: fix accidental logic inversio=
ns
+
+The referenced commit attempted to fix miscompilations with gcc-9 and
+gcc-10 by changing `memcmp(...)` to `memcmp(...) !=3D 0`. Unfortunately,
+it also inverted the result of the comparison in two occasions. This
+inversion happened during backporting the patch to 7.7.1 and 7.8.0.
+
+Fixes: f6edaafcfefd ("gsskrb5: CVE-2022-3437 Use constant-time memcmp()
+ for arcfour unwrap")
+Signed-off-by: Helmut Grohne <helmut@...divi.de>
+
+Upstream-Status: Backport [https://www.openwall.com/lists/oss-security/202=
3/02/08/1]
+CVE: CVE-2022-45142
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/gssapi/krb5/arcfour.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Changes since v1:
+ * Fix typo in commit message.
+ * Mention 7.8.0 in commit message. Thanks to Jeffrey Altman.
+
+Changes since v2:
+ * Add CVE identifier.
+
+diff --git a/lib/gssapi/krb5/arcfour.c b/lib/gssapi/krb5/arcfour.c
+index e838d007a..eee6ad72f 100644
+--- a/lib/gssapi/krb5/arcfour.c
++++ b/lib/gssapi/krb5/arcfour.c
+@@ -365,7 +365,7 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,
+       return GSS_S_FAILURE;
+     }
+
+-    cmp =3D (ct_memcmp(cksum_data, p + 8, 8) =3D=3D 0);
++    cmp =3D (ct_memcmp(cksum_data, p + 8, 8) !=3D 0);
+     if (cmp) {
+       *minor_status =3D 0;
+       return GSS_S_BAD_MIC;
+@@ -730,7 +730,7 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_stat=
us,
+       return GSS_S_FAILURE;
+     }
+
+-    cmp =3D (ct_memcmp(cksum_data, p0 + 16, 8) =3D=3D 0); /* SGN_CKSUM */
++    cmp =3D (ct_memcmp(cksum_data, p0 + 16, 8) !=3D 0); /* SGN_CKSUM */
+     if (cmp) {
+       _gsskrb5_release_buffer(minor_status, output_message_buffer);
+       *minor_status =3D 0;
+--
+2.38.1
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 39ba85194..cc07d51dc 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-3437-0006.patch;patchdir=3Dsource4/heimdal \
            file://CVE-2022-3437-0007.patch;patchdir=3Dsource4/heimdal \
            file://CVE-2022-3437-0008.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2022-45142.patch;patchdir=3Dsource4/heimdal \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0


--_000_MW4PR11MB582295ABA5EA9C9973B410858458AMW4PR11MB5822namp_
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
<b>Sent:</b> Friday, June 16, 2023 5:34 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [OE-core] [PATCH] samba: fix CVE-2022-45142</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The fix for CVE-2022-3437 included changing memcmp=
 to be constant<br>
time and a workaround for a compiler bug by adding &quot;!=3D 0&quot;<br>
comparisons to the result of memcmp. When these patches were<br>
backported to the heimdal-7.7.1 and heimdal-7.8.0 branches (and<br>
possibly other branches) a logic inversion sneaked in causing the<br>
validation of message integrity codes in gssapi/arcfour to be inverted.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-45142">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-45142</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://www.openwall.com/lists/oss-security/2023/02/08/1">https:=
//www.openwall.com/lists/oss-security/2023/02/08/1</a><br>
<a href=3D"https://github.com/heimdal/heimdal/commit/5f63215d0d82678233fdfb=
1c07f4b421f57c528b">https://github.com/heimdal/heimdal/commit/5f63215d0d826=
78233fdfb1c07f4b421f57c528b</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../samba/samba/CVE-2022-45142.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 51 +++++++++++++++++++<br>
&nbsp;.../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 1 +<br>
&nbsp;2 files changed, 52 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-45142.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-4514=
2.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.p=
atch<br>
new file mode 100644<br>
index 000000000..d6b9826e4<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch=
<br>
@@ -0,0 +1,51 @@<br>
+From: Helmut Grohne &lt;helmut@...divi.de&gt;<br>
+Subject: [PATCH v3] CVE-2022-45142: gsskrb5: fix accidental logic inversio=
ns<br>
+<br>
+The referenced commit attempted to fix miscompilations with gcc-9 and<br>
+gcc-10 by changing `memcmp(...)` to `memcmp(...) !=3D 0`. Unfortunately,<b=
r>
+it also inverted the result of the comparison in two occasions. This<br>
+inversion happened during backporting the patch to 7.7.1 and 7.8.0.<br>
+<br>
+Fixes: f6edaafcfefd (&quot;gsskrb5: CVE-2022-3437 Use constant-time memcmp=
()<br>
+ for arcfour unwrap&quot;)<br>
+Signed-off-by: Helmut Grohne &lt;helmut@...divi.de&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://www.openwall.com/lists/oss-s=
ecurity/2023/02/08/1">https://www.openwall.com/lists/oss-security/2023/02/0=
8/1</a>]<br>
+CVE: CVE-2022-45142<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ lib/gssapi/krb5/arcfour.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+Changes since v1:<br>
+ * Fix typo in commit message.<br>
+ * Mention 7.8.0 in commit message. Thanks to Jeffrey Altman.<br>
+<br>
+Changes since v2:<br>
+ * Add CVE identifier.<br>
+<br>
+diff --git a/lib/gssapi/krb5/arcfour.c b/lib/gssapi/krb5/arcfour.c<br>
+index e838d007a..eee6ad72f 100644<br>
+--- a/lib/gssapi/krb5/arcfour.c<br>
++++ b/lib/gssapi/krb5/arcfour.c<br>
+@@ -365,7 +365,7 @@ _gssapi_verify_mic_arcfour(OM_uint32 * minor_status,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_FAILURE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(cksum_data, p + 8, 8) =3D=3D 0);<br=
>
++&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(cksum_data, p + 8, 8) !=3D 0);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cmp) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *minor_status =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_BAD_MIC;<br>
+@@ -730,7 +730,7 @@ OM_uint32 _gssapi_unwrap_arcfour(OM_uint32 *minor_stat=
us,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GSS_S_FAILURE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(cksum_data, p0 + 16, 8) =3D=3D 0); =
/* SGN_CKSUM */<br>
++&nbsp;&nbsp;&nbsp; cmp =3D (ct_memcmp(cksum_data, p0 + 16, 8) !=3D 0); /*=
 SGN_CKSUM */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (cmp) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _gsskrb5_release_buffer(minor_status,=
 output_message_buffer);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *minor_status =3D 0;<br>
+--<br>
+2.38.1<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
index 39ba85194..cc07d51dc 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
@@ -30,6 +30,7 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar.=
gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-3437-0006.patch;patchdir=3Dsource4/heimdal">file://CVE-=
2022-3437-0006.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-3437-0007.patch;patchdir=3Dsource4/heimdal">file://CVE-=
2022-3437-0007.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-3437-0008.patch;patchdir=3Dsource4/heimdal">file://CVE-=
2022-3437-0008.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-45142.patch;patchdir=3Dsource4/heimdal">file://CVE-2022-45142=
.patch;patchdir=3Dsource4/heimdal</a> \<br>
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

--_000_MW4PR11MB582295ABA5EA9C9973B410858458AMW4PR11MB5822namp_--

