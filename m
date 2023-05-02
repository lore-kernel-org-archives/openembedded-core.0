Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626E3C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 09:19:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.124511.1683019141132713769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 02:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hgGMODVN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4486f635b7=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34296tDS005874
	for <openembedded-core@lists.openembedded.org>; Tue, 2 May 2023 09:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=w7Xq6EbztV03BAwtGyhZaT3RDLRht5oyxp7hUAMgiCY=;
 b=hgGMODVNmDcL7PvKd+h1kqlgL7WsLL4fFO5IJ8Z/Wq0d4vPLPN6TPqcSCvPwBkUVn0W/
 AM1d93LWDY6r8y3BgnQ/9BZALNGzx5MIV4rbfIcNH6oI0bxLQ8/orgBc0P/5OXE0o9K3
 JnEFFvTb4DJTyXHKn1zIYkFMIbAXFqmQucuxT5DjipUU8LjnwdpL/qemsKAONvpv1O5M
 7Hm4PejF8oT32ZXryze5V3AzkVP071OAHlJOOR/BSjdPlxS1O0qDwREzmEZhkVBvtR5h
 D7NaU5zY9+3T7CA5bytuypzJ5rUxgY5UEmSJWC2/i+m2vpj9R/EjVIaiHbG5OLLLyfp5 2w== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8rf3anpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCDW7RmiDAHmebopWGiiSIGSoVfvBqR64raOwYpCHVR6++RAwuiwvRfLxoMO8aHkyjjHEa8laeoEtshAJmNq0C/Fi5MoNf75i7CvLsF50jv+XYiaZ7RlMsN9nzEHAPLlvGwrJO0r9+n/MAtQI52qV5nHPeEb7SLajR/woCV8SIOUrNG4nPNYznYIwPsOUPR39lwkmZL94UMh4LJeWBClbwzfGYdlS7jvX1ZW7cQ8GWx9/l1m+3KoPmbtE31jIYX1p6VgXT7hPG0Af8fHXNL62T9IMTYyULAeDh6uz4U37zl0e+tJfROS4aYpLf/b1vNQsoeL6meUIsjn2Z4WzSf3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7Xq6EbztV03BAwtGyhZaT3RDLRht5oyxp7hUAMgiCY=;
 b=FqnJ+2SjQGaJU5w587Yj9fsjmfcXwsuglim87le41Bec2dv0QThiwYedLC7kqRH+3bEkA0bHUN8zHq0Vl92PzsufCmyDUMrNDC2gGsyHyWep/8BwNODtJQ+CGDQrfWuhtjZl6fc/s4bPzCEPVV02sjLfvkY2cLnQgmsQ+QnfW9As6AMJlxstMaqYwh/gMeYa2lrbIdypPhsXff+CIsDxlZ1MKSWghrtCIV2uVHH2FS4AU+KPq4UcdTXKvQS6I62bA8Q/qTEOzErEpWLNqyHzppolEy9julb+oQuIEP1sy77GFZjQhECPb9yDzzHOG7pfAW5ZH5gfUr/gcQuzGpw4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 09:18:55 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::807d:863b:7a29:4e59]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::807d:863b:7a29:4e59%8]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 09:18:55 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: RE: [oe-core][kirkstone][PATCH 1/1] nasm: fix CVE-2022-44370
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] nasm: fix CVE-2022-44370
Thread-Index: AQHZeArtMU5TKR8qk0uPR3Zng8WSaK9GvgPE
Date: Tue, 2 May 2023 09:18:55 +0000
Message-ID: 
 <MW4PR11MB582224F0555C81EF2A9CA89E846F9@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <17596933F9D3D16C.30288@lists.openembedded.org>
