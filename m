Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523ACC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:01:11 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.109])
 by mx.groups.io with SMTP id smtpd.web11.56028.1699282865993191935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:01:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=SNhqyE55;
 spf=pass (domain: prevas.dk, ip: 40.107.7.109, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYY3NJE9l4yq6y5zawWkZgKVE4IpKENhg6hliDQ/alKLNOitGCGRniZLWcT7JEzU+DgCnpESZjH+2FnXccAML24tuxZCDOcwoFCRUxMy6ENENooYOal+epHpFlaauQIwSwPYCMCDJENeG7KbJQ5LfL/C6bTDzpIiPdH3TZXOcEX50DdjVCVuYk6+Q18dLS9aNLa9K4sOExjYM7q8EZ0H8OtY27+UfTYAjT/T0t3brDL2BypTTqQkJvv8aMVg/vzVvFgSd43/OKU3oPhkshFLTzXWZRHDW728lQHQRaBJ9iBGAv3RRR/zH7trNJEnX9u+5kmSWNkLdjJgoI8sI9Cscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgwtXyHULQz0nBgyUkX4e1VTtcaUkkxYaeB2V+ZYteE=;
 b=STMjR3yvLYF8IRUwvDPCmc4pC5P9rWYBZ1bUHOZJv76TBRnj6kAPwJdC1I472NV0mwC7su9dI2s1R/+X/CyLhbzugBFXIIv3YPg5Tob8WsgCY297VFh2Tv+kD14GoQJLM6YcGEmmTiewf65XM1yu6ObGRHAw/Aszsso5J/B3FcTbRYoh4YGl0lxgB4zRVaEr+METgLFwrGMiljIpFSrYu30mLF9eENM2JTRB3pEELRkOxFLiB9u+K6hTFQIT+Q6p90mmDy66umx3VNyd5kdpg4ZCbQHwQ3SnHY/CnEycCZxWuOtYrmBXFwl2rW3p0tE/p/0DqVaSqxHVzCmUMPUzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgwtXyHULQz0nBgyUkX4e1VTtcaUkkxYaeB2V+ZYteE=;
 b=SNhqyE55Ue8wm5wetuOHCCaTpqRlcpQhHm8wigosqYMwG/IF5gmFEYU9TEnfmpB8pdX8AJZIYiaStzLgDxHdu3rhC1vrnE5l34UCwrLcv7HZ43fDFjpWRYzgtm68j6Et43U6OcpiKdTDdXpDLf6dHU2jYsMK4GfKnIiUZWS/exE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS4PR10MB7613.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 15:01:02 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d76:c11a:5c3f:3245%5]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 15:01:01 +0000
