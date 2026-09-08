Return-Path: <SaiSireesha.T@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D06EC79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:59:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9539.1788879590993108558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 07:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ciaRO897;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=371198a557=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EhVeQ2625010
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Sep 2026 07:59:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NkJZ3k89tl99OGgA5UQW
	ZRD8gME+7tb6VIh81TzkZCc=; b=ciaRO897a/JN+zHVzT38IQfI4pohJ+hRE3XJ
	b9/xxhn7ndtcA/u9GPltJ4IxxNska8cvVxtJOQGIZ1Tm0hP7PxugU0QQwbYMBpJC
	TQfxMSQI+WrjPalXyOZI9m+ahKMQFLIdPk+rj6nZG1PeHMnpmSBg+ZuylG0jvrn4
	eqIQAY5XaNocJVtrDh7eMfzavc8veBQGdp3mKGSs0xr4Pc5WxwaRXGYPlgF+7+6j
	V/DkuZgfCWZi5Yxkn/w+LFyLna6vK/J164qo7DivUV2THYNTUqTwmxdUfWT5nGmV
	Fj7K6CJAgZBmi20r+icQTYLIjw8WwFMgkwdNkYp2E2qddl8RaQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021128.outbound.protection.outlook.com [40.107.208.128])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggec0v4rn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2EdJ65W7Esgx2zyvJInzgIgp6QKEC+LG+YDRBdxxdWvyYacj3opkRgVKiiDw9pwqZcM5b4hesqT3flywoWV256aDEwCx/eZUtEcEvHjSlkNBFIKaxexJ7C+4tJPpjZQr9rS6SNV6quW6LWH4DuOxeKBgi9rwpsRoS2Pgd+R3NPH5k1bsQNNsEBFq/AYKAv1QlfV4wITTIouzR8S5RjVWcnjN3XzykBpK7F35CbYfxxI+qELYco51LGlVH9dpZttBp4G4KOHD19PK4zTFHmwDJC/j8vHUnU73oFiGsb4teaNkAJT/KYRcb5RyfGEQbYyczy69wooPe7vb5Cg1ajXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkJZ3k89tl99OGgA5UQWZRD8gME+7tb6VIh81TzkZCc=;
 b=B+4jacO4cW6N/ShS/HcnvcWPP5PArafQ8OCsyTzNtSyxLgDNy8uF8jjHvkoks8uckusb/MeCMKpKUimlIpOlC3FIQdtv/dwX0EwtoSuzD9LK5x6bJ1I1vW6iCx6/UqQgW2pHFVfCWAVF4j+W6/OWMkYPUct6VSbCISmOgY7kgcz2QWAWDdkADvrdwwgpjy7DU9niH196gVwqQc3LTaJHaYByzDiqMNhHeNFGNfuIYRCtHblnc2bAIdhCLdymxGWpOXOrIeJzScdiNPHN2T+KooiPz0ePPvFOV1QP4btzAp8/TRmFwqLYKUcZfLJ0gTqOg/HIh88VQM7l8q2juhNL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) by
 CHXPR11MB9673.namprd11.prod.outlook.com (2603:10b6:610:2fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 14:59:43 +0000
Received: from DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::238d:9dcf:c2c7:75e6]) by DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::238d:9dcf:c2c7:75e6%6]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 14:59:43 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: Update maintainer for psplash and systemd recipes
Date: Tue,  8 Sep 2026 09:59:26 -0500
Message-ID: <20260908145926.5733-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:52c::19) To DM8PR11MB5590.namprd11.prod.outlook.com
 (2603:10b6:8:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5590:EE_|CHXPR11MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0ceba3-38a0-43e3-2896-08df0db9d0a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|10070799003|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	d+2AXK6ke5HqkxjkmP869DREouIQd99pMxCXQ1rZAuX9rOCgYpRCHko135Baiet8vKq6uModdaum0E/8SB8J/SC7Vyfn7jecAQhxk7m/aU4ugbakNSdhtH7+DFDX6ba1rIU54VeJI6Z/TWLm5ZtYi3LNFuT9VwO1M6TZ8qNPmAVohrsT4+ulQvxOnHIVGl2ns+lkyEJ8qUIxCErSojUaCm8z7OrMHPC1dAZhXCDUt0FDenD2Uvl+h42zDUfkLgy7+10EFgLQIAm0YVFIyEtkih3WYTCvKvbvmfS51SeaeJXg7s1vEuEztgaJhMyFPJAMyPZzE8j1esIQJxyHGGzYrBFqgh81iuEaWJXN97boicxpdLsDm0HsYiLhQsZ6PKx/MON4HCwdW12kNzlfAnz7FcJlguGhxek2Hhc9++yu0blf2y9X9VQWO6E0Fvas+Q/OJLCJV/v2lXtqhrzSPOSBeDxKldu75pNTo/Af3w9ADOL3K/Y7R922pSHCBXSWdcHELGZqbHMslr0pbB4o9kOKJyiWT47RcqPN0zo6grPFdrssV5ESjPJxEupa7HmPsUICjTBuqQL41GX5XSORZNDsubXJHlLIK313gB+Tob36mtnwsSCh9PlbnQWBDI8Gntfk9yVwcvd9qE4NFz1NHeUeP/DwJlBm4RQWTjvQioIt2zY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5590.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(10070799003)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?863C6MyokrC9QQK1ck+lYX7857iiK713i5mRtkKcV3bh9HayJM1gpanw7Fuk?=
 =?us-ascii?Q?Dnh+o+u2d/0qYB+sacgaejjYiDihZyduXPXGGf9pD+8DlgGlwp2C7VG/B7rj?=
 =?us-ascii?Q?yBcmDk2i4xOfNbmntKPBo9ZMDrRx6z1i8O8UyFEew6Ta2/jVB3M03S57WZMq?=
 =?us-ascii?Q?p541Fnt/OiinG9NKGhge/BTG0MAsEtOkDyZEaJq8ZOp2qmuLFjY0Kc5dgY25?=
 =?us-ascii?Q?V8aJ55tc0+mrddEK4PJmgX9TLvA+ugRB8w5HAI/pdu30AYnkUyIw+jTdrAL/?=
 =?us-ascii?Q?1kAWIsJ4yx7YUxfzaY6tlrOHY2WNEP+Gk6u034vDQMXYxQLJqBKu3RMJtskV?=
 =?us-ascii?Q?avNxc6A8XpbkAtHmFCc2/KIhKvWbRiTV48CJGFsTc+4XsBu7nI1Z4sfW1f19?=
 =?us-ascii?Q?QLiMkrA6IPkGtuaLfySLkgdDI2Aidcp9ZeGEG3z9Xe7r7zZOArgOev3DBnDH?=
 =?us-ascii?Q?/Jo/ADxOfB4LxhmcXQtujoWzv7umIm9vq4gIxboO7N/N9bLaTVOn9en1O4+1?=
 =?us-ascii?Q?NW6ovZGvAj/jGm+N+NK+FpjHEU9BqijVmUkD68eckc38uG5CRK76C/o/ZmLj?=
 =?us-ascii?Q?pma5qBi8iaeq8HGSen/wCt17yhrKyxGMymEKohVfJ7BLHMYoJv3XHK+TUJME?=
 =?us-ascii?Q?l9HSCTGkvSyr9XvgeJ0KC9EiCHnP4/XFPGjeBkmVgypbtapW9KYWX0UdYzxF?=
 =?us-ascii?Q?f/cB742uUVZxS+XtYnRpjgsz02oBfe1jLoAOf7mZNuyC93cGWK5L0b4nUaVW?=
 =?us-ascii?Q?GshwMRY9/tgDRrOt7dE8YSUaDEn8aZpeEUAmQ45R5VJH2KrWmLt8VbAeb2KB?=
 =?us-ascii?Q?qvH/hiLLLlAbV98Y344Q833O0uJ+CB/qJ8QH3ujIPLMiMTwgSGeQDRgMG6JW?=
 =?us-ascii?Q?8/y0yfdS6ewvXeNrRD5+HVpSCUONg60HlA2O2MjbaeSueZ/IEjMhztTi//NM?=
 =?us-ascii?Q?46TCneb95LI1vAKWpdE8IFSFHZ2fa33OBimX7CfMPGl2YOCTsnoJAtY2vwyg?=
 =?us-ascii?Q?dLM4FiS/06bRgXaZPM4+SXPjRJGkJLQpNP4e6PQk49aOQspmeVVd49PlnC//?=
 =?us-ascii?Q?AzW7qEBL5KESTwzxCaFBdVEa8UKlL7H9i04o6xPYCoZhIgYCpaYKV5RXuRt9?=
 =?us-ascii?Q?o3mr8etMcPk5Z2xWLIIQ14NDwM7OnqUeifNDnRD9/ySoJXqcRjmwlpunLU6b?=
 =?us-ascii?Q?zkebklzf4O93slGXYeyeuP4/WY65Mtro1Tmfb+x2Mo3zkesIFdlXxuePzSpt?=
 =?us-ascii?Q?Y/1YaNcqTqAu1BztvKNaPPdrP11NUVmar+vJg5WVjnZ9Tkxj2cuWfo47WpRL?=
 =?us-ascii?Q?Qhkx3WEQuidCV8a1pOe5TSyjwgMvTKGluM2UY1PYtt8WvJEb8XrGhqQllgxY?=
 =?us-ascii?Q?AZ+kCtctGup51Rf/qug2h6ocnJ5nfosEyioj1xRKoKajA6lJON4roe7Cc6cU?=
 =?us-ascii?Q?6uIBCs9Q5pv7XfquQioiIkOLVgEmZwaKu860q7/wxgiCcmSa931nl1Ufq7wg?=
 =?us-ascii?Q?uxOUTeJEvNCcE4hKrwnNcZ4RMv1t6+qwBfwnjY5aTf4d4jpqfZXpLWTDsstN?=
 =?us-ascii?Q?vnVcIqO2Q3lIES31DYCeSZ6PSI4qG7oajU1ZOWiEEhO07TuI2aABaaAZpaSQ?=
 =?us-ascii?Q?SLJ2s8jdNJqDAS5zbTeHRDoo0nD1mw3p22DAttQrJOuQmBjgX9h9FiuUQI3E?=
 =?us-ascii?Q?kp+L6UFXJ7JbH5KqhCoEYAr7nCRulRlNYKZ8RFGXmf7Cid7bkc6huhUYjjIQ?=
 =?us-ascii?Q?OsVM0GrC5cjOQQOoRyQIzs1T7mS/YwdZz3AmN7OnAmO3GzGd1mwPCsQB27Qr?=
X-MS-Exchange-AntiSpam-MessageData-1: RNdt+hbnHJNXikJ8FGqze36G0RBaF3fA1LM=
X-Exchange-RoutingPolicyChecked: 
	4He+5qpvAxh11uhz7l+8ws6gilfO2R+qqLHZuXM6xY5ZSiABx+AoIoE9SeE7ijrA6YuTmF7G9iTKYEdw5TQkFousG2bkFm0x66uSeiQSI9rr6RteZS3zzgkoJUfniBa4BGKL9Rorg++A/wexW6xD6eSi3A3RPCKsNRvzoG5k1k9ice8379tg3fS/Tr1P3/GNnELZmWO9NR+/0taQjK4Ykv9/UfPKRPFlRs9VvoGh+p7bueH9WeolN7fPzaX6ezZoAC8HU/V/v57j3gCh9GF0HQpRQaeq1EkxDFaEmwTZ6nMgE8KGf/kDY6HPLUuOr/Whuh/YKd/EJkDxspJOFAfT8w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0ceba3-38a0-43e3-2896-08df0db9d0a2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5590.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 14:59:43.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vdRAe9L7l9UNkF0vB7TR0AmqvVR2+Tz9JbEuUd8cdXajBtRaK1cIdZDHqshlXh8Z1BCt3QpgdF7VMfLRBY1amWFxEJGZ7/XDDYhJsG1VUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9673
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6aa022e6 cx=c_pps
 a=HH4JkQGtkLi2X7RbypODRQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=7CQSdrXTAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=3KGv8BLWKtougNMjE7YA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vsZzmAi-HJHY9yX0yL0Y3Xk9NWw62zf6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX5kd3nr1o9Ago
 iKaYuOJoVTHh57svQbfcE8QbFgLxrAB88tZw6leISqLVJIhE105jAdcuPXWBQp6tMmyYbjWpTkc
 pKEwkNYjIeKPrfajgzH49hbRrZfKCQJdDKcx8GdxjwX+9LY2aUfj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX6hved7p5pLMT
 C2NPAsGm6DimH23tnUagVaobjxIvntKQd+UAop3+0KsyuwsYO//TUkdeHvijCK70x9EQcWSkR3b
 2QIgjbIa+ZHBd3VIrtva8xc4UINGQF2WMOvJ3Ea9ym5t+4nsDeFWB6mebqrHhr8/sUVaYP2Yk47
 iN+vZP94FD9wTzKNYcdA750nZj0lECXldctCiv/QDhuae6Qj/s9jHsrR9HLpO6Jj6EbY4HcsyFb
 IWOg11v75dCDmtM2kcakXCrnmIHpr2owStkfPbWZsrQpgx6y9G8v1XBX8RFIPq/BO+ftRSRfg8J
 jt3UjLrH0+7ndM8w2aaMSeeeqNPH2gLo00vFYu6mrEBWZzgCaThuDjZMhhU5++J2R1MspOMntx0
 ayqPeHHs/kTHC8mqXi+fb6oKcE+B+FMhpIB43VIwp0AuX9lsAsKuY1u1Lr5rCt8jPfG/GbPTCfs
 yBZ3RRaUQ9Bcd+jY2Rg==
X-Proofpoint-GUID: vsZzmAi-HJHY9yX0yL0Y3Xk9NWw62zf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245374

Take over maintenance of the following recipes:
- psplash
- systemd
- systemd-boot
- systemd-bootchart
- systemd-bootconf
- systemd-conf
- systemd-machine-units
- systemd-serailgetty.

Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6acd953067..605ae9a161 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -613,7 +613,7 @@ RECIPE_MAINTAINER:pn-ppp-dialin = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-procps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pseudo = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-psmisc = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-psplash = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-psplash = "Sai Sireesha T <saisireesha.t@windriver.com>"
 RECIPE_MAINTAINER:pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pulseaudio = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yoctoproject.org>"
@@ -826,14 +826,14 @@ RECIPE_MAINTAINER:pn-sysfsutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-sysklogd = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-syslinux = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sysstat = "Karthik <karthik.gopal@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd-boot = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd = "Sai Sireesha T <saisireesha.t@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-boot = "Sai Sireesha T <saisireesha.t@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-boot-native = "Viswanath Kraleti <quic_vkraleti@quicinc.com>"
-RECIPE_MAINTAINER:pn-systemd-bootchart = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd-bootconf = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd-conf = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd-machine-units = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-bootchart = "Sai Sireesha T <saisireesha.t@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-bootconf = "Sai Sireesha T <saisireesha.t@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-conf = "Sai Sireesha T <saisireesha.t@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-machine-units = "Sai Sireesha T <saisireesha.t@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-serialgetty = "Sai Sireesha T <saisireesha.t@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-tools-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER:pn-systemtap-native = "Victor Kamensky <victor.kamensky7@gmail.com>"

