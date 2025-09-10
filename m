Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACF2CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 08:49:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12775.1757494184925538349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 01:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H4TAShjE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1348602c59=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58A5Lkv4604020
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 01:49:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=x56NVIuf/8WZqzm9yHGu
	yHiRgarQRwNZt9Fdxv2juCo=; b=H4TAShjEZVDC9vc9cwJKaP/y8kfR17afTU+Y
	EzRPjQ2f66qjGAvKLWtASSDdmG4Wb7ucgx88zFLTKD8ucZtKb9LSvVNdlSSvAyNd
	z5hdL7lCvuc8VITwZ9BldIgS9m0x3Aj4S6ri43KicQAJ+cuqqbFiGdiStwAGSZ9j
	GTA1xYwMGCgjIAuvtqF6dOsLI2cisDFGeNRSuZ11xeGyBTSnxq+6TmV/UdroOtXd
	tnprFDObzIaBVn5eRcZQGKshR3JKVr6FSkxnxuL/ZLMAxmFWwxYosjkIY0bdXzMC
	lBL6t0vyGg/obAqPqVZtjSS7bIk/CfidbanwnkxxrjH2nmZzYg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490g80bybt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 01:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chUxfbotJNscg7tEjcOqlSNC13+Z8v2dja+2lQ8uEo+z9ZjGIri1flrpqp37guleYFpUhkx/I6v/Y+3en4X4phDx3tJpml03u8QPAqUeJQkqFWKwKPzxOCokK9qDAmnZVIePrECVI1CRiEK4E51Mkg7WIzCFMa1dJM185Irbyv7UKPsciZI/gBLISU3jEy3xgrfHAM+xHupktJqnnzti7IRXpQbTX6MNEOJiehjkDaFYmTNVxNtZ6gw/ogJC6bTSl17So4KXEnIrf+GmGZLtCKob3pjsNe1xoWsMr9XsntZKKEirg2gUqQolrrxVKttZUFAbrTmwtlWyvad+T49H9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x56NVIuf/8WZqzm9yHGuyHiRgarQRwNZt9Fdxv2juCo=;
 b=R6BNIDwfTSmQOJung93PSV8FC2niYV+Q7DbuuhHWMaC487ziHfIqFXaqvtWqdKygI7OtIEHIkBNnWTBFzfjb0nHua8yVe/F5FhDx5tjuJL5/LoZK4j2SjNLae8EPr0KvgNnFzY3Z3PBnQjfE06STEgTHMyt/Jxb/RGHUDO3N/q7n+ksSZ3WDoY4X/PC4x2eJVmRtXl1x6DS38X70ShWxc9GfMueEAceskCjwwI0qYulAAxsU3wTF6ZLEFzaU1U7b1xGSgAlJv27KEUe2ozel9m7Dt+mg+n6zhXFmeIfNxeCJzq8c0PSmIHi2r5Kdi+J3DU513XXHMyzshkgqUdVTDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 08:49:42 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 08:49:42 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] environment.d-openssl.sh: fix unbound variable with 'set -u'
