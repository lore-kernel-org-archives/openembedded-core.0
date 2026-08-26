Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17615C61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23340.1787780772310712792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=asX2tNox;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKe5XW406368
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=; b=
	asX2tNox2+8bFeOmvsaIySzEWZHZ6jqGOrOHoxFrOqO/2IhHIFYYRncfizJgcz05
	WxUog6wObnl/Hk65z8eYgNvJUlFuC6Gwc6GiSLICI9Mpypxh5ug2hIUCLLBnkvrf
	ZXzFCftRwyK4E9Fo3NbGdvLFQhg982e2ldK8GTJNUMAPvNALeMvNSMFwWPJ1eur0
	45O4KGjg0YQXFuc41EcWXUyL+wePYxo9AS9zhOl7FTGDKz3lVZMo5DP0uu94Q2G1
	h8VHmv2gfbUwD6r9GcgbzgjFAp5QLhoG0oIb4/89c2rT4DKAdt+wsdG4aA4UnUPr
	joMheyaCW0yHD4Cogph8aA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721qf60-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmQnvv8bVOeNxmUy9RyHVPRZyFXiLLRrM4y+FqKMX5g58niCVFS5q8jyqmqrADk60m3HYEWKJuxJFxIB7xAufNVdwvPcHy/5HQLOndqlo/bpSxOjj7BFRVmWBEisrC7R4kaqdV8VRRg4MPEtjXmcQCc8cydaYn82eheZgKmTe+OkcBy5E+PKMYiD9d4HatdVOvT55Np9D2LsPpU5QsT4ZKmU4bZYUzDNG5qtgAAgT03eVOdcXoz80HT0SjpSp+Ze73atgW8ud+jlL0bZpiLhqANknN3fWa0xuOdW8qag/kiDiurJQZ0TNI5lDRjk0DEDJTmlqyG+gGk/nwsgAWtbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=;
 b=Dr+dS08F8eI2UwROak0ReGWVR8IxOCzKIEdifq1fei9qI2l8IlLnpR7bw8PTDtidcEyRZs1QS3Tu1/+Mp2gahXL+5fSbuO07wrH8CNi4N1kugX5AGfVMRq1477R8Ks36IJKfqOGM5vN+RrfLs7n1yWu9nkBw01lU8/YNT/hdKErECGNZob5heYiD3iV+IvCgNPVSni3QhsHW7y8GDU7OK9bk6cpzkJQ1AWnqjPwfCKjyDv0k1RtUvDm9+Udo0IUU90XyjaQpl1sS+bEzuDaMqSP6CKXoSCs7SJl9kuj3xlbQMOl/qv8RMyWQ+BzsUOI8qefii9DWRND/6Lr/rWxQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:08 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:08 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 12/16] package_rpm.bbclass: Suppress pkgconfig() Requires for sstate compatibility
