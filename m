Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAEAF44847
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:10:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154594.1775823012371281724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 05:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eZ2V+5SM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560786bef=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ACA86i1173545
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=b0fVZlhLe
	SlAmERWOEfJp8SAP3+cwu8CBz6Mi25Hiec=; b=eZ2V+5SM6nG6qJZ1WjejfXPH/
	3cTgbMnB8FBY8t7c4Cv1gXp4Hk80uWYicGq8qvwPVnGoq3ZDIHwMvQGs5Gc0HmmP
	DqAOpDEWipC7bk7c5R+t6lYxRvHRtQKikh0DgsSLU2r89eemRdYLUIaZtwXGJIix
	zdlX0oZzu2B/dI63I4BwRnH6UU2g2s+Hq9heWTJaA1LbpECjvQInmMD+T4AInb2C
	A0k4Z9TmZpx/nr0Qe7N9NfFGEdpq73E/TC0ZYnjHr23UzZS9HnWLeR39o6qsjIcJ
	hWLmT8gcaLQhkt/5CMs9Fv/n80pY35FE44bp5Kxz5JaQrWojiibzcHSCXaTNQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrydfpm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:10:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqN8E3xyh9H7Tsq+yRpTBNkAG8mxXxlm52rjt7ZY7a4DP6h2gT/XkM/w385gkkTujeXmKhRi5W77TrBfpGEic5hipCgWbncU0jML2kSN8Uvke1JGCEYy+DF+HS8sFgv+zyGA8ajTKd0w+sIDMu5yBGi5pEsJoSXn4/fEvefGN9wnlxmjItuq1OrmT8sf5/YnRnyLM5gfd5kWn5rImv/UdEDqJssFTGBzatkVikWrteiG0PfGQIMj4wwJ1cxGUjC4suyAo6e/5PxpaEJ7/+xCXn0OLEDNhIjz0FTt1TgX1gadAkdhNZnQbF4+RKGFHiMuu38FWoqig3K/VK4mnRsOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0fVZlhLeSlAmERWOEfJp8SAP3+cwu8CBz6Mi25Hiec=;
 b=K/nt/CD0TvzQk4OiWjDJ6UpCt4ehxSjIi+ccXwYlrLBpYEk0eJ1nVW1IW0P9IE5nvy5Kw3Ul3mlpw5RZOH6rXmWsRozi6m4nu5ND3hscDZafkpahfxxGTMU8esqYKG+/jfi3+jUz37g7jeGvdtbrGhjtNgF1GpxE454gbUpgJ5Ony6+wS2IwUxYULBhGDStnm7IUyW7SKjrqaE1EqH3+02HGpRmN0q4Kw6vaw42CoGPBrjkTyn62mU91UR9MpStEO2ffc8aBkazHtnKs2tsv93p0nj08eZP0UXcWqMy9VbYUyxDfSeI1f1hR+tHOfvvCcYpFKpyOf7OGnxfkJ/tQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.42; Fri, 10 Apr 2026 12:09:56 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 12:09:55 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [whinlatter][PATCH] glibc: stable 2.42 branch updates
