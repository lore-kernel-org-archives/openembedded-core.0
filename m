Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E981C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:38:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12769.1788356329250032378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SThPv2Ye;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37055bc1a2=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DVXK9219275
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Sep 2026 06:38:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YX67xDxbY
	+W8RwoWQN9vyN2dpG3BXAuSnzcm1z6qkd8=; b=SThPv2YeN0CJphVc58MyRSUBc
	4D3Ndr0e+BSjT/Gsq2A3XhVp3tva1ZaIufkrJJKjn3UPwaRZeIpkSxPlUMLXzhL3
	/b5z2LXcnsEcyASKPFcESDaJ0EJM1F4MujRHJl81Jrj08559CdiWh+O46ecNUNGE
	bV/RvO6Nj4jfzgZQo/ZtA2lQTat67kxcJeGEmzTDtX0Rocyw8x79NAyTZ8cBWDfF
	8nYQ0J7aqXN8hPl3sSJprrl8o4s79FItNpHhgqCkseA2PLDA3LOHOWS+B9o+TN1b
	BIOGKiZ16srADLeySdqC3ScNtt9l0OrJdW6ihpgPD54wYngUC2kdTdJ/bMTOw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023130.outbound.protection.outlook.com [40.93.196.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbtpy6g97-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlEAaF6AuKXW1mCGlrOTR9Tybbm1g2NMJDjwp3hlzqrm3YYmJP92l1tKDInRhRmHaGdNz/QtCTc5AAA+EUXKkalXqOQQ0WfeoNiTBwnsJ5MGXrQOhq1CG93FCkPU08sDdD0IrBEZ92KRQUALEJM3ekRSVZYcl1zLYaHqHMgS+eF/rubBDDEAdixdK2hIFfQ8R+V0GtfoM2sZ+nLUQRXSNWrxt9BFAMzi+C6sghLOd21SwDqT8Md8p9e6gwtZyhYqDn6l3BNjnwnq+CQem5HRP+6WijRKV4HOBV/WmUy+HUJBJab4Gox2npPpRWAfjlu/UpapFBk9mGApiXBPinNojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX67xDxbY+W8RwoWQN9vyN2dpG3BXAuSnzcm1z6qkd8=;
 b=qm24oyi9F3kqxRjw71zrcKQB+I4vZY2ybEcnXTZuo0hq8uapwGM03678Nx6ND95+W8rofKHXxW8xUYgLY71Ams3gWlv5ZvNszRz+Jr5zlUdHu4xhYI+ChRyXK3zamtILXaO0IR3VOuC15ZGvDOksfTZjuE+FZP3oWix7MX2OYgaIU/kJlAxM92lyxgjsNh84CFceGM+JzKPuuA8LO/1nn4d9KDvEpri7eGxcFi1lmiyqyalVByaCn6s3FMl3GTSiARL+DGjhQ1sIsXoBEr1+XPVE4E+WayzDCwxIXy20Qzt/XvAHcLD4QMn7HDDSVoOM2py9zqtpcdhfGqeBs99XlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:38:45 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 13:38:44 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] glibc: stable 2.44 branch updates
