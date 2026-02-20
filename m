Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6800CC531F8
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 01:26:28 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29651.1771550778879484330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 17:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PvSyivFn;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.48, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZeq1BWKF6zPggOg7bDFvtZAMkumTP/zdnCHTGo3sqa9ca9sqDc9lbJvk+qaZW/T+RDLspGAsWnniGH3gTOYC4sUymCIVw/rjWgRa/5awJVeGkySWA2jdT2/8J0CRP6wCvSQjheRgF1LCWprcx/Hs78JZtfWjBPifnXlfozNJJYOheKRE51DA/8gksZ5ve1ztxCWuFkdxls3swohoUwG7mOTY19/fFfSoIp78FqvU6lze5S208jGaxxQQLECVYfUxDgkEtCwD3BngaaQ2e+1XqaAye9QmW0TXfjzd7tFy6xKRDE5i8ZttBZi2mtvjsQGkQWYhcMkyIqpFfxJsy/k+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPQuTpRc3e6oI1e9v8oq6fMi3xGF+L8PjJSWoTbhL1A=;
 b=PdBUQO6dzEHiMftbwkvCW9uF5UCbcU5g+cnpH+0Tm7DdqHYyKkuaZYiowX0ynjah1uZzIg+rJS7BMJ3aQxinO/tYlH9Bb6mYzEMbiwkgY5IhHxUmtz6zqpq2QrWMFSzJcg2N/vDqD6XzU8VIFwPr+MXLzpmFCTplechMnHae2xq7+FQUsh60cKpkKltvxuYIKxwe+Vwj8HH5IK7+K3lpM27apID4zqq/XBKfg6SDW/yXhrxctBIqxVUDIZCfdBXNY3RXzCYRABZo39bnMSsRGXUDWeNLFYpcC0OfsWrXc+cZSvQ7l7zq25rhHo7rAi/WAwiX6VsZYpaYDKJA5GcRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPQuTpRc3e6oI1e9v8oq6fMi3xGF+L8PjJSWoTbhL1A=;
 b=PvSyivFnoNlCKsOdAxBHM5enp4jxQojLoF4OKgRTzXpcTFG4/4HMleyQSgp4qUsZ3KmiMN3KNB3WfC+pSzBGiJGyXG0PhQ3AzlWe9QH0FooYft/mm4pN/554eFcByG3RCYUzHRGjPf2eWsW7LMZyRe1r/ejcq5ZqXnUG+e3miEE=
Received: from PH0PR07CA0097.namprd07.prod.outlook.com (2603:10b6:510:4::12)
 by MW5PR10MB5808.namprd10.prod.outlook.com (2603:10b6:303:19b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 01:26:15 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::71) by PH0PR07CA0097.outlook.office365.com
 (2603:10b6:510:4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 01:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 01:26:13 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 19:26:13 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 19:26:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 19:26:13 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K1QDXr3507117;
	Thu, 19 Feb 2026 19:26:13 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 19 Feb 2026 19:26:13 -0600
Message-ID: <DGJEC61AKA7H.8KGAM5Z75OBQ@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv2] reproducible: fix git SOURCE_DATE_EPOCH
 randomness
From: Randolph Sapp <rs@ti.com>
To: Paul Barker <paul@pbarker.dev>, <rs@ti.com>, <raj.khem@gmail.com>,
	<richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260217200105.2234389-2-rs@ti.com>
 <e745402979f61ca6710e44b2116c6485ca0484ff.camel@pbarker.dev>
