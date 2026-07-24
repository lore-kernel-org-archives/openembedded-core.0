Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BEFC5321C
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:04:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27434.1784923482667381168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GWudjXhj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1665965d86=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGsN6U2222015
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:04:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PZHVDd+ECROqcpf/iOo6iyQoD0kOpiNqLBgWBKl2jwA=; b=
	GWudjXhjWlyZ+7HtveplsJaJNA+Vc1347F1P9fA4DADSm3iYIqCTYUApidUByNVO
	DWxvxqlRVEOIvonpZuOqZXkcG9GQC3RU5OqHZN8BIm1MR2CY+a7T2x4b3oQx60Ia
	0fZF7lTmVc611Np7ugs1Z/TsuCtFW5pOKMvtnUsxa32BYieUyjWkzI1lPTKFLK6s
	DcnWIOEcDNhDj8H5V7W9gzdDH+7HEDiDUGDw4gcoc6IjN+xlSNqFEP8milvu+4v7
	gwBVga6HZLZ2nvvcmJnJmrrHarPAw63UM0yVSeoDQUQkWWUfev4sax6R2ulNjw0A
	V8i9dN38jKNMw7guiYyUMw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fm8ay0q0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 13:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWLBeCL4Xw6G+rF376ggu7p4d+riOMXfBn8S1GLgL5QgXaxhxa0kPXjZRdWPROJ+4F1sstvm/z8z+GuokdmAAYb4451lANNo7sujesBIDMs6sCTf+EjK59O9RXNZIbyJWoTqpTrgBypNZqKb5WisQJZ1i9jRms4jSD5Rks79m1ld/wp9sCSfDI9qoa+tNGDugWpdmZ1DhPMKcNrfHDXOL686BOvMKiKMNo0wQUFsSvyhA5dTGlW3X5vNPPaQb5oL5mezvKeIKQVvMvLHcI6Tt7JNHOIAIyhgb/KuoTgEfSMVRYEeAbLZ9JnAQUZ1IA1Spzd5uK7B11ASFWcZEYdqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZHVDd+ECROqcpf/iOo6iyQoD0kOpiNqLBgWBKl2jwA=;
 b=UFiIKEiQYwRbr2+7M5KmbN1hhQf80CY7Qbqw2RoeEQ6cdaDlZdQEns2oTMBsTfp5ByMWIGKVFu3IIzTrjXYvtZJG5WWpSlQzzm1vFmoP2bA6X8WxPcUP9frJhnN3RN28o+IifFI3fbbReziLR6qfzjTXE88bSN2wDt9gxypl3CTIvYloUIoew7vVkMcuZiaoBAdZiK6MeCMLnoxdG6rXQe+tYq3FE414ztW/AJaqsMBolmxQfWl+sixnbxDxWpw5lWpp6hFOwpxJwnTqzL36DYZS421XMsn5y7HPEHtQJC5t7o7GNgCgwLv7KzDpBwtk/1ZwxkzBnmvc39vdU/k28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:04:37 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:04:37 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com, mattware@cisco.com,
        peter.marko@siemens.com, randy.macleod@windriver.com,
        sumanth.gavini@windriver.com
