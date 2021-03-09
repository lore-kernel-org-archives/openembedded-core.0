Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web10.6272.1615281356155601685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 01:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4DvqLx57BSz5tlD;
	Tue,  9 Mar 2021 10:15:52 +0100 (CET)
Date: Tue, 9 Mar 2021 10:15:51 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] extrausers: Add ability to force password change on first login
Message-ID: <20210309091551.zrgha2gwgrtl47pz@qschulz>
References: <20210308180836.144245-1-mark.hatle@kernel.crashing.org>
 <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
MIME-Version: 1.0
In-Reply-To: <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

On Mon, Mar 08, 2021 at 12:08:36PM -0600, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
> 
> As documented in shadow(5), the third parameter is the last login time.  A
> special value of '0' is defined which causes the password system to force
> a password change on next login.
> 
> Adding the variable "EXTRA_FORCE_PASSWORD_CHANGE", a space separated list of
> user names, we can use this to adjust the shadow file's third value for the
> listed users.
> 
> Note: This does have the same dependencies as other usages of extrausers,
> specifically base-passwd and shadow.
> 
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/extrausers.bbclass | 29 +++++++++++++++++++++++++++--
>  meta/conf/documentation.conf    |  1 +
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
> index 90811bfe2a..e9d9358bef 100644
> --- a/meta/classes/extrausers.bbclass
> +++ b/meta/classes/extrausers.bbclass
> @@ -14,10 +14,10 @@
>  
>  inherit useradd_base
>  
> -PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
> +PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS')) or bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
>  
>  # Image level user / group settings
> -ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' set_user_group;'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
>  

Am i the only one having a hard time reading this for what seems to be a
simple if condition?

Would the following work/make more sense?

${@'set_user_group;' if d.getVar('EXTRA_USERS_PARAMS'} else ''}?

Not saying there is a need to change, since I can see you merely
modified the original implementation, just wondering about the story
behind this choice.

[...]

> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index c5a38b0764..d1c5b8b1a3 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -169,6 +169,7 @@ EXTRA_OESCONS[doc] = "When a recipe inherits the scons class, this variable spec
>  EXTRA_QMAKEVARS_POST[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be after the .pro file list on the command line."
>  EXTRA_QMAKEVARS_PRE[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be before the .pro file list on the command line."
>  EXTRA_USERS_PARAMS[doc] = "When a recipe inherits the extrausers class, this variable provides image level user and group operations."
> +EXTRA_FORCE_PASSWORD_CHANGE[doc] = "When a recipe inherits the extrausers class, this variable causes the specified users to require a password change on first login."
>  

The actual reason for this mail below :)

Could you send a patch to yocto-docs to add this new variable to
ref-manual/variables and ref-classes/extrausers when this gets merged
please?

Thanks!
Quentin
