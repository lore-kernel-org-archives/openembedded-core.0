Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9B6FA0C4C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:30:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14161.1776241818024028753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 01:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GcHrQB1c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8565c91597=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4Jgat016392
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=nIVlAmJHi
	aA2zEB7yvUzUg/zdXEPY5Qdf/+yP/eTZxA=; b=GcHrQB1ctsTS/oaiaM6pe2F8d
	Nn7u2ZGZBE3v/CrXkqgS2T72zvB9L6BwfJIbjrXOCvLe1oXCONXPj17aXWTJSkJ0
	OHz1caouZTbLfk98DPUEcr9u6mroIPbogbTEFyfRifFnJX0MYFQaBAtu7h8wwaiP
	4U8meSfMgRgM5AGxg4xWYTqUUAqJNkdMdT786Xv2JXTPf206oWbYRacnPX31Zx5g
	6NAAR6zMK9yAVIIK2UPqoEQI8FrEju52C7weQ62eEYIkWTtDTCbhfZ32RY4vZCaM
	nU+gP3Iudt+i9ulvsq/TWsbie+eCpEFf3lWCa9JHT4ZV8BvoDSmtY+7AddNew==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877hstg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 08:30:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC5y5HWm0d+vxmr7tViJJfPFYCAloazSlLKWpa7kCjZ3uDkoR0Bgw4eySqP9EMM4DrJCDZHSmzf+oaaeX74LK6DF3AYdQohGlcltaoMbSxSYbuUqdRJOh5/rFZVaLdVX9uV19H/uBMsPVSKj281MwdvW6AoUrqsfKIsWj8+59+YKnqPNl6WLw9tEha/IwjfVG8onU7sDn9tUdB85kwJDTSTyg7b6fwLNmd44JZvLb8ZwnJkxUdgIVMZLzdM3JpggKF1abB5PPuTAoMA8TZM9V/gxToRNPdnZdP5OoK5lxXtASyJyVWLPacK2oX4W5ePJPaeJb/TUd1uQW3IRMhbHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIVlAmJHiaA2zEB7yvUzUg/zdXEPY5Qdf/+yP/eTZxA=;
 b=aIh9M38wgObZOq7sczjZu6nrW96hKxZ0vLUSoCFv49TBdwDSvt8XZ57vTAPp0Eyqq0qd+y5Pebc6lEegX91Qg2Pl0Ni3IXvruLPbUdWdtN8KaQgSQwkvhSWc41PR5YLZPnulLunCiMyXdNgEdHkQD+//oIe+ok/c4Knaef1W8zbANOJwNZghWir+nGp7soBVLA2BqRohbGD+FqVIoS1XVhG6vJ4Rulkfx8OZFKwC36hz2vlgir/5GsxxBkKQGAq3UDrNmPKFBoqP7ZkdcgivPPMA2Mv1KrJHOUJq18kPqoIc7JiEs9XLCrQXl+l6K1Umsl39l6/XlgCjZ99j5vo2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:30:11 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 08:30:11 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev, mns@gomspace.com