In-Reply-To: <17596933F9D3D16C.30288@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|DS0PR11MB7878:EE_
x-ms-office365-filtering-correlation-id: 896ba9fe-6ed3-4f68-7bee-08db4aee40c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Kp5u9AlWk3Fy96YavGeP/JQRVTHIQFD1WJLIqn9ekDLMmf62zL/Q0iP7MmWs/qnBTYOdvY4a0soRiZkmv2OTKrd6YSkYY8r95v/XCdjg1tqq7Z4CjVm/VgO+zkT0AdYZbjrLTcC7u5QnvfoEd3RQOTX5eA23+3LrTcNhlurvVutxkEIUONMSBgdLp+ctZZys8s76WrVMSFcWYI8grAM8170ogABkuqdVLvPIcctwxpI+WzPFIZSF5OIKgua6nSrzQsOuoXmEkEOJ5sPtCDRK+9tTaKFEg0BHzXz9megYyr3Hq8u27TYIYmmrMjj9jb7QlMfW1U+QlBr/a4+cHJG5RUw2fkTeHfz5zaX3fPagpjeckSiSZQUTfpxpfJ3nyIbyy2aaOqkoLZXsHUUr7cpJNa1Ujb9MCAl5siIeSTfqDn4/h2fR61NoXPGXvXXjzPa8ymEaHpn4BD3BW+i6DDWCryUtyKnIM11hbvUOkj1LDEtaMGWxM/vgM8t/tdpF6ceRgDB5SUoRcVrEgeoU184t2B7C1CfL8vg6F4zY8tAkQZ1LlGrq3kiQa7XnIT00QlNXYoPfJT9d+0Mzep/UsjxfEPc1M+exIG7JFD4Vmbe4KxVcgwZ+ZhjYPsVVwVZ0ajONZJCJrWrLJXBRBdMVAhqKHA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(451199021)(316002)(53546011)(9686003)(26005)(6506007)(55016003)(8936002)(52536014)(5660300002)(8676002)(38070700005)(33656002)(86362001)(478600001)(64756008)(66476007)(186003)(76116006)(66556008)(66446008)(66946007)(91956017)(83380400001)(41300700001)(166002)(122000001)(2906002)(107886003)(7696005)(71200400001)(4326008)(38100700002)(966005)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oLpG6xQpwHZKClSl1/hNWTtE8PGOsueEF1APVvEjT1xFQ/bkN0TmSoIxqzoJ?=
 =?us-ascii?Q?BTMNaEcRXAlhhHxfJ5BBuBkJIN6qI9p7mdzFXL5Uyd4iE91lNJEGxeIbWbUI?=
 =?us-ascii?Q?9BFolGjhVllsfLvZ7nBDwVqUK9aJOHSvRJ5ImqZgP4Kt2PgfMDKF9xhZxGNi?=
 =?us-ascii?Q?P+aKCQUQEnbu3HbSd5lKtCEYWP91ePQUEHiwPVdaXYZ8v+bg+43WKAL4UzrZ?=
 =?us-ascii?Q?ambKfGls4h6RTMG9MKrW+GcrBNIFnmegYsGHkDF+gdG+WWM3Ak0hAYFECCZS?=
 =?us-ascii?Q?djZrEbXKuVnNszD5WMJmmJ+TH8f/5AI7NmPkB2u3Vlfs0jAHjaUI1yjmMQjW?=
 =?us-ascii?Q?05os9MwPvvML0cceNACHW6+mgZb7thnG3ocU0A2C7JU19JXfNaiYq9j4x1id?=
 =?us-ascii?Q?hJjqqKKHDDAABCvD90pi2OA+iEnY/MRyw+mHyTYe/F07vOgyEkGjOKvJSBMp?=
 =?us-ascii?Q?akta2eDiGwe26RzAP9y+kmwxjGaSzwAVEpb//74MbJL62rdVsrhPbQsxAf1J?=
 =?us-ascii?Q?2L8XaY4fD576MprUTZEh16Cw/H2ITXylxsea58Cr/JME+XvX3GTlVjTkaNMB?=
 =?us-ascii?Q?T9TqCOM79SQOPyOoAnMOcLtjXkDXUU6TXpLPYmXeKMH6NBIiC9bHcjKnKyY8?=
 =?us-ascii?Q?aG+BLoc/nLxl+WYQ/p1vMN6tizUbERwkJXq3lNG3PEWl1RgKU6ngOq7ht/yE?=
 =?us-ascii?Q?4G/5G5jGcJV7iU4QlpiSrhSUjiPaSX+tao212d+SLvhDG2tKNwr8ykBbsv7z?=
 =?us-ascii?Q?xm7Sypwh8UECXUgFj2Lzrsj9lK7IwacMkPRUG1AQuEPfSsB88lpdiVbbRfDU?=
 =?us-ascii?Q?UQzvoRAY2umz6Ndeh5MgXpHwgab0PVuZSOIIQL7Hwe0Wlq+SF761KHo71+Ge?=
 =?us-ascii?Q?4mtH1wyU36XnS+1PIBR5g5+KYgLJTZllHPMhCvPoyybBIc7HeqR8ZGJPlInc?=
 =?us-ascii?Q?28BQ1Dv560smFs5AxSG8g4s3D3j4ZMX8eowIlqo4cQrshHU4OGVgnpQejqNq?=
 =?us-ascii?Q?IKZ79s/LLs7PJOUe+L0GExv5ctqNo3+R4u3Y6ttoL8GeMzQze98Ct3/PUAfM?=
 =?us-ascii?Q?yi9NJUV+Q8LtH8CSHmY4LaShP6iWLxVvYWFY8YV0TLZyYaqLn0ksd3zjChBl?=
 =?us-ascii?Q?1ZIAynvyiPiwHDbK2f/RxDVEhRJRxWzZ560tbBkEapXRmPnwKm652Gpovs/2?=
 =?us-ascii?Q?bgeY2bSyVUx83XGGaYGNaVbJRE/j4QlYLj6k/KKpG5v6xHuUbGiH69ZBZV7C?=
 =?us-ascii?Q?f9h3zsTXKYd8MDIfuPv6DLtGZ/FVugh8pzV8XYhB57irNsYKENpHKutXY//X?=
 =?us-ascii?Q?u88cO2O0y5w0kGatVO5LLKYx4gtfK6+wCqchFrd1Magzp3J7GIVSwTeRV/l4?=
 =?us-ascii?Q?cAsdaTT/iuxh4cSGJdt4TaHa4i8X9IeDRIWPgAv7D4mLQsQPNU40kviW/G/H?=
 =?us-ascii?Q?F9JhcQc/DjOLpfTrIA37GoS5ARFvAFjK1NJRSXc5/axKH1OtwK+jbr/Nz4bd?=
 =?us-ascii?Q?Db+2roFtiJ/XtmrcTNVOuWPB6mh8RO6+wNQTH+KcfxW7Dobl3CvDgzhgIoPt?=
 =?us-ascii?Q?q8IgNuUmjbkFy1mKwpyHlRfPXNPbR4osdDcfBvf0LQC2p86TBBiw9VNhtU+Y?=
 =?us-ascii?Q?CJIjrzPdy+Jkw32LJnvvG3eVTmCu6xAovj15GnuF21EX?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582224F0555C81EF2A9CA89E846F9MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896ba9fe-6ed3-4f68-7bee-08db4aee40c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 09:18:55.2359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJrQJFcElO6n219ObN6SyF3waJu91AsT/tq8CWBoT/xah/dKLHAM8dVXLumPOCMP4qe7dhv8VUIFtsaMHOZN5730nioq9sIAt6RU+TrDowFsenvRaqIQx2R4KsFaT6BK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
