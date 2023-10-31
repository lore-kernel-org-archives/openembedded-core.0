Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2CAC4167B
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 08:17:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.181401.1698740222401708492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 01:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QhZUl5Wj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96683a2f03=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39V8ETh7010200
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 01:17:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=8O5hLFm7ZgBOUP36S9
	h8AHbI/3ynmXMcBsj80KEzkdw=; b=QhZUl5Wjd7szs/M15e1KxpMqxQkWhFuy16
	YSHBCpb5376hlKn+N03kyzEnYCOnPFusiO8SVSWaTCl96N5CjIb23f6fViH320fQ
	VEiMDopctBejJCeixqWMjFpFu+sx/LtVC0KkEBvMigDWPvfsuJlCduYj5YgSCFh/
	lGqFGRLtSZ2hLz1pGIjymqspMGN6JaE0WQ7iYnQ29ccr5qDEuioyrYyZsi5QOREN
	ybRR+mbJlchrdldL8X8lNDf1/1fFUXjgmcP2D185lr+NFOGZTeZylGRICWuOxK0+
	8YaHlBz/ED1WPVAtjK58/GvCznNoXjU5+s3OekBD+uYc69JgwWRQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0wk0k0xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 01:17:01 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39V8H1rU014483;
	Tue, 31 Oct 2023 01:17:01 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0wk0k0xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 01:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WehP9n5ObOz+4hCFVfhx96zX4EGAIT7vWV/FwB3gAHacMa7xP/R3cKQORu31OXHlJueKub7KshrcxMgYswyE8SaD2C000j5XRBFhVwPrZ7+rU0nSqvfJe8M56wmoClI1TeElRQh2BuR5yDa2jL5n3Nqm8ndnuXx7N688ZbJXFrzh8Php6DLDuC5GgNCwVrvspOvW19eFXhlfu1yjfgB/90IyDdDUG1qy7rYqd5v46KbaGGXmTPFFGXEDR520Vlt37NlGVo285Yhrh/7WJ9HWm396v3q2HyO1AgzuLOo8li6Aradz8HVYjaBU40xCFpqqLX79lX+vBGzlzyU4xxOehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O5hLFm7ZgBOUP36S9h8AHbI/3ynmXMcBsj80KEzkdw=;
 b=lfia0BZFR1GuJsEldAnTSz0xjueJu8RpT3lWDZLbjWAFCIwTZPkG+pUbKnW8A87YNWo7gnKhyGT5Fq4WHq1z55h6xWM46loW1vyG7YHjvWz11VxrFkz+VjZW++GPswO/K+deFyXyDHAUR/pUOA2qJCWERqP8q+DmyRknImMuQqveA5XXObKdTTstDRhlPnmqRhOncMtjif40JOE2e+y/q8JPE9SQcTpt+rrwF/a7iL4B4ox6TEU/rN7WyEhCv4dc/MUUs/Twe30yPU50Gs1iM2wmt4YKrtIdBjsRkKi84EGi7GUYXSNfBSxcavEYSznAns6NUGKVnEY9YgiisADb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by PH8PR11MB6880.namprd11.prod.outlook.com (2603:10b6:510:228::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 31 Oct
 2023 08:16:56 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::854f:3bf5:88da:ff2e]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::854f:3bf5:88da:ff2e%4]) with mapi id 15.20.6933.027; Tue, 31 Oct 2023
 08:16:55 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] libwebp: Fix CVE-2023-4863
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] libwebp: Fix CVE-2023-4863
Thread-Index: AQHaC7QMXmJCu0XLuUG0UFMpSz3ZsbBjVZ2AgAA39TU=
Date: Tue, 31 Oct 2023 08:16:54 +0000
Message-ID: 
 <BYAPR11MB3397E411109820E58B9D1F0781A0A@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20231031043732.2696809-1-soumya.sambu@windriver.com>
 <4e92b62d9bf818f30f381aa3b8c3510668f907aa.camel@intel.com>
