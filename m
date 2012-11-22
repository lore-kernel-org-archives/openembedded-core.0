Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TbKjV-0002Nl-OM
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 01:33:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Nov 2012 16:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,295,1352102400"; d="scan'208";a="222862141"
Received: from unknown (HELO [10.255.12.43]) ([10.255.12.43])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2012 16:19:26 -0800
Message-ID: <50AD6F8E.50807@linux.intel.com>
Date: Wed, 21 Nov 2012 16:19:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1352439901.git.Qi.Chen@windriver.com>
	<e4558ca77d64a8f3702c05599a630a00ddc0170f.1352439901.git.Qi.Chen@windriver.com>
In-Reply-To: <e4558ca77d64a8f3702c05599a630a00ddc0170f.1352439901.git.Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] autotools.bbclass: use relative path for acpaths whenever possible
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
X-List-Received-Date: Thu, 22 Nov 2012 00:33:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2012 09:47 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> When the TMPDIR is very long, say, 410 characters, aclocal would
> fail because the argument list is too long. This patch is an effort
> to use relative path for acpaths whenever possible, aiming at
> making the build system work correctly when the sanity check says OK.
>
> With the current implementation of autoreconf, it's impossible to
> thoroughly replace absolute path with relative path. Therefore, we
> use relative path when there's on subdirectory to configure; otherwise,
> we use absolute path.
>
Have you done a world build long path names with this patch on 1.4 and 
does it cause any failures with autoreconf and subdirs?

Sau!


> [YOCTO #2766]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/autotools.bbclass |   14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index b97d74b..86d8939 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -123,8 +123,11 @@ autotools_do_configure() {
>   		rm -f `dirname $ac`/configure
>   		done )
>   	if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
> +               [ -e configure.in ] && CONFIGURE_AC=configure.in || CONFIGURE_AC=configure.ac
>   		olddir=`pwd`
>   		cd ${S}
> +		# Determine whether there's subdirs to configure
> +		grep -q -m 1 AC_CONFIG_SUBDIRS $CONFIGURE_AC && sub_cfg=1 || sub_cfg=0
>   		# Remove any previous copy of the m4 macros
>   		rm -rf ${B}/aclocal-copy/
>   		ACLOCAL="aclocal --system-acdir=${B}/aclocal-copy/"
> @@ -132,6 +135,11 @@ autotools_do_configure() {
>   			acpaths=
>   			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
>   				grep -v 'acinclude.m4' | grep -v 'aclocal-copy' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
> +			        # If no subdirs to configure, we use relative path
> +			        # This is used for supporting long TMPDIR in Yocto
> +			        if [ $sub_cfg == 0 ]; then
> +				        i=`echo $i | sed -e 's#${S}#\.#'`
> +				fi
>   				acpaths="$acpaths -I $i"
>   			done
>   		else
> @@ -161,11 +169,7 @@ autotools_do_configure() {
>   		if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
>   			rm -f aclocal.m4
>   		fi
> -		if [ -e configure.in ]; then
> -			CONFIGURE_AC=configure.in
> -		else
> -			CONFIGURE_AC=configure.ac
> -		fi
> +
>   		if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
>   			if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
>   				: do nothing -- we still have an old unmodified configure.ac
>


