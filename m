Return-Path: <bill.pittman@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B53C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 16:54:25 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web09.12149.1644944064136452245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 08:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=JBt4PY6h;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=904592b18d=bill.pittman@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21FBrJd5020678
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 10:54:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=PPS11062020;
 bh=q+KMVfwSVnwKJrYlc8+eFuSXESeLFssXNIfb4r3NSBk=;
 b=JBt4PY6h9oQ5ZS30oGMe743h3fQBC2BCWomAb/8CivBi289xry+/FNjtjHWpm+saat8Z
 WwYiOWKJbPmRNdDUtRPHBY+yEx0/5ZZHcI9+BAUOlwetc4n4XembvfvJmShPU4gXTOg7
 MbrMdR2o7jHY6BQ0+2PBfEFM+E/2eJE3bgwSw3UGB5LFOz+XU4FH7HoNSkcObtuGhRCG
 merYf490kHSvaIGbpXpoaBt7KBMsOrfY3w9MKFalVSM6xiSigHdv1zArWEdVymvcK6pU
 6vS9Ps266/oruWiuq07re7JOZ+LdTTvbmCxAiHANZ6jo/JkaepRfjrF3Tr+wb9YGiuo/ gw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3e7k4xk44e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 10:54:22 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNMhq0ZI++FjbCGUcJZXlsrUgm+FZ9rMB2sxzXCimJjH3hQOqGjlTimjI/UMq2HmQmi+99TRsKznkU8BqH3G2M6dgaTes5JRFXiLJ2ZI57HkmaMRCdQAs8IznU3MBbMQb+VN3zvCMQw3K1hvtO/SvRYwbf45pY0bAMhJQFtrswntqB89pcYnor30OYH5ozTg4pEI49iC4IwQgbmBAxaqE0kPmj/iw6zN1hzPtDUpR364Jzkqmd2DnbbmCW5ql6uu+fPzimSuMS4bN5L9FpZuM5znkV6jQsqvfvVL6KMVW+eUErgJQhlFfX5UeUMjCpG4FQkZaV4BBMLXcn1FX9N0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+KMVfwSVnwKJrYlc8+eFuSXESeLFssXNIfb4r3NSBk=;
 b=DUAnYp3HW0enE6ZDeYgRibBdHJ5chAh/0iHDye3qFp9mMrobIqlxejY+pmYMoHLVq53GMaBcyaBzSDFjHMIYezjmtiQ0Qi2YmPRKUc/d6EAKSC9tUSL3V/y66jlagveRraUK7p9WvtX9/5CtmRWyFewZgH5CTLF57o9oPvnyq2xg7kXF0ZAQI6RfD4i1W5I0BXWM0U8PCvpZjE3roWdJPX1hiytzffDbI8n9PWTuAEM0UBNH8pskazEpLWigwxDiln3O84gBQhJ9j6Oib3f6TW7pAsb68BbFtujYETWkdgPZJWE5kmnr3fuVnsRYoji4TYKBxQi85FBG70cjJd5i8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+KMVfwSVnwKJrYlc8+eFuSXESeLFssXNIfb4r3NSBk=;
 b=amhiue1Pg6kESPLv058fftOQNNttsgu0IBY2bXMw85a1WmzM92Omv5gK13ebMHjrWQdLC6m4vPajA/3WzFX5BS2e8PCgN4HhyMwurOsjJO52vV4Sja61NOWqhj6bOJW84KFG4W/5G1ovZ7mZGinfxjcWMzKJPfef9k4SXe3fiEY=
Received: from SN6PR04MB4909.namprd04.prod.outlook.com (2603:10b6:805:95::25)
 by DM6PR04MB4251.namprd04.prod.outlook.com (2603:10b6:5:a1::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 16:54:20 +0000
Received: from SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::f94f:34c:2ba1:b90f]) by SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::f94f:34c:2ba1:b90f%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 16:54:20 +0000
From: Bill Pittman <bill.pittman@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] wic: Use custom kernel path if provided
Thread-Topic: [PATCH] wic: Use custom kernel path if provided
Thread-Index: AQHYIoyKZItvPDvdikOaby+Cm61bLQ==
Date: Tue, 15 Feb 2022 16:54:20 +0000
Message-ID: 
 <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=True;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-02-15T16:54:19.845Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;
