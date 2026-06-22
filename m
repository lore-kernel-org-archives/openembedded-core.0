Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B95CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 18:28:49 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3799.1782152928242081208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 11:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EhFFjYmw;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=P4FOkChM;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: rs@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65MFWF3j3196299;
	Mon, 22 Jun 2026 13:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Za+TU1Q6Eco+31AidmVXd8nzQEmGuuNsZA6mrbMzg
	j4=; b=EhFFjYmw1pCX9CFCSzBbYOi+v+glg1GolLqUY0MbIWOvSIyHTarKMaVuY
	V9QcpqqvEBGUrYm3sNJ0SE54whuBK3ywl0nPl1KZ1hen52IInkrWlrx47AeiDNoK
	C45x9ogsWGQRDxhknZ4W9Z6mAw7Br01IIxz9XPCn5qeX7Epk5w/quYGrfG/8lOqW
	P9xwaUWdiVw/p9MAlxNlvZd7b6u3weoNnY0FZwKchMZNPA7RtPw3Gv4GkKqjhRR1
	pYwD0iHcmyxSKNSOkNsxxEuuRTtP+lhGnZcIFmBMiglB4zDqHLGBnY7NksAhntXl
	Z8mHToO07ZSYtDGuAsGUL/mw61KXA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013001.outbound.protection.outlook.com [40.93.196.1])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ey04ebpp8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 13:28:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COqxMgkpu91eEgOZ4lgYvClCik69Kh7Hw6vNyYp1QQuz1te8UvacZfxqXBFMcttn2Ftpz0Zb40NCnXaHWzKVpVj+j3xolx4YoAxmeoiy7SDvEb/t6T119i05et5T8jnyzLxZ1ZQrSGGJlsR8XwbFfPAWt1603VCzClXrbq0T66t52KX3ZziwCkM1fbfZ7EgCAikpotOrogNPJmbOKQbe7yyYDIJt8h8lS+RRj6n4+vPOIVRn7wvpdSqJunMxkFnvkj5XaMKrSNGPOJaRP+Ygkjw0hnkMWE8TIs/KBUB7vrigWpD6mMk7DLyaZGF2sLVzX1HRukOFXYzUUgkCx+n1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za+TU1Q6Eco+31AidmVXd8nzQEmGuuNsZA6mrbMzgj4=;
 b=qxVVH6oAFluSv04XcjshBYnThoGs2hW76Sq002gihQRjdpSJvRmiPi5k8UpFXnvol5FYIoXDm35pq3vz25vH5fPPfJOFob/4iEvZxhJwLlKf+tlOHZCnp8txDbZT6uXObfj3JKoYMgEyyCwuOzNFOB4kRgz9pDsntFwx6cIBp7hsd0t1VGEJ185Iawf8GPQ80Mf82ye0Z7GGIVz94IThPwlYMlbUf6R4p/eb9cH/7G3p6IlOPCKB1AsuARurjk0LCNmLRW4Mw3odQHOt4ggnw0eCVas7TfXvYfy7dpFuMX/X9Dce2s3jLrsnaJqkRF3qoGIjvKWQHE0upY0jG+GCjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za+TU1Q6Eco+31AidmVXd8nzQEmGuuNsZA6mrbMzgj4=;
 b=P4FOkChM/4mCHpqE8PLGDb96WBE2ppBj3kNjCXDC7qUtR5gEiOIKANRgwZQszujqps2/0mWUK+ZbkkAOQqQIkFPD1HKX9JGqgHlrFFccBLqHM3EyFSqGKM0AHUTI+YaE9OcUCeX8llCtd7hNJpkIH2PuKqx055PJbh13M0QQPPo=
Received: from BN9PR03CA0336.namprd03.prod.outlook.com (2603:10b6:408:f6::11)
 by IA0PR10MB6843.namprd10.prod.outlook.com (2603:10b6:208:435::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 18:28:14 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::44) by BN9PR03CA0336.outlook.office365.com
 (2603:10b6:408:f6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 18:28:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 18:28:14 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 13:28:11 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 13:28:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 13:28:10 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MISAtv504893;
	Mon, 22 Jun 2026 13:28:10 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2026 13:28:10 -0500
Message-ID: <DJFSH3N5IWNK.1Q6V6T6LJMRB2@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv3] xuser-account: convert to
 standard-user-account
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
        <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260618190003.3266810-1-rs@ti.com>
 <DJDW23PH3DPO.1NMHFSM6HL150@bootlin.com>
 <DJDW4NKSIJFE.2U7LKRVTZKGSS@bootlin.com>
