Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF18C433EF
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 11:01:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.46])
 by mx.groups.io with SMTP id smtpd.web10.34984.1638010906382813501
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 03:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=dg2FEw69;
 spf=pass (domain: outlook.com, ip: 40.92.89.46,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2MreKWX72QVxYXVrH+cx1MU8oicEyIxm5E/+Sx77nASHyY6rcUyRbFXOjfcy/ZbLvUlZ8AvA9E/FOG7a8kAal8hPzOmBBMOpcrMe3WQRY8hnkEur4V2QZPnrXTZnc4lRiTLMwYHiqSLPK3XrqMjtYhs+fgxjtE6WnWg4PCaLt6vdqwZDZD49kfkLsxoH/bsPIYm071lZc6KfyOFCYLhb/COZ2OWBLM1jkFmy/ltdUMRwzV95n+eGsFJxNw29/qangeNWIga5T4JwdfgadrJhaooRjhVkkvS4aYx0/7gXkPaeo9XEltnLDFG/AlVayk9fD9hqokPFjYA2mWqPmrd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEygZpQHbi4lch599A/labDdVwWAwpKyjObpTLkm7JE=;
 b=FiaXo0+YbEC2s2sOKEv3orix0yQIZg9XFZxekJ8z6OdsCZ1Ic8kSMgzcnGRnqytkDttzSmIGu9qqNi0CHHVBKOjjbEeYo8CmF/lp5yjyJ7PpaP/fplFhmlGQxxudfjnvT9nYXIhi/oGW4LZjyHMcklxOyp30X/0EDKObk07O8Wzj13iFkNIxADEFDEfRoLz6MhjqZXEHVH4bm1fDiJb/cc6o27Yc+a3XUs/kzqvJ+eXziHzMiNyU9XabuvA/U0aIH3zY6+xU0sf1VaTnkgQY6Tdq8067LDjVJUzMGIYD16xQeebkTkIjdz3DhXGJrfJ+usCiablnUpHFZKY2H6lRiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEygZpQHbi4lch599A/labDdVwWAwpKyjObpTLkm7JE=;
 b=dg2FEw69nm7PGPAIvskIMVpZaUEB/sTbAkjPmpjNul5V2WaXiqOa7/yEkYVq/lEtCbBDFkTVPT5FtkccYXgAybKiXC0ZrFD7g3f+FAomLigiWGq2znEvFu+xHPOO56D2wIUJibBe+JSlqOgLEWa6g8uUFizkq04/FeFu4Znq7JMdU1GzMqDlCBL1sE9uUZk0meOXw07Q72k+6qyhbFcK691dFCZ4KgWlqu6gw4IFVtuGp8UHRSKZEAbQySERAtizjbHp35Os7PlAaIp+igus6V7GyenXjRBIXYDFybXv5LCROrz1Q41BtXri57DjVmArGHyMSJPaqYqWTLreKSdcRg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4498.eurprd09.prod.outlook.com (2603:10a6:208:183::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Sat, 27 Nov
 2021 11:01:44 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.023; Sat, 27 Nov 2021
 11:01:44 +0000
Subject: Re: [OE-core] [PATCH 02/13] insane.bbclass: do not hardcode oe-core
 path in upstream-status check
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
 <20211127095357.1748429-2-alex@linutronix.de>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464286750F3CC4518BDC8BF0A8649@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sat, 27 Nov 2021 12:01:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211127095357.1748429-2-alex@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [BuvJAwRSJHefiBZZ8/pZO7jnTu4q8FjhQDJhspryPZp3HEf/+ym/irHlLWqErWeC]
X-ClientProxiedBy: AM4PR0902CA0009.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::19) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <e55f5744-be7e-d84d-5d74-4d4b8620c445@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM4PR0902CA0009.eurprd09.prod.outlook.com (2603:10a6:200:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Sat, 27 Nov 2021 11:01:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fdecec8-b168-4ab8-f856-08d9b1954c59
X-MS-TrafficTypeDiagnostic: AM0PR09MB4498:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yyV0pJIOFwTzsfl7VQOoO5NFg/fo0Jt91xYC6XZL0M8o/V1uWWTl36+4L4853NUvZY2QDra95Ow1VOt5ZoM/9qD7Jq8IKPdirNV4IwarBOXX2NgQ6QE3X7seWfhgjqrKSLJ788Z9aUKVLBRvn+1o1Csthno3CL64qpznwja9ukOgNfMJ43SILbrXOy7JjztsIc1xdE3oZI1OYwO9FDBGyizdmP4Qv9lBWIwNvhvC+afbW3IFz2aQVxhpiczs8SJRbVM/xSJlFP3AZT7xQlJxsCqje8Wte2nQPpd/wRjYAynICNoV0tBtaorlsemKxE4lhBQMM4Bjy4JD1BP3jzYNqKWoCf0NVxATWzK7gKXN/1RvH09/1huf7wZSpfDzkfJq6gBDqUm7WQFL6uR1QylUKWjh9Wd2J77bPXxMSmxSUlhwr36GSv/GkFQUBopHkleNQT9aHu/jr7T7L7fwywlggQOLRIPdsTAUAmofpQ4ifJEnw557KHd9Vo+pM5qQy54LLCxAQuE7YstujRVrGRrxa4N6ATZ7Hwd08VnUm4h4s5fJad9kJow4mNxcwBqRjbV92xETjVilgAB1078qxJfnWWwmxR3UblHzXbOYdQfu5Vb9Kc4a88luWUcZ66Iaks11wBiVl1kTmdVoVYBME4qEsAgepXTUnp1aP582NbLtyL8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qLmLGQ03YLvedYgujW1Bc/lPyeqNoBj2iF9vzoLoRdrOFBBzb9VL0AGimskiLaoMERY4xTnZ9txu42CurXQ/228b1GDpSjnLUX7PQM7d9nJAsF/ju5Qg0mp3ynYBYIrw2sT8HhN3dFZ8FsVus1KDiGm+FnoTT+GnxSEpxL2cbb18XJT79a3dQO+x0872x2ffgM2yyliD7tuej37OeS+mgNvnd3JhPzn2V5ILytrt+VyE4Wuy8IBunTsvag4w42APhA/Qw1VPFFBQVcF6KA8m0maSnvoiDc8jQKx75fx5WBwnkCJoeOuwn2ip8xKJSWL9cyOKy/BBIULMtKddRhowsDRCRvlCdB5OFsFXdeXQ9LMF4t/FWvtOUvRr1PVmOI6CkH1aM/7fUQQJ28PvyFKUcBm+KqZ+P0FY2nBSfH38pH4u1PI7bTg0gtwMjZqDVe2+T5uPV1BBFkcgxl08feq/ZY1K2JEaZk5qhKTHLOzdvhUrcw7IapUOoLBylLE/MxxEMIGwMJDby1hUGt1Ky7wVVv7rpRoW7+cYlfm98wshd8bPVzhhxlhxDV6WX1rr1gjr5KOMH8nw+fLKndlMGj02ftfe+6uWyhgGRaGC5oEfz4FQrOADiAKt0AO1KRJOtOH+BvWuV2GIj/wJ84NFkKCcxifeoiFETzp+C/R75CuIgGhp7cOoCewPSqTaVPePQFkXpdkyRZKEAxMKr0RstezrHDiDYxjNlq5RoTaFh1woltrwyEdnnL9acNFyif9tzmP4K1XfNegUyD4QDHRniOVlzA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6fdecec8-b168-4ab8-f856-08d9b1954c59
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2021 11:01:44.1661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 11:01:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158863



On 27.11.21 10:53, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/classes/insane.bbclass | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 240f3aad62..8a47da5a09 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1176,7 +1176,9 @@ python do_qa_patch() {
>          (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
>   
>          # skip patches not in oe-core
> -       if '/meta/' not in fullpath:

Last time my morning coffee didn't fully work, so let's try it again...
What I would want to see (maybe in a followup patch) is to have the 
layers, where this check is performed, configurable (not just core), as 
I think also other people would want to make use of this very nice check.

Maybe something like

INSANE_PATCH_US_PATTERN ??= "BBFILE_PATTERN_core"

and then

match_oecore = any(re.search(re.compile(x), fullpath)) for x in 
(d.getVar('INSANE_PATCH_US_PATTERN' or '').split(" "))

> +       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
> +       match_oecore = oecore_re.search(fullpath)
> +       if not match_oecore:
>              continue
>   
>          content = open(fullpath, encoding='utf-8', errors='ignore').read()
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158851): https://lists.openembedded.org/g/openembedded-core/message/158851
> Mute This Topic: https://lists.openembedded.org/mt/87335190/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

