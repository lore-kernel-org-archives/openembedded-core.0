Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78204FA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 11:31:17 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.76])
 by mx.groups.io with SMTP id smtpd.web08.18002.1666611070512417089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 04:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=LPqH4/J+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.76, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4ff5kKq9epHIToVVPo+DeaZmAqmcZVMQkU7LDIbeBHUEMiHiOg1zqbB0rg3qPgHeCJQWgCaKQwBqCfImFTA5ZbQR0cINOPwl3gn6dVnTyFFMWpuHI20ogOV6VBi0CKcdYLq8T/0zGWNpq+gRKbsDvCnTNDW9n3RCHmDpN6w6TcvM0Hbgv2mXogqzwqClXRFOlM31/0JYaZSn0c9rktT6KjOL2Z5MvRmrU7Eo8ED9KaikIId618qSpalrJ2hBgliPom8hvfcYYo4HkKUpxZlv0b2zN9ky1SGMGR4IgE18zil9tWkEjM1LULIUyqqReEDXgg86f4n66w5+LzQDJX3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd50+IMdMcCZmegndJvpBgijZwbRqm647gRuQ2/mV7c=;
 b=WN2cuftZC5erbBJXEMWshcomQ3YSSds+Y7Y2xU41xt7ZQLhiFMx8KFpgTpt4chkOM96fdmvHv2k0BhFjpi7LLQv4V+H5ZQ9prAcS76lY/kyxvDF5fefnn09HCl0M0H2OSNEgO0SkdqFmyY9+Tasvv5g2pBxe14qOL9MoNd2Lngdr1APm/ZDcj79hqYEQ2y7iDUBVxl99Mhhr1H6OGhtqSqFfolxJyswJiGjWp2H85DnBIUGIHfhyNwyPgZGJxMVcPOBSaHJxF20mrsGdZwYdk3tO8uU6knPj6+QdDZu/spxGXhnx8lqbkOTRIyFc619QKMEH7gH1WIQrqu7AXQPZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vd50+IMdMcCZmegndJvpBgijZwbRqm647gRuQ2/mV7c=;
 b=LPqH4/J+0VyVIfSEw4emX0/I9WDK1h4gOz3Pve+4Wa70nog8JnsaUSStW/nk8P8JnEMuvzalxWFGxYoSOBq7KcokfmkWRfBhJAD6uuD8JIe1/IZfyZhrLOBcsYU3fhQSdNltdc8sFMYhWzrFa5cSk4/9Po7+HXPpPcKuIVq9jAI6LJXKUS0HhXya7XdQMjx3kR+KIIP5YEFrTAZLueQvkiY+5z4LNIX7Zn366Bt7SWH6rqB0Yv1dRY3j13jOhMGnuU2JSph6uyhjpz4DPNIHxaL69ivTPIVIdnoIOMK8+oYQuB3FJx9GJAARbb17OW/lUWFkzp1iqqAf2a5ydJK58g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 11:31:06 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 11:31:06 +0000
Message-ID: <7c4f253f-4c49-9aef-4be1-6a9cbaebd62f@theobroma-systems.com>
Date: Mon, 24 Oct 2022 13:31:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [OE-core] license manifest files effectively disappear when
 do_rootfs is not rerun
