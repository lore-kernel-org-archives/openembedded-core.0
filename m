Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EB3C5DF81
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11827.1787618778366369282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DvYVAWch;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONKnvm220295
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2VmIH08WPmFh9RqJ7GxQqVf6zQjX4kwBgtVH+Gtn370=; b=
	DvYVAWchhbENDtd2cmv+ah7dy/qaBPPrAbT31eNQdq9G32uaEnYyARvizQGZhhVU
	n092U/ug61MmAXaPO1iQtLhN8t7aFKVx+Nk8Y9Js2coaeexsVTP2S73V0N8lDRkB
	sc50SMlpQBMHyXGeZo/xKlMRDsdV42qlXScAOKcTHzfEmINcIpURlmYrSAlDUlJw
	MYD+MYPFDdH+1wh2sn5iJmCMdVtroOY+Lk5jH/5tMEiTgVEkAPKa093jVaAxJexo
	a5B98zAmRfMBJD7zfq5VeW0S6PKT0prS1PBDwSoUegM40J17qY3fgMmDLEda6jxy
	bBCzPScXRKkWSGr/UdmCnQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020121.outbound.protection.outlook.com [52.101.46.121])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100kr7y-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4OomxX9xScfgv7kXBZo0ZV6ehEZnw3m+6V2CKLgVL35X700g5QuBHwHSm6zkVc7rRnrfXkxKGCZiAQds53D7YleGQsuUu0MjdhAjuUZvG5nqCb3LQme5SMNmipWq518LshsghhsHf9mJ3/mZ4ojUp48/dGqd/JSGMVSZJLIrjS1uyUJgjPCri2uvbJ7XECiuI/IggmeMKL6yoKaHiVJhl1pYFoZ1WkOHeaO6XHjhZEcw2XCKp44DmFObbIdEu575Q1bVjGJUPiKm83a4UYsmLJ/HdwFa4PuZS2C0PJcI2eTcowIlYX8Nfh/AnEUq8osJyoKkIOXGeG7TzZG0TadyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VmIH08WPmFh9RqJ7GxQqVf6zQjX4kwBgtVH+Gtn370=;
 b=dKFiKaxILTRr1eZTkV2d3/83RRwHzf8u9gWhiZEVyM534F8ye+RGbUEXmre7mE/DllB+aVDMGAxCD8dl2XHAE9t5IITyZicWNRMUOxI1yqLT2woLtziERGY/JKo+ERnevNWu2w7dcfpq6kDfUqqOUJZn7Qg0V7T10KpKmXTiCnZA0JNhSy7b5UFyAxbuub08CpwKZm6HHrVXABQ8WID2KIk7M7Vq+s2OnYyULjUhhYjHAJ4JKn6YQ5ilaURKecSX587/3BbMrzMJORwJ925DID4QMGu137ACf95Gd7tU/TZYJKmvjiBcPqip1z/hIF1WnBk01X7ovglWY7F+hC+vrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:12 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:12 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 04/14] lib/oe/package.py: Don't redirect stderr
