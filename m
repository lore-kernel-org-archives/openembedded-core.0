Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C87DC61DC4
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12509.1787621611660500303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W/P0FTgc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P1ORs4342435
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0irEUd70R
	+alMA4sOJMHvAtpJ+gZxr5OBSurG+5fcug=; b=W/P0FTgc9uU5uaKTh548gSjw3
	w8oHtG8H+oMFfE9/d6wg0IugwSIAN62+Ts7RavoTSqRAxhLbNrd5TuRzOjA+8Xbm
	qv4zPVKiIGFg3dRro4R4kXi3xCklvoAawCm6oWp3p1iu1uiAjYFSCn/TcEFanfQI
	tZDXyEARnERRczuVvAYJdkAhs7bTMySSazWraKIGOBS81SKu+9g5FkW4tLG7+fRm
	tDXeHeENXUmCRj5CTWA5ZCL7XxlygWMr7utFQDFnDJ4zYZl6B91ekzcvDUgOaSXK
	97MVARfZfPQRABJHr3pJWycLRPf5w7y++Ts0JjKEEwS+MpbqSKIAMCA7YRbGw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022106.outbound.protection.outlook.com [52.101.53.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkfyx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4s5enqKPc/zGUcIqaq7GfQXbzYxJL41h3TrXzrVKut/yt34ZofAx+NQPYpprQERQBq1L4dKXYnmDnHlmXca48ysoFTKa7s5yBOLTAH46UnQVi2Z4l5Nu1xe8TX6DxmQB659yqk5bHb+4fOpWHduPAnCQGQup8QLDU51EiF2f9nG69cVBVn0hrZ3Z7EBVz8q7sJoHfLv1ELjbGMlVQMvAYK7xu2fB4TIpsY3hOLeanDjsgSmF7DdCbgiFInU3Eb8YA9Md37dbBnssiffpAwiNBUpfX1pXgB6Uh9tFGy5gQMMGY57HuKQwuaFtOfGCMhU6q3FCTiafW52+eHLVxptng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0irEUd70R+alMA4sOJMHvAtpJ+gZxr5OBSurG+5fcug=;
 b=muWmRabvWsZNRLgRgfNX+SQHP2gP+Y7PwTjjnyinCu7t7x4HEHjHu2KBHaJ34TuhQKhmMjXk7wk6qUNGa6iAW/e3MAS7gcoInoF9sOERKgJd/6nO/7A8JBw/rM02NrO9ZEC13XVLAcx49gnaIk+BOSj9STP38U94vaU2h54q6DHrty/xaOUN5mB2bnmhclknXfifpC5T28pjILAIRr06BPSB+a8pxC0Q7czob/JBXFpWFlKBpxQWFi8IAHGXBqwXdtJ249KtyWxsmAxuOHbeqlH0Tk2DfA4nWqB85+Ip6otw+D1EMOfXOtd8GGzN+ma1DUKgcFQ47SqWN985VAyacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:24 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:23 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 00/14] rpm: 4.20.1 -> 6.0.2