Date: Fri, 10 Apr 2026 05:09:08 -0700
Message-ID: <20260410120908.2669458-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bee255-d215-4cc8-3685-08de96fa141e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FsTI1rO+KvkrBRlxiIwAkPJ/VRQoYN+cKYPBkn7nb5+VSsmGB0jeXW3nlj+Hw12IoAZMS+Wo9gsYcZxQfhXcGDBUVRHuU8ZpRDxFr1qFyENbt2z7SRAJepledCKjlzZK71kS9Yk2g/xygMSsdp81vURRv6zEbGQPtasY7q2NmMj9fp+80QimJazFRweWqxT/wm1XZdH5I9x9aXbJwN3XYbHlBrBZLzEvBkddoDZ478xAAzMDx/CqBPqVVsB5cMWApmPdVuMzN7dSTHxnma0U7iQG0CNovHRFwyTfnF9rEo8+vGylhJgTyg5YYidFh8BOtsDxlznXlcg03L7cHNDOLF1qYM6vNIqQBLQUb/u9mSJk7+EfAq62Ohg3WFqxwmvLcFCvNcrf16OBKme5EU4T7WmtXuKmWoxZZMyE++NKBWTosXwT/0HN8JB2w6RHeXw2rcuA65O5kmPnuCgcH8k2qYy2s3jD8zWlsLUIYFH21BLhqXPxmKJFlQ7kXoMpxbW18wvceIM4ANqneUXcwP8JHJKbAndwcPoqq6z64Hc9bXF6Ku09bDfDpplNNZbJx2q90Qv4EhZoMi64uxE+v1vJg4U+x5mWvRMPMe50k1oiQUPiHLZuEOpskriBTp9hST5kYotPFIfXbCnBE6lsdFluq56tN1o4FJ+c5trEE0YTT22kOrPG0lMdeEVRDhLMwxXRLPEAsWDRePZJml5DqS+1KaGzd+rB+LDTcpiYISO1hZDwpFTABA8eYIUJw4lFrFJvNyWZ/s04jxFqxGMDmd6sjshg6dUA59irGCq7Y6ekqF8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mA6wL2okHRcpdZSbbkuK0QP3L0RI2nJkqdCv/iWoTox+hj950zMiR5eHJK9z?=
 =?us-ascii?Q?Zc9gUwj1ABrmBEkP09JUiFJ4dyAiBYoAOMIHo7aGXmztW3ACrLXi7z0Ks2Ie?=
 =?us-ascii?Q?bVIZyndlc1mngjCvv0LA+pYZOJsV7/72YMXsXSxVTIhfRgb78uEOvSn1dt/H?=
 =?us-ascii?Q?qB8heyASO3XijMFu8JcvmNqjXTrWYVxxeuSdMMTVhiX6UHaA/C1LWHxJonhS?=
 =?us-ascii?Q?LL1bWcEJJ/UYlj1qw94MNvsUrtLLdBdR7UXmGJopbrenpOXl61ZorBCGaaUy?=
 =?us-ascii?Q?Ypfa8OhWfgspGUJiiiCq7Hxp9kzs4fH0QTnHPPnGUPIzKhS0RLFjEHbqhzdx?=
 =?us-ascii?Q?SO4Z0jrFxdjcQXOpXean0MdkB3LOeTQpHWGQjt+1pr7dzyG355Czv0yjaLaV?=
 =?us-ascii?Q?LoHh43WA4z9Dh7Yv5NmkMv3TYDj7m7Yl7nafko6xD0jrnoA61JOV7vLpeZsq?=
 =?us-ascii?Q?T2wqncBZx5+/l5v0qODqeP/EWRyni6IlXUr1BwfNSBDb0keMNbsyM1X/JtrR?=
 =?us-ascii?Q?AZjley+nk60RajrrdckDqnw6S6zKRIpjzI5/T0ATQ7XhCdhFC7kPVQbfNhyT?=
 =?us-ascii?Q?dBDBHQnEqlkDZVegN0Hpn75yg8rTch17mSSQoAj8Ui38yUtvENZFRrfu9Pu0?=
 =?us-ascii?Q?Zjjru/F/dZUkNUW2IpU9rm/BRctaV66edmzQucVkQLc9lWvUkdfnysUNek9s?=
 =?us-ascii?Q?5xGtaDYBFG7cxRfkgbG5TsA0yj45ZLvsMp1heJltC8WyZlg89T7tkm24NgFe?=
 =?us-ascii?Q?SBxDUILGEvM66vCjldhCgTOn+/PDxFvIA2lx/LC68/RwVmbqlEtMocQATK2e?=
 =?us-ascii?Q?S7+me/xFD4afSXK939K7bNB924bVIVkTnf7WeJO1mDQo2C7VNKwVYAnWmf5C?=
 =?us-ascii?Q?5zug/eSQvU1AMEN0oS6xVuEVW+bSrKKhGTqTNlQneNZr+Z7NkP2+K09bBizM?=
 =?us-ascii?Q?t1ZtO2QCh3W2ZRL6Wpza9mWpliWdPdrwnSF3A9EPtE8QDklqp5GzMjjLiaiL?=
 =?us-ascii?Q?AzlQfI8ceUORdh3y8iKvFpemyXZFsLReSWlwzl4jyIvb5cCgIbZ/oJSv7iK1?=
 =?us-ascii?Q?dqem3S5yorzQ74g3JgS75TRz5r4/oP1Pinv/34/LvIVpamQn7uV15jJvFbGk?=
 =?us-ascii?Q?A1XoweYDhqdi3SDmwCFDx8QAx8UYO1aKykIkQ7HE0Ht0mAS8SY77hKS8w3Vo?=
 =?us-ascii?Q?BvNUB5f2puAHX9T7qqHmTcInsof8N7xce6EicZJLZII8QlAjoCKKTIJfWgx4?=
 =?us-ascii?Q?aMnpsFmQOekLkULMl6k/wuRDmoEPffFkRQz85iMUizXflTVVQpFmQGkfiaZz?=
 =?us-ascii?Q?lPLCNB2r8ZJJkzzLDfo6roHeINHqrAQ9gJj+wVpj0WTt27MtJ6Dhjq/KvJvc?=
 =?us-ascii?Q?KJJwrvJMykvnTjhLGraLdUScye1BogiJtMzdXdal9a6S4ma2mfAHtRRtrOGu?=
 =?us-ascii?Q?XC4WwvV1n0zcwBzj2c/fU2TdxF8eZPfylMhHHPofy3UM/IYb8awUstFSl6GE?=
 =?us-ascii?Q?+eM05D5m1u7foBoGwVnsSnB7tLF9VDOupebhD/mQ34tuvq1JIzaQgdCwSOre?=
 =?us-ascii?Q?M7XwnWORJl2K+jwE/37IdckEcsI/ie7P8eqdQVfKxN/e/UBhxQI7K7JEsaeL?=
 =?us-ascii?Q?xC1oWfpTJFLzWITzQAojxBHAVHwegO0EytGGtHj3Z3u8lfqDl9mWdqLDd7rp?=
 =?us-ascii?Q?LeXgjUTAQWpHSRs5+QZ8vm0tbL7XJzGg+1/fJVCgtFCa8GDGrvmNUXLkYg4A?=
 =?us-ascii?Q?tW1FJPy0CWg/cQ+o6sXE6cTDU5S2b5Q=3D?=
