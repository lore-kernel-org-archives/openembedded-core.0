Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UaVLV-0007dE-Go
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 20:13:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2013 10:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,642,1363158000"; d="scan'208";a="300048128"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2013 10:55:27 -0700
Message-ID: <518BE30F.5050104@linux.intel.com>
Date: Thu, 09 May 2013 10:55:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130509130319.GE3188@jama>
	<1368109872-4273-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1368109872-4273-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: fix reported executable name caused by OE wrapper
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
X-List-Received-Date: Thu, 09 May 2013 18:13:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2013 07:31 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-devtools/flex/flex.inc                 | 15 ++++++++++++++-
>   .../flex/flex/drop.suffix.from.wrapper.patch        | 21 +++++++++++++++++++++
>   2 files changed, 35 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch
>
> diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> index 517db16..344b716 100644
> --- a/meta/recipes-devtools/flex/flex.inc
> +++ b/meta/recipes-devtools/flex/flex.inc
> @@ -6,10 +6,23 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
>   SECTION = "devel"
>   LICENSE = "BSD"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
> +SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> +           file://drop.suffix.from.wrapper.patch \
> +"
>
>   inherit autotools gettext
>
> +# drop building doc, there is openembedded-core/scripts/help2man
> +# but that just returns exit 1 and flex.1 is immediately removed:
> +# openembedded-core/scripts/help2man --name='the fast lexical analyser generator' \
> +# --section=`echo $i | sed -e 's/.*\.\([^.]*\)$/\1/'` \
> +#  ../flex > $i || rm -f $i ; \
> +# and do_install fails, it wasn't failing before, because flex.1 included in
> +# release tarbal was valid until we patched main.c in drop.suffix.from.wrapper.patch
> +do_configure_prepend() {
> +	sed -i "/^\s*doc /d" Makefile.am
I think this needs a ${S} in front of the Makefile.am otherwise it's not 
found since we are doing the configure in ${B}

Thanks
	Sau!

> +}
> +
>   M4 = "${bindir}/m4"
>   M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
>
> diff --git a/meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch b/meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch
> new file mode 100644
> index 0000000..9bbd088
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch
> @@ -0,0 +1,21 @@
> +Upstream probably doesn't expect wrappers like we create for flex.
> +
> +This also fixes disabled C_plus_plus functions in flex++ if we ever create wrapper for flex++.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +--- flex-2.5.35/main.c.orig	2013-05-09 15:19:34.619281743 +0200
> ++++ flex-2.5.35/main.c	2013-05-09 15:19:10.216280868 +0200
> +@@ -984,6 +984,10 @@
> + 	/* Enable C++ if program name ends with '+'. */
> + 	program_name = basename2 (argv[0], 0);
> +
> ++	/* Drop trailing .real suffix if it's there */
> ++	if (strstr(program_name, ".real") != NULL && strstr(program_name, ".real") - program_name == strlen(program_name) - 5)
> ++	    program_name[strlen (program_name) - 5] = '\0';
> ++
> + 	if (program_name[0] != '\0' &&
> + 	    program_name[strlen (program_name) - 1] == '+')
> + 		C_plus_plus = true;
>


