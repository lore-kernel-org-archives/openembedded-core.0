Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e790ba26401bfca4d526588e88d4c0318a40ddcc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: Use custom kernel path if provided
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 02 Mar 2022 23:02:56 +0000
In-Reply-To: <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
References: 
	<SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Bill Pittman <bill.pittman@ni.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Tue, 2022-02-15 at 16:54 +0000, Bill Pittman wrote:
> If the custom kernel path is provided in options, then
> use that path instead of the default path.
> 
> Signed-off-by: Bill Pittman <bill.pittman@ni.com>
> ---
>  scripts/wic | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/wic b/scripts/wic
> index a741aed364..29a157bf37 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -159,6 +159,9 @@ def wic_create_subcommand(options, usage_str):
>                             "(Use -e/--image-name to specify it)")
>          native_sysroot = options.native_sysroot
>  
> +    if options.kernel_dir:
> +        kernel_dir = options.kernel_dir
> +
>      if not options.vars_dir and (not native_sysroot or not
> os.path.isdir(native_sysroot)):
>          logger.info("Building wic-tools...\n")
>          subprocess.check_call(["bitbake", "wic-tools"])


The concern with these kinds of changes is I can't really test it or tell if it
is the right thing to do and I worry about it regressing in the future.

Is there part of the test coverage we should be improving too? wic does have
fairly good coverage from oe-selftest -r wic

Cheers,

Richard

