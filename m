Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA5FC35294
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web11.3463.1649406854406114556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 01:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=vJB8n6JN;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.41,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0cE///jbHyzEkYUcvc6tDOgEwjhw7I+pKgcQ2yNseAqoAtCQX63mKCdtzs3K3z8pm3n3TqxnJVG34KRtLa+UaWoD1V8P8vOKcSFuGb60SwXS/rMgFUrD0c1AQcqusXI1J7foDKySIVLhauvHKBM2A6NAWVsBhhyam6g5br8kEDjVBcT3CJms0tXjkYZPuxcq4eL/VHwQ1SJRTewyzO7NeMjLqqT7SpZikq4SNzJ4eikOC5J85yzmRQTRzKmM8JnF5hsw4ovtdl26FHqME9HfVSVlYfG+DhI6llEJc4+RLbkhSO/LN+NhfthAHhq7iR7GyIr1OQlyRcaGRTu3wq5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cb+sRz9msN9enQ143FgtaklIotONsIsBIAveJgGUYFM=;
 b=Q/KEGkNSqSNUwdbjADDwAhoycCgnZfCoqKpfxFv0foDhmrnyJUWx+iYPeRO1UCj5sEO5Kpc/qAOe8caNNGVw2nKIMhJoBeb8aB0OzDImT7VXH28uduznKyxhW1FaJxSvJUwDvkIyHq2cr+0/4qCa0v5q/LLbV3QY/6wrisFT7/nECiyGzdnpTSym8WrQzYErTtptt9+4/TXblIgssyojOS/yMc8xnoFzbogVlDJc+SLi3rvoqtAcZa6HHTdwN4rN8w3q2sK4/EjlV6+t1EOaJS+JrgWK5matepOr1YYVenOqDPfR7fiwQW6XxYT70PVZcuan1aHQOURJzMpdu4+aHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb+sRz9msN9enQ143FgtaklIotONsIsBIAveJgGUYFM=;
 b=vJB8n6JNUa2scGiFyODPAmbAXugT8gUMlJyQPztQcDhtjzD1RfBfvMl4P5qHixAE+GBuMNG6inG9MNvLOOHzLFGKh1wyLOtbuT8fDL+ZwVJBui8GI465hKf+c1MBHO+jdr3ZvSYnAifCLSdsdCDe2AB28LS2sDHNFBftpahQ9dc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 08:34:11 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 08:34:10 +0000
