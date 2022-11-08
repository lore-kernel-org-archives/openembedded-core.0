Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0895C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 11:35:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.46])
 by mx.groups.io with SMTP id smtpd.web11.6758.1667907332296408229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 03:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=67PJwbOx;
 spf=pass (domain: arm.com, ip: 40.107.22.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CsP0VSmUQzjj33dVvIwKn8/efgKW15RIqkXan/89aiT8UmhfUonaEwSQe7atX6sE3yczVA30axieqcJ+rLqIw7tnt1KzXy4pzQTBnn/dLqPMZToXFEIhIEiDMpUyN8ynPP7ItL0qbuZ0VirmMA1KpXFBTKu8AOaJsPpxx3/T6fPD20jOoi6N4pp7UqjNm2+3FcYLL8zHPtvFBqnFoCIJgZAY1x5a72QtUVNRX4j69C5uuJqL4/L/7S/UwrEiB7PmnyDN7quh9SumOPIaPuPmcL0nsmbdikeZljAjAHZF5kTn36lnho4VPSKyaEDElxV8vvIwkMaxIUI3/L4TLgK/Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eJO/Iz3uMJ4mXR0Ky6FLqNJFjJIIXe8O/1tmb1DgIc=;
 b=YaeE9OYKxSXQaq5IupSSWqlHPCePaWPoE9Z8LEe4Bhvc4Oc3cT+mbJE3uewX0yI2bo9tUwoKRXdbqpZeoQ9kzNSyTwJmlDAMW5ZZ/+Z90f28976UX6tdsVRyN045ilJ/ye5CvOMkvStnj3u5KepnjOCWTS6sShqPCh7pP5e6qTwxXPR5eUVMHeEy44grhKrdLQ8Lh6/yh7crZZMJ04IPF7P3tgf2hfXIwdQcGp1V+b0EJ0kp8wQIFs76U9VltvvmG/qdcZkHiID/8OU7yDto4uvHoW97B7TgWcoF1j9MGslGJkUHft8vPvarFkM7eYRPbfquoQugL1LvryM5QuvhUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eJO/Iz3uMJ4mXR0Ky6FLqNJFjJIIXe8O/1tmb1DgIc=;
 b=67PJwbOxsDjo/L1dCxKSJkR+xpqwF//TWwLBB0tvFJo2DpEhlPFs3ezbwpqxcxowOvUlIG54ieKwHkqNs8jPzCcv+afBOzLmhRnDhBLnJFriEYJ3EWYkDX7qf3ErBh1CF3kq9MmISE2a02c+u2bx99+DsQ2szxYWlJbcjhogpic=
Received: from DB6PR0202CA0004.eurprd02.prod.outlook.com (2603:10a6:4:29::14)
 by GV1PR08MB8378.eurprd08.prod.outlook.com (2603:10a6:150:a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 11:35:27 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::f5) by DB6PR0202CA0004.outlook.office365.com
 (2603:10a6:4:29::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Tue, 8 Nov 2022 11:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 11:35:25 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Tue, 08 Nov 2022 11:35:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90f288ab2be44cd0
X-CR-MTA-TID: 64aa7808
Received: from 61287dd94c3f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9EA62F6D-8D6E-4D0E-968A-6F8E748F29B3.1;
	Tue, 08 Nov 2022 11:35:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61287dd94c3f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Nov 2022 11:35:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArEDXZCX0eAqNmGjBRqoWxgraM9XMz2SJZMZ5F2pnxHFSBTlW/6OHWz4G6kbAhH2JIhXwxhM0nlZpof/rTg26amCel9glrd6uOvZLvvxn1AO4QhZ0PD1iQDzXPbav0FkHcq+W0NcenYvnNmFTneOSlmWZCds0Dw9UHBG213kNXKnvxYvkfUZq0JLp+f92I8eC986yGmr9GBc+y0w7Y4b8iQcowGmKoze2De4J4+3OoJzaQqS6+SDF0JOK9D8zN+1vMhNqXDwUhV5WJ1q7Kiq1kHvIVA90n0lksYgn8X8Xh4ZCsBdzhaJIvquCmcbChJ8qDmTZ6STQeTYDOknBpnQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eJO/Iz3uMJ4mXR0Ky6FLqNJFjJIIXe8O/1tmb1DgIc=;
 b=DkkrgLV3LYtBxr45ECDEpLrvTMKApQYhvyt1YHrgsp9kcH7J8YtVyl20vCR3mvkM6qTxf0w/jY+XdG+M1Qqgy6mCE38D1VCxeJTyNVv/QSp6lLUmnnojX0DVsOvUp0MHSPtPe9v4kQzcIGqKngjfs5dUKtlBjIw7MHiriMdgiAZKfVQwxaR7ZPTpMbEi7KcVdixxkJJNck1lJLak0y3TRfXaLX8S0HcYqkBQisObambGosjAGGy+odUw+jXvn/a3M30sS9W0qWksEhrvJKe/aFRpesNsawq6adKdKqSBKp2I5OLETBhe88Mgw4c5fprcpNfH3PTspAAnUM2pkz02WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eJO/Iz3uMJ4mXR0Ky6FLqNJFjJIIXe8O/1tmb1DgIc=;
 b=67PJwbOxsDjo/L1dCxKSJkR+xpqwF//TWwLBB0tvFJo2DpEhlPFs3ezbwpqxcxowOvUlIG54ieKwHkqNs8jPzCcv+afBOzLmhRnDhBLnJFriEYJ3EWYkDX7qf3ErBh1CF3kq9MmISE2a02c+u2bx99+DsQ2szxYWlJbcjhogpic=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8900.eurprd08.prod.outlook.com (2603:10a6:20b:5b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 11:35:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 11:35:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ezhilarasanx.s@intel.com" <ezhilarasanx.s@intel.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sudo: backport fix for CVE-2022-43995
Thread-Topic: [OE-core] [PATCH] sudo: backport fix for CVE-2022-43995
Thread-Index: AQHY80xacLNq0Ao6jkeZJpHu1VtZPq405bEA
Date: Tue, 8 Nov 2022 11:35:15 +0000
Message-ID: <2A1E3276-1EB0-4C5C-82D2-1C3A497C4100@arm.com>
References: <20221108082912.32560-1-ezhilarasanx.s@intel.com>
In-Reply-To: <20221108082912.32560-1-ezhilarasanx.s@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8900:EE_|DBAEUR03FT048:EE_|GV1PR08MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 791da83a-4a7e-4222-3513-08dac17d5489
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SKlCMN1CDrs01MhkvnG/NrckpfGUnlGoxSx4OjrlkLAFpcmcmoEf1RYnbXO63bMd3hBC7IgewMgwyWv3GqIg1BMWQUv8rI8cBZg4XFajWub+z6gHI7JKRJfgyeDMw4Lob5ZYqS5IWbDnqgtewfktaiP1kVVKQBnM5awcYaKmjeXAYzKtOfPbF3PDYz656l6Nno/6rfztYwjHLQ/YojtUqlOPPy6Sbvo+x5KMcCwIIioU/MSCF+v80ti5GFAjCJ6o2rdqK4Hew+16+RzpCEusjR1CPNdCABqz6gOKDTNQwjzzlsJ2Fw81hmuwlm0iB6i2VSG/rWMtUOULF/V+i37GaqzZ7SKvX3w7nCiZARtSdzHqx1ZBbRTIK/Pu3OvUcrG6ynlg0HUfQitI3BuZ5gJ2c1xkHlESYJNh9iI/MKqgLceCtNDYjqX3ckQD7GHuIUj+mwRf5+WfEJGe9mhRTGP4S/ArPH/SSoWP9KkicCJv/DvnySTWklpwyfYhOT3pqsDHCiZuep9cZGOm0hWJHmVfP3vEN0f7aoN0p2oZU2athZis95jKnfptuHs0/c6xUP1Drtvs+saNOPwrDWhqjcCsilHpqBDtEHdwLsk0iS7UpHHpsHizPsCfhGweHqi5GosW+p+8X/Nl2M6W5ekWOVAtv1gfJhOBiBzVtxdU/vTLff2kTvYjRJkhSWH9xa7NwcgEXm1HAwSh/0dohywL94dMd0z1V/aCpJGWNezKPHfB6JRhCpaGypnwBiUrTGKpcGehy5qrO3wP4Pj/vjoe8uyg98h8LozQ5MdpDUqlO4kM9d11crKqYchjf+kpYIdULe9UxXE2pLOst92dxV79kSc23A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199015)(33656002)(8936002)(38100700002)(41300700001)(316002)(66476007)(76116006)(91956017)(66946007)(36756003)(2906002)(2616005)(5660300002)(83380400001)(6916009)(186003)(8676002)(6486002)(38070700005)(71200400001)(478600001)(4326008)(64756008)(53546011)(966005)(26005)(6512007)(86362001)(66556008)(66899015)(66446008)(6506007)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A8AADC937812D479E956783182411BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8900
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eb5f3e42-2721-40fe-ff99-08dac17d4e54
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UgT3CGLC2Odu70v/ilAuAVa+n3xNOEoKpw0Nc3RBl8DJThwQbTswerWYF7H/ILlbCr5la23rU60nAlR8i/HdnYgYHRXbLMNIJdvabvp6YusyRPoDFc9VAhg7IJkkC06SNlbq+cEOpkifnQeJAnscxXCiVhBz66H4JDXvwQdIEdWE4MPSw5UOBnK/WmAaXzL6BZACDD3M1BLWbJAXZQ1GY2bV/60v1FE7i1rPloC2xwv4lOaz9pn3NiDifJhOTuwOligrD2U3X599BHvcpFJZo5pHVqfY53s87ZjoQ4bxeGvzKbGnOsJxkthFjMmOaTfYMuTaLL7cN7y5X10ckbNmP33P4hjY8HabP/F9xUyoFCiPyb1PHqqpNsM34Dr4HaFB5o9miFrEyzwDSxNVHofeTbkfNMD5UZ8Tct44SumVaRLwcJ6ApMjmJc97nXbj1YNHsIC2E9C3MkakUwbcrev2wLI1XbS0FWmlxFRkWUXN+gXuTS3E+SN7bRHOncCzAGvkCQnm+McKnAA33HgkW47hRvC+WQB66vEl+hohFGzmMs2+cApDtloI91CSXYNannNlaLYgifyNZDrZkgPahZn1IeDPB5fSZV0xkpfiB4zA4cTMPg0SjdglCjQg325LLSw4jE58KsJ19r73jeXFY/JhPv61F92XgZRAwYe+BbVwyveCVtcgKBiaggd6q6eDZiDFNOIfmLKRuZV7K5EDOjPXeWVKOEIgvn/vDzptApKkBov73HzBTqy8dNE7MDnfVHMN1XMhM7zl5cu8tLBB6bNWlusuLS2tT2Q4OLt5UDb6bTA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(966005)(70206006)(8676002)(4326008)(82740400003)(33656002)(316002)(2906002)(70586007)(6862004)(5660300002)(36860700001)(36756003)(6506007)(6486002)(47076005)(81166007)(336012)(53546011)(186003)(40460700003)(40480700001)(478600001)(2616005)(6512007)(86362001)(356005)(83380400001)(8936002)(41300700001)(26005)(66899015)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:35:25.9541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 791da83a-4a7e-4222-3513-08dac17d5489
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8378
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 11:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172960

Thanks for these two CVE fixes, but note that master has had upgrade patche=
s already posted by Alex Kanavin, and I posted the CVE fix for langdale.

Ross

> On 8 Nov 2022, at 08:29, Ezhilarasan via lists.openembedded.org <ezhilara=
sanx.s=3Dintel.com@lists.openembedded.org> wrote:
>=20
> Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel=
.com>
> ---
> .../sudo/files/CVE-2022-43995.patch           | 60 +++++++++++++++++++
> meta/recipes-extended/sudo/sudo_1.9.11p3.bb   |  1 +
> 2 files changed, 61 insertions(+)
> create mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch
>=20
> diff --git a/meta/recipes-extended/sudo/files/CVE-2022-43995.patch b/meta=
/recipes-extended/sudo/files/CVE-2022-43995.patch
> new file mode 100644
> index 0000000000..3929f32e9e
> --- /dev/null
> +++ b/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
> @@ -0,0 +1,60 @@
> +From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
> +From: "Todd C. Miller" <Todd.Miller@sudo.ws>
> +Date: Fri, 28 Oct 2022 07:29:55 -0600
> +Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwor=
ds < 8
> + characters. Starting with sudo 1.8.0 the plaintext password buffer is
> + dynamically sized so it is not safe to assume that it is at least 9 byt=
es in
> + size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-43995
> +
> +Reference to upstream patch:
> +https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae33=
29c677d48050
> +
> +Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@inte=
l.com>
> +
> +---
> + plugins/sudoers/auth/passwd.c | 11 +++++------
> + 1 file changed, 5 insertions(+), 6 deletions(-)
> +
> +diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd=
.c
> +index b2046eca2..0416861e9 100644
> +--- a/plugins/sudoers/auth/passwd.c
> ++++ b/plugins/sudoers/auth/passwd.c
> +@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
> + int
> + sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, stru=
ct sudo_conv_callback *callback)
> + {
> +-    char sav, *epass;
> ++    char des_pass[9], *epass;
> +     char *pw_epasswd =3D auth->data;
> +     size_t pw_len;
> +     int matched =3D 0;
> +@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, su=
do_auth *auth, struct sudo_c
> +=20
> +     /*
> +      * Truncate to 8 chars if standard DES since not all crypt()'s do t=
his.
> +-     * If this turns out not to be safe we will have to use OS #ifdef's=
 (sigh).
> +      */
> +-    sav =3D pass[8];
> +     pw_len =3D strlen(pw_epasswd);
> +-    if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
> +- pass[8] =3D '\0';
> ++    if (pw_len =3D=3D DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
> ++ strlcpy(des_pass, pass, sizeof(des_pass));
> ++ pass =3D des_pass;
> ++    }
> +=20
> +     /*
> +      * Normal UN*X password check.
> +@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo=
_auth *auth, struct sudo_c
> +      * only compare the first DESLEN characters in that case.
> +      */
> +     epass =3D (char *) crypt(pass, pw_epasswd);
> +-    pass[8] =3D sav;
> +     if (epass !=3D NULL) {
> + if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) =3D=3D DESLEN)
> +    matched =3D !strncmp(pw_epasswd, epass, DESLEN);
> +--
> +2.17.1
> diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb b/meta/recipes-e=
xtended/sudo/sudo_1.9.11p3.bb
> index ba610ee2e7..fa9cf48196 100644
> --- a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
> @@ -4,6 +4,7 @@ SRC_URI =3D "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
>            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}=
', '', d)} \
>            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
>            file://0001-lib-util-mksigname.c-correctly-include-header-for-=
ou.patch \
> +           file://CVE-2022-43995.patch \
>            "
>=20
> PAM_SRC_URI =3D "file://sudo.pam"
> --=20
> 2.17.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172953): https://lists.openembedded.org/g/openembedde=
d-core/message/172953
> Mute This Topic: https://lists.openembedded.org/mt/94886337/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


