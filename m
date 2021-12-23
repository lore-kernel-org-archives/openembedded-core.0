Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC8FC433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 11:31:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.99])
 by mx.groups.io with SMTP id smtpd.web10.31742.1640259089139452893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 03:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=SXohjSAn;
 spf=pass (domain: outlook.com, ip: 40.92.90.99,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zh/ueEpJp3sIAcM2ZV48J7rSwBi34sHhU101lfAHIZFNvTQgq9zppVuqg3iHmYjoUHMmqTs2ugyWZJtrj3pmGc2gqC4NVbKKogwqvNQfFBvz/w0o+uUce8BjKoIC4woTYRM6bjvWMB1nTmdZRqYoMSNGfz+VBQyLAWjDdX/X6WH6/voYGG7NGR+NCxYwHVxgJ+Rbqu3u01IVX1K/wVU1rwOanKSmyvQ6HJuxmwO50Wj0ml0CbWZytgq/RvdGXHLqv5ZUq2qw7i5IrQuOkBUkPa4WZcZ20MQkFt1207oX+aCjszlw7VhEvlZYNKdaVB9Yo/NhlhiqHt+uiMWMMiDU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j6e9x4BKMwcIqHvcIi4YWwy49I7bME1t2oUG7ht5y8=;
 b=LzsY5qWkkFLX4mtKddwy9gIZHwbJgVJbkHBnRUsgT57khLSqZqdi0GnHFONbCNLf2v+ZUaFNZKI74XXWYecU3YvFbQudRydUWmq8Vwa/Einq/AuSCZ0CKyKqlsDAkTHml/YPTxTPnIW9+bqt1MvTJceo6hw2/j5EsVCHKGZJWvvTk8scLipKQ20UUZvqdUU5P8qHSrLGIgGZlmDvMFQL4HDgKWzSvliRlg+cQWlIZrqwKe3Kt8u2I7Glw/9lLNkO7z6fJceQzd2HoLcEnb4nGw9B+DHYaMVWFEBTPpZDvAYAat087qDfJynMNeSrbvJm1CE9l8JqAW3DXsbulbAVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j6e9x4BKMwcIqHvcIi4YWwy49I7bME1t2oUG7ht5y8=;
 b=SXohjSAnhdCiGGhz6p+7ZVWabQ9AJYpsRt05PNlPt3IKQDCX6ljPz/pt49B98ptJuljSKbN2XH87HYQWOs9Ikp986FaNxyBaj9o4GS8sGyyYzQ2sVguQT4JkLVi28GM9j4WR9cCcbYF4TqgLz+2WvUGbOJ5KHlv++hsQccbF4f40zxWI9AH3NoU+jOKgGY68G7MbaCrjD/SYJLGLc+SYxxrqcSN3PSfiLyVRh2kUZOvLG8GaQyaPBoc31oOkER+RWZj3tfmAounuCaKLUv/zpUcpF/wb0CFuN1KniXfkKqCanwx5xe8XVIw5ktbjBkhewGT/t8Zd6D6aFOSZipEoAw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3220.eurprd09.prod.outlook.com (2603:10a6:208:16a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 11:31:26 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 11:31:26 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: openembedded-core@lists.openembedded.org
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46424FF6EC0BC8DA32B7B66BA87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 23 Dec 2021 12:31:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [y9JuwvhQQXi2KLPTzvdZP6vZGCDu0RUmcctU/9A+VEjRhZx8z5ZcvujDMASgIpLV]
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <3da38738-bb1b-3356-30ff-272d6c4588f0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c00c7120-120f-4d61-4661-08d9c607c13d
X-MS-TrafficTypeDiagnostic: AM0PR09MB3220:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7S1kZLRHF+rdoFSnFtIiTFtbu95eZkJzDZnfGxD02OCu/M6PwUEMufBF8h4Fj//ripXp6f7pMaGpNz1+KGGG9LhHrSvodTfPQT/7DaMK6x4aTY8xJGCluf7zPyz0SLL857WpmLM8W2DcrGdMJEb/x3IaRW5QM9ZGUIjYzSZvW8NHAX7Zv83i+C75rzGuQxkWZlxPxPyu8VKtC+25eLc/UVoiHC37ZbxVlHC2NSbyT6vn4Ja9ANcPuYxrKVUbEQW2Ai2NVhtdPfjwS28shVZz1xNLRb9RnacRXSgEPAOLjLUdI4u56wdkwoJ21NrZCIwbqAcjpa3mVLvn7kPb3ktG/OHScB5to2t117vlc2kMJbPbJdrM4CQJEO67IwdphvsIZ5p6sHA1Tf3yF7B1GZ7U1eA3ix0Q/Ufmy9MbS883gLsxrZ6iqy9C0WKEHDBi4Y53fi66g5nOB4k1exZUKH/eq/bkYBmZuEJuswWLMUSHQb2i5hyDWcWmTEPDgrNpQ1IH2+S3wE8twdB4ClAKqKvgNgEXtM/8pLRb5+vU46Pp+zdjzdEKVfVM9xAdDIHUj1l91Wvz33buXdkbk8v3/gbag8l15p+D/Z3fnXxwQLpL52ELD3Qv6oo43nZzkwUC9vop/U03HdznYQH9bHpYpzNhU6fJShT7AFtHNV2X7FEO8gM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?Windows-1252?Q?gsiJuqDgutkF0SGBuBwWnhPYCKKOFYfUzLdAX8Eo78NX6iUy9HHQZOgw?=
 =?Windows-1252?Q?YmgjHm3mhBiQZ7TLQaxbGEIizTjxpzLSFjU/U5Gj7ui+6xnh0HnMtSI1?=
 =?Windows-1252?Q?34TMoPYgnXSBVD6le0B94uUPkE7H0qLQV6BguLqI1V292Snd5xVd3U5D?=
 =?Windows-1252?Q?mfwIaoIqymy/2gMHFOD1BEiaag86qmRFzHv2MvQUeWs6r/TBNK9Ni+ut?=
 =?Windows-1252?Q?HeHtdhEKFgfBmDfh8ndqHMJIH7A/BHHO+4NIKqDGG2b67pWL8npwfY2e?=
 =?Windows-1252?Q?C1c1aNZYNrSvjDvBv+wO+qj/6GQv+VcApzM9r+JSF4mMrUIoNQ7fdGJp?=
 =?Windows-1252?Q?PstcNFFI2LsRpJxb95Se/Eiu1KWNVXsu8Gc5v4jC6wIG8QT1fTmbaT73?=
 =?Windows-1252?Q?3xp/IDg+hfgsp3r51qFgEOI2f066c+fkbSU42v/Naewk77yyZB8RCXqH?=
 =?Windows-1252?Q?u9BBoucaZvd6MmL28QRKJC3GO2igprJwZgY/zbxpneLEoGpslxcYgWgT?=
 =?Windows-1252?Q?yv70Hb95YYGLa4Zk7ycS7l54jVvECvo/LdZJxqLTB+cAqLeeN5ss0neA?=
 =?Windows-1252?Q?ns+3XOgwN9nKUUOA16lV7VBh8FZ2D5ZGeZ+NpaLDJmhQQL2rgMSLiHQa?=
 =?Windows-1252?Q?m7dHTVyv52jISqWWfcJJNkr2fblAZTlTDy8UeuxZNc7RsoCV4zqRi08f?=
 =?Windows-1252?Q?hEbU7Z/jDVDIFhryzCM+wL72BbX93Jgn4czStdS6AWeuH2UGVf5IRQYD?=
 =?Windows-1252?Q?JrWFLeziPgZTcHN7yz7r0Bxm4HFg5Y1MaQRh7uQQbEMfmm06HFppPi28?=
 =?Windows-1252?Q?ZDFRZ2HXfTAOKfA8nFKnlDwllSoCt/gGxIOWKgB3e69G1Th1T6x80HdJ?=
 =?Windows-1252?Q?JyBcwg89VOljIc9eiqrDOAY7+owV1AROPCdvpETjhu4xJSt4Oh+qUXP0?=
 =?Windows-1252?Q?4I0WO1o8OmbPGv6CZRTxCbN+y4NOXa+NbBzYFLwVhJlcAvqhpU71OY70?=
 =?Windows-1252?Q?tzMqWaqHTh+08PbCVYcXyGHrtTcpMS2OdqDO+s7TpH5ZaUqUrPMOi+n7?=
 =?Windows-1252?Q?Rs/pckwUuGFdPsUIwh3QDcGeHAbfumbQEdF1Tg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c00c7120-120f-4d61-4661-08d9c607c13d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:31:26.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 11:31:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159976



On 23.12.21 11:49, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
>> Sent: den 23 december 2021 00:21
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] base/patch: Disable network for unpack/patch/configure/compile/install
>>
>> Use the newly added nonetwork task flag to disable network access where
>> possible in unpack/patch/configure/compile/install tasks.
>>
>> We can't disable networking in sstate tasks due to sstate downloads and
>> also so we can report hash equivalence to the server.
> 
> Since no tasks except fetch (and apparently the sstate tasks) are expected
> to use the network, wouldn't it make more sense to reverse this flag? I.e.,
> add do_fetch[network] = "1" instead. That way you don't get away with
> adding some random task and using the network from it unless you explicitly
> state that you will.

This is actually a brilliant idea, which would also make it easier to 
control this behavior from a user's perspective

> 
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/classes/base.bbclass  | 4 ++++
>>   meta/classes/patch.bbclass | 1 +
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index b709777f243..e4c6c983b59 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {
>>       oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
>>   }
>>   do_unpack[postfuncs] += "create_source_date_epoch_stamp"
>> +do_unpack[nonetwork] = "1"
>>
>>   def get_source_date_epoch_value(d):
>>       return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
>> @@ -358,6 +359,7 @@ base_do_configure() {
>>   		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
>>   	fi
>>   }
>> +do_configure[nonetwork] = "1"
>>
>>   addtask compile after do_configure
>>   do_compile[dirs] = "${B}"
>> @@ -368,11 +370,13 @@ base_do_compile() {
>>   		bbnote "nothing to compile"
>>   	fi
>>   }
>> +do_compile[nonetwork] = "1"
>>
>>   addtask install after do_compile
>>   do_install[dirs] = "${B}"
>>   # Remove and re-create ${D} so that is it guaranteed to be empty
>>   do_install[cleandirs] = "${D}"
>> +do_install[nonetwork] = "1"
>>
>>   base_do_install() {
>>   	:
>> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
>> index 8de70254919..57aaf7c31d1 100644
>> --- a/meta/classes/patch.bbclass
>> +++ b/meta/classes/patch.bbclass
>> @@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>>
>>   addtask patch after do_unpack
>>   do_patch[dirs] = "${WORKDIR}"
>> +do_patch[nonetwork] = "1"
>>   do_patch[depends] = "${PATCHDEPENDENCY}"
>>
>>   EXPORT_FUNCTIONS do_patch
>> --
>> 2.32.0
> 
> //Peter
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159975): https://lists.openembedded.org/g/openembedded-core/message/159975
> Mute This Topic: https://lists.openembedded.org/mt/87909311/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

