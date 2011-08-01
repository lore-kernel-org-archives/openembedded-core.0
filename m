Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnoRU-0000gW-MT for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 11:05:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7191NCU005099
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 10:01:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04880-01 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 10:01:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7191BNn005093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 10:01:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <44bd82a28e643c335047026c581b34497b6c8fb5.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<44bd82a28e643c335047026c581b34497b6c8fb5.1312182844.git.sgw@linux.intel.com>
Date: Mon, 01 Aug 2011 10:00:59 +0100
Message-ID: <1312189259.2344.422.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 17/22] bitbake.conf: Add default tune-${DEFAULTTUNE} override
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
X-List-Received-Date: Mon, 01 Aug 2011 09:05:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> From: Mark Hatle <mark.hatle@windriver.com>
> 
> We need to add the tune-* override in order for more complicated tune
> features to function properly.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/conf/bitbake.conf |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9c80f11..11dfb6d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -637,9 +637,10 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
>  #
>  # This works for  functions as well, they are really just environment variables.
>  # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> -OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${TUNEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
>  DISTROOVERRIDES ?= "${DISTRO}"
>  MACHINEOVERRIDES ?= "${MACHINE}"
> +TUNEOVERRIDES ?= "tune-${DEFAULTTUNE}"
>  
>  CPU_FEATURES ?= ""
>  CPU_FEATURES_arm ?= "vfp"

This is a really bad idea and evidently hasn't been tested or thought
through :(

Why? The problem is you can't "unset" an override. This means you will
lock DEFAULTTUNE's values into the system and if you then want to change
to a different multilib the result will be confused at best.

So I'm afraid this is going to need a rethink.

Cheers,

Richard








