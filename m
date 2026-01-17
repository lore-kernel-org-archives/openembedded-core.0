Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FDFC9830C
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 00:25:16 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143.1768609511966578163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 16:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AuF9BSE5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.33, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MV0nkat4bDDbN6BqgV/ruaUC99xQaOixqA+obNfAdWCDNgU0SBFJFHZ0urHpY9XCwG8SKE9zUuKO3uQxXUxbsL18cHo6+1KLWPVKf+yBoyr+t7IJLPaMi5L7mLsV+KwgkmdKKfyrcoAlz64bi8G7yz+kSJO/eZUB8zt+HEDs18g0DTX069g1rkrXLc9/R6qI3Yfd8DYrc06PXYi2A1LKJ+kI6lgUAJ0kK3/pxZ9Yy/mgfaQit27qkEDZKak8HGPm/F8pN/uWTtZJxQupMLbk4PDjhLRc6/Csqq5OtDHh/OZe/miKYr43jB8Jyn5gIVv14P6QQHQ81rUttjuNP5Ksbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd8JT2sWQ6MSwwMJE/Jh0TgqHWZcd4NAzJmLUEiYYSg=;
 b=ki1EbvJkOZDrINH8E5dheLr4677wt3QwjWyvbppOiC2reSqA4Pk/sakalsEVNH0dYLcdrwS0N/Hn0G6Ay2KryRgvLyur29GZdoyrbEb4V4M964VeGmehLADa3Rs7Ork4UHMSAa93RFn8ZeCIipufGJxBqcxM0v3Pi7Fi/mSv6AEenjOuNFKK3eHwE+OncLkRaGDUEY61nvDFIzRKpvKiXU5BDvWoGgILx+RBcMk3SZuzixXOpiVDeVnsZCnFMwmD1S3fo1vQXDBqm4XrGvXrHs2McwTauLKQnjmUQvRVhinMVk9tmShoAgPv1uOP9o3gWbPyyZmaXWKtwGSeTePftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd8JT2sWQ6MSwwMJE/Jh0TgqHWZcd4NAzJmLUEiYYSg=;
 b=AuF9BSE5kUQh9gUZ4VicF1DZuzczQECMdvD/wXmIyaIrtvBUq/N2hqWRqsJOOxGKi0f1R8U4Fn7POHF7w7DmWynclxX6Z3Ci50poXm3bTUZoeYqa42NEuCq2Tv+0Gk47B30DWTVgBZ54cKWOeIesRfBdvxb+5KFyOsGOXtQMUaA=
Received: from CH2PR05CA0006.namprd05.prod.outlook.com (2603:10b6:610::19) by
 IA0PR10MB7301.namprd10.prod.outlook.com (2603:10b6:208:404::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sat, 17 Jan
 2026 00:25:09 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::26) by CH2PR05CA0006.outlook.office365.com
 (2603:10b6:610::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Sat,
 17 Jan 2026 00:25:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Sat, 17 Jan 2026 00:25:08 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 18:25:07 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 18:25:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 18:25:07 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60H0P7uA4102643;
	Fri, 16 Jan 2026 18:25:07 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Jan 2026 18:25:07 -0600
Message-ID: <DFQFQV6K1PGE.22299JJM7Y6C2@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv13 1/6] emptty: add version 0.15.0
From: Randolph Sapp <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>,
	<richard.purdie@linuxfoundation.org>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251223220114.2259233-1-rs@ti.com>
 <20251223220114.2259233-2-rs@ti.com>
 <DF8AN2WTCZLA.1VLMF7YHDLPPO@bootlin.com>
