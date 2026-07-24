Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8C6C5321B
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:04:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27436.1784923483800001637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cr6yvoEu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1665965d86=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OIcLbv2402631
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:04:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=; b=
	cr6yvoEuaFH4G/pG1ISKXLIErDCa+SkHV8pWDBCxDahgA8E1JB7YKjzDqldopEes
	op7TEJx85gkETZGXJ/VG4QBN5hV/t3/180dJfG6Jy45ZyKwCseGEj3dT5nfWDFv9
	MBxGrHnbqq3IW79obVaIK1maTyaLCbiuSBLMkPLRdk26blnq9CBWmb25J7MG4Se9
	1U/DckQCmSk0n5X+q9W8tj2brQgYb65kgDqr9b3q72/6gAmbQvequFPt/q8AnoGk
	7lLhKGyQyoYMmMJ5PVT/ygG0KdCgtJzz3SClr26nJu8QW7G/4KQ/dr6K82rAOzfN
	p36uB8u1Oijw/nts8vqIpg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fm8ay0q0n-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 13:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEsb+94IK7zRlKNUNyIpdOc8RwKFdIUIsqsjlyf+R1IQXepfJ9lPJ9nW8lt2gFKQUIABj0n+LjFp3w1Z5ehsiRg2TaXvI4G8a0UGaKaSDVDMMJKOvtcBy/nsOM8HQHXcT2yV54bsjFvY/7bjL2Shp1HMXBpCeQHuwiehzQYIg4xXSn6Cm0EHUAanQucFr7IT499WdalLnAAXr2uh7H4tnLmSRPxfTdJ2ZGhatwDjuEmoEEiAQ+OJ1Dtg+fdPMqpLhNttrJl5V3MpV2OCYQ4PN0KEDlVzu0Z7pM3U4ffjE0v2RfTDaTijUDH7x6ARqf3sGM2BQRhGQbb3kpwWIulJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=;
 b=ZUj4ekxf+Sw3lgpVXiv875qvfd+/pXjySRzO+BsDeCtcOCEENn7+a+q/m1OXx9jMj3zCmSIe7Wc/6yPoqy5sQhHk1+yZ67wKh7h5lCjZA2KKQH8rUFGV9GJm96zMJur7gZxpPFLhxGByvT3WwGaHyh+UecQ7G7UDFuUhkBodA6Xh3t3LyynhfIDPQvI7jMN84pmMGuLxiLkZFxA8gE5hyY0ea7Mgn2FQQF0Db403q0he9LgNdH+PGLMWynwObahhs25w+mQR6N6v1L0EbdOl6f0YIXwwQe7oS0xKf4K5Aka6DotCARTcBWj31mA2H5kQxZCo3z5EAAmDP7i9yoCEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:04:40 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:04:40 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com, mattware@cisco.com,
        peter.marko@siemens.com, randy.macleod@windriver.com,
        sumanth.gavini@windriver.com