Date: Wed, 10 Sep 2025 16:49:25 +0800
Message-Id: <20250910084925.1926462-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:3:17::26) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM3PPF0644BB20C:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f40699-eda4-4c7a-0a63-08ddf046fbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?52Ni5s+BE/6oRllIluvxrlySwlR++EPAGM11spSQFQ7ua8HrXI5U1C1HEonk?=
 =?us-ascii?Q?4+nNVvbjllg+uH8mC3m/3fMzpnIgr1dIW+FOFMOpztfLwy1j8lZml6SBZN02?=
 =?us-ascii?Q?mABl/ma9HB2F9J8HwkfZm3tBXGxAHqJGFQcLDRMqTn5Y6PUDrW5/E6xLsuXM?=
 =?us-ascii?Q?VLccz2NkXKkNPJJZWieBCfBqx8GqI97P8wmIAJeFtGeSmbsgm3rwsG0ag0kF?=
 =?us-ascii?Q?sf6s/kZwatDbTOvlmIpEk/kSoefzejJmWNlHYKxUshjrjNhUjkMd8B3k9lU0?=
 =?us-ascii?Q?yCIegkqtiq0crsVHH7ykngniyFBDDqL9d7/AI3GypRhYEYBeWKof6fKZq8mB?=
 =?us-ascii?Q?5dAO0MoCtItSy25SbUvMAsXPL+AcHWRI4bxJudi1JS8ay1eWLNTEMjt+GQDX?=
 =?us-ascii?Q?MbRzHMEizzdr3lPdOug2yHovZJlTUvO3yHa59rLfj/G9mBP4VDAeKboSaAK1?=
 =?us-ascii?Q?T96hxdwtJTxrbcO+JpccT+ZNITYhzJ3oNJ7wFetE+4EIb/V8fCQahPU0C/Mj?=
 =?us-ascii?Q?RCcKbDx5Zgzt5a9DKqwudIrRXV4SKMsc0mIUgeYKBkCqQZZtqOpJbiIK3gT7?=
 =?us-ascii?Q?/y0GLctiP4M3GGdvoqypiV7+VsSA6gfkE30DT8F4aTxSUrqNswoCH6O8RubG?=
 =?us-ascii?Q?rONPJht0G6osk9b7cbqFBrMeMGxIS8LG78dVQ3i34lGrpA8bD/4Rd8AiIv65?=
 =?us-ascii?Q?fzGzoDbG6/KMXdMxLCiCWC1XHH6j2CduFKzYJXox5bITXPjEkcwlZYROlUFR?=
 =?us-ascii?Q?STLu09P13zd6nDlY5x4qtuNVEMgEjq5rZ9U3cQPQTAf/uSaFhIOmTV0VEIS+?=
 =?us-ascii?Q?abu1UmkyUoARPPLIDsFSppXO8RpkHC4bNXpp4mX5BTA/l26r8Zc5aOHeduyp?=
 =?us-ascii?Q?UhcKJEaAc5wWB2bYNY2pAsHrDnN8DW9pJqXGO2MvSBXJaSWhIHw7nk0Ulmfd?=
 =?us-ascii?Q?2ZkBhBDVfSLFoASmk7Bhv0VtE//6S48Rx1De1y94AuB5tVTOkxeCL2yzBCGi?=
 =?us-ascii?Q?hIJyZMoo2Z+zMMZg5+EDIun0P2NGRBjiPcVKWQMSHo+2x9YiDeEGtnkRLLzb?=
 =?us-ascii?Q?t04FT3hIpGZYMDNt7ymz5p1IA9clXoL2tG8swjpMaRdQ5/2vgS4bC8XZVFwD?=
 =?us-ascii?Q?r46Exf5rhnkF3mh7dgHWwc798uDS3cDXf1biXs3ueRDH0yj2NcUecjVzseiJ?=
 =?us-ascii?Q?gfjOBAS0k9fHIKMy7sSCubvkb+W8a81xRDkg+NzEUCQMRQYVg/7oNKRX0svQ?=
 =?us-ascii?Q?ac6pkE2TNZrIrP4gIUu7VWgsG2A68NwyMuMXxai9xfVF+yVR7KTr8IRLYgI5?=
 =?us-ascii?Q?bOB/ZRzViEibLwIp3Yt9NIplPODtB8DchXB5yAnPh0g4coQ3iu+tVTp9em7i?=
 =?us-ascii?Q?df4dHSUhjoTHHauI4CB6ULnmKX4Oy0CXi+R869xUSynh4vyhJ+h+XflOBgOP?=
 =?us-ascii?Q?2YRJCAjON2rv4j+nH9N3HtswfSucuWNDd8xzuHBYpBT3vRnm2zW86oKKNPyr?=
 =?us-ascii?Q?tynJtPsID4dO2X0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wSiMFGBgYZkc/cIskRPMieYKmfrka3RIdeIqB9+sbOdcyA3sYHpIdjQmbk/A?=
 =?us-ascii?Q?DWjc5L3CN9W/D1U6377mjirx1TpUTgpOzJtSq1OnVwKlLL4E8LeJfM1lt56l?=
 =?us-ascii?Q?XyzoQ/YDoDcYUpGt+V/vOhz5YtuDXbOY0jUyr2bNR2/gVjcXX9DkLFwjbGoT?=
 =?us-ascii?Q?Z/5xRov4kt7l2wRQeW9xK0oJqWNUSHcLc1nRFoB6m2ipsWAmvNL6SA8lnRaS?=
 =?us-ascii?Q?MWsoFj3vnW2fb03+SQPRtoe6OGZM5ffhAncueafcXv5/UOhYMj2gJ87Tajbm?=
 =?us-ascii?Q?s2r5OpQxQ1T847ybFAvdh+PpTuO7OBCu+mi5ryr0rrXvCZcLPr0GG1UllD6H?=
 =?us-ascii?Q?xAc89G4CmP+JAuBk8B9rD6S6qmP2EpbG84SZQ4HxcWA9RPPtdGdUkqgtBCoC?=
 =?us-ascii?Q?89winT4wgDaG3pQ11bcGk7as+ysYuZJkEKFVSjWN6Ed1/3W8jrNVd8rey196?=
 =?us-ascii?Q?EJ9a0A9E4wFgqnNQ1X6oCijTnmXIJFJA++hGl9II7ZReMXUDFq/SSB2QP1+w?=
 =?us-ascii?Q?eQ22mcHroeOEB0jG6pqYBUfvLsVcZlgjOPQwBsh5sDxHreAmWddK14ettNC0?=
 =?us-ascii?Q?YsActTE0WPMoVPO2Mnv8Q8pPIpvSJYpZXVGutEh7k9p3josHuXnu4WDuIWHw?=
 =?us-ascii?Q?TXGjm4gSXCf/va1EwAfjVQLHsr1B0IQw5p5C+/eaMPdT0JuSLFk6MdD2Ke6J?=
 =?us-ascii?Q?cH8b+C9dMVBTu6q3c4x2lGlbetK0LQmnkuAuW9VPunRrxwjs5NI/jJMzrLX2?=
 =?us-ascii?Q?wg3b3Wu2B4WlbtYv70u1pksAVc0aXWA7tZT8AP/G5grHtMd6ipu4/O1XV8Nd?=
 =?us-ascii?Q?k4GCgQKnRmKmHThztIRK1kGxmNMsLq41kX9Nzu1V4EJWvrEyHKjgiANGx7Hu?=
 =?us-ascii?Q?pdMUqM6srCCMW+j3lw0cR7st/MO/P1Ys3yO3VKguGgWnHXKxguwnSyPTv/4g?=
 =?us-ascii?Q?KNO4UxNjpb6DGKP8I9cNKXnV/ONz9MPQhwfWNSeP2nZfbIX4vjMPll/sRrJ/?=
 =?us-ascii?Q?unzkIjRAhX7L1w8c92MZyqoezQ6OWIpQhjXkbNfPCIMCg1oJlqzBpjumi0Ra?=
 =?us-ascii?Q?M2uqL6OX8QMtSKcKLqVLlZ4CPoSYsx7f8DwS7OTAs5yjMoMD9hBE6k7gj13B?=
 =?us-ascii?Q?kvlplw/wqvAfQu/Q6EVWalbI3A7a2X0RSJtmlfhzMRFtCiU2fxLF4h15mNIq?=
 =?us-ascii?Q?RWVdlwUzA8LgCrnyoOS50Yv/gj/wxuqDAh9qrey10Wu+ciZ4mJoxMWtiAogk?=
 =?us-ascii?Q?h6H/iztLhSMWFQMQnzebGWe3S7BvAZk2s3IW1GXkPFUhI2hQ3y1/GVih2vYZ?=
 =?us-ascii?Q?7+In2FlsDv5SQtkhI6xJ1Zcm9TncakeJku/6VJtlYXZgXJaHJ8RXfjzgYOmr?=
 =?us-ascii?Q?rY6r1eVldj8gN0umJuKXz8legzpQJ+6NMHQqBfRoJYko9XkK2es1lvs/m8gZ?=
 =?us-ascii?Q?ZOxnfRJkYIHy9KJG5pMB29HkZikBHOYLsx4TvqCNpwmhRKdKcg7zeDM9l/+U?=
 =?us-ascii?Q?5r5Oss8WxxBAPRLV6blR14tFhsc6WwTyOSGWniNA+X1mvW2mMB4hVjmqALBJ?=
 =?us-ascii?Q?6aqOEclOJg4qLQAQ3pMmF2FkxX1qCg0w+xt7n3c8mTnJ+ZQT/7CXXj862qrr?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f40699-eda4-4c7a-0a63-08ddf046fbbb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 08:49:42.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sqRo1BMcSsyxenEWom26F7irgoSXrlcvVFvLFAo8e/vmEqt5T883hJppi+NG/xQuAKJdtIuelBJ1Qed3FXiW0S5vPpGcPG5wqCINZhEIBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