In-Reply-To: <DJDW4NKSIJFE.2U7LKRVTZKGSS@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|IA0PR10MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e94519-7e14-427f-9917-08ded08c05a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|13003099007|22082099003|18002099003|4143699003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	A0biiBloO55HYqMQq7AXOdDT/R0TJtIAd4I0qaV+XDafsS7SsQEwuG/atYqm2jprEvLkOhllpmzA35Hu55bmr+gkISQeecwQ/b2+mYLiowCot1jleL2qnJqXWhHqX50JmboES9pCjFZ6looI22HLl8VJRAaji7li5hMcSNKYmqDh6nGIOwv4dJcRe+c1pQ5khH//Yl8JEmOw1x6CELDtCdYiCfT4P9HtE6rGQngnjMU9HTjJfJaOc0tVbuq3SoXh3q2yaf4rhe9OEeDpP6rJ3sEdIn3rvas9Da/TTsWbyjaRCYSQeQGs9vaMch4tAPWpTrXDr9e+2aX417AnM12ZfG0VZSAX0ea4SOCXRINMOU4WUzfWundsXmw+11gmGV4ty8bSPd6fS/SwOLvD4PS/j6xyHKuIRoKz6Ftg0aP5WdxrYsROKWoCCHTQzuBPyYcjcOvw9Xga+8O19mgFBNylEJ9dWs41j5H/IBm8N3lB7/GPmAtUB/zvU9baE/3NeYJpJ1sat1msk0eY8i3E7STqH7jTyqBwMwEruatpJwF/8Tc6/4uYZ3Vc/bpvOHExWkqqaV+jqOZJ9h/h9Ya2EQNN6noQ5zHV6wL/HP9MQ4FrSmckYnX6MdU5nxTNfoaVGp4GGpXU3Mgciv6MJNNCfNpelw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fV2KJzmS4GNdBiX3xOhpQ8Yi4mMqbgOApyZ005XtQqOLHRvUcSHqJFkT6mdFRmoKBoB84J22WRNi5R8FvEwzTgwgx2B+A5bNr4C/mhQImwylAdOLSHdIi8F7aJtnF6vtx9leZt+DnFEGGBISgZNkt+hwNyAHejtn4svgcqxGYsELg1+E6pD29af2hylfHQvR7ewR5SJpzXS1rsYYb5OrHeODM52mOwkTU4DBCVLLgi5N2vgRb2nVAinJGVGtHor4rtYm4I+WgEMZXdVQyg5iFd14wYyyd2ky6mD+fC4mA2rFiBPs7AKiX4Kt8z6snyc1yo1yEtSGBcZzJpFcf3077uT/2FuctP/8gnMeQraCaQXZyfNyilSa1QseeI9FNKQsfKL4lVM0YVV/MdSKvchbELKHn1MGtBskic4l9/+Nd2rXU8svaZLXqOW4mZLae76k
X-Exchange-RoutingPolicyChecked: 
	LAjcR0XIOL9hVZk8mxTxYwmDPZgyBaNfZUrUTB7EAWFASdkhP24YKvR8ew6Kv4oARkWXOmPGOuj6K7g98hAjh8znvTSQGbb5BPlM5PthrsuCWl+gJKpfGXlDie8UPmn0bQy9wCfQLe+9fA9flfun+Fn61HtzEPEJbe7BvJYk8/TfqLS8p9PDX5O40FiO9zg57dg2/yaRBNTzl0rDHhfBwb3pTcbYa5N3kaijlrdLTvywt3dL9a7pKMGid2ZevopSk8WN/GiSVE3pnDjpu81aQUwjc2QQa/t1EzPanIOGP6UymKXd2tKcDyWUa3qXnhuK0QyacK1B80rwsm3n000QQw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:28:14.0668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e94519-7e14-427f-9917-08ded08c05a3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6843
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4MCBTYWx0ZWRfX2DWXYIrWsU6r
 yctzeS37sZq8ao2pbcAww9uIkBunyyZeg+/uvi0apYqorwHxyTJ2CIPCLvn0A4z92nQWFUz6coY
 WnO+uVxcMIfaiY5XX8X3agIMim8qrps=
