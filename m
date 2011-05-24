Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOsSd-0000QO-Tu for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 16:19:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OEGliW020410;
	Tue, 24 May 2011 15:16:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20127-05; Tue, 24 May 2011 15:16:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OEGcGm020404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 May 2011 15:16:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 24 May 2011 15:16:35 +0100
Message-ID: <1306246595.3424.932.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][PATCH] bitbake.conf: make OVERRIDES match what people expect
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2011 14:19:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 16:04 +0200, Koen Kooi wrote:
> In the current situation TARGET_ARCH will override MACHINE, which is counter intuitive since the machine is more specific than the arch.
> 
> The order is now pn-$PN} -> arch -> machine -> distro as the machine is a set of defaults and the distro is the ultimate policy.
> 
> 'failfast' has been removed since it's not used anymore, just like 'local'

I've been thinking through the different use cases and briefly talked
with Koen offlist about this. I think the revised order makes sense with
what users would expect and am happy to remove local and fail-fast as
overrides since we don't have people using them (local is pretty
weak/useless and fail-fast has only ever been used by gcc recipes
afaik).

Its a potentially disruptive change but one I do think we need to make.
We don't have many double/stacked overrides so there shouldn't be much
impact to existing metadata.

Cheers,

Richard



> ---
>  meta/conf/bitbake.conf |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a0af672..59238b8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -602,15 +602,15 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
>  # 
>  # This means that an envionment variable named '<foo>_arm' overrides an
>  # environment variable '<foo>' (when ${TARGET_ARCH} is arm).
> -# An environment variable '<foo>_ramses' overrides '<foo>' but doesn't override
> -# '<foo>_arm' when ${MACHINE} is 'ramses'. 
> -# If you use combination ie '<foo>_arm_ramses', then '<foo>_arm_ramses' will override 
> -# '<foo>_arm' and then '<foo>' will be overriden with that value from '<foo>_arm'.
> -# And finally '<foo>_local' overrides any standard variable, but with lowest priority.
> +# An environment variable '<foo>_qemuarm' overrides '<foo>' and overrides
> +# '<foo>_arm' when ${MACHINE} is 'qemuarm'. 
> +# If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override 
> +# '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
> +# And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
>  #
>  # This works for  functions as well, they are really just environment variables.
>  # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> -OVERRIDES = "local:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>  DISTROOVERRIDES ?= "${DISTRO}"
>  MACHINEOVERRIDES ?= "${MACHINE}"
>  