X-Proofpoint-ORIG-GUID: Efd4xhNv7IABYpvLFV9D9R26gYOWTQyh
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=68c13ba8 cx=c_pps
 a=5P7WR5vxXgfsLcbju12wBA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=G8RaOm78J5cyyXkNedkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Efd4xhNv7IABYpvLFV9D9R26gYOWTQyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA3OSBTYWx0ZWRfXzVYvVvSN42hG
 cDTme26IGCHiLb4+aJpxgO3nDLpbhroFHkWMsFG7nM87g13Z1Eu9snjz5PuS/aTxgAWql/FzxVF
 agQ2D43d8+2ejTSJpc998BBYXwEb7Vg/F9LcsxiiSEZ/gjWsFOiDDV/FlXAsmOAiDVWzfQVFbYV
 bAZq+2TkeZW57e9/IWu76IFB48aIFsaSWBTUmT0YPJ7w4YOhJ5+gPHWyF/Jo7h3Ffg1iNCNuIYE
 X+A2ZavTlXxIZpVWrwj6GBoRnhJ86vRz0jqzRGedZavbRvp38/uNoAafRBlGUMctpFaoDDOnykW
 d4zG/o9VZ0C6cvkSZGUS5o8I8K/3XV2Fm6IlrAesY8HwlrHsCmsjtN1sUSXIQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 08:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223150

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

