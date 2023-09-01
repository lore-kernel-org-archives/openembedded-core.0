Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46477CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 04:15:24 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web11.13339.1693541714594353139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 21:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=T3OvSoO9;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=i9a+raJJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1584; q=dns/txt; s=iport;
  t=1693541714; x=1694751314;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=alg65iiZnlW56CkpON4l9gfxOWMGSfihpU5EbpWzGm8=;
  b=T3OvSoO97MC32Fcnnfr7Y4s4IUJX08rPP2Iz18QN1vfxfli2NbDJZr40
   zj9yAmcufdMHVyjFiQcCDCwz/q4G8VBw8M8F1lI0ae8JoXWtkcgpHXv1w
   9t2yCOhjs61brqCpGsXUHb5SAwRAqLfyHSjRAz7IhCGg+tPDUiGiXYy68
   4=;
X-CSE-ConnectionGUID: MrtalykYQWyXhPCeRFsoOw==
X-CSE-MsgGUID: Lpl531dfSS+85XgRpWI6jw==
X-IPAS-Result: =?us-ascii?q?A0DrCgDgZPFk/40NJK1aHgEBCxIMQCWBHwuBZVIHbQJZK?=
 =?us-ascii?q?hIaLYgdA4UtiGQDnXyBJQNWDwEBAQ0BAS4HDwQBAYUGAoZrAiU0CQ4BAgICA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQECAQEFAQEBAgEHBIEKE4VoDYYEAQEBAQMBESgGAQEJA?=
 =?us-ascii?q?S0BCwQCAQgRBAEBHgEQKAodCAIEAQ0FCBqCXYJeAwGcfQGBQAKKKHiBNIEBg?=
 =?us-ascii?q?gkBAQYEBYEKAbFhCRaBLogIAYUFToQsJxtAgU2BWIJoPoEFgV0CA4FfhBKCL?=
 =?us-ascii?q?olghUYHMgmCIIM1KokYKoEICF6Baj0CDVQLC2OBFVE5gT0CAhE6E0pxGwMHA?=
 =?us-ascii?q?4ECECsHBDIbBwYJFy0lBlEELSQJExI+BIFxgVMKgQU/EQ4RgkYiAgc2NhlLg?=
 =?us-ascii?q?mYJFQw0BEp2ECsEFBhsKARsBRoVHjcREhkNAwh2HQIyPAMFAwQ2ChUNCyEFF?=
 =?us-ascii?q?AFCA0gGTAsDAhwFAwMEgTcFDx8CEBoGDi0DRB1AAwttPTUGDhsFBGZaBaBMg?=
 =?us-ascii?q?WByAXoTTBAqPsYUCieDZIt/jRmIIheFV6QImCwgp3wCBAIEBQIOAQEGgWM8g?=
 =?us-ascii?q?VlwFTuCZwlJGQ+OIIN3hRSKZXYCOQIHCwEBAwmLSAEB?=
IronPort-PHdr: A9a23:G7CUpRRmC630yCyViPibn+lkldpso3PLVj580XJvo7tKdqLm+IztI
 wmEo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk0GUN3maQjqq2appSUXBg25MAN0IurvHYuHg8K+2Oe+4ZT7aARTjz37arR3f
 126qAzLvZwOiJB5YuYpnwLUq2FBffhXw24gKVOIyhD74MrxtJI2+CVLsPVn/MlFOZg=
IronPort-Data: A9a23:v9H23qza2kfd2FQ5c+Z6t+d2xyrEfRIJ4+MujC+fZmUNrF6WrkUOn
 GBLDWHUaf3fazChKtpxbd+w9U0Hu5WHzt9qQVdspVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlpCCea/lH1Y+eJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 YmaT/H3Ygf/gGYkaTtMsMpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtPTtShsaic7XPNJEAateZq7gc9pZk
 L2hvrToIesl0zGldOk1C3Fl/y9C0aJu3aXbKHyusv2q8Fz2c0PHzs9AF0YRIthNkgp3KTkmG
 f0wITQJaFWIgPi7heL9Qeh3jcNlJ87uVG8dkig/lneCU7B/GtaaH/yiCdxwhF/cguhCG//RY
 MYDYBJkbQ/LZFtEPVJ/5JcWxbz43iSiKmEAwL6TjY4v5zWIlQB/64OuYIfldeaSeuQLnFnN8
 woq+Ey8WHn2Lue3ziKI9H+pjOLDkS73HYkVDrCQ8v9xnEbVwXQeDhATX1a3rfS1zEmkVLpix
 1c88y4qq+0581amC4m7VByjq3nCtRkZMzZNL9AHBMi24vO8yy6SB3MPSXhKb9lOiSP8bWdCO
 oOh9z8xOQFSjQ==
