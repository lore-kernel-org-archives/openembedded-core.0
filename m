Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12403C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:23:39 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.52])
 by mx.groups.io with SMTP id smtpd.web10.145.1668788610820300502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=D35kB0Fz;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.52, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OexlrxPxoziUeoQoJPC1Od6lH/zTO0PKap0RoGTyF0LOYr6Gz1fIkI+++J96rE05odwvElzXezxQbywikaWL0nnBL+Gd7CFNNiNPxPKbvrrqPQzcJsP1sudJI70xpYlF/Eb7KHmRmMkirgL4lN76IFZjnI9EB/9Auh3+7xqpbmUJQMV1Myy/RW5YR7XntazrIixyolVfBNKjUMtMuxfhCPTn/ynta3TWz9TmPMPnlfuHH352RsNBnmNlHuGW+QRCWWhgwaRJ2cjOfcu3LbaWtBMgSrrIL58FlFpvKBW8mCmCLCHuIb5aMlqFgjsaipicq/pW3qBqXG5MbESk0u5Pug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzEBK4VVH+JgskTMK40+/WNNzIQxFP6Xyn6+RRusuSY=;
 b=PngcXz7NPAIidNb+GPvfJXWhvaFRveow3P6QtdxDbDAkwMsuMso9ONmlfYp0aDtQJHeZvS0DHOUhmczNDS/lOHph5Uz7Y7b+iqVU65z/ClflQ22UMiGmgUefuz25oyrhAq4Filq7mf7tFW5TFUMeMqVHTCdr/tL5WdnjSEXxIhmsnCkYZKNQ1E3xjcNhZZWTgTUIq6FAgFY3daKjdwZlulB9uuxbSvNFLBhSxX36aspQf4tAD4/aaBq/bWGfnoFU91bs6lDw9QBtA6nb1Wv53rsei+3oMNybWqBxnOL/q3qq9bq/zCUBf+YVWhxK+kcJjyjxRunUbpwUA8Er5qYbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzEBK4VVH+JgskTMK40+/WNNzIQxFP6Xyn6+RRusuSY=;
 b=D35kB0FzTApvGACF6uHRCPVjeXgZVlhnCo7jAhTfY7GzHQLDvKF8b/yFrncLPRE14UCh2p0bFvdDh5OpOm6a6xsw92RawzitDCbzldBP9IwaO7IJBLoD8smn2SO3EA3VpMpJzSGvs44smzGduQLXap/QnG/p3s7joUmlQxpVwb/wwWmuOdsFp/DbXKYvX5ZLvAQ4K0lEKEQ1xKCN5qoxxnSqrZEHXUOC4FZxEJNb210cSTLM3LzgYOY10c38wSO1zcikdtDm2orRXEexN3MTiivLQ/XVqzzMjT3pN6ok2gWK066S/YMZ+2gD11kEIS8v5PKC6IxZioQIJmSChurlIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 16:23:27 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 16:23:27 +0000
