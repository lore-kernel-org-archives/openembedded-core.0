Return-Path: <shruthi.ravichandran@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7226DC4708E
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 23:47:13 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.3108.1672789631019224354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 15:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=Npxx+S3+;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=0367ab87e5=shruthi.ravichandran@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303K9VvV032008
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jan 2023 17:47:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=Kq5hzGMJXroV8ydl4dr8rA9PVVt43TkYL4FkoPuihlk=;
 b=Npxx+S3+KyMX/OwSAgh6EHqGFvEV+YzES+p/JOFHslg6zg3R42S7R5IgGFnQT4CnsOXN
 ajEky3dLw5Sd/kShDT7+o6OJJtopExz6Np3ZcrsGKDTqQE3TKB8i2+5r/KcEtHHwIiju
 XFGXVKJiv3nhiy8iJDZUKA3ZkmBMyf8YiENjcieTQAk+Y5X2ouvs/2nbGJhpKZI2+o7m
 ihVxdoBhdMkAw9zCwdgvw1mT6HTLEc0VOC9xiCcBdOaixhR0Lq6m4Nc6Sx7KP2Fd9Nsm
 UyYO6jJ0khlEnLiV5Ue1CDy3bOFOt/2DNBcdfXzjKh5KgezcJP/BUWrBkLWu252cBnug Vg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3mtj1juxe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 17:47:10 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U59cm6QLbqXg511t/d+9Lt1gaBRZ3zkU0yAFu0SF8IHGTdkZyLzVH8yu5WL+LwWpzR+nFul0749R4ruc3hAxMQ7vHDYbcJiGQj96PGZZJPtE7Az3tX//yzSg0Oa1qCrMftyT6KDpRzOWx1c3J6oAUKSsHum3qrsZAahZxUHphVpa2XimSc2bJ4HjK6t+tsraF6xOIbYD3e8MDdLlwGXRZgfntRIhTi38X90DZKrVCE8NxdgXYYwMFJd8oydR3hHgGrXz2WhhqCPrTSXMQ+e5MGdWSKEWKeDU90n+/3N+mGL6NfnNowF+lL1xdmYeTbreQb3yMOQzORs1m9NLvVXzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq5hzGMJXroV8ydl4dr8rA9PVVt43TkYL4FkoPuihlk=;
 b=etAUasMzVPrNYkZ3m3cf10B/AoSpBue3C54wCO5O8AWJi5XsvcjmhUOgZMX6PvTiaaojsQ6/Gsx+FTYtc6IX1m59BJt4zvC7eIvCcgEVMX8Q/9rPWDLr/9fKFyhwnuNZsDh3UwSpBg55vFZeMcIvSbuBFq2BQl6eSwitatvtRrSeh37Hog8PWCm0kwZGMx3mvfJPeBqsNQHzqdzy3LFrRaaAiW8R1y1+OasBgwkZpHOfsmex8qiq0yDEbFJG+Qt4f4qLCnNlgK0GqljB9Nqhx99eG2KLYBgtuyBHfwV/Jv4DphVnZf+k60N3jMb+T6pHrbLzaQxVAFgPakS3ikwb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq5hzGMJXroV8ydl4dr8rA9PVVt43TkYL4FkoPuihlk=;
 b=f3QwOsCXvI1oLeY4q3SdiQrcqmu4xrXALF5DOLJlEfENC/JdZhTS43j80tcdpkFK7xvVCdEFp3fgLXtny8V4DIFQYoIsr34Xil27xx0CCfww6MBWsv1oEtiwMrJj00gWx5HRXsDPNG9L9U3ON6aMTvJboK+ZqLXlqJF0kb2kNs8=
