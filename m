Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE687C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 15:00:09 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.87])
 by mx.groups.io with SMTP id smtpd.web09.25056.1661439603849311202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 08:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=cy/cvGFM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.87,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVM2OShzM5a1nDgpLzlczv2Sj6qoSZg8qDyOzaFFiwTQAkdC/KY7Cfxz2ZO766CSlInub7H+BifCJeVaxoX7NCD4iXHGAmvAFSxp4qHrT7gG0KkjcEg5uwU+mSpAdfe5WPUtkYlaVNClNh6Xlwhp8bgFXAAK5jZk83K+SMFKR7Rv9FFmGL/NBHaCeLJQTJVkHDovZfPaHD6pVdVTXu4gMZ8LMhsg5NqE4dou8sVo1RtE1fGU9LAYJKpSkteHgcU4F/I4tDObPvUx+ZKNKkOnHCP0qiU5LXPG7gIMavsQyF2DHhUVBkyx4lMXI0nYGPTLLkdRjcKmmlXyuCDKTOF85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX5RaBzxBvZQYcZWheXcChwK4HI4O8dMTWy6c9q2tNM=;
 b=j6b43wec7YvhLbH2RPRp4Sn3+GThzQVrO0ZSsPHij4H9ESU/TJvWeDc+z+TL2CJubE+zj/8SNMLE19zx/1Lo9YalHyGvcSUsGwCsi35vfurcOrVpb9y28wNyotKQ8UytpkuAbTD7ttU/QoLbnPnUws+dU0SnvgWz2U8jRZq15miT1Iy39qekZFKcRkovxkVTeD9TiA5V/hBtL8q+OnmqjDDes7/Q9sr6SgFmOdaSQoH49R0zZHuX+nGW45QA+VPLZe/an8LP7MGqrxI8mJTjGajVz1ZA7Rd63avGUMKRaAGRpQ4F/tsjomm5kBeGaoYJshJWbe16BaX21ZNbDU1rjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX5RaBzxBvZQYcZWheXcChwK4HI4O8dMTWy6c9q2tNM=;
 b=cy/cvGFMrWBMSGQKKevKHhInw+mvfUYsKJNxjgEf6pc5qXvRVyfydbVQqVgLCM9ZGcacHeDERhxm7DmtEpX+lQKIYQYDEHS2HLjSX/6oJnzKv+6eVQ9YxK95xD3L/QhArohGbAC3E4EXiWKYMUeO5QJZKRCunJ8fT1QPppGRWk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB4840.eurprd04.prod.outlook.com (2603:10a6:20b:11::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 15:00:00 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 15:00:00 +0000
Message-ID: <2d8ddc57-2f9f-f909-3b26-6b1810ee5d83@theobroma-systems.com>
Date: Thu, 25 Aug 2022 16:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [oe-core][PATCHv2] connman: add PACKAGECONFIG to support iwd
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>, Markus Volk <f_l_k@t-online.de>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220824125037.4855-1-f_l_k@t-online.de>
 <D7DA9B94-3FFE-4817-9279-3420BB423AC2@arm.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <D7DA9B94-3FFE-4817-9279-3420BB423AC2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac088240-bbdb-41a8-7934-08da86aa7b56
X-MS-TrafficTypeDiagnostic: AM6PR04MB4840:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H4Oh3tRSKOPg2T/Myw6rKkYznqN+0B1p2padsy2rzEcVkHWMTIyFJmMp0fLzh/bYpGn1Z++QVPjBycFauYLs+hrS9mpZZrPGnEu7u3vZ48s2ToxUadEWZ0CAtozliKewFY4xssShJDKnN6hQ7qvzulxouh81sbCFVgEwST/QzHq+DvaN7yYTeISzjIprL1WxBdDmV5yvOz1l24cAPX3BBJUt6fx9bfcdh/Wmzevi4dZ61+EFf973EHOxaZ44ENQAT1CiLmbypP0M6GH90L6eFZYmM5ZyXZ2ch/FouTUp9xFk9YIL4CYYkDzfRVWLtmeKoIXX8VaYg/XfEJz+doFPPbxAyX0B7okR0AYyUc5bb7pIFqf8iKyxmWiF5YhdPLga9UK1vtkwWX//C0W9Ad9s+uPFr8BIYUACeka7BNXLdOoUgbaqZbh5lIrH1ID81sqyYChSD0CT/Wu7tjFltL5nWHdtxwosABeERZTN7BqJkRdjmHV76BBBTw8aIBR9V1XnvAixrJvCSqCe2aUkhcpwlrYWqHOs8KMJ3ir6gUXVvRPArd2s3ghfrpAmYoeoYfQ3mdcn1IXAKuvWYYuGr723wmzHW7Wrp4QjNCVvTS/vwvD6Bu+ZiE6G6WFEABOjTU8jHXrqYn/CWJ1CG78lyV/oH2UnAtCZpj2UZl0Jcm6LMPxBXQ6FQv1ezPGge7g6h3K5TNEzeDIjkXj8no2hqPaZeMnOashuRJczc3BtE2DX8OQ29rZZMJOM+Klmjy3Wrf30J2/Z8uFjUhPJnuuQVKl1fLoq+GqdPC4Zl8wxWCSqv87ggjhmBzSNz4QgwpB9SNWJ4btbAuMeRvaX8GgNChDPBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39850400004)(396003)(346002)(136003)(366004)(66556008)(38100700002)(86362001)(66946007)(31686004)(36756003)(31696002)(8676002)(66476007)(4326008)(110136005)(186003)(83380400001)(53546011)(26005)(2616005)(6512007)(6506007)(41300700001)(478600001)(6486002)(966005)(316002)(2906002)(5660300002)(44832011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDFsNVN0cUhmcnRhYkZyOHNjYVZ5dFZJandNTWxNSC9Uazh5OUF0ZjdXK3NR?=
 =?utf-8?B?NTlwdE44UXFSV3l1Lzlia0YyUWhBclUzdXM0SzllaXJGQTJ2T0FqYVZQdlRK?=
 =?utf-8?B?MWwzUHVTMGpjMkJ3NzhqbVdPV3VMQ1ZmQ04zNUpXNHJZblg4ZDNtdVg1RzZO?=
 =?utf-8?B?elZSWWdSVWtOcDJxYkZDYTRxUXJBZHFQNGZBdW1DOGVZdGpwaHlUQmNpRks0?=
 =?utf-8?B?enR0akE4R2xBNnZla05jbjJFTXJNSDVjWG5VQjJscmMxYjR2bEx3RGUrRmRt?=
 =?utf-8?B?NXFRUXZ6cnhPaC9uWnJCYXR0MnJyckYrMkQ3eC9odFB4Y3BOU0hrOXRUZk9D?=
 =?utf-8?B?RFBWY2VTUTFjRmpRdjd2d1Fsd3ZxTGNIYmdmRmhvQ2FrbktPNmorU0ZmSUsw?=
 =?utf-8?B?UGNOb250QmhyKzRPcExlS2xTbjN1Qzc2YzJSVklqOCtaLzNzczN6dU8zaUdX?=
 =?utf-8?B?aDZxVzg1c29hbW93VU42ZC9HUTQxR0xlL3U5cGNUL0lKRExoNXMvbDZvZTd1?=
 =?utf-8?B?aTc2Wnk1RnZXMGI5UGpjL0N2SXBFaXJ2WGtKM1NuS0swZERhcTByMUYxSnVs?=
 =?utf-8?B?cXRjWWtjWWpGYVZDS05UdVdiNWM1OXhLNXdwczA3L0dvcXloM2phTlhhbmhD?=
 =?utf-8?B?NC83UWJPSEZNMDJiQ2NLcGNTb2c0WnBPNEdNbFdpakl3RGttN3NkK2RCekph?=
 =?utf-8?B?SHZ5bnhxNTg3NUJQRCtuZ1IzeUl0WGNGODF4RXVzUDljMkhJNDFBNy96NTY4?=
 =?utf-8?B?NTF0SmxIQ2FxbkpBcXl5dXJPbjdKMUJUZHZlbGozY1JkOHFpbUkrcXFVSUVH?=
 =?utf-8?B?dEJXMENiS2trYThsWnljdUJWOXpJY3pRZS9VT0haRFhGbzNvZXZMZVBPZ3hV?=
 =?utf-8?B?b1FabzFWa2xiYlBadlRnQVBzUGNMSnRrV0duTG94K0tQWlVDNnhQcHVIampF?=
 =?utf-8?B?ZDcrVkdnYi9LSTdxRE5uQ2d6WTJyOGhWbVRoMXE1NVlralFFdm56c1pOU2E2?=
 =?utf-8?B?WlVoVENHU2JZVFNKUGV6YjIrTE1mTkw1WW51UTBOeWp2TitpQ2tJNWVGTEJE?=
 =?utf-8?B?QTRxMnZNRC9TaTB3VlBXVElPT25kbnNkdHBxWjVZVVgzdUNsL1c1OXpIT2lV?=
 =?utf-8?B?bXFlc0RNaDdLV2RKa3hxZEZCTDJuZUR5ZEVPeVhwNGJGWTdtSERPMWJ4RHRN?=
 =?utf-8?B?dXR1UlJsMWdVaEJUMXNYUTREVXhyL1dCdEJRMFZnSFE0L2lyR0hBbkJyNjUy?=
 =?utf-8?B?dlYzOEZGNDJhUVFYVytMSm01NEVLWldKOSs5RVNHS0JLRzdOY0lSUE41S2x2?=
 =?utf-8?B?OE82QzNNVHNvUk5yTGFiaTJrT1ZreWIzZkNsR0wyOVlBNzFCekEzTzVjei9i?=
 =?utf-8?B?RnNtd2dWMUladmNnd2dGeXpUNGY5VlBpbmdaWTVkOFZDU0w3RlF2a1NTdjF4?=
 =?utf-8?B?Wjd6dTZGT25KVmV6dVdycmpSZ3lSTW9ETU11K1c5Y1UxdWNYNFZjY3hHSkwr?=
 =?utf-8?B?VTVabk1rRllUc0VKZ2xoeG9xQUVIbUt2K2VTSHZHZ2VIUllVbG0rNHlBSWZM?=
 =?utf-8?B?VWV6RjNrcnkya0NMZjlEY21XYk03cGZaNFpQZ0dlQ1hkamtuSzdpcVJFcUVM?=
 =?utf-8?B?cFJxU1Y1Y0liOENJaElVakJWd2tTMVU2QlpvWGxuUVB3OWQvaTVrR0Z4ajBD?=
 =?utf-8?B?cVcxRmpZazBLZStOd3hhQndnbVB1RitVeW5uS3ZnbTBjektVdHVoZE9ZMlBG?=
 =?utf-8?B?bHhsQy84dlFZL1pveW1OMzYvdmlIYnNwU0ZhVy9jaXlFdzdHaTZralhJUzhE?=
 =?utf-8?B?L2hJZVVoRStYV0dwRjd3RGtNYXkwQmhaSkk5MkkrVC9zQ1p6RXBVU3A0bVJw?=
 =?utf-8?B?NmZtbmw1SW9WVXFPZ1lZOGllUnpXT2RoOEZNK2Z2eGVHZVRiMkdXak02bVlJ?=
 =?utf-8?B?K1dmWURLSzdHdTNETXJmL0N3VmJURHRXbXo0YldaZjIxK3ZSNzlEQllRaWpt?=
 =?utf-8?B?MFRVdWx0V3BndzJSUk13eUk1Y05GTjZaKzI5UG1OSlBQODJMR01ZUTd5L2t0?=
 =?utf-8?B?S1dXZytadnY3Yk5EcENzSjJTRXc1YjFFNzZBanJaRk9KUTVrZEZoMDdnM3JX?=
 =?utf-8?B?MS9CK2JuOFBJUGZORTRQRkxHcTlQNHdiSVdRQTNMV2tEeGxZT3NKMGp4UHBV?=
 =?utf-8?Q?yM8j74YRp1UJw4qBxiXap0c=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac088240-bbdb-41a8-7934-08da86aa7b56
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 15:00:00.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bkk24OqnPPC5gd6AEBRP040aiH9qmVhk2VVJMIR2/6u/643LLGVewEUBAvnowOzHO7oWRXK7euBNBXG2fXp3F00dObIZtoQ/LubauyjZtRSND57IGANDXcH/dcV6vfv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 15:00:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169877

Hi Ross,

On 8/25/22 14:17, Ross Burton wrote:
> On 24 Aug 2022, at 13:50, Markus Volk via lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
>> +# For smooth operation it would be best to start only one wireless daemon at a time.
>> +# If wpa_supplicant is running, connman will use it preferentially.
>> +# Select either wpa_supplicant or iwd
>> +WIRELESS_DAEMON ??= "wpa_supplicant"
>> PACKAGECONFIG ??= "wispr iptables client\
>> -                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wifi', d)} \
>> +                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wifi ${WIRELESS_DAEMON}', '', d)} \
>> "
> 
> This is over-complicating things.  Why is the wifi daemon a special configuration option?  Just have wpa_supplicant in the default PACKAGECONFIG, and people who want to use iwd can set PACKAGECONFIG.
> 
>> +PACKAGECONFIG[wpa_supplicant] = ",,wpa-supplicant,wpa-supplicant"
>> +# iwd would be required as a runtime dependency. it is nevertheless given as a recommendation because the recipe for it
>> +# is not included in oe-core.
>> +PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd,,,iwd"
> 
> This definitely should be RDEPENDS.
> 
> Note that if wpa_supplicant and iwd are mutually exclusive, you can express that in the PACKAGECONFIG:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_ref-2Dmanual_variables.html-3F-23term-2DPACKAGECONFIG&d=DwIFAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=8HjNGWSBnokVx86ZXb1HGtJWTl97isWyKhlw05xayeDV2PeizRV-8Et7M2oILR6A&s=SRukmgE6s_F_GQ3lRKUJZhJHBYIoHdF3lYfYPaNoS8E&e=
> 

 From the comment " For smooth operation it would be best to start only 
one wireless daemon at a time." I gathered that both can be enabled at once.

If we had --disable-wifi in PACKAGECONFIG[iwd] or 
PACKAGECONFIG[wpa_supplicant], we would be forced to have both or none 
since it would be part of the PACKAGECONFIG_CONFARGS if one is disabled.

If support for both at once is not supported by connman, then the wifi 
PACKAGECONFIG is unnecessary indeed.

Cheers,
Quentin

