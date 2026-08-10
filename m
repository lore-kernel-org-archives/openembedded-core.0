Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1E3C5AE5D
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23018.1786337589871703473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gjnyEAAO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4YSWu775995
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=; b=
	gjnyEAAOld7LqRl1yGdPs3oqZVHVRDZkqdMO90dyVrlGDvD8sk0F/qmJ2I7DfksK
	YTIXi1laxPELOe9c5J2WyiiM0oGQYooau4ybmBtaRVOfxT7GDLr6buxNANBXR0SP
	B4zjNkS5S6ii5DMb1q90lh+cocZK+lEPhB0f83slK5IRnSl0GTSlEbkCKjsIgY2y
	5fCfA+WfW1HTPFEMDJUVZecC5kdKtyFZFTbd2QVAuZsTu/nvbaf3N+1ZJ3vc7l28
	LmChWLB+J8qm1AlB9foQdzbill+8GpuLOtRhtb0tXvN/SffDXccXyizrIt/yWrvj
	qqP08Z8Ys/2o2szvL39Jwg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue81s4u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 04:53:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaiYO12KP6LRLXNQc4z7H0f3QF/jWxb39vafyxAccGTPBhExBwWsaIlc2S08HU4MmvjlFf7RoJMCcRMr197tqj7ELOdLPrlrLyLBWO2k9YES7Z0v27qqGN8rAI5BnZd9QrPiioDJsbkqCp4MwflCKH0vhoY/uhsOmHyCIh7ZAwehJmGVBKE2JMY7BjFrq0OKgowfpwsNJqPk0edAUNGc3TqYEMJYgtmij5PFX/AYDBfakQ8GtdjCiJSgFrn6aSl7gTgqwu90goA+gurQF8cY9Eu1XU0zdGRN1kMNTnfAqeHfW2TUNosiDiYbHkPtTbzKzu7Yp8K4wuE3q61bxhReEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=;
 b=f3uqohp0dXLYWwQR2cj3xNsUhicpuOy4v80pFFZDwVjP+f5DPzqNd/dxsS/N/Y9NlQ82HKb/oMwDy36nmL+gc2mqsf5yFH/iQ/qGpIoMtfTd5nKNgJUC6e3DUI/FwKoQa7Fs2TrvQahFt2c9GD+X9Jrqz8igBVSyd0GWZCi9nXqxZaulb5ESclidfD6/JxT5m/E1F43nrcoDq7QkNj6JCATwK6NDCj+90+R2MDh4bFlq3VC0mhGOeH5KLHUhxssxeguxjzBciDOSqPzEP5hOrK1M9x3sr5fhb1itwvlG3OLjsDUrswHFtIMVGJmUZyHFiMwyeb4YQ9hz1VOIeninKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:06 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:06 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 04/10] lib/oe/package.py: Don't redirect stderr