Message-ID: <e5041239-1dd2-780f-c18b-48c1264609f7@theobroma-systems.com>
Date: Fri, 18 Nov 2022 17:23:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [OE-core] [PATCH v3 1/2] qemurunner.py: support setting slirp
 host IP address
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
References: <20221118160828.3939869-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221118160828.3939869-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2de491-aa3c-494b-9d1f-08dac9813901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZhIi441jOrg0smthwB9n1lutCgZsWHggTxYZp2XMc1GQL6vhy8pFzsb9LE+WNeXSKgJR697Xi7tq7cC55pGPGT4RzmFC8e1a+OLphBMzbU/7Z3VxfhTkOqRUhc9UJk3P8BmDJLzn9b/8Fs+oRfCzsPhrGmsBnPGqDccDPJoG7UR7GdM/m2FBmVVG59InkC4x3xE/NLCmWcvpg+BT7IPmW+uk45/CBSIGnNYgNJAgxHAe3cvx1M3OVrAjdRimUwOB1NciBpNklMf7ZQ1iNkabTrk1/BrzwvTkd6FDehzjizoL0sUXr+MLAuyzFo/Yly3Jd1A7PCMSLOSO1cy5HERt1uGwDEo1awKFodIZy31s+Dx+X+V8rKw1wsRN5L7ZISGWK3VYrf9GIv1skMQ0d8xD/bIB1Fk6JQat5DVFWsnVgMsT2un3v9x9P9VYIWYLG4zKR+m/bew/hgOYOR42giTzoY+TzjxmQ9sYXek7imvxvmCFi6MnEBggn+6/jp001OW4anIOnmWMy1/EBBe6G75DPC8HCO5FtuK4W4k8hKHNf/Mhthed7g9yy7oWsWTsvlSCG7gyYVduuu+V1Cd6Nfa4m4m1bv7OOPmfc9iz1KCBvTz9kCguxU+VCbFrKvSACbRgxv9KwO43c9X6FIjbJqqcmNr40YV1Z3C9dQt8uP74ww5o3Rvw5QOA1C8JMHjrGabSpKwtyi+Ul9KRFmbJuUL6N/365gXifD1JMsN+2Obzbm4Cy1eYFw0K60IskUQxi4J9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(396003)(366004)(346002)(136003)(376002)(451199015)(36756003)(31696002)(86362001)(38100700002)(6506007)(31686004)(53546011)(316002)(966005)(6486002)(478600001)(44832011)(5660300002)(186003)(2616005)(8936002)(83380400001)(2906002)(26005)(6512007)(41300700001)(8676002)(4326008)(66476007)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVhDa0dQaVdiQTVraHJBNkFERkNLanpXOUJIdFVybGNvWDVLMHdhN3JwTHJI?=
 =?utf-8?B?dlVLdjI3aDFhTFZJTVNSQ05rU3hxNlMwWUtFSXJLaHNURk9KMW94aHI3bmJ4?=
 =?utf-8?B?ZFJpTmVwSnBtaG92ejZPOGc3OHpMaGRTL1UrZEdyRGE5bFhjbGJVek54SHow?=
 =?utf-8?B?eUNzWnQxTE12UDJWUUZuc2tHSlp4YXl0aktSZWJrY3Z3bHpuQ1N5SjJvVUd5?=
 =?utf-8?B?VDBwb0c4YldIRHFVTmg0YSsxNXlpSEk1SmZzWStxMDFEY0xqMnVqUmlJa0tp?=
 =?utf-8?B?eStBUDFubyt4MDFVN25tTFBWWVNUaHNkU3ZQS2VvcmFmeDcvSit4elRRajFV?=
 =?utf-8?B?OExvZHBma2wxMzJBZlBxVEJqVDRnRkZQRUdRaTlZVDYzTzk4OWJ0ZG5PZEZ4?=
 =?utf-8?B?cUhyTTZ0VkhSeU9mODk1WWJWRzdSS3hobG5oNlQwbU5CMnBSU2VwREZRZzds?=
 =?utf-8?B?RExsYTRjRGxFbFFscHdqMisrc1pUNGVkbnV6NVU2UFh5OTY1aE85K0YySmw4?=
 =?utf-8?B?dWsxMnpQcHdDSnpCQ0FTa3Q2SGJIYTlTWHoyTVAvNUFieFZFYmllUE5JOHBv?=
 =?utf-8?B?U2dFUmV2SHVIUzlZMUdTZmJOY3htbjd3aUN3VDlieTZGSllkeWc4bStGd1VC?=
 =?utf-8?B?SktCZ2pBTytVTDNaellROWVITUY4c3MwbnpSRkZQU2dORDh3WWtxeENHUDVL?=
 =?utf-8?B?NUo3Y0hoUWxFMjlGWDZiMzh2b0tQdUtudkl5cnNyZGxvZnZWRWdObkhVU2xu?=
 =?utf-8?B?dVhXamF5OS9qQ0F2M2FCK01iVHFUZDc0RFRTZ0hEbnUvK1lKSHcxK1BtN1pW?=
 =?utf-8?B?b08vQ0NmSXVUbGFsVlJCcWVyV01yYW5OaFZxTnlIVFZ4WEw3WFA5TlN6Wkl2?=
 =?utf-8?B?N0FqZFZubFFFbjVJOEZrNHVwNnRKRzBOdTBtaFR0bFJLT1BKQ3VTMWhUUVpi?=
 =?utf-8?B?MytGL00wc1RLTDY1ZUw5Q3REYXppamVIMGV6b01MbHJJc2FpUGd6VXpzTU0w?=
 =?utf-8?B?UjJqSGVTdWorMWREdVVaVnRtZiswZXRDekdXRXZ4c2NiQXdBVVBWU0lSS2pw?=
 =?utf-8?B?ODJOY2xFeXplZTErU2E5M0ZDMnRpNWNmMzY3VEczN2pvU3NzYStwdUJndllr?=
 =?utf-8?B?SmFDeEZSVWZQNUtoQmJVbGx0dXIxVzdQbDc2YTdqQ3BsR3lpMnFGNEoxTFRv?=
 =?utf-8?B?L3M2UlN2WmxHMXhRTmo2NjZsSDBZWkcxNks5ZFlFQ016OG04YXF4dkFmNjNx?=
 =?utf-8?B?VWpSRDFqamJwM2x3eDZJSjQyL3VXbTlQT1ZZbDBQblFSNzU2VnJWN3dIM2Rm?=
 =?utf-8?B?MDRMOVNrOEtQcEdBSlhSVnN6NzIwa3pBTm1RaXRGZmJMK0xUYUs0NGhwZ0ph?=
 =?utf-8?B?bDNENHhTU0F6eUYwNEd3R3AxRUxRVjZXUXNJcTh5QUdhQlZaVm1uOW52cFBa?=
 =?utf-8?B?RTNxdXdjN29HdTBrOEc4Wm9MaTdEa1NPMGxvcnNkblQySE1aR1V4Uis3SENJ?=
 =?utf-8?B?OHMydVViNnp5enNHUmE1ZmtZRytOQjNQTTZaNGJocS81czR3RTdRRGNEalFh?=
 =?utf-8?B?UHJYQmxad1VwekFJVmxrYnRnYzhTOVhTQ0o3cStWY21lSVBwZEI5SVc0VUQ5?=
 =?utf-8?B?VjdBYkI2cWozZVB4SHF4aTNRMFh2U1J5RU5BSGI5aVQ1eHBjbVBsUjJDZjky?=
 =?utf-8?B?eFRZUkQ3QW1TVVRDeHcrblZrRWIvQXFRdGVzakd4VDZUSXl2S3llSTJxNHY0?=
 =?utf-8?B?S2RXN2hVN1NSYnNOVVppS2ZCMm1LRVhGdmtPcDg0N2c5RW5ySnJmKzFOMjMw?=
 =?utf-8?B?QktpNVlNMFRLM05ub0trc0Ryb0JhTUI0U0owSUE3RW9XM1FIVnhrMUhtK2to?=
 =?utf-8?B?dk52T3YvUlVkeHUyMW9KTHFScXVhMlVVYk1pREZldGtXNDk0b203UDVBb2to?=
 =?utf-8?B?YTlad0kzRVIwamYxYmJ3U3RrVzI3ZWQwbFlkSW84QjdNdXpvdXR2a0VrS2hB?=
 =?utf-8?B?WkVHbm80ZGlNQlhnbWNSeEFYSnpRcXNFampEREVPWk1tMFRqSVB5elA0QmNO?=
 =?utf-8?B?MFlmVHJ2cWFKWUJTUHN0V2cyaitHRHpNMHp1elZ0bkFNZGZBeUlxOS9GNldW?=
 =?utf-8?B?V0FKaHBERmxyKy83QitmT3pVelBTMU1Dc3ZZdUZKQ29qN0VmRm80Tm9EMklX?=
 =?utf-8?Q?IOVVfu34psRp1+Q7i38DKBY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2de491-aa3c-494b-9d1f-08dac9813901
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 16:23:27.1810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jy574Rr0uR8WybQiFc9+rmHdp06E/K/s3gzwh9tfsyhDiQRl1Zz0nVOWSOMI2fdrFOwgiTSg7SZkN5hvu24wR5Y+YKXpTbsXKncowEGDgfEcKIxvIqpLGnl1i4l76Ny7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173477

