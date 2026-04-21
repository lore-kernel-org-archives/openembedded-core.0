Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88256F327B2
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:07:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14173.1776755217387656443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 00:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FPOZn2dt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8571a752e7=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4sfof2593817
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 07:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Jo0c1fL+NasBj49rcCUb
	km8JH5tzMFXmYqNVvl+1D/4=; b=FPOZn2dtYm77htjCZu/QaTJrp8uP6UWGMZJ3
	Hca0olYECuEN29bckjCnqjw9iJX8ukc07p8oqG7hMeAEf8wtqXpiO1pG5Kc9JAIJ
	X/ByCfnVk65bksZyZUzi2BCAE3PbXslXc8ClcYqVdyGjBF49Mi7PmCZREJHmF3Wl
	7FbxVsUp6WfctlTnGCVhUWu4GeEgMsYRXqOTKf0ZFMKcK94T4skx/hJ0IETOO9uN
	kkdm7sWBhdlKjJJwivXDWn4Meoi85DSzV9JJ+sanp/woMWQJ9kqM5VYDVgE+CFtb
	eFpzTsx2l9P5+E9Eph5HXZCOGlWjor/mg4ynJHi9R1DPfTnbvQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011048.outbound.protection.outlook.com [52.101.57.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm0x6tyvu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 07:06:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0cjCIqfHE4Xl6VqG0qWtGOx9zQiIAmJY0jjHeMwtKboP0a7O4kkIL4XDPX1ZgEEdVgpZ67d9n62Lm0CZR0HUrcZ3xzvwQ4P8XPZXabxz0WeulPh2TJDScyGbYMYT4e+/XfAB5MAzOEyb5rctyJv2kv5ttVqubrY4T1dcUaVDE3rtKDMEAcXqnCJ7T9NM8Uiq6kNrcDeakmh+IDQgW89TzJfd0fAIEZRrwZPIsEw9nKROC8OP5ecjcjh0ZC76LHMWDVGFCsw1rfso80AauVZQGlhRIdzS+4vFdL6SOXPylaYmUy4ZsPg0gWoPZF58XXP9ulxxqlmrAxwUj0fmRGsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jo0c1fL+NasBj49rcCUbkm8JH5tzMFXmYqNVvl+1D/4=;
 b=WyUfqXfWAXcsyeJATvgSHZAXfsf6MdKhmyTt0aXk+sTNSZBz0ggieG0xzcOjNg0Mn/9KI1sAYX2JDCi+dFvHOFkwXjIGuf5M5ZVk+wnBizMS4DYqlgXj5KJJlLypKdlFYcsxMFXCegVTFQWq8FBYrCdD5Ihjn/x5gxUwaHgvbDaLcAywTD/uHMEkZDqtqlbbdnOlftflY0SMRC7rre6l9ISglWWCH9aci7EZenE6HMDTESrZsqL/PX+jITB5bEMUbDlnAsFh+i9kkRMQToawBngBLqTlJJhZ9dBWcsOzfKEalhxq45GEWcLZKNb0T76zrOlE7x72XzPK5bBWni8Rxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.12; Tue, 21 Apr 2026 07:06:52 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 07:06:52 +0000
From: Zhang Xiao <xiao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v2] oe-selftest: Add static postgres user/group for reproducible build test
Date: Tue, 21 Apr 2026 07:06:46 +0000
Message-ID: <20260421070646.1290375-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|PH7PR11MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce7e860-09ac-42e7-2cd2-08de9f749091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zPHYOyTt8vsM5s1TDBK6HjOb1dyCYJbluxFpqVsHeA5Ag5PZzabJfLrRwD3AoMOCe/U6RZ6yZEwcJ9MQ2PfVieuTh1kvTef790AFlzI0JeElMF87HvYqIxH0WMf5lXVHwiN2VQOd9TEj2jcuCDBv5/qTzrC4EWrSE+ojY+BKYQeLfqET4ijbJBAvjNEuhs+rAIebL8cRpL2MRa3NnMBMTCiLLUyPzPJYkfS83H6q1RPwMQkVlq8w9dMEQnAQQF/EbYs2i3OjfoE+0ZwTURuZWrDp3N+blZWVNyjIs8aNpzTm76SDzbIKZdHfez7EWmCTPD0Z+WGwaFsNaNCK/wlpUFDB5ADnjVFMt9UQsDllwAOz8ljEkjNbeefa2pjR9Btoq+hVODpepyK+vngdWjOZVkbf10illevfaz7RJvIP/Br+7GvJBLIRsf4K0bnL7xtWRWUd/TrRd2nxHgdhU82K/DkfdMa5YfO+n0nftMpnGcA4Ble8KpwoCR/FXJ37w4FXHXPvRiCZyQ+eiBsr6bOYWueHU7ZnmTeuXz5Pk9tihMXa8Grl9y9T8/EPvcdCoGAnNcXbNTMNlLUw68k3oEwrHFWLaltZ06+CStFd0OsevH9KjvJwSpFoDUgYaxDXERYvW1BbU/4/mhqAN3+QmKfmQjimAo4nHTcfJHz805He5MmyxMiZpq3V+UMxYUH2s7Qpfz+9/iEM46ZrFJKHtJP+KIo8PiNdJL4VTaGR1QTZMNxQwsowW04yx6ThNr0d6maEBjPXuBL5vBvvPqDBAIyDkpX889rUrWsglAo1R8oOicA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g6pJziagv+VWqgSR7wq5b8VnTnKChSDWZD9Yg0xhABPfM4uvLGhVVNUsRBeD?=
 =?us-ascii?Q?ZSRfgVBKKWN35Rw3NiEDvcqIiOzT2Jn9ASevAPFoAmE9b1hWId+59qTTdY+U?=
 =?us-ascii?Q?b5J70g9w5cDyXjysSahK1CnA9OhnbW++WRHjOQLuSL5d3lPMesBK4cTA5lol?=
 =?us-ascii?Q?oSmYnlGRJcWWGRnIUIPtGvCF99915jUNHUZtDDRv4dvD6FS09VKvwDc+UwNX?=
 =?us-ascii?Q?tkkaB31zW2cq7nPcjCuTsT7R7t6YGRhSPbBCVopeOx2L787y1JldPG4LFXPW?=
 =?us-ascii?Q?jgUE3ArbvuZ11ktSseFDZ1w70sA6Iv7bz2HDK+MjcCM/0HJ0NwX9jnItoJYr?=
 =?us-ascii?Q?/77Ohr3NYMP9IfcgZU5BvzOWxywYR8od9FhF9oPvTkz4dUedBuPm2UHfR31q?=
 =?us-ascii?Q?M6NqVlMisadVoNAUS6il2U+BCDphMg/Y95Yulv7goPfNgFAvavmdmKJHdN6D?=
 =?us-ascii?Q?rhKZghTEsQUInwoMaAWbSv/n2P5sfiV7SBq2fkAebRKeyA5TCO5iui4eUTS/?=
 =?us-ascii?Q?A9viylKzVcymDnpTD50hxKye0O6tQBNzpl20ISSZ6/cfN3gmUcF7btr5cMkS?=
 =?us-ascii?Q?J+zED3NsEosuw5LlsjP0OBs3YoApknI26YGXJZ9Vkdh9TTtXOd7DHQdcosUn?=
 =?us-ascii?Q?Sb6QEBvNvDLGFY6kF/ztVXCOzglCB4YOROYuLcJZtFXNksIeJ0LzsKEFUxWg?=
 =?us-ascii?Q?edtkJMxgH15yQHf2YQ7DBkmfUPbUMYw4zxweeOtkE5nVPs157HDGC/SitRms?=
 =?us-ascii?Q?S+/zZARJIPnK8ATCRLsvAOQHFf6O5W6vPtzYDFM+x6XbHRtKw+NWIz+JS7yw?=
 =?us-ascii?Q?of2D8ab13eJ0bcHN7hsZWz+XioNk0quJ231vR3DxGo3K4Ae6ZpgvhGBgJk73?=
 =?us-ascii?Q?TcuM5Dsl/sK4z0QzSbv3QDx7g2FpsK2jM1KL7n90UpuJ9G/iQJ55/0W45KYd?=
 =?us-ascii?Q?r22p/9SREbt+47LME4gOy3gaB1Mg0HgSDQWdnf46cWsRdJvWXXPAyF3EvW6W?=
 =?us-ascii?Q?dNmkdch03uqfrsv1WYZ+J34px3phpNKfBOuWWjj7cUeOgdbDo624XYJOhv9u?=
 =?us-ascii?Q?Edc4lb1LbW5IcLmrTvVY5RA0lW3KZZ+PWZeX9QQJ8np7sR6rNbVrIpIENgI8?=
 =?us-ascii?Q?YO2CFNgJgQjttWriMJEPqhtbpJMfok3aq3vsM4BZzDMmsy1CnP9uGxECUvP+?=
 =?us-ascii?Q?CUNWmFrbBpUXMIZGLt/QMNhJWeOt/ZiAhAJM8vbqjpjPX/0da5aW+tiFFfVr?=
 =?us-ascii?Q?tBHjvHAPqlT4cK57r1HCO+xY+skOBzwOr6p4EGRgTpnKlvt1HUvRDbwmai1I?=
 =?us-ascii?Q?3aLPQbZMamSOd+u+m8J2t7wnp4CR8RDPaNmqZxe6SxyNBvp3CoBetG2a9p6L?=
 =?us-ascii?Q?RQ7iI2S8QtGTdngXflhp6r2M4ZGINZq/PPEEpgHhCUXHxCC7/B1eVzkjSVoK?=
 =?us-ascii?Q?u5tpFy2mAlDiYoOP9/5RnOwUmWsL3K54QyzzrsAJTufhlSZwlh+XghqApMdv?=
 =?us-ascii?Q?w61xMBZHY2UeMH/GzgrQdtiSuFC4OrIjxGo7a2oYCiyezXIsh2WvYd4ijI+i?=
 =?us-ascii?Q?IweZhWuP2fpI+iC0++aL/Qc3hcLtJ6GpAusgtLyRwsAYE7IMig+2VlfK/l9i?=
 =?us-ascii?Q?zNeF+MtanjYYE0f/bU+/VHECreDMhYw8+AsF3eO2lNHk5tjEezHUqR3TlAOd?=
 =?us-ascii?Q?eNj2KZDLSU3VlYwR/N55qC7CL7rrmgxfEvRBY4kRIewujrG1N5WtgrAg4bh7?=
 =?us-ascii?Q?hpbktXBg5ZKSxkOBGlZ+23guSy/9wpc=3D?=