IronPort-HdrOrdr: A9a23:rq3nzKG3Z0CKLKW8pLqFg5LXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhKU3I+ertBEGBKUmsjKKdkrNhTYtKOzOW+FdATbsSrLcKpgeQeREWmdQtqJ
 uIH5IOb+EYSGIK8/oSgzPIUOrIouP3jJxA7N22pxwCPGQaD52IrT0JdTpzeXcGPDWucKBJbq
 Z0kfA33AZIF05nCPhTL0N1KtTrlpngrr6jSxgAABIs9QmJih2VyJOSKXKl9yZbeQlihZM5/0
 b4syGR3MieWveApSP05iv21dB7idHhwtxMCIinkc4OMAjhjQ6uecBIR6CClCpdmpDr1H8a1P
 335zswNcV67H3cOkuvpwH25gXm2DEyr1f/1F6jh2f5q8CRfkN/NyMBv/MfTvLq0Tt4gDhO6t
 MS44tfjesNMfr0plW62zEPbWAxqqP7mwt+rQdZtQ0sbWJXUs4kkaUvuGdYF4oBGiXhgbpXY9
 WGSvuspsq/tTihHi/kVq4F+q3xYl0jWhiBWUQMocqTznxfm2141VIRwIgFkm4H749VcegJ2w
 3oCNUjqFh1dL5aUYttQOMaBcenAG3ERhzBdGqUPFT8DakCf3bAsYT+7rk57PyjPMVg9up9pL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1ALDrLSqAQlYzlNbImYRRPuTLH/
 KofJ5GCf7qKmXjXY5Pwg3lQpFXbWITVcUE0+xLEG5mYvi7YrECmtarOco7foCdZgrMclmPdE
 c+YA==
X-Talos-CUID: =?us-ascii?q?9a23=3ANBdNTWh6C9XMlJob0PPwcjdkiDJuV2fBxXPBIH6?=
 =?us-ascii?q?BNndZSIW+RGW+46RDjJ87?=
X-Talos-MUID: 9a23:5OvbCQl1PuQvxAvrjOaVdnpGLMM1uP2iBns20sVbi8a+LRNRZTWC2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:15:13 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 3814F7Ar016543
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Sep 2023 04:15:08 GMT
X-CSE-ConnectionGUID: RjuUvdxsTi6kKHVDpYeHwA==
X-CSE-MsgGUID: fCG8WXOlSt6bYZ7TGcYgww==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=dnagodra@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.02,218,1688428800"; 
   d="scan'208";a="317770"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by alln-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8nKDrLmpjtt5fD8zb77pmpcbA6QdIO0vJqbskta8U9mfvGkmymeQrp0uEYkVdZbj7/OWKGf/piGHP0i7g5aIcTkwQwK4jOgeCPmecCAh4i004mZgL4FuZWOwe501dgwHHe60mWcyglkzc7d2kJxPhWI1B5uYTFA9O1kY/BArYGojzQ7Bl8pbi5T99fQabvse8ir0QID+NK4PTwNuUgW8GFY2hJPqkwJkytfPnKM879rIoMVEMAKFJBDErb66JP7y8tVMyWDf2hmp0P2IeFoCqgsR4CLg7f8L6Of8sQquxSCp/C3dxiWT1xvdbc0OoWbHwwjbjVR8Pqs0xUAtNitvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpisQKBdLman7OGoGK24rNhxNZWZy2X/1djgihdyaVY=;
 b=GDsGZBEq5NCv1Zd+SjCk2wfnS8aJOp5gLQ2QINpVBN8RV4NHy+IA2GDSIb/4beGPvNOaigDInUsVaKYzTPiC6kOgTWdXoCHOqWC9e82WLj7zAecXq9O7kTTLdMeTQdyjmmFpPqdIFfmRJOtiNpYbsI5FPF86NEM2f5PvI2xe2Jt02eaXBLUtJQJ/Um04uHddvFK/H4W0dgA6LsJRSqCgEfkSy5UZTPSFCdhVajEyfn3dpugLenxsoGjPHdDF5fuT74IPCN4gEbn6PBX75uIvPjoTdYeD0tqj2CGm0I2FhJvBB8iEIz/4BX+xJwamPcp4IwG5GEQycsjf7iWiXKHpNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpisQKBdLman7OGoGK24rNhxNZWZy2X/1djgihdyaVY=;
 b=i9a+raJJ2ffyw2InGFZMo5hqwN+Vi9zM99m4n4orVTFOhoG4bpfAWPrp7EieNeT/vbNBq09hZkK5VENnmfbF0HEJv1bEpSCOAuO825lmqd4W1kmqjte7Nb67qUbHjb/3P/Bjnq0EIAcHDwoI4FqEs0i9hIRjYRdf+4oERtu/+hE=
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 04:15:04 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::2e4f:d939:e8d3:1900]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::2e4f:d939:e8d3:1900%3]) with mapi id 15.20.6699.034; Fri, 1 Sep 2023
 04:15:04 +0000