Content-Language: en-US
To: christian.thiessen@airbus.com, openembedded-core@lists.openembedded.org
References: <CANNYZj-p9vce2nRGHjKJ0-VqGEaF0Ed2X-YMgFkfos4zJDiEWA@mail.gmail.com>
 <1878.1666609514952259746@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <1878.1666609514952259746@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ce81b6-ddb1-4d51-4261-08dab5b33db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vfI3sgwZ0B7bc6Fy7gwfXkY0I7k/XInqlv+cs4mE6LRsLH/yOi0njleTXRHCp4Qye9Nh1qEOogPF4aoy7Mli4kgoGhClCWj4+GtX0qQyMsSd8OEDDuSmXyCKeASBc4lZTUYyxDNOEwr0AhLEAeU9cmqxHIvNbvt3SiBSaTn6zW2bsGKWSX8kyMMSInIV05SG8y3BrUJzXV7KjCL8GaHcI9wo5Ii4TZ+QG5BYxzD1mzqmiMlntur6Dy7Jofjk28n7ukYFB0h5Fs7pHfgYmOyGZafJQfhaVmSmXxNOANrlYD/ZfRt86nyV16C7gqsUZkKIPPDs6st0b7jJdB/qfWaCB2dWzRUrEBIurw+75bXoegZkNhSbfq/uWa/etlJugIl0ICjqAbbIGwOwbJXUUgWXlFdfkdlWIRMfOZ58D1bCkYyZUEtdcgUMnlS69K5+DRI9Cno/acPjk6NWpEG+Ag/mvI9T0S/N65Ilaga+mdPHgiTvBxcDvSCxedaDynQoO9A1RdqLxiLv1kvQpT6zqncQfnkiT7Q2AO8SZ45Ih3XjXZMAupCm1bkUnkQuWySZu/8ti9JPzgybmWJarrZaEWeqIgJyH4ZIyF0geV9goFLe/AQqFV03UyhUTUjrGgyX9ivs4l5pz+ZkAi1cNI+f2zz5ufhzZ0zAR0S6plMrid4+SYsCEQLJ/92CVJdYWr5cdpqD4SoHHlQ9Uf53ItcRcAi9mb2UXxvXtbYL+CR+ThSmKHUQ1zIoNmjel1NTVCOvyk8p1T+mFs59QHHxr8XdcFxYKGgT7xq1PWsTa/HoeSGl15A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(346002)(39840400004)(366004)(451199015)(31686004)(36756003)(44832011)(4744005)(186003)(38100700002)(66574015)(8936002)(2906002)(31696002)(66556008)(66476007)(8676002)(66946007)(5660300002)(41300700001)(86362001)(316002)(2616005)(6506007)(53546011)(26005)(6512007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yxaXh8q74fPUmfnKHW6KLMdOik7voGNpeP8Cpnm7eTCPqEpfz1y5y9NoSA8H?=
 =?us-ascii?Q?d4pWccBHKvK292RmysrcU2FDaJo9m9kjDxtdyMOG+YgSXqVdXx7gu7xEcUiv?=
 =?us-ascii?Q?FIHF8M/6eCty0RgXYb3Ytg2h5kaMjA29LDoa2HSWGUHvBUW7FY0ONtSju6ip?=
 =?us-ascii?Q?PbwfKvIACpJINkVGYPqco9EZ/9MmG4jvb8pVeYr3sAZQGlq3Hg7meupyWNqE?=
 =?us-ascii?Q?u7emOauTw5hs9SjviRofh15MGcqrTuhqhpiwc8ABm6/SZMon1p3PtoNNZcet?=
 =?us-ascii?Q?VmJheGE9D9VxfBgN0gCpmzl+tD9bbmzd2f/JM2R10ZqEkmxnzY+lJwKM2Foh?=
 =?us-ascii?Q?OSHSAmmP++Mwgmd29kmYW5W7nMQCFRnuleNkw9YgmIIMCNjiERVZ6zaI6118?=
 =?us-ascii?Q?fMn69CgnG0+fPBqOnx8jdNMPVIV2gm5kZo+ML9mAC3T6FPSM9b495k8OX/Tf?=
 =?us-ascii?Q?ycv4yjRyvz6+t4fYrNFrAvG3aQV3Qgo9avGfWvL/+oXpBrBB7DeCwje+NJBd?=
 =?us-ascii?Q?B/GA6TSmxQYVR0aXWWXXva2XB/o1RrJ07iyOknJZuPauzrKlY2pimCIdidzb?=
 =?us-ascii?Q?sf2bmWquSDv+rMyGPvWkMC5La4yZOERdmGRVwkI+mp8IDX7W+uv/4izhqCgI?=
 =?us-ascii?Q?vRgQI1t5C/+wpxK3ybOTnNytTfo9xkML90sY23woD/8pT30uCA26IpPTfR5z?=
 =?us-ascii?Q?W1ZSHJosniqc/1oYNBNS7+N1DiucCC0L4Gdlnt4N1pyTHyPIkPgtz/nm7bhn?=
 =?us-ascii?Q?zchDuvSDFOZZ2xIK4p0AjzheV+JAqy6joSUpNLr+AJ6IkxBwwlDCwr9yV4w9?=
 =?us-ascii?Q?ubwHc5N5KcvbMFJ2z4OLZIb5PY4SR/P7+jjvL4ZJIuESQLN3terUXFlPyr21?=
 =?us-ascii?Q?+Ee3EDQJiWY58hZO5gGo71pY+wvJ7O6VKFPJTq4q2+MV+KVlLRvP4k2jjfEh?=
 =?us-ascii?Q?a44fe6uanx3SNe3u+C2wv0Xu14hsFjiV3/yV7kCpWzmvruspRpKOulLzbOhE?=
 =?us-ascii?Q?ltAL4nWsCRHrrcqUzoJmtA4IySWbs44tijwp1+U42RtqDh+sXIkinpX+OJ0F?=
 =?us-ascii?Q?55Zpn8RzomSo5WMwZ0UgBBW91MtVibnlurFgvkjRh3xfhrdC8/AzeNy8v+M3?=
 =?us-ascii?Q?PUGdG0H0BSDqGJPRqX9WJu31SRk9bC4wjGMh8VNvG33QdQUTjZnk24uWEaht?=
 =?us-ascii?Q?pv/WcZcNPoPisztVLnvqKGpsDfR5uxDJFcTS7UQq98pNy+rhES43VlUJZbka?=
 =?us-ascii?Q?2Ib6H4mEpIHwCduSUYA7/gv2Mra/ZAjnoZWsfg5lnBe0+K6h3VZRF3YW5BwH?=
 =?us-ascii?Q?fQFkAjqexENidMFs+Xouq1TBBhQzufwsxHEWumaznyn6atUeL7/a91kjug5s?=
 =?us-ascii?Q?05XYaZWEa1ial1mcjDbMvm5K7808U5ZOyag6ZguW0qjjzsHgxDDB6Q+ejw1F?=
 =?us-ascii?Q?U/WWHkcfyce8r3m8yk35nk31OD1BS3+NPxpYZBlqx8TBO1N5S7PuDdjKI/H8?=
 =?us-ascii?Q?1Psw9AZ7nJ6Iy+jCZ9VpRA1HQcE8JMeEzAC89rl/r7KDjWnNEAFNsw/fa55x?=
 =?us-ascii?Q?W/6yZ2HcgyBlC24O0ixZqEOOagnSSZ1sBF6INvaQbQEaQWcCPCitSAgdrWJZ?=
 =?us-ascii?Q?HE1p5amvXIeFcQeOfuq9sxo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ce81b6-ddb1-4d51-4261-08dab5b33db2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 11:31:06.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BC2znYlMBe+8yjlziwtv47otQnqDKVaNCMhfCdDHh/s2mNdUWVS9l5xgVI12WB0uwnLa7mHRHYhnV6Hm3q1q5OkHX0yiPbx1zyD8vr6b/G2Q2v8kpM26id8TgemYwxT8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 11:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172084

Hi Christian,

On 10/24/22 13:05, Christian Thie=C3=9Fen via lists.openembedded.org wrote:
> Thanks, you're right; a normal rebuild doesn't execute any tasks. I've no=
w found that this is related to rm_work: If you enable it with INHERIT+=3D"=
 rm_work" in local.conf, bitbake will rerun three tasks on each rebuild: po=
pulate_lic_deploy, rm_work and build. After that you get the missing manife=
sts.
> So another option for a workaround would be to exclude the image recipe f=
rom rm_work.
>=20

Good job at identifying the culprit, would you mind sending us a patch=20
and/or open a bug on our Bugzilla to keep track of that?

Cheers,
Quentin