Date: Mon, 24 Aug 2026 17:45:41 -0700
Message-ID: <20260825004555.4111831-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c0b641-1ad9-4959-316d-08df024242c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	BfEcb83qc47tb+ib5Y0rP5Qg2GdkRHLVh/KqEnf720yIPmRxpezOAlMalM3/vI1Ub7bx/5bMt1kKnarAvtfEqTdGefxVoRoor9Q2yZ+VJ+Awa0NuZv03ksBRTqhyr28FotVelvFrArjGZNjdUypYB5BKp5Rxoj66v4dwB0NRbN/EDqLDzgKe4IDvwrHC4YouVsPF4WdRh9XHg+N88+Y63zdGRz3ZEyy2538MiaI6lKSEW53eNPNtT9jGPmQtQFICaHW2FUh8coMxzRU1bj78Na3SVpaIuDTkVIVFDKz6L+phMdrL8T+XwTQIQTf8RIOYc0I2ngcWa/pKpeoM4Ix06OLtC51qzSVS4VUsJIl9PZiOSsxm+wEchp/CVwZ+L5D3HYfEuKnwdXyvo071fIxWFo+qAPQAIycM5uaC381QLOEvt3oZ4ViReiILK9AVxJ0hmhGw03RGFvUwLARpHlypR2lOhnspDHMJW6Hj87VorygBD0TBzkDOE8fryibqK0dU3n/VG5eVDRer+uQv3R/RxNoGcM4EShOh1R6AHdxelab1cVzftZRGrhv1NopgTEE/f5BrrsJno0tP5jrmrP5xA85sGOiLH7K0GqH3YQjU1O6gMmfJpECuga4V3iiUFHv6j40txNs2rJB43oGl+o1ablF014DmZLQ/AJwk4lTeC0WPg3fMhIpytD31gnxCUzptJbhbfM4P+d0AgszO7FVuLLYCW18A0AQdV1scP1vhMkw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CmMs+m7yVx1xhn1x6l7Mep7R0bAizRk4z5pjN2VzwiWCPyAPxihJOrHoxFT1?=
 =?us-ascii?Q?dZeYED/xt1FT2icFYepANJZDMLFxypiNGT3XlwZrM+S6tnfqSxA3hjtXftqd?=
 =?us-ascii?Q?G4UyoDae5kpwhaY+avf2CGdOTYrj+EsABnJWp/UR1FUQ2GYRVnZhuURYgPMh?=
 =?us-ascii?Q?kdy8C5lNQbHFu+ncg+9SNIKnf1YWr0/50oXjg9TYeueaq8OcwaM7skBBysza?=
 =?us-ascii?Q?GPGLVbcjSF1cKORv+gQK/N/Lktngkf8oQT140sn9Ccdi6DzOQbMT8s23Rsmf?=
 =?us-ascii?Q?ISgvZvKiCgHSN9/Lnoidb2BHFqNl546rwG7VYJ49tDT1PC6HIu7SEs1bM630?=
 =?us-ascii?Q?+ytNliis1CQm6t8lvru0VHQmIt3lggh9L8Y3SijES+MEzATHxcUqjMAfvqtS?=
 =?us-ascii?Q?2WzvQz1yqrE1Qmzrp3bxDrt7zqVC1Wqe4bT6tH3e/3ap+MOpbZnW4nzPmXUS?=
 =?us-ascii?Q?UnY3w3dnp+xAGqwshuWPGoYxTP4rWCXkXKKPF1XdV3xFBGIrS3ibQHSjvPes?=
 =?us-ascii?Q?ws1E/gToAjSYp95rtNNWnIfNWBRwu5CtlxK0M13m8ErCwummocSUj2Q6mD8c?=
 =?us-ascii?Q?Hd6iY4AHG0sVJWiap7qczcndaia0XHi56A8Qvs+E5ENRRYOZ7jBEgj+FA1vw?=
 =?us-ascii?Q?LuDyDB/y0oX5Jo8da2GPHKdkveAJA9iznPGMV8KsCIzLe6CpBRjREn3T5hfN?=
 =?us-ascii?Q?oMW5S5xOEYJTmOAfZxsAMy8m62DgSnoROGIeSCbnJ/VWLc66c4x8HGxEcwBn?=
 =?us-ascii?Q?8NFR3GQpUgisoYZLdcGSvrGdpapryOQhOIvW9TakUgtO/gSldeNA1v5g8nmL?=
 =?us-ascii?Q?1bCZnxjlZUSoZ1kqrURK2YrsTAjYd576CkYIZHqKSNgxsVhT6yfmqQdrZ1CT?=
 =?us-ascii?Q?kVDoaLM2Cy6KpgV7H+zStHNEgl1dRqwpCOqhSUGhD6GcWzEgOfcaVF7hXod0?=
 =?us-ascii?Q?hne4On0YR5Y3VSLtIeWCTn2vG1EmSbe9ZGv7aCXzCzZC3FH+8qHVKBCx6v3p?=
 =?us-ascii?Q?vFfh/+uXvcdI5O7OMHHS99W5FBZJMvubbhZJzADWnkqALL9hJwr72pI/eEio?=
 =?us-ascii?Q?kU1/HyQtVXZ5iugIue71oTd37nM/SXo+oqyy9Y/M0q3Whce16hobzwKmQ+A4?=
 =?us-ascii?Q?QHnTQWap9DONpqL5iGHUlVRau2m7ghyZoNzabl0Z9BM78CAHhBOkcUexQec5?=
 =?us-ascii?Q?uj0PmSRoe6Sg80TrX/WUo1y1P8mHeH4J4PKOappsO8vyh+1Yr1C/nWct/j9N?=
 =?us-ascii?Q?JJFgLXSPUNX7CQ1Q4UQZiJSS41uT8xTBbAfUQh27u1G4nA65qY3VxXgVVwFt?=
 =?us-ascii?Q?SD/tcaut0ujYGxl2i9viKO4AY1gKyeu0zdz5udvCauEhUfsvVG1ok42qC+wE?=
 =?us-ascii?Q?0HVCQoY9uOcmY0sfT3V5fsFvxw/mvr7FuJTNOA245Hc4INY4oAEuHy45ns2n?=
 =?us-ascii?Q?fkc13HHpHCV58jMuqXsJVz0jwj047FwS/0zq/XlujDeWlob43rkROfCEy8Tl?=
 =?us-ascii?Q?WRHdFjOVMNmUiQNBjMylETKdbSvfQGi3sA26OyIzce+bNcjl/w9SYOlYBySy?=
 =?us-ascii?Q?LgDrtSZc3LwA5P3fka6VPZqa7/j5drzanX1v00Kds8FgmX7slBdoC+ALhJPR?=
 =?us-ascii?Q?5sM2WZP1oazKz5XUXuoaU8n1p3MfboIYj/RNNIOF8NDoq0lJr7X/nR974NvU?=
 =?us-ascii?Q?o3cLD2v9B9l8ok6zzXjU7s8u5qLsxiY1z28Vb0HTY6zw31ng6rK2RD9PESfI?=
 =?us-ascii?Q?pj+XDsuaYJG/UGXhJXzyA7KundeeIMk=3D?=
