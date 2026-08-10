Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6FAC5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23014.1786337588258865463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EDQU+Dkq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4K1tp750966
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=901O9EOj4
	I4bznhpsl5Tjlem7WEzEeDzaHhvTaMpoRI=; b=EDQU+Dkqcr7zbwvS8BCfPhINd
	XnDKtqxjnGkspuDH2vzyjHDrc3COW2Uw+An4KMmmAlQiaPC5z7YwJ73wVl6oowh6
	qTux2r3xLrVbZh8dzbC+msvIjO3ZFTH2cTExPMPZis+dMKw8JfNrkkbrohS9utZI
	+IjtyVVGwvxpFovk2+IvbZT8hvKAKtGrFC9XQoTX5qcqcm8/9EVfah1YCUtlIFz6
	bdQAPBAEhFpHUm87UiDCwChXX9ziIKIGSYqSJPlsiJ+9tWH8jFWoj039BFvElL1g
	uwTeXWwg+L9x1hfT6NUx9O/p8njl28oG1YXyNQpshxYUxzh47K13n2jEyqiEA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue81s4j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 04:53:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkdATAvKbaMhwGSskHt7jYPFpvpfeF5/WJLqVQGaEnjhhxehsjic+/D4fuHpj+n2BRvGQjii0Clso2bWiJMVkTuVAwuj/ogsOXbNrtYpbdadkkRVWXwFET2ZWRnGr//P/fEqtIcwMF4UqwP6WvBJ3l4miKy3krVU1nKnHXH2DQgvlLM/2xpsj7H1VdOXlcNKD1GaBlpbondX5clefalYmuWniZw5shXVqEca6vsjSwm9eOHgTFcvkZJcBuBKtCOJLujwb4AIWpr2EOLkhzbAGIuSiOFp2TaUn9ufzPf6LrvLhy+8rGsnr0gYXy9n0mLBrqrBNnZqYnK3T3VuaEIyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=901O9EOj4I4bznhpsl5Tjlem7WEzEeDzaHhvTaMpoRI=;
 b=HFRV77V2BnHckMY/T7Whe5j+oSFe75rcTAABvkehqWUL9XTDmoBszddofbvtikslVCXAMX9yP6mlPely8QNjSHRFqcKtkUXoqVbiI9qfChBmWChg/Rrgo4Hdt9QeFzBpGkdUxMnBBr0kxj2fs0xE56MIfnaePihEhO6oZ7wblceH/Df3ZL/2FTCm4VN2uzcrFmTJM0iiaZCbb5cYW3Hjq7JdtuPlXMJdJc0HqIJAhr4OuAWG2g6aR5Pps7WPzxAjEXONWuHh9LERDyjI0tRd3CPOK3ovYvF28YHgaUg/5kh/W5te45deQMtqTKWEjYHzy8bmWGcfnQZEjsCI4selhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:02 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:02 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 00/10] rpm: 4.20.1 -> 6.0.2