In-Reply-To: <DF8AN2WTCZLA.1VLMF7YHDLPPO@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|IA0PR10MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 842fdea8-ed31-4dbf-12d2-08de555ede8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3NLeS9Fd1FobFFPcnhFbXBGbEFlU1pjb2xGbWEwYlgvdVk4WDRBbzA2K004?=
 =?utf-8?B?a2J4QVJBRU9MeHR4SEZFelhGSmEwU1RITWlLODJTaC9BS1duMC9rNEpjalJU?=
 =?utf-8?B?bTlRRTVNRlFkdGpJQjZWZEJ0RzQrSjNMU0ZpeGthMHptYksxalFkdlA0Tm9G?=
 =?utf-8?B?TUd0TDZHb0UyS0pSUUh2dmN3azh5S0s5YUg4eDNTZGJTTFcrMWJuc3lHZjFJ?=
 =?utf-8?B?SW9CeEdjSzNoT0MwVCtORkgzaDJQVWZWcGxDNml2N1UxRlN4aDg4cEd4aGE2?=
 =?utf-8?B?Wm5mb3p1dE4xTklNWDBya2l6cWJuVmRnMXQvZXgzNXV5RWoyN3FVcGI3SXBD?=
 =?utf-8?B?KzVkMFJMUUx0UzdzcEVCMThmWUw0czUwK05XcUx2YkoreFI2UHBaNHBFNVRv?=
 =?utf-8?B?ODVpVFJlZDRKNmV6VnFxU2NHdXNzcXhEWk05eWEyWE9pQU9xRHVrLzVqdG43?=
 =?utf-8?B?d1BFNUttVW5tMUUwZGpLdCt0dVJkWTk2VnVVSHVBK2FLRUJPMDRvZjJGTFkv?=
 =?utf-8?B?dzNRTnU2V3VCVDJpMlA4KzBXbGZ3VThDcFVvTmNESWVuSjJTVXVFaE5GWlpB?=
 =?utf-8?B?Z1V3QTFjOXc3b2N6SkFKN0tvTkJINjRsOENRYmdoM1EwRnkzQ2pjUFpjbkRH?=
 =?utf-8?B?VmlUYVVST0ZrbkZFWi81SnQvMTFoeERmVFJ5eSs3THlYSnlERHdvT0V6UEFK?=
 =?utf-8?B?RGRFYmE1Y25Va3I2Yi9VSWQ3NzdTekJhUnQ0ckZYNGhpZUdnVWc4L3hwdU54?=
 =?utf-8?B?ZlNsZHpqNEtXWTB5VmxNak5YbS9NVEliWkdFbkEwS1dJTVBteTZ4UGVaVUNG?=
 =?utf-8?B?MTdiclo5US9tdnpBWUtVWHlCdWtid1NtNS9uRTlrZ3hUWkh1OW0vRWFkRjZw?=
 =?utf-8?B?Yk5lOWRzNE1KUDZqVUtMRmtxTndaWXJSRU5JMmx4TkppRnRUajA1L1JZN3Yy?=
 =?utf-8?B?VlFkS1E1NUtJSng5Ymgxa1kwZkVXUngxRnh1UlExckFTK0RzWUhDdXhmTDll?=
 =?utf-8?B?VCtYN1ZsdlVKTVNBb1dwOEN5bXRQZjdpdlV4K3d2UUducjJ3Qm5FR0pZcHVx?=
 =?utf-8?B?RlBxNHBQeStkZlBxbm5IMktDUENYRnFqOVd0UUdIOVUxaFB5d3M2V2cremJh?=
 =?utf-8?B?KzZLRVRKTFo2V2FPUlkvbWRFcVFWRklCaUplRmhBM3dtcTArdlZaYUcxQnBU?=
 =?utf-8?B?RHB4cWxuSDdGLzE3UXczcGVUcS9USjljbEF0bitWdmlTR1ZKVGI3M2hPV0hs?=
 =?utf-8?B?Y0Y4R1lENGkvQkJFeGcyeDJSVzgxQmU1Y1gxRERxTkJiWnlaQ1FSU1VSZVVa?=
 =?utf-8?B?VXBRaDFmS1dRTE9yOHdFWHN0eDdoVGJrLzVCVjNuRU5wOE9UeFRHVEJ5QzVQ?=
 =?utf-8?B?bTZ3bXJpUEhHaXBTSllMWUgweVhGZmtYN3JCaVlCZlZiYjJ4aHZXQnpSQWpO?=
 =?utf-8?B?aHRwV0UrQ3ovUUE4R3JVMXhha3NnenRKemd1ZitFc01mdDgvZFFTY3I5elR0?=
 =?utf-8?B?WktxajkzUTBlaDY2NitUVDZPUjZhT0I1bW9EZVpuNlNQTkNYWjZQVk9ZdXVN?=
 =?utf-8?B?M2RMWnlpVmZxeEtRcE83Z0hRTWJUQmhWSjN4K0hWbjVNd25BUHdOV0swVm5u?=
 =?utf-8?B?U3FKQ1RDOWlvbDUvZVBoOUMwdTcyekl5NHFYbzY2VWU5Q25idlpWcXBmeEln?=
 =?utf-8?B?UzdXbmovUyt4eXk2dktONzFWWFhKK1FLZklOWGZKbWhHTEtCRHdjNVJuemZt?=
 =?utf-8?B?UFE5RlIrTGVEc2l0eUtWOCtKem9qWkp5SE9MSzVqK1NBMVIwQkI2N0J4SGVO?=
 =?utf-8?B?bGxJcmN1c29ROU1VdytTOVlZT3ppenJRbVpWM2F1YjNJNklnZGtPQlZYSFVW?=
 =?utf-8?B?cjRsRU1oV3ZkOTFRZE5xTVJ5dEVYQjZaRWdPODljUUx4UjZmZWQrV1RjNE1Y?=
 =?utf-8?B?blhIN1M2VXJ5QXY2OXN4czM4eDhncjkrcktpVDFsQVhsNnRnNisvU2RDcVZ0?=
 =?utf-8?B?NC90K3doNTdLSm1jWHdPelI1U05QK0R3cVJna3dmY3U2MVI0NWhIS3cyT29D?=
 =?utf-8?B?akRDM3JXc0JaQ0x3SFFqOWJaZUR4d0FsTHlGY3NhalhiK3A1Z0NxTkp1ajY2?=
 =?utf-8?B?WE9LbkhvdzROemR2WGRtSi9ieGkwWlV1R0ZyNkE0OXcvSEYxTG90bHB1Vlg4?=
 =?utf-8?B?OVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 00:25:08.1297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842fdea8-ed31-4dbf-12d2-08de555ede8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7301
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jan 2026 00:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229570