Message-ID: <27439f1c-a64d-41a0-815e-882a1a9a5b4d@prevas.dk>
Date: Mon, 6 Nov 2023 16:00:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: add jevents PACKAGECONFIG item
Content-Language: en-US, da
To: openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 Max Krummenacher <max.krummenacher@toradex.com>
References: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::31) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS4PR10MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b6e1d8-1a8a-4fe8-7c09-08dbded93133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NYaPCb4z8QGLLgkUUQ5EV/0cVMDYA7SU14N408j5pn6D31AH7iB1KTtOJ2iuf1ggzPYgTfWs8askyeWZiU7MGngxTAbE1Dqjl4uTxFot8yvZw8ZXilPImUnbO+uJyAw5cIoX9XS4JW7EAZsHywXHtwg3LgiwtJ19Z0G94N6PwKRRC7AlTH3QcL7PHVnLQN+DyGz4tGSd0gvpOd76n2mTuiQRnlcUpfJElLMY0V41AkjBqV6hefBM9KxmnS+MMPl/8gqpipC4PEOxmGrSqjc2d2bduUSntRYe8Ik9J9Yc9h6OrOMlUEKwWm29jHFWWWoSxUVzxqqHSGzb2hu29lBrBrKi077yFXdl0fumawrP7j7uhenJhbHW5B5myEJ4mkj7QbvQLD5HsKwpG3gUainIiLnFwD+x/xnB8/C9Q30ijO3quuOhU3LhZnCoX2PWYsvvU7jmTLUH8DpaHIkC35gb51K/6Yi0PhUU3oNRnqv1RI6KK2FjcC5VQwZQdoOSkb+QpC7KJk2xtlvxA1L0kfyRnWa9dgk7zuzX3M8Y99gdnYjHtsDdYdc7IjfqPnznu7bdfgaZvvTMtD2T2FXu2IDCDjCj3AdQioJDOSrignMnCVVg6TbyzglJRbN8HkievLQzyGSgHh4Bq2euXhMHOl372Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(2616005)(6512007)(6486002)(478600001)(26005)(2906002)(5660300002)(66476007)(66946007)(66556008)(41300700001)(44832011)(316002)(8936002)(54906003)(8976002)(8676002)(4326008)(6916009)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SG1ZTWhuY04wd21xWUhuTElJdmxpTG1MT1B4dEU2WnMySGxid3I3NU5yUVZD?=
 =?utf-8?B?T2ltZnJSQkZHcDZSRlI5SkZFNzlNdWFvaThJdmV6NmtiLzBWMTlDbHB6K3VQ?=
 =?utf-8?B?T21PdllQSFg0OUdVM1ByWUNNU0V0UU5lMEJMYzNjZmpLN1MyWG5QTUFsWDd0?=
 =?utf-8?B?WGNTUllDblBXMjVwR1pvOFJ1dFNIV3JnNjlhVmY3VnhHMUpWRXo2RFBTWjlW?=
 =?utf-8?B?Q2Jha3R1SzZ1V2xtTGVtemU1TTlEMzloZ3VqUWNKQUFJblJhcDVISzhPaG4w?=
 =?utf-8?B?TnNGbENLT1NJQmxRMUE5NC84Mlg4L0kxOG9NemE1RGxLTHpwYUNCY0NXdCty?=
 =?utf-8?B?TjBNT05rZ29XREs5VzZVK0hxandVWVFsc2ZRZHlJYTMxZlQvMmg4a1Z0dW1v?=
 =?utf-8?B?alp2ZWZjMnhnUEFXVS80eHE3ZURuYUoxYzd5a3BZc2tCSjIvVmJJY1NkRXBY?=
 =?utf-8?B?eWYwcytvOUFmSTdoOXhBY3BrcVRPdVFYUUNDcnRmTjYzS0NpN0NYQU8wVXF3?=
 =?utf-8?B?eis3eFJ5cFhBVnZTaHJMazd3OElVN3lNRW5rSVpsTHNXQTBzMStEY1RzQi9r?=
 =?utf-8?B?SWg2R0RxbEJRYjZEcVgyaDAyRTlCV3VkZFRDZC9lbWhka1c3MWVMNXRLNUVZ?=
 =?utf-8?B?VGEycUZhbHlpUVgveEFITGNRdU5sVlNKZklNMFRTaTN0bUhzaHI4L0JWa1By?=
 =?utf-8?B?ZU5LRWF0K25wdGVDSHlkR3lVU0VoRTJvYUdMSUxYKzRaMnVEZjE4ZUJoSUxE?=
 =?utf-8?B?eHozeDhYOHVmVXFWc3oxN0RvRldnOTh3dDJqSXJBbXVvd0hXbFpKS3VVTG1T?=
 =?utf-8?B?SjlDbEVwSU9NVXZpTmZod0QyaE9iaitRL2NEUE1XWlJyMnIyYU9iUFRuNHQ2?=
 =?utf-8?B?SVNRUkVuQk02bnJRTHozLy9XNW8vUzV1UzJGdE5GVHFXWnA2NkxYTG15NElU?=
 =?utf-8?B?U2NKcUJUYUJjVVZkdk56WEFKb1EzSVFXTHF5bGhtZnFHVjZzLzV0SC9kQXdU?=
 =?utf-8?B?VXkzdlNnNVhaWUFsSnU0SWZUVVg1YjE5SmtsZm5VTlhudExsZmhhRDZuTDZh?=
 =?utf-8?B?cDkzbVlaU0phdm9sbUdrRVArNFZJWlZvOEZSUWxDcGQ3ZFNtTUIrUGtWc3VM?=
 =?utf-8?B?QU5XWUUzZEo4dlViSXlPWC8xQW83NGdUWUtMWk5NL0V2Mk9JYXNKdzJ5Mlpw?=
 =?utf-8?B?MHZ3QWtzSHBzUG1HMmsycEJ1eHRqd3o3WUNkSytNOHl5Qmk1ZlJSSkNuanll?=
 =?utf-8?B?UWlPN21RL1hIbmNINGwyNHpXWWxpQzJNQXFuRWNkTm80T1hnTlBaU2xrdy9x?=
 =?utf-8?B?QUNhcmdPVUM3eElLZ25lMnVHUFBlR21mTUlTZXRpTU90OGZsd1ZlZ29rMXpi?=
 =?utf-8?B?N21OTnozT1JicjVHV1hlNldFWHJwZEExUUkvSEhFSmRuR283b1Z4ZGtreVkz?=
 =?utf-8?B?RU9IdzlLVWRHZmtTUnhEOWpGeCtaMlcyaTVOWDViK2k1eVFGaUNHQitOdlc4?=
 =?utf-8?B?VzRvS0xtR056ODVGK0F4cGdXYUxLUTFjcnBTc243VzJieUxTaTJsTkQxY0Iz?=
 =?utf-8?B?d2doVjBpdVpoZEg2UHBsVmVnd2o2TkhsTXl6YjRsQjhSeVdJbXpZRVJLSXdw?=
 =?utf-8?B?Vkl3N1lpMDRodHdrR2d2ekhYK0NXU291ZUo1S1ZpWTU3aHNxMDBKaEs4eE1L?=
 =?utf-8?B?ZFB6SGJoYTJtQ2tSVnRJTzNjSGhxeWo4VVdOSU12WkoyRTl4UmUwdmNQOTFU?=
 =?utf-8?B?RFRiNWZEWEJJNE5YMWxsdnBzNUFGYTBiNGpBL0owZkNkZzJ5aGluZFNJYm1Y?=
 =?utf-8?B?a082RmpDQ2pwWm82d2Z4eXFDdS9xYmZkWjdvenpQUUZHOXBOd0dlQVhLNmhk?=
 =?utf-8?B?VktYZWFoVk1WTHRwd3FIUWtFN0l5V2lydFJzdGVsc1NTOHN5R2M1MjZTSVhv?=
 =?utf-8?B?aDNPZEk2UGdUcmJCUkx3MWUzMi9qdkhhWTRpc0crMUZxNzBpSllLTjVqN2Nv?=
 =?utf-8?B?dU1PV1VsWWNOMmpncjRNRFF5cTBqdll2U3pvMEN5Y0Q5b29sdHQ2RG1EbEtM?=
 =?utf-8?B?UE9TbWZNTm8zTGVRRWdsZFBwNjlaMU16Uk9QTW04NTA4d2o2WU10K3B3bzgz?=
 =?utf-8?B?QzQxUkxlcFRxcTdReHdCNzlSMXRERC9xalZrSm9OZm1VM3J5WGpSQzFqdTJo?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b6e1d8-1a8a-4fe8-7c09-08dbded93133
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 15:01:01.9006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9QEYYBByBquQUnoAbJ6qP25TKa67wQG4uv/F8ksacEoH+wm/KPpy97XwDp7aH9L4y+ImitOJ2BkCIR0jZhhqpK/ElmPRGmttiBeSuNEE+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB7613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190222

