Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web08.34118.1611566505395340512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 01:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4DPPWT5CVqz5tlJ;
	Mon, 25 Jan 2021 10:21:41 +0100 (CET)
Date: Mon, 25 Jan 2021 10:21:40 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/5] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
Message-ID: <20210125092140.qzuwucbfplk6mzma@qschulz>
References: <20210124135559.21894-1-dorindabassey@gmail.com>
 <20210124135559.21894-5-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210124135559.21894-5-dorindabassey@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

On Sun, Jan 24, 2021 at 02:55:59PM +0100, Dorinda wrote:
> added a check to ensure that a user isn't building in PSEUDO_IGNORE_PATHS
> 

Missing [YOCTO #14179] tag I think :)

> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 2040b48595..78c0343f0d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
>      if (tmpdirmode & stat.S_ISUID):
>          status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
>  
> +    # Check that user isn't building in PSEUDO_IGNORE_PATHS
> +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
> +    workdir = d.getVar('WORKDIR', expand=True)
> +    for i in pseudoignorepaths:
> +        if workdir.startswith(i):
> +            status.addresult("you are building in a path under PSEUDO_IGNORE_PATHS, please remove this" + str(i) + "directory in \nParsed WORKDIR: " + str(workdir) + "\n")

Capital Y for the beginning of the sentence?

Missing space before and after str(i).

I'm not familiar with this part of the code, so forgive me if this is
wrong but... is your sentence finished?

You are building in a path under PSEUDO_IGNORE_PATHS, please remove this <dir> directory in
Parsed WORKDIR: <workdir>

That is to me not very telling about what I should do to fix this issue.

I honestly might be missing a lot of context on the issue so wouldn't be
surprised if the issue is with me not understanding the sentence more
than the sentence being "unfinished".

Thanks,
Quentin
