Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1073.1615229455351154877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aqFUKO5L;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id l7so7815336pfd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YRM5i5PukgBoePuadNrMC+YC3d+RamuqVJU9EFnji4o=;
        b=aqFUKO5LBBc2fCZFCYcu9DU0eoN+p1W/56PZyCecU+PWKJb+aLkWrj5p/gWPK+0spg
         tZ5tYw6NSWi2NUynbF5mRH7TO+RcnocFoI17lagbWVzdryePzCsh31SfjQ59z47U1hnM
         n3VWPop5ublXUn+WWb3LhOpvxGhPJErzVoJfZP3Hy6nWFNYLvLkqKRT4zQJz36v4TaUr
         heMgDNVi9qpM6U7TFAGmwdysYNGKezp5l3lSOtoAmR6yPdq/AevdjHPGRg38l+YaVUAb
         kjcT78J+4tR0JUUzvjtOVfH3qKoD6JhhAC/S57/NXvbRnemXH7xJ+3fLWc5r1B1uOni+
         lSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YRM5i5PukgBoePuadNrMC+YC3d+RamuqVJU9EFnji4o=;
        b=LKwHwHnnAhdIx0O0vW/Lfwu89B03+S4c00rgoNcf0RIafbJOYCkkTzXJa1LG+cf3uf
         4i0qpkqE21gh7qz6s6/uoHTFTr8cLoVYiAZu+eN8yujqsVZPAtjCUfVURyn9GNni90HQ
         0TELkZ7bho8WzDSWwH81daR+ITtEbZKGPlERVJ255yKvgyOYXwK3kokU3UhUI1MAG2KV
         3gSlROSP7h7ySvQFk3E3sesrAbSvtuWWcjSKCUYrnXr5W4sAxAmXM84ya8bXPlvUnJec
         Q+Kyz9JfOxCUBuXJRC1tYUoeSk71nRGlTyRNWl0J0rgoTytcE96kaVY0qsjpVjOzuzdH
         9QUw==
X-Gm-Message-State: AOAM532EIhIE8P9E07sfHCsrdshMfIOYF6eMhJx01x/bs5ve1ppNr4dN
	5L6kakJYgi2P+QhZKt28mB374uziXV0Pfw==
X-Google-Smtp-Source: ABdhPJzmjmwnkjnBCSlMmdcPRM9xTcVVG8FLMh19hE0sW2cZCdB8ryNqiqRjz+F78qgdWgec1dKJVQ==
X-Received: by 2002:a62:2aca:0:b029:1bb:4349:f889 with SMTP id q193-20020a622aca0000b02901bb4349f889mr22346273pfq.26.1615229454470;
        Mon, 08 Mar 2021 10:50:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:e039:b4fe:1680:1244? ([2601:646:9200:a0f0:e039:b4fe:1680:1244])
        by smtp.gmail.com with ESMTPSA id q95sm116516pjq.20.2021.03.08.10.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 10:50:54 -0800 (PST)
Subject: Re: [OE-core] [PATCH 1/1] extrausers: Add ability to force password change on first login
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
 openembedded-core@lists.openembedded.org
References: <20210308180836.144245-1-mark.hatle@kernel.crashing.org>
 <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5e4a3970-879f-5b8b-77d4-bd8b4ec7ed73@gmail.com>
Date: Mon, 8 Mar 2021 10:50:53 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308180836.144245-2-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/8/21 10:08 AM, Mark Hatle wrote:
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

I think it should check for r/w rootfs feature perhaps. unrelated to 
this change but it seems it adds a dep on shadow disregarding DISTRO 
policies where user might have chosen a different login managager, it 
should perhaps warn about it.

> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>   meta/classes/extrausers.bbclass | 29 +++++++++++++++++++++++++++--
>   meta/conf/documentation.conf    |  1 +
>   2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
> index 90811bfe2a..e9d9358bef 100644
> --- a/meta/classes/extrausers.bbclass
> +++ b/meta/classes/extrausers.bbclass
> @@ -14,10 +14,10 @@
>   
>   inherit useradd_base
>   
> -PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
> +PACKAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS')) or bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
>   
>   # Image level user / group settings
> -ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' set_user_group;'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
>   
>   # Image level user / group settings
>   set_user_group () {
> @@ -66,6 +66,31 @@ set_user_group () {
>   	done
>   }
>   
> +# Image level force a specific user/users to reset their password on first login
> +# Note: this requires shadow passwords and login programs that respect the shadow
> +# expiration field.
> +ROOTFS_POSTPROCESS_COMMAND_append = "${@['', ' force_password_change;'][bool(d.getVar('EXTRA_FORCE_PASSWORD_CHANGE'))]}"
> +
> +# Works by setting 'date of last password change' to 0, which has a special
> +# meaning of 'user should change her password the next time she will log in the
> +# system' See: shadow (5)
> +force_password_change () {
> +	if [ ! -e ${IMAGE_ROOTFS}/etc/shadow ]; then
> +		bberror "/etc/shadow does not exist in the image, unable to set password change on login."
> +		return
> +	fi
> +	passwd_change_users="${EXTRA_FORCE_PASSWORD_CHANGE}"
> +	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
> +	for name in $passwd_change_users; do
> +		if ! grep -q '^'$name':' ${IMAGE_ROOTFS}/etc/shadow ; then
> +			bberror "Unable to find user $name in /etc/shadow, unable to set password change on login."
> +		fi
> +		bbnote "Set user $name to need a password change on first login."
> +		cmd="sed -i ${IMAGE_ROOTFS}/etc/shadow -e 's,^'$name':\\([^:]*\\):[^:]*:,'$name':\\1:0:,'"
> +		eval flock -x ${IMAGE_ROOTFS}${sysconfdir} -c \"$PSEUDO $cmd\" || true
> +	done
> +}
> +
>   USERADDEXTENSION ?= ""
>   
>   inherit ${USERADDEXTENSION}
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index c5a38b0764..d1c5b8b1a3 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -169,6 +169,7 @@ EXTRA_OESCONS[doc] = "When a recipe inherits the scons class, this variable spec
>   EXTRA_QMAKEVARS_POST[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be after the .pro file list on the command line."
>   EXTRA_QMAKEVARS_PRE[doc] = "Configuration variables or options you want to pass to qmake when the arguments need to be before the .pro file list on the command line."
>   EXTRA_USERS_PARAMS[doc] = "When a recipe inherits the extrausers class, this variable provides image level user and group operations."
> +EXTRA_FORCE_PASSWORD_CHANGE[doc] = "When a recipe inherits the extrausers class, this variable causes the specified users to require a password change on first login."
>   
>   #F
>   
> 
> 
> 
> 
> 
