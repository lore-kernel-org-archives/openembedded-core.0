Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A206C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:19:07 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.33])
 by mx.groups.io with SMTP id smtpd.web12.3582.1637741945754148749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=d4Vd6Tq8;
 spf=pass (domain: outlook.com, ip: 40.92.66.33,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6yzfewFSj9QPQ9pxo+OqUNa4sUgco/tUTg4mdaDBztoMGzBuFv2hYo6ALOdxull584LCjZVwuL/G1pUHPmi5MoaJd3XEqYm5/IqsmLr3/gyEFyo7ttMWth0+ypZuylEF7zAUNjc7j0CQCmzReEUH/DLfjBBO1ftM8+xxSTZ7dOvF5wHvgIBVBYlca7F9I9u5qysXVdVl8tepZJQdPNNPqb1ZSSsxTL9ejmjB1NqVDpDEI3xsxwUbEghGNA16nml8IKAmy1kpU+8vd1ItnGIHufXXrSoa6Yk8vTfdBUbSilfJA/C6PPNWgs5AjHZYFxI1ciDtV/L5loFl2PNKuPGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItQhzyfWPIvrhMgY7U59uTJRlIbBC1r6mujNBedt3cU=;
 b=ShKakvVWk5SS4YylK6B/2QfBqjV2gDb8erWWfIocAIAeQP6xtIs6mMQu83+wXTMsirlZQ51RtfLNLP1XS4HdI5j3yodChBrXuzdQ0GiK7vuYftf0oeGFbNzKd7V2p9pavkgK+NievgL8/6YBEn5YNwo97Aw2Oyo5JiihAN+wgbBMsBxHbLtfedO1UZDNycu3hLOOja+hxIBDs+0MdnCFoD/f6Nf7m2xHRWdtybRUFgfVle7WH9wsszF1NF31lqEcX8oMjKq9kXMFHbA6MHNZ4PwQW9vxk6BQ7lxFY9XTFzkWmek8oY1KTipZsq14Vyawe85Gzxa+eFjVs15lHVJgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItQhzyfWPIvrhMgY7U59uTJRlIbBC1r6mujNBedt3cU=;
 b=d4Vd6Tq8XY7ucalWe3QK6i92Qw5N5GBFj7UN3HaED2JSISURlkKsbuyxSRUT7hnDp1Ok+F2DhvxbuUDuMGPIeFAUWnueBDLup8lo+GejNPaRtJKQkXrInyXlE7PIyuK8L4EPkj1U+ajTGMbFy774wDmlPO/Q1/DBbY59AGSFgy7jTaVNR8ZJ1MFhHD1NLrtOIK6WrMrxntJpfly6kfPMlFaLd2FWPOqGFfLf/IzQALiQbPknAE8FMb6PllScC6kzYaBxIEziW78/69tJaziUyeZ+hD7tOpKk/Yyz9YGUgncz/mOtH3VgReLgFq7haa4RCUK/spZrxcP9agqX47qT4A==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB5122.eurprd09.prod.outlook.com (2603:10a6:20b:2fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Wed, 24 Nov
 2021 08:19:03 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 08:19:03 +0000
Subject: Re: [OE-core] [PATCH 04/21] insane.bbclass: add a check that
 Upstream-Status patch tag is present and correctly formed
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20211124080828.530981-1-alex@linutronix.de>
 <20211124080828.530981-4-alex@linutronix.de>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464241613B5C4803BAFF9018A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 24 Nov 2021 09:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211124080828.530981-4-alex@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [pKxYNA/XFA1ZHKr0qh3jE2/BydVRsYS7+8VV7YevcscTjVtdw0WijJuONCf9FsJn]
X-ClientProxiedBy: AM9P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::8) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <93e07121-7f0e-f389-66a6-dcdec8bc20ef@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM9P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::8) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Wed, 24 Nov 2021 08:19:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a8dad0d-6b6b-47f3-0488-08d9af231327
X-MS-TrafficTypeDiagnostic: AM9PR09MB5122:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eh+qjLsUgHASIUOxQfOBceUEDQhMDbJFsx725xv4C9JKMHBdaV7Dciij9IFCXue9Ikhw5zdTKrnPyEm/4H/eNLVmInbwUQansAbli6K4gKuSkSMA71Z9pl1Dp7Sl7UuiFQmgY2Dfwe8rs8ks3z9AY6uYSoyinPxzvjwsstXhTVfizBt7akL9V5Z6xc2E4560g1FLXisAfHfSEOuDUehPhwsQncDE7+b6g0qrNwasUOt154FxLOR2eWTHs7n952aW4w0IR8REldcatbMXWL0w6js8BpBlY4zCKcSqRR1kJzageAN529gmLtKr/nFHVXjA511AIE7mK5qmyD0Lzgz44s4q+5xp7osvCCBvB+ICbwDEkNVStmiybo5iD+7mrJvoGBPQ+4iE0FA96tnVpyVSZPbG+SnEy+8dZRQBg3/6jZMGFCS/CtmhTwkT5DQKLUkKog88dS6wQOcJpDs0ntGi6COXr92UFHujJNWOP8yRpC349LgxUotiyj4JD2K3ZZesRdwHLl258Qv+uYqwkpVNxZ5Wq7rxmGAFgqGBAwDkCM8AkVv3z69owmAJZuS1JZYYSQOTJEXlPPaFVSWiE5SIhT3DSxobG0ewoCbpGHsb494UG5++gp5wBNtrgyY0RJSwkB5A65kbXYXGw/mokCO3VJktCycDvs0dAWUvz2GawZc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Mx7NO0zBJmDdr1GfIZ0YxGpb5thUNXm392gWhnIHm1W2NhdFRs5BAiuJcL+WuBcItVkktLrlfnK+oIW82+3ZMxZc8nMlqTquyjFC7diq3bPThfnl+ZJ1Kf+9yck5JQY2G5tVwUp9TG62CG9YjF5yvk/dLUtjCgHCp5HBl/MJ/NCtTx7uDRSPQF9GBqcvWdLFnGzonpU5aRjoo/QZ3piNZOQfz5M/pucUCt5+rgeFqNZYsRcfajJ0zQzSomKAsD4UHjz0qXi7vpIE0gk8G2KZuhgxnZ91SONp6PC7dafxy+De1Hqz9lK3D6+NkoJVjOS13uLI3xH9+WoP1FmY1TeLN1/oX5kEA0lc/KJpYkuRJsg1StoE4DKj0vtVU2hAeYay6rbRrUuhEW3t/YIIdepU8QWC3z+b6cTcpP/G25Y0zFYJBNPjckNML4wySiz7fHB5/LvdvkXLmvFdKq+NY+88lOHoUvyf+vpwLBQptf4llaaVSjSL0lHsUuydcyXO/tHsHxBQ3BMjzDnbFehIKmYIWvIvhO4s2DrrIoCV7e3JLlxMOmSDHbKlEkxksPtlZpmqERT7tpw5p4f6zpBQd6ru46mQR176gpzk7c+TkBtWDpUiTJJStwCIWCdrdukiDheD10CCkMd8bVrhg6N8MdK/UtJjtd/T9O5BlU32drcymRDe0sDHLEE/4RP09ZqcgyY/itsDftXvn8C4i8XStTHnz1OlqYW4nIDBtW17hdZL8QG03ZicafBBDwmEn/wIRQjqzYQ28z98DxJ1mF/CCAeyvg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a8dad0d-6b6b-47f3-0488-08d9af231327
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 08:19:03.2105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB5122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158679



