Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id DDBA860110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 18:58:06 +0000 (UTC)
Received: by wmec201 with SMTP id c201so42197613wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 10:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SeG0PyRPFZ7HEYBwgAl2BKqcYMMONJKpIxopPFX5zCY=;
	b=OCD4QNkjqm174t6JM9syPq/8KAv1uj4ioBdAPRiEcaQRBDjSv8MVs0yy/uMEKS654o
	2mOZ5c4IoJsCqmkW4S/saLfAkxTlq/sPRrzwRRjceqcJYNdYCDHHkOOaREncgDI+cyic
	I8TLQ5co2G0Oj8hzissla3E2BiwYAc2IHXBSDr9SHg94NvNOgKVA83RcvZJR5lolxBU8
	HikBWgoaXcucGZBwaAYk+xjQxfZL9D9p3+ZlzAUWffyQfMV7Ra5eIMIY/Krzius2GKa+
	fUYxJ6m3llYuOQRvKJwdasvKFzSpD0pu2A71vtoUqSeKXVcJCT+ChMPM/NH/EjDgqWy5
	+Wng==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr1397425wjc.114.1449601087010; 
	Tue, 08 Dec 2015 10:58:07 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Tue, 8 Dec 2015 10:58:06 -0800 (PST)
In-Reply-To: <1446813421.15270.168.camel@linuxfoundation.org>
References: <1446813421.15270.168.camel@linuxfoundation.org>
Date: Tue, 8 Dec 2015 10:58:06 -0800
Message-ID: <CAJ86T=XJqne2HOGpWo346qncmGaXwkjVVU8RZmxMok4vg7e+kg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: Improve handling of switching virtual/x providers
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
X-List-Received-Date: Tue, 08 Dec 2015 18:58:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 6, 2015 at 4:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If you build virtual/kernel, then change PREFERRED_PROVIDER_virtual/kernel from say
> "linux-yocto" to "linux-yocto-dev", you see errors from the sysroot about overlapping
> files. The automatic uninstall logic doesn't trigger since the other recipes is
> still technically parsed/buildable.
>
> What we can do is look at the value of PREFERRED_PROVIDER_virtual/X and raise SkipRecipe
> (skip parsing) if it provides this thing and its not selected. We skip cases no preferred
> provider is set, or the value is in MULTI_PROVIDER_WHITELIST.We also inform the user
> if they try to build something which conflicts with the configuration:
>
> $ bitbake linux-yocto-tiny
> ERROR: Nothing PROVIDES 'linux-yocto-tiny'
> ERROR: linux-yocto-tiny was skipped: PREFERRED_PROVIDER_virtual/kernel set to linux-yocto, not linux-yocto-tiny

This change seems to cause problems for musl libc builds (I'm using
today's oe-core master and Khem's meta-musl layer).

  ERROR: Nothing RPROVIDES 'nativesdk-glibc' (but
/home/andre/rdk/rdk-master-musl/openembedded-core/meta/recipes-core/meta/uninative-tarball.bb
RDEPENDS on or otherwise requires it)
  ERROR: nativesdk-glibc was skipped:
PREFERRED_PROVIDER_virtual/nativesdk-x86_64-rdksdk-linux-libc-for-gcc
set to nativesdk-musl, not nativesdk-glibc
  ERROR: Required build target 'rdk-image-wpe' has no buildable providers.
  Missing or unbuildable dependency chain was: ['rdk-image-wpe',
'uninative-tarball', 'nativesdk-glibc']

Reverting this one commit (oe-core 9a3b992) gets the builds working again.


> [YOCTO #4102]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 44ca781..b8f2aea 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -204,7 +204,7 @@ def buildcfg_neededvars(d):
>          bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
>
>  addhandler base_eventhandler
> -base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete"
> +base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete bb.event.RecipeParsed"
>  python base_eventhandler() {
>      import bb.runqueue
>
> @@ -257,6 +257,25 @@ python base_eventhandler() {
>              bb.debug(1, "Executing SceneQueue Completion commands: %s" % "\n".join(cmds))
>              bb.build.exec_func("completion_function", e.data)
>              os.remove(completions)
> +
> +    if isinstance(e, bb.event.RecipeParsed):
> +        #
> +        # If we have multiple providers of virtual/X and a PREFERRED_PROVIDER_virtual/X is set
> +        # skip parsing for all the other providers which will mean they get uninstalled from the
> +        # sysroot since they're now "unreachable". This makes switching virtual/kernel work in
> +        # particular.
> +        #
> +        pn = d.getVar('PN', True)
> +        source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
> +        if not source_mirror_fetch:
> +            provs = (d.getVar("PROVIDES", True) or "").split()
> +            multiwhitelist = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
> +            for p in provs:
> +                if p.startswith("virtual/") and p not in multiwhitelist:
> +                    profprov = d.getVar("PREFERRED_PROVIDER_" + p, True)
> +                    if profprov and pn != profprov:
> +                        bb.warn("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
> +                        raise bb.parse.SkipPackage("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
>  }
>
>  CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