Somewhat related, but maybe not really:

When I set PACKAGECONFIG for perf in a perf.bbappend file, without
python being in there, the build breaks:

| Makefile.config:277: ***
.../tmp/work/qemuarm64-poky-linux/perf/1.0/recipe-sysroot-native/usr/bin/python3-native/python3-config
not found.  Stop.
| make[1]: *** [Makefile.perf:242: sub-make] Error 2

If I instead set the same PACKAGECONFIG value, but by doing

PACKAGECONFIG:pn-perf = "tui libunwind libtraceevent"

in some global configuration file, it works as expected.

====

I think the difference is due to the

inherit ${@bb.utils.contains('PACKAGECONFIG', 'python',
'python3targetconfig', '', d)}

line in the perf recipe. At the time where this line is evaluated, if
PACKAGECONFIG is set via a .bbappend, this ends up evaluated using the
??= value which does include python, and hence we end up inheriting
python3targetconfig, which in turn inherits python3native, which does

export PYTHON

And since PYTHON is now exported, perf's logic ends up in this fragment
in tools/perf/Makefile.config:

# If PYTHON is defined but PYTHON_CONFIG isn't, then take
$(PYTHON)-config as if it was the user
# supplied value for PYTHON_CONFIG. Because it's "user supplied", error
out if it doesn't exist.
ifdef PYTHON
  ifndef PYTHON_CONFIG
    PYTHON_CONFIG_AUTO := $(call get-executable,$(PYTHON)-config)
    PYTHON_CONFIG := $(if $(PYTHON_CONFIG_AUTO),$(PYTHON_CONFIG_AUTO),\
                          $(call $(error $(PYTHON)-config not found)))
  endif
endif

which breaks because the value of PACKAGECONFIG that ended up
determining buildtime dependencies did not pull in that python3-config.

====

This difference is, to put it mildly, quite confusing and surprising
(and took quite some time to track down). I don't know if there's
anything to do about it. Is setting PACKAGECONFIG via :pn-foo overrides
the only supported method, or is this just a quirk of the perf recipe
that one has to live with?

Rasmus