In-Reply-To: <4e92b62d9bf818f30f381aa3b8c3510668f907aa.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|PH8PR11MB6880:EE_
x-ms-office365-filtering-correlation-id: 73c10389-8c7e-4bdc-c367-08dbd9e9be0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KBipsNlzvHLbYuaLYVc4awtcXtMrhZaWYPpDq9CT/UEITuU4ZwjpV2MpMLoCax45jlRC+b3SqiBOBxsfOaHj7uqdjUfwsx17OFdcM3AXaEdvq6ot1nenX522TaLOfFCgi7Ta5A9p+1/gBNIyBV+kfIzKV0E4XHQGbwPzV3fikycvmQM7OiwEwP1RB2LwyqpBo3OyY85yoI2I78/Cjqwbi7d2jFmUVn14+GY4/+XVoIyl4K4l4NFtITICgN5XfqYsW5hWRwMCy2ZEdTDFN6zeoKUjhPLGF9bpHDa9QhziyWcJAJGtnryuTaNWtQY9p7IZUKoBr+LaQaHJm3MSrL1nzgBdrMJNrUtFfcO5EboPzMXNsZGeFLj4Kwh6D/P1unYPdUYgruVKrCh6PWG/Cp4grVg1BfLjYqKFOET6PEjlQafv4pRVo1bUdwvxVb8ruIh4l3ZKSrnG2heRIjtmjFgKCRP0RM7X7rwN1dDAQKOlm9PXfifhoA0BHQk62oGFrC+KuMlyfTt0bwQcvkfWIfviKXRRLm8ZTukPOOahpokeKdRnv7pbSbCp94VN2Wuf8rpfIqUWzbhdzgPM/u1TdeXMXjXV7zvf7kzODhw3b8E0otArstdQrJ4h5twNBn+SInVWMw6xxNFBIws4WnpJHvJUF1xdMObHtJd1pUBzwVh9yMwRyHX0zDmBdrptJCDXbcXKJknF/tAHmPN4fx7BfpHSYA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(346002)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66476007)(316002)(19627405001)(38070700009)(55016003)(18265965005)(2906002)(26005)(53546011)(6506007)(166002)(83380400001)(33656002)(9686003)(8936002)(66899024)(71200400001)(8676002)(38100700002)(7696005)(66556008)(76116006)(66446008)(66946007)(86362001)(64756008)(110136005)(4001150100001)(478600001)(966005)(41300700001)(5660300002)(52536014)(91956017)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?cOZb9L6iNWqK4FFzf8w4y4ukBvsHWeB9wnbiY3IQUUEoVNvFG9G6T6GVh8Y5?=
 =?us-ascii?Q?hx9tUPpzGvaPRwCjXF0PeV7Hi4Dp2KbDBcyiu7Wwjz2Qk7Q67JLljWS3dR9O?=
 =?us-ascii?Q?XtOk+ko3eypvnX4Dn1Tp/1v2GvLZ492/jOn7NLmpmsDUF1p9uu6GwO8ZNOOe?=
 =?us-ascii?Q?BosxjVXmQvGsdYdt/AoWJUuQyZ2UJDqWXEuZuboOOMM5aZmpXrAtNWTojRuk?=
 =?us-ascii?Q?FcvitdhWXBJ1wSHMQ5F2NhRq5M3BYEBoiVyC+arsXGGblW+9R/OXudfzk8zT?=
 =?us-ascii?Q?jMcizs/V4H1gJ3odCoCNQD9UWJdhSAvwiTu1IOToghT0g68RhTu8NlaXJ1n9?=
 =?us-ascii?Q?lvQvluh8b0w5hADPSpJVgC/TRpTmNXEmHqlKBdSrsXlRgl6wbi5ZQwDFXxAr?=
 =?us-ascii?Q?Cw4ym4TEWw8UBRsTbQkVz6ZaWyrJbUPxn3vtqKLHPDPdxUCbrXwEBXHTZSgf?=
 =?us-ascii?Q?LJzaxL2L0Y8hRtM16gbnXxsYMIKo/H+SPsGCfQOaNvweC/f/aqT3RkZ3EHCY?=
 =?us-ascii?Q?GHN/YwMqqDW2kUM6yxv1E5omZ4JJ2JBFq0lDdEeUzQC8bF0lHdsq8b4Faz5j?=
 =?us-ascii?Q?H+qC+TZ5U1tr3mK3Tf1JR/l2CAOUhhNlIuWRAxfny6kXQ5MWdxFeGSCxl+F6?=
 =?us-ascii?Q?0qZojiJEBGhLDpbQncM4Om3Ak+QuoT414HHj7mQ4qeUnBp2olh4Oe6sARPOe?=
 =?us-ascii?Q?dmi1p0yPZ99V7XiIkKOD+swdHNkxZk9WTxJfzqiKNFnNZecbgditbG6dB9pV?=
 =?us-ascii?Q?0R9JGj0qqDdOdKSiCrK+esxbTLvlE6SVYe8OrtKd6crGAAAU/Oep6SbTrkGS?=
 =?us-ascii?Q?sihBhPo5Shro6C+Q2+RZ+cKIo7g5zuvdbPvFPA5y2c2A0IRn1dZOZa/2Yc6i?=
 =?us-ascii?Q?EydjpLFljQQwx2pjXMcnkfgLzki6FMH/cAheT0zzqcKUJZ2o8M2TfqEcmV0w?=
 =?us-ascii?Q?nyLj8ynt1UdifX4a6bDdS49cw0w6JMrQZI23u+/G00ygLsGWy68yTypJEWGv?=
 =?us-ascii?Q?Fnb3mqlYWKoG/OnhjMfyYT9F/oFkZU3VbpgVnNNWVmVhFY4tpqyGX3T2oDX6?=
 =?us-ascii?Q?dWGgZttGsjrrIHr7anSqR3MUSfQcQowulqMHqasn642G2gYuFEceLAX9qMTZ?=
 =?us-ascii?Q?49c0k3XZmZMnFg76Wb3wcr3e0KzL19g6C73yrB5wo1CIA+gl7wVOTZKv1BXY?=
 =?us-ascii?Q?QeL7mGYwvdyxiBheIN/HnDMtFTTWVahblZfW+hftsyTklK1Y8lm28Jx/4eDH?=
 =?us-ascii?Q?kNlrz654T5bXeVusH0Inem9KLVNfhdFnik2QIf/Rk8skD2BElT/zYyyiCT1a?=
 =?us-ascii?Q?QovhGyp1vFoZfcBN54zFzcV9lHK+rMGk7v+xmgMeDyuscoDwnFx+QcmUwoJx?=
 =?us-ascii?Q?MoaKPN8OaR9ECEpC2e0cksnuK0T9jEf5pCticAFXSPoei21vzfv9rbmd5o5V?=
 =?us-ascii?Q?E8XMR6OhcWJpeuyR/50IT7nXusJLEJnobSf/bNUPx4gm/BkdM5pccTKmusJQ?=
 =?us-ascii?Q?wRq1WBpzCs68W7xVvwsfRM/x4meo/1WTXym+CijuAENzrcp9wscD58+ghdfH?=
 =?us-ascii?Q?hQd/mzfl5PibzZiKnVfYazLWM4whdqvpIsRwzydw?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3397E411109820E58B9D1F0781A0ABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c10389-8c7e-4bdc-c367-08dbd9e9be0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 08:16:54.2169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oZHn8tDUz5NO4S6brgBe5OcEc/l0TI0koLKDIEPphY5AkT4lXE6hr6MPmUuC8iju/QN8CgHaAQfXwFQPOyq5aA94A1LVJNdznOaXCC+pxbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6880
