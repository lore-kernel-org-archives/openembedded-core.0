Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 07:23:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.91])
 by mx.groups.io with SMTP id smtpd.web12.24798.1653290623828033094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 00:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Z3UI2AzG;
 spf=pass (domain: arri.de, ip: 40.107.7.91, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpAbwiSpBUJJi6vbPN0oToHj8Q/dsiWn6BRyiwc+CoiK9nH6Su3rUL323MrTnopJyn5q2oDPrbz39ZuX664B7+IX2YVRr8bcrf1utURGWlLzAmpTELFNkkQ+bjZnzoCdGtTx0ei0HSb46v85JFJFO0hTj5pT6UYcded5irXKVZk/kHlCYua3Rq3O46NRTUxWFxw3GxErsdpb5WYyD3rpznBnRxS2+fH2XHBIvLr8ZN+80xCZp4UJN+QxtzPP/WgzhqyOByAw8YgtEqKi/6/bJS+KE3RQyjUWkqJOkWfX8d05yITelC0ajD0tI7bV2mP+kzC4iV56SUNfLigpyrT9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfeNjzlC+A61ghkr4fdHPY6s93VZ8LCpDN1/LKW7uJI=;
 b=KA0URqIaQzh8SIjE9c4OFrC48wRiXWVuQyy+iwHM1mZG1+Lm9xU+wb2zArFwxO2mYK+PQEeAkBuFzJsSFGXDS5+hPnTzsA82fcaY5n23lH+jM+fjALqkG0Wy+ytAmD9zqvPZS0i8yBQykYNvMW0zw/Q4wnh8GDTl+NX2uWwUgH6AdyfowznVpkQhBGxtiD+H72hWQBqkTeXGe9Rfb398I6VHxjre2JFPPd1W2Vd3clHD9cSDJKCG6jonGf4LPZFN6FWZng8i7O0BIND6e/2epMqEPtDLJddDwW0euSYobP+aW0rmREOhOyU8Fh97NPXUeO+LQBFS57Ndk7udGdDZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfeNjzlC+A61ghkr4fdHPY6s93VZ8LCpDN1/LKW7uJI=;
 b=Z3UI2AzGMWkP5HWz2Q3qIztsW8gOGdpLBZn4gpWudXWiUEzpjKiRqM3YnZPUGtCeOtMoYTL4Jw3lr5pEvgmZ7L294OOr1HtEV4UUTeJh/jvwMSFuWiFiFoZi6Zk+HMLvnEmOd+xlNftozD80WIyMWLnQZu8avkckMfprLZfDcwA=
Received: from AM6PR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::20) by DB9PR07MB7820.eurprd07.prod.outlook.com
 (2603:10a6:10:2a3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.7; Mon, 23 May
 2022 07:23:39 +0000
Received: from VE1EUR02FT082.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::a2) by AM6PR01CA0043.outlook.office365.com
 (2603:10a6:20b:e0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Mon, 23 May 2022 07:23:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT082.mail.protection.outlook.com (10.152.13.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 07:23:39 +0000
Received: from dhcp-192-168-0-35.wgnetz.xx (192.168.55.146) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 09:23:38 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>, Stefan Herbrechtsmeier
	<stefan@herbrechtsmeier.net>
CC: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [OE-core] [PATCH 0/6] npm.bbclass: work with nodejs 16
Date: Mon, 23 May 2022 09:23:37 +0200
Message-ID: <12007121.O9o76ZdvQC@dhcp-192-168-0-35.wgnetz.xx>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.55.146]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cdf7066-4898-45e6-ad0a-08da3c8d2850
X-MS-TrafficTypeDiagnostic: DB9PR07MB7820:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR07MB7820377610C4DBE29CE5BB92BFD49@DB9PR07MB7820.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+DKFbO7x8LxqvqpamfDQzZVXcPSbemW7hREWg09J8dKDoA92KKZ4lU2oLXc3M6DuLbkebMn5xH0sUjZSVy3LL1csW4Y7ep7w120jyBdxsmk5I/ziE6iQX75kQIj7esrszjvxj0x1qPBcdrfi7fgwNoWUZSztACKUsxouQmXBmIyXtxfrpkbL68+e5RtZr/eqpDei3CEXtvVEhRggOd4OGiob5JiCOucUfJy4pSnxTroTO3JtML+M2cDHIPgP0TVdvmDUviIlMmGGEZvcXiaqxYp32XVTxPcT8Loh3ROV42vlgkyk26tbiZyPqZZwR0sdfmxMQTcHG4mitNmu/VIWhS6jKQZW3axzVFclZGJHKa6skVLzKjAUA9v5q2zgp0cAc05ba2zacoKqMQZW4TEAry8DFhXlZeKeWosmm6r2YYOMS9VrxL+qBB9Jo/Zoq2ECATmncrh7+zCoKMm58MO7hBqAWSc37BxFrt39liuFgx+j1XyXDly3fvl4FzKefW/u/YbEAyK5uL8yAsKfQQrWG3gYyBB6Ztzxqdwfb2jsTDgdqWeb5GWhaV9SgwnVK3qgO65nwxVg7Br0WEgd6+JJEHWIMtLHjvK89/jTRLJgpQydxAKdax7KMCsTOHFX9p9vAhDJcrS6g72/efu7KvHVh65MyRjZTKkgmHBstOujwfyGaOhZBe4v6LDMDZyLucDJylsyjo03APk2xgQsV9NAX4SOKJwPUcB+f2f+l4caduDwHgG7Fdh3IdA8sDyqzZGUBDWK9/XeYiOYuaTHcVPMf1Klyc5c7HHfXkKi2VJexVwNSWB/BqtMW4fuAASKu0oX
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(356005)(36916002)(82310400005)(2906002)(36860700001)(81166007)(55016003)(7696005)(70586007)(70206006)(966005)(316002)(4326008)(86362001)(16526019)(508600001)(186003)(8936002)(8676002)(5660300002)(26005)(336012)(83380400001)(110136005)(426003)(47076005)(9686003)(39026012)(36900700001)(102196002);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 07:23:39.0248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3cdf7066-4898-45e6-ad0a-08da3c8d2850
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT082.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 07:23:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165999

This seems to solve my problem with the quicktype recipe [1]. Thank
you very much for working in this.

[1] https://lore.kernel.org/all/CANNYZj-V8O1-USTdtOYKi5hB80QjxQZH2d2=YbJ-4Y2sm5BjoA@mail.gmail.com/T/


On Thursday, 19 May 2022, 12:05:50 CEST, Enrico Scholz via lists.openembedded.org wrote:
> nodejs 16 changed internal caching significantly which breaks the
> existing npm.bblcass.
> 
> Simulate parts of the npm registry and cache data in the way as
> expected.
> 
> This patchset requires an additional one in the oe-meta layer.
> 
> Enrico Scholz (6):
>   npm: replace 'npm pack' call by 'tar czf'
>   npm: return content of 'package.json' in 'npm_pack'
>   npm: take 'version' directly from 'package.json'
>   npm: disable 'audit' + 'fund'
>   lib:npm_registry: initial checkin
>   npm: use npm_registry to cache package
> 
>  meta/classes/npm.bbclass    |  65 +++++++++-----
>  meta/lib/oe/npm_registry.py | 169 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 213 insertions(+), 21 deletions(-)
>  create mode 100644 meta/lib/oe/npm_registry.py
> 
> 