Subject: [OE-core][PATCH] systemd: add osc-context PACKAGECONFIG
Date: Wed, 15 Apr 2026 16:29:49 +0800
Message-Id: <20260415082949.3446677-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:100:55::33) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: f715e3b5-23af-4131-cc82-08de9ac93571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LgG0cqDE7pPEUJCRKrZnnwnsqhQ9zLXQRNY8cUUkUqnbg+BR6q/hAu7vwKJdg4zWo9LNoe71CHsxscISaQWdHup8Sac3OKTcE9yPTlXsjJo3waMndOBWi0+itG3EOrYEsjq959ridxFYjjV373rwUDoxN7TXjmWmV1+pdObqYYp9xX5bxgCwQ2YlC71ns8LEt0ws5QoUJn+6QxnxuNsc9h4W/UjZA/EqaDbIBYPtRuZWJdzTfAo4VKAFICe4+QqIL+D8ZNaBNw49ME0DiTtKsELhONhaGIehArHuT46/TzHsGGe30sgBtfUYBFeUzNYR+IPSz7yHO0fdANG6rDCRSkkIprpLphjqGJLjhElRzx6LDmPBsczFX6PAtMSTvD41nNkg6KzWC7v7NvgtuzJKeSvNYpI/VEcqcJlDI4b7GbB2RApqCXBTAQF42XVpaGR93T0QmAnHH16EAWGKOR3cgi2pjI7MsNBcDQML3xmKKR6TjxWCTLOdkYsdBImUknUfdK+jXHwtQZbg8zOnSm2A5z9yt3DcYjAN6PkdAXf8oz5GEOQrK0GOIA506KYyN79VNo+3/mYw91Gg1Qm+6d7ll56oMaeqC8ft/yhdZz1Qe57nk7jPA0a66mv2mTFnLdUXuLCBIIWC3K6yZEuFbkLgo7T/VLwFbV4soNy/IcWhfWpYRWHeE/xKENvYdYwG3jnWwbaJkSvYGBBZFkDO/EwCpBBsn3ipgFsHP9X9kRIgJy7IHc9hg6LuoBKQndp6dyJg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oK20qhBruXL4c1fijF31eFuU1i1i4wuOIuZ99z5jIPIV36Kv+xHVzL03PqvH?=
 =?us-ascii?Q?6JUmvIFjyApRfV8iZOCBktw2wOBG8XHyrbil3RJoKwxuEXCDOdcGiuvWTWDR?=
 =?us-ascii?Q?Vmh/djwJaFa90ti4nHEm8VRXHUkddbQ81AfCEKFkCysdTctNgAPcYS6orunb?=
 =?us-ascii?Q?IKjXmloM0j+QFD3UU4mI0LEZL+uCjAkXVhteBjXh2fUOzWH45JzNsJVv8Ga8?=
 =?us-ascii?Q?Q11NOG2MT5AG6Xo8Rt2fltFAFZ7eQgYwO9tM/qmLeNcABoGc2W5xKSsH365W?=
 =?us-ascii?Q?qzwlEgIgRYU7ir3Uy3C4adaSEvgpmNfpoPEPxqIzEgRHbS6OCCdsOesj6z2t?=
 =?us-ascii?Q?dKnYo4/wiUA44ZpzbJnGY+bcZXPjJ6JlsJ2WcX0Xl9zYfpEjy0ucHfPfWcVT?=
 =?us-ascii?Q?nZAIYTrKz4rBYhZ397B3Pd31hdfmjKC8eBHaWZtvNnLTWf6OezU4hk2mrPUb?=
 =?us-ascii?Q?DJdRARbYlQZbGaN2h/XVABBiyorg56nC1lSOWLGHplcsmXXeCg+Ntz2VKWQN?=
 =?us-ascii?Q?5ahqxz6iNbslOP1U/FT8IXwT7wTfAEVwmyJmA00QBz3bessre0yTZLIbuJKE?=
 =?us-ascii?Q?Vd9JEPtoko4Ke/ZU4SGNeUL6csW8oRHW6Xr2rZuPlv4dxWlUUMv3Pi0nGSgU?=
 =?us-ascii?Q?72FKEpJrkvTBcA1kVDbKEQps4K2eBkB0uoVsHx1QBkp3u5oiWqUmiClgJglZ?=
 =?us-ascii?Q?NVJz8Kl+jOv7yABQQ2kLohewJOkZv1r3m5LnfdFvBtwSVyUkQtpUNPNIrSbj?=
 =?us-ascii?Q?5BIoaLoSl9nYMKIGJ1+KPR0+17siWEY8AFGaCzJEhFocqdozxHigeqKavmlt?=
 =?us-ascii?Q?Yk2tJFTxEM2ZU2vh+MSnmDNMLYzGzX+ctcNP+S+gWgC8TVTSQfSl0Qfrd0LC?=
 =?us-ascii?Q?Y0rM5ASHVbKgt1nwnIOr6LBvR9aVjgtIAkDz/8vKQAUzdx1K4F5/9ZdJZB7l?=
 =?us-ascii?Q?Gv5jn15pD3hboek0FVuwd/OUznqConwUnyp7OhIwZgoEWK+ioluGrpvyBTo3?=
 =?us-ascii?Q?sRck0OAMJwWQkIGvAmu9ZDEOTYvcfKPldrYbpsFFe9MRwFOxTNiKF2TQ+lGA?=
 =?us-ascii?Q?srxqVgj4GSJcboZaQUaF/0nhCesLFhx+sSQ72PF+bXIfXKEBtuHYhK11LpoW?=
 =?us-ascii?Q?bB4M4SLUBlRHa13Pm1wkY0oTW3EiLDoNy34QhvLvBI2DoQ/BBbrUC/uJjKf1?=
 =?us-ascii?Q?3WkfN3N6Q/KE3Uah1nk9mt4zGk7Bt74rpsnBwI1/yNviqknKt/Yn54NoSFpg?=
 =?us-ascii?Q?u5e8fj5D9I5keVd59mFjHc+kNdwUtBJyDJeRksbKve7i/fpR6iLVwOhuEr2p?=
 =?us-ascii?Q?k436flqRIunJvAhcrelIbEeWK9pS0xjWSD9wQzYN2fD38/81a2xTwi82G2CS?=
 =?us-ascii?Q?gaAmHF4rS+ncdPDlTt1q31AHxtDwY+Vgt/UgGEboy78RyFZe/4mRT+AOWOf5?=
 =?us-ascii?Q?Au7GcoJeXiV1OhuHAYpOmnKLRF8SBwwzr+NuOpJRFMakbKcjYSAoaJRPCU3T?=
 =?us-ascii?Q?Uer3p0f40hr7x8grMaU1fsUZ+gpZAag1omMo/j7hnJoPF3dBAp5JyUk15hK+?=
 =?us-ascii?Q?gII88Lcd0yHMJNQvME3wIkBMD+EsaVi3zmXRJfx8kQTYdzwzsANlGIgNA36i?=
 =?us-ascii?Q?9EZVKk+880Cz0KdoL0iMI8Nf+Vg3NHM54BPt8ILtJSXIdXDrA9MIdCHbtMuE?=
 =?us-ascii?Q?dSjiHjicSmPxyhfxlyWsQPtXEnlV+WKKo0cl5OhRRX1FZisOOisXfRMpyiqG?=
 =?us-ascii?Q?JKOIDGRSBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	ctRc+kkSqCbpi6rH9ezI/w1VXBy1I+WiiV1FZ2eRav/fAMljQcijto4c7vBMt2bIZA2k4WSWhUWox7dxIneCtV+22YXMX6rwhYgf9bXy0B1LrUK45iswSy6go5uGqWR5ObrN1Riv6ZPSLqQIk5gFFOJMJlwOoWua6wc2mrdwxnKQlbo6YEU6yTFD9XlUvD7WLvpJXFGJ0pXL+aH/eFokmgEiNby5PZDn31EcD1GAMDqRjE1+DW9aSIn5SBDmnVfDUDf/QwXfnFtXQObDQrsbY8BSlJfb2W4pHtu0LrewiLra+uA+hzRAOe4RyBsIDUq77Bhv1ikNAVh/cQ5xamwYGg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f715e3b5-23af-4131-cc82-08de9ac93571
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:30:11.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqigWvWVZGWWOxCMuHy7Wci4BX3zPLMkr/yZUy9CuOFEQre2LnLeGauPhNIeGInOl72/I+L32vV2dN1FDbsfyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 5M0Hi2buZKbGB3axzIeewKEW3yaRE7j1
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69df4c98 cx=c_pps
 a=JYb6bdnaVjS17BdPGRuFtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=nv23E9fyAAAA:8 a=t7CeM3EgAAAA:8 a=y07JCRrm8f76fuozGzwA:9
 a=ehkDpipTsgk7cDPTKqUC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EZo2IKWoYkxYjEzKVW_g3fe1NGxz_bKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3NiBTYWx0ZWRfX4JLmPZp/zFQY
 KJh9vXJKRMaFbVgB5BoS6Fe28IxHGCaze/5CKCkO1ZGMn4Eb1D9x6L2ARAaKuojcGZvoHLdGZE9
 P0IDMy39TdjBMILDfaccoEno905Z+S9ysjjhRf9pottoJtUE8uH57drdJPxEuLTOkmjWPztCYLs
 UfXLS8q4FjV5bgeFifmJjmJxfyw0+QoG1XsRl8IcDYQvwgUAcecOb5T8C2ab389k9ZzlmHn5w/V
 RZfVDUq36fGU8V70aqTLT2esJp+5yn/h6zzATdaQD2Tg48/39SSuummi8l0g4GZR4Mwqea9gX5I
 emQP+wmGPw7AdwK7CCfQ7Pdmhuoclm38gasQdONSokMwt4It/facb7V2RnavfzZrf30JOe0H63X
 7AddATzawYVUPOfPxwcfpECfxhID4TcYZ3lhS5Kp24bjTHVJQC7GuBWptS1ltPrEtUNr2tOUJ2M
 9bKlZAgMfS7IRPvaB+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235182

