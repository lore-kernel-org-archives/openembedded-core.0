Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by mx.groups.io with SMTP id smtpd.web11.6255.1621174214761264770
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 07:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mg.codeaurora.org header.s=smtp header.b=jLJUQbqG;
 spf=pass (domain: mg.codeaurora.org, ip: 198.61.254.9, mailfrom: bounce+783715.be9e4a-openembedded-core=lists.openembedded.org@mg.codeaurora.org)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621174217; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=f0fTWIFcGBhiX8hTQR3dVhaxDYAJ7fkITjq63exgwfU=;
 b=jLJUQbqGxv8VmPws9e3VCClfvxpnBwPcV1dMNtI0P1sr0dV1Dm2nJQy2ZwKjoPyl0oZnSNCh
 j0kTv+YL3agrN4/Khmx5jL4Ob9SwcJyw5NU/kGMbRcY2JK0+lECGXjZh34tbzCJdgAkeUP0Y
 Tv4JjtPGKt1Uh/lole5eoiINCNU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkODhiYiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60a127bd2bff04e53bbf86c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 16 May 2021 14:10:05
 GMT
Sender: sbanerje=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id CD349C433D3; Sun, 16 May 2021 14:10:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sbanerje)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D248EC433F1;
	Sun, 16 May 2021 14:10:03 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 16 May 2021 19:40:03 +0530
From: "Sourabh Banerjee" <sbanerje@codeaurora.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [bitbake][PATCH 3/3] bitbake: fetch2/repo: add support for --repo-url and --repo-branch
In-Reply-To: <060ec8a22677e3e7d22cd07c49dc1abc9ccbbf8f.camel@linuxfoundation.org>
References: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>
 <1621164193-9434-3-git-send-email-sbanerje@codeaurora.org>
 <060ec8a22677e3e7d22cd07c49dc1abc9ccbbf8f.camel@linuxfoundation.org>
Message-ID: <14c1013e215aa1ea748996664627d649@codeaurora.org>
X-Sender: sbanerje@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2021-05-16 18:13, Richard Purdie wrote:
> On Sun, 2021-05-16 at 16:53 +0530, Sourabh Banerjee wrote:
>> repo tool provides following options to use a stable or preferred
>> version of the tool
>>   repo Version options:
>>     --repo-url=URL      repo repository location
>>     --repo-branch=REVISION
>>                         repo branch or revision
>> 
>> By supplying repo_url=<uri> and repo_branch=<branch> recipe may choose
>> to sync a specific version of repo tool.
>> 
>> Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
>> ---
>>  bitbake/lib/bb/fetch2/repo.py | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>> 
>> diff --git a/bitbake/lib/bb/fetch2/repo.py 
>> b/bitbake/lib/bb/fetch2/repo.py
>> index e7c5255..902337f 100644
>> --- a/bitbake/lib/bb/fetch2/repo.py
>> +++ b/bitbake/lib/bb/fetch2/repo.py
>> @@ -66,9 +66,15 @@ class Repo(FetchMethod):
>>          repodir = os.path.join(codir, "repo")
>>          bb.utils.mkdirhier(repodir)
>>          if not os.path.exists(os.path.join(repodir, ".repo")):
>> +            repo_url = ud.parm.get('repo_url', '')
>> +            if repo_url:
>> +                repo_url = '--repo-url=' + repo_url
>> +            repo_branch = ud.parm.get('repo_branch', '')
>> +            if repo_branch:
>> +                repo_branch = '--repo-branch=' + repo_branch
>>  
>> 
>> 
>> 
>>              bb.fetch2.check_network_access(d, "%s init -m %s -b %s -u 
>> %s://%s%s%s" % (ud.basecmd, ud.manifest, ud.branch, ud.proto, 
>> username, ud.host, ud.path), ud.url)
>> -            runfetchcmd("%s init -m %s -b %s -u %s://%s%s%s" % 
>> (ud.basecmd, ud.manifest, ud.branch, ud.proto, username, ud.host, 
>> ud.path), d, workdir=repodir)
>> +            runfetchcmd("%s init -m %s -b %s -u %s://%s%s%s %s %s" % 
>> (ud.basecmd, ud.manifest, ud.branch, ud.proto, username, ud.host, 
>> ud.path, repo_url, repo_branch), d, workdir=repodir)
>>  
>> 
> 
> In your other patch you make the new parameters update the mirror 
> tarball 
> name. I'm wondering if we also need to do something like that here as 
> presumably, the fetched output might vary depending on which version 
> of repo was used?

Hi Richard,

Here is what I understand. The 'repo' tool installed on host, let's say 
at /usr/bin/repo
handles the options --repo-url and --repo-branch in 'init' sub-command 
and downloads the
'repo' tool copy from uri-branch under <working-dir>/.repo/repo/repo. 
All subsequent sub-commands
such as 'sync' will work using the tool copy under 
<working-dir>/.repo/repo/repo.
As a recipe developer/maintainer I find --repo-url and --repo-branch 
useful when I know my manifest
has a XML key-value pair that is only supported certain version (& up) 
of 'repo' tool.
At such a point I will code my SRC_URI as
SRC_URI = "\
repo://URI/my-manifest-project.git;\
protocol=git;branch=main;project=platform/my-project;\
repo_url=git://gerrit.googlesource.com/git-repo;repo_branch=stable\
"
Here I thought as my recipe file carries the URI-BRANCH combo to repo 
tool it needs, shall be good?
With this thought I did not code it in mirror tarball name.

> 
> Bitbake patches should go to the bitbake-devel list. I'm also
I have never submitted to bitbake-devel, but I think I will take these 
there then?

> wondering if there should be new fetcher tests these changes should be
> adding to lib/bb/test/fetch.py, run using bitbake-selftest?
Thanks for valuable suggestion, I will look into how tests are developed 
for fetcher.
If possible, please point me to fetcher test, that you consider to be a 
well written one.
I will learn from it.

> 
> Cheers,
> 
> Richard


-- 
Regards,
Sourabh