In-Reply-To: <e745402979f61ca6710e44b2116c6485ca0484ff.camel@pbarker.dev>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|MW5PR10MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: f62c90a2-9d14-403f-79bd-08de701f0984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDRBM0laMFl1M1hPQkhlU1BSdVp3QVJXUXZ4MDhaaWJ0SS9KaEdNdDZEb29o?=
 =?utf-8?B?TldvbXIvNGZFb3lDVkhVMGU1OWdRQytRenRibEFOaG1RQVREdWRFcGo1VDRm?=
 =?utf-8?B?VG04UGRVRkZ4SlR6SXBYdHVhaVFBOGt3RzVIOThYZEVDTkEyY1ZBTzkyWUtD?=
 =?utf-8?B?TXBxaVJMVmc1RXRtbjY3R254ZFZiUVMrRGFqdmxVZ3FuS2tlOXV0dTlTWnNy?=
 =?utf-8?B?dFNOL09yVjVPQkFWQkMxdlJKYk5KRlA0dE9nSzh4U0p2S21SUlZVMXN3OHhU?=
 =?utf-8?B?MjkxbnZDcU90RitWRGE3elRNS2JFU2tSbHFYTUVnTXRjekQ4YWhoZDBjSHI0?=
 =?utf-8?B?eEtyc2VtUThhNllzNHJUMysxQ0JwUWlKRURZNWtwMm5OcG80VDU3d3FNYWox?=
 =?utf-8?B?VUpHVmlVdjJBeVFXU3NoY3lhNFp6Skk5b21KeFZHZUc3eXo1aTFzL0ZyNTdO?=
 =?utf-8?B?TlU0a3g0MmZURVdtMzJYYmNUM0s0cmRpMHE5L2t5akdqbUEwUmZ2dnZMWXBx?=
 =?utf-8?B?cERMQ2VDajBrRlkwdWhkM3JlTnM1NENPVUF2b3dkdU1ZU2lma0lrWElCeEQ5?=
 =?utf-8?B?VFdDdHVaMjRRS0pVeUx4NE9vSDAvVzhqUDJLczlLeE0rRExvWmhXcHk2THUy?=
 =?utf-8?B?WW5LRzF1cmJLZ0R3aHo0WlNSMkVZUHRQZU5MdHd3NzJMZktrQnRJcWhaWXhH?=
 =?utf-8?B?c1AxMlVvbVExRVVjZVNPaU82UStFYkE0bkNvaGhma29ZYWhuVGJ0L2pQUVJT?=
 =?utf-8?B?ZXliQ2VHVHZrYjRjK0MrVytBdDR0bTZGQVpYVGVJa0JVTUxzSitsd2EwdnBk?=
 =?utf-8?B?S3F2aER6b2U4ZEFaRmdYT0o3T0pablk0d0U5UzM2MEJ3YnBIbk01T0p1T3Jo?=
 =?utf-8?B?UVNKNnpEZnQyandUK1V6bzZnRGUrRUNZZHlhMEtFQVYreEtoWlBXSHk5dWJp?=
 =?utf-8?B?QUFDMy8yZGdFNW1hdnRjQUFhTSt2L1ZxeERTZVFqbitIdldaanlSb1dEekpP?=
 =?utf-8?B?bVZ6YVYvdWE4ZTJSanl5Z1lDa1Y0NWlBVGRhMW50dXE2VkFEcTBoVjRUMkNY?=
 =?utf-8?B?WWNDV2FKQmpjSFFWdUlNcVlpSmdVelJRN291Y3FUMm94NDZFQURvTWlJL3dZ?=
 =?utf-8?B?UlBLRmU5TUhVRys2VE1WcFBNZk9YdytrZktuZlpFdVo5MStRUHFEanFvOG56?=
 =?utf-8?B?VHdXS1JoRjQ1emQzMkgrUWlJRmRmWWlHdE1QTGpSdEVYR2l4MFlFcis2aDB6?=
 =?utf-8?B?N2hqT2JDU3VROG9hcFZmSnZTTWlEQWJpd3ZURWVvc0dXSVBjWldkaWtnM1NK?=
 =?utf-8?B?a1NIaUpiMlRFQjh5NUFPTmpYNEFrMWZpd211ZU9hWHZ1WXJUNWVCSGJVK0FX?=
 =?utf-8?B?SmZKdE9LcmtQTk43Q3hJTy9BQkE2WGRJaU85bUsvZ0R0QmRRRHA5bXZFbnNG?=
 =?utf-8?B?WS8xSldXY1duakdxb3VBaklQM01EM3RNK0J3bVl0d3N0WDhPSHlPSk02aERO?=
 =?utf-8?B?WnBscThoZUJBc0NPZG80NkN5a1VQZWVMbVFIU2dNaVR4cWNvSWkwKzFVWE93?=
 =?utf-8?B?SXErRGVwbHZ3MFVqMzd4SWhrUURCcC91UzlIVFVFMXVNd29jejdYWnZ1WDY5?=
 =?utf-8?B?SVNNcnlOUGVSQWtZb0lIVTRaOVI0WFZacUVtbTlZa2w5Rm5KWXpRd1Ztay9j?=
 =?utf-8?B?NmVqNFlwU3lSUTJKVTlRMDlld3UxV2srOC9NbHgwZlFLb2NTZVArOXJweDR5?=
 =?utf-8?B?SVh5MkRLTktMYzFXVFlzd20yQ3pTcjFpR0FCR3RDMGt5WTNWM0ZxTmRKc1h6?=
 =?utf-8?B?NXhiR0ROL25Sc1dMZlh1a3hwcWxEakUyVWM0L2RtelU1cktuT3NsNFpQT3BU?=
 =?utf-8?B?aEJaYUc2QnVyamNBalNhOVBEZzMySWYzUWcrZEt6Q1JKS041SmZRenhiS0F1?=
 =?utf-8?B?NSttb1Y0ZUVObFdDWU5aRlJIVDZQZ05ueWtrTTFLeUNGamhiV2Z6bmRxYmhL?=
 =?utf-8?B?QjJoS0JoTEFxVDFLM2tRUkluTm5Xek5hZStzVG9KY3JDUTRiSCs2UzFpZG1X?=
 =?utf-8?B?S1llNjFjcFB1QUxxUnhDMy9hbHRuOVNIeW9TcUFNSzNaQXlVK3VsUGY3OEls?=
 =?utf-8?B?MjVFaTBVUTdKVVpVYzFvMjB5dUIzK3oyTFViRURmY1ZxSFhRWFRKUFFDVWVV?=
 =?utf-8?B?OUgwd09KdC9yODJ1SmpmcnBYbnpSZzdLWHNuKzFrWUNUTkdIc0psVWNnSzI1?=
 =?utf-8?B?NWJsRHN4eGlhTWRMYktsVUhYZ2pBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	n3+xe1+ckyGncMzv96lxbR2XV4YmgElH3hj1knoPRC5/Jd96GrrM4CxTxicrLHC6Xhmg1viiaAcEDozj4SAsV1pLfqCe6rQIIyYP2tijx1do8QQyPPOcrFBUz7fbf4jIldzjITyYH2PQ6ebI4VA7Ye6i+dSFytvOfCwb+jSBy5hVTdW/lQNlCLICr9CDejPrI4DnN3U8yILSuLCmfnazCl/46/GK9/aVuaPNkjMfuLVAcBies2E6nTtrvyg1vcsuLAqRjfk7gh045p1mUQ1ZtY7CdhPqt9vxAMfjgYBVZi3aTZOjw94/jeEl1dunanZNsOE73Gp2aWLCS6sHU/d3hdQFq5WMavMnyzVttojHtSfzvKYqFShLjGJQa/1ce5YviynQbh/6nk2+aIqF+d4paWaKJER/FS26d3LgDTWKxuVuf4OFbciidHoCz0M36qBS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:26:13.8440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62c90a2-9d14-403f-79bd-08de701f0984
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 01:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231446

