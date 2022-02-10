Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400C4C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:13:15 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web09.8273.1644487993042616325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=vyTrQP0Y;
 spf=pass (domain: vaisala.com, ip: 40.107.8.40,
 mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgf4qjxI3tZ9k6C6cTcU2vwMwJh7iUka0l15hCTjrLnScRAaxI9v6FJA2b9c5NfhuBW1smnHbfZ2Epe38ogf1Nm2Oy15ZitnpjCkEQ2utfQJaCXfrxUbKjH/vyJx5AZMOmHjG+P+dcg+YRdv1O5AfuhVgN2DK67d8G+82atWEGbNeWziqcHPi5sxXwVtN6M8mto6dQv6PlyGFIDdeMwqalmuuXuyzSxuXVEnVkVsqO9vZYyikoCox2dNcN4lcVzTyuauQxRjhwmo23AyMN8nh4MrLh98OD5jPTTdAOX2fNwh6pQLu4lI9NtxKw+P0/ZBtGuYUdsddyquHHp8B0vcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6ykC1q0ixykP+DIZpab2eODTeRSCcTivdTfBgLUgiI=;
 b=WBpQXC7Pq4tAPQr6y6RAYiu5fUTpaluQ36uWNuHIhSoPZkW6DPYW7gbucL9Y1a0mN020XPaeyBVLDIMcgk8a/D3161fd9fSwLo0TVrgp49qRGCuSbRXjRq8SAEsrQlSqUNiL6tfWUT04KyM2n3SrGonoegfTvzUqHRsg23OY/W/CPOiWYiGhGeMivT+tvQuWcBi8hU5NmQCp4nz75S44W61U6De+UpKNveNlgDkRzUhCnMc1gL0hoYclfr3bMirLqJR6hyU6YJtzGAyJh4LTUwUvj4puLeCd9srhiesJktlNpVQiYtc2pIZ+DV3KbG/Ku8AvBP6JD7SCGUIQeF/3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6ykC1q0ixykP+DIZpab2eODTeRSCcTivdTfBgLUgiI=;
 b=vyTrQP0Y+N43vfiphhSbDJqXpPOBGlwoC0vZ7le1MT4808TRjiTQoHW4+IIpxLqi+HQGVZyXYV5QHPKpCJc0dhIxEqZaGo7bpStj38geo51QUIaT8JuDC/lrZGHfwrYEETk4JjGqmx9Fv7OJzFSrXPfoafjvsjetzqA4594lcfnGozJsi/JgnrHsBq59wrEvgNJ4784zH/GBwlPAymaaYnX+JxArJR/Wl3+DpeJKFVojUzzCSJh/2A9sIHq6g2jLaLOWKXSMjKxF4ynvIDZQwT5c//N6iWzecvU50oO1zXVWtlt7EhvsXYZgEvZn8LA5I1QC6O8uZltatmtCzcd9lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com (2603:10a6:3:97::9)
 by HE1PR0602MB2747.eurprd06.prod.outlook.com (2603:10a6:3:d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 10:13:09 +0000
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::2c4c:6b5a:7a46:ee12]) by HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::2c4c:6b5a:7a46:ee12%5]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 10:13:09 +0000
Message-ID: <5c62a8c54a42a51c039712d3741bc60606959c82.camel@vaisala.com>
Subject: Re: [OE-core] [PATCH] cmake: stop FetchContent from fetching content
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: raj.khem@gmail.com, Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Feb 2022 12:15:18 +0200
In-Reply-To: <1fa6164c-8a8b-e706-2385-d9c04ace1c5e@gmail.com>
References: <20220209125315.3177811-1-ross.burton@arm.com>
	 <1fa6164c-8a8b-e706-2385-d9c04ace1c5e@gmail.com>
