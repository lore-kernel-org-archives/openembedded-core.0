Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.34182.1611565965541228135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 01:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DPPK652yhz5tlJ;
	Mon, 25 Jan 2021 10:12:42 +0100 (CET)
Date: Mon, 25 Jan 2021 10:12:41 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 4/5] sanity.bbclass: sanity check for bitbake in PATH
Message-ID: <20210125091241.svgq5mij65qjfh4q@qschulz>
References: <20210124135559.21894-1-dorindabassey@gmail.com>
 <20210124135559.21894-4-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210124135559.21894-4-dorindabassey@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

On Sun, Jan 24, 2021 at 02:55:58PM +0100, Dorinda wrote:
> added a sanity check to verify if bitbake is present in PATH
> 
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13822#
> 

I think the convention is:
[YOCTO #13822]

c.f.: https://wiki.yoctoproject.org/wiki/Bugzilla_Configuration_and_Bug_Tracking

A little word in the commit log and/or comment in the class to explain
how this could happen would be great so one does not have to read the
bugzilla entry to understand why this fix is needed.

> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index d134b40a87..2040b48595 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -787,6 +787,11 @@ def check_sanity_everybuild(status, d):
>      if "." in paths or "./" in paths or "" in paths:
>          status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
>  
> +    #Check if bitbake is present in path
> +    bb_check = bb.utils.which(d.getVar('PATH'), 'bitbake')
> +    if not bb_check:
> +        bb.warn("bitbake binary is not found in path, did you source the script?")
> +

I'd personally put PATH all uppercase, it is then obvious we're talking
about the PATH environment variable used to locate executables.

That's just me nitpicking however.

Otherwise, I don't think this patch is needed by the rest of the patch
series? If I'm correct, then ideally you should have sent it as part of
a second patch series or just sent it directly to the mailing list.

Usually a patch series is for a bug fix or a new feature, or follows a
specific theme (e.g. backports from one release to another, or
straightforward recipe upgrades). If the feature requires a bug fix,
then you add the bug fix to the feature patch series.

If you have multiple themes, unrelated bug fixes or features, it's
usually better to have separate patch series so that if there's a
discussion about one particular patch, the other patches can still be
merged fast by maintainers (easier to keep track which patches are
merged by just not merging any patch of a series which is under
discussion).

Thanks,
Quentin