Date: Sun,  9 Aug 2026 21:52:44 -0700
Message-ID: <20260810045250.3903576-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ec2384-9e8f-4fd2-106b-08def69b446c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|38350700014|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	8c1ppYGFaF27Cdy4YdncbqrWoYYWeDN911hEeABJWL6V8D8RFqeyCfNWyKuLOojmCqOpZ0czNvnlrvcy/zrN4xr1XFa6Kpd2d4xV85n+OzbuUv4Ys+KNfKU+pUS+66JbDofAaHoJvx/zSCycZnFF1cjv2PEpvRvYfiIEZ1xFSabQq/dAooguJJhcS2L3vl7NEVk1VqL39kArZdFnR8HrV5c2eJQDyoPjQg1vcCwWbZccQ5LuNtDV26T89xEPgp21kf+80xguAPvry6oaF2Lq+i+XOBozu56g4QLVGR3KcxpUfz34ZZocNdOQxLrwtQ7HKh5kq1A77MT8yGLyj4f5oInsd2NMOh3nE65rAaTqTsk55iNESp4idznyGYcLyc04N5pDM5faMJSCuCmZ/+GlWQRKgXmslPbS67bCHUDEQqyQ7KyDHo0yFJPO7XJxq2/Lx+Xu1PDvXBdAuFpJnsPrsf8q2J6GtZH7oosgjNSXgTAzgbYJYd2w2Sj8oXhQG5PHRf6dMGhaiorNXNa1/NKbLSTRgVk1AkLZppLigC3mLTjOU5c/PvDlEHVcwyMrD/fAjXtXAixDoHCW4ylfOW14lJY2WNJWubHabVFkovRxHiqpr2k0CoBZ6959u83orlsA+6KQ68zzdEhqEWiEQ4ISh4cCUri6+tW7dhuKsxkhLVczvY5v1AwieqJnwv2dO+IvaSNIgfQWcuhgRkj6E92UQCngkNmY1GaKlnpP4PU4mmc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(38350700014)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WWmNyPN5usAixYLX3tGNjMHvpVeqB4geFTBOsbGW2P7EGH4lxf6IuzeD8vZT?=
 =?us-ascii?Q?uajBXRpr5DZw7B3hq74aKK9u5taKBv7izql1iP8YadISxapI1pHbuUycmodS?=
 =?us-ascii?Q?Y7TX94x+7Omej+0aNVodZEsFhx8DZjwJQT/BVRhdGv+RtIalY5kvpXi3rbsy?=
 =?us-ascii?Q?mX3lmPgoAd7mn8jXbjKrnI9Odo9vXmJ8hioDUZQyMHk6+zDjn98MwqiyAgQr?=
 =?us-ascii?Q?QLJ5nXPRRSQHnYP/v/PnMNHJmWrYCAy2YastGMvmqmP0lKhRidZL9Chzlmva?=
 =?us-ascii?Q?GNDTYZS6k5qCGZA9QIBpVcGseQ+5UA8/mW2Xr1BQxJWDGpk8NzDM53J88kY4?=
 =?us-ascii?Q?+DPYuJNWFvCS15VQt1x/yeQvljAUwmuRTP0kKS8smYBLqzvscGkaAjqCfa7g?=
 =?us-ascii?Q?nxp0cRKOOk25sd/9y613oeoyEAoS2GtECg80wJ1bL3MNc+4jMiseQfbMhR1w?=
 =?us-ascii?Q?AaKbHb/FcVZ160E8c2lpoCxTgdlHm5YhCGjrxkeuhQFr9ILVtt8T/3HKGe2k?=
 =?us-ascii?Q?pTVul87gmBC87owwnR7SAi8I4ysew0rVcGx/ITePB1+RhAUZgYkyNW0AQWID?=
 =?us-ascii?Q?Qfw47cr5O959DuL0FlFKRUaXOub9dwwKiyTar0kRK5lmGenVJHErcUeuIQXB?=
 =?us-ascii?Q?8+nIFmWGnaFsyzwrDzV11P+5MN5Rrnr/0ZShnqIFrQBIUTFMTk9MfYHsjccR?=
 =?us-ascii?Q?jjW1hOIdLA3QWH+metbOvuAaxteDVQoO8EBTSZQSefhDk+7tkH0vVQcBtXgZ?=
 =?us-ascii?Q?SnXblJUg7ew4jUpqViyCy/xaTaqNAgm4PJWWmNTR2VhjQjB4Tkh5YS1sKKy3?=
 =?us-ascii?Q?Ur8wCEwu2WinYVpLj0Y2vaPFzugBB1wsSzjlqVEhT86pjmLgOZOtCKQTGjHY?=
 =?us-ascii?Q?7LgiU+Isf6x8p9HEFLHHUNJ43Ya2dI/H6AMQkuqTrSAp8tnLIexy3uJ5Sl4k?=
 =?us-ascii?Q?E0t4zWul5bV/XHH0fa4DVZtVLvJEiIolE64+A9SOmr79OCLwmLavMqNDx9yW?=
 =?us-ascii?Q?4UeykVPmxMoF8YEXOmq6WOIcbzZSh05gj5tLpc7iCEOGJPg4LWXMZaqI6Vqj?=
 =?us-ascii?Q?SJ+jDgFbWkgnh1/6lvwVzHbeyV9JKxk9RIFGu5Eq6rLz7agStiQLNgjLCyxN?=
 =?us-ascii?Q?LqmhKzsiyCPgDJw6yYqvP/3C5trDL8AyH1/2JtC3VfbOvWsdVE7xbj7ndmgB?=
 =?us-ascii?Q?VZfJ9e92bqjRJQLMWb1qvNRzv6++rK3a05/tzZhLdicuMfktUSBgNEiq2rBZ?=
 =?us-ascii?Q?3/4kMFpA1FXjzOYM8qqebXnXKwbHb2kLDyNNQGGi5toUA5pHfRqXHU7dIrXC?=
 =?us-ascii?Q?Um9k0UwgTQcH6VDeaSU/ma9cyKZXlNmjNmBfPoPg3ETQ5Tk9GKRaLilQDRtX?=
 =?us-ascii?Q?Ptji46ANAJ1vbETbmwVtEtHkn7wjW/tlDr86hW+LMRK0do4ABgMAIyil8iNf?=
 =?us-ascii?Q?sgo+vY4IbgHEXIA/2qPkX6JGfzTSBon6h82fULzA5doVh4bfG/WDRutfdSVg?=
 =?us-ascii?Q?WjJ0vFsIgAeHJ1O+K8ANPIdlerZVRL3zHYvxr04xgQoeeogLHOGjMwjUxTq8?=
 =?us-ascii?Q?dL4k/rgLmhMUk8uwoVEiGSnjuvKrIVfjLrjnFO/9J8D7gOLR5Qcfha74xJHk?=
 =?us-ascii?Q?SmhUwEL61CzpD9YDCuyddjQgIOBOa7WXxi02QjHmUPpS1zWKuooOS6EGCykH?=
 =?us-ascii?Q?zzM9IHLgWw/AFiEjYPojO0Wm4wqyKs7mDgEbq0a5+ZTwXeSytzGrPKFGIq3Q?=
 =?us-ascii?Q?K7bcbVWjOrJV97hPgoGzYK2oOK6JGT4=3D?=
