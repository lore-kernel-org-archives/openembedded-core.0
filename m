Return-Path: <jan.kiszka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A960CC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 06:39:00 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web10.3215.1659422333293592410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 23:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=cR/PHH1O;
 spf=pass (domain: siemens.com, ip: 40.107.21.49,
 mailfrom: jan.kiszka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgMg89b0ylD5e1DjDlf5FguR1omPML+x/slb4SswfWO5nRHfUkCTmXOO4c8d7hLD7RRPlPONSohzHieCfAa1G6e71nmOcx+kYu/tnEsBrFlBRIFFacIg5rkTLmW6ZzgovrL0YliAQ6kvMEhLgsyUil/gb9/7ztnc48nrAcWfGBeqoCMz+Z2/Vxt02+TMHRwXsdCwq4HOUIF49d2Q1KK48PfDU//t4vpHEUV4kQinyJJ9E9NdYaEDQN55V14Xj5agP4H0H7B9ApiMCQjwACBRxs3RIuIFnyERibbZhNTydRofvz7wI46rRDNDLwh0PVrW26YIi/NLc/P/pfWkYviyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN/1fKkVDwwUBTWdAo5dYD/tyWvR10YpDiqWtbTX6KU=;
 b=lNJUb8y+nogc8FzNED/PVbCjFlMXOUwpUvt16RLImNCROzVDw1DJ3zodMBuKL0hsw5tPXaDp3/DNurj7SwcFjorMa5i7Uwi4gAhJSyssSY/VpV7FupTgxiE+r+vUbInE859Pucm+GNP7nfJ6AbtE3BifH82gjzgGgtbIsjGa7CDUmJlwjjnnD7YlzESNeGfv4JBRHzBHWla218o3wUfcPUu+FyxTxw5suHd82q2ZXvY1oN4sn9N1Twuz3A/jbTTrJs7gBPZWMkStMNmCZvf98RS2NMjyHWVAnrMEHMy916VKJO3jvjrGBzOLfcfMfNX/cqnRWfvY7r+oYxtMA346AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 194.138.21.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=siemens.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN/1fKkVDwwUBTWdAo5dYD/tyWvR10YpDiqWtbTX6KU=;
 b=cR/PHH1O9iaNhtq5efbljdgHoVREkSGHzEP/F7engxrym2/ZzjdpotC+XIWjrxJnmRpMXMjfeBKRskmaJ3bLBo3jIBregYcEYKpP7Y15Wy8c1m3TsHiiphXEWbM/5vI8pSA4fb6rtPrRJ5W5YZQyUp6vUilg3ggm/GrKFInrUxHMQ/fLLl7FrEkOJzYwR0AkOYf62vL3+mRTfgSmwxR1RdI6g8oVHQSOKp37a7NezuTZaMGF+oihK1GMxXwX0IkpYQaNm5iG6CuCm1r/KF4m7YYilfBqFAVXrmyCIWpXX11Ps+q7QfzohR0s4q9Q6taFhoBGusiauUOVYiorQKfRcw==
Received: from AM6P192CA0075.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::16)
 by DB6PR1001MB1270.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Tue, 2 Aug
 2022 06:38:50 +0000
