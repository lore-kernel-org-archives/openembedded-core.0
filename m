Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 33E047D6B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 08:37:03 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id h11so2831434wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=oHBSDpvK9xkyFAku/ZwosvEI8FlIwKqo/5PwGapZ5Ao=;
	b=X77iby2TeM6r7A05VrBkdmDKjpafnog4JamRCtEZg0rRqgFigMkEO7/4GoRYusWxt4
	MER5X24SlAX/TxVkGRj1irjsljXPZzA5qk4pG2KJtqPrOCOymNwtaoeopPsfUqCAxmAP
	7kEl4aHvdlKJUMLNP3oQ0m6ruttoZ8pApiPv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oHBSDpvK9xkyFAku/ZwosvEI8FlIwKqo/5PwGapZ5Ao=;
	b=gKj3WucEHffWdzIeu7C7oYzQSkoZo3lUOkKgOVs1PxoF1RmjQV37nLSLWQhBOs5Gz2
	DSh2Mf22uLVzUCqMYWuea8pWUJwGRo0qG20e2QxX11UBGo7UnLiJ4qAU15YyaxFU7stE
	CMuACF85UES7dOHftMC5CnYlBQdQGtGij8KZSsFQHdfRxzvuGM0ryY3aJQVfrwUC7obU
	LT1alLlqIKPhMn+ZKH0hpH7Zo8AFF9ghfdnrmkW88FOvQoN6WUmFRUfQNc5jV1gkaOo2
	u2YYb5cBJeNTkarh5//JlduYnfb8H9halDR7fTutsZeAvn+WHc13i0hrPyysWKDL+55/
	VZYQ==
X-Gm-Message-State: APjAAAUt2oxz+V9WO/UxDVj8ds5hBMfhkfewgzwzgxrVH9zZoXm+mlnz
	O92xbGP23WGbriide3frt7yFjw==
X-Google-Smtp-Source: APXvYqzGbxBMCFk5MJ3ZT8VXM3I+y6gsIaKGdeOM97mKP2CJROIJjUlSckMLi+eeatNGl9miqp9n6A==
X-Received: by 2002:a1c:7d14:: with SMTP id y20mr2274269wmc.26.1556613423737; 
	Tue, 30 Apr 2019 01:37:03 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e6sm29329361wrc.96.2019.04.30.01.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 01:37:02 -0700 (PDT)
Message-ID: <e9de6b6c335464a1eb8321d0c85697f815918354.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitradio.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 09:37:01 +0100
In-Reply-To: <20190430023405.29459-1-douglas.royds@taitradio.com>
References: <20190430023405.29459-1-douglas.royds@taitradio.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] distutils: Run python from the PATH in the -native case as well
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
X-List-Received-Date: Tue, 30 Apr 2019 08:37:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 14:34 +1200, Douglas Royds via Openembedded-core wrote:
> The python distutils generate a python wrapper script for each package.
> These python scripts have shebang lines pointing to the python executable.
> In our case, this is a fully-qualified path to python-native in the
> recipe-sysroot-native.
> 
> Ubuntu 18.04 restricts the useful length of the shebang line to 125
> characters, and Ubuntu 16.04 restricts it to 77. In both cases, the
> staged python script fails to run due to the length of the path to
> the python-native executable.
> 
> Replace the shebang line with:
> 
>     #!/usr/bin/env python
> 
> We were already doing this for on-target distutils components.
> This change applies the sed-line to -native distutils components as
> well.
> 
> The python executable must be in the PATH.
> Client components must inherit pythonnative.
> 
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/distutils.bbclass | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index 9862731493..e7d79271e3 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -53,18 +53,14 @@ distutils_do_install() {
>  
>          if test -e ${D}${bindir} ; then	
>              for i in ${D}${bindir}/* ; do \
> -                if [ ${PN} != "${BPN}-native" ]; then
> -			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
> -		fi
> +                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
>                  sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
>              done
>          fi
>  
>          if [ -e ${D}${sbindir} ]; then
>              for i in ${D}${sbindir}/* ; do \
> -                if [ ${PN} != "${BPN}-native" ]; then
> -			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
> -		fi
> +                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
>                  sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
>              done
>          fi

I have a bad feeling that there is a reason we use the full path. I
have memories of cases where the "python-native" component isn't in
PATH but we obviously still want it to use our python since that is
what its been built against.

One fix would be to apply this, then ensure all those locations inherit
the pythonnative bbclass however I think that becomes annoying as
anything using the recipe as a dependency also has to inherit the
class.

I *think* we might have therefore created a nativepython symlink of
some kind to ./python-native/python. The right fix might therefore be
to use "${USRBINPATH}/env\ nativepython"?

You'll have to check the code for the correct names as I'm going from
memory.

Cheers,

Richard