X-Exchange-RoutingPolicyChecked: 
	StYEZd2vKM6FuVNaWvx5/yQEIiKCi9VJdgAVR5Pp/ve+jGFfwZORVonicU9S90GSxZ9QQJj3g6gENoU1S5aDBS8tJS9z69RUdOprtyJ8YURmLNjFF4hJjobd00+YTt33n7g9AODecmhTs+RL1QvCUeliKs1MxRrrtwBMThrZEYmV61moRBxdPOjV03SNskIfyb9LEBL42EWuh6GLZ9FzkKc7yG7GzDkRzbrgNGtWFUjf02+ozQ/QaYq0VeR2evp3sNyCxppiU4hUOECFXUwS89jM2JbT4kww6oVL7Y6aLxe+eVxxorALRR9DlS++0wDTdh/BnVJbn4X3HXxRh4pg+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce7e860-09ac-42e7-2cd2-08de9f749091
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 07:06:52.6141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OH2/Zq5Jk7+XakT901sqXlIFUmBu7diLdb7SBbyWTYtlsSdPLQUShnpCFhQQ4z1KMexcJeRsMF/BDnID00u1TXnwsq24lrH1p7+HzXLHhDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7717
X-Authority-Analysis: v=2.4 cv=bOMm5v+Z c=1 sm=1 tr=0 ts=69e72210 cx=c_pps
 a=sTXJTCApLso7sb9o5cHK3g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=VPtDWs6Jnm3IWv-4U1cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QRAsDNwSctVQFqNLwoqHR5CqndbL7gJ7