When Bash runs with 'set -u' (nounset), accessing an unset variable
directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
is never triggered and the script aborts.

The current code assumes these variables may be unset or empty, but does
not guard against 'set -u'. This breaks builds in stricter shell
environments or when users explicitly enable 'set -u'.

Fix this by using parameter expansion with a default value, e.g.
"${SSL_CERT_FILE:-}", so that unset variables are treated as empty
strings. This preserves the intended logic (respect host env first, then
CAFILE/CAPATH, then buildtools defaults) and makes the script robust
under 'set -u'.

Note: environment.d-curl.sh, environment.d-python3-requests.sh,
and environment.d-git.sh have the same issue and should be fixed
similarly.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v3:
Using 'set -eu' changes global shell behavior, so any later sourced
scripts also run in strict mode. This causes failures when they access
unset variables without guards. Remove 'set -eu' to avoid propagating
strict mode to other environment.d scripts.

 .../openssl/files/environment.d-openssl.sh                | 8 ++++----
 meta/recipes-devtools/git/git/environment.d-git.sh        | 8 ++++----
 .../python3-requests/environment.d-python3-requests.sh    | 4 ++--
 meta/recipes-support/curl/curl/environment.d-curl.sh      | 8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index c635be8acab3..d989a2279183 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -4,16 +4,16 @@ export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$SSL_CERT_FILE" ]; then
-   if [ -n "$CAFILE" ];then
+if [ -z "${SSL_CERT_FILE:-}" ]; then
+   if [ -n "${CAFILE:-}" ];then
        export SSL_CERT_FILE="$CAFILE"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
    fi
 fi
 
-if [ -z "$SSL_CERT_DIR" ]; then
-   if [ -n "$CAPATH" ];then
+if [ -z "${SSL_CERT_DIR:-}" ]; then
+   if [ -n "${CAPATH:-}" ];then
        export SSL_CERT_DIR="$CAPATH"
    elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
        export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 9c7b5a92512a..fdfa721c3b2e 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,15 +1,15 @@
 # Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$GIT_SSL_CAINFO" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${GIT_SSL_CAINFO:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export GIT_SSL_CAINFO="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$GIT_SSL_CAPATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${GIT_SSL_CAPATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export GIT_SSL_CAPATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index 492177a9c377..400972814b6e 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,7 +1,7 @@
 # Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$REQUESTS_CA_BUNDLE" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${REQUESTS_CA_BUNDLE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export REQUESTS_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 7c2971b3dad1..581108ef35d8 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,15 +1,15 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export CURL_CA_PATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
-- 
2.34.1


