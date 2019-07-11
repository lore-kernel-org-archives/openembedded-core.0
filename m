Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AE2797ECC0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 20:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45l7Mb6WdRz6c;
	Thu, 11 Jul 2019 22:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562877868;
	bh=ewCoNYdG3ZEu7gWtXK4CdB6pXoTI6j/GlzChHSy9WpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rshQxC+JWjFnSg9N7hUhIBr41OAJJEjG5SkbwCmldd9u+BS9484+tnRB7egHKMqX2
	knvFlSpCLN89Hw3598Jykg4bu2oSLFKvLYSxcInOYpNcHA4ERnn7Mti10g8gpYRKHA
	Kx9gepI1l1n6REjhNUqkAkNBX2Ha9l0ItrxDi81cB8FXPO+s6C0SP6DnsDxsVc6Pso
	mov5VFho8a/5UvKlvSRkIN1nVQQXSunDg4aCtt1sXZYQehs63G7Vo/cLdfzU+PTw0g
	IUy/yPQxadq+UoA/EOGcfYWwlpu4zkJonqQ/DHcthRxZ10pUlSbLt3gUxA1GfT0+qI
	vivyZB1xYjrxkC/HD4nqqL7VGUsDBmj4ndjG+/ul0AvzBOLR7emc9zQyglZkYdF9Bb
	iAnvWD93lBTjg81L3P/4KKZTJgEQjG8iKD9vJuGkPByv8cXV4jgRicX1rcPELg7fgU
	o1yXDVMgNF+seHM0yrAtjyMr4gbio0GUOHrfrDcOvGhnbypjy5Z2iwgJ9n6KTKx1eq
	AWJ091Y37/BV1PWpSJXI0KVKt7gzotH/NlXOaTtsLf+aXKNYiJHGTUQgll8n/aXfjC
	OmUuO+/CcopJrqPRIPiX31/+62GCAdiemWK8jQHSXFn5/lNnIfrEhMIs1YhTjgUjag
	Iuod2LkLvcd+YQvFxVG8iYjw=
Date: Thu, 11 Jul 2019 23:44:24 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Joe Slater <joe.slater@windriver.com>
Message-ID: <20190711204424.GA2092@localhost>
References: <20190711202739.131168-1-joe.slater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190711202739.131168-1-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libtool: allow for use of reproducible_build bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jul 2019 20:44:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jul 11, 2019 at 01:27:39PM -0700, Joe Slater wrote:
> In a reproducible build environment, do not put the build host
> name into libtool.
>...
> +Upstream-Status: Inappropriate [embedded specific]
>...

This is not specific to embedded.

> +--- a/m4/libtool.m4
> ++++ b/m4/libtool.m4
> +@@ -728,7 +728,17 @@ _LT_CONFIG_SAVE_COMMANDS([
> +     cat <<_LT_EOF >> "$cfgfile"
> + #! $SHELL
> + # Generated automatically by $as_me ($PACKAGE) $VERSION
> ++_LT_EOF
> ++    if test -n "${SOURCE_DATE_EPOCH}"; then
> ++        cat <<_LT_EOF >> "$cfgfile"
> ++# Libtool was configured for a reproducible build: ${SOURCE_DATE_EPOCH}
> ++_LT_EOF
> ++    else
> ++        cat <<_LT_EOF >> "$cfgfile"
> + # Libtool was configured on host `(hostname || uname -n) 2>/dev/null | sed 1q`:
> ++_LT_EOF
> ++    fi
> ++    cat <<_LT_EOF >> "$cfgfile"
> + # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> + 
>...

The Debian patch for the same purpose simply removes the problematic 
line - a comment with the build host was anyways not important information.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


