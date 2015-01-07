Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1D171440
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 18:45:26 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z11so1559079lbi.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 10:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2SiyMLa4wGxgProsmhgM+mWCUse9Z5NJxYwr5ggCiN0=;
	b=E2Y1Bf982zgw+VjPH4iEkQ3PjYmf4NLdyBC+/9Fb9D6d3PY6JIwOzNVnTlsyJfd25l
	JGJ8MpcZZ+Xku0BDJelKOVfUvKkU7mOREWB2pIqm+w3wIzZbvnpRRvImKawpPNQo2jVt
	qzeC07wTg9+OYUXskwp6t00eRRV92LoJm+RJxmovzRMBZkkhDMdoGNa+wFWbXulk5Vrq
	GLIL2QMtroGvDdujGrlsEefQNTMOjgoK3Lp3RXLN8RI+Kwpq8zRAmNhDuFgxCDPzCqbv
	2CEHiauA9n/YDcvSTO5MQnlBwKY4EwgMbXyPjpKuImBQ5YD74lE3UE9zA2sMVZrI4x9Y
	iwHg==
MIME-Version: 1.0
X-Received: by 10.112.154.70 with SMTP id vm6mr7288484lbb.18.1420656326205;
	Wed, 07 Jan 2015 10:45:26 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 7 Jan 2015 10:45:26 -0800 (PST)
In-Reply-To: <1420651519-25240-2-git-send-email-otavio@ossystems.com.br>
References: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
	<1420651519-25240-2-git-send-email-otavio@ossystems.com.br>
Date: Wed, 7 Jan 2015 13:45:26 -0500
Message-ID: <CADkTA4MjiRZWfb4Ly9ydGKL+LpXnWAtGVXW0AVASZ273NDAGpA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] module.bbclass: Add KERNEL_SRC in EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 07 Jan 2015 18:45:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 7, 2015 at 12:25 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> When the sstate hash changes for do_configure task, the do_configure
> default implementation triggers the 'clean' to be run. For it to
> succeed we need to have KERNEL_SRC defined in EXTRA_OEMAKE. Fixes
> following error:

I wanted to reproduce this locally, since I've never seen the problem
myself.

What's the best way to trigger the sstate hash change ?

I also have a question below ...

>
> ,----
> | DEBUG: Executing shell function do_configure
> | NOTE: make -e MAKEFLAGS= clean
> | make -C  M=.../tmp/work/... clean
> | make[1]: *** M=.../tmp/work/...: No such file or directory.  Stop.
> | Makefile:20: recipe for target 'clean' failed
> | make: *** [clean] Error 2
> | ERROR: oe_runmake failed
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/module.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index ad6f7af..5cb8623 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -6,10 +6,11 @@ addtask make_scripts after do_patch before do_compile
>  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>  do_make_scripts[deptask] = "do_populate_sysroot"
>
> +EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
> +

I'm not seeing very well at the moment and my ability to browse the code
is restricted, so bear with a potentially stupid question.

It's clear from the error message above why this is needed, but I'm not
seeing the code that is respecting/using KERNEL_SRC to trigger the
clean in the right directory. Where exactly is this being used (I know your
related base.bbclass change will pull in the extra make args, but I'm just
not seeing the Makefile that respects it).

Basically, I'm trying to decide if it would be better to handle this all in
the module class, and add a do_configure to the do_compile and
do_install we already have.

Since I'm not seeing it, others might not as well .. and we can enhance the
comments to make it clear.

Bruce

>  module_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
> -                  KERNEL_SRC=${STAGING_KERNEL_DIR}    \
>                    KERNEL_VERSION=${KERNEL_VERSION}    \
>                    CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
>                    AR="${KERNEL_AR}" \
> @@ -19,7 +20,6 @@ module_do_compile() {
>  module_do_install() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
> -                  KERNEL_SRC=${STAGING_KERNEL_DIR} \
>                    CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
>                    modules_install
>  }
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

