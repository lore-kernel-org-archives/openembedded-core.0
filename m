Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBD4CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 19:36:50 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3404.1781725002729639660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 12:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aAtFntH5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QDfARyRd;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHhn1x2617956;
	Wed, 17 Jun 2026 14:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=R+Fi3eLINlIkTtqnAQlk5tZuEPrFOXp6brmwtB0lc
	E0=; b=aAtFntH5uIiR1o3cVrdlU9Pa+S81mBAfWS3AaXx/xmX0Bihuyc5UuSNTd
	68XMEClkSL0kecFsPld2z6gbADJ4/0emuOKuRFjpPWdbzLJ4PDzGL2oqeCDsOVcj
	dNKCOUFyvZETIu8ojPx7nkoDMrKNREhSPWM9tDe2xJKZLS5ApQdZgHYVg0zzVjPV
	AxX8KPq7yfOr8LgJLXUlEkrvo3LaCJMntQoF/kD5zfHGNwxQck2VPdZWd6c3YRii
	Jcrtz59Px6xVWTrH8CwdsDC6DTennC21vHEEkqlsoMvyUUtLXVV/PXICcsnnT6o3
	UbbTxjlljRX8QA0nILuDpNtlUZdiA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eueeuffh6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 14:36:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywHHGBX2fUZpQUCWWzBXw/T64GrrBg/jAtN69hFii/vRT0I3byF2MyIX/iRUB16aEGQ/TwOvPctT+Oai9biLSzP98YfolvfUJGdbUUnI26YQGZd+6ygNSfw8GK7MgO91K19jaGhwk4n1IF5FG35MsJGLgCsaCzsizdjg82cwRa0k0qzeDGETuDKELKLHZQtwZY5J7g8WgrR20Ci3KhWizj6zpEtpv5xgEyG57Isi+oSoZANU+K9ER+pUgMvn7VrT1OUd9wNHipnRkVsJQS7rli5rMUk2vJqgb3e/1jPlb5J0ybJIwEMi1tQjRnXkkj/8jK0gVDOLx3D6mc0iJaBCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+Fi3eLINlIkTtqnAQlk5tZuEPrFOXp6brmwtB0lcE0=;
 b=rvSKa1w5pB2FMy4H3nT2M55hfZ9j8l9a/hi+hUI56hY7/Wv4MelnkknAedNfiFdM7USfpTGyLjPGeSyrLZ1UW77B3ihQ701gSBZs/1FvTOwnGr4db8wyFewSoFBMalzlI1VbQN5+7nnl3ouVBoT3YZLp35FEAuY/Vb7CNVIdi9jfPxTgRsM3QeqvZHEbkKCqQMAWkv4MJ+KswRIC39Ybh6XeKeapSY6jW+rJBr00MaS0zZenCHdj+rfKZHdhFkdtYARwbngZsTo7Ao2KLVXOYu69e551D7RSFNqQdccUZHnAxxTbCoQnzvxPXuRqJHMC+uZGALEVNXf7NOovUGbc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+Fi3eLINlIkTtqnAQlk5tZuEPrFOXp6brmwtB0lcE0=;
 b=QDfARyRde5DnpNAA+efPv3gs/328jL4gdEuk+98huCThYJ/xB45oi7wu3CuGwJ8byA7yz+NdF9dNtRyUuotWH3BmeJTOWSYh/D2eBojHLnl/Km7B3872yDGWEY2XTs+nhcBoDhs9KBU/9sY3oO7dCnkcRj1UsojXwskwSPKOxWY=
