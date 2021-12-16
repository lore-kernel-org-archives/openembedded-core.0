Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D9FC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 14:49:12 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.26])
 by mx.groups.io with SMTP id smtpd.web12.11353.1639666151490940661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Qj6RrrhR;
 spf=pass (domain: outlook.com, ip: 40.92.67.26,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE5P4L0EOLN1nJCVlthJWINExliTam88sLuU90EIl5mS3UmWkPyBXeZYTcevVLQTP+biihGBQ14K6uGQaqkXye6Q6NIitpUNhln7f0CspNkk/1hvDqxtSOJ9aLAF/qyObohrMHRtSGwXT0taAO9tJtrhgbgrK2ehD/MNNUUNLbCrWpjM+zIrWBY9Hu4pGHvWjp/KsTLGZ/E1EEn+UNTywkzR0AuQJxZCNqW7KRCE0YhQ7ojjp62Re2mOziQ6l1tIiBTkQV0J8BXMK+aH4aXGsJMbSzAd0n1dl4Stbztgyex5rqknoIGT+JbnaIFCw8ZCNlol8Ix6LTw7F/aXilBjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HblYOb5SXZ3EMBL/Zxl4ztMIc0z/7QMYqrnLdBWwC48=;
 b=U5H32qE7vGZHP31Qs98+xGiBLdIpH8T+JZ+LrH1eM+s1LJITreG9nVdQlOcEi8FW4mmxcSEFPwZ//YHaG71y4uy50gcOhTM3W6YL1nzRO3iMhErnrgTESTSvIu0AdXpwaYhl17ObKTlhAIpRoy6og9DHFALD03TwXaE6GZUnkWd5rzwyOgo2topLwgB0/gb7/n7t/nYab2kOYbibE3sBpiLTU59vJdTusYF6nwKXl0jNVrqwgzg2KqkC+Mwp1Yg4rst4o75LvMoaxnk4maU/PvNUjG3Qw3jwZr4pSuhWNAsuxSaSo5ammgYbbCEoQ6PtBZ3bgUbZfwnnd9L/emSsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HblYOb5SXZ3EMBL/Zxl4ztMIc0z/7QMYqrnLdBWwC48=;
 b=Qj6RrrhRPkVjjRiTOS7xdar6l8FE2s6BbJpckvnliwEWcIeEGOeULoZGHzNFO/QFC44Dr2rIs5EyUPI6f7C8Z5f06JkEBni8QW4xJPxb45mRWeXCFDMlFmnkpOMRo6wTyzbKzJkMQL3RLkSJUyasAa8BMi1eGkDPwou7BUvRynQQ2tb2hwUKb+bJkNo+qkvU8gMWl6fYIpHkzDz1YBaV5i2lhti1I6yuus834KpQZKyXjXQNU1hopLO8iIMANH1Ej832IFQHDDRdeFWp7WNjemT0JDMFUnm6zgQN7haxyDaBmd52ogB3djE9Rwc2lHfQSKBlkpiF7J7GrncLIGhgyg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4290.eurprd09.prod.outlook.com (2603:10a6:20b:167::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 16 Dec
 2021 14:49:09 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 14:49:09 +0000
Subject: Re: [OE-core] [meta-oe][RFC PATCH v2 1/2] oe.lib.recipeutils: add
 get_layer_name method
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: 
 <AM9PR09MB4642AFAD1E3DA5F9022D3C1EA8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <7945b4759d992c5539b6261f4a7f350405e640a7.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642970975B647FBB60D98A4A8779@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 16 Dec 2021 15:49:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <7945b4759d992c5539b6261f4a7f350405e640a7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [jrkV/nWMraWK0LGvB+WOJ+jSKAyOgTx7pNJLUFvcb8WgKDO9AUNVxrA+xzucI/Rs]
X-ClientProxiedBy: AM9P193CA0027.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <11f85710-c871-9ec6-5b73-12c1ec6238c6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaaa0e6e-bc01-43c4-23f4-08d9c0a33768
X-MS-TrafficTypeDiagnostic: AM0PR09MB4290:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BABDqo3gLFR+ydH23UXEbwDgU8GdXSGMby3nk3v4vhSYpTNnNeGaZQqfHbzxZ7+E4aBKt9pqlsz1CSEQS39t4T3oENWXB8+cFDzomOvdz2M8aJKdMOSLXOIFhWNs17C8nY1JuUU8tlWJcA9haYDVpDXJQi4ZqbULja3ahGWAF06PK2nDCgZm4AK6s0G7wFc7Dye9sCehQj8u4rW5SXeRWbhglAp/QkbOEZNWULE08xYbTQaqx+PSdrA4FOWS6fcenWV96culQqE+DLj6Ay4Cp/XffbTX3A0CC6RRkt4AU+GWfAkLcfU07s1aNH4ivL/lfFAQflF91yaD1PIqioWISey8HlH95QNJkwPMAkiCSue6eavAKantBh4oq1Jr2a0MEaxo5mLdVyF/2G7SeXQZw469bqDNDVstO4eBOpvxbMf4DdpbkvFI4EBUH3A7cLKUGpLJ1s0Zzp+K8q633Lg71Ct+Poo6TA3kj2um8cTkosmTVDg+JpU3oP0yYwBrgHpJWWUPoJH0ctQ2aYewiDabmC9U1qS7yDRMvfoIYiLx8Zv34231/f3cUgliIac5fPQuyFpwpx5KB13E2iKv3ShDEQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amFCYThyZXFOcTlmZ0MyeVF5VUMxYXYycFN1TWl0MXJUOTNMbFo5UXVVVHlp?=
 =?utf-8?B?QjMwMnNuY1luZ0JKTnArR0pEa0xqK2JZbGpWa3F1NnJOWnpCaEx4Z1pCTVdL?=
 =?utf-8?B?WDVJcW1NQm9Ga0RsQnJFKy9nK0ZWS2svUStCdkpHUXRGcFdoUGQrQjNrL2dp?=
 =?utf-8?B?VmUwZDYxQ3hSMENwR1gyN3RHM29LNVpvbk54TUdRT0J0Q2RQZ1MvQitlL3ov?=
 =?utf-8?B?V0ZjUUxUU0xwOHRpcVNheTVwREtCQ3VzR1h1MTdkNUdrcFB1WlRzNjg5N0lk?=
 =?utf-8?B?eFVZV3E1QTM0K2RFeGYyRGZMRnpmd0lndnJDc3dFbmdmNWFQTllMa2VkbDQ2?=
 =?utf-8?B?UmFaVDBHb1QzL2c0dEFGUm9RbGMxZTk4WXVKaVJXNDlWQ3ZhZGt3N2FYdTdH?=
 =?utf-8?B?SkJxVnRYRzhja2RlNzN6Q01CRXJVZitKcXlwcmExVVBzZ1ZaNHFkY3ZKamo3?=
 =?utf-8?B?OXpZbTJYR0JqR0c3dE5xOGtRYXVrRkJjdDZFNm1wVDI5ZEVid2tyWFR1TXlv?=
 =?utf-8?B?L0ZhbEQrMWdLRG1KU3VxY2pjYmljcTExaGltMHFSMXo5QXg4RzYycUFqL2xV?=
 =?utf-8?B?Z0pkTTFxbXV6V1loSW9ZSUJMUXRjbkFjcW9ORW4xQmFYOWJVcDdhQlNpOHBC?=
 =?utf-8?B?RDVrTTFTaElQY3MvRFhSZ0RWdUI2dlh6OGZxM21rVmhMV2RTakNxYjREZ3pI?=
 =?utf-8?B?bnNDb0t0TzllTHgyNE1KejBrcElrbkFISmJpeDltUE5BQjBXZVQzU004MVdJ?=
 =?utf-8?B?a0RSYzY4d0tieXVTVzFkQ0h5ZHp3aENkWE9uR3pDUjk2SHZDRVZHUXU4Rmxn?=
 =?utf-8?B?TS8wM0c4RURNWG5hMjBMVUJFS2x4WW1WeXQrai9aeitXNldMTXpFNTlheHdM?=
 =?utf-8?B?VXAyUFdpcFhLUFJ4ck1kMTVoVzQ1RGpwdGM0R1UxcDlsQkNmZXJPZ1VFTWZu?=
 =?utf-8?B?dnFzUC9nV0NtNmpieDZqektKaHFnMm0yMjlUOUZJUitud1hseHU3QkVhUm52?=
 =?utf-8?B?Q1ZSdThkWWFRckkxSmJ3VTV6bWhOb1U2MkcrRFBtM2FYd0IrSXNmRzBON0d5?=
 =?utf-8?B?aExjMHBWZUdINkRXYXcwcno3cXNoQytudi9pdUdUcXRnNWptcXlQYzJydm9k?=
 =?utf-8?B?RW5RRXFhSGRSVzJaZEJTU2kyUEcwWmxhUFpMSlJaRyt4Q0Z5NUQzeGMyVDUz?=
 =?utf-8?B?NXNXNnR3SHRLOTA1LzNHWUtQQWU2TmFqQk1jbStZM0t4ZWdNNUcybnlzb3da?=
 =?utf-8?B?R0dwdkRWVzdscUxWdzNSQmdrdmZFVk13Z2ZDcys3VE80MkxFRW4yMGRZSUlh?=
 =?utf-8?B?a01OZTI4YllpbGFjQ2VmczAyQ2xXbWRDV2p4a0RwcWVXUzhZd1ZpcVJqOE1S?=
 =?utf-8?B?VHdyS1QzVGg2M0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aaaa0e6e-bc01-43c4-23f4-08d9c0a33768
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 14:49:09.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 14:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159790



On 16.12.21 15:41, Richard Purdie wrote:
> On Wed, 2021-12-15 at 13:12 +0100, Konrad Weihmann wrote:
>> so one can get the layer name from a filepath
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>> v2: order by path length to correctly map nested layer
>>
>>   meta/lib/oe/recipeutils.py | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
>> index a0c6974f04..557e0f9bd5 100644
>> --- a/meta/lib/oe/recipeutils.py
>> +++ b/meta/lib/oe/recipeutils.py
>> @@ -21,7 +21,7 @@ import glob
>>   import bb.tinfoil
>>   
>>   from collections import OrderedDict, defaultdict
>> -from bb.utils import vercmp_string
>> +from bb.utils import vercmp_string, get_collection_res
>>   
>>   # Help us to find places to insert values
>>   recipe_progression = ['SUMMARY', 'DESCRIPTION', 'AUTHOR', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
>> @@ -928,6 +928,15 @@ def find_layerdir(fn):
>>               return None
>>       return layerdir
>>   
>> +def get_layer_name(fn, d):
>> +    """ Get the layer name from a filename """
>> +    pth = os.path.abspath(fn)
>> +    collection = get_collection_res(d)
>> +    # reverse ordering by length to catch nested layers
>> +    for k, v in dict(sorted(collection.items(), key=lambda item: len(item[1]), reverse=True)).items():
>> +        if re.match(v, pth):
>> +            return k
>> +    return ""
>>   
>>   def replace_dir_vars(path, d):
>>       """Replace common directory paths with appropriate variable references (e.g. /etc becomes ${sysconfdir})"""
> 
> 
> I suspect we should add something in bb.utils for this? I also think we should
> probably do this at the bitbake level entirely, i.e. set some kind of variable
> to the layername rather than having lots of metadata code trying to do it,
> potentially badly?

That would indeed make sense, in the end the could be easily moved to 
bitbake - not sure about the variable per layer as we have already 
BBFILE_PATTERN and BBCOLLECTION (both used here indirectly) and what I 
wanted to have is a way to ask from what layer a particular file 
originates. In the current form it's pretty straight forward as it 
doesn't mind overloads from layers (and therefore no layer priority or 
order from bblayers.conf) - I'm not sure how complicated we would like 
something like this to be - so for now I would be fine if we take this 
piece, add something fully featured in bitbake and then removed this one 
here

> 
> Cheers,
> 
> Richard
> 
> 

