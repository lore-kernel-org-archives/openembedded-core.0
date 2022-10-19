Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B80C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 09:32:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5828.1666171962165167177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 02:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dy38nQP8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7291434a8f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29J7hWfE016150
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 09:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jtXnOVrcVT+EzsUYTn68UqsY6zWnsZspGGR4AUtJwG8=;
 b=dy38nQP8f7Uo9w6Of80SndK/q4stZjqhau1IKevqMKomEOz89j68ixmc0aI8OUESJ3ti
 UnZi1idNn9mkxVPdtOZIkwCMxQqmitzui/jSpo0vGY1kdSJFScmq3ffFumIig+3n0gvb
 AUMs8DAw/8JBuiEC7Ar/OJdAmVAmjgEkvs0l+NcjjFqDDN9DYb42JXBaxgAU52givThe
 oPvUmAGL345tJJa9KA3y2TwcKEKW9xDlLD8MlAhL6FQ49MpD3eYu+pcbrY+j+CvxdC4+
 gIQ5Zib/KvVjcDqe25av1DAWR7XBg5HW36bMgOoLjakWbqwixvlip6SwjIZAG+td6Uec jQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku9bnv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 09:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F11fZ8iUQ+AQXnTn3CwwNRidj1LSFG3AHOXm2YfDX+7EhrNy8FfsNzKKrSI9c0OZ3LiHWWiT/0oUMwPnprCTFBmKDz6vf/merMASlc557FkWLVznoWmm+PPM7f0dMW2XtIcwmG+1TnM9INUTg197kyDxfTAiIlnwaq5wEWeCk0MZsYxa9xOudJvUOjQkycgCw+BzuAkl//4YdOfz82c20j+1l2So88EFiKd5Wl/XviVPpk9cbfkudr7QiJ1pLjkpxf0BglnARdQ3QMzoN048Xjy4iqX81uZhr5u1zOn3DwZ5KqHKBRnvQ+D1tESRrkRQ87gb9JYF1gO3dajx0lA/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtXnOVrcVT+EzsUYTn68UqsY6zWnsZspGGR4AUtJwG8=;
 b=ZLE8ImFRNV30gN1wjP3RnnbVJuTt09bwagXEcxLLvGh/jyBgbc3zWS+2wexklvopYRFmvXRihTozPw0Tq9BNonGQ52WtyTNEpMZOe+2JLMlHyVXhNYvDwzZXrQLLzY+f9IYxXJimi0z263GvXY+vb/O3T6GZL0lkUtH8v8KRwScfHxMlNnSvEYRMV3mvnclT9MnH850U1P9bR504Pcnh6pIWZVSIwbUb5JO46lk9gIbmqXFkQ0Gf2QnsxjMueSaUwMzMUYuNQcaG2cKPwqduFkVq8X7z6LN2d7w6BAKt9VjCENToBfHviGzvoocMRVtoh+YolAib6iurOhBs01uzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 09:32:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::623b:7365:46b:36fc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::623b:7365:46b:36fc%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 09:32:38 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH V2] openssl: export necessary env vars in SDK