On Thu Feb 19, 2026 at 9:01 AM CST, Paul Barker wrote:
> On Tue, 2026-02-17 at 14:01 -0600, Randolph Sapp via
> lists.openembedded.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Anything that defines multiple git sources should have the largest value
>> taken when calculating the SOURCE_DATE_EPOCH for a package.
>>=20
>> The previous iteration actually introduced some degree of randomness, as
>> it would stop on the first git repository reported by os.walk, which
>> does not assure any specific ordering by default.
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>=20
>> v2: Use os.walk method as opposed to glob to avoid infinite recursion wh=
en
>> navigating symbolic links
>>=20
>>  meta/lib/oe/reproducible.py | 63 ++++++++++++++++---------------------
>>  1 file changed, 27 insertions(+), 36 deletions(-)
>>=20
>> diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
>> index 0270024a83..c58db48fb1 100644
>> --- a/meta/lib/oe/reproducible.py
>> +++ b/meta/lib/oe/reproducible.py
>> @@ -74,52 +74,43 @@ def get_source_date_epoch_from_known_files(d, source=
dir):
>>          bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
>>      return source_date_epoch
>>=20
>> -def find_git_folder(d, sourcedir):
>> -    # First guess: UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX
>> -    # This is the default git fetcher unpack path
>> +def find_git_folders(d, sourcedir):
>>      unpackdir =3D d.getVar('UNPACKDIR')
>> -    default_destsuffix =3D d.getVar('BB_GIT_DEFAULT_DESTSUFFIX')
>> -    gitpath =3D os.path.join(unpackdir, default_destsuffix, ".git")
>> -    if os.path.isdir(gitpath):
>> -        return gitpath
>> -
>> -    # Second guess: ${S}
>> -    gitpath =3D os.path.join(sourcedir, ".git")
>> -    if os.path.isdir(gitpath):
>> -        return gitpath
>> -
>> -    # Perhaps there was a subpath or destsuffix specified.
>> -    # Go looking in the UNPACKDIR
>> -    for root, dirs, files in os.walk(unpackdir, topdown=3DTrue):
>> -        if '.git' in dirs:
>> -            return os.path.join(root, ".git")
>> +    git_folders =3D []
>>=20
>> -    for root, dirs, files in os.walk(sourcedir, topdown=3DTrue):
>> -        if '.git' in dirs:
>> -            return os.path.join(root, ".git")
>> +    for mainpath in (sourcedir, unpackdir):
>> +        for root, dirs, _ in os.walk(mainpath, topdown=3DTrue):
>> +            if ".git" in dirs:
>
> Do we need to add handling for git submodules? In submodules, '.git' is
> a file instead of a directory.

