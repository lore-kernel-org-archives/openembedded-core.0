Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 035347702B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tA6DeOUK013925 for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Nov 2015 13:40:24 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BI6GRMiPwPUu
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:40:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tA6DeAu6013911
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Nov 2015 13:40:21 GMT
Message-ID: <1446817210.15270.172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Nov 2015 13:40:10 +0000
In-Reply-To: <1446813421.15270.168.camel@linuxfoundation.org>
References: <1446813421.15270.168.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 06 Nov 2015 13:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-11-06 at 12:37 +0000, Richard Purdie wrote:
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
> 
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

Obviously minus the above line. I'll remove that in any version I add to
-next.

Cheers,

Richard

> +                        raise bb.parse.SkipPackage("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
>  }
>  
>  CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
> 
> 



