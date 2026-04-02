Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F30CCC6B2E
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:22:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11101.1775118123136515124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 01:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EdDvEJpf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=855281fcfd=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63203LMn2296855
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 08:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=IFA48cOZR
	zxDBqhL0oGdKaWgwa/w7ExeGOY2k3Pp5jw=; b=EdDvEJpf3SfJBEgFO4WgnJKr/
	agTOuXVkxLNi6/N+BLnmx3B35OVKPc6Wo7BBmAz8W1ehVN4yvvysoTu1cw442Zb+
	v1jCrblsip4txxioqM8tzYlVwP0DWu8pqpm8WTojwJ5dzztux5wH+HUyBc/OFTkE
	utsgUnA2YYzI8xr0+8pdHazn9Kv/lcwEAYv2lKOq9AQKlfc5tr78Mojc5/87LGwQ
	BN+193psEEs1nV75bVhvr7T9tyrDVCwNsExezpxEK6dF9pgFasB3aA4vnL0L0Uui
	DXUeQenXd6tdvXDIYXvunV4pkiqBiZIkiNq6pqoUa1qxge2PCO+/TNUW1ip0w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646vyg70-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:22:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7TQjWOXo9mt+M0aMcsFSEqZ+G4JBXvUtxbOJiBcixWCcjT0uJT/J9LpE3V94kKSpbpHp6EM/TfKicUpAcdQeO533f77zFoWw8sZOc8YaAaDVw2V+bOUGms/doJL4KZhbqY1KkCkApYFDG/cOFsJ30lWSZeYhxdaKWIB89CCmx0UkXwzqzED+tHvdMLzrpZA7ZbmJHKLZKazf2L2/M9VcN2KhhtnFdomEebHYdfAFAgJP04IhO90YE7d3VLyuQIW8NdgKc1fhxquCcHvPn8MYt/tj3+S4lR7qrdMOObQrBCxCpROjq4b/8xLFt722OEMDs2juQsGu72yOps1ivDFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFA48cOZRzxDBqhL0oGdKaWgwa/w7ExeGOY2k3Pp5jw=;
 b=RgvL/NyY6tafYQCdmPrQ0l1EycI1TSaDHdJyKW6Lchrw1wa4DUWiqzZmuyEzoad2JMB+ecYlTNG062MTeye32+ZE+0i3mH3thZcwdtmuEA0g+Hq5b5jyp8kt5hxAn+WOaopagftB+8sAEdD5YpeNZ9XaiL5TfpgIzhmAmbzTKiw9r6ZH1us+eauPI6EgFmJfzdK3WvVUnuXcYvxNulbz+CKshj0kz9GdtNOyVtVDeSY2rxhNtAjIUHWHbJs8h/6djPVPfjNkVUYTEZy90wBe3Z8RK5VMpwldlav3uJNgeu6Sf2E9cDQnURc/Cl5r/GUzGA+14iG3kmLylfuA8j/3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 08:21:53 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 08:21:53 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.kumarMD@windriver.com
