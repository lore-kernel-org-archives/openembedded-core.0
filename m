Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD880EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:14:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6826.1686917633783356984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RQuUM1zv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55315b4ca9=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GBwA8s014477
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:13:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=DBwUVt+wI2rV5exNO/lHqawtjxDK43ubAHZIYMVGEpA=;
 b=RQuUM1zv0FvKOdg3oW7LV5VVwXHq6wOLqVYi0Wtu7gx6ToNGEVtBcwJ8qGN6inG6ehMu
 NL5AlM+WRvnJcIjT7o9W66aX+mVqkRwy3SNbf87VemJuWBdlbZSICW3pfPfUtT4wyIv2
 E+a0ZhC3AiXZ5uw43uxyAL++8KB1MXBJyKbEULtpdXs+llHKoELd/WhA1W4VvgnpFdqu
 Xa1gh07nVoA01H3fngjxxNrCSdbiZKfbVHsJmXK9ipB0YH8XXSIENSSKeyMHCbCnn1uL
 Xf/vv6/Y5cYvYLvNX+kwR63w8QD0NHfcL6rU3i+CZQXXukVRANuBx0K8M/zKomCuiNlv 4A== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4mf35x5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlSHSYpWgL0qmoSMXcIT+uKUNn9eU1sEP57dteqDzlm+szRe93QkUqm9zrD55oFfe1yi/Vt+3izqtVYtQDJdO2OOJV/OHBe/LohFl3jqy0BQeeQHOBNGH70cZl3Ca20l8kHolh0xdgnn39D04oHrjHSEcYZh4THrcWV6GfN3w66cfa9RG5pM9R4MkP3HEY+kw0Rn9f4GWWBsAHWyYtqaueyCAposEK47RhgczMQdBjVmCAge7gFvv0QrBWLHdYme3pmwl4XD9xCTmkmF6esXYt0NHz8lULDjWbiVVtQVLZ8li1W13s4yMl8yxPl4JXu0nuif7YprrjECavndoZLKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBwUVt+wI2rV5exNO/lHqawtjxDK43ubAHZIYMVGEpA=;
 b=P1qpYM+bdD2U1D3rJVKq2ie8TL1xG+ECaGs/RFhGkNg78WHUASOdEDWpfzpmDNvnH1e+GHhQrKYrv/ALHcLXXSuW+4nAA7rCrkHn1MI97oJPO7zazHefHfNvpeO+PJXpyEVDL+wsvVav3LGmfxqm+1PyhqctsM2rAyU0E8vohoNmciBaTtZmiisoHdDWDYGqXEcYG2xKxcVYkCCPhJ45IWUnhvW9zoCMu7YddI+UWKHV/pEPInw20RKReybvXBJOdVszex9GneSH1WaPz74SjJFmBWIna2bV4JcIHzC6iBDoxoqNnFJjbESZW2WMQyRuPEXhqwyT5T9Omln/KywDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 12:13:50 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Fri, 16 Jun 2023
 12:13:50 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] samba:
 fix CVE-2022-45142
Thread-Topic: [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] samba:
 fix CVE-2022-45142
Thread-Index: AQHZoEvX8GsYZl3GaUKLRYN6Vw9d56+NV1Uq
Date: Fri, 16 Jun 2023 12:13:50 +0000
Message-ID: 
 <MW4PR11MB58220DB00B7F31F481A7CA3E8458A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <176922909D0ABF80.12727@lists.openembedded.org>
