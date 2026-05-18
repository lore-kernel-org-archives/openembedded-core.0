Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85842CD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:56:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2313.1779083790881923514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jguh8BRI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4U1c3501987
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 22:56:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=l3W5H+FfKioCdinM0sYqOAeyq8cIiA0sjCL8u0K4b7s=; b=
	jguh8BRIWkwrcfiXcTItkb5gq7txwoSofTJsaV30ru74De1FANGGCjE13zjHThl4
	pl8choZ9aLJmpHnj0c4fdA8jB9QcULNW0wO6Lv6flIeh6vQu7SchtFeSk370Q4v3
	cAIn43vNGH0omnzI9VaPd9wS/t1vBlMGyHLmlYT4htEnMeM8mm2j0NiRkPGbXro6
	ckE23ISwG7V7VGhbPm1Bs6MMnP22wX8/4sDsbi/u0GEUyUW32kdrHAVwr6ENO0lR
	m4AeDs2ILjDPdL9cDO3KJS0fMJRxBc8CPmHU0UztQmcrpYX3VJQd1efLULb5aKtF
	ka7NH+cNsLiXN0YOZFxkWA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1fpm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 22:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7FBP+gOKbS+MH96vwEzotQpQ01Y0CfcFZrx6Sx+TFDCmQPWCahz31El9Sx4E/YHSCVOsajTWMxN4RFmKMwAG+3tLx0TDDfttJk7514XZxZcWPP3zAlZyeKMFbu6Np9wjntE55flqlIoxcdhbEOhFQgiQ9EiW7/RNWBJwIwoawGnIefRGE+X6P8dckJxl6+a9ZvaHjeZGxS3/2/Dgt9e+IINJl/4iMhMA6dHaROOlNJYwt5hPAbEH2X58hXZxD6M1DA93TFjvaEXVgrHvhKB6MQsD+rT+vgeTFkI26IsXU1inAZM7RBfkH0FlgiOGMwbF6+rBiThuKBhNpexZYIxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3W5H+FfKioCdinM0sYqOAeyq8cIiA0sjCL8u0K4b7s=;
 b=hCxVgB9vljjs6DftTepI+Dg4UNyLrF+3nj0ghU+2WquTYchlqMNVP4np++ZiP3j1H4yE9UHhTXhGybA/GF/qfQXJFOKln3doPr1rimRT0DgOOKhzRZTgwi9vA6DW0fVlWtyRirqfzuXx+AwBoKzor6tdV5pbCDuV/YmHA7WC+YeKXf4e2qzzka7fBP3cb+f4zIh24u71eScuacEHd+Z8qxoTGkd5kYMj/X3+fWXMi3VFMdZZJtBMowtGO07PkZrQv3JrI9avPwEDLTm9NUPMOALH/waTO5fTGskR2EONdXavbpipaYYVUIMOQ8DKcBnvLZ+Hb7DhUTS1OVKRzNYAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:56:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:56:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V6 7/7] openssh: set UPSTREAM_STABLE_RELEASE_REGEX
