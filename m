Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.5434.1621168991878666741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T2Mam9b2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id r12so3638965wrp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MbEJYtHb54SNCjEjljabZWF6NXwhcOsq9N3uPtiUk0o=;
        b=T2Mam9b2bAA20v44nX2BYivozh0JUQYRNWvK9NF8MVUEuD/RVM5U/HC+WD26kMu2WQ
         IqJG657SLXDzokNjKuJOL/j2VcnOXw9kEU8gktRD8EqLwq85iZ9mNqMU2SeCuNIIyOZj
         bRCtRf/FvzJXBVz/iO2pSoR73WKcGh32dqAoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MbEJYtHb54SNCjEjljabZWF6NXwhcOsq9N3uPtiUk0o=;
        b=rW4qhU1oLXOUCZuqwUCHC6+PgiusFiFntFkYfL5nDsqXvVmzq/OSU8hOOOvplm9HEb
         CrsR2IwA4XrVqKs/BkDaMy1yS7E4VqGgNy5trFjAbklyJUzI2EyUkGAj3RVQzmhBQdZZ
         ny0cFAvDzRrxQyopaZBGaO4zP6vLG6QVxNEImThBLlmv+N3fGWss2cmK60Jin7llZt1l
         0J6utCW5k7Z8NYNhb7uOB3x+TwxkqDS0PSQ5bkjm//oJjnnZhGEL95P8buXxg0AA2slG
         aBx64Fc/WHfcMGauuR9tWe4uoO0uhb8wfi/DfuzZPGFgyYwj4DtL8UYAUm6zal+B2n89
         MbUw==
X-Gm-Message-State: AOAM533MAJ0rgoL9B6f4lfGRAAg9b1TZMlsd+hs7hxAksYNXJ7d1kXyz
	TlI6mJtHNlNYl9tUrpmnY52O/g==
X-Google-Smtp-Source: ABdhPJzgzkILp8ylGBuE20ju4By4E7aC7iZEtOaQayvaxPxI6CqZhak0/xFi2Qtbyix8KeUuykjt3w==
X-Received: by 2002:a05:6000:1286:: with SMTP id f6mr31337152wrx.226.1621168990533;
        Sun, 16 May 2021 05:43:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:22d7:8af4:80b5:c062? ([2001:8b0:aba:5f3c:22d7:8af4:80b5:c062])
        by smtp.gmail.com with ESMTPSA id t8sm10888210wmb.2.2021.05.16.05.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 05:43:10 -0700 (PDT)
Message-ID: <060ec8a22677e3e7d22cd07c49dc1abc9ccbbf8f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [bitbake][PATCH 3/3] bitbake: fetch2/repo: add support for --repo-url and --repo-branch
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sourabh Banerjee <sbanerje@codeaurora.org>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 May 2021 13:43:09 +0100
In-Reply-To: <1621164193-9434-3-git-send-email-sbanerje@codeaurora.org>
References: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>
	 <1621164193-9434-3-git-send-email-sbanerje@codeaurora.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-05-16 at 16:53 +0530, Sourabh Banerjee wrote:
> repo tool provides following options to use a stable or preferred
> version of the tool
>   repo Version options:
>     --repo-url=URL      repo repository location
>     --repo-branch=REVISION
>                         repo branch or revision
> 
> By supplying repo_url=<uri> and repo_branch=<branch> recipe may choose
> to sync a specific version of repo tool.
> 
> Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
> ---
>  bitbake/lib/bb/fetch2/repo.py | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/bitbake/lib/bb/fetch2/repo.py b/bitbake/lib/bb/fetch2/repo.py
> index e7c5255..902337f 100644
> --- a/bitbake/lib/bb/fetch2/repo.py
> +++ b/bitbake/lib/bb/fetch2/repo.py
> @@ -66,9 +66,15 @@ class Repo(FetchMethod):
>          repodir = os.path.join(codir, "repo")
>          bb.utils.mkdirhier(repodir)
>          if not os.path.exists(os.path.join(repodir, ".repo")):
> +            repo_url = ud.parm.get('repo_url', '')
> +            if repo_url:
> +                repo_url = '--repo-url=' + repo_url
> +            repo_branch = ud.parm.get('repo_branch', '')
> +            if repo_branch:
> +                repo_branch = '--repo-branch=' + repo_branch
>  
> 
> 
> 
>              bb.fetch2.check_network_access(d, "%s init -m %s -b %s -u %s://%s%s%s" % (ud.basecmd, ud.manifest, ud.branch, ud.proto, username, ud.host, ud.path), ud.url)
> -            runfetchcmd("%s init -m %s -b %s -u %s://%s%s%s" % (ud.basecmd, ud.manifest, ud.branch, ud.proto, username, ud.host, ud.path), d, workdir=repodir)
> +            runfetchcmd("%s init -m %s -b %s -u %s://%s%s%s %s %s" % (ud.basecmd, ud.manifest, ud.branch, ud.proto, username, ud.host, ud.path, repo_url, repo_branch), d, workdir=repodir)
>  
> 

In your other patch you make the new parameters update the mirror tarball 
name. I'm wondering if we also need to do something like that here as 
presumably, the fetched output might vary depending on which version 
of repo was used?

Bitbake patches should go to the bitbake-devel list. I'm also
wondering if there should be new fetcher tests these changes should be
adding to lib/bb/test/fetch.py, run using bitbake-selftest?

Cheers,

Richard