Date: Mon, 24 Aug 2026 18:32:58 -0700
Message-ID: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 613440d4-c117-410b-c627-08df0248da55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|11063799006|56012099006|5023799004|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	TD8aQWznvuq9eEx+kHxAVQ0d8gVwHuErlNNctfmXPlmqNaFOTD+Bar6/tO2Q9K1gXi2PCNGszoFiBFWRn0d/QtLj7UfkHJm2IhrYCQ+PwcqxBf8hPvg0/SzaPVrpbvQeMGixqOcVxkrZCHxaOUtv9nEhm4mS10B6Ihlhd/gkQ8SwhUuMbhsM0QXyg0Qs9kEFrggPgd7G8/5bCrFBY/0TTR7xWxf1wFLP6e4UPPaUmX60HFndKjss1CgjwitYN/0uBeD3p8aggLWa6+JOumXrQpVLydT5ez1dUhG9Z7PLXsGo7lwMUsrBkVNU7KUNRFftl25dKhVNWT0fEgcUWpGf5br1parid/SXTeC5JjDI1FMi1lhyzWJGkodQMRKmniCatQJZH99ie4Lz5eieMYvG1gxafXH6n/nqcQFp5/YR6+vqmlTpNaSP+hpHyvYc+SGLMVRsrQWoa0Ddv5MGNLfzJ2+f4xzJRsSQ5KBzhiMDzh8EbTdAZUaV8lbjyb4GvfYPExyb9+KdteNyiYNbVWMUALPheaSR1+l3W4ZUPzzOOUOLG5CnIDgwlQ7N7slu6buYbAjMIutB1UvDm1TLM6WWvFI4EU95YRa4nCBXPiYzjMygZYyt3WHvCmqaFHEN+MRTw/Gc4FoJn3/POqOTrW4ewDloCZA8MRpg5O4Ea3l4MXndvw77P+3I0B7A5Th2PT03Bf/yzVt01JUBSPbmat51ZFJxWTtA9lzmzHe0l2SkNG0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(11063799006)(56012099006)(5023799004)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?paBzKNMPfPqCEWLZpHrSgJc04qhN54XhSGYbScT8yqEV7RXmUhzJ/tZTVKDz?=
 =?us-ascii?Q?HCRmEufYi0PiJyKpFiB+9mLLDVRzvAcaRzoB3wqvMR/a+i9u1vag/V6iZLPk?=
 =?us-ascii?Q?0J5p8y2ckBHOVV7EBnanrEJNeqCl5GLPk/dEwdT2QobWNi31tv6ZeQff6JfM?=
 =?us-ascii?Q?KUclu0AiBSqvu48JexI7LndBHejCXCxgbM17dAfpiyiDFdKUVfA9+d+Ry0P5?=
 =?us-ascii?Q?t9aAwzVHNRpfKU7QFLBFe0vMzUrbL3CIz5f/hcx9ThpWPfMmz+lmEh+p9O9a?=
 =?us-ascii?Q?A8CLsCGKR3ooHFPYH+bHXEodNVQwP1gVQv2ZJptuy/TGZyTbwSla7IBtJjo9?=
 =?us-ascii?Q?3H2D2e7LjcHjplSb7dndipiVBc3g6ogO5BEZnrbxAqRNOl0ybxjBq5JpVRJB?=
 =?us-ascii?Q?bmvbHkG5Jh4Yz11yuXR49INvupg1K9+MuwwNiApDyiqgeftRtt1K7EYViGEE?=
 =?us-ascii?Q?QeZm7JCbw0a4UMMVUxpPMtWbz4sDE0dr74/MtU5yxN53nKZOmJ3sibKN9pe4?=
 =?us-ascii?Q?y2ezPxcQKqQqFzPb+0tTHYI5DsBRLWByW7AyCNGaj6QG6O7UU2QpARfWUIYp?=
 =?us-ascii?Q?C9/IIqpnNKBur3MK2ssIAOjQZgcXcRGK9BnjCqwjLG0PPyAEEGfdBrnDehl6?=
 =?us-ascii?Q?SUKjZ5XRi6vt+bUQtA5mzWLBADU13MKl/MR+6cEz1TMyyamaSdGoyr8dKflj?=
 =?us-ascii?Q?GNfPaRDFgKO44dXVyMQOwsIp+Ddqga3dTfmK6ftpfYZwpzp18QUQetNH2Y+V?=
 =?us-ascii?Q?nfe1YHKpkwLPq8iu/Jm35C9+CUhU2Q7J+Hb1sEqtR+kc0wDtoBt/Hb5do73k?=
 =?us-ascii?Q?llhUtUCDOfW3ckMYwJB7m/fn4ZGXqo1girHJaKqBw3tb9VlCssqalAPJLAP5?=
 =?us-ascii?Q?ODVi1FO+630olO1To0sCG9oJcBS6UQ7UJBUhfuHTBs3uEoQGNwV7WiJhsmFH?=
 =?us-ascii?Q?+sibbKNdZ3NT7rM4wGioJDClf3kdpDm+h85mdO/kZgqFB7n4/T0o7OWCXku+?=
 =?us-ascii?Q?iUbc7Nqn/G4h+OeTNdizj8qsRbMVH9Hl7S3S537LA7DkzMEop49OeYH+FwY3?=
 =?us-ascii?Q?MnvyfEm2bQuAjpsgAsRdfzwkDyVl0lwZZK3WgvUXexz07/W3JBrK6oZLBHbP?=
 =?us-ascii?Q?b31R4FQ8aVI2anx3Inpthkloe7/TVaSyOTMMri8m/f3+YWBubywLYSBc4OjO?=
 =?us-ascii?Q?1MAmqMZxTQqxds3a2Cfkm+QtrjTgk8R2bYnm7ZWaVFfwODoRzmf1WuUhKO9L?=
 =?us-ascii?Q?7Bwdovz4/FVM9EFCpEU9WtJxRnUca51PwRrvR/knkxGX2En4LvCgVYIKAdNb?=
 =?us-ascii?Q?NTWZrbGKHMgVrpMXTwz2QuGcKaXf7O0YI33dM6shOXvyt69jnUUb1nwEDEGO?=
 =?us-ascii?Q?TmqftZzur3OupkzyTq/6mbZw48zuUHmkXJ6OpHTybZi/U9mPP4vxiNyqKjW7?=
 =?us-ascii?Q?EDAtIJW5JtlFWxAbaMCsE7vGzEV4nDUfWc0H1TFwTRaK9NF5PNQq+9EIEo5s?=
 =?us-ascii?Q?ljS0WrNpg0xSFMO9EEg4dwz6RhFgmcyD/wP11WLGjx2pJ5jD7Tg/jJnkqe0D?=
 =?us-ascii?Q?3muJvA1ArJdOXsqtrxTaH9+lN2H0JAvOJNLmLGiLqOndVNUPGTVKLcThb5vw?=
 =?us-ascii?Q?DPiWxVkmqNhg7nPnHxY5aaiv3RXXkE0Lu25QEG7yyZTtv7EfEAjIPeElWhh+?=
 =?us-ascii?Q?seRDmEyZYqNDfYXY+kwH/Jrqn/s9HbRsRgWYBUS06npF5uQtfWYxJ6WLMB9Z?=
 =?us-ascii?Q?GyqMvAtrGMrmyWUQDgieO/lC5j0TT1M=3D?=