In-Reply-To: <176922909D0ABF80.12727@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH8PR11MB6707:EE_
x-ms-office365-filtering-correlation-id: 2ce18a77-11f9-43c1-ea88-08db6e632512
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eaoYDjswGncZ6Rhs0X6kbOgkYDb4O2uDqnaEhCgViORIO9sE11nn7PY3PFv2DmrUoaAc2ivy5AEsJ3czNKh1TyUzJyHnNod5YIjP6UXEvw0cTL1eITPCmg354gJfMEEs4c8Eoh9uxRhcqm7St6dVnxSie9p4rGSpUL1RaSD3/wiE42qnfwItNVx6jyF/VzIajmHVxIexYinFg0NMhVh2zYNSM8Z+xrUVDx6bPYxixKT2zrroeULxGX1HX03YPkCNFZgpwr4WlSM56LJ834hHI3I0c80pKQlQ1SaTLPFUUbHUs5giddnwiG8ckAW3DN/RuWNpG7Cnxm/iw3Jyd/jdJKIPLb+bIZ84log4r4gFjrl0CqfATqp/MVXz261/CMOKVX1l4ZNSv4Af7qNXH+sKfQigj6FiU64anX9vG4Mm6osDLsVBki7AHPGVrDJgUQYT9c8QSswJ0D64aWeKYtVBMZtdUN8XZGmGmtpX9mZw53bAK15pNgZE/B1/bG4FLkjfcu2QaBfYVNCwn5LYAvMI3ofTP2iCIdfu+HOrQoswukNE43Vd+Ev7DlyXinGQc3Pz1zk6nyU977A+LUMuV/8zQJWooWBXs6GpZKibKblD/uE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39850400004)(396003)(346002)(451199021)(107886003)(26005)(71200400001)(6506007)(55016003)(186003)(478600001)(9686003)(55236004)(38070700005)(86362001)(166002)(7696005)(966005)(76116006)(66476007)(4326008)(66946007)(66446008)(66556008)(64756008)(316002)(52536014)(33656002)(122000001)(91956017)(2906002)(8676002)(83380400001)(8936002)(5660300002)(41300700001)(19627405001)(110136005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/efVVRnMgiWNkLQ6svIrfxD4CWsLLMLckFSA7/GJKpDl0WlgeL3O4UOGxZ+R?=
 =?us-ascii?Q?x3xhnVDmm8YAPivHm0LQkxsHNaBPf/R6fLrG5an+dlO7NpIcSjhbihAIwgO4?=
 =?us-ascii?Q?nyx8FsSvj8MkJ0tHEPTRaTvmsLpIwnYcuSn7c124tMpf0Znt7tvj0m8wls+2?=
 =?us-ascii?Q?59XCzgXPEfsZrDHgGvSkVJZne1Qt7wYf/Mg36CNUuDCMep1aOWqY3hqF8rqG?=
 =?us-ascii?Q?4QUPtQ6mOfvnn0N6mTx16xi8rEF0yKXJIFMglg2BAvutXysrp5xAAmJQ1Gi8?=
 =?us-ascii?Q?D21l2YDK8i2sQItRXi6hkQbEK7/gEzyFZ33TTxLi/WvF4KGmY5qvAHHyoXbM?=
 =?us-ascii?Q?CymWK7N7OQedpXdvkJEe7wmIn5zaHP1uP58R+42HWnZaiUhnyAlXTEhq7/kR?=
 =?us-ascii?Q?rUKGBuVUYj0LzIATjwh45aADFhBPy3T4EYiTMGg33YMuVUc4JrMHEkGxjIbY?=
 =?us-ascii?Q?Zj+BluPWDszVx/MnFg5sl0HS1Au89/S7qoZS9uwHS9cq/ymkpgO2PHO3PLLD?=
 =?us-ascii?Q?ukY4CJYV1OrlaXGAj+wvlyMFSim7NFztKreC90aVxrS3fqxcRm3oNP+gEJ8o?=
 =?us-ascii?Q?M7vFX7Ee6YePGd8kBI7xmONQP6q8kEAvrkGnsvQFc2NPkGZwW+guWQSx6CkP?=
 =?us-ascii?Q?oJhUQGe/M+kHrduSVJLudvBmAgTu0MvYg0qiZUmPYaAVSyylcqzGjU0Ph84q?=
 =?us-ascii?Q?tDrjG7+WcdkNuP35f8xftrE4RWgaiGwKtJxftnaroRjpc3THic3yKS9ciX2C?=
 =?us-ascii?Q?Nlb9/S/5Ri6xm1c/tDfuKTvIKdDuTvr4poqQB7droYeJwq8ETIq3Yg5wrDfa?=
 =?us-ascii?Q?T9xD+FRgtZzdj3qwrHfvNhirGNeyGvgQ+gkiXTc6HEjcP/W7Awm6IyDeBLwb?=
 =?us-ascii?Q?xkk4IQUIU4eVCf92VUt3P9Ucnmin6DNzVrqEhgU5/UKexhssLqzl/LqD7J/0?=
 =?us-ascii?Q?9Edqa3lyf/djUGPN4rclEYWmIQieQaGUC2DofdRhWJZ2cwAP5tDo+38FztkW?=
 =?us-ascii?Q?qLtJzuO0POZEx618WyrtLzKnWJecDEkcRF/hnC7PgS3lfTuVKs30MislwtiO?=
 =?us-ascii?Q?+5BvxL/yixvXFnJElxhVePsdG6okmNYNRJpp7uxehtVMwAsTKb7yGugqqHja?=
 =?us-ascii?Q?w//lHhWbvZn5v5IXLdigo5/yBAFN1+QjdjrBsLaRWpho0tZ+UF7Zl+hXXpdS?=
 =?us-ascii?Q?lGu1XBhBFfkfv1lhTvW4jQHmZ+zmIB5XVz+90ENaBRAw2c0g3xUXXndbzQlC?=
 =?us-ascii?Q?ofKvm9PQUiywBuxa7Plg0zmbWs2PNPJKZ6vby/7rANOJbGHufX/FuHxd/+5X?=
 =?us-ascii?Q?sSf0di/dFRUHbznMy7Go2uVu9rnkWKplw5ujOoJwHVrh1s01vxkhwQUPixl5?=
 =?us-ascii?Q?++QwQg/j3kToPRpUYAcQtCOce3svowecjeKEix4jWMt+S+tpCCJ0h4J6ik9g?=
 =?us-ascii?Q?O/W0oy9lIIKBPwF6fGCYlZUoFx0zA1fq1sveWn2BdXei0fGW5Exwx3p2z6gd?=
 =?us-ascii?Q?48Yb0vwVE8Hlrb7vR6ycZs2/UR1IzK3fwTGk51n5meypKUKPW3CUP7n/j9aO?=
 =?us-ascii?Q?IHownT0KaIa1dioyqXmvGS28uJ/UbOVRCanXFY45ChLqpsZyFga0jg5carZ7?=
 =?us-ascii?Q?yw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58220DB00B7F31F481A7CA3E8458AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce18a77-11f9-43c1-ea88-08db6e632512
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 12:13:50.5432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jbJQq/6QIWMwXtWqFF/OkWkY5dylb3H6lImH/fNUQqUMP6ANFBFxWbf5rWc5SGZi0zy4RIJyO+O8+MvXb3MYFeH5dq65lDXKPN7Ksd7xCzkQJ/hqM1CUIxsxFXCm2rAW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
X-Proofpoint-ORIG-GUID: NCo1jmjbT5d-Er3kqVyOA2aMPWSxTsQ0
X-Proofpoint-GUID: NCo1jmjbT5d-Er3kqVyOA2aMPWSxTsQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183014

--_000_MW4PR11MB58220DB00B7F31F481A7CA3E8458AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch

Regards,
Archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, June 16, 2023 5:42 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] samba: fi=
x CVE-2022-45142

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


--_000_MW4PR11MB58220DB00B7F31F481A7CA3E8458AMW4PR11MB5822namp_
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
<b>Sent:</b> Friday, June 16, 2023 5:42 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> [OE-core] [oe][meta-networking][kirkstone][PATCH V2 1/1] sa=
mba: fix CVE-2022-45142</font>
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

--_000_MW4PR11MB58220DB00B7F31F481A7CA3E8458AMW4PR11MB5822namp_--