Date: Wed,  2 Sep 2026 06:38:28 -0700
Message-ID: <20260902133828.1448753-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 2398979e-30f0-4ca2-84c6-08df08f78260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|3023799007|10067099003|56012099006|11063799006|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ikmPJ4jpDdD0LWbpzCXJ541/Q8tHV28bhbUOFkoLGYlAdY5QUzcHL1VviN3Xa4bvrXgp4Myu1M4C2BGX7dv+rAnodC/FW4JD56PzcpKTgmjLi2psUJP2IEQd4llQJpzjJConIXVFR9QftK3UfbqjAU49XWq3iQVPbFcjD2pZlOgeUT4uQbQYusSXSl393/qKIfIGiYMvq/jb3c9OZVwswmU77D5MJfNFU4QkimC+S7dlRIt03OZiBOyr2V2b1Q6r5sutozEPEDurvWQumOxWp0w76x21sR7dxoZTm9EBPVbbrLrXms9XoWbAYu0Cizeg5xDpx35tIZ4fj+vKyuxEpoE9mmXQqYbIOWJieSnilr4lkeY561WmNrwANXFPt0x9Pgvhj6muDRi6aJc0O6LEPOVJhaWScWO/NBM/R1bcz4foqkwIAjoA8w+mztzj1bGI2REXy+0MarFyg+AiH8qJdrhdTLETc6U/gw/Szm2mzKALYymIk2NsqD/ffket5EVlLBwS8aDgzOhLfeEjdtilBI1sreC5a1/neQgS9V9y6YHmiqxdLqfzLZuL+bCFm3uqMawCoqRZqIaJa+v/0eOCfvUOAKqsYvzKP39KQueqdtTCwue+MjQ6ItEU8z6+WuVl8K/nsblrLd0fW3fZEcg/7ZBQycUfhr/BhW+YIV9r52vEzqHF66kNBm+B+kWA2AmN86U5mFTetqsE2WqdJbGzvxy+RYsJbzfz6BN2ftmXh5M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(38350700014)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/Rp5NzT1LbDucnWXs4b1XpGexko0iymAFYdmelNTsFrSH1wFG6Bz6qmwgIen?=
 =?us-ascii?Q?MoGLUxSXjLXNbQS5LWWo7J17Gubwec3xJAT1WQ96PmdMRdU7qOIdk5kwWVQ2?=
 =?us-ascii?Q?AAro942pIxITzSJuSA9OqufWZaldjNpHr3Y3FLAPeDnUY8Ugux8so2XnfPgK?=
 =?us-ascii?Q?vR7f7mtbN3NyuPFQ3//XYpDQS3bqEDCH8akURhI5kokSN4avl5HY2B9UimqU?=
 =?us-ascii?Q?b8CPdP29XQULuoVFC1NCKuXQUVcd3fyw5k3OAuYxV67+EbdriqI66fYXGxvY?=
 =?us-ascii?Q?Z11BD+1OKneweuuvHQY9M8otN2wbDTO5wQ1nIs8l9qEaQL2s21GoMATmOJS/?=
 =?us-ascii?Q?HRqT5XNsDX2CkJFddq1HDxOLjIAbxzOoDxR4or17o2Ba7af8yz3ZgszXoqnE?=
 =?us-ascii?Q?pC/5GZBAW/UJR0cWPCnYUUFS81jPLsHS3jS+4fKNex8KgxE8Mw9a2DA2WCzC?=
 =?us-ascii?Q?GZry03ZsvzcattEQCtxZy3jlfEetiq3VL3FBzVNwpo/NCEkVmsGh5NfphEHT?=
 =?us-ascii?Q?afWeDCEgJjTPQ0zwu22+T/DPRNnOWadaInI3bD6HjO7KBnHrtaqAGQZwt++x?=
 =?us-ascii?Q?fN97mTGl/QbX9Cdy3vGYD0R3J7dwbF6vewyAP/WplFiuf+0Vv6Lz4KncPYCC?=
 =?us-ascii?Q?NVeJegg+iOfJyNuWzlVMGbzs8O9ZsJK8ZAPp5GEv58NX5CmG5q3o6vgbX/PZ?=
 =?us-ascii?Q?gDwzLlF7VQtUHGgjRRzkQ1FDPg7Fl4BTGkw1CsR1OPUV1AQ2CNSKlb2UHPcd?=
 =?us-ascii?Q?3GptBqBiyI6lJRn+mG/0+rbp17s32+NLKu82ifQJqmh6AwnSa/JF4Wt0DE5Q?=
 =?us-ascii?Q?ae/ESODc3dyrwCC4BNh77GYdIrGr1W4640fw3dtSfjb2kGeedrjYMehplem4?=
 =?us-ascii?Q?l1ZpS0tsm91Y4g0RZKDMVY4wvj7/n8viag7/k2GUdJcL6dzRGC7m99PAC96E?=
 =?us-ascii?Q?T684sIp7tdMEJi5F8imNRUcHGX7b6Pfr0LYN4zpahv6xzQCO4Vd+zO2jxE+S?=
 =?us-ascii?Q?jhIxk9+EcAqTwIjr2BzA8OnA1aAhhBkDHQZamzMeBAXQ9Xr/Mh+O4Yi2quey?=
 =?us-ascii?Q?ft2jmjm/YfPlcuN9x6oiHOHaGkF5PbekzodqU2oRcDBrtfeAS6HksOz/SUrK?=
 =?us-ascii?Q?Nghn1gidSB2+0bpYeCgrENJ9TOh5U8HIYJSYc4Bo7RqF5Qqb65d67O7HEd2H?=
 =?us-ascii?Q?0CzMR1dTx+cilt/IGPVYAYnubrBkxbH180+VOThdCnwWuRfYgXAWHtiPtnwh?=
 =?us-ascii?Q?9p9Wbe6q/z50Tcvd8BTCitDIif4+aaftx686uQxFCSyk0ueURMhDFE6pzbiC?=
 =?us-ascii?Q?BiiLi/45zwvv2CfyH8lEXFPpJ0ZFMmkDVYvo2nZCFDTdwOrjCDzRWB6H4Hnq?=
 =?us-ascii?Q?4NJhkmTgxNu5002/ReuoONdZigIt174YSjsRoVqUduj1stbuDY1kKpghVuZb?=
 =?us-ascii?Q?wQTD+YtdHvkbxO1hI/MONP2WcPB4MVRhhez1+qxAdICk6PNdc6WkgbS46DOc?=
 =?us-ascii?Q?kz4k5/phD0hbgWsaAQDZMa8SS3F4KOPdnTOcMOFBWFsgLTLK6D2kKaSIit0g?=
 =?us-ascii?Q?bh6NUH3xlELHZKL7xS42CiPnlO16nXCz3i2hiZxccoqwdTRlNutr35bS/RGJ?=
 =?us-ascii?Q?Vcwb2KDD7riUX4KdEY3LicLffxXu1oy/euRpuEWZRncGSzjelmsq7FBeqnY+?=
 =?us-ascii?Q?iQsaEHCsUe5DV9B3gF/gLdSkCw3zBtSIkIwJzfjEIdAOm4y8S3++9tzseTpW?=
 =?us-ascii?Q?/aZp8/rU+KTQvmnPHm/P/ZQNZcO9pyg=3D?=
