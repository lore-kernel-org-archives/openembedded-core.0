Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.7001.1620293127894479392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 02:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FbSq83kgZz5tlD;
	Thu,  6 May 2021 11:25:24 +0200 (CEST)
Date: Thu, 6 May 2021 11:25:23 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure message
Message-ID: <20210506092523.puuhdp77ho3egljd@qschulz>
References: <20210505175614.66322-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210505175614.66322-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Wed, May 05, 2021 at 07:56:15PM +0200, Michael Opdenacker wrote:
> This expands the error message when a network failure is detected.
> It happens that some ISPs or networks block the default example.com
> domain. Therefore, instead of disabling network access, it
> lets the user know how to modify the test URL.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta/classes/sanity.bbclass | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index a377917f2a..e907a3566f 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -392,9 +392,12 @@ def check_connectivity(d):
>              msg = data.getVar('CONNECTIVITY_CHECK_MSG') or ""
>              if len(msg) == 0:
>                  msg = "%s.\n" % err
> -                msg += "    Please ensure your host's network is configured correctly,\n"
> -                msg += "    or set BB_NO_NETWORK = \"1\" to disable network access if\n"
> -                msg += "    all required sources are on local disk.\n"
> +                msg += "    Please ensure your host's network is configured correctly.\n"
> +                msg += "    If your ISP or network is blocking the above URL,\n"
> +                msg += "    try with another domain name, for example by setting:\n"
> +                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
> +                msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
> +                msg += "    access if all required sources are on local disk.\n"

I have my doubts that we want to explicit all ways to get rid of the
message. I'd see more an indication to look at the documentation for
this.... and since I wanted to check what we had in the docs for
CONNECTIVITY_CHECK_URIS I discovered we don't have anything for
that variable in YP documentation!

That would be a nice addition even if you keep the message as is!

Thanks for the patch :)

Cheers,
Quentin
