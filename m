Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <0ba9abf33b447151d7b2e500d7ba4d59fb2153f9.camel@linuxfoundation.org>
Subject: Re: [OE-core] GIT_CONFIG_PARAMETERS does not work
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 06 May 2022 08:08:29 +0100
In-Reply-To: <CO6PR11MB5602F4C0C926F81D7092C5CBEDC59@CO6PR11MB5602.namprd11.prod.outlook.com>
References: 
	<CO6PR11MB5602F4C0C926F81D7092C5CBEDC59@CO6PR11MB5602.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Chen Qi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>

On Fri, 2022-05-06 at 03:44 +0000, Chen Qi wrote:
> Hi Ross & Richard,
>  
> I’m building hardknott on host with git 2.36.0. And gnulib do_install fails
> with git unsafe repo error.
> The same error could be reproduced by reverting Khem’s fix for gnulib
> do_install and building gnulib against master.
>  
> | fatal: unsafe repository ('/ala-lpggp72/qichen/Yocto/builds/build-
> master/tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0/git' is owned by
> someone else)
> | To add an exception for this directory, call:
> |
> |       git config --global --add safe.directory /ala-
> lpggp72/qichen/Yocto/builds/build-master/tmp/work/core2-64-poky-
> linux/gnulib/2018-03-07.03-r0/git
>  
>  
> I can see that we have already been trying to use the GIT_CONFIG_PARAMETERS to
> solve this issue. Related changes are:
> “””
> +# Treat all directories are safe, as during fakeroot tasks git will run as
> +# root so recent git releases (eg 2.30.3) will refuse to work on
> repositories. See
> +# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9
> for
> +# further details.
> +export GIT_CONFIG_PARAMETERS="'safe.directory=*'"
> “””
>  
> However, following the link above and I can see that the commit message says:
> “””
>     The `safe.directory` config setting is only respected in the system and
>     global configs, not from repository configs or via the command-line, and
> can have multiple values to allow for multiple shared repositories.
> “””
>  
> If I understand it correctly, this means that the command line environment
> variables have no effect.
> Also, I figure if some user could set his/her own environment variable to
> bypass this security check, then this security check does not make much sense.
>  
> So I think we should use the intercept script approach and add back the
> following line.
> PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
>  
> What do you think?

That patch isn't enough, we'll need the global intercept approach I had in later
patches.

Cheers,

Richard

