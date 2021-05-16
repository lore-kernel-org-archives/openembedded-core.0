Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by mx.groups.io with SMTP id smtpd.web10.5612.1621171216941366889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=fIBy6T3Q;
 spf=pass (domain: mg.codeaurora.org, ip: 198.61.254.9, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621171226; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1u/OKREsaygvTDax6BKD0af4SIT1Dd42t3IFH2DXIeI=;
 b=fIBy6T3QzXarqiAE+rPUn/0Z/j7VNIRTGYTPJmOxK5nA1RYrHyba+xSrRFoOoRFIxwQ2UQ+u
 EZvBE8gO87COWEFryr+rRNwIiO0Ayy2kVu/c0Qv6LrPNuyM5PD6nDxgolOGCjQioaZmUA4jc
 0/yhN2By6Dg7PEw/41P1XlgmvZM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60a11c00b15734c8f9b9ef47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 16 May 2021 13:20:00
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id C40D5C4338A; Sun, 16 May 2021 13:19:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 73848C433D3;
	Sun, 16 May 2021 13:19:59 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 16 May 2021 18:49:59 +0530
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [bitbake][PATCH 1/3] bitbake: fetch2/repo: add support for projects to be fetched simultaneously
In-Reply-To: <6ecd0c9a94ec2d2ab907dac32bae6bb6b47e3664.camel@linuxfoundation.org>
References: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>
 <6ecd0c9a94ec2d2ab907dac32bae6bb6b47e3664.camel@linuxfoundation.org>
Message-ID: <bd868458d834e5096130ebd4cde0ce59@codeaurora.org>
X-Sender: sbanerje@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2021-05-16 18:10, Richard Purdie wrote:
> On Sun, 2021-05-16 at 16:53 +0530, Sourabh Banerjee wrote:
>> repo tool can fetch projects simultaneously.
>> As per repo sync documentation:
>>   Usage: repo sync [<project>...]
>>   Options:
>>     -j JOBS, --jobs=JOBS  projects to fetch simultaneously (default 1)
>> 
>> By supplying jobs=<some_number> recipe can choose to use the
>> simultaneous fetch feature of repo tool.
>> Example:
>>   SRC_URI = 
>> "repo://REPOROOT;protocol=git;branch=main;manifest=default.xml;jobs=8"
>> 
>> Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
>> ---
>>  bitbake/lib/bb/fetch2/repo.py | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> Does this value make sense as a per repository setting or an overall 
> build setting?

Hi Richard,

The '--jobs' option for the repo tool parallelizes fetch w.r.t 
manifest.xml.
For example, if there are 8 projects listed in a manifest.xml then 
passing-j4
will run 4 parallel jobs fetching 4 projects simultaneously at a time.
So it is related to whole manifest being operated upon by the repo tool.

> 
> Cheers,
> 
> Richard


-- 
Regards,
Sourabh