X-Exchange-RoutingPolicyChecked: 
	S4mE8vu86Xx7yVSXLmLQ/y+3baL3RaLcjGkeohp4QfMwlATp8osU3laBgjK5YJceM4/K0UDVY1PvNOUXagbWy2Ym6Fhjf3x7ZxSVqdCLGaufrr8cN+Hzlsgi5D/JrnLGgil0XJkdTmaywCZAP3+WbzSICRtED436SRQ8iVqMmec+CMbJ41GXvjnwZWFPZbDyZ1uncaHyhi9EMDgD2rt05CPiftj0Xhgo9TvkrARimFCdDf73CvakiMiuJx88nGvnRn3Uw1PL8ZcKRkksz6zgREGiqo4moIR1oPf1kdSYkzjfmfIs/4X8PYk/CFW46H8o7aAKH0jDZJ4gGgu25PC2BA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bee255-d215-4cc8-3685-08de96fa141e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:09:55.8158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Wqxd8Mf31s8G5mWgG4L/Nn7LuGqlyNJcm7BiZOEdoj5Iv7pD4FSSTsSaZgn36xOdZUEYTyspNOYItnNkno1NeJ3cPH3r+pOWcTpxauj3Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d8e89f cx=c_pps
 a=Sm015RFco05wDkMfClhrzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=mabVfJhlQ-zpuTOyWjsA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: G_CvLMzNfFDO8jU5CqghpHxKR_tHD455
X-Proofpoint-ORIG-GUID: G_CvLMzNfFDO8jU5CqghpHxKR_tHD455
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDExMyBTYWx0ZWRfX++JFtWMtmm0V
 nCgpF/KtqKXvHYvRMme94k7ZJ+czVCLYuQRG0wESX3KpyUiFuI1BKkmDf757mQrNBoV4pNBvOon
 rbCaYQ+zDxqj1PoglUHhOyXlHPGYhr3atpisnZCSVX/9vY8KMaPpxgBkEkSmd43TZyORCEONYrr
 U2YACDozo8riNyROTfx/3gurDyCBvIJQSTLSHcozJ3Wkjy6SYvm6XDtMHbUei0Jnhm7stPXtQMS
 +uyfOVhkPTkRldb3rGj3cKBPNSFn9qhazdddbUZMLo8/4VlOj7FZE/DdsHIdkFCihtk/1+om+JI
 +6hSRg5GVwb5RvqLV1XMi3DFeD8hn6JyI0Bvgfz1MNbZc73UcGLqCv4eyaqQblExOkXJeecITmy
 3fgeSoI9gWA9oYixCG4NtXcH7C2TCugTHXs1OQHaP1hhqF/tMi7RBlLVlUrU5AOyydd+GC0b9W2
 YYF63wl13mPJ6CtAwmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:10:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235019

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 912d89a766847649a3857985a3b5e6065c51bfd4..a56a2943d2ce541102c630142c2eae0fbfc5886b

a56a2943d2 tests: fix tst-rseq with Linux 7.0
68099ccc94 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
426378547e resolv: Check hostname for validity (CVE-2026-4438)
8e863fb1c9 resolv: Count records correctly (CVE-2026-4437)
1a19d5a507 posix: Run tst-wordexp-reuse-mem test
9cd9c90544 iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
ebd45473f5 nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
937ef7aaf3 Linux: In getlogin_r, use utmp fallback only for specific errors
3989780591 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6934   | 6938   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 76     | 75     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 108    | 109    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+-------------+
| Testcase                                             | Before | After       |
+------------------------------------------------------+--------+-------------+
| elf/tst-glibc-hwcaps                                | FAIL   | PASS        |
| elf/tst-ldconfig-soname                             | FAIL   | PASS        |
| nptl/tst-thread-affinity-pthread2                   | PASS   | FAIL        |
| nss/tst-nss-malloc-failure-getlogin_r               | N/A    | UNSUPPORTED |
| posix/tst-wordexp-reuse-mem                         | N/A    | PASS        |
| resolv/tst-resolv-dns-section                       | N/A    | PASS        |
| resolv/tst-resolv-invalid-ptr                       | N/A    | PASS        |
+------------------------------------------------------+--------+-------------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.42.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 9991c02495..9f1003570d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
+SRCREV_glibc ?= "a56a2943d2ce541102c630142c2eae0fbfc5886b"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index a8717c0eae..7e0aa3d5fc 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.49.0