Received: from SJ0PR05CA0143.namprd05.prod.outlook.com (2603:10b6:a03:33d::28)
 by PH8PR10MB997929.namprd10.prod.outlook.com (2603:10b6:510:3d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:36:12 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::86) by SJ0PR05CA0143.outlook.office365.com
 (2603:10b6:a03:33d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 17 Jun 2026 19:36:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 19:36:11 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 14:36:10 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 14:36:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 17 Jun 2026 14:36:10 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65HJaA2C2405637;
	Wed, 17 Jun 2026 14:36:10 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Jun 2026 14:36:10 -0500
Message-ID: <DJBKSFJ7Q6JQ.1D89F7VO0CEZU@ti.com>
Subject: Re: [oe-core][PATCHv2] xuser-account: convert to
 standard-user-account
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
        <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260616182553.3046153-1-rs@ti.com>
 <DJBG5QOT7KD0.2G8XWYKZK99JY@bootlin.com>
 <DJBG6YVT3DHX.PTRABOQVTRAL@bootlin.com>
In-Reply-To: <DJBG6YVT3DHX.PTRABOQVTRAL@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|PH8PR10MB997929:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee639e4-763e-4862-b59d-08decca7b02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|56012099006|5023799004|4143699003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	k4LdnY+361s28ZuT8XVoqX1LBeGznnj1l4HtJBUzTVAaaYyym7QBtGML8xbl7RXMaw8TIM2MG+pPDhorvmQ7Pa+/CF+HdVT9IAFGNJ/ITBFCfu3gS6AQk99Fg9vpxWoeud5c2sAANdaKWEcTBf6TbXGOodOqBuRPc+FiVN5/a0PXoTvP+PsvKiGCUu7FZ8lsYrhQ+BzXiPHDaBUc7OU+/I9G7O52WYEI6x94Ial5sJ5QdZmYXOBbm/pBCiGxDI8/Ox2ZX4+p2csPq0CQ4u0RrcdRFpazOWbBGqZHICH2k9yGtSVX5ZaidDkZTwmzSBM1f+93usv8dpCriIrwK9HFr0/GNfKR8g5xkorD9NrLp2iE8FAIQUZqgl4cOxv3HWRcTu13CsWEAE8INXLcNyn/2lvvBqmU4cnDevoT977dErpHyjBjrXRf5gBtqRU429044q/XUzXEI+1Hw1JS13NfZPQRz5fFSinXSWjLsiiPPy+dSvDyD90PylDc0UvGUsRBfyMnvhEvw6ov1HKVgbYGPGPdqL6DZRuH0dOUT4N2F9SZW5GwsSb7JeOukndFKFEPfsS/Ry0d6twjk66CorP8mq92McWj1CcvOVQSoTxKkOIqLlP6a72oZb8JcWXkp6GlLMx/7TkNFU122CnZVwKMQFIkuMLmZObmz7weoytlqIpVQIk64OJzlSC2xES7HY0q
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(56012099006)(5023799004)(4143699003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zZRTea1IfSnOx3PDvX4ja09gOb5J8QK3Xha48IDN/wl6mJk/gNYHExTC1MgdGaDzEBN0M7OYiZ3h91ntndWy0Mbv7iycEv6o1Z02CIDBtUvH1Lhgm27yVsoyXKN8+woMYKwW1nD4X/mqEOXxLuYiSpf9ZLyCvm7V9tgjzVnF9Ez5ainXVzNgVev1QQiYsn1ZxlvWj83/9rAIL4uedCZdyLekrInwIYJMeQ4Y0T6bC+WGNc3j6xRHs/NUiOxQ1TlA16XMquhfktdLOXSd5tDRZdgxF9BpN/a7dbeqY8Wf/jeB7qm2cDo6YX8UiKc9BWtmtatytAl8w5t6/QU/ash6fxqX3wKyWeLkQ3KAjiu1Cq5H6Jv4v0mRrEs4LoKOvW/7BXRMWEKDdXU5qVVsF3rzMt29xDWgkABjxz50XkwCotF0Fnj9zIQ0A6HVlJl6Oxn/
X-Exchange-RoutingPolicyChecked: 
	Pq+VZf6GSHWGz+l6INQpjIsXnp0fajY+eIIuVE+AaDjxOK3QNPJ+QPeDoAYJNwUNrD8Kgq2I9Nev2CrCe+80bq0/oH28PD+uky6Pb08EptiKn+luRhkLxggzRbbT4BAq4icXFQz2qgNnnFsFDCQCnaqES76kbF1JT/VrGfgrI6Ca88jF/QX4EKhnhSQSARc/KA0Iz8H7u9O4pJ5I4UX84el3IxkCFFqYBSsXI0X9594w8c9tvYWlAR6OHoQOYFYVSu/E0X9NLzQAgHkJLf/Lhor46rMWSAflWJ10fQ9C6qmFQHd1wvUqAXxQzPrMwR+zfwP2t9XxXqlCzkvUKCuhaQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:36:11.9297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee639e4-763e-4862-b59d-08decca7b02e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997929
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE4OCBTYWx0ZWRfX0ry6AlyqLXF6
 XfJl5Xm0rAJ9Pif7zYew9aniiN+MGDsbx2TR4z/jTru3R5/JZh5thbTC7yFB6uHVqla+wS9BPqJ
 U1LmNbPYni/R4Wu6fLKk+SL+OjyiH80=
X-Proofpoint-ORIG-GUID: zl5A_5lM2E-hftXOa5559tiHAA8PIiiW
X-Proofpoint-GUID: zl5A_5lM2E-hftXOa5559tiHAA8PIiiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE4OCBTYWx0ZWRfX3LmABgmi5OHc
 veubqnFhYt2ixoinDq8nLioSgHdhM6Bm8pcKjAES99qCJO5dSTz2reodkpHq6b/TMtJZvWkKdet
 uCFhamu02d/XXCi39cgL3on0CJRdLVB1QJKVC39H+yZHEt51/24CGOGWWMfKcyM3XX8YqCymjHu
 PrcsFCenxIbeMwsyzvZf3gmZpxSROeNAXai5j+ScmRVoEcctQSkAP4pd4bLqVE6+eZnzadzT/Jl
 vVjjUXJIWIm2ZwKSqvstAS8Eu4qEu+G8B5KEDtUs8Puxn4n0EEkmrjYq8KzkYOhzHXtUnrKTrGA
 6FIoCQjP+h33/vQQDAvprWwj+c9nieyq3k6pfxZYppM8Kmic0Q1sVXOeICXWz0ElmWp/BPDoLYI
 R5k+y4Jl9462U22d0ENy21btg/fO3pPobEXNaEbiCHOJeyS0eZpiNWE6zld1KiWNdSrMQPWigi4
 zxybDSDHPuL4YFeSKmw==
X-Authority-Analysis: v=2.4 cv=KdvidwYD c=1 sm=1 tr=0 ts=6a32f72f cx=c_pps
 a=oUdh5d0wO9iyjQqwpg+wBw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=6ms4aG7bvgtPTsDesCMA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 19:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239046

On Wed Jun 17, 2026 at 11:00 AM CDT, Mathieu Dubois-Briand wrote:
> On Wed Jun 17, 2026 at 5:58 PM CEST, Mathieu Dubois-Briand wrote:
>> On Tue Jun 16, 2026 at 8:25 PM CEST, rs wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Change this single xuser account template into a generic
>>> standard-user-account that uses distro level variables for
>>> configuration.
>>>
>>> This allows for seamless configuration of multiple out-of-box scripts
>>> and tests across layers without having to implicitly hope that the
>>> username or groups haven't been changed by a bbappend or recipe
>>> override.
>>>
>>> This also adds a class and a variable to allow recipes to assert that
>>> the user is in requested groups.
>>>
>>> This was proposed specifically to remove some issues highlighted in:
>>> https://lists.openembedded.org/g/openembedded-core/message/230665
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>
>> Hi Randolph,
>>
>> Thanks, it looks better now.
>>
>> Yet we have some test failures:
>>
>> AssertionError: ssh exited with status '255' for command '['ssh', '-l', =
'root', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', =
'-o', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno',=
 '-o', 'LogLevel=3DERROR', '192.168.7.2', 'export PATH=3D/usr/sbin:/sbin:/u=
sr/bin:/bin; export XDG_RUNTIME_DIR=3D/run/user/`id -u weston`; export WAYL=
AND_DISPLAY=3Dwayland-1; wayland-info']': this is likely an SSH failure
>> id: unknown user weston
>> failed to create display: No such file or directory
>> ...
>> RESULTS - weston.WestonTest.test_wayland_info: FAILED (0.47s)
>> RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compo=
sitor: FAILED (0.27s)
>> RESULTS - weston.WestonTest.test_weston_running: FAILED (0.73s)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3950

Yeah, that tracks. Have been testing against sato on x86 since that's been =
the
most problematic combination in the past. Completely missed that.

>> Also we have a failing selftest:
>>
>> 2026-06-17 11:32:17,460 - oe-selftest - INFO - incompatible_lic.NoGPL3In=
ImagesTests.test_core_image_full_cmdline_weston (subunit.RemotedTestCase)
>> 2026-06-17 11:32:17,465 - oe-selftest - INFO -  ... FAIL
>> ...
>> ERROR: weston-init-1.0-r0 do_package_write_rpm: File /srv/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/build-st-953747/tmp/work/qemux86_64-poky-=
linux/weston-init/1.0/recipe-sysroot/etc/passwd doesn't exist in sysroot!
>> ...
>> File: '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/opene=
mbedded-core/meta/classes-global/package_rpm.bbclass', lineno: 202, functio=
n: get_attr
>>      0198:            def get_attr(path):
>>      0199:                stat_f =3D os.stat(rootpath + "/" + path, foll=
ow_symlinks=3DFalse)
>>      0200:                mode =3D stat.S_IMODE(stat_f.st_mode)
>>      0201:                try:
>>  *** 0202:                    owner =3D pwd.getpwuid(stat_f.st_uid).pw_n=
ame
>>      0203:                except Exception as e:
>>      0204:                    filename =3D d.getVar('RECIPE_SYSROOT') + =
'/etc/passwd'
>>      0205:                    if os.path.exists(filename):
>>      0206:                        bb.error("Content of /etc/passwd in sy=
sroot:\n{}".format(
>> Exception: KeyError: 'getpwuid(): uid not found: 1000'
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4139
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4061
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3911
>>
>> Can you have a look at the issue?
>>
>> Thanks,
>> Mathieu

That's fun. I'll take a look.

> Sorry, we also have a dependency issue in the reproducibility test:
>
> 2026-06-17 12:32:19,348 - oe-selftest - INFO -       ERROR: Nothing PROVI=
DES 'standard-user-account' (but /srv/pokybuild/yocto-worker/reproducible/b=
uild/layers/openembedded-core/meta/recipes-graphics/wayland/weston-init.bb =
DEPENDS on or otherwise requires it)
> 2026-06-17 12:32:19,348 - oe-selftest - INFO -       standard-user-accoun=
t was skipped: Recipe standard-user-account, package standard-user-account:=
 system groupname "disk" does not have a static ID defined. Add disk to one=
 of these files: /srv/pokybuild/yocto-worker/reproducible/build/build-st/me=
ta-selftest/files/static-group
> 2026-06-17 12:32:19,348 - oe-selftest - INFO -       ERROR: Nothing RPROV=
IDES 'weston-init' (but /srv/pokybuild/yocto-worker/reproducible/build/laye=
rs/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-=
weston.bb, /srv/pokybuild/yocto-worker/reproducible/build/layers/openembedd=
ed-core/meta/recipes-graphics/wayland/weston-init.bb, /srv/pokybuild/yocto-=
worker/reproducible/build/layers/openembedded-core/meta/recipes-graphics/wa=
yland/weston_15.0.1.bb RDEPENDS on or otherwise requires it)
> 2026-06-17 12:32:19,348 - oe-selftest - INFO -       No eligible RPROVIDE=
Rs exist for 'weston-init'
> 2026-06-17 12:32:19,348 - oe-selftest - INFO -       NOTE: Runtime target=
 'weston-init' is unbuildable, removing...
> 2026-06-17 12:32:19,348 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['weston-init']
> 2026-06-17 12:32:19,349 - oe-selftest - INFO -       NOTE: Runtime target=
 'packagegroup-core-weston' is unbuildable, removing...
> 2026-06-17 12:32:19,349 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['packagegroup-core-weston', 'weston-init']
> 2026-06-17 12:32:19,349 - oe-selftest - INFO -       NOTE: Runtime target=
 'core-image-weston' is unbuildable, removing...
> 2026-06-17 12:32:19,349 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['core-image-weston', 'packagegroup-core-weston', =
'weston-init']
> 2026-06-17 12:32:19,349 - oe-selftest - INFO -       NOTE: Runtime target=
 'weston-xwayland' is unbuildable, removing...
> 2026-06-17 12:32:19,349 - oe-selftest - INFO -       Missing or unbuildab=
le dependency chain was: ['weston-xwayland', 'weston-init']
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4185
>
> Thanks,
> Mathieu

Ah, man. The implications of this error really bug me. There's not really a
clean enough solution to fix the "some groups are just implicitly expected"
issue though. *Suppose I'll make a separate var for groups that we know nee=
d to
be created and let everything else be implied.*

Lot of weird cases like:

What if the group is no longer provided by base-passwd? Will there be any
compile time warnings? Should there be any? Should this really be an
installation check?

Scripts using group names vs group IDs will have completely different behav=
ior.
The filesystem is more than happy to keep trucking with an ID that no longe=
r
exists, and that ID can be claimed by anything later. Good system administr=
ators
normally try to prevent that, but this is all oneshot right?

Should recipes have to indicate where they expect a group to come from? Tha=
t
seems messy, and will have to deal with recipes spanning layers. No telling=
 how
often those values will be wrong due to a namechange more than an actual
deprecation of a group.

Don't like this.