suggested_attachment_session_id: f098ec4e-a8ff-71eb-2dda-b2d0c261b899
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdb5d94e-2508-408a-f307-08d9f0a3cf9d
x-ms-traffictypediagnostic: DM6PR04MB4251:EE_
x-microsoft-antispam-prvs: 
 <DM6PR04MB4251212319ED1A0FA424D62BEC349@DM6PR04MB4251.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f3i/GmpDMwsLys/GA62iwmqKH+WSAHpFH37rt4UoIUhQEQGc/mXxKR1k1dVpmJO9weWA8+xVB6N2A9PGmB2GgssrYEWJwrRMEHwuomsqKr61562xp4CzJSqFSuwonH1rXg8WaHDJ6hPxxtWcTOghf7bzkpopu1H4o+RuTNo2h7rGMT7qt4qJA6MMCeg3OKvemM8yKCh1YnoZfjOMkU0ZjshXoS8KwtIqGQwmZnA4KIkugNpxV7IuDbI78VB5NNPaO4HvU+1S2O9DC5MN0VdhOAC0uFj86sgMiSuwghndXfLImJ06ga3KzH4PMFdi6Tihven6ccVg7G7Q4xVqxZdddhNDVoGY7KockNDzWWT5neYgWZEhdGR5tDTpx/IMJ2LUhf5mYGw0eChDRT7Ch/EppHsfxM3Qqy7pABT5zBQ6ZKAgL8NVzYsl+M+li1+CMtHcUWTsFAXQJtglthBx6F3SoTLw7xiwoSSWss80EmWEYOPAIjRjkdoz1/hqvn5O5/oCTogtwt6+0/HUMDityrWGAj87Rl5JWnc6W2s2jtOmvaEONWI//QIgk1wz06VTJdvG+PwuI43AuVIRNdHhv50vWGwA516dPDuQKShDlTEOtfXwaqJ2BIMlbuk4xsLW5ZKpyZHcs+maLEU2r78epSOFoMtDmNSG536OP5S/dqnNcjjcei9HXrGFcO9aUBwNVfPD5mIf6LktxZu2CBriNVLauQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4909.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(52536014)(8676002)(9686003)(2906002)(6506007)(86362001)(55016003)(38070700005)(8936002)(44832011)(7696005)(4744005)(508600001)(5660300002)(64756008)(6916009)(122000001)(66556008)(66476007)(66446008)(66946007)(38100700002)(316002)(76116006)(19627405001)(186003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?BTEsz/4D3MJtvDPEPP/DfiJ4/fSVGMXhBN9uctQPL8P6KqlecTawf5Fr8K?=
 =?iso-8859-1?Q?AaZQDY4+LpKn6qMXWzBqT4f7uUbT2+9M8oPYy3NTdc4rCqrIl08XggjLbF?=
 =?iso-8859-1?Q?WwRfuEj5xeIVCFy+K171DulRNAKWKkz0hjV/sDcefWIx5UXpA5RgLxl82Q?=
 =?iso-8859-1?Q?eQMlc150Nhs+Fy4GBz+xOV0LZZgFjlkBJxnVfpit8GUVwZQXEVG1dFUCJq?=
 =?iso-8859-1?Q?UP7BVpfHEgZoycJ71jcoUoj7wjyzAM57jMBLF6bkS3gfzYjDln3CRiQA8P?=
 =?iso-8859-1?Q?yWlImgYR6NHWiGGdQj9Y2pmFVe9ZuKPNvmEWCUf52ES4HCwoux7SH8m8/p?=
 =?iso-8859-1?Q?g1aDZNP1yRLMYBKVKpRAk0933Ns41BbxAq3VaApVzRN0GGlAM9hLv7hgWk?=
 =?iso-8859-1?Q?ktX9tk65Pxt0ZKUCI3gb3inZGLCgS3brQjwssMKFnbvOlzLSVBDbUSdri+?=
 =?iso-8859-1?Q?v+mBV+5fsCPetFlmjiAQqsMMgETtOKJNm4tlk53xQ4N5SrT5PczNNqgSGl?=
 =?iso-8859-1?Q?saYThdRvZ6MYxHa1jwYuriRdO7zreq3Emb4K6jhHwlsgLAJxvpS53C7V1U?=
 =?iso-8859-1?Q?ONmJdsnqSFa1+qLXNdKzCI3svPbTLsauQTztAE8/iJkN4IxXLuKtnMPTID?=
 =?iso-8859-1?Q?YInoCShSnWpw0EBt24z5ao8UoYFJWZLH7od7pBvYz+31xjNBA0cD7dzJZr?=
 =?iso-8859-1?Q?d5k4GDcE2f1OKaW6Ibx4NTAW7hIeDDEUrp5T3cm+XufvlgOe6oJkyT8Bey?=
 =?iso-8859-1?Q?oXeHwz05EkSTY3vdNat9OkVeTAcNyA9VK4OCubM343WbTK+UolU9rD0Si6?=
 =?iso-8859-1?Q?gHdhMI1ynONvJtVl4xe3Fq0OfO+xicSJzcgXxykftBZw6yEV8NuC5knhoV?=
 =?iso-8859-1?Q?k6h+1h5LxDoEkrNofLMOLoLnPOISF5cRVmcSiURDuZT+7Ps1ZCGV6AmEBF?=
 =?iso-8859-1?Q?0qHFzfv6vKRg1zzShO0YZnVEPi3t0bde1jMPL2zGSNVg5TQYQg+InaqABZ?=
 =?iso-8859-1?Q?jVGkNq2YxMvZet19nInFpYIW6YL3OeJlk8J0x8GQisM9KDZgDj63C+lLRb?=
 =?iso-8859-1?Q?j3xM+iIKBuhhKiLHjliCVB5/2A9AM46Bvs+anCAk1cZgmYDP/1ACt/+bnB?=
 =?iso-8859-1?Q?XTgyI77GMA8NU6id3e+Hhod6hHkDF6OGf7oRcaDXVf29K9aVcLp4b3w1kt?=
 =?iso-8859-1?Q?klGLWYMR4KmyzqBcpJa8yvXfvo01FpE1bpN3Ct0Mwvo9jjJc86wE9AuQla?=
 =?iso-8859-1?Q?GKYqEwlcCf5Nr1uqkY2O4twjVuC+cIYnzqqStLQ6BOZhZp3xXRZvVI3fwl?=
 =?iso-8859-1?Q?RWSEZJyph8rx4sHD86DK34sOrfZQQVE9usqHRhrjHDXBaLyWCDF4ySOoE0?=
 =?iso-8859-1?Q?cXKvMjCJvWPoYVbYqggutnOJhg16oBANDV920wLk6IgrAmDGkftn1agNCJ?=
 =?iso-8859-1?Q?QBYkhVLOoYxv+CxWtgpcOUihDGCq83wVWZrHID3CDPP/TAsqNCECTzb/LO?=
 =?iso-8859-1?Q?T6AwlqmeyLs7mW77ij/KJvlD1DVyxHHkpMGIfVh8DOZqFz5zCvVhvzoYUO?=
 =?iso-8859-1?Q?7juX4+h+HuiUR9mdCDH72uBcdT6S5r2bPIZ6IzlARUXnc+aZ9OJEf43IgX?=
 =?iso-8859-1?Q?GWEJLQ76fwsToi/QreJHU1IRncnFGPEJ3NBHf713D10K8zhDRbQ7ENmug1?=
 =?iso-8859-1?Q?VMeh+n8HpS6Oz/F+kcw=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR04MB49095E1D789819C9E3CEC881EC349SN6PR04MB4909namp_"
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4909.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bdb5d94e-2508-408a-f307-08d9f0a3cf9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 16:54:20.2112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zyv+E9Vd6tHBZ5kIzwGJ+ZGK/eXcWzZfhepxiNWI3f9cHjPdUs+l+tuRQWYooOzsfWglmpkDwbLgEe8NFleG8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4251
X-Proofpoint-ORIG-GUID: -pzsovNLWO0jei7wQcO_OZLQFzzKTLHG
X-Proofpoint-GUID: -pzsovNLWO0jei7wQcO_OZLQFzzKTLHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 mlxscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=628 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 16:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161756