Subject: [PATCH v9 3/8] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Fri, 24 Jul 2026 13:04:18 -0700
Message-ID: <20260724200424.954199-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260724200424.954199-1-sumanth.gavini@windriver.com>
References: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
 <20260724200424.954199-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d94918-ecd8-43e7-3b21-08dee9becb90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mvWxvrDyMQMYzx/Nh7Q7X+yMEYkcnkfHTwor2zA+Lf8ZBfEmQ3RyjoRhfBLQIu6MIPek0Puk25bAiNzBP4aaINFa5ArD6UCxciEWivc8vJ9J7JihrcHH8MrOJq4gRizO7Lj96IGzUAH5U0nnbWIZVTZVAWnw9IPcmEG2VNSxAqDddbdjEnAJZQ58yd3vmi3VM3hC+9n8Dykxw+fX+GBwMsaYa214GBvVc9+wclacs1lVWnQh9OMjoICwYxhefdsX/ttWBPB3QfsES+4CzcnzzODOa4jqGkX1esBEkIvOR9Ihj+Vu4OEL234OyXRVO2HhEQNk33ZWjeGgktisql7dKKB2X3T0UYGdURHw9OA+F6w2SgnfZon9ZC9+j7lgTz2bCGnq3s99yH6wh7gxg4WER3XH7qiVTm/KmHbj0eZN7MNXOD3ho+6XEEvzHjkz25zZuMb6HP1eKZSO0X8mhLJVoS+t6MAVRJr3MGWJABFI9HeHKG8brmDMSwcbcxWHvuHahdjokhFpbg9mt9hfOtjc0D0AgtXThY9/nbDJoJ7PUl4qUZ1youlDyUprWcHqps6UvTyzD2q/id4dN+hsf80/pEV0SoDdwq2SgjtkqiVghx1Fa3zta6NYbmVcn/LHhIrAe3Nvhxfl/FDkxJUZrGojWF8S07LAoPIceSEbxdydEGrpfaWrPezIBkdtsHoc/Q3akybdrD4URCZvlFwDKc+qAYpPeVDDQiC62A1FAkvBeNM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VOjqCP9AByQ4cln0rIvtSYbvXmOOXCoGMejWAYmbhmG02v3xmt4clkGIdnmc?=
 =?us-ascii?Q?kn2//Q0uO1xREJKJZRZyAXp41wi0KVlRG9koR9VXWX8InPjgVtaFDbfZNgv5?=
 =?us-ascii?Q?R2y4KVsgwLKRCDWpUPI2hG6Tkf73sqmkCrpCATVHdQsahuWPKebqOHnSUhHj?=
 =?us-ascii?Q?G7qsDYcH1WNjk9ZruNZVEUsLhzJzUhyjOuSi8C4SHOs6yDcWRGW0k8dza968?=
 =?us-ascii?Q?QdNcvHlRcpJWf9SPhHPnmpDgbIMVEUpdiQCQsipWWbhdM3ZNWlzh1lYtAObD?=
 =?us-ascii?Q?CFyYMy9G8Wo+l9v0eEPBv8C5ic23asayF0UczzdTwTLHe7Q2HS3j7y0RwYOA?=
 =?us-ascii?Q?e2SGgy7gur5mShKKwZFNcM6xQJliSFyqOeRvZqdca3Su5/V6JqZFJUDYdnRb?=
 =?us-ascii?Q?CJarTz5bnFQ0IlruLPj22sxHHKnYcUlWG7Inm1RMcsboUop+PEBpiIolJ0mD?=
 =?us-ascii?Q?bO9/O0YiYICGtBr/Z8GYtQUqQNpCuSY64lAtuRcOLtVQuRWTKD8GdGEbn6Ld?=
 =?us-ascii?Q?AA5fia7YhBya9WZaYtR9+eCfdH+YGeoKBuPLeZKObhAhvAUSwJ3AQazMb6DW?=
 =?us-ascii?Q?p5C9scxGViYvb2YqwQCieKCUN0d8XTABEig5SG/ImUy8iebh3ZxnuCSI7lK3?=
 =?us-ascii?Q?0LzrlA4KG0ABG9OWtWGwkpMSbIEJhbclNVe5OG1eNAofvybXRxmJE64rfqsY?=
 =?us-ascii?Q?+ju4nZwct/CpsGzxYDR9NVtFxVZo465W2Kif6ZoZHl5yKYxM3pYZ4zaj8wlx?=
 =?us-ascii?Q?B86pcE5uT6US6VHsNuIQ+clV4X8DtTqkFpUXb2WnaarDxsxmn+7FQJO242Zl?=
 =?us-ascii?Q?HDCXBZziIA5vY7k9G8qJbY7RvAv7IZ7X+nNtcdS5/WVd0x0lol/okj2HSeH3?=
 =?us-ascii?Q?4GwvbTFpkRCeMRtTmCwMCW7OhWGOBUiRSdzrXqvdOXhCI+i/K9H3x6N67nbE?=
 =?us-ascii?Q?I2kbosGv7qmsvJFUtDEtljqiwVxuS7//E2LMOfQ+OBs7+OZKIWEi74MoFkm8?=
 =?us-ascii?Q?ieHy4vMOALLTZensT4ZmhP1glZGxXNzEjmfJqOp//3JKu9FoU16BxlFKH9kf?=
 =?us-ascii?Q?eTCm58YVLTF7CNAAZgDz21aBJH2gllJKy5T1Y1QpT80022yUgQ2uDK9Xij79?=
 =?us-ascii?Q?S3ZYpE6ZFIId+pNzZYBMUIHpHZL/5iJOfoDeBaNS9frschYqpoAwp5dvMcDH?=
 =?us-ascii?Q?BQ4K1Q9E8PaLq8JmBQhQvBPL6c5BCezodPJHCi5oytU+PBCtZqbB1wv7WWBi?=
 =?us-ascii?Q?VhCe7KTpQLOWdMyRp5AHwYAaNwzdG3BrqUkEQNSpSU2KWKmbWZL+oMvAq8x3?=
 =?us-ascii?Q?MByf/2pbveAXLIfr8QvIuomQAOrxZby12CFddAlzhpE5P3ffEUvy2wa/b4Go?=
 =?us-ascii?Q?mlQ9ikuZycoXJ2a67ScU9tz3joy/WK+5ypkG1a8R3PqA8khrocURMFVuoB+Q?=
 =?us-ascii?Q?U3hokLxvO+SoiS/k14aB9ALN7DPUh5hBDQ515C8gOzLGwR6Ewqt7xObVwudR?=
 =?us-ascii?Q?7M5SRz9IThPdKElg/HqcN57IAgOw3C22SvA8kAXQeeI1z/eTRUBZeM4dpCMn?=
 =?us-ascii?Q?rc9uj5xc0BQiXLDxm0H8AFqVzhEdvvlJaTqfOgeZVfhEvcoWLwhoDtYwcPqf?=
 =?us-ascii?Q?MBJ3RYmt7CKhI5UG8nSOIBAukl2vnX9NAYjNK4ZUaWm8sMxRJsbyBL4T+zkX?=
 =?us-ascii?Q?ZD8VyyB4i+lUAbfdqzSsCGSlPVYCNgE+pl/WBp3ZWgD5lOAfVD7xAkh8xR5k?=
 =?us-ascii?Q?4u8YAfeK2cy91X0UgqvUPMVbhCRQdf0=3D?=
