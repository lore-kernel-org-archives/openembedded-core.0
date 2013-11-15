Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC2E86CF3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:15:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAFHFqgt027716
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Nov 2013 09:15:53 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 15 Nov 2013 09:15:52 -0800
Message-ID: <528656C7.9060301@windriver.com>
Date: Fri, 15 Nov 2013 11:15:51 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1384305535.git.mark.hatle@windriver.com>	
	<1384307965-10290-2-git-send-email-mark.hatle@windriver.com>
	<1384524166.6460.160.camel@ted>
In-Reply-To: <1384524166.6460.160.camel@ted>
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
X-List-Received-Date: Fri, 15 Nov 2013 17:15:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/13, 8:02 AM, Richard Purdie wrote:
> On Tue, 2013-11-12 at 19:59 -0600, Mark Hatle wrote:
>> In the translate oe to smart function, we only translated package names.
>> However, it's allowed that people can put in a dependency name in the
>> IMAGE_INSTALL.
>
> For what its worth, I find this description hard to understand, I think
> as you leave the keyword "provide" right until the end. A mention of
> RPROVIDES earlier here would help a lot.

Ok.

>>    So on a failure to translate a package name, we fall back
>> and attempt to resolve based on a package's provide.
>>
>> Note: it may be possible to generate an unsolvable install solution.  If the
>> dependency is provided by one or more things that conflict with something else
>> set to be installed.  We can't determine this until smart is run.
>>
>> If this occurs, file a bug and we'll have to identify a way to deal with the
>> RCONFLICTS and RREPLACES.  As a workaround replace the conflict REQUIRES with
>> actual package names.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/package_rpm.bbclass | 79 ++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 75 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>> index 31265d9..9fe0e6c 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -166,6 +166,7 @@ translate_oe_to_smart() {
>>   	[ ! -e ${target_rootfs}/install/tmp/fullpkglist.query ] && smart --data-dir=${target_rootfs}/var/lib/smart query --output ${target_rootfs}/install/tmp/fullpkglist.query
>>
>>   	pkgs_to_install=""
>> +	not_found=""
>>   	for pkg in "$@" ; do
>>   		new_pkg="$pkg"
>>   		if [ -z "$sdk_mode" ]; then
>> @@ -184,7 +185,6 @@ translate_oe_to_smart() {
>>   				fi
>>   				subst=${pkg#${mlib}-}
>>   				if [ "$subst" != "$pkg" ]; then
>> -					feeds=$@
>>   					while [ -n "$1" ]; do
>>   						arch="$1"
>>   						arch=`echo "$arch" | tr - _`
>> @@ -197,6 +197,76 @@ translate_oe_to_smart() {
>>   					done
>>   					if [ "$pkg" = "$new_pkg" ]; then
>>   						# Failed to translate, package not found!
>> +						not_found="$not_found $pkg"
>> +						continue
>> +					fi
>> +				fi
>> +			done
>> +		fi
>> +		# Apparently not a multilib package...
>> +		if [ "$pkg" = "$new_pkg" ]; then
>> +			default_archs_fixed=`echo "$default_archs" | tr - _`
>> +			for arch in $default_archs_fixed ; do
>> +				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
>> +					new_pkg="$pkg@$arch"
>> +					# First found is best match
>> +					break
>> +				fi
>> +			done
>> +			if [ "$pkg" = "$new_pkg" ]; then
>> +				# Failed to translate, package not found!
>> +				not_found="$not_found $pkg"
>> +				continue
>> +			fi
>> +		fi
>> +		#echo "$pkg -> $new_pkg" >&2
>> +		pkgs_to_install="${pkgs_to_install} ${new_pkg}"
>> +	done
>> +
>> +	# Parse the not_found items and see if they were dependencies (RPROVIDES)
>> +	# Follow the parsing example above...
>> +	for pkg in $not_found ; do
>> +		new_pkg="$pkg"
>> +		smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$pkg --output ${target_rootfs}/install/tmp/provide.query
>> +		grep '^[^@ ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed -e 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' > ${target_rootfs}/install/tmp/provide.query.list || :
>> +		prov=`echo $pkgs_to_install | xargs -n 1 echo | grep -f ${target_rootfs}/install/tmp/provide.query.list || :`
>> +		if [ -n "$prov" ]; then
>> +			# Nothing to do, already in the list
>> +			#echo "Skipping $pkg -> $prov, already in install set" >&2
>> +			continue
>> +		fi
>> +		if [ -z "$sdk_mode" ]; then
>> +			for i in ${MULTILIB_PREFIX_LIST} ; do
>> +				old_IFS="$IFS"
>> +				IFS=":"
>> +				set $i
>> +				IFS="$old_IFS"
>> +				mlib="$1"
>> +				shift
>> +				if [ "$mlib" = "default" ]; then
>> +					if [ -z "$default_archs" ]; then
>> +						default_archs=$@
>> +					fi
>> +					continue
>> +				fi
>> +				subst=${pkg#${mlib}-}
>> +				if [ "$subst" != "$pkg" ]; then
>> +					feeds=$@
>> +					smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$subst --output ${target_rootfs}/install/tmp/provide.query
>> +					grep '^[^@ ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed -e 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' > ${target_rootfs}/install/tmp/provide.query.list || :
>> +					while [ -n "$1" ]; do
>> +						arch="$1"
>> +						arch=`echo "$arch" | tr - _`
>> +						shift
>> +						# Select first found, we don't know if one is better then another...
>> +						prov=`grep '^[^@ ]*@'$arch'$' ${target_rootfs}/install/tmp/provide.query.list | head -n 1`
>> +						if [ -n "$prov" ]; then
>> +							new_pkg=$prov
>> +							break
>> +						fi
>> +					done
>> +					if [ "$pkg" = "$new_pkg" ]; then
>> +						# Failed to translate, package not found!
>>   						echo "$attemptonly: $pkg not found in the $mlib feeds ($feeds)." >&2
>>   						if [ "$attemptonly" = "Error" ]; then
>>   							exit 1
>> @@ -210,9 +280,10 @@ translate_oe_to_smart() {
>>   		if [ "$pkg" = "$new_pkg" ]; then
>>   			default_archs_fixed=`echo "$default_archs" | tr - _`
>>   			for arch in $default_archs_fixed ; do
>> -				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
>> -					new_pkg="$pkg@$arch"
>> -					# First found is best match
>> +				# Select first found, we don't know if one is better then another...
>> +				prov=`grep '^[^@ ]*@'$arch'$' ${target_rootfs}/install/tmp/provide.query.list | head -n 1`
>> +				if [ -n "$prov" ]; then
>> +					new_pkg=$prov
>>   					break
>>   				fi
>>   			done
>
> This 'shell calling rpm commands' code with all the mangling is near
> impossible to read/understand. This patch just makes the mess more
> complicated and harder to follow.

The root of this is the namespace issue.  In RPM, the architecture (and arch 
compatibility), as well as file contents all provide the namespace and conflict 
resolution.  While in opkg/deb the name of the package itself is where the 
namespace is defined.  (i.e. lib32-...)

The translation is necessary due to this multilib support, otherwise we wouldn't 
need to do any of it.  Somehow we have to translate one namespace to another -- 
and since the translation can't occur until the packages are built, it'd be 
difficult to do it 'earlier'.

> What is the plan for turning this into something better?
>
> My instinct says more functions and a language better at data
> manipulation (python instead of shell) might start to resolve this.
>
> One of the reasons for using smart was that we could probably enhance it
> to better suit our needs. Can we consider that too?

The only thing we can do is build a python (or similar) app that takes the 
inputs of the translation 'namespace' IDs and the corresponding architectures, 
and RPM feed.  Then translate from one to the other.  My biggest concern with 
this translation is to cover all of the corner cases we could start getting more 
and more complex.

> I really don't want to see more patches like this one piling on top of
> already crumbling foundations.

Easiest way to avoid this is to make dependencies in the IMAGE/PACKAGE_INSTALL 
forbidden and do the translation at a higher level generically.  But frankly I 
don't see that happening -- so the solution becomes RPM specific and we end up 
with code like this.  I'm not sure if we can move this code into a python 
function -- or if we need to simply create an external translation program...

As far as plans, frankly I don't have any plans to focus on this work for the 
time being.  There are too many other things I need to get working properly 
first.  If someone else wants to step in and work on a solution, I'm more then 
happy to help them out.

--Mark

> Cheers,
>
> Richard
>


