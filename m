Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7226BC61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8083.1788094768996230346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N0NdrmGZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCWvti1340729
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:59:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=DqdMMcop0
	a5bDNhfVomhTgACFI6KTtwUd3KQgY9lJDQ=; b=N0NdrmGZaTBb1ndc7BevP76wk
	WjApSfrTaCJhCpUYpmrQhgXPu1AoW+hlGfQp5EjY2AfKqGFpd7SCqogqiy6GkY/D
	d0HtWYMmaG1tVXLNUQuTfcPRR+hlRKqjIqq9sdkTmviHCebKzv7tp5Y5Onnyjb1r
	dYOWzyfOL8peyMLNo5R+74Daade5CIgJAuXoYKd5+AuMJOMo2VWwKPgJBhMnQUau
	qqYah4XaPjmopoVyMDBf/FR2yJZYeP8QZrEt0KGVZiaDubcehVU50vEtzdgfXlRc
	JqGyBD2w0Kos/Krsyy3hBQQRpeOpApmzEUHb8L2VWz4Xe4Rdf9GIZPVJEo74g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021107.outbound.protection.outlook.com [52.101.57.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe8wbs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 05:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvQvOC3xtnHXg2UgV2KWgUUv/qWBWVc+/nx7vQrB2ykfcSb+p04iBVhcLRo+gSYKh3syDQP76H6dA7hGyW5QHyC4sJxmjbGTcNLBttAtKwLo1Jhkj/+RbtgWgCzlzQV5PX3Js+ZNDWjPPMz7ZVOvsKyanUgg5/Eih+zMlhKp0yGcISr5PIJIYcWaQ+Dvs9Fy6B2AqlTLgZl1FAooh3e//ftAwPKb2C5kUoM1L0fPkZPARHDvNxIzbhA8SiebvvwZaizjLflrFbVJ47oTHcOL/rqTFAqVJZgWDZtWZ1Y67AUOUaipYTqu/mFA0WxNYUjTFlm+/x+Qb5H4pMHouR8Ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqdMMcop0a5bDNhfVomhTgACFI6KTtwUd3KQgY9lJDQ=;
 b=vIiXzcpyswWushaQ3fJIH+6oeQIxXyyO61cQGCxQAdOBTnrqPriQeYexWeyp2EJFrIGiH27jN52tpUHtYYJHpLWc49pIsBR8Lrp/gZDmx/19mho9ja+C7yyu8Af1pKrEXjNenvYGctXPRMayYfydAhZ4xm9YXkPe5BMuPo6gro98DGtSoOkHa8sVPYeBCtBls7Ef0c/4804plPFIC5yxlopNZcn5j2QY/NNNMl1xVF2tmBUSZNVCHO8OR6jqrgCsmvuuc8A6a//yrM4Pg729FTqtqdlKQJnZxsQapZ/SWjvmX/Uip3pY7LX+4IZCca+qqUnTHsHZ+KDOxAwAYNXTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:19 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:18 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 00/11] clang/llvm: Upgrade to 23.1.0
Date: Sun, 30 Aug 2026 18:28:40 +0530
Message-ID: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f3cc07-d763-44a6-1381-08df06968058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|3023799007|56012099006|11063799006|38350700014|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	dTAwuIy5CQAruLvQlVrIQ7TiwDqGFa/1MqEaW5F+/OMdgsf4b+XLuyd34XzbhwDNtnDb+mcstsQg8Gp8zuubzMeUxpwtZ4FTMFWCEMNuQANkDRBtkEGd/V46PxF72/Vl3Ljt5WuvuN3HXecqx0MZuBgqoOrci4xE0/Tc2OwKHHt/Qy68PkrncF6YxJ64GY+8sivaxR2paPjt7uv8t0ZEJ2oMp5Iww/U1ad1lFiuL5LqcsmEH35Kyv44jIhvgkNG3oKTH/MuvDtxB8AFZXR6y6a+99Yr4AKmsBz1D1QMYl0B+Uy1N09bxYCkeEDrHbjVi9+Ii2vIWbPaUFg/rH+iy9/uSN5hsn8RPfKubJvQ49Je6I1uZsVlHO5vQdIXe/GWOJcbAEvl6GHkY49euBEQGwAZLMmJZ5pISEwMwiR5ZjjJwll6Vi4Z4RPoX4aCb0zNOCxcCWATkkaO09p+vJmxAhjYtCrCPhXPadu5geE0tPEWQwdhHw6+n6k8ZMQHqKJzRYMv0MnZYBbJLAadXBlA6wr8zOpjKC9qYddo4gtWlO1lXwz3AO+3zKPDnrkhLJhOqUMmv/g/XmZ8f8jOVjzlnCq2+JZ4ryFqRfytXoPs/rZyj9A6ARUCC1R7OuKZhD5iDjXIDaWIcphw3heGNSG/mG5qQAAClMNwdBwUrrW9QCa0G7mDdiTL19sueEP/+ktuX48S8lOMrmXgR/rR3cPMlFhnFrBMGwmV79a3+u8+rbWM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(3023799007)(56012099006)(11063799006)(38350700014)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eA9Htp6nBDIXiGHFZPwTLMvIv8GpWD1zzazUYAqJkrV98esRyS3w8fi/6CNz?=
 =?us-ascii?Q?RTgplIroVfFD4E+21ZUY2Zi1zhh+8UDZcvnmVKPGkt9lUGXaBKV/xGDtZKpA?=
 =?us-ascii?Q?05kVxcNGJm7Eu/7R25MDX6KNqeQM8CTs1/dTxeG+k3ysm9YrxCVNj0gX9DDT?=
 =?us-ascii?Q?15BS58ifZ34jQ6qQqRHGFeVX7otDuBrs3Cjbf61D8/GMpq4UROBy8P/Uf0iN?=
 =?us-ascii?Q?GOYxEEl7v0CpoeW1cuJKbGSD6xxXCayrnTcfWeNOo4Lb8+RUR7ZY1KXkwstP?=
 =?us-ascii?Q?UAUhdPdL+cTs+6OQNQ0L1YcdjP6QqqG+GEZjQQR8rR70bxHRhL9AF228zA9j?=
 =?us-ascii?Q?OuWkTPmBAEO2+Kx4e/lW3UyoBD3QSTlg6EoVD+QhC+O5YCV3tPV6bc4M2Ow5?=
 =?us-ascii?Q?/3sf7VVEmyGDG0jxEgSzwJ0OqjaxU70OigBk7WV8oFZJndZJ9kTV+j2kBygC?=
 =?us-ascii?Q?B5TPeR7uSNVJkieyXrTOwqi33PdE7T1Ss8E+X3XAxy6Pd4Au9DvQKvey1rfN?=
 =?us-ascii?Q?A4JoFWNfiA2tjeadYExsL47xsgcMEUGdmvBVwAC7NfLPhXuv4kpDwzMntFw+?=
 =?us-ascii?Q?krar+vjWw9JcwYLapuL+MTgVbr9dbGzipq6r1HTmaPmc4OPhQZa4s8RgkN5j?=
 =?us-ascii?Q?A5aJrihdvmoAXYPahcCM7rOjO+xmRFP//6QvQurCwM1VjYYp4GzSj9QwCOZ4?=
 =?us-ascii?Q?cSr5zLyIhGLfECEFee/pBx/vULDUaku5/03izbskkgOQsR8vd5iqAUedmGVM?=
 =?us-ascii?Q?g25R/vovVY+yjLoP0m0BjJPX7MtonpIMcE3nAaxMVlDo6+tT0NpiX5z4MD3U?=
 =?us-ascii?Q?xz3n71qbB1EIaHbKh0Zk5louPwVmUjifVhm/Dl+DnnG+GN+3Z6QCv9QxZfC6?=
 =?us-ascii?Q?wJ9PDKCImnjw708rXdzhTAQzNUPquSpqcFLCI3GyXOIx99j29Uq49pfWcZkU?=
 =?us-ascii?Q?9VbhPjiY52qx7sSxwCQ20wdkKI06yYShRC2ACk9nqq19E18FgnkVg0XlBrSV?=
 =?us-ascii?Q?BuDsx5o5HPPX2zVhfT5sLd8YjdtTPn9txWXeBPpKqudEfejYwqzmJgpBO9ZR?=
 =?us-ascii?Q?BcJ3f+FzIstJxrMhqj6j+bwETFMnppI6sguegHWnRrWJzwAE2mJdfrtxP65B?=
 =?us-ascii?Q?8A47tleukyaHxLmeGP7wv/l73+33D9PvJAzsDV4gxaREYcgdJrco5shNukrd?=
 =?us-ascii?Q?PKHYgxApoeJbdWqRfRedyxRXRBxfhYMNkpxZO3+YpoyCb4BR0U8+t3VLCVJh?=
 =?us-ascii?Q?nSme5g8Ik0gNPTea8YYj6n/aLs2QU0YPAoZJdo/81bwjaifqvlcHOCjjvrJI?=
 =?us-ascii?Q?ew+2BTJUYjty/gEtxDDTWnE96wJ9ZPX6KHmUN6vNEMlhNdyBGdaR0v/HUfFt?=
 =?us-ascii?Q?udWC1zHx2Ty+3yW2TAXq0Yjs6fTwYzE4KCZA9po4eOTW29/mpRIHCp/Bfeyw?=
 =?us-ascii?Q?0jbI0DgwyFbpIJNgY/lGZ3kQ3L06bjCsIY1nVdHM31huaV1qPR9DNfvef/aw?=
 =?us-ascii?Q?bgqge7q5U5oNrfS4zfBb80At3saCefl3Sex0AIkuO4G8R90MzcLecoeIbb4t?=
 =?us-ascii?Q?Dt01zA6kAKN9dE9ikbA58qFk5k2LCc82sqeLvRgH2MzV10CvpiAFoXgKpJFu?=
 =?us-ascii?Q?hcRhjZrGrCzAEvOuMUTZ2EY+XyH4BH632RBOe55ugsmsetvsN48oAPr/0eT8?=
 =?us-ascii?Q?XBaMohs+dhoPHeDz1GuRRhwwVsEbC7AVXha1ZeH6wNMLWxZvuczFKhk8Wz7/?=
 =?us-ascii?Q?0QGUfmn4cEVviSoufpdfhyu5OzvocOY=3D?=
X-Exchange-RoutingPolicyChecked: 
	V8jUxI3UyTsXF3sHoc7Xx2CoH/dizLCX7UJeNk22muYx6l7xad15ITHBJzE2RnDqFy/Gxmq2QkbES6VXCL3WTzh4AyXQuJ2YqG4QKFcDi6oimxn6djIsSLIsXod6C7bo/GA6QNUNY3XnS+z3FwduZS1KD6J7OSBFC3USpGLuce1+sYpvvPuZaJmBsqdLTYab50HxUeMyHboSDXa1ak4R2e4NIK4wV9YHCiBYn8KkMKhOiCdH20L42YZNrD5gZcMLJcHQ3SLcXUETixyQYDUva1nldXcSf4k31WEczkzb1vE5R7DD7YX+7tXoHkFjZoica8D7Ae23CSLlMeV3BsuUDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f3cc07-d763-44a6-1381-08df06968058
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:18.2016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JmGrjtnpdB+Oi2Dn72jF4jlCg+C/KroCejzVPnOFURJ3QbnmQD+7nrAmGJTbsIbXkSQsCDn82uC9S2F/UuZ0KoOpcsNScuMcg9W9rKkzBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX5e53IGx2gShN
 VtkEEo5w4EKVJrEaBRpFFJktS6TGakOlamRM4PyS+TL6rcMUfrcjVAO17esnBgNi92G4RS81JQp
 gLhIVVVxIsMm5pEFzibT1cL/eJicxp14BEisuzwHjVuYgiJj/WkESGJHhlHlXuxUcNY+e89SGvU
 vPwTV7cU3w8hOLZJKrciND4YJEPsZe/5sir0pmpYc4aylE8S5rk5rClT6/pJsmzfYXIxt6rWHuk
 9oTd6rXIDjrhx30yIMgh9ciH+q4W9yphFXX1ho4G9F0uojuLwhZcIF0AwsmsvbSS7Biyx6+IKVa
 SSUvitbGUM9nu8T+KrnULDJKKdH0GX8nh23Q7vcakamCtVthA/TecH934RxR/NVSeZ8hw5j8fs+
 H+SXtnPLl2T6F3smpObQaxex+U87mcDG4eHVe5AHfJDzSS/Shhw+89pV3gYWCWMSOBzugVVXnLC
 El5Ke2W3JyCvt4BwH7w==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a942930 cx=c_pps
 a=AVViaUQ/FgKrFaIAxxVSSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=QQWTHekK8itkRotb3SMA:9
 a=ysZNWJasRFhFYgdo:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX+q7rzTNzWSGE
 UFqWlWWaLneRYRKjcYHK0tSRGkT1p3KmHspBZK01uWMrnFYnh54wGTmYZp25MZeO3NZ/ch4hoN1
 2Kx4ANmfvbdJucPUOKj9tYoHEmPtO6OnbRbIP2URyQ+C0Dbf95fR
X-Proofpoint-ORIG-GUID: ay1gejnguj81FS7AN7qXKDPDky9_eXao
X-Proofpoint-GUID: 43Sw6mdMq0a7_bBe4McRzyz8g7UJkaZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244647

From: Sunil Dora <sunilkumar.dora@windriver.com>

This upgrades clang/llvm from 22.1.8 to 23.1.0 and fixes the fallout
found while testing the result.

The carried LLVM patch stack goes from 41 to 35: seven dropped
because 23.1.0 already contains the fix or the code they patched no
longer exists, three reworked for LLVM 23, and one added for a 32-bit
x86 build break, already merged in llvm-project.

Please apply with git am --keep-cr: patch 8 fixes an ovmf file that
uses CRLF line endings, and plain git am corrupts the patch.

I have also reported the underlying bugs upstream:
  llvm float16 fix, merged:
    https://github.com/llvm/llvm-project/pull/219675
  ovmf fix, sent to edk2:
    https://github.com/tianocore/edk2/pull/13038
  pango warning, the root cause is in GLib, reported to both:
    https://gitlab.gnome.org/GNOME/glib/-/issues/4038
    https://gitlab.gnome.org/GNOME/pango/-/issues/900
  vulkan-samples warning, which is a real bug in their code:
    https://github.com/KhronosGroup/Vulkan-Samples/issues/1570

Tested: oe-selftest clang suites on qemuarm, qemuarm64, qemux86,
qemux86-64 and qemuriscv64 on the autobuilder, musl images on qemux86
and qemuarm64, a qemux86 world build with TOOLCHAIN=clang, 32-bit
multilib, and core-image-minimal testimage runs.

Deepesh Varatharajan (2):
  rust: Fix build and oe-selftest failures with LLVM 23
  clang/llvm: Ignore tests fail with clang/llvm 23 upgrade

Sunil Dora (9):
  clang/llvm: Upgrade to 23.1.0 release
  spirv-llvm-translator: Upgrade to 23.1.0
  openmp: Build via the LLVM runtimes entry point
  rust: Do not pass the removed x86 amx-tf32 feature to LLVM 23
  clang: Disable clangd's decision-forest completion model on powerpc
  pango: Don't turn clang 23's -Wunused-but-set-global into an error
  ovmf: Fix memcpy alias prototype for clang 23
  vulkan-samples: Don't turn clang 23's -Wdangling-gsl into an error
  gettext: Export a fully-flagged Objective-C compiler

 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oeqa/selftest/cases/clang.py         |  10 +
 meta/lib/oeqa/selftest/cases/rust.py          |   1 +
 ...t-env.in-do-not-add-C-CXX-parameters.patch |  17 +-
 meta/recipes-core/gettext/gettext_1.0.bb      |   5 +
 ...sicLib-fix-memcpy-alias-prototype-fo.patch |  35 +
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 ...ify-cross-compilation.-Don-t-use-na.patch} |   6 +-
 ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |  60 --
 ...-support-a-new-embedded-linux-target.patch | 309 --------
 ...env-override-of-exe-and-libdir-path.patch} |   4 +-
 ...-driver-Check-sysroot-for-ldso-path.patch} |  14 +-
 ...ools.cpp-Add-lssp_nonshared-on-musl.patch} |   6 +-
 ...5-clang-Prepend-trailing-to-sysroot.patch} |  10 +-
 ...fine-releative-gcc-installation-dir.patch} |  10 +-
 ...d-and-ldl-along-with-lunwind-for-st.patch} |  10 +-
 ...-Check-for-atomic-double-intrinsics.patch} |   4 +-
 ...ure-for-packages-using-find_package.patch} |  20 +-
 ...e-dir-location-for-cross-toolchains.patch} |   4 +-
 ...dyld-prefix-when-checking-sysroot-f.patch} |  18 +-
 ...clang-Use-python3-in-python-scripts.patch} |   6 +-
 ...-anchor-for-adding-OE-distro-vendor.patch} |  37 +-
 ...ple-for-non-debian-multiarch-linux-.patch} |   9 +-
 ...ibunwind-Added-unw_backtrace-method.patch} |   8 +-
 ...016-lldb-Link-with-libatomic-on-x86.patch} |   4 +-
 ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  68 --
 ...mpiler-rt-Enable-__int128-for-ppc32.patch} |  26 +-
 ...t-use-cmake-infra-to-detect-libzstd.patch} |   8 +-
 ...-Fix-stat-struct-s-size-for-O32-ABI.patch} |   6 +-
 ...cpp-ARMLibDirs-search-also-in-lib32.patch} |  10 +-
 ...-OE-specific-ABI-triple-for-N32-ABI.patch} |  63 +-
 ...nwind.pc.in-and-llvm-config-scripts.patch} |  12 +-
 ...pect-LLVM_LIBDIR_SUFFIX-like-other-.patch} |  17 +-
 ...o-not-pass-target-to-clang-compiler.patch} |   4 +-
 ...-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
 ...ve-LLVM_LDFLAGS-from-ldflags-output.patch} |   4 +-
 ...de-sync_fetch_and_-for-any-pre-ARMv.patch} |   6 +-
 ...de-uptr-sptr-typedefs-on-Mips-Linux.patch} |   8 +-
 ...-headers-in-the-debug-info-when-bui.patch} |   6 +-
 ..._HAVE_OPT_VIEWER_MODULES-externally.patch} |   6 +-
 ...ang-tblgen-if-it-is-actually-needed.patch} |   8 +-
 ...ymlink-path-for-libcc-when-LLVM_ENA.patch} |   8 +-
 ...ix-sysroot-based-compiler-rt-search.patch} |  15 +-
 ...> 0034-guard-clang-tools-extra-test.patch} |  47 +-
 ...ng-block-when-searching-for-noreturn.patch |  41 --
 ...e-float16-on-32-bit-x86-without-SSE2.patch |  36 +
 ...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 --------
 ...e-__gnu_unwind_frame-in-cxa_personal.patch |  33 -
 ...te-exit-fold-candidates-in-determini.patch |  71 --
 meta/recipes-devtools/clang/clang_git.bb      |   4 +
 meta/recipes-devtools/clang/common-clang.inc  |   4 +-
 meta/recipes-devtools/clang/common.inc        |  78 +--
 meta/recipes-devtools/clang/openmp_git.bb     |   5 +-
 ...ommits-from-rust-Fix-selftest-llvm23.patch | 661 ++++++++++++++++++
 ...llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch |  38 +
 meta/recipes-devtools/rust/rust-source.inc    |   2 +
 ...ror-on-clang-s-unused-but-set-global.patch |  28 +
 meta/recipes-graphics/pango/pango_1.58.0.bb   |   1 +
 ...1.5.bb => spirv-llvm-translator_23.1.0.bb} |   6 +-
 .../vulkan/vulkan-samples_git.bb              |   4 +-
 60 files changed, 1109 insertions(+), 1113 deletions(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0005-CryptoPkg-IntrinsicLib-fix-memcpy-alias-prototype-fo.patch
 rename meta/recipes-devtools/clang/clang/{0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch => 0001-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch} (90%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
 rename meta/recipes-devtools/clang/clang/{0004-llvm-allow-env-override-of-exe-and-libdir-path.patch => 0002-llvm-allow-env-override-of-exe-and-libdir-path.patch} (96%)
 rename meta/recipes-devtools/clang/clang/{0005-clang-driver-Check-sysroot-for-ldso-path.patch => 0003-clang-driver-Check-sysroot-for-ldso-path.patch} (87%)
 rename meta/recipes-devtools/clang/clang/{0006-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch => 0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0007-clang-Prepend-trailing-to-sysroot.patch => 0005-clang-Prepend-trailing-to-sysroot.patch} (81%)
 rename meta/recipes-devtools/clang/clang/{0009-clang-Define-releative-gcc-installation-dir.patch => 0006-clang-Define-releative-gcc-installation-dir.patch} (94%)
 rename meta/recipes-devtools/clang/clang/{0010-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch => 0007-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0011-Check-for-atomic-double-intrinsics.patch => 0008-Check-for-atomic-double-intrinsics.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0012-cmake-Fix-configure-for-packages-using-find_package.patch => 0009-cmake-Fix-configure-for-packages-using-find_package.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0013-clang-Fix-resource-dir-location-for-cross-toolchains.patch => 0010-clang-Fix-resource-dir-location-for-cross-toolchains.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0014-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch => 0011-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch} (88%)
 rename meta/recipes-devtools/clang/clang/{0015-clang-Use-python3-in-python-scripts.patch => 0012-clang-Use-python3-in-python-scripts.patch} (90%)
 rename meta/recipes-devtools/clang/clang/{0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch => 0013-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0018-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch => 0014-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0019-libunwind-Added-unw_backtrace-method.patch => 0015-libunwind-Added-unw_backtrace-method.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0020-lldb-Link-with-libatomic-on-x86.patch => 0016-lldb-Link-with-libatomic-on-x86.patch} (92%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0017-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
 rename meta/recipes-devtools/clang/clang/{0021-compiler-rt-Enable-__int128-for-ppc32.patch => 0017-compiler-rt-Enable-__int128-for-ppc32.patch} (77%)
 rename meta/recipes-devtools/clang/clang/{0022-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch => 0018-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0023-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch => 0019-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0024-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch => 0020-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch} (98%)
 rename meta/recipes-devtools/clang/clang/{0025-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch => 0021-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch} (60%)
 rename meta/recipes-devtools/clang/clang/{0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch => 0022-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch} (84%)
 rename meta/recipes-devtools/clang/clang/{0027-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch => 0023-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch} (90%)
 rename meta/recipes-devtools/clang/clang/{0028-compiler-rt-Do-not-pass-target-to-clang-compiler.patch => 0024-compiler-rt-Do-not-pass-target-to-clang-compiler.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0029-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch => 0025-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch} (92%)
 rename meta/recipes-devtools/clang/clang/{0030-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch => 0026-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch} (92%)
 rename meta/recipes-devtools/clang/clang/{0031-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch => 0027-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch} (95%)
 rename meta/recipes-devtools/clang/clang/{0032-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch => 0028-Hardcode-uptr-sptr-typedefs-on-Mips-Linux.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0034-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch => 0029-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch} (89%)
 rename meta/recipes-devtools/clang/clang/{0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch => 0030-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch} (86%)
 rename meta/recipes-devtools/clang/clang/{0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch => 0031-Only-build-clang-tblgen-if-it-is-actually-needed.patch} (81%)
 rename meta/recipes-devtools/clang/clang/{0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch => 0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch} (93%)
 rename meta/recipes-devtools/clang/clang/{0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch => 0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch} (91%)
 rename meta/recipes-devtools/clang/clang/{0042-guard-clang-tools-extra-test.patch => 0034-guard-clang-tools-extra-test.patch} (83%)
 delete mode 100644 meta/recipes-devtools/clang/clang/0035-Prevent-revisiting-block-when-searching-for-noreturn.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch
 create mode 100644 meta/recipes-devtools/rust/files/0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch
 create mode 100644 meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch
 create mode 100644 meta/recipes-graphics/pango/pango/0001-meson-don-t-error-on-clang-s-unused-but-set-global.patch
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.5.bb => spirv-llvm-translator_23.1.0.bb} (87%)

-- 
2.43.0