Date: Wed, 26 Aug 2026 14:45:44 -0700
Message-ID: <20260826214548.3002838-13-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c1eb20-f0de-4e3f-300d-08df03bb701e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9FUD9q6jp0La6u+HABdxmmN6v1mRQpPldrz7KZHukR4mir9iXFtpKgTG5/KYsDfvTWlKMNup8ZClQqXiiT7NXVPKQLDMCstpSF7y3xfPBOcOVWj38UjfPDp0lT2U+ZuddnDhl+ntdLZNBsbYgsz4Nnoiv/On/cQIpJRmR05kn3Rcu7pgzFCR4UkBzYYjOwMYzOzdkAHzOmdG+AFOkgAAp2XY9dU/mqVI3eY/YTV1cUXN9jUNG+waGiwzvkxn88YUlVcjdtGfa0Cu+gjK99bX+wPrQfQ8pqSK432YUqMnLfGoJ4Hu6takIMKO7f733ZwaYxfksbyq5Zy5bplLw7Ce8kk+GLItwP/2khpqR5uLEiM7j/tttfo+ZNVZ06aAkozayfQpKeBiyliif089o5+eG+sOyfiI/gDgCyzYd0brWRWvD3w1Z+P+7GF4QFrQpBuwY/rWDdZdp6jvCNqvmtnjR/phwZivUyQmRT0cvOeDZP5Waarj+jLu1W2yjIvieUqZ6VLMsV0o46U4JuBN5oqSQ8VtantXmKjDvbUsXuNuU83Az4vzqFuV8A9M/akmMeAx9l3FENYwIvbgRYK7V4HEoHYuXvWMB2ETKkUQWfhpcM180aMQfBC5cgoHcrnyHYS1Z4QHpFWjcr6vdA4jmwJ/8jw7mvzWx2O8S7Uk0Mu2uEpg7G+eL5P0TInk40vj3B4LV5PkYiFf6imVkr6qdm4YRH5Y2yzV7PyW2Ba7qMnPuv8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9gz1PazmFoclntr4s75TGeWtRboU8esLmHOJJD7MiXfgJCJcaDzI27D4a88M?=
 =?us-ascii?Q?gJvZhO7w9yU6F2UGmfn6JaZmc6cISoo12MsnSPPQPFA1en3UhW63MzGbOm27?=
 =?us-ascii?Q?MlsWWB7AfU9gyhd0gtBSncxulRBtHsc1dqSRNBSz8b2SG89M7DxSLPO8J4WN?=
 =?us-ascii?Q?ihHZaI3gMcThMsZhMeDyBQN4/a+3n7kuPCyfQ+gHSGWKCQQ+fpv3jqtYYEf8?=
 =?us-ascii?Q?rY6UBlyrTP3QNlGkwyjTVmPAWtCJq0UHSsrEAMLb0Es80jfsPH6sqY+H/aHz?=
 =?us-ascii?Q?3p65ZNxhcp9nVaUXZqVWiy4gBfx9NibNwKt+INyhWP6NeqiAMToDm3BM72Qg?=
 =?us-ascii?Q?U7rKVodvb5kf9Fessbf7yRb2TFJUKQLvM2rJERumQOq4/LloM24D3kXVNELM?=
 =?us-ascii?Q?efcytnZWKTaUMKb05nAr8UnxRcCc8IVPgu6vqLAJIC/el7a22ydOjGFbr2L8?=
 =?us-ascii?Q?WUplPpmk466rikq2DMC4H/FSFyYn/ZV0ifQS8onAzQj0ivk1H+/CDx0qMuNk?=
 =?us-ascii?Q?gTFGruqN+zQoy+RBTMUYVleq4lcVoPkDTBy9jId/e4di3PdWAlx8rvP57HHp?=
 =?us-ascii?Q?MyQyeUWzcLjbUYL37fcA61Cu1A+AU/tCT4hby71ipJIOdn9HJ3xKMOA4Hjja?=
 =?us-ascii?Q?S8Y+IouVKvHLaX3Bh7tIdFL5LUETSpql7CWERRGlUYA2fc22iokpcUjQe57b?=
 =?us-ascii?Q?a/gmUCMMxmnI2WW5uIKnOi3k/wn7eQ6xguxKdX5TUim/O/BvQkMvr4l0N/3L?=
 =?us-ascii?Q?CCrg1wH69OXi+xR/hbu8ctiy2YSUztZJOkM/brw7gn+n/u5Bp+Aj1Us3dvMb?=
 =?us-ascii?Q?iEMtTLE4DI6CZhaK6M68LYqacQ3ZgGdmW2eGozEp2EKVkMARj8j96Ys70ITq?=
 =?us-ascii?Q?ZqN8YC9b7a+CBP62TtRIQAjG5sr2UqRJtJxStJ7Z9oiZH7RkHJ1M7546h+mD?=
 =?us-ascii?Q?fWUhz3Xjom30MMrfuPcPpjDIYuU0Pr6oZvx1oUYDaZjnDbYluxogw5Dj2LcI?=
 =?us-ascii?Q?wRS4aDR+UEdhbtv/e8noyc12LJelP/kivWypoBDFhfzFseBIcWR+AOJTBTct?=
 =?us-ascii?Q?tSGHEEh3ALIG3kNF7XkuWfTXpzD4H+F6dm6MZd9AvBaTUEp6LLs0ifvokZ0/?=
 =?us-ascii?Q?zwhVL8eEYVTghGtkQD/Z6gbDzWRfOYtuJJ4ut3RE5khlh9HZUov73YP0vhTy?=
 =?us-ascii?Q?qDxfAhXZ8hMM6Y6jkV71XiB5xeyDdwdyB4hI1m+7RlTQK2Nmlb7qdevGiKhX?=
 =?us-ascii?Q?iR9BaneBuIe367FmyWBdCEOJVw5ATJ6R9UB8hd3jGeC1hwvT/QaMnhfFzl9O?=
 =?us-ascii?Q?VEU7UqJ006rBTuXvGGUiVlpu23BLEvSowDKaLLxxkqw9smcFSvrmUzs2q2c6?=
 =?us-ascii?Q?HuURSM0lMslWZvd00jPC81kp88zShWZ4IvypDJVnJzcAltGPe8XqTV1uMvkw?=
 =?us-ascii?Q?GrlcWnPqBO+F5WOWunrnY/Qr6ID5YcOVJW2wIj/a7TKKFCa7EGCz6lajUobH?=
 =?us-ascii?Q?3+eqNVCGrk1lgpO+1AolTh+FoZY+SEWv7kSuY92mh89PI/+f6ubDJP3SfCrm?=
 =?us-ascii?Q?u/amh6TKo4Cg2DFve9Ks15piPnlkv1oFfanf4gIP5mMG+k/aOLTuaEJrodx/?=
 =?us-ascii?Q?UTM0OkeyYJvAzwKig7O3G3V3kytrzLF5gfowulH55b/RaaQSerKcH4wN55bm?=
 =?us-ascii?Q?aN0vRXHowB8vxjlVG8aIgR+j/+ww3K7Gkku/PaIjEXCt3LLAqTAHoAvNV5Yr?=
 =?us-ascii?Q?ysvf7kmRbexPQC/79adHAFF2DWElxoY=3D?=
