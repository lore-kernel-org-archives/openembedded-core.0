Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F3DC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 13:25:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.105])
 by mx.groups.io with SMTP id smtpd.web12.91466.1638365103376218781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 05:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=eN9PIai/;
 spf=pass (domain: outlook.com, ip: 40.92.91.105,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbtPYW3Kzg7u8mVCtzmKIYO8qzDUe6uQ/Urvu8mF/BYHtDUpDqLnU9ChzXXNHO2vyflo6B9IuWLR9Ai1/j6yXbS3TFHLwnoi80glpXDi+Y8bLwY7Aih7U3ym48EB6V3VrQWGaIzPwjvwM7FVTQOmXwUMNGdZvcv8Vm/BJY/ZCRnhhlL20p+knzYP/+7QNZKuVkUm8oSCPpeCDfnpoq4QqaoNXrJHvJGhKy9p+6lkpmPPfXNjn7YkpSGBy6kH3NCvG43+ZT/AdFMjhzerxV9jER+ShtPXO/S6Y14hoZ/RVINzUf120OCZlr6jRn03NwpF0pSm+SGpEQ61t4+CRuYktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNObmqccYasSLThZFOTIEumhvdnnq2i+NlTnxPam+pk=;
 b=Ev67vzeZ9vZCHoIyxMWgCmUWKjQ9tM7DZY+bGnIP+BJLBOUoJLkVYFOvUIDQ564NyP2Bi+UkoMynvZwhgpZsGwQsTtDUngLrj37k5Td1CA9p3LO4o/lb3keXNBPgK/eLjkLs7yb8pxO9XPnGLhz37OaxiXSxGjVS9o+i3VCsAg4seh5hA8UT+ANqvvbASBIMmzK5WUIsufo/Vx5gdIP4F2UvQuxg+xKHQydzk58ogOXqknuaj5IwKgQqVCOOveUVr0o6AzFswJUVk7aLxgFcN9pHlFWqiyumyQXnEq0sifigJAEy2IUALSpmTqjIMn0YRidjl6Y4sYX4TjULJBNwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNObmqccYasSLThZFOTIEumhvdnnq2i+NlTnxPam+pk=;
 b=eN9PIai/vGBWFtzxn9S4hnGRl8jRedWNUuhWOqL6/0dP8S23JfvqPKkuCoxSOstYOdzpc/ijbvNQil9b+F0B93xkPwYSo73Gpfp3ct2t7wCtgvEiDI4NPnTP8/Vhpsr5+9FVmoNc0MZsuJYp7RzfSi5c7K2Cbkco415WDnb1s4GaHx4VJeEDZ93gbQjsscuIlBRSu2o3zXNJD1RsyQVZyAFcqVS5NwIJ1q7arU99dVDHS9Re20jERy8VLEiiT2w+2tJDfeGyS9hs1l+RGoKU93Ri8oQNtJbjvPX2IDSK8gBslG9zzEele61JEat26/Oj0PcXxPJpAR110WQamRaGOQ==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AS8PR09MB4632.eurprd09.prod.outlook.com (2603:10a6:20b:294::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 13:25:01 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::f0c0:455d:26a8:99ac]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::f0c0:455d:26a8:99ac%9]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 13:25:01 +0000