Subject: [PATCH v9 0/8] rpm: 4.20.1 -> 6.0.2
Date: Fri, 24 Jul 2026 13:04:15 -0700
Message-ID: <20260724200424.954199-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
References: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b9a961-580e-498a-1de5-08dee9bec999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	39NX9+Tz8yyunWUC/M9Y/027c0dcJ/Xw1JC8mQrwp54xUsG/dxDlr4gT2j5k7bIcoA1pb9O9VB8kTIjHUUyopX38ZjMA04fzqq3ArVgsyFNa84dYqaerBJ62qrAk9PXqxVRGnsPU+yndm/QPpAhn0Jn+Cw8BSzDDq1HxKuvtJCIo8dll+N5gGa4366bhAatBDytRONf62//4QL8PzQ7GERZxPyH8SdlSjMsEItKDMRe+3T1z3yAYQhp1Dy4cjpEYIM1aW1OS8TlJXpAyJ0iZ+BDp3gfPUqcTBIs+/xSCE3QArz3OdiXFD5Bc/HpXuDqBCMyAvxWN+JfHffoGoSYmGqByAHA0EKQAloMF9VPzpV9k3KtUC0RWJgbSh6+wptmizMIzWUBLwgBTepZN0b0rrBV8kpFKGkaH25/WBIHtsvq0Khr/BQml+Vf/4q+TdAglw+4lmsmfFYnigIegojUPQR4GAdiYKdhOu57vaWG3GOpgfARJlkPVTS6b4iV7GPTvxOJVS7ZhpLTbpbIJlrBHRxoPha+gYLhU7bHgj1PjVOh2Bus8Y3RMpn9Hh5x6ZTK2+Fsbne4ol4JNf9KQHY+ixZQe6nWrXCN/wjfibxflsBnjOENgZ97tB0MsXkantCQLvT9BpWJYDGBjFxzn0FHSQYJXzB+1V9wvxrqcqrs6oiPTtYUKhkP+bw+ioGhWq03GbIOkbJO7zsxnm9/j9LchlVYnDLjMt4H5Amcsi75UQcU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VAbiwf5X32f6an1UHJVeWXGxIUCCdp+sVWw+Pd6O1rL9BvAbtKPTqsa/Jsjw?=
 =?us-ascii?Q?7cNk83aubAKLkJeQBz1n2ii/COx6Fpgt0YrHpYnHTO08vqztPI+hTNHN4vbi?=
 =?us-ascii?Q?fYnBwvpaxM6mTJ9ET4EJVXhpWgEWRw6xgVHh9HNT1hX8OJF6ZVH/0+sfjmSC?=
 =?us-ascii?Q?DtwEXmkfGo/xSXMkO7FQ/JVgUaKLoOf0DXeTJ6cKhawcojMrn8PRoZq8bRZy?=
 =?us-ascii?Q?HLf8jMeJjrprL6SAOtEMANASvHsRzuHziup3NkKhCsOZ0Uy7/JeQqDYULPnk?=
 =?us-ascii?Q?3fwYL7lB2eacvlYcOLOVlqmkckGL9T/gQy+T07FGDHCnYQxesJ0nS9KOL+NV?=
 =?us-ascii?Q?YGFE1J5Gu+DWl4p04jOeh0CDh3qWakrAHPD/HX3rubendBbM3fyaCH6omD4f?=
 =?us-ascii?Q?H2+6Q9ufM0ZaBE0lH27mrfkw2o4L4MsNaBS/BXrGoZgOwGgVUB8idgiO6l0X?=
 =?us-ascii?Q?GiJDrM1zlu71D0W4KpdBBJWVUsBiF1HbbYncJc4ucxjvvy7v4U2VvDW9H4hP?=
 =?us-ascii?Q?PWsiUOq6sdfnnqaMQ6zn0Fjl7APlgIsUHGdOlprQJpmoijDC4L5VRl/HyNAi?=
 =?us-ascii?Q?N8daDfA1eTOUxr/j7fEx5NSXnzcVVIB/5xpgawYzWqwiE3fiCRs1AFFiwCCO?=
 =?us-ascii?Q?rsXLabI1lvapdgHseOvJTwYfUGpLBk8hbv8GLTX13fZQgR88H5d9WOK0hNc1?=
 =?us-ascii?Q?2D8EKIkXVPtVAbDIReevCpRNg1LmhB1x2/hp1H9TLvnBsptv+zjGo1Ixs0vY?=
 =?us-ascii?Q?2DMbWFBKxzGeHlJ7EM/X7/H3rxH1Ck56K7EzN5L19KLcKBFrZSfU6CbZO6Eb?=
 =?us-ascii?Q?HbW0gZspfPkFFm/SCmglU9ogA4C5y2wiKYJdh+/9tPcFwaOIaP6pcEnF/Zk4?=
 =?us-ascii?Q?ylvfsZpJgWKM1DHXxv+qhQiErUZOrm4PelBCZfWZS/Pusi0kOx2T22rfULid?=
 =?us-ascii?Q?IsS9R2pKh5RO9p1stoHq3FQx8LJO6bZ1sLs85QRww+7CLWDPqixtAXkP45Uk?=
 =?us-ascii?Q?0u4DpcfE3GLXWcerJ+bwrOSP0TgLSt3efqIyjNP3le93fxX396e2LuYILASy?=
 =?us-ascii?Q?RrsdS2d1QRhcOWRaL1q08MbzWvwjDjx631JesoRJB1N0dfOjhdkepXracP7h?=
 =?us-ascii?Q?uxSHZ+R31Y8WMcxB8bW8EF5U/KTAU0329tCByOEOBHXB/fktxenbxgnktVpJ?=
 =?us-ascii?Q?r6pQUKXCZH2mIqeTVTGZDWKeds0cP/oth7JTTHOPHLc/IM6IBr5RaeKCShBq?=
 =?us-ascii?Q?MM+5WP3z4dQKmkPH8t0N8feOd9iFIDjjdQnepDVS2Ya/2UGtsAZWeNxplXzG?=
 =?us-ascii?Q?hACIfHMtOw/qw49sM0Q7v0nkLcsnrLEHOsiQfbsa9zYyb6+VQrPsiXHn8c8e?=
 =?us-ascii?Q?alCtC1ORTpfXMbgBBW1E9vV52R8SO/5CeqKce0YQauWr2XIMWl/+7lOXFpDy?=
 =?us-ascii?Q?TFO00TkFbF5uHxBqir2cu/aYmRn848PX8naT5H8/6Gu6MdKvbXOfPlbi5Jzc?=
 =?us-ascii?Q?1fo/kLzqXtWHnlwGuqxBwd/AsYSkKGUWtxWaZk7WhPhIV4jaPksI6ExoZ4BV?=
 =?us-ascii?Q?b0MzrMiB76ns/e4950ko3IBa3Cy//uH+fPbOirxC0SLA3h9k3u8Ebqu+Q+ud?=
 =?us-ascii?Q?OSQslcyU2b7/dO3IVVJ+UDSIaIAU1tnW3dyG1Hobq1iOslewwfTovQc6ekK5?=
 =?us-ascii?Q?T8JfsuedGDtV6hgfTR5mfDxvWv4Wh3N9cyf6GVqlqSzeE+EXvbn8MQq/Stce?=
 =?us-ascii?Q?W78XzDIPIQPZGoSyYPVs5hbB1kDMelU=3D?=
