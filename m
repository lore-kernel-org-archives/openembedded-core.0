Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E3BE7C708
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 07:39:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42616.1770622759780286901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 23:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RPxvpiPt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6500cdb078=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6196xQro3317613
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 07:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UgS7Rw5HjT++5tMGMERk
	hrUgBL6Y2yk7GMz4qn3IgOU=; b=RPxvpiPtSGUntiYx8F214mlLCDYCWebnfH78
	FmHd3hkU/emg798i1whOhXCmVBw/zcbSpHhphiPEga51G8JlziR5oxM+qnVbe6xU
	/dHHt+OwETGyZ0dappsWQV0ww6viZ9krz4vhQ+V/oweNBh39yIoJWhvGL2hR+tco
	tpn5E93Skpne8YS6yDLWYLfz/OL4CqxFqcCxFRIxxrkLAPei5EX53z+ky8rbMQzt
	59O54TyLYmVk9A5d/qjUwJaaF9bO0GMBenY3CSBPiBS0pCVLTX6XmsCtFO6rWOp4
	gLEys14WRgXYl+3v/fTZPlVVrh8eX2IrSnbM192FaT1C2wDhNw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwhmwv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 07:39:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzMHBvp5L/Rf1v+WUWGcBsEsoIZ1o/v0jYXEMyLxKn3AHOqaVD1dXdOKrxdB0Av6Q/eG2eIhREt3wYMdT6uqW5/I3BeB9uU+QNUBp3c6vq5V29Tuf0KUV+cDO5msyM/tjot2kG/GVLSZsdeWac4x0ErrGsFaq95Vu51PHx0W907j9NAWlPOX5pVJCKGKl20I6p40mOFgIjfTsUzppc88Lz52o2oYVxLa5pqyz2TBREZMvG4koVTVLLG69f3YcM4pXoFYLt7NS3BEmcrtm7iefvd1WTXQa+MH38xC8non1xVXoeszEL44avTtmBGJ0FWsQK4ZZLYjltIzuKNpol4/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgS7Rw5HjT++5tMGMERkhrUgBL6Y2yk7GMz4qn3IgOU=;
 b=d0uSvBh71aCpec3r/tc9kzHhotDARl7wAykl/VOk1R9QmE2Y6nTbRTmb/Jr4HfWVMerLsfVcimHDcn8eCqr4b3CwZWl11efHdb6zZ3bgKt2I3Phjra/jOQS5dGyDn6uMX1Ekcv0U5q6ESNr31syFj8zwugQ6ib1A8wOUkot10pIUXP33CXuG2m01Ztdr3bv2iJPPaC1LUKfoayEa0HYsOEj+AyjgeNIjgDu5gPcMWr+ttwcbJ3NLUBL0PmMr7X2Og1jtdxJX/Qnz3YVV7GlF/B/K6TgmFn6TuqukGNRWymeKF4iBA0eiKluipFUeA49WW5v1DE6eJbOT175JQZmO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB8810.namprd11.prod.outlook.com (2603:10b6:806:468::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 07:39:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 07:39:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libgcrypt: upgrade 1.11.2 -> 1.12.0
Date: Mon,  9 Feb 2026 15:38:58 +0800
Message-Id: <20260209073858.4193912-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: a228035c-49b7-4f87-916b-08de67ae5244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8KyswzqmtgkqjAeWq2SHuv1GNxUmgX4wlckAym+RCCtrM/bx2XLKI3bAGD0r?=
 =?us-ascii?Q?bn3AdXagT05sHlDNMk8bi1yZZwdhVMnjLvkDjk99sYqu/RBRmG2x/1vSEFYM?=
 =?us-ascii?Q?1KjDd956hPNXOIxPHrYuTb5DBxml2eC5pBCpfyl80KxBFqJf1MMhPTIehBzO?=
 =?us-ascii?Q?nHx+I7pD7jnYDngyLJDb+3UEXounN9LhvV0bkhhsWkEODmP6DlG2Mi/Ox//S?=
 =?us-ascii?Q?w+2UarV8+tKtVSBSpE7FSQ8LwQY8nKo6HCBPWWE8vGTXohdbuubdzZR/2gup?=
 =?us-ascii?Q?94IUh5FnJ1NW4lK5sK5lVgwCentbmj01VuWzhYI4Y/98OnfIQ/zbXM3M5NWk?=
 =?us-ascii?Q?LW0SE88cL+FpyiLLo8q9RD3ArpiWtLaCCes6AKm3dgtQCiDUGyIOnnYlzvqL?=
 =?us-ascii?Q?NpjZOeBbZAO6iRcRSkGYOQ4JZEa6Em25ztnYg0apB4E84xLbHoq3HP7ZxsCr?=
 =?us-ascii?Q?+lA5mmqHec0PHttDt+8yFKkDylngcwK/uIv8oqZMoYGoymHbh+aRTaGRcunh?=
 =?us-ascii?Q?vHuFtSaraJWoug4ySRKu5z8XHZeBWG/ebSXaFASRcqxgPrFyAGljhgfibkK9?=
 =?us-ascii?Q?nHtXFp12GJw4VbvKqmsuDx/JDe7+ETi5nQFP9M09A56lfwtdrauAYPY0GEq5?=
 =?us-ascii?Q?fVn7M3G8glV4kKtNDTC6O6dY/TvbLDuH0bgC5BDmmje8Y8SIuiFzs2zm5NOm?=
 =?us-ascii?Q?LlGvFDOoHM5ZMbZweQJtbQyvq9SCO2wirRPFYBMpftOYWoNI78hBgjYjD96s?=
 =?us-ascii?Q?YZxhfhARaBNCZW0SLAXUhG2oMm3Zi84B4fZ3oghFlePCzNg8B/9z8BRK8vZo?=
 =?us-ascii?Q?Audud5TFsEnIp155ubpcnqkXpcXwU/RiabZgvIGQkTzulmb28FSD7DZVFYBm?=
 =?us-ascii?Q?gM3FYVJJVIA/f1tYVAYDbNm9v89mVSKmzamRcqIn8Nff2y0ZVFy/0Nt63ttI?=
 =?us-ascii?Q?y+rtAY2EJ0w1PixOLsiE4qL0suSrwnFf3qf8nYK4bn7CYKgBIipp7hcZBGre?=
 =?us-ascii?Q?nkzRRHs7JZO11M9qpDhwbhCizCCYyPEWV452Av5FdAN1qc8/Kg5Ac1n25vDW?=
 =?us-ascii?Q?xowOS3EXMYabCpOvloMDj1YMMsU/wCIvysfGZc8CaqEUiotMltPdCaBWjg0z?=
 =?us-ascii?Q?horuEWw48+X6eF7RDcFxuScXYcM1YFNbNJZs986SG4fmBwB6OtNwcxod/eu1?=
 =?us-ascii?Q?Z9376TfHE11Dss0Wte2gJkSx2DGCBcGitGQJfizAto85e9KVR9b6tIsxeaL7?=
 =?us-ascii?Q?Km0dEWzF2UnJcoCBgb5b2eFHfdOmuOC8Ceb7FGeV2bqFy73pewgLod0Zpto5?=
 =?us-ascii?Q?yBBDvEunlcKFgxXS2PS96wHN9woZ/8YizadsV1edg0r52HzXN1ITt1gFSQX7?=
 =?us-ascii?Q?pwE33TNptguFvUA6ANrzoWHEOjt4NY82E0Zu4J4jtRje38qtw3D7iGi/KwcT?=
 =?us-ascii?Q?daq7snbZ1cXUUaPNwaLQ/pi4UCiPw2/NmF4HENmRQ1BjCThmPLatO1XxNlGA?=
 =?us-ascii?Q?4gD9cHKISSrxxBjDSFRQQmNa+THww3wN0uhBxFWvNqywX1sVTGXH7RLOxY/1?=
 =?us-ascii?Q?owUGq/vmrG2qaRRj6ycJcSGljcyYrjvcNG2JTAwR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I/NXEk9BW/FTmVWdliz+yKZlDUwSlyx70h4P+ekKp426xwsVFjZEHPqSdRbc?=
 =?us-ascii?Q?m7ln4XwvjwK+vIcnXV+IRhu/LtGX4HmMBE6Pgo51na3KFKpY1TsQUf7s4Wxi?=
 =?us-ascii?Q?t38Hmsv5AShGQNs9Xk8X66myh6oHm2Zuf/xoATUWkZlhHU2WBtiGk04UbqZt?=
 =?us-ascii?Q?UkPjVujMuX5GzlUNJ9Ksuj363DJDN++bD44tkqvlAQUtx1wtndnjIQ/bkQu7?=
 =?us-ascii?Q?C14VhNnYHO4krURs6ge+lnzKSR1adpTnWqn2/TZ/iwtjrH2KnLieAykzSJ4A?=
 =?us-ascii?Q?pcdChG3VQPMcAKSPmlvYHXxvFLFmaHMhHwJST0eyVBjFArheRZAVFQP/NAF1?=
 =?us-ascii?Q?50QncrORpq3LTisQAApOp7bIPi9ivis6qqqXsNC/uk+7f5lgUtjp1zKvza8e?=
 =?us-ascii?Q?Z+v8hLD7hrLC14GYvWZ2W7YPHc0biC8Rt/pjBeKVQ0TTLaL6S0x4NMZwLgWa?=
 =?us-ascii?Q?nr6W+RFwGfAkraXdiJVlM7qsB0EoVOMavyc6oIU0RpH4lOU5lPa42f6x8oL7?=
 =?us-ascii?Q?+vNGszdRDUdqT5m023jSxgE5i+noiSWQwNkHFO11DMBeiSvLWm1TeeaYo7J/?=
 =?us-ascii?Q?MmskwdPFV1Ic7sxBOywieWoD4YnjGgmYk5TLOI+1Hubs6G9bqiR3AudI+1G3?=
 =?us-ascii?Q?3X3Mbz3raMakC5VeCtGjJI+wAJLRu/3n0h95Jdohpz2y2U90vyGMNtbyJ3dY?=
 =?us-ascii?Q?pqpEDlldy8UxbSvNQLMJHcQqFVxzfcHRJEnHLmz9ctS+WotE0s0jipTjwwez?=
 =?us-ascii?Q?gxIw+gI4XnyE0mMOmZo1x8i3NmRS43HuQjlXQ2nPkK0AXg2j0z5GPPSCHEdk?=
 =?us-ascii?Q?Wt5OOXbmXpXY67nEKTapSG0q7GXtKajjkevYvPyt+/OYD8HRsZyqmuXdXSTm?=
 =?us-ascii?Q?1LlxdUl0YHWkTBjjmfF9R16SSHeBA0x0aZPaM1uIKSpzOHlrOoEwe+6Fi/YZ?=
 =?us-ascii?Q?du/TmzRXo2Q+NKp42cPbEPlZi5LrAFyFhk9VyUuJw1S9DpoYPGr79Nd9uWk2?=
 =?us-ascii?Q?fvhhSMK4p17Zl2yTuFwqVsenodbtWfrvXlEnJs55jfAHUMZpD0FZa1GjRa+j?=
 =?us-ascii?Q?qKzIPOr2TX5SdY22QtWneVquu2eNe5zxNy60jmtwVNd4Cz9du3ZGgVo9G4i5?=
 =?us-ascii?Q?WbTNpnQpHl2LRZ3icJtNfOsRtQbFm5LbYLQ4gJs1FJW0vpvdYCfhsxUiSA9T?=
 =?us-ascii?Q?9DXZ/vUXiKqZ1FiGelkmkFYoA1KAzXD2ZjB8FeBDzPQKW1ExvzvRd3PYyz0J?=
 =?us-ascii?Q?pRyhoghoAJay8xve8T/PqmuAkQ5RtPxylWY9LLavf9+TjGnoJd7FeWeNJaqO?=
 =?us-ascii?Q?tHv1qpYNRdj9nJusY5hjiWnjLyhKCtNPiVEFWcw3lDffITzK5WcgvFj4mvAt?=
 =?us-ascii?Q?9MNNqlY6Gcs7/oyzZulUMl63A3z2FOUyA8GOWODc4L9T0yZ3hn2R43E0DSmm?=
 =?us-ascii?Q?GFQciT3Eu1oAOmPQjKPTmjDPeDyfFtR9fmSg8A8Xz4HNbNz0WZ0QxkgGCJEq?=
 =?us-ascii?Q?5TxA7cN5M2OAsWhueq9JQ6Oe1UhAfrAQ9Fvnxk5t1Lv4DEFaLdiRwBQZIsI9?=
 =?us-ascii?Q?GvKx5wAQIvlf8f/zMFSBGfmoB0AzzIbEZDRMG44BSiIRLEU7giQuuO7L//YP?=
 =?us-ascii?Q?wqi9WlLUVBgdZMwGNkv63s31VFn3rlzZC3J6YBkKX0rX+ixN9XLcr24dI45r?=
 =?us-ascii?Q?mwVXjVpk3ZNzcnPKvvOchZZepqjaEORdw+PO7PfNX00SeN5TtU0NJobA/fRz?=
 =?us-ascii?Q?dj4mBupWwA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a228035c-49b7-4f87-916b-08de67ae5244
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 07:39:13.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXHx8hGEA1RroROB33E3buj6+zePeH2GX1whmN+NmlFz1le4xMG3rRLn6wzr9pMNfhMRKWAc7WSszVP18foLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8810
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=69898f26 cx=c_pps
 a=VTZ9QiboGVM1ljQMw9N7kA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=QnGD35SuiirVOTrsVNUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 08PrHaQ_w_ubY62mnyVCdaGQQj5IQz_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2MiBTYWx0ZWRfX3YSceOXVvY4D
 sNkxhZA3Rr4/W5Rs2mCviHKqYv45taYeOqhGiZFMk/Xk1Fyl3a+LlO5Q+hH8MgoA+ih3v1YgSZh
 8t7P4BQEAiNfGX/6AuhYlWDYI1L5ouHkCCLwFwB0ERzBBWplM1zhqX63QE8Fpu4rqPNUZWcX+X7
 +Ye5gdjilwT70Ut6dg2JgglgtyqwHd6cQgWPcGF7+kvR25B3xp1iI0C2GktGSnt9Hrh3dVQ76Kp
 fCE2jtb7hrzEfvrtGZzeVG8UgxcZK79L185nBJSm0XVJLSX7Mxp9jqIe2+LsoVQvSzprWehjKaS
 2n66ZnbjGPfwbZ9zdyumCDMRmCRX0xPK8icrhVwMerVHU/WsfvrigaxGMx+Vp6kD1JHIDHovIQN
 HkOUX8w3UpWlH4YiZxiwiSVhDmhliibVRXFCF1vAaN6mgvfsjkc3ROhjljO94QYNzeAL8qFEuPy
 ud3MvW4alH9Vs4sINiA==
X-Proofpoint-ORIG-GUID: 08PrHaQ_w_ubY62mnyVCdaGQQj5IQz_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 07:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230710

License-Update: Remove occurrences of old FSF postal address[1]

ChangeLog:
https://github.com/gpg/libgcrypt/blob/libgcrypt-1.12.0/NEWS

[1] https://github.com/gpg/libgcrypt/commit/67b8da4ef62734927e061327efa9a6f48616d114

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/0001-libgcrypt-fix-m4-file-for-oe-core.patch |  6 +++---
 .../libgcrypt/files/no-bench-slope.patch               | 10 +++++-----
 .../{libgcrypt_1.11.2.bb => libgcrypt_1.12.0.bb}       |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.11.2.bb => libgcrypt_1.12.0.bb} (88%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index 7b840644d4..e60507e636 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From fcb53181b18c00083a8b08625db74829cfd6b4b2 Mon Sep 17 00:00:00 2001
+From 3bc536529c9bbe1e62d1c1127abee6183ed64298 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
@@ -16,7 +16,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index 353df81..b195e22 100644
+index 7cb05ba..0501e0d 100644
 --- a/src/libgcrypt.m4
 +++ b/src/libgcrypt.m4
 @@ -116,41 +116,6 @@ dnl
@@ -34,7 +34,7 @@ index 353df81..b195e22 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x && test "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG libgcrypt --exists; then
 -      LIBGCRYPT_CONFIG="$GPGRT_CONFIG libgcrypt"
 -      AC_MSG_NOTICE([Use gpgrt-config as libgcrypt-config])
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 44aac1913e..606cca1344 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From eb3a5bc4d5a212da64c0f9396c7f31f83aa6f36c Mon Sep 17 00:00:00 2001
+From 254821a620c1f7d6542c23dbe555e7c02637a3f8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
@@ -15,12 +15,12 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index 634b718..1e9dddb 100644
+index bffa3cc..a228a28 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
-@@ -76,7 +76,6 @@ static struct {
-    { "t-x448"      },
-    { "t-ed448"     },
+@@ -79,7 +79,6 @@ static struct {
+    { "t-mlkem"     },
+    { "t-mldsa"     },
     { "benchmark"   },
 -   { "bench-slope" },
     { "hashtest-6g", "hashtest", "--hugeblock --gigs 6 SHA1 SHA256 SHA512 "
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb
similarity index 88%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb
index d0236b58b3..7638cb0847 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb
@@ -10,8 +10,8 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
 LICENSE:${PN} = "LGPL-2.1-or-later & BSD-3-Clause"
 LICENSE:${PN}-dev = "GPL-2.0-or-later & LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
+                    file://COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
                     file://LICENSES;md5=034b4e369944ad4b52a68368f1cf98b8 \
                     "
 
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "6ba59dd192270e8c1d22ddb41a07d95dcdbc1f0fb02d03c4b54b235814330aac"
+SRC_URI[sha256sum] = "0311454e678189bad62a7e9402a9dd793025efff6e7449898616e2fc75e0f4f5"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.34.1


