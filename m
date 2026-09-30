Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA848C9830E
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 04:19:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5921.1790741986760840549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 21:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EY0C9W2P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47337851c1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3SZPw3433586
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=7A5ewRoD8
	l1Evbw/JWxmxbgtMpHZWntd9JR98FzXk0o=; b=EY0C9W2PNO28ljM9sUHstqrrP
	+xdZA5QnwBifC7R9PSDlKS2DaJEnU9vJWzfs9QsCbNjF+KIHWER7Vb2yY6AOuS87
	obVjMChL48QrRh/SDEsQpzDy+vwlTYdQvHE01Fj+dWvrxXg4UoKMZQA//Bcq8Dtp
	gkMqxtbeFEPDnxbpbe3TQhbWcGZXU/+gYgGyNs7mZKSrvFkehBZtP1i9MZ/cd3HT
	Wujn2pdpdkX8cUqiuLECerFHte9DRh0tC1P81cjdAivMNeeMpysZ1VXUPvUTjdv9
	Ds6spKW3Ij4ZPPADChQCS+m66wznj35c90FtBfyk+9GmbVGv6zVb0tZTpLIXA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022129.outbound.protection.outlook.com [52.101.53.129])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515ds7f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:19:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQTFaYhtk7rMlZgPk9VnkSx1je0vcUyDpXNqBX9P55+Q6hlJLchIwcKx8EHCDv493sb5xrg4YK/fNU+56IiPMT9e9KH0rlTRsN8PK10GX9KwuvbSAUGE/pCSLJ7KjfxX/lXaE7cu2WsxcucL4TeMUts/UeGC6BLHnJI9Us05CZDo1yhzO/khpYJmxj3fGN/Q6uM0Mg1JcOQ3fHMYMABicaKTXSY/MEjvj9YMCXJ8I6KQVuz2Km2Gij2oXsQAASTZvmdXlWhtGTlFmiPCyLDrZ1twqnfcRXd2TrZAqENFubDiPO0QDWIUDPd25I4kk3mvDAWI1h24cUBRJZcG3hZ2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A5ewRoD8l1Evbw/JWxmxbgtMpHZWntd9JR98FzXk0o=;
 b=qs+c8mEtcs6E5xr+7z0yqSZO+ntTCI/ffXsWaFDGFSj0kK8Vmi4TwYINaFg6/TjBhQyeaN4cyiIIgISN/s82rGaQYF4HKfJoha7NHccpXEg7oFd8hob3cYLscEu2c22k0gjLr3uEG+Itzef/nd7PJM5pTC+Ge4sbY2cMHVe5EmfyA0cBY/vmgsW77reqs3INEC6LROK3phlZJINnaIo1Uf/8mJEerZbr4tqi0CgRJOuAstYsSKDBUpiSoQimq8pe7n5QgFM4ia5Z9qGSfQoxHpexvRhV/Oune7McH437PSlI45Yr7IBC29BBqLMEA3o+bfPmgRJ+o0yDe4Bkw5vDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 SAWPR11MB9546.namprd11.prod.outlook.com (2603:10b6:806:4e4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Wed, 30 Sep 2026 04:19:42 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 04:19:42 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [wrynose][PATCH] glibc: stable 2.43 branch updates
Date: Tue, 29 Sep 2026 21:19:27 -0700
Message-ID: <20260930041927.1313070-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|SAWPR11MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: bad44f55-317d-4ce1-08ab-08df1eaa0cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eBtCwQHqIdaLzW9VpXwM5NJsTKP/QVfk1SDsrnhGuOpFsEXs8LYuEUorJPAakjCgivdqFPwIw1IishM5DF4ba85MxgZ7DnNwgxp4qe+m/rjvGO4x1rkkI7zKlTuVm+GhdrFYcRakk8sR67yk79I7Qr/b//3rXoOMasPwQcACINB96Udq95Yqa58jhE4yn9+8ggEuoFs+iGMvoJvHdrQSFvqurbq8DCZxGiQ4GoYBrl6rJETlvlsc8HNpiSyCkfHayT1L0uDtQ/9ny/fbA/lm2BjXw0zAoa9ejXlhyUWhpVm9ovMB/xCPFE/9ooUOuNIYdC2o704RuOXoUsA0IOGu+QWZPOXKXCx8v0amGs3jY+gv6sgcu7tGNPzM+G9LXOtIbR9BTvv/35bUcU9PU8ZYqHDEDOsffCE6BO04BnHD6Mtn5b3VWvy+MYkAyYZq03+8zhTwOiOM+3VBIRTh4u71krau225dRXRCs538vn1ZpdrrwCOYou/uHP6VCwn9nhE8cxplskG4SGOMlFVhZ1Kpqkr1Hi8QZWshjUkQT109FY9KXzhY8udrcaUFS172wP3F6I20TM/5GHZ6hAf38WsWjvLJ8QshbhouDMiWncaWBqFp6LI7LdOMnfZtlfThs7ts8SANibWh/MN3LZ2YlYFYOZHqAdbNndF5R5clpfBdb1TeEhbX9NPmX8j0koi9urcd2nSz8EUVGyIIkDLlEJrZq/hr4G79rOkWrd3QH1JKuhE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aI/FdsEdydPQfkv324XjuxkbuxynCs02vcYPdpFdDB8Mf6KT86ExLcYJ251r?=
 =?us-ascii?Q?a/7r3tVaAqAtZGYe4wnuLjv5yvkS8zay8nIMNzll+XOcr5gVYvJgpILOHt6U?=
 =?us-ascii?Q?skL1qxvHhs+Ih2CAtA0n0zhcYp1RIIRi2ldlujw/YWWih4EE7cUBx4uyUk1U?=
 =?us-ascii?Q?tnmW6otsav6a3ydWajssMD0KVdW07OxCz2iSEkQzhOvOEi5o4tCPCcNKOT2u?=
 =?us-ascii?Q?0gPQ8DAiz2dKVzKnW3/NdyuFxd5jUEgYDidgXL1hUftcWO1nprDp+7+pWslS?=
 =?us-ascii?Q?qsWmI3Qu3KWlbg/c9PCZVpcBYvP8jd259QiR7tsThA2FNW/z3Xx9qd67N9fZ?=
 =?us-ascii?Q?n0hctf1ebhzU7veaGShGDXrLL7uLBHgZGyCVAiLN9V9+Qszmvc3EDaxjgZIV?=
 =?us-ascii?Q?U/y0wsg7tclFl5zV0mPd4ZNACCPHnRPdNphIl2hTfWfPlkUXPFRIOEERIMrx?=
 =?us-ascii?Q?+2zMxJA438iftRR1XFkEXVRuUwTAd1PzXsU5BO37bVomS2ZANPDUMUj1AJCC?=
 =?us-ascii?Q?d7w+VlHmywpCKy9VJqt1Sn5dEqjuxy5vCZoiVcBUBgGWo4m4W0y+nZZ6PnEd?=
 =?us-ascii?Q?NNM/xbZN5RZTwE1zUC+U1Tozpza8uau04RTa5CBdSJcplyeemQll1i2LcVC0?=
 =?us-ascii?Q?erxnUp7ID4IZhmNSMVBXt4dVWIRX7+NhNma8Uec23GDPkN3Ff4chubbjr7Pt?=
 =?us-ascii?Q?1k3NRmNeIwKrjo4osqOPcgMR5ECA8c+quqE/uos2hZy5wkT+394A3Q+nskhd?=
 =?us-ascii?Q?degKKoBOlWwYsaXIUrp4UOEi3kOG583GPGyMhOwnbVb1Hfvrq6gUflS5v0xm?=
 =?us-ascii?Q?n4SeaoOLsFcjhx5e+Q89TNj++yofTNxzbEeHXf3fnySYzGxgqEuGLxhAY+kR?=
 =?us-ascii?Q?ojQ7e0MGL0epmZpspH4GdnzMedFBScXRUe3kFRwIbfbpxpObIeSv8yT4XRyi?=
 =?us-ascii?Q?vc20gmzgXrq7H6orxbpItJ4S3TuUNHcV7bchbYy8zoWe7AglqBOrXIMMETFt?=
 =?us-ascii?Q?YMQtfcjKif5GFIVfNb20gMHfV0AI/VG1GPeeSKAjfW5ty0mfCwI9BOhllSLc?=
 =?us-ascii?Q?86OU3KEfRMDOCZFOMsBD3Va15IE9L8BwXbDO2CnHyTLlSctMVT7iCn0tkKHV?=
 =?us-ascii?Q?EfFsqLz/ePRINEJUIEbpHeD8GnEO2TSl6DfD7SM1+hWPtfOzoQ4qvjpZcYlH?=
 =?us-ascii?Q?n5Ch99MuH4goaCVJKtKiQTn6H/SLVdIIw1v4Puw6rkgGV2PHRjqIx3amBhhK?=
 =?us-ascii?Q?5Jse5seuQbDsNNncmd49gSOaaybpUuDw6QPnkcAv8pcH4zbmcEk7It0YXuLI?=
 =?us-ascii?Q?suCJ7eOMGcEmyMWg1Q0cLquEN4K4OvCtq/rvJTRZKOVc/8afBB6sdHsYfafb?=
 =?us-ascii?Q?WmLXP7qutlfnFLs3/DUo1e6TKBFcZ74XsBWVmesTycU6TSYZbqH+F/n4jkWJ?=
 =?us-ascii?Q?fpV+qqBHQPpsoLnb/i1pLJZxQqvur/fUZgnyi5e/y/hwYtwBPuQ4085AFSqP?=
 =?us-ascii?Q?bgIQysnfKayE0SRD4iZL9TJ0SGQugsUW+tdk7sarINmm3BthJRH4LdjTL2wg?=
 =?us-ascii?Q?CkrMBHUGqOhvMvhPZJ3biDmOR/1JGvSVdjL1KIleGSdPhtbkGixSApl8ksl6?=
 =?us-ascii?Q?p1VlXy0+idclyvkWCpN2jjsmVSNvN/zfct9zdK1zon7kwTHy2eXt9oxWTDw+?=
 =?us-ascii?Q?FvotpJxt7vpv8e2tcdP0xXZ9KQHEm2e1bMQYMZ5AByf86k/kQSGjKzZHtCRG?=
 =?us-ascii?Q?mMT7oERgF5ecNok+EODnIrPdVmQIqLGrFpQsX3xeJ92asMhnkwOK?=
X-Exchange-RoutingPolicyChecked: 
	kfDXT7VhjXi70Wmj4MM/doTSlNXVZfaKIZeY3Zp/ih0NroqeIaV3o/eOaDSaFEl+XfDec1vhISR4WZVxQTQBuTPdQjrzdbjJondIydL3HDEyNOJGmdU4xSHdUprfxl8LwR2eTyDpDwoQ0x242xFx54B8Ga0oUIVrJqyBMTcpR9BwymNBgkA2yDxcIVf1WlN9DBfzDMvONsHKsL9IZjOGxSocmaCnCCRT4Lz2cPdrqQWssrNwWA2blvWZumgOJV5LNXjYY8RahrJ+s06nqeoLRGvjL2ulelTsrP9VQLFjPVTGLs5V/SyMOWhN9yVFaDbOLErEC0t/7ICiyO2T70mu7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad44f55-317d-4ce1-08ab-08df1eaa0cca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 04:19:42.2085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6w6JSEGL9HzLzNJrahqyvvl0xH2r89ECuXmUQdEFGgIYp7gki7oKIrmm8lnCN5QCFSxHQXIl+su7+LPEMNiR1zWj/DnzCcPKGwA+6HhVDLI/SwtS5+hHXpXr6PETPEpq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9546
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAxNiBTYWx0ZWRfXweJjDVVRvETG
 mLRndVSOyTyBIGCsmk7ACYjtvbcjS25rj7vl0+5TGMOJdONRXmblEHjFt1wUJS7Ffdw3A2sBz0W
 qvAbGHOb7eoz+5u0968UvtEH5SqhcK4QdzOHhkVZcREVM1x7zSce
X-Proofpoint-ORIG-GUID: kt0cMXdNIgN5oC-u2lfhHw2PP6vupM0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAxNiBTYWx0ZWRfX9BVML1s2yBBK
 WQ/pg/ag/lhebvKp67ZFuhPcn7jIsVVeepm0iwrraqDck6LDx7qLWYFWerjUjkKTClW1ZwnvlNM
 695ydl0VASHuR2dSQfIndhhohRiWQLzf7vwIDw3nYJlYQ8PQMlc+aECwfbJnUEKn4FVOUQS5ekn
 nvdY0Vrd60IcPSC1bHMcD2tGINfvA/n3lfJTYy1WdxdAD2iDPCZW2zFs3cYFFBOKACjSsZ9/I0C
 U9ApDAkYx9FU1j3rdIN56fXHSfGitP8t67Vmlt3Vq78/99VTYIJHiQvUikNFn47QwlsPl/bgIqE
 0xG1hmeeuSu7Yp15mLCfEXzZXxo0rcjFM232Y18OYvkXgqn/UDYyOghg0gexgU/xm+fN6qDcfH/
 BXAAtCLaLeS6KnP7q4AHQW3L3ilsmrau7rm2u4xgKB42sSpVr20CHN3+YddOSQZDElc9FZSEskj
 Y5q9R0wYt4+dyYY0ufA==
X-Proofpoint-GUID: kt0cMXdNIgN5oC-u2lfhHw2PP6vupM0b
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abc8de0 cx=c_pps
 a=+gMbhOqEGrFw5yF6672Ung==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=I5Ir2K9uQ77gZajUmnEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 04:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246905

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Update SRCREV to pull the latest fixes from the upstream
release/2.43/master branch, including fixes for the following CVEs:

CVE-2026-6368 CVE-2026-19499 CVE-2026-77117
CVE-2026-80489 CVE-2026-18374 CVE-2026-8674

Commits between the old SRCREV (1c9988e5254) and the new SRCREV (9cda6fc96ab):

9cda6fc96a stdlib: Don't call clearenv from __libc_setenv_freemem
d6c6dd71c6 resolv: Fix assertion failure on search list truncation [BZ 31026, CVE-2026-8674]
65f2295a98 zic: keep needed last transition to new type (bug 34618)
f8f3d451ba nptl: Skip pretty-printer tests without python3 [BZ #34507]
d9a8ff5c01 hesiod: use booleans in parser macro calls
1c1f5103a9 hesiod: fix swapped arguments in service parser
049168237f nss_files: use booleans in parser macro calls
0770e8b07c nss_files: fix swapped arguments in service parser
20b3e87176 libio: Add test for fopen with an empty ", ccs=" value [BZ #34574]
72351055c6 libio: Fix CVE-2026-18374 heap buffer overflow in ccs= handling
8dad0ee453 alpha: expect test-float32x-float64-div to fail
f024355965 alpha: add the denormal trap enable bit to FE_NOMASK_ENV
c4dac931ab alpha: Fix stack alignment in makecontext
76115597fe alpha: fix setrlimit compat symbol for negative rlim values besides -1
c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
3ad1bbd8f9 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
138c43f018 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
713998bf00 stdlib: Fix right-justification in strfmon (bug 34510, CVE-2026-19499)
2a35bab35b posix: Remove unnecessary overflow check in wordexp (BZ 34090)
4964178b4d m68k: remove sysdeps/m68k/m680x0/fpu/w_fmod_compat.c (bug 34559)
0afa34adb0 misc: Fix out-of-bounds array write in tdelete (bug 34506)
7d26579873 malloc: Show hugetlb tunable default in --list-tunables
8017bcfc4d m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
bc95068f5f ppc64le: Restore optimized memchr for power10 [BZ #34300]

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6592   | 6598   | +6   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 127    | 125    | -2   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 559    | 559    |  0   |
+--------------+--------+--------+------+

Changes in testcases:                     Before   After
malloc/tst-malloc-too-large-malloc-check   FAIL     PASS
malloc/tst-malloc-too-large-mcheck         FAIL     PASS
iconvdata/tst-jisx0213-progress(NEW)         -      PASS
libio/tst-fopen-ccs-empty      (NEW)         -      PASS
posix/tst-wordexp-append       (NEW)         -      PASS
stdlib/tst-strfmon-bug34510    (NEW)         -      PASS

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index cf5a444095..5f6863df16 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "1c9988e52540c844928c6d93ff45305adc2c24a0"
+SRCREV_glibc ?= "9cda6fc96abd035d9cbe68482138d4a78a51a7d5"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 9f3a3814d0..104d6b4067 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -20,6 +20,7 @@ CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
     CVE-2026-4046 \
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
+    CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
-- 
2.49.0


