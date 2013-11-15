Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 762136D72F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 14:02:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAFE2sGh013167; Fri, 15 Nov 2013 14:02:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id igc-O_PfJeMu; Fri, 15 Nov 2013 14:02:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAFE2oYa013152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 15 Nov 2013 14:02:51 GMT
Message-ID: <1384524166.6460.160.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 15 Nov 2013 14:02:46 +0000
In-Reply-To: <1384307965-10290-2-git-send-email-mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
	<1384307965-10290-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6 v2] package_rpm: Allow translation of requirement to package name
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
X-List-Received-Date: Fri, 15 Nov 2013 14:02:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 19:59 -0600, Mark Hatle wrote:
> In the translate oe to smart function, we only translated package names.
> However, it's allowed that people can put in a dependency name in the
> IMAGE_INSTALL.

For what its worth, I find this description hard to understand, I think
as you leave the keyword "provide" right until the end. A mention of
RPROVIDES earlier here would help a lot.

>   So on a failure to translate a package name, we fall back
> and attempt to resolve based on a package's provide.
> 
> Note: it may be possible to generate an unsolvable install solution.  If the
> dependency is provided by one or more things that conflict with something else
> set to be installed.  We can't determine this until smart is run.
> 
> If this occurs, file a bug and we'll have to identify a way to deal with the
> RCONFLICTS and RREPLACES.  As a workaround replace the conflict REQUIRES with
> actual package names.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass | 79 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 75 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 31265d9..9fe0e6c 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -166,6 +166,7 @@ translate_oe_to_smart() {
>  	[ ! -e ${target_rootfs}/install/tmp/fullpkglist.query ] && smart --data-dir=${target_rootfs}/var/lib/smart query --output ${target_rootfs}/install/tmp/fullpkglist.query
>  
>  	pkgs_to_install=""
> +	not_found=""
>  	for pkg in "$@" ; do
>  		new_pkg="$pkg"
>  		if [ -z "$sdk_mode" ]; then
> @@ -184,7 +185,6 @@ translate_oe_to_smart() {
>  				fi
>  				subst=${pkg#${mlib}-}
>  				if [ "$subst" != "$pkg" ]; then
> -					feeds=$@
>  					while [ -n "$1" ]; do
>  						arch="$1"
>  						arch=`echo "$arch" | tr - _`
> @@ -197,6 +197,76 @@ translate_oe_to_smart() {
>  					done
>  					if [ "$pkg" = "$new_pkg" ]; then
>  						# Failed to translate, package not found!
> +						not_found="$not_found $pkg"
> +						continue
> +					fi
> +				fi
> +			done
> +		fi
> +		# Apparently not a multilib package...
> +		if [ "$pkg" = "$new_pkg" ]; then
> +			default_archs_fixed=`echo "$default_archs" | tr - _`
> +			for arch in $default_archs_fixed ; do
> +				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
> +					new_pkg="$pkg@$arch"
> +					# First found is best match
> +					break
> +				fi
> +			done
> +			if [ "$pkg" = "$new_pkg" ]; then
> +				# Failed to translate, package not found!
> +				not_found="$not_found $pkg"
> +				continue
> +			fi
> +		fi
> +		#echo "$pkg -> $new_pkg" >&2
> +		pkgs_to_install="${pkgs_to_install} ${new_pkg}"
> +	done
> +
> +	# Parse the not_found items and see if they were dependencies (RPROVIDES)
> +	# Follow the parsing example above...
> +	for pkg in $not_found ; do
> +		new_pkg="$pkg"
> +		smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$pkg --output ${target_rootfs}/install/tmp/provide.query
> +		grep '^[^@ ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed -e 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' > ${target_rootfs}/install/tmp/provide.query.list || :
> +		prov=`echo $pkgs_to_install | xargs -n 1 echo | grep -f ${target_rootfs}/install/tmp/provide.query.list || :`
> +		if [ -n "$prov" ]; then
> +			# Nothing to do, already in the list
> +			#echo "Skipping $pkg -> $prov, already in install set" >&2
> +			continue
> +		fi
> +		if [ -z "$sdk_mode" ]; then
> +			for i in ${MULTILIB_PREFIX_LIST} ; do
> +				old_IFS="$IFS"
> +				IFS=":"
> +				set $i
> +				IFS="$old_IFS"
> +				mlib="$1"
> +				shift
> +				if [ "$mlib" = "default" ]; then
> +					if [ -z "$default_archs" ]; then
> +						default_archs=$@
> +					fi
> +					continue
> +				fi
> +				subst=${pkg#${mlib}-}
> +				if [ "$subst" != "$pkg" ]; then
> +					feeds=$@
> +					smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$subst --output ${target_rootfs}/install/tmp/provide.query
> +					grep '^[^@ ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed -e 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' > ${target_rootfs}/install/tmp/provide.query.list || :
> +					while [ -n "$1" ]; do
> +						arch="$1"
> +						arch=`echo "$arch" | tr - _`
> +						shift
> +						# Select first found, we don't know if one is better then another...
> +						prov=`grep '^[^@ ]*@'$arch'$' ${target_rootfs}/install/tmp/provide.query.list | head -n 1`
> +						if [ -n "$prov" ]; then
> +							new_pkg=$prov
> +							break
> +						fi
> +					done
> +					if [ "$pkg" = "$new_pkg" ]; then
> +						# Failed to translate, package not found!
>  						echo "$attemptonly: $pkg not found in the $mlib feeds ($feeds)." >&2
>  						if [ "$attemptonly" = "Error" ]; then
>  							exit 1
> @@ -210,9 +280,10 @@ translate_oe_to_smart() {
>  		if [ "$pkg" = "$new_pkg" ]; then
>  			default_archs_fixed=`echo "$default_archs" | tr - _`
>  			for arch in $default_archs_fixed ; do
> -				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
> -					new_pkg="$pkg@$arch"
> -					# First found is best match
> +				# Select first found, we don't know if one is better then another...
> +				prov=`grep '^[^@ ]*@'$arch'$' ${target_rootfs}/install/tmp/provide.query.list | head -n 1`
> +				if [ -n "$prov" ]; then
> +					new_pkg=$prov
>  					break
>  				fi
>  			done

This 'shell calling rpm commands' code with all the mangling is near
impossible to read/understand. This patch just makes the mess more
complicated and harder to follow.

What is the plan for turning this into something better?

My instinct says more functions and a language better at data
manipulation (python instead of shell) might start to resolve this.

One of the reasons for using smart was that we could probably enhance it
to better suit our needs. Can we consider that too?

I really don't want to see more patches like this one piling on top of
already crumbling foundations.

Cheers,

Richard