X-Proofpoint-ORIG-GUID: iWcZ6YCDRU4EsijGMcNSKBItA8lhGWa-
X-Proofpoint-GUID: TaQDGQjJTzjf2vVTRfHEzYaSsBG2HVvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310240000 definitions=main-2310310064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189830

--_000_BYAPR11MB3397E411109820E58B9D1F0781A0ABYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes Anuj, I will correct it and will send v2.

Regards,
Soumya
________________________________
From: Mittal, Anuj <anuj.mittal@intel.com>
Sent: Tuesday, October 31, 2023 10:25 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Sambu, Soumya <Soumya.Sambu@windriver.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] libwebp: Fix CVE-2023-4863

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue, 2023-10-31 at 04:37 +0000, Soumya via lists.openembedded.org
wrote:
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Heap buffer overflow in WebP in Google Chrome prior to
> 116.0.5845.187 allowed a remote attacker to perform an
> out of bounds memory write via a crafted HTML page.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-4863
> https://security-tracker.debian.org/tracker/CVE-2023-4863
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c12
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../webp/files/CVE-2023-4863.patch            | 109
> ++++++++++++++++++
>  meta/recipes-multimedia/webp/libwebp_1.2.4.bb |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-
> 4863.patch
>
> diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> new file mode 100644
> index 0000000000..4c60cbc9a1
> --- /dev/null
> +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> @@ -0,0 +1,109 @@
> +From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00
> 2001
> +From: Vincent Rabaud <vrabaud@google.com>
> +Date: Mon, 11 Sep 2023 16:06:08 +0200
> +Subject: [PATCH] Fix invalid incremental decoding check.
> +
> +The first condition is only necessary if we have not read enough
> +(enough being defined by src_last, not src_end which is the end
> +of the image).
> +The second condition now fits the comment below: "if not
> +incremental, and we are past the end of buffer".
> +
> +BUG=3Doss-fuzz:62136
> +
> +Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f
> +
> +CVE: CVE-2023-4863
> +
> +Upstream-Status: Backport
> [https://github.com/webmproject/libwebp/commit/95ea5226c870449522240c
> cff26f0b006037c520]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + ...x-invalid-incremental-decoding-check.patch | 48
> +++++++++++++++++++