X-Exchange-RoutingPolicyChecked: 
	19PmEkC+H3XP60ni6uKI1bFUpSwPrTMKRXzSeM9XNHxDg2aQwOPNMvG9icVDjSpZCBHX9EuzWO3fk2Ln6qhfcyPtgwjhvOfsLfr8hOmDHDKmO1HNnYiYf4d+h5zeUnF+rn2ZXwOuGBbDSBYqouDzDU4tuO1Ts9iJIzb/HSlQQ6vFMiUn7M8DnCyyrKbXeWNu7qHHDsOqRFXswsPNTFu9TKcl0AESi0yKeuIMzr2WUGwAOJwnxwMUumCwAJ4Z6MOKZWxMZKL3v+7Iz26bKZFmVN6Og3pPVL+XQbYB2ezGMml0HO5yo7bpai84rupmBqdD+2/tnHWYl3YNjr1jdYEX1Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613440d4-c117-410b-c627-08df0248da55
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:23.8289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQdechU2tgz7GqINUYWhFve830Nr+OdxsKpNlYUS8xGetExTZDZVnKYVpHmnl9POUKcuXWSLVlUs0uyDHl5/tBfFmegOm0senhrZ5g78C/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: lnGirJQVfZppTr2OpXYKrFEviJT_mKzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXxC8utXYdeZUd
 CJjZBWHFwJqWfUIXyBRPFNhf1565wkWm7Bv1dHBj5TDBNTI0lZSo5seWTu8x8+dO+nAUvQy+7pv
 gjVl5cRQ42shtoApHF1bWMfqSPCvUFQiKplt3nhyZOpBE+wejdzElyDsgG8KIpshxAys0CeZ3sB
 rntE6BKK8BJs6dxLbPSSatM66xyYIR0125leoZ9pkMhKOm3cWo3l4f0TPcgxXdwst/1C4WlGTAU
 GgDsLe2CiDeaon8/+4w0V48XBxoC8S+wQ87XRxHjRdrSB0dTRCqVN7CKqhZNQ2lSmM/WJ/5dQW9
 NlCsOkPiQJSw9XLqVVVDfimCY4KDGrNE/aAnyus3DlvjUox4OMTOVpdQt2e+tjomQjlmxw52nxV
 53Nj2n4JnK9meFqDgdbwpAT5sOJ+oazfORUWwNMFdGOz0hTW42eOGwdDBmNZfv5CMRNGFP97K7D
 K6fb5+nyM6W7M86NqXw==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0eb cx=c_pps
 a=lgz4Zsbfm4nnj/Www8P8jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=MgDwocIahWBvzQjp8rEA:9
X-Proofpoint-GUID: 3FugdMt9Z7ec9Kfkfci6ATqWnvzm_X6C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX2UXLaEzyVDD7
 fXpAFvH3LuCJHDgIv6YOJbEK9db/ryPauld7fVtKWHKsS1Gw+4hpj9A1U1jOIJfv3q910MRc9Q/
 9HNh4N4tZ5I9fRj5gOjkWtAWKV+/4cMrkIe+xWwidt81iAflctx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244173