Subject: [scarthgap][PATCH v2] unfs3: Fix race issue causing a glibc test hang
Date: Thu,  2 Apr 2026 01:21:35 -0700
Message-ID: <20260402082135.1576318-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR01CA0005.prod.exchangelabs.com (2603:10b6:5:296::10)
 To DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c4cf54-c1c6-48e3-579d-08de9090e58b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jd/A244a+/ks7M25usReDFvwdQ6lxk6F0Xo23lTiJ836lJOkA1iLic0xTIDVYCF2nod/ErTdUq/q896IItpa/9ljMBi4u447weakhEc3GywVyNwHluZFKAHwdYNRMobrIrE/SOaWuS65/YOAG9VPW1VYYG6QfT5YidzLpu2swAm6Zxdjln86NhTfvbvmqL0NmnemlXJ0g7NfuYAp6lbznN9F3642FOmT7j3Orm7BQGzsTgbA1eQ8EWojp9nFMRWuuImlPxbvpSMMrW5//I2zfWCa2846cjJeurKnhhEi9EZI0qk7nn2zuUO+cs+3+Y/gMGyA4Qa9I+NvvJi9/+XUw9NeVbIT9Vz5dQobL094U7WfjbEa6fUUB9JCO4cEcZiaAnFO/6NRr+4S1zi9R6iWEuQQCwqYadqOR3J+6ZN9l677L6vnkYsaF+XbqVH7Ynazv8oa8Iucuqt3M73bN3ZSXLpQDnU6oTtP+FnsYY5HpKGIdfCK0PW+b7k15dg23O/NwrpEy5MLKbGnVjkg36K+k6I+rP7dmnHC9ZgMM3TtBeRTLx26kMa8LLgZAQkAySccNEu4vJj0RBXIjdPOUtpAev4KZcZh5KhvDdVTRL7lFJREM3XvvoTk+KceKQa8LBN017b7Rqr4ZIyenWsw+2IvB24+kAowi/GLptmxBbDe4+2M8ANfSiGOyaSCwEPJybrGqJ1aPsO+m+e3Op8kf+AstO1I793e2wacVXifHvvH3pvozM//x5vGmBePto0vkQfxeKD0rBCC/pIyoQ6koyb1ktnw8baf7cYO0NQ7GRSpqa4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4WDE4StKQBfp9Ab0bBL54RADvdgsgnEoKy6R4VZPoi+OblSRDi7a+bTOGwjF?=
 =?us-ascii?Q?rv5kCV4IBzzTp6EpP4W7usG5Z0t4uSJITpeBaSHFJZd0xJt8fIQ+r/UfZA/W?=
 =?us-ascii?Q?1RvVVY/Nxn6KMYum5W11f24iFzZN1hUi9SDVHhvph2NcgERlcll/cLnjlkTf?=
 =?us-ascii?Q?hhWnxJbNF4sQZZXkADl4I2MMfJBe/ukPjGn9bla2AbVQppKJHqxEU6I1oO8W?=
 =?us-ascii?Q?w+y7ay/KmNBGOLMcldLqYxR27UZxXpxsHHZwDXQRqCebD/Dl6usDduIEQCzW?=
 =?us-ascii?Q?UJ524pNav2sE4oTyjuPyNpkZ7cYilieV4XGehTWPWdzGpXS3tDMJ1Ex3je9h?=
 =?us-ascii?Q?x2u2MDnKXnwJEFN2E1pnV6r0p8Mu8KGZWQSp9mWQOe2k9air1XC6YgpQkBa/?=
 =?us-ascii?Q?eqpPKN9g3p5jxWVbLx/n1YLAzFeajDzqPk+YuYDZusTRE3d6Ej26LF23/YXQ?=
 =?us-ascii?Q?XmzoSnnlB5RWH4qwlGs9sFANXAXG0AvMTPxrvorawtDiKdkHZrURCOXSbiQI?=
 =?us-ascii?Q?IHWgocLC9aTkHvBiCHDhOTXp6m8v0h7vZoz08iyM9/YkHCJsOsDV0a9fVaof?=
 =?us-ascii?Q?SevnA/dgH1shz4/V/kAWJsn8UCd4zMTB484sVpVhi5LaRDAmAE/xd7h89udv?=
 =?us-ascii?Q?O1W1PdiVvxw7Dl3osRC6ETzwuvnjekUtPqhqkM2h1bQIEAfFM0EtmMLWzx0Y?=
 =?us-ascii?Q?GSxfNItnfTlkPDD7k3a1YxySgEi8fVro38ygBZUHEXwm0z8ujkYOP5E6nCNW?=
 =?us-ascii?Q?FzLmxTOug5EnRGHaQZmTnVtw7+Abl0s/3BetePws/SFZRjfr6BoJVBrcUb4T?=
 =?us-ascii?Q?jQyBnAHHHj8qSLYxcstmd6cT5kbLGNuD/jC6V2H3D4t7/ShC/ptmlKfqxEqy?=
 =?us-ascii?Q?M0u85FCZutTg+r7qmQ49OKmEPXVH2YDy7W8YD8SpHfIsO5D+PsfpLw+eqAlr?=
 =?us-ascii?Q?Bl3yd2Uq1Jemt6siT28xw2ge2DqyKgejasT4IEj0erKrwty8ZpvWAJXrD5+1?=
 =?us-ascii?Q?cDRDmN7+byWxbEyAPgLsiKlLmjl3VsGNIifginT0qiS48HXjrazT8wQJlUGX?=
 =?us-ascii?Q?ErFT3NF6DI2UcJy6Hq7eRo65RMDdMi5TwnuUHWBa30QPvYne78602SXYpWsB?=
 =?us-ascii?Q?etJMlANRp3eNQvigaidqPlJCmkDdAjztJNi0ykG5DEtygxuRUL/vpoZzRuv5?=
 =?us-ascii?Q?YKVopZDQlFLorHU/8ZocXpI0Xp+WjD2f3sN+/hx/OjfmWRQ1LAIyWcYiP2lw?=
 =?us-ascii?Q?L+o3BX15yDw5rYxh4Zdn/SqyZWtp6/ER3Exwci/CWBJJ+BlmXn2GJMrHi7Nt?=
 =?us-ascii?Q?aevGfwrMR0ml4vreWYEGd8hbLvQKPwL3szJcnD0rG5H+O0PcRNtEBOdpvovX?=
 =?us-ascii?Q?gUtet7LKPzOibnpwM6kAKvjPsp2R4QHV0ZhnRFRohi7USnFncgTPuzXRxlDp?=
 =?us-ascii?Q?qlOFqeFa/6cMwXzzar25V8UxSTg52ACiARCjP76hK0OmY5v7CO+cd1FGxvAM?=
 =?us-ascii?Q?10Q4O0YZIJOFYIij6oNqZDAf6SjS2llLGoTuiQw1EuSHTHyvfF9Dm3veGWDK?=
 =?us-ascii?Q?Vz3WSmHhqk1G4iGIvnS3OEKOb1cj4MbKinZLLJI6sJ1D3Alo9NAPMGXx3QmG?=
 =?us-ascii?Q?4fkM/fGWFAO4Akmbi442ZCaCxc79OzjCvjttJketFXu1B2cganEiquOzx5UM?=
 =?us-ascii?Q?1cBfqSLMtOM/T8f5d420fnqQCqVxDQCuw17ycKfQL7T4iyOxw/J+dudAVe0W?=
 =?us-ascii?Q?k1bLr6SadO8qTIM9pjcjufOoulbzahk=3D?=