X-Exchange-RoutingPolicyChecked: 
	QmzgLvJfeTSJGvd6R1lmbXNXs0aeZcWqf/v7tUDB5Z/flBstcWpuLMUwAHBZmy0adwYc1KZpa3Pod0qlP5rcsvDOCm3Fo0qsyJ+f081zDrxrke3Nynewn2UGwu9ox5W49sN+UmTaowH2EBE/EW1iE27h4dkCTux63NOJCF9sYkTjYmievFVjLxCXMGGnN/mw5rI+DRdR12JqtsxPEv0Sn4EL5JL8zl9hOiDLAii6HQoMKE9eirs2oi+HzJszHSWxYVRkCqV/CdcfC02c3rz9Ytorul/P8FbPvt6jDRsE3Xb05rMLrHtH8g/2fvrJRldU8e9BF4iN+YiNG5yW1gbBkQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c0b641-1ad9-4959-316d-08df024242c8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:12.3323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YNpSpzmfHd/3ic5WQYSoWYsNy+5MFVFlvUepUOhFIScXeprkhlnUGjDakMx+r7NM9T60NZrtaXtiU027NBW2QBpagWdLG33zOiTQah4x3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: aQN6cFDKAcJg92AOsYVMvfQuD-0XJZoZ
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8ce5d9 cx=c_pps
 a=pjPKNKgC2VgaEdt9hcwoBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3HCCPcRv9Wt3SQYHOTlF5dFAiGxqRAaa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX+kTa3JOwPjpE
 DsdzBgo5QD4PqBb5qnAX2OztCPxDltOQqHOkyQz/YbNTm+ilRFnJaCeM4z8eBLN18GAGaXye8WB
 IvE/PZ4vkzV2wOzzx5ndpTn4cHqvm9yjLtAswUkATWhEVx3tEuxk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX/mOVTLCEeIbh
 1pnBl1X6CpaU3ALkPt8uEg7R58p+p6XjU5QwigYG+WpDKMMl3d52c5Goy1z1rzcnwKzxByy8Y4V
 tbZjOg5+GbAdpwlqB/wtAlwlBVauvVBRM1n2A6xCoOhM/GMQHrlk77UA1Ff0vqDnycZ5cRSRE0W
 c9illMQobpSkSqY/7/3m+E48vaKYVCQfpfJ1yucUJgA0Gwy2/gTlykBDgEBinOkSj36ypB3G8FM
 D6Q3vr5Fe7MMdMKc1WcKrZPFHYzja3VbTAyJlsK+kgPDipW4MiIIL+7HVjYL/NCJlKKjSf2NGQ0
 vUs8/0TSSTTDWhEexREOuScqfGrlY6wEoJiL4EuxCQ/9dgWP7cZcIBTJadQxHUriaRnk6YynOs9
 +AN8CYh8/cqom6iRrraF+3NouPvpuPpqaapMSpX9DZEqwVLURhSCaxJwVSO6NXYt5APE569XGe+
 tXfsJ8FvzK2Eb4n1+AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244161

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 2e348e0a10..ddf5956393 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -277,7 +277,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