X-Proofpoint-ORIG-GUID: QRAsDNwSctVQFqNLwoqHR5CqndbL7gJ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA2OCBTYWx0ZWRfX+28inPrSfTNf
 KIh5kADj4y6voM6hB4+dj7ZYhCqbVnIB/sez0A9JLb+C1u7VUDvxCxm7nagL6hS2cuDj9e7siep
 IhFSFSuR1WiIk0+oIK9E0PimRMHCP+BkrAU1m8cuvLpBG8zd8b3qkpxl7GcdDuZdDljMbWSJ18T
 6qeQAytDIyHnMU9laKF8UJALt7bohfOaMIjWmByMu9z2wMWIa9XKk7+iqoLDNt/oBWPj6S91P1Y
 W3r3WMJSRqMUDpfoDP6l3rntDlh4hzjY+0yXpULuMH5idjzGoBy3VsczR65qFlX78639VCEKVXF
 IvDNECt0MsKGYY7ZXotN7t+mdXVf/4Qvu2yKgGF0sbdTt0MYp61ZnLYm2VQd1y7N9l0mC7RMzWI
 6Ged2kQgCVH9MI2eJicoaHIuGNXPkIdmteUY5FhjOl8cUW9zgUJtoeWstkwNZ9c7uolGa6pueLw
 vRtmaUcBpH5RgAz6YFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 07:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235601

This adds the static postgres UID/GID entries to static-passwd and
static-group, fixing the "Nothing PROVIDES 'postgresql'" error when
running reproducible test.

The selftest environment requires static system user IDs to ensure
build reproducibility, which was missing for the postgres user/group
before this change.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta-selftest/files/static-group  | 1 +
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 6a9ece20a8..a08795c4ea 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -31,4 +31,5 @@ audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+postgres:x:536
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 98017c8153..ba1dcd54d8 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+postgres:x:536:536::/:/bin/nologin
-- 
2.53.0