X-Exchange-RoutingPolicyChecked: 
	vdDN5WoMk2SN2Mf6ORf2g3biAgxpwdA0w18H4reUt3yaCEvb+LlDoHEvgC096UG7jDA2f2vcZsWzelyx4TdTkAiRSz9bjO+wYB5hFP/cbMJfkZDUhm2eOErdlmXKoRJCpRXKjEsvehp1c/9Pr17Q5ty98eyM8x/Dz9zQVWFR11WPuwRDCdylLi24rxy5t7PThXJYiQkkCGXOi4K0C/QoFekPyJeCO8+IWlS3hc+hsj0opeLywaXg4P8JadhGR0L97OqB7cnti8PxYFsV+XTKu5/9UvoM4R5w/NYi6hu0ADrSIAjUoG6DI/QPxvVACjp19tb0nAQjM+GM9oXcGeplRg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c4cf54-c1c6-48e3-579d-08de9090e58b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:21:53.5895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZ0s8zeSMPJXOERHPlAUnnL3Z7UUzmjtBk4GxWAGqOrsIhERikgGaMzCtVZeyxDrqEinofXyFlz6X7ZwoW/GRGtqwYFysFIlIVi0PGq2MiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69ce2729 cx=c_pps
 a=MAgfROEylrrND5Jw8NuT2A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=ag1SF4gXAAAA:8 a=NEAV23lmAAAA:8 a=oNTXYZ8t8MtPCu0ktUMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: gGHkdCXLYI_HOlb0PJjTtts-QZ1d71aw