Organization: Vaisala
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0228.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::28) To HE1PR0601MB2361.eurprd06.prod.outlook.com
 (2603:10a6:3:97::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79c26a87-7e3d-4403-7c94-08d9ec7df029
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2747:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB2747E82D1260110B27B54185F52F9@HE1PR0602MB2747.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zOlQNCvwC/hkoXiKD9lR+QQSpQ0l7le21ILqD3TREXtcduqgcxZ+6Gg33+kW1x1pkot68PtjG0K/l6ZszRB3gmuxYqjKfs9wrk1OADomqsOPQ0hZjVIUQuurG454MdDu34JJY9MLGv0reYClDsklu7IyGHjDjQg4pXo0fJkFBAdPpdKgWUc72NbmKTW2r8AlgeTIYK4SQtYScZwUwDtjWrlzyHnrju+LrUqzxvQ93zKOicmsnGrG55/bznjiXvM2fyCC1RAP1aFcJLTyUFjEXoYpvri1zVnkEkmAsjd1L53eMcPBXXaZE3hrxY/bPhMX1vjG4CrWDJhroNpas5Nceud8faDdllbQLIJkWRe/kdvHDbukMqDcOvjAjnNnHVkaMOIYjN0Q51v7okoLb00rzI287NzKoiV4mjsHaroAgP2rNM910aYuHKobsmtdJ28jytKXI6CnJ7IEZvjf+40g3qdwiLYX5Yvbn2z+otHdgJW6aSqyV/9s7ZclUn7cLKs+UbFdT5klevjXr5cI+CtMiSRjOHrMSabVab0Katm+K01wQP/CJqDb4kqE9OWu3Xu8olYjRgsZQOVidz++Jp0HnZtUj7CeBSDtIyeakCzejcEjLBQPq/ptJHo2sJOVJx2JiO0Uf4ktTNnBlFIXDsc7YFACy5QOfAVmXh0WrFDZv/IOTAPywZkHSU4bwD/MZ2lmgXPevYxabecmEh89uyy3t0pJr4qrzjubaxpJYIJxdBM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0601MB2361.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6666004)(6512007)(6506007)(53546011)(52116002)(4744005)(6486002)(316002)(83380400001)(86362001)(36916002)(508600001)(5660300002)(38350700002)(8676002)(36756003)(66476007)(38100700002)(66556008)(66946007)(2906002)(44832011)(2616005)(26005)(8936002)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUNiZSt6b2IwU1VSTVBDdjc3N0EwZ3Vzc25EMHhOMElaV1BhcTVmanJIVFJr?=
 =?utf-8?B?bmxSNkxVUDJpcDREdE16VVNydFVtaVVldjRQWk80b1hCYTBVR2psc0h6NHA4?=
 =?utf-8?B?VWNUQ094QlBDdXA0WmI2Q3V5YUpMRlg2WENxY0ZqaVRpS1gzS2xtR3pidmg5?=
 =?utf-8?B?cVhSaFFaYjFYbUtlYi9vZ0xIMlI1TVNHRzNmQUs1cGxxUC92eGFTMTJOdE9T?=
 =?utf-8?B?WmdTZk1WZTAyNjl4ZUxQcGpMRmI0c1B4VjhIUjRWam16aDc3Z0t5RkVVb1pV?=
 =?utf-8?B?T0luRjhzb251MWpLOVE3OGlNZkF4bkhSUEdEU2ZTVXd4KzVvZVFIWEJjUkFp?=
 =?utf-8?B?N1VERXhLQ3M4L0h0RCtuWWFMUWd3S2hEbEUxM2owbm1EUHZZaDBlK0UwdzJK?=
 =?utf-8?B?eURnN2RlL05YdVQxeGxpaUwveHBEbEI4TERuQ2NDTkJqQmlqZEw2R1g0WUFF?=
 =?utf-8?B?TFZrVHYzVmdZMGRZMUphOVk2M2FSTXRPd0RLWEp0amhuUkFpVWd5cWxoTENK?=
 =?utf-8?B?K2plTXppeG5ianhOc0tlQWxFak1HcVJLTHViQjIzb0lIWWZndXdiU1ZNcTdi?=
 =?utf-8?B?NVhJeGZ4NXdVMnNXQ0RhSDhQVHMrbXpWMHQ2bU1PRUhTbVdHU2lZUWlnWU1i?=
 =?utf-8?B?NFkwYkNGZnV6VUFMQWdvUGtoNVZGQzFQTXNTNUk3dUhaR25UKzhpM0U0VmEv?=
 =?utf-8?B?a1hHZjYwQ0Fxa3ZrS2gyTGZjWlp3UTFaL0xCeVo2MVdwbkREOEtSdmYxYzJ4?=
 =?utf-8?B?VVpLUzVHWnFTcUpmSlZHdVQ3U05xa2NJRlRMUEZaaHBZcHZPdmxheGNVcTF2?=
 =?utf-8?B?cGlwOEliTitvRit1c0d1dmpGaVVpZXBHM1NZNHBZeEJVODllOGZScnVDOHd0?=
 =?utf-8?B?NWNmUmFySzNURy9JVXJpS2NOc3NRM1UwZktYT1p4a203RXFpbTZRVVJoZkht?=
 =?utf-8?B?Z0t6amVNRmM1ekt6b09pc1N6bE9PUFlvS3YraUFBdkV3OWFvSy9DbHlaSlFO?=
 =?utf-8?B?TE5GMnlFdUZ0dWttSlpTbjdnT3FSYklwRG1WcW1pSnc2TXhic1FoS3BGQk5X?=
 =?utf-8?B?clgyK01WREx3RzQwZmlpU2FNT1dLM3A3RXFBLzFjOUpYVXBZOTJ0c2c0QWwx?=
 =?utf-8?B?aFlwWnVnYjFLc3JDMWlsNlB1b202ZW1PbklhUTBSUGpWL2gyeGJkOWFONEh2?=
 =?utf-8?B?L3MvL1Vma3VWQWh6VWJUTnVhOThTTDBFU0tkOEg2VFA0WGlhMkIxUWhKM2RW?=
 =?utf-8?B?R0V3ZU5xVWF4eDJTZ3BjVGNrb3dSL0FFTzJSTlUxMXQ2eUViQWRKeHNWNEFx?=
 =?utf-8?B?Qk0rZWRCU3dsZWRhUnN3c2d0QjZUaTBBS24rOVNBcFhNUWFaaEdudEIrZm9h?=
 =?utf-8?B?M3VoRXg4Sm1sRFo0WWF5VWRJc2xTeTIzcnJXNWttZDFkNVg1WlVXeE9qK0Mz?=
 =?utf-8?B?ejFjUjJJZ2g2Yk1pbThHMTRQZ0N3WUtoUVQvMGtUVVc3bnhZM2FhL3FRaCtE?=
 =?utf-8?B?aUI2TStCaERFRDRQeW1WMlMzNjlEcVIzeDRPODlaTWhLdFg0V3JxVWFrOURE?=
 =?utf-8?B?UklDQi9jVlpPRGxPSkJtazJQbis0MHdNdUh2elhtbThyUWp5VnhuZ2FLUnpR?=
 =?utf-8?B?ZGtQcU9KcmJRMW1RcVhxdlgvR3lEa1EvYjhLZFJ4Tnl2MXZHNVpzTXN4amc2?=
 =?utf-8?B?aFBUSk9lV0JjRU5rRGN0Ny84Q0JVSWczYklENjZXTjhGWEgyakpvRFRDNXNt?=
 =?utf-8?B?Z3laRUlObkRqdnYrUFQ4VmhiTGpCcHhxTmVZYWVZYnkxVW9GRFZuMWpFQy9o?=
 =?utf-8?B?QXJSMEVVYWxsbW9yakRTQ1JGV01WckxiSzdEcUxmay8vZ083ZXRIVjAweVZX?=
 =?utf-8?B?ZVVxczhZVjd5N2VSUElndi9lNGdMWjVTbTB2c2xVb3JpZkZmOFdxbEhDK0N4?=
 =?utf-8?B?WGtyUEt6TEpQaTJrcjJaZ3EydnVWQ3Yyb0F4Sm94NWZBNmdSUys3WjB2RFdX?=
 =?utf-8?B?UGZraTFvcUVLOHZ0WTBoMXZ1bFhVOCswQUQxOUlUbXc2REdzU1N4S0JIclVZ?=
 =?utf-8?B?UUZ2SDRsQ3QyR0VIRXpEclhTMnNvbW1uemd6UGdQYnNzUUxWVzhQd0Zxc0JB?=
 =?utf-8?B?b1ZMaVN4YmlCTVFIMnZsTTBUWlEwQ1lvN3lhdE9SazhKc1RJVnZ6SlpCcEtq?=
 =?utf-8?B?ZUlPd1FYS1B5bFFMVlFhZEcwZW5mNm9EQmRrZzI4UzV4RG16U3dCdlFlRHlu?=
 =?utf-8?B?QjBuTW1NakhSMlpQOURmS1NwYzlnPT0=?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79c26a87-7e3d-4403-7c94-08d9ec7df029
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0601MB2361.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:13:09.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qHupVHd0K8kAgnTowrgfSImJSZXpkSgWlFerMI0haVhqyD/OzhsaVmZAHdmHtVHwOSwQrhW7wWxp1yETbpMuPcPGXUmPETPAEiexmo+rQLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 10:13:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161603

On Wed, 2022-02-09 at 09:45 -0800, Khem Raj via lists.openembedded.org
wrote:
> On 2/9/22 4:53 AM, Ross Burton wrote:
> > CMake includes a FetchContent module, which will download further
> > source code at configure time.  With the network isolation this
> > will now fail, but as not all environments support network
> > isolation we can tell cmake to not download either for extra
> > safety.
> 
> what is cmake's default ? I think it could become a constant source
> of pain if it is not default. Since many cmake based packages might
> start to depend on it indirectly in future.

CMake's default is to allow downloads.

It's possible to write CMake projects so that they try find_package
first and then fall back to downloading. I think
FETCHCONTENT_FULLY_DISCONNECTED might be a helpful flag so that the
build can then simply report if a required dependency has the wrong
version or so.

CMake projects that use _only_ FetchContent will likely need heavier
patching.


Eero