Is there any way for a submodule to have a newer commit date than the paren=
t
repository?

>> +                git_folders.append(os.path.join(root, ".git"))
>
> We should change this to `git_folders.append(root)` (see below).
>
>>=20
>> -    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpack=
dir)
>> -    return None
>> +    if not git_folders:
>> +        bb.warn("Failed to find any git repository in UNPACKDIR or S")
>> +
>> +    return git_folders
>>=20
>>  def get_source_date_epoch_from_git(d, sourcedir):
>>      if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getV=
ar('SRC_URI'):
>>          return None
>>=20
>> -    gitpath =3D find_git_folder(d, sourcedir)
>> -    if not gitpath:
>> -        return None
>> +    # Get an epoch from all valid git repositoies
>> +    sources_dates =3D []
>> +    for gitpath in find_git_folders(d, sourcedir):
>> +        # Check that the repository has a valid HEAD; it may not if sub=
dir is used
>> +        # in SRC_URI
>> +        p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse',=
 'HEAD'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
>
> Using '--git-dir' does not set the path to the worktree correctly. This
> may work, but it's fragile. While we're modifying things here, can we
> change find_git_folders() to return the paths of the repository roots
> instead of the .git directories? Then we can use 'git -C path ...' here,
> which is much less likely to have issues in the future?

Fair enough, seems like good future-proofing.

>> +        if p.returncode !=3D 0:
>> +            bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath,=
 p.stdout.decode('utf-8')))
>> +            continue
>>=20
>> -    # Check that the repository has a valid HEAD; it may not if subdir =
is used
>> -    # in SRC_URI
>> -    p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'HE=
AD'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
>> -    if p.returncode !=3D 0:
>> -        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.s=
tdout.decode('utf-8')))
>> -        return None
>> +        bb.debug(1, "git repository: %s" % gitpath)
>> +        p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse',=
 '--git-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
>> +                           check=3DTrue, stdout=3Dsubprocess.PIPE)
>> +        sources_dates.append(int(p.stdout.decode('utf-8')))
>> +
>> +    if sources_dates:
>> +        return sorted(sources_dates, reverse=3DTrue)[0]
>
> Can we use `max(sources_dates)` here?
>
> Best regards,

Yeah, my bad.

- Randolph