Patch file included by mistake?

Thanks,

Anuj

> + src/dec/vp8l_dec.c                            | 15 +++++-
> + 2 files changed, 61 insertions(+), 2 deletions(-)
> + create mode 100644 0001-Fix-invalid-incremental-decoding-
> check.patch
> +
> +diff --git a/0001-Fix-invalid-incremental-decoding-check.patch
> b/0001-Fix-invalid-incremental-decoding-check.patch
> +new file mode 100644
> +index 0000000..21f67f4
> +--- /dev/null
> ++++ b/0001-Fix-invalid-incremental-decoding-check.patch
> +@@ -0,0 +1,48 @@
> ++From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00
> 2001
> ++From: Vincent Rabaud <vrabaud@google.com>
> ++Date: Mon, 11 Sep 2023 16:06:08 +0200
> ++Subject: [PATCH] Fix invalid incremental decoding check.
> ++
> ++The first condition is only necessary if we have not read enough
> ++(enough being defined by src_last, not src_end which is the end
> ++of the image).
> ++The second condition now fits the comment below: "if not
> ++incremental, and we are past the end of buffer".
> ++
> ++BUG=3Doss-fuzz:62136
> ++
> ++Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f
> ++---
> ++ src/dec/vp8l_dec.c | 15 +++++++++++++--
> ++ 1 file changed, 13 insertions(+), 2 deletions(-)
> ++
> ++diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
> ++index 5ab34f56..809b1aa9 100644
> ++--- a/src/dec/vp8l_dec.c
> +++++ b/src/dec/vp8l_dec.c
> ++@@ -1233,9 +1233,20 @@ static int DecodeImageData(VP8LDecoder*
> const dec, uint32_t* const data,
> ++   }
> ++
> ++   br->eos_ =3D VP8LIsEndOfStream(br);
> ++-  if (dec->incremental_ && br->eos_ && src < src_end) {
> +++  // In incremental decoding:
> +++  // br->eos_ && src < src_last: if 'br' reached the end of the
> buffer and
> +++  // 'src_last' has not been reached yet, there is not enough
> data. 'dec' has to
> +++  // be reset until there is more data.
> +++  // !br->eos_ && src < src_last: this cannot happen as either the
> buffer is
> +++  // fully read, either enough has been read to reach 'src_last'.
> +++  // src >=3D src_last: 'src_last' is reached, all is fine. 'src'
> can actually go
> +++  // beyond 'src_last' in case the image is cropped and an LZ77
> goes further.
> +++  // The buffer might have been enough or there is some left. 'br-
> >eos_' does
> +++  // not matter.
> +++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src
> >=3D src_last);
> +++  if (dec->incremental_ && br->eos_ && src < src_last) {
> ++     RestoreState(dec);
> ++-  } else if (!br->eos_) {
> +++  } else if ((dec->incremental_ && src >=3D src_last) || !br->eos_)
> {
> ++     // Process the remaining rows corresponding to last row-block.
> ++     if (process_func !=3D NULL) {
> ++       process_func(dec, row > last_row ? last_row : row);
> ++--
> ++2.40.0
> ++
> +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
> +index 186b0b2..59a9e64 100644
> +--- a/src/dec/vp8l_dec.c
> ++++ b/src/dec/vp8l_dec.c
> +@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* const
> dec, uint32_t* const data,
> +   }
> +
> +   br->eos_ =3D VP8LIsEndOfStream(br);
> +-  if (dec->incremental_ && br->eos_ && src < src_end) {
> ++  // In incremental decoding:
> ++  // br->eos_ && src < src_last: if 'br' reached the end of the
> buffer and
> ++  // 'src_last' has not been reached yet, there is not enough data.
> 'dec' has to
> ++  // be reset until there is more data.
> ++  // !br->eos_ && src < src_last: this cannot happen as either the
> buffer is
> ++  // fully read, either enough has been read to reach 'src_last'.
> ++  // src >=3D src_last: 'src_last' is reached, all is fine. 'src' can
> actually go
> ++  // beyond 'src_last' in case the image is cropped and an LZ77
> goes further.
> ++  // The buffer might have been enough or there is some left. 'br-
> >eos_' does
> ++  // not matter.
> ++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src
> >=3D src_last);
> ++  if (dec->incremental_ && br->eos_ && src < src_last) {
> +     RestoreState(dec);
> +-  } else if (!br->eos_) {
> ++  } else if ((dec->incremental_ && src >=3D src_last) || !br->eos_) {
> +     // Process the remaining rows corresponding to last row-block.
> +     if (process_func !=3D NULL) {
> +       process_func(dec, row > last_row ? last_row : row);
> +--
> +2.40.0
> diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> index 4defdd5e42..0728ca60f5 100644
> --- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D6e8dee932c26f2dab503abf70c96d8bb \
>  SRC_URI =3D
> "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
>             file://CVE-2023-1999.patch \
>             file://CVE-2023-5129.patch \
> +           file://CVE-2023-4863.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189826):
> https://lists.openembedded.org/g/openembedded-core/message/189826
> Mute This Topic: https://lists.openembedded.org/mt/102291764/3616702
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> anuj.mittal@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_BYAPR11MB3397E411109820E58B9D1F0781A0ABYAPR11MB3397namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yes Anuj, I will correct it and will send v2.<br>
<br>
Regards,<br>
Soumya</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mittal, Anuj &lt;anuj=
.mittal@intel.com&gt;<br>
<b>Sent:</b> Tuesday, October 31, 2023 10:25 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Sambu, Soumya &lt;Soumya.Sambu@windriver.com&gt;=
<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH 1/1] libwebp: Fix CVE-2023-4=
863</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue, 2023-10-31 at 04:37 +0000, Soumya via lists.openembedded.org<br>
wrote:<br>
&gt; From: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;<br>
&gt; Heap buffer overflow in WebP in Google Chrome prior to<br>
&gt; 116.0.5845.187 allowed a remote attacker to perform an<br>
&gt; out of bounds memory write via a crafted HTML page.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-4863">https://nvd=
.nist.gov/vuln/detail/CVE-2023-4863</a><br>
&gt; <a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-4863">=
https://security-tracker.debian.org/tracker/CVE-2023-4863</a><br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c12">=
https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c12</a><br>
&gt;<br>
&gt; Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../webp/files/CVE-2023-4863.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 109<br>
&gt; ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-multimedia/webp/libwebp_1.2.4.bb |&nbsp;&nbsp; 1 +<=
br>
&gt;&nbsp; 2 files changed, 110 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-<=
br>
&gt; 4863.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch<br=
>
&gt; b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4c60cbc9a1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
&gt; @@ -0,0 +1,109 @@<br>
&gt; +From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Vincent Rabaud &lt;vrabaud@google.com&gt;<br>
&gt; +Date: Mon, 11 Sep 2023 16:06:08 +0200<br>
&gt; +Subject: [PATCH] Fix invalid incremental decoding check.<br>
&gt; +<br>
&gt; +The first condition is only necessary if we have not read enough<br>
&gt; +(enough being defined by src_last, not src_end which is the end<br>
&gt; +of the image).<br>
&gt; +The second condition now fits the comment below: &quot;if not<br>
&gt; +incremental, and we are past the end of buffer&quot;.<br>
&gt; +<br>
&gt; +BUG=3Doss-fuzz:62136<br>
&gt; +<br>
&gt; +Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f<br>
&gt; +<br>
&gt; +CVE: CVE-2023-4863<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://github.com/webmproject/libwebp/commit/95ea52=
26c870449522240c<br>
&gt; cff26f0b006037c520]<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; +---<br>
&gt; + ...x-invalid-incremental-decoding-check.patch | 48<br>
&gt; +++++++++++++++++++<br>
<br>
Patch file included by mistake?<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; + src/dec/vp8l_dec.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 15 +++++-<br>
&gt; + 2 files changed, 61 insertions(+), 2 deletions(-)<br>
&gt; + create mode 100644 0001-Fix-invalid-incremental-decoding-<br>
&gt; check.patch<br>
&gt; +<br>
&gt; +diff --git a/0001-Fix-invalid-incremental-decoding-check.patch<br>
&gt; b/0001-Fix-invalid-incremental-decoding-check.patch<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..21f67f4<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/0001-Fix-invalid-incremental-decoding-check.patch<br>
&gt; +@@ -0,0 +1,48 @@<br>
&gt; ++From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00<br=
>
&gt; 2001<br>
&gt; ++From: Vincent Rabaud &lt;vrabaud@google.com&gt;<br>
&gt; ++Date: Mon, 11 Sep 2023 16:06:08 +0200<br>
&gt; ++Subject: [PATCH] Fix invalid incremental decoding check.<br>
&gt; ++<br>
&gt; ++The first condition is only necessary if we have not read enough<br>
&gt; ++(enough being defined by src_last, not src_end which is the end<br>
&gt; ++of the image).<br>
&gt; ++The second condition now fits the comment below: &quot;if not<br>
&gt; ++incremental, and we are past the end of buffer&quot;.<br>
&gt; ++<br>
&gt; ++BUG=3Doss-fuzz:62136<br>
&gt; ++<br>
&gt; ++Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f<br>
&gt; ++---<br>
&gt; ++ src/dec/vp8l_dec.c | 15 +++++++++++++--<br>
&gt; ++ 1 file changed, 13 insertions(+), 2 deletions(-)<br>
&gt; ++<br>
&gt; ++diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c<br>
&gt; ++index 5ab34f56..809b1aa9 100644<br>
&gt; ++--- a/src/dec/vp8l_dec.c<br>
&gt; +++++ b/src/dec/vp8l_dec.c<br>
&gt; ++@@ -1233,9 +1233,20 @@ static int DecodeImageData(VP8LDecoder*<br>
&gt; const dec, uint32_t* const data,<br>
&gt; ++&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; br-&gt;eos_ =3D VP8LIsEndOfStream(br);<br>
&gt; ++-&nbsp; if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp; s=
rc &lt; src_end) {<br>
&gt; +++&nbsp; // In incremental decoding:<br>
&gt; +++&nbsp; // br-&gt;eos_ &amp;&amp; src &lt; src_last: if 'br' reached=
 the end of the<br>
&gt; buffer and<br>
&gt; +++&nbsp; // 'src_last' has not been reached yet, there is not enough<=
br>
&gt; data. 'dec' has to<br>
&gt; +++&nbsp; // be reset until there is more data.<br>
&gt; +++&nbsp; // !br-&gt;eos_ &amp;&amp; src &lt; src_last: this cannot ha=
ppen as either the<br>
&gt; buffer is<br>
&gt; +++&nbsp; // fully read, either enough has been read to reach 'src_las=
t'.<br>
&gt; +++&nbsp; // src &gt;=3D src_last: 'src_last' is reached, all is fine.=
 'src'<br>
&gt; can actually go<br>
&gt; +++&nbsp; // beyond 'src_last' in case the image is cropped and an LZ7=
7<br>
&gt; goes further.<br>
&gt; +++&nbsp; // The buffer might have been enough or there is some left. =
'br-<br>
&gt; &gt;eos_' does<br>
&gt; +++&nbsp; // not matter.<br>
&gt; +++&nbsp; assert(!dec-&gt;incremental_ || (br-&gt;eos_ &amp;&amp; src =
&lt; src_last) || src<br>
&gt; &gt;=3D src_last);<br>
&gt; +++&nbsp; if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp; s=
rc &lt; src_last) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; RestoreState(dec);<br>
&gt; ++-&nbsp; } else if (!br-&gt;eos_) {<br>
&gt; +++&nbsp; } else if ((dec-&gt;incremental_ &amp;&amp; src &gt;=3D src_=
last) || !br-&gt;eos_)<br>
&gt; {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; // Process the remaining rows corresponding=
 to last row-block.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; if (process_func !=3D NULL) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_func(dec, row &gt; last=
_row ? last_row : row);<br>
&gt; ++--<br>
&gt; ++2.40.0<br>
&gt; ++<br>
&gt; +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c<br>
&gt; +index 186b0b2..59a9e64 100644<br>
&gt; +--- a/src/dec/vp8l_dec.c<br>
&gt; ++++ b/src/dec/vp8l_dec.c<br>
&gt; +@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* const<=
br>
&gt; dec, uint32_t* const data,<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; br-&gt;eos_ =3D VP8LIsEndOfStream(br);<br>
&gt; +-&nbsp; if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp; sr=
c &lt; src_end) {<br>
&gt; ++&nbsp; // In incremental decoding:<br>
&gt; ++&nbsp; // br-&gt;eos_ &amp;&amp; src &lt; src_last: if 'br' reached =
the end of the<br>
&gt; buffer and<br>
&gt; ++&nbsp; // 'src_last' has not been reached yet, there is not enough d=
ata.<br>
&gt; 'dec' has to<br>
&gt; ++&nbsp; // be reset until there is more data.<br>
&gt; ++&nbsp; // !br-&gt;eos_ &amp;&amp; src &lt; src_last: this cannot hap=
pen as either the<br>
&gt; buffer is<br>
&gt; ++&nbsp; // fully read, either enough has been read to reach 'src_last=
'.<br>
&gt; ++&nbsp; // src &gt;=3D src_last: 'src_last' is reached, all is fine. =
'src' can<br>
&gt; actually go<br>
&gt; ++&nbsp; // beyond 'src_last' in case the image is cropped and an LZ77=
<br>
&gt; goes further.<br>
&gt; ++&nbsp; // The buffer might have been enough or there is some left. '=
br-<br>
&gt; &gt;eos_' does<br>
&gt; ++&nbsp; // not matter.<br>
&gt; ++&nbsp; assert(!dec-&gt;incremental_ || (br-&gt;eos_ &amp;&amp; src &=
lt; src_last) || src<br>
&gt; &gt;=3D src_last);<br>
&gt; ++&nbsp; if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp; sr=
c &lt; src_last) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; RestoreState(dec);<br>
&gt; +-&nbsp; } else if (!br-&gt;eos_) {<br>
&gt; ++&nbsp; } else if ((dec-&gt;incremental_ &amp;&amp; src &gt;=3D src_l=
ast) || !br-&gt;eos_) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // Process the remaining rows corresponding =
to last row-block.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (process_func !=3D NULL) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_func(dec, row &gt; last_=
row ? last_row : row);<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb<br>
&gt; b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb<br>
&gt; index 4defdd5e42..0728ca60f5 100644<br>
&gt; --- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb<br>
&gt; +++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb<br>
&gt; @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;<a href=3D""></a>file://COPYING;md5=3D6e8dee932c26f2dab503abf70c=
96d8bb \<br>
&gt;&nbsp; SRC_URI =3D<br>
&gt; &quot;<a href=3D""></a>http://downloads.webmproject.org/releases/webp/=
${BP}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-1999.patch">file://CVE-2023-1999.patch</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-5129.patch">file://CVE-2023-5129.patch</a> \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-4863.patch">file://CVE-2023-4863.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D<br>
&gt; &quot;7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df=
&quot;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#189826):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
189826">https://lists.openembedded.org/g/openembedded-core/message/189826</=
a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10229176=
4/3616702">
https://lists.openembedded.org/mt/102291764/3616702</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub">h=
ttps://lists.openembedded.org/g/openembedded-core/unsub</a> [<br>
&gt; anuj.mittal@intel.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB3397E411109820E58B9D1F0781A0ABYAPR11MB3397namp_--