Received: from VE1EUR01FT087.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::a4) by AM6P192CA0075.outlook.office365.com
 (2603:10a6:209:8d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Tue, 2 Aug 2022 06:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=siemens.com;
Received-SPF: Fail (protection.outlook.com: domain of siemens.com does not
 designate 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.74) by
 VE1EUR01FT087.mail.protection.outlook.com (10.152.3.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 06:38:49 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Tue, 2 Aug 2022 08:38:49 +0200
Received: from [139.22.106.222] (139.22.106.222) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Tue, 2 Aug 2022 08:38:47 +0200
Message-ID: <26422f58-2875-d6f2-aa5b-06ba7fa908e4@siemens.com>
Date: Tue, 2 Aug 2022 08:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH 2/2] wic/bootimg-efi: Add support for loading
 devicetree files
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Ross Burton
	<ross.burton@arm.com>
References: <bc3dd2ac-3ae7-4818-e212-6f49147c306c@siemens.com>
 <5e8d6c83-8795-3040-3131-3b181e6f01ff@siemens.com>
 <20220801161205.735ef5a5@booty>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220801161205.735ef5a5@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [139.22.106.222]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--19.953600-8.000000
X-TMASE-MatchedRID: 0sa3XW9m2I05QaOxwNGfvo9bHfxDWoibGnjuHJNyKRwRW4LR41Fi8pbf
	XHbtT1Bip7krdLnjL8SJzvyP4u0tgN2d+a6vJL2CrDCeoh7q4MxpZP6yyMfGwl0u3AdA7qLmyiK
	gKtIyB4pfCOymABgDYJISm/wGXXpxRG8czGHKliXi3A9Zt5S/qgpUgpDpUbRWA9lly13c/gElJy
	85NfiMc9WM2x6EZ/S9hlX4nseMMhdjOO533RcWD+MnX/BNijnq4DhTNYaHUgN+J3gtIe0gA1Rn/
	7j4scmhDO+DX+rUwfZJri9q8ptEARhP3qmq5VakNBmmTtMbP7nserFRQKzxao61Z+HJnvsOLozI
	+rhNYbm2zFWqrVN4Bc4MJ8K8Nql87QHQxPxLQSSRk6XtYogiau9c69BWUTGwbh2NZp6L5YT6APa
	9i04WGCq2rl3dzGQ1A/3R8k/14e0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.953600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 F2E1D15CCF313C9F3E95DFB98124ECC9D65CE7EB725D5801F0DF25AB31CDC09C2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da890b1-e325-47d7-e03d-08da7451a8b2
X-MS-TrafficTypeDiagnostic: DB6PR1001MB1270:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VDRLVHVMVy8xNFYyYmE2TGFhN2p6Ti9xbEVTR2FkM3gybVJpcnQ5OVJoNHZX?=
 =?utf-8?B?VlpIUEhOOXdtY3VDbUdxVVdiVlFTMktCaGFtd1krSmtNaXJBcVZ3Uy9mME43?=
 =?utf-8?B?bElTcVh0ajVsemRaZk0rVEVSSzcyUnkyalFPR3RUV3ZIZlN3cStpZzdpNC8x?=
 =?utf-8?B?M21IWGR6VkM5cTh0d3hOMWo0Y0Q3eTFValpRZlQ2TE5aWHExdm4wdlk4cHZl?=
 =?utf-8?B?TmJ0NDkvaG1sNFJjc0FXQ0pkQnR2N3dHbUR6ZEQxazdIT05JVUJzVDRDbUpW?=
 =?utf-8?B?dHltMnRZOHpZTHo2TThCNWVvTE5rTVVNRHlSNVNCS09CMUk1cGlSQ3dqVkVN?=
 =?utf-8?B?TEN2a1hHNS81azljTm9mT3BhcVVUbDFIVVFZSVcvbENESUhHdVo3MjFNc3Bs?=
 =?utf-8?B?aUZwRG50NTdQWlBWelZMUXJ0T25BMlkvcmtLZU90MlN2NDBXYzBqeWZsUGpP?=
 =?utf-8?B?cVlhTG9zZDRpb3VlejRWZTRVOTZPNmJSV0ZWdEFMdjNDWlRtZmpCaXYxb3dB?=
 =?utf-8?B?aUsxbzBTS1BZWU1na041K1dPZEhUTjh3MDE1OW81RXp2eGVqYzdGYUNpS1lY?=
 =?utf-8?B?ejRDMUVZQlZUeXYwMkRMeW4yejdUcEVHOFB3Y0o2WFRQOXlSUStWNXFIeWlD?=
 =?utf-8?B?Um8rbmN0VFhrMFZsY3hWNzJZay84TDRVNHVOQzc5MUp0Y1RKY2NWdXorenJE?=
 =?utf-8?B?SVdnZXFsRzZMOVpaRGcvb2JIelpxZ1pWajczQmF0c1FMbUxhUS9HbG9TMXVW?=
 =?utf-8?B?S0JxTlVQbGxiaGtJTmZ5YytxamZ5Wnp0N3VrS2NkT3hkRm1FNnlBdVk1bS9h?=
 =?utf-8?B?ajVrekd5WFA2TTdjRkJaSWI0blV4YVVIMUNTN3U5cW9HNU1DcEdoOHdWQ0I4?=
 =?utf-8?B?ajQ3bWhGbDJmb28wdDhmU2VMTm9pTW43cWRqRjJBQ1ZSbDBHYWduT2hjKy9F?=
 =?utf-8?B?d3k3YUxQLy85RlBZUzh1MlN1SjJ1aklzdll1SVAraEh3UzV6UkREaDZ5aWh6?=
 =?utf-8?B?VGlpVGtDckRiQ2licjZ5dTRSOTJBR1RweXlua3JWaEcwcUpsTGt0UW9NY1B3?=
 =?utf-8?B?R2lyWGd6a3Z1WHBhbWVPZm4yalgvNUF3b2xtNm5xK004cm5TczF0TWtWbTBX?=
 =?utf-8?B?NmpMRkJrOG5mSERvSTBzN21reTFmQUsyRlJkaVVrcXYvVDJDcDdkT3c1OU1y?=
 =?utf-8?B?bUZ3STJwejd4SjdYaVo2WCsxcVZhTE5pbHhoVm5NT25McVpWKzJ2WmZFNmpn?=
 =?utf-8?B?ZHJpRU9mN3pjdUJHQ0dsOEs5Qnlkb25aMWV1bmlQTEFyVGRTdz09?=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966006)(36840700001)(40470700004)(36860700001)(6916009)(6706004)(54906003)(82740400003)(44832011)(8936002)(40480700001)(26005)(70586007)(70206006)(336012)(31696002)(86362001)(47076005)(16526019)(16576012)(186003)(8676002)(316002)(4326008)(82960400001)(356005)(82310400005)(83380400001)(41300700001)(5660300002)(36756003)(31686004)(2906002)(40460700003)(966005)(956004)(2616005)(53546011)(81166007)(478600001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 06:38:49.7270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1da890b1-e325-47d7-e03d-08da7451a8b2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT087.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1270
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 06:39:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168768

On 01.08.22 16:12, Luca Ceresoli wrote:
> Hello Jan,
> 
> On Sat, 30 Jul 2022 10:24:43 +0200
> "Jan Kiszka" <jan.kiszka@siemens.com> wrote:
> 
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> For device tree using systems, add support to set a custom devices tree
>> during UEFI boot. This requires to copy the DTB file to the boot
>> partition and to add the respective loader entries to the configuration
>> files.
>>
>> Both grub and systemd-boot support only loading a specific device tree.
>> Therefore refuse to work if the 'dtb' parameter contains more than one
>> entry.
>>
>> Out of scope for now are overlays (only supported by systemd-boot).
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
> 
> [...]
> 
>> @@ -327,11 +350,13 @@ class BootimgEFIPlugin(SourcePlugin):
>>                  objcopy_cmd = "objcopy \
>>                      --add-section .osrel=%s --change-section-vma .osrel=0x20000 \
>>                      --add-section .cmdline=%s --change-section-vma .cmdline=0x30000 \
>> +                    %s \
>>                      --add-section .linux=%s --change-section-vma .linux=0x2000000 \
>>                      --add-section .initrd=%s --change-section-vma .initrd=0x3000000 \
>>                      %s %s" % \
>>                      ("%s/usr/lib/os-release" % staging_dir_host,
>>                      cmdline.name,
>> +                    dtb_params,
>>                      "%s/%s" % (staging_kernel_dir, kernel),
>>                      initrd.name,
>>                      efi_stub,
> 
> This hunk conflicts with the changes introduced by [0], which is
> already in my testing branch. I have applied your patch with a little
> change to resolve the conflict, can you please have a look at the result
> [1] to ensure I correctly followed the logic of your patch?
> 
> [0] https://lists.openembedded.org/g/openembedded-core/message/168553
> [1]
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=lucaceresoli/master-next&id=7547ec3e2065e55a8caa6118fc962130b8c6bd98
> 
> Best regards.

Looks good, thanks!

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