Date: Mon, 18 May 2026 13:55:58 +0800
Message-Id: <20260518055558.3982813-7-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518055558.3982813-1-Qi.Chen@windriver.com>
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbb8aa0-8ce2-41c5-20a3-08deb4a233e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|12006099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	c6ZwRbauKBwaFoGAxE/AFbBO24TzgxSbbtCwXU0MoDzY160dUY2KQo7B9b3Lme7y5HcIqBwl3lO/ZRNAC6U63cln9gyGNA+800ovDFPrXHWP6q7tLffQ0skc91qGDQiF+N6itJE0lJ8NLePCJ+Hskt4Z2nKtVsUSM0PhAULzqRtsBr60ltWWc9/WCZmJ0NNXuLr5rQE65sBYoqy+IU5sajOsZ5+d9F8W9KbeFcUMvA2WHQu88fyp9/ilN4lq3j9ZikUS533rWvRIJS2KtpP+YdILqtTUNmkzpZ0BIb1RlP7fr1FD7q4blZX8lb2UxOh973eNlXg4PpCxHXZwWiGAUb9nAJV1eYgWEx/G3nTeKv8qvaLRAWt4mC/EAc8NYJHMrWbD9IRNAtEKHL3dDwYhRg+jCkA0F323wBdSXb85+Cy5OeORiVSvHb8wpdDv6F4ZKT1EPTO64FVcswR9+XM2rqGAO+knf+g64c+ZyhVsBiiqboyuCg6UyHc+EuMzWrP8+OOhdlhMpfvdPuJ0NGSHrsKG3bBZ6ju9ZkhaS6j+5+gXQb5XyFP6FXDODcbwovKspHcrY9JkZmal7NPmBZWdfY3afEfaDHlxhWfWXWE8qt/NuDZ+dN47RjMgNT7ozrwAUHi4+zPS5Gl9LNHix5Z3mPf3XaQBGljxdB6tKj+yXQ6iwGGy7sMIuujAzvwVxBlX9UBzsNTv+fgKZ2C+IF8ub/QOmmQq32gT0MVFGfAYsgMS/k+ditU3x2BzNjeqrK6I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(12006099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X94SZ9dLEVo8R5/wWZDM2WA0n0drjAhkm/zZUcwYrqg1BOBR67z5XU/hKqsl?=
 =?us-ascii?Q?4ms2BphMjqLZ8FmdgxNWPlFyKsmf2dRAwJb4G6sYbly/Vi39qCJLaL46mAB/?=
 =?us-ascii?Q?wwRgmrf9as0I5vtvS7yMWS8yr4AC7523t4V9VSgbtp1W25S2n0EfnQTaKRAe?=
 =?us-ascii?Q?2CmlUlqERAVdxUlBAmFEg7HyzIDIjpPij4N7Aelthj7IucY4992E0nDW4myx?=
 =?us-ascii?Q?+pLGZ8UDaBxls/I/23QvQIigeDpzFzGB78p4k98ZkSyNUqbLTUaKalEKkbZ0?=
 =?us-ascii?Q?EO6El2+IK+mXybtLVycGPyi6/mIVt4HlPlJ1mjUDdhIESh6Zc7nGBm1+pLxO?=
 =?us-ascii?Q?dqJUA5lqUDzklLtKyxRNac5E4vpByw4dNkA5Y3ujQK4LIgiCgnQaXY+h7bCG?=
 =?us-ascii?Q?oVE7+DvBvW/3R7GPhrJd0boEVWQgO4T1pRgmIIdXAkLQJjxGa6IR56l2IlhX?=
 =?us-ascii?Q?T3Kq6WiCvqSUh+wQSfJVvjl2HCvr95SB91z/d9Gqy0kDVxF9Yq01svtY1OIk?=
 =?us-ascii?Q?1HYUqKxOVsrs3huSn2O1ltUlJBA9tA2qQ8HJqhAxoO5yaXJi39daM0yzsSGL?=
 =?us-ascii?Q?UrJBR5dwlREBbtq90gnwz80kKYoDEza26PPdHLDi0Ssa2vpEfA0krI3V2prd?=
 =?us-ascii?Q?BnEBU9uTRLdX1Nd5Cz2GBmU0ggPDcwBnZOXd5qiJhMWmalSxMZILO/SAx8L4?=
 =?us-ascii?Q?LYEncgXWyvRqb9TzsseDPH4HQDWeTLLqLF6mEDm8151q0ho6WMH8DOgYC4rF?=
 =?us-ascii?Q?LGAMRVdIF/fKzlTr53YA9OLY4f8AG6amVEyM65YHbT17L9Sj8CG7auGNZxLy?=
 =?us-ascii?Q?bfTBqMOIL/J/Xno2tKTunUjBvRhAOTfyTrmrfBNSSU1+A4em+FTtAY76Os1n?=
 =?us-ascii?Q?Hpb3x1Dkhrn7uqnchpYjVpA77MWlvG1G+G2G7PbzY+H5yY2Eh5aThCzwAzNu?=
 =?us-ascii?Q?/rO+nC/91WBKPuhP3YtCXr4dJGoHVexhSsi1dLTG7CcBiKoJmsiHQKsWCY9S?=
 =?us-ascii?Q?CwYdn104tcAdKV3jWkfvSKSQvsZ2NZqSR0dcMlUjexmBuCgnG9csR81qZy1N?=
 =?us-ascii?Q?znuTHYmSYDU35CA9rczUxWlJecNeFu5ZYsEGQ1YMHNxsLB6iD3gvFxiajJ6P?=
 =?us-ascii?Q?qQbDihkI1qwEas2LeVj4bJQordKcv281EnH75Dyh1htaCne80SNpWFFxdLtM?=
 =?us-ascii?Q?ugF25pSOBmFF14UaDlyFu5d7ea4UtG9xhml/WeKZwQ+0/1TzW70qhKtlf7zW?=
 =?us-ascii?Q?/ukQ8oao2sl3Uha4CCVCjTrjpL6GnDXlyEgjyPzi2tmEWYfzeZSUZ0NMVPam?=
 =?us-ascii?Q?xuyOUty04VKMTTMXbMsbBi0TD5YDbKLo5MGcFZXlTPwTwGTCG8ISwlDuZiU2?=
 =?us-ascii?Q?PWV7Jcdugx334FoBcszyVi5bk0qmqt9hc9RlAe9PEZceQ2u4n3fvkaa6sroY?=
 =?us-ascii?Q?tihin3CL5aRsliJSSZ7Awdezxjeecc7uGXZWOoahiMv7z+1BzIREHrarIKUz?=
 =?us-ascii?Q?W8AG3EUALg3EX3TlV+rmqX+BxGv9LEtP9sSaeE5FaDCSVP18G1r+p+GWmdIM?=
 =?us-ascii?Q?OyDoMeR69EKXB79EzQRTJ2UI0Omt/iNhRJA8SnBaWrRyVv3GW3JFBDwqBFWd?=
 =?us-ascii?Q?MEBYsE1alWxmIaBB1pu1nf/5Eu+gLlZ9EVDvsES/ccPn30okS0zBFBlhT7AM?=
 =?us-ascii?Q?iba0xpijj5duICrciynlbh7SJQWOUuDA7B5iuBgCG52PeTwPKiST8berymJ+?=
 =?us-ascii?Q?JfjR5PK26A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	wRyEN/qrHBvESugV9inttSv75lshrI6AVWys4io5pZPQ3R6kqUPDWtqZanULRL3vXEiQzz6TQjq8qx8+WO3LV2HtlEPGDwAY5//mWitBRHaC/yIUrt2FUXsH52sUZ2bB6hwdctS2ImaGqik9x3V1iZGUkkpYsCQbnP8+6sARRjMhKtyV/9OlYrgNGKaWBbEBhF+3gS9yDCufct75tOhv9xSEtQ816TeGATZj5wtHiHzS26OX+U/7C8154SZDyZUN9Dg1qZwxwWnKrO7M5sd+ztFsWrljHMIkAd2vXqYXE2uq9cAkQvHYpUBYH8haYiC+5O++9dVewY3f1xxR7dZYCw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbb8aa0-8ce2-41c5-20a3-08deb4a233e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:56:28.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OR3el7k735JlHtSPjBPpG20VLmpkbhbsOsxHThCS6xkakRoBNEc8XhxBLeQh3tgaSmuFVeBDSW+t2zc+fIV2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: nvkaTA1R78daxDxNnqQHMgM-zzIcOfW4
X-Proofpoint-ORIG-GUID: llH1AzQQp7q6_YX5tFn51xEqH65mOywG
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0aaa0e cx=c_pps
 a=St7v3kIWLLX4ycmTPR678g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=3tcz3bTJAAAA:8
 a=t7CeM3EgAAAA:8 a=v7gsG6E2TZR_ph0OG-cA:9 a=4EbjBm0RLgFgoQzmu6QD:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfXyhQqx89hrqKY
 37DzAcqk+RyCmRPYCF74WchqpTxqO4HSzjdulLIgC8IACD+4RG3w57J6CStyuc1NxB9hCUgobtA
 bEtDLxmIXfMHUC6UEBDHBwKEczw61pLpsYkRNvJG8tR2xisL6SnwBPH6PQhyO0hhcLqHUbsG7y0
 HDm2k/Ql66iuwEeZSSOJnQMtsOJI9iTCZU0ldkeJrngkcLV98vkGry8ijtl2CtZ3bfsJlDPZdjM
 2tNHCX3Mo8Z/fqjddlHD9XSXdzhN1Oij2QSrr1h7vws9W3gDkoNy3mhMa8en5nJ4SVctkLllh5g
 eEQ/KUgeNQR5qjnca5y/kXH61l1BjBhGP6SQ/UiN5eX3HoGeJ0BxYCgDrc8D+QLUGly15SyI59W
 hffJD0zA3quFtPY8dW62ZsNgvjVFWz3/P+CBnVbCeXXSq2C8w4aJ7YBZdQzihPKKNcKDSeLqNBB
 j0XfKpbD5+w3HfA0dqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237201

From: Chen Qi <Qi.Chen@windriver.com>

For openssh, 10.3p1 -> 10.3p2 is a stable upgrade.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532..e2018f07da 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -27,6 +27,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
+STABLE_VERSION = "${@d.getVar('PV').split('p')[0].replace('.', r'\.')}"
+UPSTREAM_STABLE_RELEASE_REGEX = "^${STABLE_VERSION}p\d+$"
+
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
-- 
2.34.1


