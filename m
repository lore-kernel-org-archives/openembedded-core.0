Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12DEC4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:18:13 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.66])
 by mx.groups.io with SMTP id smtpd.web11.8831.1699359483467171182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=23t63VrA;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=23t63VrA;
 spf=pass (domain: arm.com, ip: 40.107.247.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HcXSIGdA+7rCxJBMNIHbyYPXowYkwtmMAQ33amMMi4LAzKpwdLVM5N/LyY4t9sltbwN5P509yV0nt6yHVggzYY47pTOmi3bmlQrYaKxpHNACNS/V2MLwm8R4AKn8GUhO7SHbkzVEUNZ7fHbhIgXEvej+1AFEniek5am+EchfFftJnPkeKKjnFXbtdPjy6nAmGRnunDWn1Zuekxrk5QpGXgv5pe0UBUlgt77JjZZWAaY27saYUSlh9++tKuTMrHwxeKxPntp6g31LhIuO1ZsPiHauhT81ewdT+Nb+9TRCUEu/+N5bX2EV5A75aVnmKj9cp8TNla86Mn3XC9Z3p0DtrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM7/QgTXXDOHLPS6UklMENq2mBqY3Zbz6J1TwvDeGB0=;
 b=FycI54PRURdkhwPG2LDJxFE9rve+XnEzwlQOonzdRiQmI4Eh2Ecx3ohgB/aY4J0GFh4vbsXPtzcWMEqdvtGdMS9V8mOpuTuT6xA4+uhMebDy4xdCF9mIburd8EkKqjE0xmiVrFV9KZwdoddHgJaUoEcL2W/JQbcmNAOimbnE+wJq5pPm+IQ3FVMh2V9mpkhwsW4/J+r2tJNPbIVhYaViA5IhLOa+XQVuTsvnGL8nzXBgvT5kktKgmEkB9BKeFXd63Fjh7dLJN1RKy7fDdtnlilmGifEjHIT2Mz1KqUx8B7/XKbq5VsH12hbMfl3/Fv0vb2eS0GbAyo+g+yfSthHqfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM7/QgTXXDOHLPS6UklMENq2mBqY3Zbz6J1TwvDeGB0=;
 b=23t63VrAGAF9VTvOVQSLCUuRfJeIMX7my7fi82kjB6uSUdUrLb7v6lqkPNV++oOsiCTsMB/ltCgXpHMzXwNOvfGB/h2MmzS4ZlzqeEbQZLnk1NgddxLQBGPyXCR/rj5tm6e/xXhIonfMzonJByGvo97wD2NvcBGvp5LtUrKfTYs=
Received: from AM6PR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::28) by PAWPR08MB9759.eurprd08.prod.outlook.com
 (2603:10a6:102:2ee::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 12:17:59 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:20b:e0:cafe::44) by AM6PR01CA0051.outlook.office365.com
 (2603:10a6:20b:e0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27 via Frontend
 Transport; Tue, 7 Nov 2023 12:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 12:17:58 +0000
Received: ("Tessian outbound e243565b0037:v228"); Tue, 07 Nov 2023 12:17:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95d0dd1715400e51
X-CR-MTA-TID: 64aa7808
Received: from 2a66dbac4daa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 59EED1E3-7086-495F-AAFC-6EB8E585A798.1;
	Tue, 07 Nov 2023 12:17:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a66dbac4daa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Nov 2023 12:17:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fThu2aWmJxhTZDJ/VDvZeVuRsvHYqyDRp5TcZfBeID0Mk6sjPHNfZI8wt/SbL3Zs7TE3FsAAodgI5pcI4Bqj0YclPU6NcoJ2VDlRz3LowiqMiHorEVK7qtnDxpfZAi/6Cp0siOHpH5C83SakyCsu9MkM82HjkIc7pcbRNyVN7xhmpkcjDwkH0djQdE/kT9VRnRx/ofO3wnFR1dscC9jvkOEm1XVKBPnNc0jQeQZkgOj1gdLzXJGG0SHWpWOSiF1gYnEwONgWLyQVMfs7L/BGKB+eBxQWR6PcXvXjQ2l5IMSrA8FD6SDLnA4qhpoH4asK0qve1uk2mTggqTbJwtMHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM7/QgTXXDOHLPS6UklMENq2mBqY3Zbz6J1TwvDeGB0=;
 b=I1dB+0K/2aqWNn9mppQm2qI7v1pzedo52i4j5BG5JU+GCwZNjN3mX9ybV/3s13FYHxf8pinAWzDuwF5eSkUmm5yqsD84MbZpxHW3Uh/OQnWAhHjz83oa5i6Arqq0sq5/8YVrFOW4SDkKJNJkv8/6Xjo6TP7EFX1zrSN0txKuz0eQIh4AbeEDDX91Nk6vGKIsfcQnLn8l7ZHpbLq3sm5ePPcsTb2i1fSP6Z048MAf5X/753QCq/o90f9hHNo8J9wTzfL+Pbj4DrjSjttEhkY3/waeaiP/gnTIOSxkKPojwiklhRpJjxvSJZhfJeY80scchyi4Z0VMXZgK16RwcAxgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM7/QgTXXDOHLPS6UklMENq2mBqY3Zbz6J1TwvDeGB0=;
 b=23t63VrAGAF9VTvOVQSLCUuRfJeIMX7my7fi82kjB6uSUdUrLb7v6lqkPNV++oOsiCTsMB/ltCgXpHMzXwNOvfGB/h2MmzS4ZlzqeEbQZLnk1NgddxLQBGPyXCR/rj5tm6e/xXhIonfMzonJByGvo97wD2NvcBGvp5LtUrKfTYs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6175.eurprd08.prod.outlook.com (2603:10a6:102:eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 12:17:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 12:17:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] xserver-xorg: Fix for CVE-2023-5574
Thread-Topic: [OE-core][master][PATCH] xserver-xorg: Fix for CVE-2023-5574
Thread-Index: AQHaEMbGx1Swl1XTnUWKo9j2y10OsrBuxz0A
Date: Tue, 7 Nov 2023 12:17:48 +0000
Message-ID: <316D7535-8752-4FD4-B434-C5E0C71CED84@arm.com>
References: <20231106153423.2958316-1-vanusuri@mvista.com>
In-Reply-To: <20231106153423.2958316-1-vanusuri@mvista.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6175:EE_|AMS0EPF000001AF:EE_|PAWPR08MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: 23754bbb-d509-4c17-eea8-08dbdf8b9421
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /tctmLnTLx71CAH45TRuY3kGQJqMMLtxQkdgGTP0ZhUgPRViibZSL8VfpSOpdrzkn6s5sKj3WHHRLSu9fnN1DBRqB4AGA5xIZHHTD3ChBgLSzHhgdz8Yc2LgneMHT9SKi7qlWz5ATHo0VVf/UvKlCK04nwX15OddzRt98i8q9B07WOHyW9ee0G/SCt6rqRQgSKhlT8IDswFVEgjxe8FyEhFIYZB2h940s/uFZMcX0S7XX3yIVUNEX5mMdL028U58PUP7pRi5qolkkbPyBOLK4PuU2irtouU8AZUFIlkqjMpAfMqaEF5cqyMKpGudaYK08YlMicSJQ7rdqRJEptEfBHljpzg7//lNzbG5t83BH6mTjRsf7ZhpVPmjc0PL7hnTM8yRe0unwLD9jXudq83xp4B68c8ZCr+eEoSme2Myc8q8/v2QSnfhH3NELqdHjDvWznghrd1vC/HE+CCCo5AS+zlTeQTUy+Fg2AMii9csp2Xb7awFPGy3AGX7jWHTbGVFhfcC7HDDaCTguNUdMQGXsMQadXuHTJXE2uJtWmlbE9X84/WF9hQxU+kerL+IkX6HtxEshCje+LnGX0lCRro580SohonOxUN0dVMWad+h2NU6bqLvc+EE1QNUlFRlyRWu
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6486002)(478600001)(966005)(38070700009)(36756003)(33656002)(86362001)(38100700002)(83380400001)(122000001)(558084003)(53546011)(6506007)(6916009)(2616005)(6512007)(64756008)(66946007)(66476007)(66446008)(66556008)(76116006)(91956017)(26005)(316002)(2906002)(41300700001)(71200400001)(5660300002)(4326008)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3C248E0587086C4E8B06EFE13110A5B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6175
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a7dcd973-66ab-4cbb-2774-08dbdf8b8e96
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MolnlvdzyPP3XeIGWDbQWlhrq9V+LMcpEuXSf7UX7dNdue4Nt8Jtf+xX0P46/vHxJwlQ5BkDFaNYzRFsBUJNmT6ei9rjfNQMDQ3S47QqRqyRlQ/LqWtQWsfvnJhR4MkDbm3jfwZUr9UJOL1NHGwLhQraMp7dujCeVow5mEnFsXZcmdgfQKs7d7cspGjmR6WM/O53TbisgKf1yGSUkbLzYU63zdnVZMyoGn5/0Vx5qkfg1nhb+gr6OYKCpZ1eMCUtYq//6WwU1JjknUAnEpHarW31DeSW1Bh1YKmRLoSLc8VegLvDibPnblli09zyJVilKiH0UnvRDxF7iCv2x7PPmxaeG0WsmjJaA3OtWLjbGQ1bxMS62jeLpd/tW4q5nmVR7eJvSoA+GMMy0zkgT2n6+IDju2LvUBxRuBmMIF6cfacXNsCrkwGtUumERuQj64jqb1+DD3mQoNTgsa/z5Eq85EhEuQ4mvk6cPTjAZsWihYgegRDDgVNvqWiTwsjW6wC4DgnEn75f4q/ekOMQ8hZy6qfph5Acf8DHusP59nrYg63qL5gIjLUHzBDfCjVXqic3II7oXIdkb4BNQM+NpRoZLd1pbpqxG5vnyYsR7aejnHXReOZ4h5j8Md+J3e3TsYfGToX6iRakpW5+FefyiIX7bApLUrMLJb+KaBsJpmBc5dyNxruLg8Rk/aOt4atUfYa43lakE+AUxNNumx/3gTVF/S/vInvLfIqEV6sOWbIW51M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(40460700003)(36756003)(33656002)(40480700001)(336012)(4326008)(36860700001)(83380400001)(8936002)(6862004)(8676002)(70206006)(26005)(70586007)(5660300002)(316002)(966005)(4744005)(2906002)(47076005)(41300700001)(478600001)(6486002)(6512007)(2616005)(53546011)(6506007)(82740400003)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 12:17:58.1288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23754bbb-d509-4c17-eea8-08dbdf8b9421
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190275

On 6 Nov 2023, at 15:34, Vijay Anusuri via lists.openembedded.org <vanusuri=
=3Dmvista.com@lists.openembedded.org> wrote:
>=20
> From: Vijay Anusuri <vanusuri@mvista.com>
>=20
> Upstream-Status: Backport

This is not a backport as the MR is still open:

https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1189

These are Submitted.

Ross