X-Exchange-RoutingPolicyChecked: 
	GNB4/UtvaZmHjc2sUhrNa1I3aXHmPwP2XN84svAkvH+omAD572ReV2soJMDewGX7lUjyZxzwetAfJrZ7fv6zC6N4bQ/o/f6y4B9sUolpKdeANo8iwM1xEjTwfoCsGT3SaBbRyDNB+Qmyy4GsJJfXBNM04MLKMBMXQLejia7soSPzW8/ZWQ0nQdZ4hnR7qNwEk+atBXQsDUaxyrdouhV6GQ+0XBZ0c9oMNblvsgZ6fmDdB5CwnajZ7SMHedhFLKb0tX/dL3GZ0o5wWSB5V3Q431Q3jLfhE1BTBLIpkWEXEaq/h44MlE+K53aMs/5zOi8eGMTExeEmyr1nf97+LS1T0Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ec2384-9e8f-4fd2-106b-08def69b446c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:06.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8aTsqm5sb56PNUG2D0o1CWbLF688SKOKz4LishZ/HVhIrpxWxlg8Qt1W9GOV3Ilu2Ea7wWdGQ7t52Lr+0ITzKSCjClTgiLKaPlN9O24458=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a795934 cx=c_pps
 a=n6quz47VtcdWtWxmUgX64A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX1qFrdA21U/nU
 8YDLKWxVh3e83aBOrJChRSOWf3h+xdy/ZuSC90GPF39weEzUiyOHo8NECylscbfHPT0ZKw+dPoN
 xSLzmqbUqYt7YxxjoECPYVAlrktolm3cSs5rSdAgaZvYyBOfsT7s
X-Proofpoint-GUID: 3-rYNtjUPNLTootKbUyW35aCX9YT0zZk
X-Proofpoint-ORIG-GUID: MhNX9uGk0o5ZDhHc2_mDhO6LcaNZSp1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX2mflkdl1v0Tu
 8KCDw/Pjt/Tc554Zjpbi4ca54wyvpUiCLBkH8z5D7u5qamtIu+4kg9Llf5jacsjEglceHPZAHkd
 a3FwYjRfY1f2IE2dFg+8D0YKxXWV3y8owvlwtSwcwq/cbx64mc9te3kKryqhlXdgT+411H5hfLg
 g3is08waJvnq8zlGJ1ZeNzmmBNoZ9pxAL6MUOoZROXXT3GznvZtqellgNWXe2HgYRjpfFzCZfhb
 LNOC5WBag8j2AQUpZlis+KTf4HP4vPjbXw6AMmN16diG+t6o0hC6I94AjlGY1xKFYAUWxBrMTRB
 weMvulBrE+JRBhJLiWcD/Amn0UxLTbAg+vhUjJqwCUU0rpTd9Dh1E9y1gHEb4Cey6+mNhK++dsn
 o8mv3rpwaid3OPY0/UJznETb+umJgUJmqn0rnJGqllNH1F8BAi2wF9ET1psMW4OBgGw/Bs9AZXc
 TcgFpqr2Zlh5+kYqMZA==
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243097

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ccd89a190..d8862ae92d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -277,7 +277,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