X-Authority-Analysis: v=2.4 cv=X/Fi7mTe c=1 sm=1 tr=0 ts=6a397ec2 cx=c_pps
 a=dImUGf+04sfXZTE2vAy0Gw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=p9zPh8WNeOaR3guHc7MA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4MCBTYWx0ZWRfXwe70fE5rJHJK
 Y5PPRbHDqBVc7jNp6kur9NF7T/BTpOV8N2J0Fyr3hlaSeREbp694EVKXqhpB2uf6ce5H/t5Yy0e
 ijl7g1OheePUa2n4QuVBCkEWL6DUzwrpxIradptRYGe0T9j9hebIq4b+ujn1lUbLeIP9VriyK/+
 HDlDRMDiFwxaVbNz4eoeakFaU6dpEjMYyW4urdj8UOLM7SDfT0/MdTgLDIyZQ82DlYf2CgbQBWH
 DHnvtnNLowleKnvllX38KViNd0IdYkTy3qFk+GA5jajsflxTNJmHc35/ni1p/jqE0Z9UhNIFiLR
 aj/ETsZBK3zY59sH6dSceRfkl+l83Wxy4KOa4NLgZdxvGNflstJaloLJorttHFGj7nTYoUtYMnI
 7AvEee2QPq5driD12sDsMaab1M4b++eZbxQ8tPHONxI7L3wp9IumskiSVVVC5JGoISWfJ7+AmdG
 buakdIpYT1bKKIzAFvw==
X-Proofpoint-ORIG-GUID: S15HLFOIqU_YCky4nGA_IdPiReBKZeVz
X-Proofpoint-GUID: S15HLFOIqU_YCky4nGA_IdPiReBKZeVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 18:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239315

On Sat Jun 20, 2026 at 7:54 AM CDT, Mathieu Dubois-Briand wrote:
> On Sat Jun 20, 2026 at 2:51 PM CEST, Mathieu Dubois-Briand wrote:
>> On Thu Jun 18, 2026 at 9:00 PM CEST, rs wrote:
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
>>> v2:
>>> 	- Add seat to the default STANDARD_USER_SYSTEM_GROUPS var
>>> v3:
>>> 	- Add STANDARD_USER_GROUPS_EXPECT to indicate what groups are
>>> 	  expected to be provided by other projects
>>> 	- Set user UID and GID as 1000 in the static tracking files
>>> 	- Update the weston test's user name
>>> ---
>>
>> Hi Randolph,
>>
>> Thanks for the new version.
>>
>> I believe we still have some failure:
>>
>> 2026-06-20 11:01:50,077 - oe-selftest - INFO - incompatible_lic.NoGPL3In=
ImagesTests.test_core_image_full_cmdline_weston (subunit.RemotedTestCase)
>> 2026-06-20 11:01:50,080 - oe-selftest - INFO -  ... FAIL
>> ...
>> ERROR: weston-init-1.0-r0 do_package_write_rpm: File /srv/pokybuild/yoct=
o-worker/oe-selftest-debian/build/build-st-4070494/tmp/work/qemux86_64-poky=
-linux/weston-init/1.0/recipe-sysroot/etc/passwd doesn't exist in sysroot!
>> ERROR: weston-init-1.0-r0 do_package_write_rpm: Error executing a python=
 function in exec_func_python() autogenerated:
>> ...
>> Exception: KeyError: 'getpwuid(): uid not found: 1000'
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4105
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3936
>>
>> Can you have a look at the issue?
>>
>> Thanks,
>> Mathieu
>
> Oh and I believe an error we already had before for no-x11:
> failed to create display: No such file or directory
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3976

Ugh. I did fix that, but looking through the logs some steps for weston-ini=
t
aren't running. Given I can't reproduce this locally I assume it's the ssta=
te
cache pulling in old stuff. Will try bumping the PR of affected recipes.