Hi Mikko,

On 11/18/22 17:08, Mikko Rapeli wrote:
> By default host side IP address is not set and qemu listens
> on all IP addresses on the host machine which is not a good
> idea when images have root login enabled without password.
> It make sense to listen only on localhost IP address 127.0.0.1 using
> config change like:
> 
> QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"
> 
> This config works for qemu itself, but breaks runqemu which tries to
> parse the host side port number from qemu process command line arguments.
> So change the runqemu side hostfwd parsing for port number to ignore
> the host IP address field.
> 
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> v3: use IP address from command line too
> 
> v2: improved commit message, https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/173250__;!!OOPJP91ZZw!nc5rsa_z35-LR56OMU2tL-KBM9kWHZcqgS1SrAHixpNlYyMcTmapd_Lpj3I943ZmEYiGYf7HvBu8YBNgFBnHoWtOuAEQkgIHwtaHDQ$
> 
> v1: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/topic/95016024*173234__;Iw!!OOPJP91ZZw!nc5rsa_z35-LR56OMU2tL-KBM9kWHZcqgS1SrAHixpNlYyMcTmapd_Lpj3I943ZmEYiGYf7HvBu8YBNgFBnHoWtOuAEQkgKJOx__4Q$
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index e602399232..c285f30c0a 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -401,9 +401,10 @@ class QemuRunner:
>                   cmdline = re_control_char.sub(' ', cmdline)
>               try:
>                   if self.use_slirp:
> -                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
> +                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
> +                    ip, tcp_ports = tcp_ports.split(":")[:2]
>                       host_port = tcp_ports[:tcp_ports.find('-')]
> -                    self.ip = "localhost:%s" % host_port
> +                    self.ip = "%s:%s" % (ip, host_port)

Now there is the question of what we should print in the event hostfwd 
is set to tcp::hostport-:port ?

Should we have it return localhost:hostport even though it is not 
entirely true since any interface of the host can be used (provided the 
firewall is properly set up) but at least it shows one way to reach the 
QEMU target and it also keeps the current behavior? or should we keep it 
like this in which case it prints :hostport only?

A ternary ip if ip else "localhost" would be enough.

I'm picking nits now, so up to you/the maintainer on this :)

Cheers,
Quentin

