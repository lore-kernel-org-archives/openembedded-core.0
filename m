Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web10.7643.1596811741805816181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 07:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4BNSt32Gt8z5tlB;
	Fri,  7 Aug 2020 16:48:59 +0200 (CEST)
Date: Fri, 7 Aug 2020 16:48:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Amitanand N Chikorde <Amitanand.Chikorde@kpit.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	nisha.parrakat@kpit.com, anuj.chougule@kpit.com
Subject: Re: [OE-core] [meta-oe][sumo][PATCH] systemd: fix codesonar warnings
Message-ID: <20200807144857.izgmbikrdfe4gcld@qschulz>
References: <1596810707-16909-1-git-send-email-Amitanand.Chikorde@kpit.com>
MIME-Version: 1.0
In-Reply-To: <1596810707-16909-1-git-send-email-Amitanand.Chikorde@kpit.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amitanand,

On Fri, Aug 07, 2020 at 08:01:47PM +0530, Amitanand N Chikorde wrote:
> Fixed below systemd codesonar warnings.
> 1. isprint() and isspace() is invoked here with an argument of signed
> type char, but only has defined behavior for int arguments that are
> either representable as unsigned char or equal to the value
> of macro EOF(-1).
> 
> As per codesonar report, in a number of libc implementations, isprint()
> and isspace() functions implemented using lookup tables (arrays):
> passing in a negative value can result in a read underrun.
> 
> To avoid this unexpected behaviour, typecasted char type argument to
> unsigned char type.
> 
> 2. "seqnum" defined, not initialized & used in device-private.c
> Intialized "seqnum" at definition.
> 
> Signed-off-by: Amitanand <Amitanand.Chikorde@kpit.com>
> ---
>  .../systemd/systemd_codesonar_warnings_fix.patch   | 105 +++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_245.6.bb         |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd_codesonar_warnings_fix.patch
> 
> diff --git a/meta/recipes-core/systemd/systemd/systemd_codesonar_warnings_fix.patch b/meta/recipes-core/systemd/systemd/systemd_codesonar_warnings_fix.patch
> new file mode 100644
> index 0000000..a62f968
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/systemd_codesonar_warnings_fix.patch
> @@ -0,0 +1,105 @@
> +systemd: fix codesonar warnings
> +
> +Fixed below systemd codesonar warnings.
> +1. isprint() and isspace() is invoked here with an argument of signed
> +type char, but only has defined behavior for int arguments that are
> +either representable as unsigned char or equal to the value
> +of macro EOF(-1).
> +
> +As per codesonar report, in a number of libc implementations, isprint()
> +and isspace() functions implemented using lookup tables (arrays):
> +passing in a negative value can result in a read underrun.
> +
> +To avoid this unexpected behaviour, typecasted char type argument to
> +unsigned char type.
> +
> +2. "seqnum" defined, not initialized & used in device-private.c
> +Intialized "seqnum" at definition.
> +
> +Upstream-Status: Pending

Part of 1. is a backport:
https://github.com/systemd/systemd/commit/e7e954243a17cceb5278aac6249ee0dcc119b1eb
so please backport the patch entirely.

And make separate patch(es) for the rest if they aren't already
merged upstream.

As for the content of the patch (if it's a patch candidate), I'll let
maintainers decide/review.

> +Signed-off-by: Amitanand N. Chikorde <Amitanand.Chikorde@kpit.com>
> +
> +--- origcode/src/libsystemd/sd-device/device-private.c 2020-07-09 18:05:13.744127907 +0530
> ++++ modifcode/src/libsystemd/sd-device/device-private.c        2020-07-09 18:01:56.494621945 +0530

Does this patch even apply correctly? c.f. origcode/modifcode

Cheers,
Quentin