X-Proofpoint-GUID: AFpY5pQi5T4usk891En_5dcszA9gCpea
X-Proofpoint-ORIG-GUID: AFpY5pQi5T4usk891En_5dcszA9gCpea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_05,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180718

--_000_MW4PR11MB582224F0555C81EF2A9CA89E846F9MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder!


Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s

From: Polampalli, Archana via lists.openembedded.org<mailto:archana.polampa=
lli=3Dwindriver.com@lists.openembedded.org>
Sent: 26 April 2023 12:17
To: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>
Cc: G Pillai, Hari<mailto:Hari.GPillai@windriver.com>; Polampalli, Archana<=
mailto:Archana.Polampalli@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] nasm: fix CVE-2022-44370

NASM v2.16 was discovered to contain a heap buffer overflow in the
component quote_for_pmake() asm/nasm.c:856

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44370

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b=
5d0e19b7dae30d

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nasm/nasm/CVE-2022-44370.patch            | 104 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch b/meta/re=
cipes-devtools/nasm/nasm/CVE-2022-44370.patch
new file mode 100644
index 0000000000..b131460a69
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
@@ -0,0 +1,104 @@
+From b37677f7e40276bd8f504584bcba2c092f1146a8 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@zytor.com>
+Date: Mon, 7 Nov 2022 10:26:03 -0800
+Subject: [PATCH] quote_for_pmake: fix counter underrun resulting in segfau=
lt
+
+while (nbs--) { ... } ends with nbs =3D=3D -1. Rather than a minimal fix,
+introduce mempset() to make these kinds of errors less likely in the
+future.
+
+Fixes: https://bugzilla.nasm.us/show_bug.cgi?id=3D3392815
+Reported-by: <13579and24680@gmail.com>
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-4437
+
+Reference to upstream patch:
+[https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d=
2b5d0e19b7dae30d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ asm/nasm.c         | 12 +++++-------
+ configure.ac       |  1 +
+ include/compiler.h |  7 +++++++
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 7a7f8b4..675cff4 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -1,6 +1,6 @@
+ /* ----------------------------------------------------------------------=
- *
+  *
+- *   Copyright 1996-2020 The NASM Authors - All Rights Reserved
++ *   Copyright 1996-2022 The NASM Authors - All Rights Reserved
+  *   See the file AUTHORS included with the NASM distribution for
+  *   the specific copyright holders.
+  *
+@@ -814,8 +814,7 @@ static char *quote_for_pmake(const char *str)
+     }
+
+     /* Convert N backslashes at the end of filename to 2N backslashes */
+-    if (nbs)
+-        n +=3D nbs;
++    n +=3D nbs;
+
+     os =3D q =3D nasm_malloc(n);
+
+@@ -824,10 +823,10 @@ static char *quote_for_pmake(const char *str)
+         switch (*p) {
+         case ' ':
+         case '\t':
+-            while (nbs--)
+-                *q++ =3D '\\';
++            q =3D mempset(q, '\\', nbs);
+             *q++ =3D '\\';
+             *q++ =3D *p;
++            nbs =3D 0;
+             break;
+         case '$':
+             *q++ =3D *p;
+@@ -849,9 +848,8 @@ static char *quote_for_pmake(const char *str)
+             break;
+         }
+     }
+-    while (nbs--)
+-        *q++ =3D '\\';
+
++    q =3D mempset(q, '\\', nbs);
+     *q =3D '\0';
+
+     return os;
+diff --git a/configure.ac b/configure.ac
+index 39680b1..940ebe2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -199,6 +199,7 @@ AC_CHECK_FUNCS(strrchrnul)
+ AC_CHECK_FUNCS(iscntrl)
+ AC_CHECK_FUNCS(isascii)
+ AC_CHECK_FUNCS(mempcpy)
++AC_CHECK_FUNCS(mempset)
+
+ AC_CHECK_FUNCS(getuid)
+ AC_CHECK_FUNCS(getgid)
+diff --git a/include/compiler.h b/include/compiler.h
+index db3d6d6..b64da6a 100644
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -256,6 +256,13 @@ static inline void *mempcpy(void *dst, const void *sr=
c, size_t n)
+ }
+ #endif
+
++#ifndef HAVE_MEMPSET
++static inline void *mempset(void *dst, int c, size_t n)
++{
++    return (char *)memset(dst, c, n) + n;
++}
++#endif
++
+ /*
+  * Hack to support external-linkage inline functions
+  */
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devt=
ools/nasm/nasm_2.15.05.bb
index edc17aeebf..59b1121bd4 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90904486f8fbf186=
1cf42752e1a39efe"
 SRC_URI =3D "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.ta=