X-Proofpoint-GUID: gGHkdCXLYI_HOlb0PJjTtts-QZ1d71aw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MyBTYWx0ZWRfX+uhtaeInWmsD
 f19boDxsMzvSuZn6HOLyTUvxJ7CIP9lgCzVE8JDNJaaliJUtyQ1+ihx74l49QgiPuLwfdu3orgF
 FjAfW80SwudeqyHnq1U2QdvgPoE9kf4LJGCUTyipYBAcDEotNv7O+m9wbyMWXd7H063tecgKPjZ
 UaPUW+UMM/MeoGl2MadahmALU+4UxjiERyhsjKdG7gOEFth2gGriY6zzdrzdfLws1SUGHhSSC2H
 CUaLv04IqJp6nyjVAakYq1Lz3JLIsRZt8euQZvQmr4kkUhKec4+Hlzw5Tu8+kNF9Q9dHD1g9TXR
 8/tFhwaeSVN+rDLJ7wvLqk50pcQi33e+8exuMs8mLi73NuCV316Y5a/vNAQTvshknZ7+n+Qzihg
 JmW2e8CSZIfT4ggW1wIR+otBHXWTwrIwK8jJn+vMhi5xiKr0kak3TdoJSRh2VxmcmuDl+eVFDrt
 O5C2y6DOjf592/min+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234506

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
hang was traced to unfsd exitting with a buffer overflow being detected.

This was traced down to mksocket() where we'd see:

socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108

There is a length check in mknod_args() but obj may not be setup at this point by
cat_name() since the functions can be executed out of order according to C.

To avoid this, make the order explict. This means the length is checked and we
avoid the buffer overflow. This will likely cause the glibc test to fail however
it won't hang, which is a win.

[YOCTO #16113]

(From OE-Core rev: e51d5e19cb1ba1d5ad7442064b64821d178bc9ca)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../unfs3/unfs3/fixrace.patch                 | 38 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fixrace.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/fixrace.patch b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
new file mode 100644
index 0000000000..ebdb0d79f5
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
@@ -0,0 +1,38 @@
+When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
+hang was traced to unfsd exitting with a buffer overflow being detected.
+
+This was traced down to mksocket() where we'd see:
+
+socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108
+
+There is a length check in mknod_args() but obj may not be setup at this point by
+cat_name() since the functions can be executed out of order according to C.
+
+To avoid this, make the order explict. This means the length is checked and we
+avoid the buffer overflow. This will likely cause the glibc test to fail however
+it won't hang, which is a win.
+
+Upstream-Status: Pending
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+diff --git a/nfs.c b/nfs.c
+index 3e92f87..784089a 100644
+--- a/nfs.c
++++ b/nfs.c
+@@ -776,9 +776,11 @@ MKNOD3res *nfsproc3_mknod_3_svc(MKNOD3args * argp, struct svc_req * rqstp)
+ 
+     PREP(path, argp->where.dir);
+     pre = get_pre_cached();
+-    result.status =
+-	join3(cat_name(path, argp->where.name, obj),
+-	      mknod_args(argp->what, obj, &new_mode, &dev), exports_rw());
++    result.status = cat_name(path, argp->where.name, obj);
++    if (result.status == NFS3_OK)
++        result.status = mknod_args(argp->what, obj, &new_mode, &dev);
++    if (result.status == NFS3_OK)
++        result.status = exports_rw();
+ 
+     cluster_create(obj, rqstp, &result.status);
+ 
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index c5b7898b3c..50d5cd272f 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-locate.c-Include-attr.h.patch \
            file://0001-fix-building-on-macOS.patch \
            file://0001-attr-fix-utime-for-symlink.patch \
+           file://fixrace.patch \
            "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
-- 
2.49.0