On 24.11.21 09:08, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/classes/insane.bbclass | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 27b1a00fb9..240f3aad62 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1167,6 +1167,30 @@ python do_qa_patch() {
>                   bb.warn(msg)
>               msg = "Patch log indicates that patches do not apply cleanly."
>               oe.qa.handle_error("patch-fuzz", msg, d)
> +
> +    # Check if the patch contains a correctly formatted and spelled Upstream-Status
> +    import re
> +    from oe import patch
> +
> +    for url in patch.src_patches(d):
> +       (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
> +
> +       # skip patches not in oe-core
> +       if '/meta/' not in fullpath:
> +           continue

Can we have that configurable please?
This is somehow a hardcoded assumption I don't really like.
Maybe it's worth a shot to match it against BBFILE_PATTERN_core...

> +
> +       content = open(fullpath, encoding='utf-8', errors='ignore').read()
> +       kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
> +       strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport)( .+)?$", re.MULTILINE)
> +       match_kinda = kinda_status_re.search(content)
> +       match_strict = strict_status_re.search(content)
> +       guidelines = "https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status"
> +
> +       if not match_strict:
> +           if match_kinda:
> +               bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
> +           else:
> +               bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))

Why is there such a fuzzy (kinda) pattern? - IMO the strict pattern 
should be enough, stating Malformed or missing - both cases are equally 
wrong, aren't they?

>   }
>   
>   python do_qa_configure() {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158660): https://lists.openembedded.org/g/openembedded-core/message/158660
> Mute This Topic: https://lists.openembedded.org/mt/87277236/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