From: Chen Qi <Qi.Chen@windriver.com>

Add a new PACKAGECONFIG to give users the choice of whether to
have /etc/profile.d/80-systemd-osc-context.sh file or not.

This is because the /etc/profile.d/80-systemd-osc-context.sh[1] is setting
PS0 with OSC 3008 standard[2]. If a terminal (e.g., minicom) cannot
deal with this OSC 3008 standard, it will just output the whole contents.
This is quite annoying. See example output below:

  3008;start=9c578e41-1a0f-4b47-9a87-ab22adebe376;machineid=cc467af9bedc4d98a437e5d744928301;...

Below are steps of how to reproduce the issue with qemu:
1. IMAGE_INSTALL:append = " bash"
2. bitbake core-image-minimal
3. runqemu snapshot kvm nographic qemuparams="-serial pty"
4. minicom -D /dev/pts/X -b 115200 (/dev/pts/X is the one printed in the step 3)
5. [In minicom] type any command or just type "Enter" key

A new PR is also created for systemd upstream:
  https://github.com/systemd/systemd/pull/41647
If systemd accepts the PR, we can then use the new option. Otherwise, we'll need
to keep the way it is now.

[1] https://github.com/systemd/systemd/commit/dadbb34919abd3fefeb5b8ccc9794da9398a2503
[2] https://uapi-group.org/specifications/specs/osc_context/

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index 6987d4ad54..7a2f7832d5 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG ??= " \
     nss \
     nss-mymachines \
     nss-resolve \
+    osc-context \
     quotacheck \
     randomseed \
     resolved \
@@ -161,6 +162,7 @@ PACKAGECONFIG[no-ntp-fallback] = "-Dntp-servers="
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false,,libnss-systemd"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=enabled,-Dnss-mymachines=disabled"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=enabled,-Dnss-resolve=disabled,,libnss-resolve"
+PACKAGECONFIG[osc-context] = ",,,"
 PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[p11kit] = "-Dp11kit=enabled,-Dp11kit=disabled,p11-kit"
@@ -273,6 +275,13 @@ do_install() {
 		find ${D} -name \*getty-generator\* -delete
 	fi
 
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'osc-context', 'true', 'false', d)}; then
+		# Ensure there's no /etc/profile.d/80-systemd-osc-context.sh.
+		# Some programs such as minicom does not support this OSC 3008 standard.
+		rm -f ${D}${sysconfdir}/profile.d/80-systemd-osc-context.sh
+		rm -f ${D}${nonarch_libdir}/tmpfiles.d/20-systemd-osc-context.conf
+	fi
+
 	# Provide support for initramfs
 	[ ! -e ${D}/init ] && ln -s ${nonarch_libdir}/systemd/systemd ${D}/init
 	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${nonarch_libdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
-- 
2.34.1