X-Exchange-RoutingPolicyChecked: 
	Z7D/FB/t7m4peq7l5qd4SEZDSbkcBq0RJz3iQi04wIsXLECrdhmCCNyfu0+s2zMIfoL2M09f9lugfwR3UvlZ4k99vrPDw5I3/qBoN/zM46LDZtYQCx+0bEaCGOz5qdz85xaRZiq2mxDVFDsIJ9r4VRWBjH0fJzJ1GOWqbJQkP+6XNJ8eSbrTcyabGOO6xEF/MzCFnqGxG2KVXDgVPe7/nkmklNeBv9erT4nx3jTsQ/uumPlRMU75uOxHXyugLAUH4IKx1bYSGqE4IjE1wwxfpwrYfb6+9s7AGLrV+hkfNnsv/JSuPD654rh/eKH4gZFkiqCdTpnesTQfR23YlPueqQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d94918-ecd8-43e7-3b21-08dee9becb90
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:04:40.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nPbwO8zNeWWchxPVNTtLihZ7GlI84KHSdFDmzH6P3W54RVCa33tAitwdsfgSuWkF5y9aVEvqMW0S5TjWwSNaWwoWtekaRZbfXBV/SeAEXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 8PCoFVr6ef7kovJCb2cgM5cS_NI-G4kg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX/lpALMNvKffn
 hmRNOvmJMGfoA10YtbA27IpBlGtUG+shGTa5Gpm66JHvdUB2TkPa5sN8oROuewP80aDnoUtcT4B
 MTwLfSifodRNREV8qTYmoaVOtx6Z2lw1scG2vemL5722zn2d4ITDejrFit4g+eiwQcrKaeTsVYS
 fZOl3QVkBqyDDeyP83t892iQ5+WgO0eB9AuROw9sgkxe/5t7nfgT1rZG5xPfVJfV/9+vqHa859a
 AxNMsTTHmb66xrkH82xBn9GGkQF9bWw/AuxZwLX+XHQHH6WvvRrcBbz9mZqZO4tQvRX2jF1eTpZ
 8xYHcnW/LatVdCTtpubGALF29SvG2gAadd8ZvCosrrXqzBx6+0wTV5r7nkNnEcakeBdlMVbUQhY
 jBWUne5hnLRbb4JW2pEB0Pp0GAC39r59VRVaObN+fja2cyKd+BeJS3U8OlNaWcMeL1CxZcw772h
 k6XO7L2qitARgiQu3Qw==
X-Authority-Analysis: v=2.4 cv=LOFWhpW9 c=1 sm=1 tr=0 ts=6a63c55b cx=c_pps
 a=tl4IwOQKiBOeKWF7Rad3dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX+E3zFUY01faA
 kes4Kerv0Ki4/ZCLE/v6WTdt9UudeoYTEtTgGOwcolXP/9wOnZapqoTOXPNgM50WYwn1smTFgL6
 c44xEaO+beCYyYGQz3y2vgsNmjAASRfxFfHrp9iqrwC1c0zxq3Ba
X-Proofpoint-GUID: iSrKcC-ed7_dL-KzxK9kqALvgbQtordK
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241941

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d047e41a78..8ccd89a190 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1853,7 +1853,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

