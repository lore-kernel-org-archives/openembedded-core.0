Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EE6C433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 21:04:20 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.79])
 by mx.groups.io with SMTP id smtpd.web12.2942.1665090252780353028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 14:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=hkNon8Xd;
 spf=pass (domain: seco.com, ip: 40.107.14.79,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjAZjQGwvpeC6cHYcI+DzTpjfaw04catT6MdQa0tB/Gbeo8A41ndGOhTzewIpzSZiz6Bd75zobdeL04L0ifgyWvs0k96Ko3IvQ7ryIm6A+ZVlMyuOoDSCYPzaPrPiR4kXEk3KSdv/7tzyK7fSPg1+3WjhpHi0FXIiazAwtOrfBDlMwd74bwSiq5TE8KAUuHwlhL8oqXfw7zEwJPoIziAqPa6L868YcIe9vkTKuvfZkmhyGtRfFUhETEu3TNNV6yhm/7wamMkU+9QIJ+JjT2nl7irirl6FC6rNR0ySHOzhuwSbAYFZ6G61B2hJ9suXilIHDF6ceR1Fh98RJUN9Ph++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyJCONt66qpHppoNbhjS5mxiD8QFsNmGE6ghZfU6tKw=;
 b=F/nMUHTodnl0+nDL5USK/mCHokElLiSNJMCC7hHX02cfroeRzliSybl2C9MnE/xyDIpZzmTMVmzMCcbUt2YAzJHezab9qv3eV5SmI58Mh3nm44K0ZU4xQdkABdsnyHbJ7rXf8CjFr/+k8A2ct5BHjDOmzH2l4Ejv7Vc//SDKmQNJ7NgB59b/hhOaD9ccVH4CiBinQyS7UwOqh7M79aW7ACiOiJimjLFojNLtzEkvvMGJAUQUsx5r2z8oJDGUGouNbm/rTzjotKPXaFq63AdiqAc6aD2VaFexQ4WJATIUrMoJQriESoiD31CgNaLcPnH59psSSd+2GV4fkytiN18o1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyJCONt66qpHppoNbhjS5mxiD8QFsNmGE6ghZfU6tKw=;
 b=hkNon8XdKZKuxWZDrWUGFbQQdjSbY4WgSnDReKqGCYtgA0weEdl/6afTwJRUumBBwpRla2jDKcj0CVgGDzgy+OeBwTmpomeQ/D0fJdtFJqYyBVLBKfl2l+iRHxwKVnrpo3LGN9khfoxHS6MsndA3zpkKv0W5EemI0NW3b7MxE8CoPEmxdwiKk+Hd1N9YhIGaQQ4NV0WVcYRDtod2wICp1XQHCtXI6GA1U5HRbtQf6HijHssjMdHX5suiJ+8opY6aSFsoB2YLWtpd41bzXA1qQRn0VSr3gF3Z0aGnntCA096iMXI+4N9ygcDp0ueXUzoVShHxBMFz+QQ+cvdpmaE5Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB8268.eurprd03.prod.outlook.com (2603:10a6:10:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 21:04:09 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 21:04:09 +0000
Subject: Re: [PATCH] dbus: Fix incorrect path for container sockets
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221006210210.1744501-1-sean.anderson@seco.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <e610bcc9-7ba5-5977-6548-b624ac9724c2@seco.com>
Date: Thu, 6 Oct 2022 17:03:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20221006210210.1744501-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: a67cb4db-326c-416f-845a-08daa7de4ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HTadQiKEqQDqosr3DSv2GTebevKalKWv+NQVg9cWmy5pORS8EnBVs0Toe4sOXicLI+YgAMozEGQODEtcr+W23uARt7Lgf5VBxLNNl6aiVWpOj9Ga2pgqkANU5nFdaRhd2VWh6dJhN+uLhOiamspuULAQpYB+/NCfJjg7vzPv+icQ5C5TgjN1+y58TvSzPe/tT2GBR56WvubsPivyrylUYqwx7DxJWNihpx/FbsTFuIDqoPe+GinOr/EGtR0Cymb8owr23qtFvz1xcQk4ZNBKW1hyA2yJrU14aJ9uuJiWM7kYUhHKmm4jKEyPczKgqUmp4s2GsbUXMzH05x3uvYttztW4s+I1q07SzQjHfJ+RDxcM3R5wW1ycFIkiJm0zfZOYaguQ7Bws2HZVzpaxbhu2sCJHUhieC6+146ISTXzLgXVid+cSYANiF2JNAkg2X2R2tWNt0WHEGJbfHZJOxIaeaYsXVQzQcqvIQu7wUieEpOx6sLCNxX9rIPF+YT02jqgilW59AwhDNk0zsADSJMb2HrRMq0Hkz8FlOSETP+cvIX4iRIiQomMxrnprNov0Vf6LQuC8p+i7DtHsTylCEi2NqBK8FNcQZhszot7u45pukTEgY8/0x+wkVNPjSw36DKAgS6hlABcCiuRNMnt7vee1AIPjLG06LPiCP16Z7XJs/Ld+SjBlkBHX50qS2gfADNm16vZmOGEX6SOhlRW+yBi7QY2QNU0dEat4nd99dX9nrEAF8lvb39ZoEywALAKZogf82NiddIzLTNGjt7Cg6AK3eQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(396003)(366004)(39850400004)(451199015)(66476007)(8676002)(66556008)(66946007)(38350700002)(44832011)(4326008)(54906003)(6916009)(6486002)(36756003)(5660300002)(966005)(41300700001)(316002)(478600001)(31696002)(6506007)(38100700002)(26005)(186003)(8936002)(6512007)(6666004)(83380400001)(2616005)(86362001)(53546011)(52116002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bG1rSjZqcTJOeVFPREJCWXo4Q0haTDZld1F0b2gyMllWSXlXa3ZWazIwQ283?=
 =?utf-8?B?cWd3cjhqNFRrYlMxUGIyMVR2V2xVbDVFMWg4cERObjVpRm5PWWR1OTRDT3Fl?=
 =?utf-8?B?WGFmWVlXQ2dBOE1ZWFRhb244elIzNCtjTDJCSTRhUzJRWVdVRmQ4QVZYMjRD?=
 =?utf-8?B?YlNTOGJvUTlqYnB1cEZIbGVoWVJwT2srUGxGQ2lzMTlPdDBkRy94ei9rY0ht?=
 =?utf-8?B?Q3BESlRZWlFRMm16Z04yQ0dKRVFYN09iV1AwdEg4TVk3SzNhTlQ3M3M1aWlJ?=
 =?utf-8?B?bjJDbXVrYjVKT0J5UDVpQ05XM0s0K21PY2RzcGQ5NXFabFByUUluWUJJajZy?=
 =?utf-8?B?NXFMRHE2LzVsems0Zk1GZ0dNeE9KanZJUi8xZThrSXJBNFdJSmZrUHN4aXU0?=
 =?utf-8?B?Q2dqZGNpTlJURnUyZnVqdkJ4c29KUkFEWU5Nc0dRUWQyNkRqUUpERE01dVdp?=
 =?utf-8?B?MGM1KzIxRXFkV21BcVF6V25PT1h5bnU1aGV1amRTbkhuQWZORnFJdDZxQ0Z1?=
 =?utf-8?B?Tk4yajJhU1BkV1dsV0x0Z21jN2ZLWlJzWTZPTkhlU0pwVzhKS1h3WFVRR3dh?=
 =?utf-8?B?c1dNeUkza2JzVlIrMjVwRElZVzBHNmxuTC9RcXdyVTV0QzJ6ZDArd0ViSDJq?=
 =?utf-8?B?NHhQT3RiZW9sQ3lNTk1LTWpUazFsSERzak9nOVNDcXg3UVYvRnQ4M2dGMnRj?=
 =?utf-8?B?Z0dOL3MwUmFhTlBRUVlMQkxXcmdzZWlISXBCdld4QzFnNU1vU1lDQWFCOEUv?=
 =?utf-8?B?M2x6eE45TTBVcWgyNlpWTy8zd1NvN1lvOXJtTGRLbWhEd0IyLzlFU0pxTExn?=
 =?utf-8?B?R3BsTUdKZTZCR2hLaVkxWWR2ZDlDdjU5Y01uUjJSWnNRRzllQ04xZTc1SW9R?=
 =?utf-8?B?RGx0NWNpQ2dySXVUVmdrWFhzZG1PbFRXMWM1czgxVUlHZjRaSTdkUU5JNjEx?=
 =?utf-8?B?TFVtRkNiMFJMSkd3SnZyUHhWQjdtdS9UdmxrT3F6ZEl0S2tQWURIWlpyUHFv?=
 =?utf-8?B?L1NlcSt0MkJ0OXZ2SUdBOFdLRmlJek5LYkFZMkNnOWJZeTBGeXlKM0xlazdW?=
 =?utf-8?B?bWZsUVdSVlFtdFMyRWtKYU5PdGxuRGZoWFpGZ1NMNVM2RkZ3MTVNeVZyK2RG?=
 =?utf-8?B?c0JId1V6TXFHaVFFTFQyc0NpWDhjdjVnaFNLWnZNUXRiUTJFL2UrVjNRcnQ2?=
 =?utf-8?B?ZGpJK2tzczQrKzVYSitPdDQrS2EyR0h3Qk1MM0xIUzJCK2ZzUGdtY0NKQUhS?=
 =?utf-8?B?bjlseXp1S1VtLzRrV1ZHeTNURnRhK2tQLzhlQ0VHOXNaMjRhdGE0RkVGcU44?=
 =?utf-8?B?dCtPMk00cUZXbm1NbUdSVk1vOWVCN1c5Mm43VVBva1IyTTM2SGsrYUpCZWM4?=
 =?utf-8?B?bEFSNys5RzZkcmRXQnpHZjlVZDUvOVpidUJZVDlhNTN2RkxmOFlqZURzbFpj?=
 =?utf-8?B?RWlTV0JiWmp5S09sbFFXZlpPclN2YWVPVlRHZ1ZGNkk1dUNZM25iRlprS09V?=
 =?utf-8?B?ZmUyaHFEK0hjWFZRR1FqNmprajFvSjBPRHdoL1E0QU9XbjZyU3hSN1Bmd3Yw?=
 =?utf-8?B?ZXVPVERNR3E3TEJMT1ZtNk1jK0NoTHVFWDl6SHNsZHhLcklXN0s5TEV6Vmc1?=
 =?utf-8?B?c2UxeEFxcXRJOEVZYkhJeE1RWkxxd3IyVktTRXlUVGRTakZvRG9FeVpNYVpE?=
 =?utf-8?B?NEo2UEV4ZjlZT2NtM1hNU0xBbkRtaG9heDhlL1ZGbEI2b2piZ05STlJlTWZD?=
 =?utf-8?B?MFQvVW9BSnJMY1ZzNURXQVViN01Bdys2MXhMcDNjamhNcjFwOSs5Wk03VytK?=
 =?utf-8?B?NGdMZUkyNXo0Y3NZTmVYdjhkWWN5YnBObm9zK3ZJYkR0VEhlZG5JWFU1cXls?=
 =?utf-8?B?SWU2SGdsZHdFU1d4UWxPZ2pHMXlXQ0hhQmwwNnJxdVFhQ0JYOGFZdGFPbGpq?=
 =?utf-8?B?Y0Y5dXBPUTZ4VWw1K3hJRmRlQzJxSlpvOVVaalhYOHhYL0ZrWGZOdnROVWJQ?=
 =?utf-8?B?NVpOTWRxcWFiKzdHQ1A4Mzd6S1lkbHhaelBoUWplNjUweThaQ2l1STE5MFpR?=
 =?utf-8?B?SE9MTUFQRkJoU2kwMWhJYnBJdGdtUWM1aDIxZXl5Qm1ZUFcvZGtLWjU3MVpa?=
 =?utf-8?B?dTFqWFJibkpoQmwwVDNXbldMZG1EK0ZtbmJ0NlRvdEhMNmE2QlFKYUNvckRU?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a67cb4db-326c-416f-845a-08daa7de4ff8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 21:04:09.3549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 N4jRBPSaDlOTTMFyOUPKeJqL2PcvRffhPID5Ouf984SDuwqxXlqfZX2fK/a/GqMG4clsnQpRoM288aXTM/iW5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8268
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 21:04:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171514



On 10/6/22 5:02 PM, Sean Anderson wrote:
> I noticed the following warning from systemd-tmpfiles while booting:
> 
>     /usr/lib/tmpfiles.d/dbus.conf:13: Line references path below legacy directory /var/run/, updating /var/run/dbus/containers
> 
> The offending line [1] is
> 
>     d @EXPANDED_RUNSTATEDIR@/dbus/containers 0755 @DBUS_USER@ - - -
> 
> We do not set runstatedir, so it defaults to /var/run. Set runstatedir
> to /run to avoid this problem.
> 
> [1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/master/bus/tmpfiles.d/dbus.conf.in#L13
> 
> Fixes: 4df1a16e5c ("dbus: Specify runstatedir configure option")
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
>  meta/recipes-core/dbus/dbus_1.14.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
> index 0046b9fda2..9fb1f777bd 100644
> --- a/meta/recipes-core/dbus/dbus_1.14.0.bb
> +++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
> @@ -21,6 +21,7 @@ EXTRA_OECONF = "--disable-xml-docs \
>                  --disable-doxygen-docs \
>                  --enable-largefile \
>                  --with-system-socket=/run/dbus/system_bus_socket \
> +                --runstatedir=/run \
>                  --enable-tests \
>                  --enable-checks \
>                  --enable-asserts \
> 

oops, ignore this please

I didn't read the patch I put in fixes >.>