X-Exchange-RoutingPolicyChecked: 
	fTsYckMK5zOPWNuv7wUffPYSvLcht8m55/B3u3cYp3FwcbzEYglBM9du6/M0sGiuQlkBjNCJejPrpKYTnW403j3V/vKBgV1PagdPdJY3RCJo/AOm/l8GjpCMS0vadnzlYnWNg+skf6xHiCbhyOB9nRbjQm/yccWJtDYYaS0uGLPz8W5rk/X+iIfzocEIpJkD37jvdO6nofSIbSdS2eVY3eurPw+PKh8G6vAA8YKWl3qa5xPY9hfSUrVLrEViRsWgTPQ+LjwBpSXvPEN1ZFOqyt2k4IptcEgJWCT53jIncLva8clWtz2x66pb/Xj1lVQ1Ng4dxoE68ZVZZ1z9thPC9Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2398979e-30f0-4ca2-84c6-08df08f78260
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:38:44.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFNO8QxxDdB4LwYxvwQ3R602iHBmXliyHQOOMv5VM8bTBBpV5ZrEbAJJhgUyR396M21+b0tGohmL7tfLSA4QXQCYN5nfNxkU44G3JBXxsRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMSBTYWx0ZWRfX5jGTm49u24o+
 HorI7hvazi5V4Q09aV7WbvQdKYYOB0Ou806uWExY61CML9MkBYC+RqbKQ2EFCGHiZEdiQNKxqH0
 qH0RTfxmvTX5N9NHsMnduoFgS1SEf7gI5ORzfLqx8pFZgUaMg+SbnvyCbBsbcN9ZvvoEfOCBIrM
 GYka/7JILv2wxf82q1KutMafuR/2vyNK0WDQZe13xMXbErxO0DyXJikNCJxgvEjDmAgUlmCrcPK
 drV47P5nxc/HflUBCRQxqPUiSxrXwiL0yUvmK/OC+gdakHCs8BRERXbNyZ1JPdzp7Lf41XZOeB4
 55mUx8MfMQ2YuqUUupUa2i8H2rZEOm64ZVU4l8q0gLxwlD39VVfDyKfOzdmLdrNR079sEoNUC2q
 gi0C7yi2xnid8G06lEixP+C2I5uLzaH8Pt2HRKQajkR+mx6BH/b+c0vVCFpMA9AEml4exv5giDT
 2dNXssMlJ8bXP2i0ZDQ==