* V17:
    - patch 14: replaced non-ASCII arrow with ASCII in commit message to 
      fix DKIM signature verification failure on patch 14( v16 patch 14 
      could not be applied via b4 due to BADSIG)
    - all other patches identical to v16

* V16:
    - patch 01-09: unchanged from v15
    - patch 10: updated - rename target path from pkg-config_3.0.5.bb to
      pkg-config_3.0.6.bb to track the pkg-config version bump that
      occured after v15 was submitted
    - patches 11-12: unchanged from v15
    - Added "package_rpm.bbclass: suppress RPM 6 fileattr dependency
      generators" (0013 patch). Suppress all RPM 6 per-filetype 
      fileattr dep generator macros
    - Added "lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on
      %post failure" (0014 patch). RPM 6 #3819 causes rpmtsRun() to 
      return -1 for warn-only %post failures via ts->scriptError;
      intercept in _invoke_dnf() so install_pkgs()'s existing 
      scriptlet scan runs as it did with RPM 4.

* V15:
    - package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
      compatibility.
    - lib/oe/package_manager/rpm: Enable DNF filelists to resolve
      file-based deps.

* V14:
    - Dropped "rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires"
    (pkgconfigdeps.sh patch). Per Ross Burton's review, instead of suppressing
    the /usr/bin/pkg-config emission, added:
      RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
    to the pkgconf recipe so it satisfies the auto-generated Requires without
    modifying the upstream rpm script.

   - Removed /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb.
     RPM 6's internal dependency generator auto-detects file-level Provides
     from installed files, so nativesdk-pkgconf already provides
     /usr/bin/pkg-config via the wrapper script it installs. Keeping the
     dummy entry caused a DNF conflict during do_populate_sdk:
       nativesdk-sdk-provides-dummy conflicts with /usr/bin/pkg-config
       provided by nativesdk-pkgconf

   - Added "libarchive: Disable RPM filter auto-bidding" (0005 patch).
     With both the RPM filter and RPM format reader registered, the filter
     intercepted RPM files first and failed to parse RPM 6 packages
     (debuginfod scanning still failed after the 0004 patch). Disabling the
     filter's automatic bidding lets the format reader handle RPM files,
     while archive_read_append_filter(ARCHIVE_FILTER_RPM) still works
     explicitly, keeping test_read_append_rpm_filter passing.

   - Updated 0004-Convert-RPM-reader-into-a-proper-format.patch to include
     the test_read_format_huge_rpm.c changes from upstream PR #2846. This
     test now correctly exercises the format reader instead of the filter.
 
   - Updated patches 7,9 and 10 for the latest master changes; no code 
     changes; removed upstream modifications   

   Tests verified:
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native
     - oe-selftest -r sdk.SDKTests.test_sdk_manifests
     - oe-selftest -r sdk.SDKTests.test_sdk_runqemu
     - bitbake core-image-ptest-libarchive:do_testimage
     - bitbake core-image-sato -c populate_sdk
     - bitbake core-image-sato-sdk:do_rootfs

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

Sumanth Gavini (14):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6.0.2
  rpm: Fix pkgconfig() Provides missing in cross-built RPMs
  libarchive: Add RPM format reader to support rpm 6
  libarchive: Disable RPM filter auto-bidding and update huge_rpm test
  package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
    compatibility
  lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps
  package_rpm.bbclass: suppress RPM 6 fileattr dependency generators
  lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on %post
    failure

 meta/classes-global/package_rpm.bbclass       |  103 +-
 meta/lib/oe/package.py                        |    5 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |   10 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 .../recipes-devtools/pkgconf/pkgconf_3.0.6.bb |    2 +-
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
 ...Unset-cross-compilation-PKG_CONFIG-v.patch |   71 +
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   15 +-
 ...-Verify-that-bidder-and-filter-match.patch |  103 ++
 .../libarchive/0003-Remove-bidder-name.patch  |  258 +++
 ...vert-RPM-reader-into-a-proper-format.patch | 1440 +++++++++++++++++
 ...0005-Disable-RPM-filter-auto-bidding.patch |   73 +
 .../libarchive/libarchive_3.8.9.bb            |    4 +
 29 files changed, 2190 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (95%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch


