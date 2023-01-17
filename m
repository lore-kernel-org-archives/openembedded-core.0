Return-Path: <maanyagoenka@microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E939FC67871
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 18:02:55 +0000 (UTC)
Received: from DM6FTOPR00CU001-vft-obe.outbound.protection.outlook.com (DM6FTOPR00CU001-vft-obe.outbound.protection.outlook.com [52.101.61.22])
 by mx.groups.io with SMTP id smtpd.web10.204207.1673978575408410322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 10:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=McTNSYLv;
 spf=pass (domain: microsoft.com, ip: 52.101.61.22, mailfrom: maanyagoenka@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0s5abpB6scVZgvWavRpXwrv3aFhk2Z21BpU1Z6tIc4ZPOXOxDPqvLNgl+p6d8gNxORMXH/czdc1SBYh42kXl42T9dVKQIKN7SMleSuCKTHu3Ao0zpV3kpuPIWmb/kkNrFhX80kbWJVRa7DUoPe67YZ7C350S5ASbpNZD5BdM8zGw3X5N6AnTaoW4XnD8RdRj6tUxlo5Yh3y/1MoWVmAS14KcemwMlMdT4Hw40KWeTV+dWqBoDI4F3KUS2f/ERHBNsW44w7ai1+kN7stc3L5ZNkwmwFwpRx7I+gUCVPFpX5qr5uCv/ihcnCwCa+o7FlMbBT7D/i5izOXkwKfSi/E5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=754RAezHMWIqhD6msfpciQmnwY3ws1+VO2ixsiEQsGg=;
 b=ElDcwXKhJ5EOegMIyKrkHwLGkfnvhnvLRlcP6oU2s0oNGWkVofnCo+67k9XZ25Xn/gFfNI6c1gM467Rg/LQOmKhGpQ1w8uVQjbDVd1r1T+q1sGtaBmbjuN1ByJ/Lx83J4qXpuUJ2osMu/ne+75gJ6Xh4IpmRqKK6uflKvTytFxCRaOrC4vNM6KnXLAJdO/ACmFC+gfdvBiqegWJywZN/dOUiQZOWn5jDI6oEOWXlj1mPBFY1kMu4tNfOLkWm8Nm2PQM15/EyIbrlfBtu7xKKw+rvkGW57PNg6qsLw/moTAGh9ougU01fbDSa9xonZECpPjfH4gAozCMmhcxiohfZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=754RAezHMWIqhD6msfpciQmnwY3ws1+VO2ixsiEQsGg=;
 b=McTNSYLvpquwedDrTi4jquh1u56JueRl4So5VhiS92SM68J05LY/xGmWAIxYnHKctp7403kpCNdBnGfsj+shQNhQPaVXhSMAKe6Wags5KVh0yHpIjbpOc9USbhw4Tut8j4/WWw+gXMelewHeNYgbtYmf32dsHZm0Jf/5/Wqs1i4=
Received: from IA1PR21MB3499.namprd21.prod.outlook.com (2603:10b6:208:3e0::9)
 by CH2PR21MB1525.namprd21.prod.outlook.com (2603:10b6:610:5f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.1; Tue, 17 Jan
 2023 18:02:52 +0000
Received: from IA1PR21MB3499.namprd21.prod.outlook.com
 ([fe80::7049:1b8a:c381:5695]) by IA1PR21MB3499.namprd21.prod.outlook.com
 ([fe80::7049:1b8a:c381:5695%6]) with mapi id 15.20.6023.003; Tue, 17 Jan 2023
 18:02:52 +0000
From: Maanya Goenka <maanyagoenka@microsoft.com>
To: "maanyagoenka@linux.microsoft.com" <maanyagoenka@linux.microsoft.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] create-spdx: fix config build by adding dependency to
 enable reruns
Thread-Topic: [PATCH] create-spdx: fix config build by adding dependency to
 enable reruns
Thread-Index: AQHZKp3FJpQaJx02/U2bY1eOo3BJCK6i5nYd
Date: Tue, 17 Jan 2023 18:02:52 +0000
Message-ID: 
 <IA1PR21MB3499E02B1F7C9AD4D0F389C9D3C69@IA1PR21MB3499.namprd21.prod.outlook.com>
References: 
 <1673978504-5453-1-git-send-email-maanyagoenka@linux.microsoft.com>
In-Reply-To: 
 <1673978504-5453-1-git-send-email-maanyagoenka@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-01-17T18:02:48.633Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR21MB3499:EE_|CH2PR21MB1525:EE_
x-ms-office365-filtering-correlation-id: ff3c848b-617b-41e9-c36a-08daf8b50d54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5mFL+z4GlVnxldne+mMmEgVLnDhSOStR6Lg/fTs2BodwBhRRRKUEV+ckwcd4vv2WS48TIki+SNVcQF93Zs306cmO7dOvl8YjgJNSPpkOWOXxnwGrNCApYPXhTk6aS25QC1lkkwMdP51692QZDfRIjEnEFTHd6tni8ckC+qmPcqQU3IIFNMVi7DlT8YmYcompDWzRE60iRXBNj5ehOdaE0Gw0T4AifICMdyCs7mKH1iiwuxauWvNM18jQVUfNSTZ+y6V6QlMfi+t0rpP7N9o3XpZRtjHObmfZygU+zg3X1IQ3fxqf2pek53gqyTwGXywzc9M0pyZFBk/I8y7xRM/6iocvFq7IcR9KLJfDh8iJ2fmSq0YPqsc6n2fHPODIJv1Uht575DFH2Ue9/XkK/sZ1uzdm4CnEvNlRYfihgaMFbxEPnL/7cg4oYAlB8ZU1+s5se6eIcKeRhp6mjx5dPOXKYDo+jqU1yl32fkHQd7UdP01xjPzwsH9bdungbR0840GeLRzIso2naqkIRU+/d/vNrWCTYZeopf7jdkeIM+NtiLRhhbyupbckeLQwjsZBe4Ku51uKyifDn3qXUM90rJHg9ET3CQ8l/q0D8iK4Fs8A2r9yt2EShQilvxDZ0+JmI95zO3qTOUkCUbDo5EdEeejsoaVC9hB+D3DI8vl+JBnFvs30r1GjBm+0OMacEyKHV062qjV24QPaZx4rDVyUF79BJE0Qt6PisI8WQ20+TflbjGX6/z//HzVOv2CeiBkWnO+3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR21MB3499.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(82960400001)(122000001)(83380400001)(33656002)(41300700001)(66446008)(86362001)(52536014)(5660300002)(2906002)(38100700002)(8936002)(66946007)(8676002)(66476007)(76116006)(66556008)(64756008)(55016003)(91956017)(478600001)(82950400001)(8990500004)(53546011)(186003)(6506007)(9686003)(10290500003)(316002)(71200400001)(7696005)(110136005)(38070700005)(19627405001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uXgAkyRH/Xof+IZcyQIRRNL9LTZy3EOZz58Fipwf1JsUmzzUDdkrP0/FjvQ1?=
 =?us-ascii?Q?b//ENz8bv/vc4bpqCSxEqJToDtU1jDRhKtEIvxbbiQy92UcuZNGIODQpEeMn?=
 =?us-ascii?Q?0jgCr6f8UVqglU2qwtvKcofsttBflihNBWHTtzDi+LF18VeQnXCGtmtBcXMs?=
 =?us-ascii?Q?JUqm0edDskstbRBYUWDRepA2n3wqwaxn4ygxbYAABHMlWOyWog5dTbli+MHF?=
 =?us-ascii?Q?uG1nPQQ2AjZ051hkYXUCnfk81EOKrRvqft9GWQsPkW+DKV46VPP0f3AHM/2x?=
 =?us-ascii?Q?TXLJ22kr/RmDDQaqiiXOt6uaOSdpI/WpIFAZ49NEfE6PHSRknlkGxF/OivMg?=
 =?us-ascii?Q?8+xVFmO+WSi2KVpUBBtBVcI0JkL1C2AVnkPQcgvr2L7tyo/az5ZXyRrxOU5n?=
 =?us-ascii?Q?Zj24r8RMJSirkf9e4yKXF71u0HojAs8rZepwbtpVQ90pMJebSOb66nQ0DAuh?=
 =?us-ascii?Q?fymNofTAIrC00wpE+o9blO0l971Mjq9CTzLycrkZ91P/mZAuUYA09gDXp0X3?=
 =?us-ascii?Q?x0JMg5Z32H9XxSGgUbsipE0yObu4+/sa5kW3hL3Um36VtqcgjdczZjwxA5nC?=
 =?us-ascii?Q?jE+HumNmDh7/E2f6v0lAkFvjYpTcikOPzvAyL29cSPfkuzu+vLaEMaxaHnx8?=
 =?us-ascii?Q?zeTSVLANahpcWEuO7A/P0Vd49gJiwk3xtomVAcmUBpGLGKVkxwUgxWOQCHmN?=
 =?us-ascii?Q?Wy4hTAJ8LIBVPoxP6w27SvhZv9q0W4jcTaI8tHeJgFYhN3Ch00OBAIeaDCsq?=
 =?us-ascii?Q?qsMwAgGX1nb/2+L6ctSLsZV7H+BZYDeHGR3VT9q62QZCPr43KGmG1yLjUWrO?=
 =?us-ascii?Q?VYIEQvSPxyj8GIjSMP5///3v3A/WcHclZFKPKUk2vRuL30nWy4j9FoanwNpW?=
 =?us-ascii?Q?982ChFgu+Ev5dVWBgMxiGshTyti5apipIdNKoFIwblKUH6UmJdlvSMP1R1O3?=
 =?us-ascii?Q?Jh4J2hYF0ruSjmHLHAcEyLhRq2J0m1dLPI7uodOGHZ5vv3se3IF5BiRgwy04?=
 =?us-ascii?Q?wYzpGHkYd8H+ePhyCn9RtuVsNyQ0RrtViHqJzpv+L3WdM0LD8arYZSZhah4G?=
 =?us-ascii?Q?BjuE6ka/R8jSBXEu/RsLROWzoy4zpAKT2kaT05aja14Ee+v0078hMDVLEroc?=
 =?us-ascii?Q?KGJRbX7gwRel6Dq9Ocr7tenVsS0Gg3uy50WqzHIWV5vpV+LxXa+dYYZ6Pfnw?=
 =?us-ascii?Q?Dui6OmD9ginPS8XvR7YKSAR3FE0WyUICIwmzTd9vL0e9FMhN6jVmDejsGXBq?=
 =?us-ascii?Q?5zelyWCVCwMtllhBqeD+ttiPB4WySGUDKLmNJ79GFGppGWoXQY/dEOl+30Vu?=
 =?us-ascii?Q?rUykEkjvTO239ms9lhERJgNMDcui/XH88bpwP11pjNfwtXZdyRl617pXDtcb?=
 =?us-ascii?Q?CohW6AOtUgcG6oUPzmPYH6XIud5jluWz6FKLDIvLkJT0K5iORlBncOLBaDoz?=
 =?us-ascii?Q?4XI3z1axmuzplKYwpyhJ6fg5C8EkeGxkKeBdkJwEIoN2jTJtj7mhjuXl1SVl?=
 =?us-ascii?Q?irIYSBTwPF8cp0cGgk12/82b1xn22rAwun7ZGHWZNeak8Tamp9vyoaP+SkBG?=
 =?us-ascii?Q?2Avhy7ly48aMUZ9/wTEL2Yx4/IB8y7AZ+gSA3c7K?=
Content-Type: multipart/alternative;
	boundary="_000_IA1PR21MB3499E02B1F7C9AD4D0F389C9D3C69IA1PR21MB3499namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR21MB3499.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3c848b-617b-41e9-c36a-08daf8b50d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 18:02:52.2305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kad3w869d+sanUUHbRuXcQ5hOpTFuTR5aE92aCKXZdnNmnCQQUHD8hNVzKqqV+sCfQoLjZqj4cPIoCc4HRkxbKAZOhZuGPfAES9Cmra4tvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 18:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176060

--_000_IA1PR21MB3499E02B1F7C9AD4D0F389C9D3C69IA1PR21MB3499namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Also, signed off by Paul Eggleton: paul.eggleton@microsoft.com
________________________________
From: maanyagoenka@linux.microsoft.com <maanyagoenka@linux.microsoft.com>
Sent: Tuesday, January 17, 2023 10:01 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Maanya Goenka <maanyagoenka@linux.microsoft.com>; Maanya Goenka <maanya=
goenka@microsoft.com>
Subject: [PATCH] create-spdx: fix config build by adding dependency to enab=
le reruns

From: Maanya Goenka <maanyagoenka@linux.microsoft.com>

The issue encountered is about local stos builds failing (when these builds=
 are
preceded by a local SoC OS or MOS build). Essentially, the failure is seen =
when
building two different configs with shared state, one where gcc-cross-<arch=
> has a dependency
and one where it doesn't (specifically, one where the abicheck class in met=
a-binaryaudit
is inherited and one where it isn't). Hence, the task signatures change but=
 a rerun of those said tasks
does not occur. The result is that when the config with the dependency is b=
uilt and then the one without
is built, due to incorrect dependencies, the SPDX manifest creation stage e=
rrors out.

create-spdx relies on BB_TASKDEPDATA to get dependencies and then adds that=
 variable to
vardepsexclude. A change in dependencies therefore, does not result in a
re-execution of the tasks. This commit adds an explicit dependency on DEPEN=
DS which influences
BB_TASKDEPDATA and triggers reruns for new config builds having different d=
ependencies.

Signed-off-by: Maanya Goenka <maanyagoenka@microsoft.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index f0513af..e2553b4 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -377,7 +377,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     return dep_recipes

 collect_dep_recipes[vardepsexclude] +=3D "BB_TASKDEPDATA"
-
+collect_dep_recipes[vardeps] +=3D "DEPENDS"

 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
--
1.8.3.1


--_000_IA1PR21MB3499E02B1F7C9AD4D0F389C9D3C69IA1PR21MB3499namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Also, signed off by Paul Eggleton: paul.eggleton@microsoft.com</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> maanyagoenka@linux.mi=
crosoft.com &lt;maanyagoenka@linux.microsoft.com&gt;<br>
<b>Sent:</b> Tuesday, January 17, 2023 10:01 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Maanya Goenka &lt;maanyagoenka@linux.microsoft.com&gt;; Maanya G=
oenka &lt;maanyagoenka@microsoft.com&gt;<br>
<b>Subject:</b> [PATCH] create-spdx: fix config build by adding dependency =
to enable reruns</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Maanya Goenka &lt;maanyagoenka@linux.microso=
ft.com&gt;<br>
<br>
The issue encountered is about local stos builds failing (when these builds=
 are<br>
preceded by a local SoC OS or MOS build). Essentially, the failure is seen =
when<br>
building two different configs with shared state, one where gcc-cross-&lt;a=
rch&gt; has a dependency<br>
and one where it doesn't (specifically, one where the abicheck class in met=
a-binaryaudit<br>
is inherited and one where it isn't). Hence, the task signatures change but=
 a rerun of those said tasks<br>
does not occur. The result is that when the config with the dependency is b=
uilt and then the one without<br>
is built, due to incorrect dependencies, the SPDX manifest creation stage e=
rrors out.<br>
<br>
create-spdx relies on BB_TASKDEPDATA to get dependencies and then adds that=
 variable to<br>
vardepsexclude. A change in dependencies therefore, does not result in a<br=
>
re-execution of the tasks. This commit adds an explicit dependency on DEPEN=
DS which influences<br>
BB_TASKDEPDATA and triggers reruns for new config builds having different d=
ependencies.<br>
<br>
Signed-off-by: Maanya Goenka &lt;maanyagoenka@microsoft.com&gt;<br>
---<br>
&nbsp;meta/classes/create-spdx-2.2.bbclass | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass<br>
index f0513af..e2553b4 100644<br>
--- a/meta/classes/create-spdx-2.2.bbclass<br>
+++ b/meta/classes/create-spdx-2.2.bbclass<br>
@@ -377,7 +377,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):<br>
&nbsp;&nbsp;&nbsp;&nbsp; return dep_recipes<br>
&nbsp;<br>
&nbsp;collect_dep_recipes[vardepsexclude] +=3D &quot;BB_TASKDEPDATA&quot;<b=
r>
-<br>
+collect_dep_recipes[vardeps] +=3D &quot;DEPENDS&quot;<br>
&nbsp;<br>
&nbsp;def collect_dep_sources(d, dep_recipes):<br>
&nbsp;&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-- <br>
1.8.3.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_IA1PR21MB3499E02B1F7C9AD4D0F389C9D3C69IA1PR21MB3499namp_--