X-Exchange-RoutingPolicyChecked: 
	TUvyQzz+8bKtxtoj2MO8lcmCYV4qNOMOZsJd2cUtK7Q9XFdE3Uvzwiz8aH8Xicb4jCMfo8J1AyTwaGNp9PtbFfLHT3r2ITmHB7hWxhu3BLv+9zlfzrp+x4QgKTXEN7unOug3V6JqcljDz+pGn7wV7XCfYk3d/UGd63sf7yL7PIBL0a9wTAps5TP5+mxnUvVDrYVpP0SSc2MDR+oCjeAy//e/IqQKU+45iCWlGLzNT2sqj6cJmX+imzAyernRrbfxDiBMBokGbJ6uioycwdPnk1mdbSMGwdO61QRh+VsNVOhJonhsyu2q3/WS5Xd6+ljgh1mrqEygnN2fI/Wyawmjjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b9a961-580e-498a-1de5-08dee9bec999
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:04:37.0163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frLvHG9Vb4dHYlT3vCP/4bv95hebKGMxQ1iCwAWYDTSB0RNbPQRcbui2Jj0syM+sCi30I3ztehp5TCMkMyodrAvyZzWom9GF3xNraTOUYsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: FAUznnUAdqSqqAKTEo5aD0QB0-cS8TwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX2FOaNHBpfr3V
 5qXcEti1XP0XbMeF/belVqV/8BEqniG9coKfb2wb45GUubI7VJr6rzIOLD0CMHo5JzUXl+T1oab
 +rAPaWP7HDpvX3CwyUehNWP8HQn+kh4HAW7PHbMs3mS8cAtj28YCd+RyqCsyODjNM7lRmTIAHVL
 jsb+VTQS24P4Ps3BJtr7BtWGzVnPs8qoM7oXH+vUVvaE5w5lklVGG2IYrGvd2vgcQj9uapu4tNI
 kfzPUq8YVqaisO1BzUZYN1oea1PRFr3ks0uDpcMWo34m3oxVUtD7fcneIiCO7QSKaacQcIEvf5L
 SMC/iD0UZL/rhIJydtTzUJbrdTp/pQZmOIfE5LSV74J9hxHJVelXd7w73x0RQEuJEf9pLrYV5Uc
 JyJIIRaK9zvwWiNs3n3tipTZlb+7lFyGs6FxpXLbDBFwocYZVx5CVhXI9dOH+EYdZd7xe3YFjYu
 pjQuH9jwF49kGJrgAog==
X-Authority-Analysis: v=2.4 cv=LOFWhpW9 c=1 sm=1 tr=0 ts=6a63c559 cx=c_pps
 a=tl4IwOQKiBOeKWF7Rad3dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=078s-uSMSEgFmkSwyp8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX8t0LCH9sLTqf
 ckQfpJWilS+aRTrzhK4X8YlnYgUIpYbHBJV0P/0T+6V8ENzcD3sE6xfK051UL1q5nY+yEX8uMps
 DN7L2ImCuYEgkJUKhZl6evtkDyR1CVwMhvCAmiJQXm/0ooD2WpXv
X-Proofpoint-GUID: OD8Pomkh8gobNZ6PiekjBb2iFDEpWkak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241942

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


Continuing Robert's work.

--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------

Sumanth Gavini (8):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6

 meta/classes-global/package_rpm.bbclass       |   90 +-
 meta/lib/oe/package.py                        |   19 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/nativesdk-sdk-provides-dummy.bb      |    1 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 ...olor-setting-for-mips64_n32-binaries.patch |   22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   18 +-
 ...lib-rpm-as-the-installation-path-for.patch |   24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   18 +-
 ...-PATH-environment-variable-before-ru.patch |   16 +-
 ...lling-execute-package-scriptlets-wit.patch |   12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   35 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   14 +-
 ...end_filter-Keep-iterating-even-if-na.patch |   49 +
 ...egister_bidder-Allow-ARCHIVE_STATE_H.patch |   46 +
 ...er-into-a-proper-format-supporting-b.patch | 1693 +++++++++++++++++
 .../libarchive/libarchive_3.8.8.bb            |    3 +
 26 files changed, 2023 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (96%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-archive_read_append_filter-Keep-iterating-even-if-na.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-__archive_read_register_bidder-Allow-ARCHIVE_STATE_H.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Convert-RPM-reader-into-a-proper-format-supporting-b.patch