Subject: Re: [OE-core] [PATCH] patch.py: Initialize git repo before patching
To: Pavel Zhukov <pavel@zhukoff.net>, openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>
References: <20211201131957.20901-1-pavel@zhukoff.net>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AS8PR09MB46459FA96A6FF09AD7C1F1CAA8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
Date: Wed, 1 Dec 2021 14:24:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211201131957.20901-1-pavel@zhukoff.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [LtJ4OtuIPZ6BeLORQNJI6T79m7hf4TQhORHoiTWZI7IF2CSoB3rfbIUfVjb4ZBcv]
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <e9bba199-39bc-2bf1-34bb-2dd3ac4dab12@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM9P195CA0009.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::14) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 13:25:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de6dad18-3264-471b-ca49-08d9b4cdfa08
X-MS-TrafficTypeDiagnostic: AS8PR09MB4632:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GmKf/aHnCGgLlXFodVGn/IaInP6EP6HNGXhvwfF3NhL4LTw9N7zvCJ0cat5iv27eq/a6uUHbpW2QVBfzv/tFQ1gL5/a9ERasD8beW58tGEwhA1aMLtBopybqkMwZ5sg5v5ZXw/pqounziu8Ce/He78bKLj53fNETZe4bHpazhH3vkyZ+GC+FFShaIZZ/2UtavCBjOlWV6g+Eh4RtnLZUNGRhTimwQz1zeDk60yDZ6DvFv6OtM7IzbEZSWcbzdJMXcwEU2cX5W9dzGuraWFomIMwlDgeypdgRZxDyG4axaMCZ4wSwQH1kQEF980QPKXSaEPMqHdGk387a7cpVJGSiGzj9xiiG3h2z78I7O8UTZSfDrQNEaP1DDiIzWExsi+oI+k9IVzkhZ33/qwUFIqO28F5Wj/yheYh6yfNfPlQcIUSDjQXJbPOOl9MjpycXAlGSvo37pm8NNJ6h+3YwWpERiSWytbIX4fqfCSNj406fG7+TblLy4eJtDzCn62vdPmN42tmpKyiR+/ruerQ+SgJi2yHvTMXS8Oke8PnFhXxSZ97H1TvQeFcjTTBKdGaRP/QJ6fafbwpHX3x8KlFoRd8MUTucGpYhiEz1QSWIRwUVaTSarq4SC2zTUAOrr6ngAQ5N0SFUKaAUieaMf7WchpVLCMIxFYiDhdH25PGUym8MyfE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YiAWm23Y7tIffQaIosxgu59iWc+osJzgOjB/keq9XituKmARLRSs0Yz1gqEiJ8Vnk58sstS6nESwnH5hNCkgmap4KwmLAvvQ8ST38+A99sluCbuJJ4qNxfnFyNxPjM5JfyOPdAph1Dm9fC4LecOvzX5QsvmNP2P3rCeBUYr2+AqHx7hq+OugW0dFdHJ2SPl3CT5IRwpl9qOopVrb6T+m32TnrOGZ/XBbO1J5mamMesWMAwEmSdpXHwB0A4PVAf7fBOQt87ynY3Eh1GDMK3NcNS1Bw3LNRivMBTC6Zrj2037YdZaKfav5WF4k01g6ZV3kLH3WTLr5ENjP9x6IHNc8SrO4clsHv5TXTg8mz2fLzBkjDWFwuHZB17STOjqTetydtPB/bcl8ywQLkciV2vdvxS/vORJCi4jLf/Ml1yLgZmGnHMASXuxSchReRC5ThUYPOIAhn3M16QUPMoXK4Tnp6dQE6itRMbbjpbmGSNm/WPG4l94aIP/ttqp5MXnWeH9P6rs1/MWm0B/gUBdr9J0gSkiqN6I8jgAOqjOP9n22HzNowbuI5PfKyZoMURhjC5ddBSDfVgWn4gWL8bmn6eetpC1wqbVLbuQtF0scOGj9hz4dJGn3WaD7li6KNhoCwJkhqB3XQ9QWXVnCr3SM8PfzVCLLi5wIDQMZ6OaQRhzZwlvteG+BwgoJlHPWLiUTf0kv3VOyr9LHpRiANymkz7Sl+ymnFpiNuttQYvrow7CvauPI9dnW4T+gBDcv9WDccr7I9JjMMomGZbuwrDS5pOb3iw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de6dad18-3264-471b-ca49-08d9b4cdfa08
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 13:25:01.1566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB4632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 13:25:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159030

Could you please add a test case for that to the testing suite, as I'm 
having issues to understand under what circumstances we are getting into 
such kind of situation

On 01.12.21 14:19, Pavel Zhukov wrote:
> From: Pavel Zhukov <pavel.zhukov@huawei.com>
> 
> If PATCHTOOL="git" has been specified but workdir is not git repo
> bitbake fails to apply the patches. Fix this by initializing the repo
> before patching.
> This allows binary git patches to be applied.
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>   meta/lib/oe/patch.py | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index fccbedb519..8326cb55bc 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -56,6 +56,10 @@ def runcmd(args, dir = None):
>           if dir:
>               os.chdir(olddir)
>   
> +def getstatusoutput(cmd):
> +    import subprocess
> +    return subprocess.getstatusoutput(cmd.split())
> +
>   class PatchError(Exception):
>       def __init__(self, msg):
>           self.msg = msg
> @@ -298,6 +302,19 @@ class GitApplyTree(PatchTree):
>           PatchTree.__init__(self, dir, d)
>           self.commituser = d.getVar('PATCH_GIT_USER_NAME')
>           self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
> +        if not self._isInitialized():
> +            self._initRepo()
> +
> +    def _isInitialized(self):
> +        cmd = "git rev-parse --show-toplevel"
> +        (status, output) = getstatusoutput(cmd)
> +        ## Make sure we're in builddir to not break top-level git repos
> +        return status == 0 and os.path.samedir(output, self.dir)
> +
> +    def _initRepo(self):
> +        runcmd("git init".split(), self.dir)
> +        runcmd("git add .".split(), self.dir)
> +        runcmd("git commit -a --allow-empty -m Patching_started".split(), self.dir)
>   
>       @staticmethod
>       def extractPatchHeader(patchfile):
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159029): https://lists.openembedded.org/g/openembedded-core/message/159029
> Mute This Topic: https://lists.openembedded.org/mt/87426820/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