--_000_SN6PR04MB49095E1D789819C9E3CEC881EC349SN6PR04MB4909namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

If the custom kernel path is provided in options, then
use that path instead of the default path.

Signed-off-by: Bill Pittman <bill.pittman@ni.com>
---
 scripts/wic | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index a741aed364..29a157bf37 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -159,6 +159,9 @@ def wic_create_subcommand(options, usage_str):
                            "(Use -e/--image-name to specify it)")
         native_sysroot =3D options.native_sysroot

+    if options.kernel_dir:
+        kernel_dir =3D options.kernel_dir
+
     if not options.vars_dir and (not native_sysroot or not os.path.isdir(n=
ative_sysroot)):
         logger.info("Building wic-tools...\n")
         subprocess.check_call(["bitbake", "wic-tools"])
--
2.25.1


INTERNAL - NI CONFIDENTIAL

--_000_SN6PR04MB49095E1D789819C9E3CEC881EC349SN6PR04MB4909namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
If the custom kernel path is provided in options, then
<div>use that path instead of the default path.</div>
<div><br>
</div>
<div>Signed-off-by: Bill Pittman &lt;bill.pittman@ni.com&gt;</div>
<div>---</div>
<div>&nbsp;scripts/wic | 3 +++</div>
<div>&nbsp;1 file changed, 3 insertions(+)</div>
<div><br>
</div>
<div>diff --git a/scripts/wic b/scripts/wic</div>
<div>index a741aed364..29a157bf37 100755</div>
<div>--- a/scripts/wic</div>
<div>+++ b/scripts/wic</div>
<div>@@ -159,6 +159,9 @@ def wic_create_subcommand(options, usage_str):</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &quot;(Use -e/--image-name to specify it)&quot;=
)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;native_sysroot =3D options.native_sy=
sroot</div>
<div>&nbsp;</div>
<div>+ &nbsp; &nbsp;if options.kernel_dir:</div>
<div>+ &nbsp; &nbsp; &nbsp; &nbsp;kernel_dir =3D options.kernel_dir</div>
<div>+</div>
<div>&nbsp; &nbsp; &nbsp;if not options.vars_dir and (not native_sysroot or=
 not os.path.isdir(native_sysroot)):</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;logger.info(&quot;Building wic-tools=
...\n&quot;)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;subprocess.check_call([&quot;bitbake=
&quot;, &quot;wic-tools&quot;])</div>
<div>-- </div>
<span>2.25.1</span><br>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Right">
INTERNAL - NI CONFIDENTIAL<br>
</p>
</body>
</html>

--_000_SN6PR04MB49095E1D789819C9E3CEC881EC349SN6PR04MB4909namp_--