From: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>
To: "Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco)"
	<dnagodra@cisco.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Steve Sakoman
	<steve@sakoman.com>,
        "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
        "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>,
        "steve@sakoman.com" <steve@sakoman.com>
Subject: RE: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Topic: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Index: AQHZ3IriHaT1DV2PUEC9CPagzAANMA==
Date: Fri, 1 Sep 2023 04:15:04 +0000
Message-ID: 
 <SN7PR11MB6971D172A62262F969B5A85ED4E4A@SN7PR11MB6971.namprd11.prod.outlook.com>
References: <1780AAD9BF6EA98C.27804@lists.openembedded.org>
In-Reply-To: <1780AAD9BF6EA98C.27804@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: steve@sakoman.com,richard.purdie@linuxfoundation.org
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6971:EE_|LV2PR11MB5997:EE_
x-ms-office365-filtering-correlation-id: 1003aa2c-15d5-4d8a-b1d8-08dbaaa204a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nFO5ToCvW09akffNRht3PbdtvMrGI6VxKb1MIY+KGm179lF1QwpoUloBu+fVK9IrdCBJMhCT2qDhcNtC1QSYjVzJAYT7XoTDuPImXhcSIOKsZoxc3qLmY3GNXNgD5qmHpgaBD/22LVmbmWPm0oJFhy335sA75Y6YxQNAGbDrgy8gSTPpP38hGpaCh+1fMPbTZZZwX+8FgZUcbGmlBHINBcclfUYQWUdUwUMKXxPy9qoG262sPmpY6EQTrydxru870tV6wYlxtbuyiJLHYcd2O1W4swRSun36w/nSpbHQQJhnGtzrgiJKRa95IMMiI/t0tB6Ur52ltxkS/3+jAMJ87FVolmmBOgefMWewnwW3DR5RBPWiiAbkXRKmVK4g0AMuhDKbZPkDHgtegjjnwxS/jxpa24OaDaxPAaPDCxcXwH/DHVNQPghn1Sd6exUqyLLtCWH9bKwCIfmE0KhKmbav+59DMKWzGGbj8vd4zDtX3Bmo7ikmeR0THjV1r8WxyFA6B91fJYJ4iFJhbp0SA52VvCf9+7kWQWg2HfKr/a9an2zuGUthZjGb9lyU5hZZ0DnOyC4j6iteLxzc4UwFYQTBHEZbae0QuRfKvlcA6qLZemH3JV1CGErVeRi1fLov8ich
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199024)(1800799009)(186009)(38100700002)(2906002)(33656002)(5660300002)(86362001)(52536014)(38070700005)(122000001)(55016003)(4326008)(8676002)(64756008)(66556008)(41300700001)(8936002)(83380400001)(66446008)(53546011)(6506007)(9686003)(316002)(54906003)(7696005)(76116006)(66946007)(66476007)(478600001)(110136005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Lg/Mlb+Fg2Nu8f/YD6r0h8Z1Xf85xFF9ZofS9KtzlyeWXzpfEetSoPBxrG5N?=
 =?us-ascii?Q?RDQpDyIrCzzwK8QNHtRkZF73+Ih66au/69d06Veu3/ywRsMTX23dN4SnTGQk?=
 =?us-ascii?Q?RGS2V8Ixrj9MhQVyRi1Gl4vUTPr69lO3Z9yX3gd+yq0tqpC20NM0LqAP2cki?=
 =?us-ascii?Q?sYjmsHlDpvLXkADcWiewRAss5cwikQSlBcBRRBbbrKpHfVUkO0ZjyLR3Vydr?=
 =?us-ascii?Q?+qAS51xKGzwhF7xpr7vuH7aoWrzzama2DddSK07CwHhpwm70ByNouZfqmBqf?=
 =?us-ascii?Q?Fi6ma/9cUGe9miivWVslNVAPZfPoN2K3H5eYv2xvtFMFrcOg2KNx06CY9R1V?=
 =?us-ascii?Q?+L7p1k8Xe5hUAbVElihxozUvMXt/F1QN/GNI7gQKeT2J//zKmsIYzQfFGg5R?=
 =?us-ascii?Q?vutDTNLM9Jn99aetWCqOjB4widMDIc+c5PhajmhZ4BPp8KThWkPgFJy36wlh?=
 =?us-ascii?Q?AXx61X2ZJC4tNUS51zV3zE8dHldF6x4xC5rBq9s9fRQ4erzRm3Zomb6as3xW?=
 =?us-ascii?Q?uMuzWTSTXIZQbE3XRDboJ+8sA+KI5/4mcV44B77bXUWpso3Qy86Mg4w2OWm8?=
 =?us-ascii?Q?adNskTjb2mHkVYXY7Ecof8hU3wWh0jmNu8f9uXLmYkDi3+Su97oxTwstJkns?=
 =?us-ascii?Q?kK6WHBz3cZwwkCH1rEYgPKXzcTVa7d+TxGgtJT45TGYeutdaVlHTAMykRMDS?=
 =?us-ascii?Q?i5cMZv30eY4y/BYLZKt5iIFcArmpxF7hU+OjOMM1RPyMAK5mL5+O3cZMeWJx?=
 =?us-ascii?Q?pv6ywxeDuOHcblxFPfu/aACJPuKvhDNvskxbbel9Os0ltTB0FOzau7z1I96o?=
 =?us-ascii?Q?60/Co+EQx/UYyWhpGqA5NLPmiFlnpYgawO5y4fKqU7pc1VpTWMKtDLY8apwU?=
 =?us-ascii?Q?2OKXgVcI2Elxc6G+YB7cuNPMwguIklpJvRNts1Vp8/XrmlZuDEx9PUan9QjA?=
 =?us-ascii?Q?ecqU3aTXzwkKEgoQ4d5nInw/+y+jAcCHcstb9Ejp5p4PR67s7U5VUf3/GDDQ?=
 =?us-ascii?Q?5qJ+3hP5iBNJfF3l5u4zw0J/6ErDK2mfkjs/TSfAunKotRR7FAsHxhrr/Fbl?=
 =?us-ascii?Q?KpmeaL5ef/gS38sHLfqHgZjdbsNa7/ql8f9Tdduo1WuHDiiSSA3cOs6GXLRx?=
 =?us-ascii?Q?eZPs4xRiaUPTQ5eN59vhM/wEtBlhBrydIDRqnmbHGibaFOQlH5jGCPmuGJQF?=
 =?us-ascii?Q?Dae6mST/X9zZibtYLYk56ABdBUx8v9Nxrr/QQSHG9MDHD0rPTqETgA31jIC6?=
 =?us-ascii?Q?AtLA8ANrtnu4S19kch/IuGdtzzzZY8gag8Fz1TtELHNlrP5vzPFLjTG68Jni?=
 =?us-ascii?Q?n1qdcL+zrob5xYPh20Pua7NUAHaU7AYn6dJB4GF1z/evErOrAFrjLQZKvenw?=
 =?us-ascii?Q?lW/dlt4jVtM1QcOGri40EqOdjWVFtOMjPwabRbIbgZPNHwbRV5yK1sCsBGdv?=
 =?us-ascii?Q?WyzfrsNLL4cWZdtPCd5oQDJB6Qw7Dk/4ASi8yHX6AhNF/nJgDVcGDF/KLSbh?=
 =?us-ascii?Q?LdUOw3ryvB15cZ4SBkn+UOveCEajPnHGFL3DxPeMO/OgL7fCq9V0xNp08tJU?=
 =?us-ascii?Q?2kVQyC5Ffwx1T10iwAll0R15V495cUNqrqEc1ZOo27qUkOpM+DtaYNWADNCE?=
 =?us-ascii?Q?BO7iHdQLDvSNgk7ly+zbQHalIuU71CfxVo8ZakCag7kp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1003aa2c-15d5-4d8a-b1d8-08dbaaa204a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 04:15:04.1914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +w8tI0ua3bi6NyVYxeAsyn1oMXdYrMPf74T+X4pLEsj1OvzlmgJ9YdPfzyvjqLK7wLwZVpucVxGIkgkK8xpaiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 04:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186990

Hi @Steve Sakoman @richard.purdie@linuxfoundation.org,

Kindly consider this patch for "master" branch.
Apologies for the error.

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via
> lists.openembedded.org
> Sent: Friday, September 1, 2023 9:38 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Qi.Chen@windriver.com; xe-linux-external(mailer list) <xe-linux-
> external@cisco.com>; Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at
> Cisco) <dnagodra@cisco.com>
> Subject: [OE-core] [dunfell] [PATCH] flex: Exclude CVE-2015-1773 from cve=
-
> check.
>=20
> Issue only affects Apache.
>=20
> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> ---
>  meta/recipes-devtools/flex/flex_2.6.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-
> devtools/flex/flex_2.6.4.bb
> index 1ac88d65ef..5be7351f4c 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.4.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> @@ -31,6 +31,8 @@ CVE_STATUS[CVE-2019-6293] =3D "upstream-wontfix: \
> there is stack exhaustion but no bug and it is building the \  parser, no=
t
> running it, effectively similar to a compiler ICE. Upstream no plans to a=
ddress
> this."
>=20
> +CVE_STATUS[CVE-2015-1773] =3D "not-applicable-platform: Issue only affec=
ts
> Apache."
> +
>  inherit autotools gettext texinfo ptest github-releases
>=20
>  M4 =3D "${bindir}/m4"
> --
> 2.35.6