X-Exchange-RoutingPolicyChecked: 
	JckPL3FvKdV0IGuTZIFy4dDb1slg0rMoZ/bPH4WtuHRvGE1y4K8wbWbGYaS/ZiCl85fGgExQs2Hf4PZ8McaDVAiOkLNZM7YpdxtA41bHN2UZRyIA2Hl+7WCKIMd36oH19gmibn1n8fvHYjv+9bif0ClHSy9YGu1uCA4tx8+tI4xnjR7buWFlP4wtRPayN8ijOZNVOxcHZx1lbgaOmBX9unU4CGrsaH5sJP231m0JAzTTkhHk4AGuawcpODTS3HmqJow/abYwM0El9QBSEUonVfDO+DaI2Hpya9pJ0zOTjDArh54O1EzEK4hWfIdQl73trLxbplQM1W9qKPo9FBGWBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c1eb20-f0de-4e3f-300d-08df03bb701e
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:08.5823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLbqW1qpYKrsCTZgBB+t8H4pxVlrU8mmUSiiBjNoBs88GnqyTZ2pSdsQrV88kUKE5cp2Xz3mhrihGCU5svvjLKM2lBipTroWOMDKJXWKfuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8f5ea3 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=0YVC25x4kLZrtsW4MIcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 1n0ogpMPmMdZW8gLlbIvyo9tOHYPD9TC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX6hHvW2cuZDOT
 yXV+mqdSdUxMN/VR87WdY1faR8VP+CBX0RtViJlkZkGSG4eiPl4/q5kAFPfg2s2oI1/b4B5IU9z
 XcUTdzUaSwAEPGn93on2ssR0PaTL9S3l5WyrtmjY+ln7y9evkkhiQRKyqH6h0STkNG1cNFO8zVf
 4rCdEiYWf0Unln5gtEG1nRz0Y0E30+KI0NrLkrC4z1dKtfT1HLalOYJknL+Vzg1eUqXEvO+60nb
 p9djctLOLgmdplNgEFYMGt2DpeLkp2Trzsv51gsIGffhQ33338/6xt0ztPjBSiv1hOOMAlenA0y
 9JEBIIFMmnvP53VdYFd/e3sTeUMd5mxKjJJWXw9edO9wVRCZLrcFyyMm0/VkHcQb3xzUdEe2lQf
 Rs7F1jA5O21rvGpVcrRtsBTiw1b7+PGGD1ccY7oTWXNkhqBFJlsClfY8WryZ0E0W92OT8kMVhTK
 9hqSf+b2E5W++kI+E8g==
X-Proofpoint-GUID: o-Js4-K2ypURnaz-5UFQhteGU5bDTkAY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX0RhkbTItZDd2
 t7Fv3AGFy8o8NlIQ/zpyeMN5V8cCUIhxgmxOpfGRZuTWpwbHs1T2Ruhf1FeU98aEgnoTYhO46/b
 shzgof8CakAddwY3dmUqva+4G2H7tXWuyGW/e80QzHmANDWA/PVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244429

rpm 4 had two dependency generation systems: an external generator
(System 1) and an internal fileattr-based generator (System 2).
OE used System 1 and disabled everything via:

  --define '_use_internal_dependency_generator 0'
  --define '__find_requires %{nil}'
  --define '__find_provides %{nil}'

This meant pkgconfigdeps.sh (part of System 2) never ran in OE builds.

rpm 6 removed System 1 entirely. For v6-format packages it only runs
the fileattr system (System 2), and _use_internal_dependency_generator
is ignored.  So __find_requires %{nil} no longer works, and
pkgconfigdeps.sh now runs for the first time in OE builds.

pkgconfigdeps.sh --requires generates both "Requires:/usr/bin/pkg-config"
and "Requires: pkgconfig(foo)" for each .pc dependency.  This creates a
sstate compatibility problem: packages built before the pkgconfigdeps.sh
fix (which unsets PKG_CONFIG_SYSROOT_DIR) have no "Provides:pkgconfig(foo)"
because pkg-config was failing silently.  When DNF installs a mix of old
sstate packages (no Provides) and new packages (now generating
Requires),
it fails with:

  nothing provides pkgconfig(zlib) needed by elfutils-dev
  nothing provides pkgconfig(x11) needed by libdrm-dev

In rpm 6, the correct way to suppress a specific fileattr generator is
via its per-generator macro.  Set __pkgconfig_requires %{nil} so new
packages don't generate Requires that old sstate packages can't satisfy.
Provides generation (__pkgconfig_provides) is kept so packages still
advertise their pkgconfig modules.

OE manages build and runtime deps via DEPENDS/RDEPENDS; auto-generated
pkgconfig() Requires from rpmbuild are not needed.  This follows the
same pattern as the existing __font_provides %{nil}.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 51ad195baa..1e016971f5 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -599,6 +599,7 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
+    cmd = cmd + " --define '__pkgconfig_requires %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

