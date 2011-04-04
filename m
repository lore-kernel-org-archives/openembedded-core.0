Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iDw-0003Fh-Qe for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 13:46:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BhXjC015476
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:43:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14972-08 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 12:43:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BhQkw015470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:43:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9778c2218ffe94c96e816b203ded8569b19a1faf.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<9778c2218ffe94c96e816b203ded8569b19a1faf.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 12:43:23 +0100
Message-ID: <1301917403.24596.335.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 02/46] classes: Use virtual/libintl instead of gettext
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
X-List-Received-Date: Mon, 04 Apr 2011 11:46:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

I have some comments about this patch.

On Thu, 2011-03-31 at 21:28 -0700, Khem Raj wrote:
> uclibc can use a proxy-libintl to provide dummy
> gettext functionality so we need to make sure
> we operate on virtual/libintl
> 
> gettext class is fixed so we can always use
> inherit gettext to create proper dependencies
> on gettext
> 
> insane class check for virtual/libintl and
> error message is enhanced to print out gettext
> package name it reports. Code is rearranged
> for cosmetics.

Can you try and split things into units of logical changes please? There
are several separate things this patch is doing and whilst I can
separate them out in my mind, it does make the patch harder to review.

In particular, some of this is a cosmetic change and those should always
be separate.

As an example of the opposite problem, sending 20 patches which change
DEPENDS = "gettext" to "inherit gettext" isn't especially useful and we
could do that as one patch.

The explanation above of "gettext class is fixed so we can always use
inherit gettext to create proper dependencies on gettext" doesn't really
explain anything about what the problem is or how its being fixed.

Instead something like:

* Change gettext.bbclass to use virtual/libintl instead of the 
  hardcoded gettext dependency
* Ensure gettext and gettext-native are removed from DEPENDS
* Use _append instead of =+ to ensure dependencies are always added 
  correctly as in some cases += will get overwritten by other overrides.

gives much more information about what is changing and why.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/autotools.bbclass |    8 +++++++-
>  meta/classes/gettext.bbclass   |    8 ++++----
>  meta/classes/insane.bbclass    |   23 +++++++++++------------
>  3 files changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index bc891f9..c128c39 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -134,7 +134,13 @@ autotools_do_configure() {
>  			    echo "no" | glib-gettextize --force --copy
>  			  fi
>  			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
> -			  cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> +			  if ! echo ${EXTRA_OECONF} | grep -q "\-\-disable-nls"; then
> +			    if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
> +			      cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> +			    else
> +			      oenote config.rpath not found in target sysroot. gettext is not staged. Usually happens when building with uclibc
> +			    fi
> +			  fi
>  			fi

This looks likely to cause errors based on my experience if the
dependencies go wrong somehow. Can we make this more explicit about the
three cases we expect (gettext/libintl/disable-nls) and what to do in
each of them. We can then still error if gettext is enabled and that
file isn't present. The error message can then be much more specific too
about what the problem is.

> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index a40e74f..f49b595 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -3,15 +3,15 @@ def gettext_after_parse(d):
>      if bb.data.getVar('USE_NLS', d, 1) == 'no':
>          cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
>          cfg += " --disable-nls"
> -        depends = bb.data.getVar('DEPENDS', d, 1) or ""
> -        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
> +        depends = bb.data.getVar('DEPENDS', d, True) or ""
> +        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl|gettext|gettext-native)$', depends, d), d)
>          bb.data.setVar('EXTRA_OECONF', cfg, d)
>  
>  python () {
>      gettext_after_parse(d)
>  }
>  
> -DEPENDS_GETTEXT = "gettext gettext-native"
> +DEPENDS_GETTEXT = "virtual/libintl gettext-native"

I doubt there should be be a gettext-native here in the uclibc case?

How about simplifying this to:

DEPENDS_GETTEXT = "gettext gettext-native"
DEPENDS_GETTEXT_libc-uclibc = "virtual/libintl"

> -DEPENDS =+ "${DEPENDS_GETTEXT}"
> +DEPENDS_append = " ${DEPENDS_GETTEXT}"
>  EXTRA_OECONF += "--enable-nls"
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 8124384..a2bcaae 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -553,10 +553,6 @@ python do_package_qa () {
>      bb.note("DONE with PACKAGE QA")
>  }
>  
> -
> -# The Staging Func, to check all staging
> -#addtask qa_staging after do_populate_sysroot before do_build
> -do_populate_sysroot[postfuncs] += "do_qa_staging "
>  python do_qa_staging() {
>      bb.note("QA checking staging")
>  
> @@ -564,10 +560,6 @@ python do_qa_staging() {
>          bb.fatal("QA staging was broken by the package built above")
>  }
>  
> -# Check broken config.log files, for packages requiring Gettext which don't
> -# have it in DEPENDS and for correct LIC_FILES_CHKSUM
> -#addtask qa_configure after do_configure before do_compile
> -do_configure[postfuncs] += "do_qa_configure "
>  python do_qa_configure() {
>      configs = []
>      workdir = bb.data.getVar('WORKDIR', d, True)
> @@ -585,21 +577,28 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
>          if "configure.in" in files:
>              configs.append(os.path.join(root, "configure.in"))
>  
> -    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True):
> +    cnf = bb.data.getVar('EXTRA_OECONF', d, True) or ""
> +    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True) and "--disable-nls" not in cnf:
>         if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
>            gt = "gettext-native"
>         elif bb.data.inherits_class('cross-canadian', d):
>            gt = "gettext-nativesdk"
>         else:
> -          gt = "gettext"
> +          gt = "virtual/libintl"
>         deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
>         if gt not in deps:
>            for config in configs:
>                gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
>                if os.system(gnu) == 0:
> -                 bb.fatal("""Gettext required but not in DEPENDS for file %s.
> -Missing inherit gettext?""" % config)
> +                 bb.fatal("""%s required but not in DEPENDS for file %s. Missing inherit gettext?""" % (gt, config))
>  
>      if not package_qa_check_license(workdir, d):
>          bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
>  }
> +do_populate_sysroot[postfuncs] += "do_qa_staging "
> +
> +# Check broken config.log files, for packages requiring Gettext which don't
> +# have it in DEPENDS and for correct LIC_FILES_CHKSUM
> +#addtask qa_configure after do_configure before do_compile
> +
> +do_configure[postfuncs] += "do_qa_configure "