Date: Sun,  9 Aug 2026 21:52:40 -0700
Message-ID: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c876893-e45c-4e05-e8f4-08def69b4239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|38350700014|6133799003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	IrijFN5ZJ6d3/UAZwFkru8F7fMs/k7mh8a8/QzvLJbxl133m4ZxkCnNeGKX6aXrZpCKBNg7w+IHhReVCzo2LMXn4mljuLja18B9FYpS6tRrJxnFWG8AssKggYU5MLSUPdX5hcIz1vHrdanNYDdy2XVSvUgxk5e4Zo3Hk4FYR5c/06DlT0WO98qxaTbgUNEhEywbT0CEz53bvr3YL1uyWk338uAaBuxdEDBnZUABp/84ViiLKiFDTziBX0ont5KnAwsZIMYOFR9PRqzwKNqHbL4FtXeErfCDseE6e7qLO7SeHlIbOkqorNkKHQ69YBEgn/UQzSGHi8FAxCFiSfcsD121xhEX02n4lTQc9SaTJpOB1tLOKRyqaOcfhRFR2TmgcwIFflJjzrT1PC4FsePnI+j+r6jX5XjYQZ5efOHju86DKoe+NAaxFeqzYvGvFTzGvrMaWWxvUU4vfjQr4Sfegsj5R7mkknfQwkGi7wkhdH/NzXFtQxnIIPZw6Ht87rfPsOYw3RHfc8Rj8DL531TW2XPycLjsNk+VSvVEMpUDHFD0oXA9Phu93fUUiCHGqnSIOHR0HlxV0q/WsWFDseSkaA6aa38a42vdaiNs5VW66wzDJj4O7nyP3uGrWP/fOSf38Tgt2B5Elv1j1xBJFyetYjgiZmnEl46UXwda6oFNsZuED4xEoFogrsiiLjKhz0oC48BW0cVVDDTNvBww83yCibG1cG7mZCJVf059xELYgZAs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(38350700014)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w1n/zBiMFV3U1xIqkNmK3jDqXgWYpc/202TK3DqlZj7lCjF+7Cls9cDRLcMr?=
 =?us-ascii?Q?AVCYFrY0iA8uCCGT2iXwBiivgiE9nV3ssNmusMTaII0TadPKVACZ42EXr+7B?=
 =?us-ascii?Q?k10/jhpujx1UX+034s5/B1jH7zbtkPWpJ7Otv0RkHWLBUKIwoUO3AlwZo75W?=
 =?us-ascii?Q?Z2PVytModX25R81X3XUv1sLn7VvaOfdaazmIC0ofYPehFZObHiWmli0Kpmyk?=
 =?us-ascii?Q?9g8onRujoj997zagUSlLUfstyNlmeBukJ9UXMsWJ7IDg+7WXt41QwndQNaRc?=
 =?us-ascii?Q?ercxPFf99xAMEfFXtcfnp16RnwBuNXoN3zdJFRwsh+nVsap8itbBUVi0RrN/?=
 =?us-ascii?Q?44mNuFzAw9Krg+HYLmDQ/pSSQsoCIWErtGl+cP2SEzWpYi8ghM3P9V92UufZ?=
 =?us-ascii?Q?f7bjeVKXofNCYFfPWTCKFJea9UMrnz5Zu9BmdxRK17CqYTLUCfsgQ+6dykgO?=
 =?us-ascii?Q?dMwtdOEc1dtrFBPJvIFYMYUia8hn7pUEXh635AcMyYFNKK7hatOujNVLTnZ3?=
 =?us-ascii?Q?7Weng44XZrSKy7SWshjI7rihVh5c7cMiFDNl+cndh+eTea3oVZrnsy54QHYU?=
 =?us-ascii?Q?aqmcZ+DAvxGgzoAgI1madL8fL8QDVSUawyIGLcETF7gYii7N2wg0BzyxxVKo?=
 =?us-ascii?Q?okdx5wPQo27UE201A3trlAApUfqwst1qEYG3JJNSLcNbiIBCHZMH/ePgBIS0?=
 =?us-ascii?Q?vSnthrIOIR9K+EKY0DYZfuoXyKh6IYFdD/4BEE4HkX1Sv33b/851xg0bieyI?=
 =?us-ascii?Q?wgT9hyVj0w8xYneIJaJELk9zNX1eZHDdj88XK0pu8dLREYY8cz8pb2xTpXK0?=
 =?us-ascii?Q?nZghA/XcdKPqa4wmWRlMnejNrSPI1LaELBkc/QAo4rIXAOQK5BgCVEXd/+bl?=
 =?us-ascii?Q?PRP0wcxaL2ZRAC33lgxrc1sv2AePJ2SIvGwUHTkJb4iSZCCjp8J67RimVdrD?=
 =?us-ascii?Q?hV4apwTh7cJd0PIj5sWevRiPTdJ3BIyZotFpoBnWLPdeXoISIWEGP0d9YlO9?=
 =?us-ascii?Q?DC97jmnjnT1S1+08TumrQ7w+xyxKapmEpLtKma8L8Pl1kPbAByZm1xQLvb7a?=
 =?us-ascii?Q?36mVfgcvV9/xueOT2A2mEKexV2zYpjmWEoGe8Q2RV/xDqxq0TtFqSb8+jYJy?=
 =?us-ascii?Q?nI9ufpew97pldveaGqWMbJp4oln0nPMK3Hfe4o2af/91VyGAV8h3SlNt1ah7?=
 =?us-ascii?Q?+5lEuf/5hrLBnrFuT2Xe72hj9T4cMZvF2U1LXRankYT3qOrvAU2yXWKACRlx?=
 =?us-ascii?Q?Yt6F5hAl9A3EzUmGewHWQ9KiwFEw1lTQFaV8vtLMscLeKXLry04uL84ZxxMP?=
 =?us-ascii?Q?P97968l4zFttNWFkjYed15TvtriJyNqsC+phPoWjqtM09x5PlyvHkIcXJIQe?=
 =?us-ascii?Q?RxsNbBIk0bHfsfzZtgXdsCI/tYMHQjOnQaKUX8RRVri8wzQ7brINClDpPy7t?=
 =?us-ascii?Q?FTle5l0ldDhaSMcSyry1GKBABwD7Js2TfVuWAiu0yqrK5Unz8kF4kbg7HVHF?=
 =?us-ascii?Q?2cZJrRz0r5gCB6U9E4qn1rnR3K8T7mAppETRWSTRfCM/b8B55DScl++jdLaH?=
 =?us-ascii?Q?tsOqaihHUSyqg2p12lDf+I+/9QDeCPXtR/nh8HL0R9qPHz0nS526TH4lR3Nz?=
 =?us-ascii?Q?3tno+S9Yn8crJ0MjQM2WS6RHCnu8m/WpuUorjoDBEbWu5nwObvOF0dM443yc?=
 =?us-ascii?Q?V6CL1GYThyIFxZHV5gGOxSHuwUAwsyI+/hVaTi9OsETuYfsaOb0Uq83/FaKY?=
 =?us-ascii?Q?jTSNefvfprpjhGTlXVLYnsXOv/Q8400=3D?=
