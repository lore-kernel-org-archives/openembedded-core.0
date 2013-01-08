Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Tsbvt-0004DN-O5
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:21:48 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r08G6Wj7012523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Jan 2013 17:06:33 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Tsbh9-0002xw-W6; Tue, 08 Jan 2013 17:06:32 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1357658627-31689-1-git-send-email-ross.burton@intel.com>
Date: Tue, 08 Jan 2013 17:06:31 +0100
In-Reply-To: <1357658627-31689-1-git-send-email-ross.burton@intel.com> (Ross
	Burton's message of "Tue, 8 Jan 2013 15:23:47 +0000")
Message-ID: <lyd2xfmzg8.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pkgconfig: add -native script that uses the native sysroot instead of target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 16:21:49 -0000
Content-Type: text/plain

Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> pkg-config-native is useful when building a package for the target that needs to
> compile a build-time tool, to avoid having to hard-code many paths.

how will you call this wrapper when e.g. makefile contains:

| foo_CFLAGS = $(shell pkg-config --cflags foo)

? 

A more powerful approach might be to install it as 'pkg-config' under
${STAGING_BINDIR_NATIVE}/pkg-config-native/ and prepend this dir to
$PATH when executing the makefile above.


> --- /dev/null
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
> @@ -0,0 +1,7 @@
> +#! /bin/sh
> +
> +PKG_CONFIG_PATH="@PATH_NATIVE@"
> +PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
> +unset PKG_CONFIG_SYSROOT_DIR
> +
> +pkg-config "$@"

1. last 'pkg-config' should be called with 'exec'

2. it depends on too much assumptions (e.g. that PKG_CONFIG_PATH and
   _LIBDIR are already exported.

I would write it:

| #! /bin/sh
| exec env -u PKG_CONFIG_SYSROOT_DIR \
|    PKG_CONFIG_PATH="@PATH_NATIVE@" \
|    PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@" \
|    pkg-config "$@"


Enrico