X-Proofpoint-GUID: ZHdrR3Cuol6Tmnqbbuitq5sQmq46Nc5d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMSBTYWx0ZWRfXwUiPtkHyqPlt
 gnPkhOg1bRHarNejO7u7C8jqzc74QmIJoLk6W8zaUanZ5zGLeVqbpT9leWCjrCpc/jp/QAKWCLd
 qWP9K8AvJsmNgY9e+/VD6bVtcNgzX1ztfk68MSbgAjqgrdLPLXKY
X-Authority-Analysis: v=2.4 cv=ANEnCIlm c=1 sm=1 tr=0 ts=6a9826e8 cx=c_pps
 a=IVKdG2MezXXsalPeTMxobg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=_iwhmtGnjCteGCegm5MA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: ZHdrR3Cuol6Tmnqbbuitq5sQmq46Nc5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244962

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline afd131806b25715a7617ab757db43f0bb610acbf..5c479454d1232f71c78fa21584e90a2f57883407

5c479454d1 powerpc: Fix preprocessor conditional in soft-float __longjmp (bug 34530)
93606c5c1d powerpc: Fix non-atomic stack pointer update in fortified longjmp (bug 34530)
2d5421ffca Add check-symbol-version.awk
8587edfc96 alpha: expect test-float32x-float64-div to fail
3258c3fd91 alpha: add the denormal trap enable bit to FE_NOMASK_ENV
890f1c13f0 alpha: Fix stack alignment in makecontext
ca54198dec iconvdata: Test case for bug 34556, bug 34568
cb61572ea3 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
6f9b2bfa50 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
63b53df549 stdlib: Fix right-justification in strfmon (bug 34510, CVE-2026-19499)
9c48b91ee3 posix: Remove unnecessary overflow check in wordexp (BZ 34090)
ae9225d559 m68k: remove sysdeps/m68k/m680x0/fpu/w_fmod_compat.c (bug 34559)
d6ff274313 misc: Fix out-of-bounds array write in tdelete (bug 34506)

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6765   | 6768   | +3   |
| XPASS        | 0      | 0      | 0    |
| FAIL         | 27     | 27     | 0    |
| XFAIL        | 16     | 16     | 0    |
| UNSUPPORTED  | 583    | 583    | 0    |
+--------------+--------+--------+------+

Changes in testcases:
+-------------------------------------+--------+-------+
| Testcase                            | Before | After |
+-------------------------------------+--------+-------+
| elf/check-symbol-version            | N/A    | PASS  |
| iconvdata/tst-jisx0213-progress     | N/A    | PASS  |
| stdlib/tst-strfmon-bug34510         | N/A    | PASS  |
+-------------------------------------+--------+-------+

Justification:

commit - 2d5421ffca Add check-symbol-version.awk
Adds the check-symbol-version.awk helper and a new symbol-version
consistency test. This introduces the new testcase
elf/check-symbol-version.
+PASS: elf/check-symbol-version

commit - ca54198dec iconvdata: Test case for bug 34556, bug 34568
Adds the regression test for the EUC_JISX0213 / SHIFT_JISX0213 pending
character reset fixes (CVE-2026-80489, CVE-2026-77117). This introduces
the new testcase iconvdata/tst-jisx0213-progress.
+PASS: iconvdata/tst-jisx0213-progress

commit - 63b53df549 stdlib: Fix right-justification in strfmon
Fixes right-justification in strfmon and adds a regression test. This
introduces the new testcase stdlib/tst-strfmon-bug34510.
+PASS: stdlib/tst-strfmon-bug34510

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 9573f5daef..b9a4539277 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.44/master"
 PV = "2.44+git"
-SRCREV_glibc ?= "afd131806b25715a7617ab757db43f0bb610acbf"
+SRCREV_glibc ?= "5c479454d1232f71c78fa21584e90a2f57883407"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