X-Exchange-RoutingPolicyChecked: 
	blR9SPN33OBpPHu4KeV1O6xzC8rVzVjgZjny+qC91iwv/i0MJeM+HfhYWbQMdupc/27woE0pffrF1LPKea5+NvIYZQORflxt6GnImMh2/PK3fR2AksQ4n2e3pknN3v6bQcWyeVOvdGznKAZlTiVV6VUV0oVGkWZw8V3qOVJ2fWCTycN5Dnw7yT4xcA6lW6J7clqrhRQauwHzqkn4CjU4kLwgPdrm8ZInSlEVsTycLcTU76YNr5IuzlxmyX28F/LYQt/5D8X5yAtyrJYXCkfyOJbKIVqgjFPK9DjgWVW6DlCGJoLbBCf1zabZ467s6/OUFGYTZG4+j0GVH+kvTnyVog==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c876893-e45c-4e05-e8f4-08def69b4239
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:02.5914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSx/1X3RUVXxLKwlREdQReomgTOWn2kuDxJ5ZWPwNAvniJ5Gx6taohHOk6cDLfUzhdbSVk1827AaVOKznUgdQ/O0OdtblBLm1IfWGmPq0jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a795932 cx=c_pps
 a=Eb813/LJkoRL1pr8t+D1ZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=FUMHO_qugHfDF-dwOMcA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX30pFZRQAOSj0
 BXFNPKB5hfhntVljin+u/PE4WF0LZarWhbErOd0xQaZqop5V6vNrmEmYcIPLNO6LXTG5hfCcJUl
 UTe5OTFk/gdFjhb2nSrG8NOw4KwvUplvFOcjTVO+Aa2aj6BlS7Pe
X-Proofpoint-GUID: EOmRNeRoelxhOVOY3oQaRadsqwsJBFdb
X-Proofpoint-ORIG-GUID: Pbt_iB90smPSbVf6dFuxC2rhT_tEtNYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX4r7xX/ptObL8
 WgVpo5xKUePvmHMAXZQmLsp8UTGb4m/kLVQWxN5gpUQ9CA1cPRenfD9RdB3+pLtbA0YPmugT3z5
 Tc5Ex9ibDQkNiCfYxaz/8EocILH4JhVUc9QOWbvmm5QcQEQjBYyJwLC3mqlkktMd5EvmIQehdFj
 fREbsHNDhPzQ2Co3vKCvmc+66NFW27mzsZRZdlwuWGnFKv1+Erl86NH060oXPSn3y7fk/rEJaqf
 abhQgxK3MQiEddjyQ9bOaKqxTmVYpPnItIK9LZInZXjPXvFpscdDWxbt1kPD0s9hb5s5xvjxMzW
 5+0571b7TW2gt0NJMg46e9S6VoXO1R7Ablw8ufUrCIjnJyFKD7vw/Kn3Jp9zxfl4eAFCnp7MRW/
 i4/Kbq1DEzMSLJJf+G7jhaHG4UGzMl9GKSUSB+HAqiCuzK3ZJHEggT4D5eGuZljJ9mB0xwJV0e/
 zbvwOLo1UcJrYRuB4zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243092