Received: from SN4PR04MB8365.namprd04.prod.outlook.com (2603:10b6:806:200::20)
 by MWHPR04MB0638.namprd04.prod.outlook.com (2603:10b6:300:f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 23:47:05 +0000
Received: from SN4PR04MB8365.namprd04.prod.outlook.com
 ([fe80::dfde:bfd5:380e:a397]) by SN4PR04MB8365.namprd04.prod.outlook.com
 ([fe80::dfde:bfd5:380e:a397%2]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 23:47:05 +0000
From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][hardknott][PATCH] binutils-cross-canadian: Add lib*.a
 files to the staticdev package
Thread-Topic: [OE-core][hardknott][PATCH] binutils-cross-canadian: Add lib*.a
 files to the staticdev package
Thread-Index: AQHZH82vq9dy9KVEXk6yDNPlnbv+vA==
Date: Tue, 3 Jan 2023 23:47:05 +0000
Message-ID: 
 <SN4PR04MB83654F02BE05C26FEF78AD05E4F49@SN4PR04MB8365.namprd04.prod.outlook.com>
References: <172DFC4C6E297F75.13790@lists.openembedded.org>
In-Reply-To: <172DFC4C6E297F75.13790@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ActionId=573e6972-c991-4a5d-ad3d-ca5d0fec595f;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=true;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2023-01-03T23:43:13Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR04MB8365:EE_|MWHPR04MB0638:EE_
x-ms-office365-filtering-correlation-id: 9d5a1496-b1b6-424e-dc37-08daede4d1e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bUnQjwKUy6ICpY1/KabXVUSpiaqcinGVjlqqmuAjzzbHMVpbjTVs7xlnUP2cPMLN1KF9x1M+6syhXcseUh//v1qkTFJDRSP1UZNJ152u5RY2Y/zf0eZSFbbwSbV1ZvhodXwFBYKlsl6ScSqzPiWKPtoW/uEAh7xaudeSOFDUUhlG5KAq1G72Y7tRJ84YXqGlhJd8hgUpaNlDweBrY+DTwwoLCe1PcE1EWYWqooYy7B0yYrZURlVweDHH3/EcY00o8H6Z1aElDkBPyx7TnJkDFEC0ALtIlqIch5QufPwbUlMyQAoyQ1s72EdQkcJ1MnL4CnCDXqrEFj3NONxvQTEdHfdmpvHMMZe+vAtWODyDOC60byUneXJbPmndO1KjQ4ITjTGzymsJBnDZeiDtMovwBOSu9rBMA7EaTAMg+3SlmB9qaK+RGbuLZjpNOYJX771H9x4QGI2x3dlK9Am2iiSkRod/j4yr+sCfYVp8dAeU47sJCp8kQGOuz2CNRwkDdKK59KIodCGALrf//ao0O3rbHWHWImcA2JHm16Tz7gNnpHOZq8YcX+si0prbaWmDTVhdkw77LrHqNLPMYNfuwN/tu3dWq9GMQMIuXwl9SkqfO0CUalO9yO6d/t+c8NvHBHESzHyiCaJpQZTvdSNOCgv55hqrNz/sDb9pCptx6Jfd7rB+sp0kQUwqp6+pGO0lf7k3X6/1qzxD+xuP04UxFGjKxA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR04MB8365.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199015)(83380400001)(9686003)(53546011)(7696005)(55016003)(33656002)(6506007)(38070700005)(86362001)(122000001)(38100700002)(186003)(478600001)(41300700001)(8676002)(2906002)(52536014)(5660300002)(8936002)(44832011)(66556008)(71200400001)(66946007)(76116006)(66476007)(316002)(64756008)(66446008)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+s8bYVpfotTPZqkoAKQDl3sYxnaFO4/9nRfivEwrA3be5GSVqFcOlHsZJ8Le?=
 =?us-ascii?Q?7d0WohxR15oQd1HGg04Qq12nl85QBUQF728TFWITCYBSa+o0YgjeLl5dOOw0?=
 =?us-ascii?Q?1UJCH0Gj+J2M4JMj/oS8m5OYD7xEN87BDHp7J9LNNlvsufZkXb5i0T+utfi/?=
 =?us-ascii?Q?0yeL1Ns01NevqCXRSa5U3NHowoGaX5QOwTqOZGEHgoqepIHldUNs2OX4EKKY?=
 =?us-ascii?Q?J/4nbEcUzUrsOKkSr6/n0NEP5NM16poiPQP2T20B6eAEuAnYxK2DAPXFKKq0?=
 =?us-ascii?Q?Z6nFcxhQKf40zo3pF0BKP3toJ2NVGNPFPjz4BdAzROLyjX6e2fnWmzwatN0+?=
 =?us-ascii?Q?3nMKxrL5K1nEQy5CcHQ+EnqnzE2KYh8c7t94JcIh4J2RMrLucEGAoYVlWsSK?=
 =?us-ascii?Q?w+nr7T9Nbj1U6p5dwfQSiIowLp4jqERks+Y3h+Mixwrsrhzxkt2RJEsINcsa?=
 =?us-ascii?Q?3iqidd/ePY+uwvtxvkavbFtFXTfHEsEmoVfflJTw120RNN9NXNtAUlSmOXUB?=
 =?us-ascii?Q?I2L+dUBrD3EKfVGX2We2BPIqv7F1DZid9S+G9d99df9fHE0hwWN7i3iBmpxA?=
 =?us-ascii?Q?tbQIbMdcXuvevQSCHcVoTL21bqlTAoE1N7MJP5kssbu9zQLdq5/Qhu2/cA+s?=
 =?us-ascii?Q?cBmzegRuleA0gwT+FnDZj4DBnxIiUlXXyVCZ1N3WdvMaqraUqn/bc1Q2AlL4?=
 =?us-ascii?Q?E45K9WCQy8CvzuqxFsEAjG7XJz9Gnik2xFvOuu4eH8Rnn1y1vJFCLtMfMLKV?=
 =?us-ascii?Q?vyLZCWj/Ca6oQYApGf56hfQe0aiEM3ZllGn3kKLviubVWOfU++UnN2sprMbn?=
 =?us-ascii?Q?bgCy1QojmONs4sW8UdMZfFmOq/jGmvq5+uQQx1/spukJ1LGJhECpgzWLGOf9?=
 =?us-ascii?Q?HYcOpeB4ex5O82qdOKU5kPDfyYNg1HHZf3nfesP5Cnv8djEGGK7EOf6wuKdc?=
 =?us-ascii?Q?grRj/9tC9TIUw8KIsAcMUBEhVWcTTKa01ikeAbngLjP/TL6tp15gZVPKBEtC?=
 =?us-ascii?Q?y6IbiAvEHu5utCQNmCODAqXHQeorMhnS61vV8kjKUa4zD7G+yhd3qkooQxWT?=
 =?us-ascii?Q?KgVKKSvZBl4plAxrhNpHMJb1AK5tct5aHHiav7+/wF0IEZhxVsbDvxFtv+kY?=
 =?us-ascii?Q?4mEDD9H0tWhh9jdUOCT5JX9iH2t0uBvD3z3sZvhtN3IT2+mjV486RUOv9vbB?=
 =?us-ascii?Q?q4cTHOr+wAvPWJIOXcpCx5aiaHu83ggeBvJWsYbJVPVcxp9caOjxpMRBEO7g?=
 =?us-ascii?Q?EJ1nSd+77aLjgwlOuu20XDxIqHlQyLI1cLOKhClrMaYHuUnKX/9XU5duEMm2?=
 =?us-ascii?Q?Y83HTYNLO+f3KCR3T0T3nF/0mfw5qMM+jEJLxqcswpbI+19YVC73HOvi/EIu?=
 =?us-ascii?Q?wMQavWcfQmxq/ax9DtlWzoW3kytn4lp77otbGi6nOTrlhvS2hNtpoINP9vED?=
 =?us-ascii?Q?Q73Mz7Hitssytr3Ll/PyjHANrQ39qI7qYPvGFMvBSVfOCrolv+wz4UvoSbi/?=
 =?us-ascii?Q?arhvYbdgRGkNDxok4yLQ2nRcP3LEcyyXwMi3e4tWHRbUWpePFVrAuB8dcfjx?=
 =?us-ascii?Q?aOTxTKz1V+Ynb4AI1fFEROSS7BdNyL9UZ/hBhPZ8OFlME187DE1f18HKhWZT?=
 =?us-ascii?Q?OeouRr5YOL0PRmG6oD8o9JQsFRSa3fbVPBzMKqQeff/xgbCyex/GX14IRk2x?=
 =?us-ascii?Q?PZo/mQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR04MB8365.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5a1496-b1b6-424e-dc37-08daede4d1e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2023 23:47:05.5837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42hB/Z8ZGJ57fRd9sN5c/B0FR3OHwuqGjkVFd+HFknP/8atvDWFpWbj6cF7sNUtaVEGMbVhxwGgl9c5KiGkhd+hGhW5N8C3G4dzie4HP2V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0638
X-Proofpoint-GUID: 7yhEY8Ku-2JA1grjdnS8UpyGQbHPdipu
X-Proofpoint-ORIG-GUID: 7yhEY8Ku-2JA1grjdnS8UpyGQbHPdipu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301030201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 23:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175372

Bump. I'd appreciate feedback on this change if any.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Shruthi Ravichandran
> Sent: Monday, December 5, 2022 11:27 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> Subject: [OE-core][hardknott][PATCH] binutils-cross-canadian: Add lib*.a =
files to the staticdev package
>
> This fixes the following QA issue when building an SDK for
> x86_64-mingw32 machines.
>
> ERROR: binutils-cross-canadian-x86-64-2.36.1-r0 do_package_qa: QA Issue: =
non -staticdev package contains static .a library: binutils-cross-
> canadian-x86-64 path '/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_=
64-w64-mingw32/usr/lib/x86_64-nilrt-linux/bfd-
> plugins/libdep.dll.a' [staticdev]
>
> Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> ---
>  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b=
/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index e98f31f9c3..c38936db42 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -30,3 +30,5 @@ do_install () {
>  }
>
>  BBCLASSEXTEND =3D ""
> +
> +FILES_${PN}-staticdev:append =3D " ${libdir}/bfd-plugins/lib*.a"
> --
> 2.20.1


INTERNAL - NI CONFIDENTIAL

