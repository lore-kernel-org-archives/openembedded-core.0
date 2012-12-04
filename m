Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfiuK-0000F2-Vc
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 04:10:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB42uUXb014744
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2012 18:56:30 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 3 Dec 2012 18:56:29 -0800
Message-ID: <50BD667C.6040005@windriver.com>
Date: Tue, 4 Dec 2012 10:57:00 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: <Qi.Chen@windriver.com>
References: <cover.1354084523.git.Qi.Chen@windriver.com>
	<22684c7fc852e5c43d241e760fe8e1af7095f9ff.1354084523.git.Qi.Chen@windriver.com>
In-Reply-To: <22684c7fc852e5c43d241e760fe8e1af7095f9ff.1354084523.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] autotools.bbclass: use relative path for acpaths whenever possible
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
X-List-Received-Date: Tue, 04 Dec 2012 03:10:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I saw that this series of patches have been merged except this one.
Is there any problem with this patch?

The thing is, if we don't fix autotool.bbclass like this, building 
coreutils will fail with a long TMPDIR (bug#2766). I tried to build 
coretuils with TMPDIR of 200 char length, it failed.

Thanks,
Chen Qi

On 11/30/2012 11:08 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi<Qi.Chen@windriver.com>
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
> [YOCTO #2766]
>
> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> ---
>   meta/classes/autotools.bbclass |   14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index ca981ec..ce2d264 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -138,8 +138,11 @@ autotools_do_configure() {
>   		rm -f `dirname $ac`/configure
>   		done )
>   	if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
> +               [ -e configure.in ]&&  CONFIGURE_AC=configure.in || CONFIGURE_AC=configure.ac
>   		olddir=`pwd`
>   		cd ${S}
> +		# Determine whether there's subdirs to configure
> +		grep -q -m 1 AC_CONFIG_SUBDIRS $CONFIGURE_AC&&  sub_cfg=1 || sub_cfg=0
>   		# Remove any previous copy of the m4 macros
>   		rm -rf ${B}/aclocal-copy/
>   		ACLOCAL="aclocal --system-acdir=${B}/aclocal-copy/"
> @@ -147,6 +150,11 @@ autotools_do_configure() {
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
> @@ -176,11 +184,7 @@ autotools_do_configure() {
>   		if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
>   			rm -f aclocal.m4
>   		fi
> -		if [ -e configure.in ]; then
> -			CONFIGURE_AC=configure.in
> -		else
> -			CONFIGURE_AC=configure.ac
> -		fi
> +
>   		if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC>/dev/null; then
>   			if grep "sed.*POTFILES" $CONFIGURE_AC>/dev/null; then
>   				: do nothing -- we still have an old unmodified configure.ac