On Fri Dec 26, 2025 at 10:37 AM CST, Mathieu Dubois-Briand wrote:
> On Tue Dec 23, 2025 at 11:01 PM CET, rs wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
>> relatively lightweight display manager that supports x11 as well as
>> wayland through both a CLI and an automatic login mechanism.
>>
>> This can effectively replace the custom init scripts for both x11
>> (xserver-nodm-init) and wayland (weston-init) with a single tool with
>> more verbose logging capabilities.
>>
>> This is split into two recipes. The emptty package provides the binary
>> and various agnostic configs while the emptty-conf package provides the
>> default configuration for the application itself. This RPROVIDES
>> virtual-emptty-conf, allowing other recipes to provide their own
>> configurations to override the default behavior.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>
> Hi Randolph,
>
> Thanks for your patch, it got way better.
>
> It looks like the last error is some reproducibility issues:
>
> AssertionError: The following deb packages are different and not in exclu=
sion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty-conf-dbg_1.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty-conf-dev_1.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty-conf_1.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty-dbg_0.15.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty-dev_0.15.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty-doc_0.15.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty-src_0.15.0-r0_amd64.deb
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-ext=
ended/tmp/deploy/deb/./x86-64-v3/emptty_0.15.0-r0_amd64.deb
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3100
>
> Diffoscope output can be found here:
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20251226-g95kquv=
4/packages/diff-html/
>
> Can you have a look at this?
>
> Thanks,
> Mathieu

Well, it appears to be an issue with cgo applications as a whole. Bug raise=
d
upstream.

https://github.com/golang/go/issues/77218

- Randolph