Message-ID: <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
Date: Fri, 8 Apr 2022 10:34:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
Content-Language: en-US
To: yi.zhao@windriver.com
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20220408081533.1705128-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0388.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::31) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f4a9f98-93aa-4014-1158-08da193a8e02
X-MS-TrafficTypeDiagnostic: AM9PR08MB5873:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB58737994B805505ACF81C45ED7E99@AM9PR08MB5873.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H1pA6/MuZ18jLdbHkZes8CxUSBEDlG043j/hPJneOxdKMleafo/TRD/yAHlqcqvJZE/I3iYMGub6XBjhp/MrkjxZTfELHHDj7StXy5+ciTAKAdV3YtjEQu/F0+5HbIlBWjoH+FL1yUAQN7BEvRN7yCJK+YctWDUFjRxyTug5kc0hJC778sKwj2U2UD9bXTu+5VqKQSPe8UtIdj8EGJmlqPwD+VIuOM538rBxaGp5AoMrS4wgrKV36jW5cMqsam7kuyuVQowB00vFNstH4mM+tdyQTbwkz+84CAYoMka6YFM4FQmZfRaSWmBtLPvXgmirQOTHTWBmEb54TBYnhLsWp78EriTuQRddcuQNWvJRyTsupir+HI5fzER/MWhReFtOOKfr8IIjsSd2ntGdBeHgLOIJroljHqhPflvaLGgcIZlDW6t8Jn/QLtiFY8QYjY+EApx0Wh0TpB4qF7KFOCoq45FidQ45fYchcD9PiMMg4G5Y5QrzUhHsJ8hyTPM+sEzuYD21TApvSFKSIzCF/0HachkWmyV56ebdZn4xxltwNSHsIMz5QeoFEBcg2+GtphMHXoKGHQN0JTcMOlTw9A09nc9HS2K2f/x2g/G3MzwoXSd8h31/DpbJ4ykcLWi1ntrZDduZMkCn00l7LgQvWgHkiYRLdZ4HtmbNK4dXIFELWPe7FZQwEFsplhi3MKmdvQb9r7wIg3Ufqe9Z6+CzTcVeybx5S4oxDH7RuHjiTc3wVV1r4luFwkqo3e1kVeiUJIESlgcX6v+9eY947Wsd4kl+iQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(2616005)(6506007)(2906002)(8936002)(6512007)(5660300002)(38100700002)(38350700002)(83380400001)(36756003)(316002)(6916009)(86362001)(508600001)(26005)(186003)(66476007)(66556008)(8676002)(66946007)(31696002)(966005)(31686004)(4326008)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEViME9HMHVrSDJTTU03cGpjZklORmt4WkNsdm81V0VUVnJldjNMTkQ3d1Fq?=
 =?utf-8?B?YjViaUM5V0Y5aldORHBsVmdJOUNqNThJSDNiWTYzbGI4dERNTlpscGN5WUZD?=
 =?utf-8?B?ZjRicG4remZVaEpqL3JTVjJwc1ZwdHBSajRFOWtRZEthTnlVUCtzeTkvU3Nx?=
 =?utf-8?B?T0xCbzU0NVJyMGU3UFhjK0MxSFhJL0t5L0pkSE9xaU5LSTJlVTV2c2pmdVBo?=
 =?utf-8?B?RWNEZDVOaTVZa0JkQlZRZTRRU0RIL0EvMUhpT1VhWVh5VmN4RFdjbHQ0d2xR?=
 =?utf-8?B?aEduSWZXUE1UdHBJdlZ0eFJwQ0VhRThRdVBxNUVmUU13ZjdvL2R5TUhvaGY4?=
 =?utf-8?B?UDBUeVR0RzhSUkNKbm1FNURpSVkxT3ZXZTZyNml4YUJtemU1eUJPSHE5TzBr?=
 =?utf-8?B?RGZEWXRQWXUrSXVUYWRTbWkyWnlHNFAzTE9nSGNUTlVLaGhJSGtSUDBSUEpz?=
 =?utf-8?B?dUxkaXk0VU8yeTd0VHlTZ0tUNUJHRFo5Z2kxanQ5dTV3T2hxdUMxeUhPOUpP?=
 =?utf-8?B?cU1xbDNYSFM1c2RrbHJ2b0pXNVJwZFRpelhOVTh3bEsreWtueXZyT0ZZWlNa?=
 =?utf-8?B?ZU9CTHFRMlBldlluaVJFN0V0S2ZaWGxVYURjbGREL2hBcEVPYXhyMnZCbEhH?=
 =?utf-8?B?cVpybTBJQmxyNkcxcWJaTnJ6dVV0MnN2VTN5c2dmaHBVb3puZ0dDNFp6YUhC?=
 =?utf-8?B?eXF6QXZQRFlQK0FzS2dGTkhoS25mSDdLSDJBRW40S0cxUTFlS1FGRGw2YWJm?=
 =?utf-8?B?b0dlTXlGM2VlazBFL2FDaGRoVzIyT3RFTUtOWWNLTlYyTFkxMHdqa0hRUUhx?=
 =?utf-8?B?Q3hQeU5LTGtzZEUzald1eDM1S3RIcUloUkNrdWdnSm9RckpLdG04MDZydjhq?=
 =?utf-8?B?cHl5TUR0dkF1NDgwZHVFdmVMdk9hMWJOTTh6Wnk5SG1rTWU5QnJuMS94OHRj?=
 =?utf-8?B?Q1k1amFCL28vU210OVlEbVp5ZktSOEtVa1hEYW1GOU5RVGJkbDhhMWlENG1K?=
 =?utf-8?B?WlZKOHBWbkp3NWNzZ3pucEtxMStqV1FMRm1GMFcwUEQ3WHZwQStwbVcwM1A4?=
 =?utf-8?B?cGpxdkdkOUpMWXM1MVFvMFplNzhUVG54ek94RmFuOXB2Vk0xMHZQMEhvMDN3?=
 =?utf-8?B?ZERmTnNmOVpJbzFPREh2MGJ5RmJoQUp3SGJiS0Z2QTY0SkRRcUFzWk1NT3M1?=
 =?utf-8?B?byt6MXBmYnErNURTb1FZMVUwU0lGazFWRUxrMDhWalEydFhHbFVIWXFjTWky?=
 =?utf-8?B?NDVVU3dlU0p1c011bXFpRVI1M0RMdWF4b3hSb1N4RmFMOHc0amdIcFkvNk5X?=
 =?utf-8?B?aThZT1AveFUyblZVM1VCV3d0c2JOaSsxMERvTkM3RW1RSFpHNCtZbUhjM3E2?=
 =?utf-8?B?aTVkQTkvYjlQbnR5Q3QwRlJsY0p1alB5ekswN3NFSEFHdnRrVldGL3dkeHhT?=
 =?utf-8?B?Zm1Nb1ZnY0lscWh3dzdWUUxIZWZ5L0pYZVFLa21QcWYyNU51RjdMYkNnQWFU?=
 =?utf-8?B?VXNSZzRkb1RNcGtpOEl3TC9lcG9NNDJCVzg0cE5xQy9US3dsRzVnUGJvbEg3?=
 =?utf-8?B?N21NZzdqM2ZtaUF0WGd3Rk40eCtadWFYWDBCSndyY3BvcTFNcEJNcHFUME9L?=
 =?utf-8?B?YWFIYThBKzJ2N1doclY5d0VLTFRKUnZhR1gwQmgvK042cDg3V0xXZjNVeFdU?=
 =?utf-8?B?MGpWQkJUei8zMGdKUmxLZ2RFcUgwU0ZaREZsZ2xlZEgwWU5RbVBQKzVzd3l1?=
 =?utf-8?B?Q08xOFd0YzUrSm5OWitUdWF3cWVZMjZicDNsdkRrc252MTJDcU9aa0VsTFRy?=
 =?utf-8?B?YVhuaGVCaWZUL0JZLzN3YVlybnpMdFlya3Q0WDgzcGEzbXJwUER6OGw2dm0v?=
 =?utf-8?B?cVhQQVNqbWtUVHMrUFpUNzF1VXY0ejN6K3NZNDBEdVpYZDRaOHdIZnJjTzlO?=
 =?utf-8?B?OElSY1ViR2FFZGQwcTlVSmY2UmtpNTRlZXArK0I2eUpIajlrZmN5NGNYbXBP?=
 =?utf-8?B?TWdXd01uSW5kTGthUVIyMlZCMHZkM1FXSnVicDRma3VqVUlNUTh6c1h1RDM5?=
 =?utf-8?B?MUN2U2d4L3dSQmpLWHBpbTk1RkxDRi9ZOVphaExIQXcwNjJ1L1M1VFR0UG5W?=
 =?utf-8?B?TVhpbFRUTDBJVnZNMzdaMUN5UDc0NmtPUC9kUFVGNy9nNlNnb3VEb1FPdThC?=
 =?utf-8?B?TkhrVnZhODQrQ2ZWYy9wOXFxTFpwcUY0MDdma0RxaWV0WnI3RXlCcS9JMkhV?=
 =?utf-8?B?MjZOcGlJQlMwbG9kdFRhaFhwUVc4MVlkWWRIZzFxVUxIOGxIZ0JPS0VuUHFW?=
 =?utf-8?B?dmxSc09XdmswU0dDWkdYczYyTExtV3hQKzZPMEFUUnZGc3VqWGpodlFDM2tI?=
 =?utf-8?Q?AJfpGiUMtXDNtw0k=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f4a9f98-93aa-4014-1158-08da193a8e02
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:34:10.8894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 obI1dEBhA0rO0ZoLjNOk3kYrWCAQb48aahzO58uaVMFH3NTEon8DHsdjsP5wbWrWJ36RvY6pE8X8mYW+6iOlHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164156

Am 08.04.2022 um 10:15 schrieb Yi Zhao via lists.openembedded.org:
> There is a bluetooth service startup failure:
> bluetooth.service: Failed at step NAMESPACE spawning /usr/libexec/bluetooth/bluetoothd: No such file or directory
> bluetooth.service: Failed to set up mount namespacing: /run/systemd/unit-root/var/lib/bluetooth: No such file or directory
> 
> This is because the directory /var/lib/bluetooth has been listed in
> ReadWritePaths= in the service unit file but does not exist. We need to
> create it before service startup.
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 79d4645ca8..ee2cdbcc59 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -102,6 +102,8 @@ do_install:append() {
>   	# Patch python tools to use Python 3; they should be source compatible, but
>   	# still refer to Python 2 in the shebang
>   	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
> +
> +	install -d ${D}${localstatedir}/lib/bluetooth

Please use systemd StateDirectory= [1]. Maybe it is reasonable to 
replace the ReadWritePaths= with StateDirectory=.

[1] 
https://www.freedesktop.org/software/systemd/man/systemd.exec.html#RuntimeDirectory=


