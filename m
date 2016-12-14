Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id B4A5F77218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 23:38:55 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p9so5849510vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 15:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mw9v0A3fkTADRVIYZCFugT8uReQO3ewfhZMPGw2FTMo=;
	b=HeX+Lp+477LO8ob9m3lAvUjm2kUabF56LiUUgYkKpwD+8I3y79rL4aSUdqYq9Q0+66
	bFHE8g/sNg9LtkSdXb+N83AWH3F//wLrnnZpa1hw1qvYZLsH/ovmzRBjU6cw9XTa2AYL
	NdsSmdpVre6F2cv1/ihNurlY8EV+80q5tATNmhEkoIB4nkn/3VsZI2hfPhtgNIPz0dlw
	Be3XsBTDe7XwZHw3ZM0McGtZauXaGirod4VQPhVRaBgS0EmzkX56eOZfh4oOwygn5+dw
	BwcIqj5t8hxD8LcuqIbTn0Tj/fTbaX5ugCC89c1rg/kScA9AYUewKIgeM/tuHrMPneRL
	YjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mw9v0A3fkTADRVIYZCFugT8uReQO3ewfhZMPGw2FTMo=;
	b=sspklKJ+CzMfloUwnlkUITW9mSPVFqFVsgYbkLbklxfWniBqkBh0turCT9m+skSKFT
	V7bHPjK1C7pLS3ckLv8vYr0fk59pAqer1y0SuVjA3Flw8VN1Tn/B9dEePe2+JXEqHOQK
	LVRMgkl5bWQGFHWecTBSS0vnRNmoDZjMO9tNR42LBRB5Q476kFK6n7JZvbM4X86qasyi
	EEJMOXfLNlenYJRpkfAm1jJgBQHYrhxHzUTL6+Xg1Wzu3rLMTwShsz2ZJv65EJkm5LAf
	yLNZv2H2oBu4zCMei4IDVi7lSKzSkzI0OldNkwu8w5shsGb94MKe1D/ZGLVceS3J7gDT
	2x4g==
X-Gm-Message-State: AKaTC03FcFfwUMjtnZIyLr6gU7MZKpg5D9kQ23A8lxJ4k6VLPuV/lJ6+yLYZ/ReS0ohXrbk/C4MlS18yVABjBg==
X-Received: by 10.159.48.146 with SMTP id j18mr91135554uab.6.1481758737222;
	Wed, 14 Dec 2016 15:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 14 Dec 2016 15:38:26 -0800 (PST)
In-Reply-To: <1481751480.3851.14.camel@pbcl.net>
References: <1481751480.3851.14.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Dec 2016 15:38:26 -0800
Message-ID: <CAMKF1sq--mXBzTh+xc+gZb9L9wNugK8izZ-MMrYJyKKKdR9aOg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-ust: Patch python shebang appropriately for native builds
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
X-List-Received-Date: Wed, 14 Dec 2016 23:38:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 14, 2016 at 1:38 PM, Phil Blundell <pb@pbcl.net> wrote:
> If we are building a native package then ${bindir}/python3 is not guaranteed
> to be available, and if it is available then it is probably a directory not a
> file.  In either case, attempting to use it as an interpreter will not end
> well.  Let's use ${bindir}/nativepython instead.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-kernel/lttng/lttng-ust_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
> index 5869093..df22352 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
> @@ -29,10 +29,12 @@ SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.7 \
>
>  PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
>
> +usepython="${bindir}/python3"
> +usepython_class-native="${bindir}/nativepython"
>  do_install_append() {
>          # Patch python tools to use Python 3; they should be source compatible, but
>          # still refer to Python 2 in the shebang
> -        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/lttng-gen-tp
> +        sed -i -e '1s,#!.*python.*,#!${usepython},' ${D}${bindir}/lttng-gen-tp

This also means we need to add a dependency on python-native may be it
should inherit the python native class.

>  }
>
>  S = "${WORKDIR}/git"
> --
> 2.10.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