r.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2022-44370.patch \
            "

 SRC_URI[sha256sum] =3D "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa=
6f35668bee2fd0"
--
2.40.0


--_000_MW4PR11MB582224F0555C81EF2A9CA89E846F9MW4PR11MB5822namp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Reminder!</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:archana.polampalli=3Dwindriver.com@lists.openembedded.org">Pol=
ampalli, Archana via lists.openembedded.org</a><br>
<b>Sent: </b>26 April 2023 12:17<br>
<b>To: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org">open=
embedded-core@lists.openembedded.org</a><br>
<b>Cc: </b><a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>=
; <a href=3D"mailto:Archana.Polampalli@windriver.com">
Polampalli, Archana</a><br>
<b>Subject: </b>[oe-core][kirkstone][PATCH 1/1] nasm: fix CVE-2022-44370</p=
>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">NASM v2.16 was discov=
ered to contain a heap buffer overflow in the<br>
component quote_for_pmake() asm/nasm.c:856<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-44370">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-44370</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f=
08b6f135d2b5d0e19b7dae30d">https://github.com/netwide-assembler/nasm/commit=
/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../nasm/nasm/CVE-2022-44370.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 104 ++++++++++++++++++<br>
&nbsp;meta/recipes-devtools/nasm/nasm_2.15.05.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;2 files changed, 105 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-44370.pat=
ch<br>
<br>
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch b/meta/re=
cipes-devtools/nasm/nasm/CVE-2022-44370.patch<br>
new file mode 100644<br>
index 0000000000..b131460a69<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch<br>
@@ -0,0 +1,104 @@<br>
+From b37677f7e40276bd8f504584bcba2c092f1146a8 Mon Sep 17 00:00:00 2001<br>
+From: &quot;H. Peter Anvin&quot; &lt;hpa@zytor.com&gt;<br>
+Date: Mon, 7 Nov 2022 10:26:03 -0800<br>
+Subject: [PATCH] quote_for_pmake: fix counter underrun resulting in segfau=
lt<br>
+<br>
+while (nbs--) { ... } ends with nbs =3D=3D -1. Rather than a minimal fix,<=
br>
+introduce mempset() to make these kinds of errors less likely in the<br>
+future.<br>
+<br>
+Fixes: <a href=3D"https://bugzilla.nasm.us/show_bug.cgi?id=3D3392815">http=
s://bugzilla.nasm.us/show_bug.cgi?id=3D3392815</a><br>
+Reported-by: &lt;13579and24680@gmail.com&gt;<br>
+Signed-off-by: H. Peter Anvin &lt;hpa@zytor.com&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-4437<br>
+<br>
+Reference to upstream patch:<br>
+[<a href=3D"https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec=
6f08b6f135d2b5d0e19b7dae30d">https://github.com/netwide-assembler/nasm/comm=
it/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d</a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ asm/nasm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 +++++----=
---<br>
+ configure.ac&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
+ include/compiler.h |&nbsp; 7 +++++++<br>
+ 3 files changed, 13 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/asm/nasm.c b/asm/nasm.c<br>
+index 7a7f8b4..675cff4 100644<br>
+--- a/asm/nasm.c<br>
++++ b/asm/nasm.c<br>
+@@ -1,6 +1,6 @@<br>
+ /* ----------------------------------------------------------------------=
- *<br>
+&nbsp; *<br>
+- *&nbsp;&nbsp; Copyright 1996-2020 The NASM Authors - All Rights Reserved=
<br>
++ *&nbsp;&nbsp; Copyright 1996-2022 The NASM Authors - All Rights Reserved=
<br>
+&nbsp; *&nbsp;&nbsp; See the file AUTHORS included with the NASM distribut=
ion for<br>
+&nbsp; *&nbsp;&nbsp; the specific copyright holders.<br>
+&nbsp; *<br>
+@@ -814,8 +814,7 @@ static char *quote_for_pmake(const char *str)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* Convert N backslashes at the end of filename t=
o 2N backslashes */<br>
+-&nbsp;&nbsp;&nbsp; if (nbs)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n +=3D nbs;<br>
++&nbsp;&nbsp;&nbsp; n +=3D nbs;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; os =3D q =3D nasm_malloc(n);<br>
+<br>
+@@ -824,10 +823,10 @@ static char *quote_for_pmake(const char *str)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (*p) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ' ':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case '\t':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while =
(nbs--)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; *q++ =3D '\\';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q =3D =
mempset(q, '\\', nbs);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
q++ =3D '\\';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
q++ =3D *p;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nbs =
=3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
reak;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case '$':<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
q++ =3D *p;<br>
+@@ -849,9 +848,8 @@ static char *quote_for_pmake(const char *str)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b=
reak;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp; while (nbs--)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *q++ =3D '\\';<br>
+<br>
++&nbsp;&nbsp;&nbsp; q =3D mempset(q, '\\', nbs);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; *q =3D '\0';<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return os;<br>
+diff --git a/configure.ac b/configure.ac<br>
+index 39680b1..940ebe2 100644<br>
+--- a/configure.ac<br>
++++ b/configure.ac<br>
+@@ -199,6 +199,7 @@ AC_CHECK_FUNCS(strrchrnul)<br>
+ AC_CHECK_FUNCS(iscntrl)<br>
+ AC_CHECK_FUNCS(isascii)<br>
+ AC_CHECK_FUNCS(mempcpy)<br>
++AC_CHECK_FUNCS(mempset)<br>
+<br>
+ AC_CHECK_FUNCS(getuid)<br>
+ AC_CHECK_FUNCS(getgid)<br>
+diff --git a/include/compiler.h b/include/compiler.h<br>
+index db3d6d6..b64da6a 100644<br>
+--- a/include/compiler.h<br>
++++ b/include/compiler.h<br>
+@@ -256,6 +256,13 @@ static inline void *mempcpy(void *dst, const void *sr=
c, size_t n)<br>
+ }<br>
+ #endif<br>
+<br>
++#ifndef HAVE_MEMPSET<br>
++static inline void *mempset(void *dst, int c, size_t n)<br>
++{<br>
++&nbsp;&nbsp;&nbsp; return (char *)memset(dst, c, n) + n;<br>
++}<br>
++#endif<br>
++<br>
+ /*<br>
+&nbsp; * Hack to support external-linkage inline functions<br>
+&nbsp; */<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devt=
ools/nasm/nasm_2.15.05.bb<br>
index edc17aeebf..59b1121bd4 100644<br>
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb<br>
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb<br>
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D=
90904486f8fbf1861cf42752e1a39efe">file://LICENSE;md5=3D90904486f8fbf1861cf4=
2752e1a39efe</a>&quot;<br>
&nbsp;SRC_URI =3D &quot;http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nas=
m-${PV}.tar.bz2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-stdlib-Add-strlcat.patch">file://0001-stdlib-Add-strlcat.pa=
tch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0002-Add-debug-prefix-map-option.patch">file://0002-Add-debug-pr=
efix-map-option.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-44370.patch">file://CVE-2022-44370.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;3c4b8339e5ab54b1bcb2316101f8985a5da50a3f=
9e504d43fa6f35668bee2fd0&quot;<br>
-- <br>
2.40.0<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MW4PR11MB582224F0555C81EF2A9CA89E846F9MW4PR11MB5822namp_--