Date: Wed, 19 Oct 2022 02:32:28 -0700
Message-Id: <20221019093228.9619-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6d7186-8d3b-49f6-c0d4-08dab1b4dcc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1B0ShEIGEsAHJVBs6270OqYUtkWddjh4e0g2rZn+h5K+SrOS8ktU4F3tWeVtficX4IJL8mBLnbqQA56XBkn/F1nacfex5D6E4FRxJkZUEhjpe0vQ+AxPXMzRfm0s65XawbeCqb3e1W4uJBCCo5y1XNsvvf21QxXFpAPaWqh5qxfz2bzBiiq0pyjmm6LFdy607bZiXzWwrmJ7zGLqGh1NcsC2hxPUDYB3u0RjOgat+GSwQyiyB1RFZjZot4olWMD10AfmQhvVAxNHtWC5YSF3S1Ule6pweKINEaoIiQDYmcc6HRH6u5eSusSXZhMaBczgVwjm5G4RGkxRVeS4LT+lObFwWeSTzpjuPSVKD9Ibfq4I0b80aHmAaBvnBm8HdJrifCpTE101z8zFHYHktSjQhyUy+QP5jbv3z7Q7oMAOyeX6PN69I9XELe0XF5nQuAEhqhKRnjgEwkjmUOWJfd8Ga6kalq+pDaH04SzNHFqYavDReiCt3oG4jAdl9gdshDBwYV5yDzNjSMpWtF8+yr8bFKLu/jlUZ0HlGYe1XIGdt12WqqhQhTQY5NwSwl5AFTYzx31/C5cd/zNYq15RJddkMdx5IfY44E5T3TTgr8Bx6ecomlJewiP+i6qgRbe9cfw0VTB18QWI1NO0PSY7w1cO8fuxjKRqUNK1BAPnGn4ZTXsl4cjI9bGxH/TVvVkv7AhvIcabgAKS8CdCkqdWo6AjB2ktzR8oNGVfPi2BBbq26mtcO5k4q+emhp7VRcfgo+8HUnJ3T74c8Yi3C6ou0mA3QQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(451199015)(8936002)(52116002)(6506007)(6486002)(186003)(2906002)(86362001)(26005)(2616005)(8676002)(5660300002)(1076003)(83380400001)(478600001)(66946007)(6666004)(316002)(41300700001)(6916009)(6512007)(36756003)(38100700002)(66556008)(66476007)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?79pwPlOebOrnZUkr1iVct1m5vKv7EfMHiFRG/yrTKPgP2qWcs1/HwZzl882a?=
 =?us-ascii?Q?FJhXMmFRbUacI93J5VrxrB0giaJHp5UHDJSlcr++HbLjo24ViEEmLGt45CAo?=
 =?us-ascii?Q?cL43gX+8TbKZbBzyj0wHjkXkwvkUVx2yNbeuJ8yf+yIvdcD2J4XYgVkikA+F?=
 =?us-ascii?Q?YthreBaBPKaB0E/jtFySweukcOPObjH1RZDsCSCycz0olKsEB+fgrfOpcXx0?=
 =?us-ascii?Q?unhASJ1Iq3EtHfOatPiEqw5zDpDFoWpMV9bJZBP2lnlVPgkLqbat3qs9QLim?=
 =?us-ascii?Q?qxhTkJ9ABFTM8IWaca7Dj5FDBRsrg+n3RG4af5kCu38fslUj+uBiR6Y1/w0s?=
 =?us-ascii?Q?Oga+WX7zIgg8hnVzgFhFgXn3PIfDqro5UVHNKcTecMzBwRNoraZsC23jgEzO?=
 =?us-ascii?Q?Yw1NG/ydFDSAsfSNMVTMUit4TAU1xrNAGYz1ZpwGcU3/rNn2/Fq2zPchbY0N?=
 =?us-ascii?Q?HC4CS1DX+wOgjMaR+0jkYzIlEv8FUb0EsrUV8Af+WAzhKdG5TR3PZBOiNgf1?=
 =?us-ascii?Q?qtGlBoGCZ+q1GTmEz6vm5kIwQbqoiDapDs8dQM1fGjgZVaWZsxITXDcUPAyS?=
 =?us-ascii?Q?mXMlfxdYm+AygEuJOcOKfu9xYdOJM6ClXLaMVQyoL/UBRFRHTJrm2QxC5Iay?=
 =?us-ascii?Q?WgND13L1LpyqV5Upe14eNFulD1rjtVDMva0gtSOz7zwowkLv75gGMihjJ0Hv?=
 =?us-ascii?Q?SSCoVPg/PTVKYmNcbHeJhD2hLaPqYDhEcs/s9jwpmP9XWOowESr3DaB+5iN4?=
 =?us-ascii?Q?sYMk7CEf7/KSKUBWu15/AyREEORpd0SNIDFCcAoT8UgzX27VA7//ahNjYukX?=
 =?us-ascii?Q?bBXc4e3GLL/3Tq+a6tJQitlYTC1Jg4uOr2j83YyLT/SCP9DWbfxfk89fsFUw?=
 =?us-ascii?Q?r9jeu2G36WMPFM5Sx0tJ+yNyvjAH/GxyM5EsY82YWOR4vcI23hFQtosaHFb8?=
 =?us-ascii?Q?r+jfRQ1ufCdJj5lQu3cUUn7PgOjdhLM2fR4WyZiD8MtqbCry0JR97VGNOMnN?=
 =?us-ascii?Q?JBzw+VXdpXjNIi2CPS+bo/cQHafjcbO36l09NYnQkZZeavOmVIs0DyP/Sd2i?=
 =?us-ascii?Q?BoSmgG/KI2dAxyWtnRBLbZWLoiwa8Hu2MzX1QqofozkEM9cLS3er3k/99nYr?=
 =?us-ascii?Q?SkP3gw++17+NPXei8penKqOE5LN/pOr5qdi/drZDwTd/kdlwqodwch6EVyeM?=
 =?us-ascii?Q?BFJSeIsKwDLTaA88pfW0hQ45jvtbNWEPpsv9eUgh4iZSoa7ccR0Msn/fJItu?=
 =?us-ascii?Q?hBXN2OdaJ3uvbemuR146Rs554JxRLkOk/mP11Da53p8TQBxYSotIQgvcNA5U?=
 =?us-ascii?Q?CGXzlOWyaQ7EJAx6494YEZJ6NacwojiplaEW8YOCQFYmpC9IIpI74x72Lsp9?=
 =?us-ascii?Q?rXI40T6+AdpkEYNGW4Mk7RpJB4T/2BBUW+ocVh0IwoAvHqLg62+r4AqWyY2d?=
 =?us-ascii?Q?5chk53oip2ZAJCfGBfKgOIGxfgBSFzh2TNyZkvOkBeU0t4FwBCcLVnSS/ceu?=
 =?us-ascii?Q?HBAioM9uG74KafLTJS9w9857cE00Bk8oIlBKjruOnuvdyLKBSnAnHv+ssLON?=
 =?us-ascii?Q?uQPyCk2eXcEWZCT0vpByJTxbniidJCsUHRgBQjzOjEJwtmsZQEpIcLgLn43B?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6d7186-8d3b-49f6-c0d4-08dab1b4dcc6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 09:32:38.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnf35dawu7GasKU/UVtsQOJdHLMuqyMpWBHt61NZI/NOeBBkPw69fRoL8ZoKhg3bEUKQY46bzb5Qu7XEAgg9xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
X-Proofpoint-GUID: ft310Z8v7Ma_LJxxxek1nNm9MJNgqvni
X-Proofpoint-ORIG-GUID: ft310Z8v7Ma_LJxxxek1nNm9MJNgqvni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_05,2022-10-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 09:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171962

In current SDK, when running the following command in python
shell, we get an error.

$ python3
>>> from cryptography.hazmat.backends import openssl

The error message is as below:

  cryptography.exceptions.InternalError: Unknown OpenSSL error.

We could set OPENSSL_MODULES explicitly in nativesdk-openssl package
so that when SDK is set up, it's in environment and we can
get rid of the above error.

Also, there are other env vars that need to be exported. And we export
all of them to keep sync with openssl-native.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../openssl/files/environment.d-openssl.sh                    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index b9cc24a7ac..516bbd1c56 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1 +1,5 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
+export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/cert.pem"
+export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
+export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-- 
2.37.1