* V13:
  - Added "rpm: Fix pkgconfig() Provides missing in cross-built RPMs"
    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh
    so pkgconfig() Provides/Requires are correctly generated during
    rpmbuild.

  - Added "libarchive: Add RPM format reader to support rpm 6"
    PR #3346 from v12 was insufficient alone. Added PR #2846 patch that
    converts RPM into a proper format reader for RPM 6 packages.
    Existing RPM filter kept for API compatibility.
    test_read_format_huge_rpm.c excluded (filter intercepts before
    format reader).

    Tests verified:
    - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
    - bitbake core-image-ptest-libarchive:do_testimage (libarchive_test PASS)
    - bitbake core-image-sato:do_populate_sdk 
    - bitbake core-image-sato-sdk: do_rootfs 

* V12:
  - The previous libarchive-related changes for 3.8.8 are no longer
    applicable because libarchive has been upgraded to 3.8.9. Updated the
    implementation to work with libarchive 3.8.9 and applied the upstream
    fix for "attach filter to correct bidder".
    Upstream patch: Upstream patch:
    https://github.com/libarchive/libarchive/pull/3346/
 
 -  Dropped the following changes:
    rpm: lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
    rpm: Filter /usr/bin/pkg-config from RPM auto-generated Requires
  
    Why drop the old change:
   The filedeprunner() fix runs at OE's external scanning stage
   (do_package), but RPM 6's internal dependency generator runs later,
   inside rpmbuild itself. It re-adds Requires:
   /usr/bin/pkg-config regardless of what OE filtered. The old fix simply
   operates at the wrong layer it's like closing a door that RPM 6 walks
   around.

   Why the new changes:
   It operates at the same layer where the problem originates, inside
   rpmbuild. By setting __pkgconfig_provides and __pkgconfig_requires to
   %{nil}, we tell RPM 6's internal
   scanner to skip pkgconfigdeps.sh entirely. This is the RPM 6
   equivalent of what _use_internal_dependency_generator 0 did in RPM 4
   just scoped to pkgconfig specifically rather than globally.
  
  With these changes, the previously observed test failures have been resolved:
  - bitbake core-image-sato:do_populate_sdk 
  - bitbake core-image-sato-sdk: do_rootfs 
  - bitbake core-image-ptest-glib-2.0 
  - bitbake core-image-ptest-libarchive
  - bitbake core-image-ptest-libarchive:do_testimage

* V11: 
 - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
   To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command...
   pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
   Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
   pkg-config is a host-only build tool not needed on the target rootfs,
   causing failures with -dev packages.

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

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


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------

Sumanth Gavini (10):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6.0.2
  rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires
  rpm: Fix pkgconfig() Provides missing in cross-built RPMs
  libarchive: Add RPM format reader to support rpm 6

 meta/classes-global/package_rpm.bbclass       |   90 +-
 meta/lib/oe/package.py                        |    5 +-
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
 ...-Do-not-emit-usr-bin-pkg-config-as-a.patch |   59 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...Unset-cross-compilation-PKG_CONFIG-v.patch |   71 +
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   16 +-
 ...-Verify-that-bidder-and-filter-match.patch |  101 ++
 ...nd_filter-Use-last-bidder-for-filter.patch |  185 +++
 .../libarchive/0003-Remove-bidder-name.patch  |  258 +++
 ...vert-RPM-reader-into-a-proper-format.patch | 1400 +++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |    4 +
 29 files changed, 2298 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (94%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0002-append_filter-Use-last-bidder-for-filter.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch


