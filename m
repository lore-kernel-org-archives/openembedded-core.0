Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7129FC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9544.1785816512640042971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YGGUuBty;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6743Ol2o2814627
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	YGGUuBtyG67NtQMbIww6Bc2XqYwDkiIu6VNp3xIYC1kj2QH1BnlJXseR2ca2504O
	NVk0wyJQE6sY01ZnnxGS5c7NX3DUuvSUi4oXSVHzr4NzoUSESr2PTPydUI9IkB8J
	i232if1TSXBxNqcKZ+zSPs8V/FZgrLVa67NBckLekrsFeM5RdoLev451xwTjCV1s
	QWY7nscZicK3RRNQOqGCy6cpSTC5iAiJ9N+FiDx3KjaO6vWSS6sWDBRA7uosN7+Q
	b+NfAoXwzhoSXJSjXotc/1usyO+Qj2Nn+h7fx/a1MYM9BVewLob8zw8/F1Gl8A3c
	rjKD+ql3dbW2RoGV6skcRQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsc31kg1a-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tz8Eja6ocBQfmsVcyHvORyBqjQHwUK7CrF8XQ63QZlqdl1Hb4/aBZHGZym5a85tAfuey7sBDfmq+5yKYuKIv1DhS2+W9P9QocpynhJ0ZIz+71Cj+3uaEOTrvUNwkeGN5o6/1R2Rflef45KA3ErOXzlUhCHXGUM0G0KChIE2hAAiJ64XMeNZ3VstAVbMA00NM2jvN4vYRZHqUBm28uwe3RQv/TCzQ1RxIJo3CTzPsyFbgp22nCryT13s1j/0xrk+wElCSAz3keWtDojLKq6TYB6gBZCrhCi0bskiAd2JIK8MA6CIIYz+Kr3quML3Gj9pmqWBkEVezxawXJLhn7Mjk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=TR/loiW4ReAtCWF0HL5dtn4nOFc7OJTvAxWxk63Q6/AgpADLP+AeF7E4M30nAAnfbiHYSdC4elfZUhjKyIhP/5ansq7GAbdIiTk5/dv9OjvWHunUJgTqKn4B7GnkAaqj9jO4my7boiYZ2RVvxs4FH3cYT+aAGyC3zy43h695v25U0EddkJsQPGiuz0Bh1mcHM2sMzMbi7o4cKFfXhakpH4UgcHoJXXPerPnPRRQxA1PRhuI6H5HyMNRQJvH/IZgdMdY1ThZsf8xYibtAgSrYPYpYPnTBDrkhLmZE9oQw+I2GB+eBKXEWCARAlFWNXPz8xl1pciAXDp3kBsKspzOh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SA3PR11MB737119.namprd11.prod.outlook.com (2603:10b6:806:594::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 04:08:29 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:29 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 1/8] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Mon,  3 Aug 2026 21:08:08 -0700
Message-ID: <20260804040815.1499699-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|SA3PR11MB737119:EE_
X-MS-Office365-Filtering-Correlation-Id: 359e27b3-7bc2-4ec4-a03d-08def1de0a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	o7NwAJXzQPeFN0HzYk/gxI1YauTt4bZ0Er++DYR+b4mFCAOO5wip+7D8deZRO5nYOKc8QBBtCNHkyYzSLzT7CsYkliV9Y3kY6QVRGRGQT05yXm9qT1gV3ihmRCEh2NPxFShTpotPEpgOiSRErDGeSSBOuXTgajLHcaLBT9wtXKv7EpZEKqZJsw7/BzvWusnxk0ewyp/mIiXnw+1rjSib+pIXr3p5dq3lNHozuvWMcA/s8w7nTTeJ85x0xDcL4xOkakOrVkFmLuf/n22vYlFxIPD9UjLhECn2SrRrMHw3fQnAWblRXXMcHJ4Y0ESdS13/hU9micEIRDVPpOvPrJM3jOXWSDNg0Rnq6nE30NuNE5R3wlenfp5Somnev6BAXb4wWK5fpPy9K+JaUIAlnaX8q4r3tmXhPRBJJdYPnD5pbOXDtNBmHDnf19B7u38V/k1fRRvhurmD/ckLyZ3GHpBnMBx8TkOv+RXIdv8BTd9xqYskWQBR02HmSDzMt0yp115u+KBooHbP67HseoocQWSrVQYM+13SAZJhY5HHkWCaEUJ0GJUMNwn70l2b3nQEJ8VpIYYZHK6YhlwoTj6Mycl6Eq1D+3PwbVvW1S7VTGaUxXmSd8eO7bMcxE5tLYp1SwwTuBeydMPGJsELpSMjlPW2BJOx0G2FOqMd4U11IaHM/zBjjvpw0iQFxiVOdNj8rcH9ZNyNCXs6GwPuu+o1re2IRPUdwT/Up8Bq5AMxaAiPv/w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0KEpdmfSBdA9vQa4V6lZhnVFBFlw50bTpdAs01M45OkrNw1kdJqPHjW6laIh?=
 =?us-ascii?Q?q39V+UxNdvFVXopjgXxSsNzm+7QM7runCNcQqzRb1OVOLfrKJYEwJaOHtB1m?=
 =?us-ascii?Q?SxAP84ztwcMCSlq5cpX9hA9XHe2B7PKelTEw/zDFrQzXVjt+46R7IHmQfJpZ?=
 =?us-ascii?Q?rj/wCVFWRfRi7KCj8KgQ+K32RRweO56Wxbw20qQSwBfGrAcFxLu5HX7TKpJX?=
 =?us-ascii?Q?QIW3myDUeaa0iRUfPlrnnpi8f3aiDCR/WSnlcoJU4dawvVhtD49obkOhECKg?=
 =?us-ascii?Q?P+cwcE3MneDB9sqFSJreLyytGhRlfl+Zmbc/bXFP3Gc1jQD8vDFcvcoyJLZo?=
 =?us-ascii?Q?UIvewp9EiKWTx01tWKaXDnHKO4mWWT9yxFeUzanabMFkLT4k1pYntX0RbYLH?=
 =?us-ascii?Q?it5n4ekt1h20mN4ooOrR0nzsMY1hN2FeCMDEbE0cAKhbO9bRqJj9IQV+gI4l?=
 =?us-ascii?Q?U+V/4YXjjsI/Qea7lJUgaoA4+sPnHEABv5+iWfd3GA6kma0llItBhBLfyrZ3?=
 =?us-ascii?Q?eTFjdX7UrJzhTC2K2n7hp7BNjk8vBVJiCEGFM7qDFgjF30orck5P85yx4Q52?=
 =?us-ascii?Q?IuAYT6nLbIz9nI8yefKtHYi4XRTsQAc67ZEYBqgYWMM9AiovWuACxJpXyaJP?=
 =?us-ascii?Q?MIoHF9bWPi9GJnA+QZRfJs006xc8LjUrT2us3K6yF9ey2pDwFDfYQgdFCpYl?=
 =?us-ascii?Q?8J9Hig+H86BiEruR1Y5oYXJVaYmgyGPf5vlWMjs/y8fCOn7iIVAViDC+CRl4?=
 =?us-ascii?Q?xvzZuRtroxSlk4xtdjV7SAtL9lUfNDJL5e2XVzMWeDpae/hYCcnOXBrwlwmW?=
 =?us-ascii?Q?KwQOSLkXq4BJiyTVAlsXpuzvOLy+giphY9ToEy08+YSO6RSbQu02cHe+z15o?=
 =?us-ascii?Q?+xysTQ8S1T2df+cfVYmgxhyJ0wn1CUThxdl3fc+rSuKZ5eqboymc3wzq6oxq?=
 =?us-ascii?Q?tIFQU8q/pzLKNubDt3MTpTNOfgVBXCxUs+QdyVVCOK+RoqOaaP9zs7D1UmYJ?=
 =?us-ascii?Q?42/P79HQou1JZibkGe4oOy+PPY1Np7fRpgSGHrWuRpw5tblvdVVGoKxUx1Qc?=
 =?us-ascii?Q?MMmU9QM2k/ppGZYvlVoBFu+E21jKx0jwGBHUDD7HXXDReq0/GmJKJcBggoUz?=
 =?us-ascii?Q?3xpxAnfCar9K2bN6mvyDh3nhtagDPxJjf3G2UmhtM3lgJFendLEMPmZfTyjR?=
 =?us-ascii?Q?ha5I6IqPzihCLbWoUXFxbeJ1Fuj2K4wtx2YyGAih1YFiq9mfxTWdFWAo3rST?=
 =?us-ascii?Q?nVYKFwlAdY+CCRl+nKScuhTD69dC0b/YWdatTRk9f9/KEXAjmEzm+xA+Wk6J?=
 =?us-ascii?Q?eb1wC77uVMQ3Vcd4S38AHroEAZiVEeTXi9YukNxeIIbI6rmzm2X33dHw4vG+?=
 =?us-ascii?Q?ogxf6fZtYhGGL+aIWBNFPoAc7gPDoaQqO3B30lx0TqpuIb3eLfTCP62XwEEH?=
 =?us-ascii?Q?fEwTopySwb/ayprGez0I6ztugSevtsnhsA2w1n+J43GvgsKZnRR5A1JHU9RV?=
 =?us-ascii?Q?5kiGiHQO380Jjq4I86DepqbLKO7NPWHd2Hc0cl1tDj9seXBjinMqYASFEMYZ?=
 =?us-ascii?Q?EEkYYL+0fD/gX/3MnHAZnRLJIKJ3vwOVh2QJH0O+NrpSUHEjzNFen2RpZaOj?=
 =?us-ascii?Q?sgJ9ry4TkNQ5j4UDMToSQlrJ7OO4JrVGf+PE2NJANuhEOUh33aHiytcqi3on?=
 =?us-ascii?Q?1MRlN2Rx4pkkcPHfjq5BnM5lgbvOTgGCGGtIlT06Cz66IHFCEQHr0V0fKqw2?=
 =?us-ascii?Q?SXdPuzr9gBdWRLP1jMzpipM6esh3pio=3D?=
X-Exchange-RoutingPolicyChecked: 
	BePlKyx2paS1ri+GdyFZ6G2GoTWcGXF8VqNZtrCJNaaM4vq7Em7BpAQKmzf6Szkd3umUGRqit9LGRy0fjGgm+sOmF2UZlp/whrHtfttzFOZTfWplkBhqGWNyZryi3LdD/hxv8O2YZ1CtQ4jZkD5BDFzwjsEA16M0/ds9a0VsDjwWbMGtzT0qgpesUGVV5kmc6zvKc0akSAd1yzIxm6sK/FRW3EZif2ei6uNhW+KbLxs3XLM2qMwl1UN9Ck4ND4j/koNzmPt1LnVn4F6j2UGfkGNkbFuvy43r2wMP2f1yYv/4EK5kTfaDrMtbwfExrUHRp8F9aniY4zDF71125PhAug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359e27b3-7bc2-4ec4-a03d-08def1de0a8f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:29.6913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zq6sDnROpC4XmhWCbBq8/F1LI2gOCTwOPMdmcJTHeie43WIhiHPmcK9PPG7Td/YcU+tU6JK5RMWUHbH+Ei4Tk8lC/Wghcovr5hLfmU3QJio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB737119
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: auyNH62dylADVE5flFRsn9L56r4XsuPE
X-Proofpoint-ORIG-GUID: l8zPbg_AXob-NFhJO_Em2SWFNTnABc-0
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=6a7165c0 cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX3I/ZEeXy+y6I
 R650QIpcjTM5B3ZsbR6tpWDBrdUnp7X+vFHnUHptcic9nb2qn0fWjMOv1Lo8b5zt8frgcDqsXhF
 NQMl0qok6ewtN9NUE28VooH39hoPiL8t3kdPWcEMM3fmq7HcP7WvuN3mLXGYCfEQ2ykw7HuChIi
 Tz+RxsuZlanQiweMYc1B0NJG5OX49iG/zTKqDW4gT/ka9s9OTB2BCAq3xEYhiaX12rfgGhy8ImQ
 j+ObFcg0EaA4PHUPBKwIqfjH5I7XAq6LhUZ84GhARv/+8A03eRt8Tcao5ovML00cZNZ/OV4f37C
 oP+W97gno7gz8+r826vnRVmFbah3kkCdKldqVa/6eBwwLUv+l4Mnu8uNbmTUFU6dB6ela7sEXCx
 Hz6gW4Y5G4WDN7ox4Pft48fI1opW+h7dH4ic0kH/eAjujGCXf/2CWFCYKUpuvJEHMayNtxOfHmZ
 wvRHmuMUkKsTomqB6Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX990PhQa0UuP7
 vSwqFB+zhzMuO7CFzMR3X4KrBwH43srteQP62P/P9wVqIhZNEttVzqi4MDzNEMpypsyKHF203pd
 mC4PTIt3ohGJUH69Lw7Rk+VvtqblWa/f1duHzbyLSAnD9Ef56ewX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242685

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

