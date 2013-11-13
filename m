Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 543AC6D4FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 13:13:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rADDCvjp016080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Nov 2013 05:12:57 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 05:12:57 -0800
Message-ID: <52837AD8.50502@windriver.com>
Date: Wed, 13 Nov 2013 07:12:56 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
	<1384307965-10290-2-git-send-email-mark.hatle@windriver.com>
	<2313870.fFWNQPWmKH@helios>
In-Reply-To: <2313870.fFWNQPWmKH@helios>
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
X-List-Received-Date: Wed, 13 Nov 2013 13:13:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/13, 4:33 AM, Paul Eggleton wrote:
> Hi Mark,
>
> On Tuesday 12 November 2013 19:59:20 Mark Hatle wrote:
>> In the translate oe to smart function, we only translated package names.
>> However, it's allowed that people can put in a dependency name in the
>> IMAGE_INSTALL.  So on a failure to translate a package name, we fall back
>> and attempt to resolve based on a package's provide.
>>
>> Note: it may be possible to generate an unsolvable install solution.  If the
>> dependency is provided by one or more things that conflict with something
>> else set to be installed.  We can't determine this until smart is run.
>>
>> If this occurs, file a bug and we'll have to identify a way to deal with the
>> RCONFLICTS and RREPLACES.  As a workaround replace the conflict REQUIRES
>> with actual package names.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   meta/classes/package_rpm.bbclass | 79
>> ++++++++++++++++++++++++++++++++++++++-- 1 file changed, 75 insertions(+),
>> 4 deletions(-)
>>
>> diff --git a/meta/classes/package_rpm.bbclass
>> b/meta/classes/package_rpm.bbclass index 31265d9..9fe0e6c 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -166,6 +166,7 @@ translate_oe_to_smart() {
>>   	[ ! -e ${target_rootfs}/install/tmp/fullpkglist.query ] && smart
>> --data-dir=${target_rootfs}/var/lib/smart query --output
>> ${target_rootfs}/install/tmp/fullpkglist.query
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

Just to be clear the following diff is rather confusing.. there are two one line 
changes (the error to the no_found line below) in the existing code, and then 
the new chunk of code after both to process the not_found entries, which are 
presumed to be dependencies.)

If you apply this, or look at it in context it's easier to see..

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
>> +				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$'
>> ${target_rootfs}/install/tmp/fullpkglist.query ; then
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
>> +		smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$pkg
>> --output ${target_rootfs}/install/tmp/provide.query +		grep '^[^@
>> ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed -e
>> 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' >
>> ${target_rootfs}/install/tmp/provide.query.list || : +		prov=`echo
>> $pkgs_to_install | xargs -n 1 echo | grep -f
>> ${target_rootfs}/install/tmp/provide.query.list || :` +		if [ -n "$prov"
> ];
>> then
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
>> +					smart --data-dir=${target_rootfs}/var/lib/smart query
>> --provides=$subst --output ${target_rootfs}/install/tmp/provide.query
>> +					grep '^[^@ ]*@[^@]*$'
> ${target_rootfs}/install/tmp/provide.query |
>> sed -e 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' >
>> ${target_rootfs}/install/tmp/provide.query.list || : +					while [
> -n "$1"
>> ]; do
>> +						arch="$1"
>> +						arch=`echo "$arch" | tr - _`
>> +						shift
>> +						# Select first found, we don't know if one is better then
> another...
>> +						prov=`grep '^[^@ ]*@'$arch'$'
>> ${target_rootfs}/install/tmp/provide.query.list | head -n 1` +						
> if [ -n
>> "$prov" ]; then
>> +							new_pkg=$prov
>> +							break
>> +						fi
>> +					done
>> +					if [ "$pkg" = "$new_pkg" ]; then
>> +						# Failed to translate, package not found!
>>   						echo "$attemptonly: $pkg not found in the $mlib feeds
> ($feeds)." >&2
>>   						if [ "$attemptonly" = "Error" ]; then
>>   							exit 1
>> @@ -210,9 +280,10 @@ translate_oe_to_smart() {
>>   		if [ "$pkg" = "$new_pkg" ]; then
>>   			default_archs_fixed=`echo "$default_archs" | tr - _`
>>   			for arch in $default_archs_fixed ; do
>> -				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$'
>> ${target_rootfs}/install/tmp/fullpkglist.query ; then
>> -					new_pkg="$pkg@$arch"
>> -					# First found is best match
>> +				# Select first found, we don't know if one is better then
> another...
>> +				prov=`grep '^[^@ ]*@'$arch'$'
>> ${target_rootfs}/install/tmp/provide.query.list | head -n 1` +				if
> [ -n
>> "$prov" ]; then
>> +					new_pkg=$prov
>>   					break
>>   				fi
>>   			done
>
> Sigh... this code is getting ridiculously complicated. Shouldn't Smart be
> doing more of the heavy lifting here?

This function translate_oe_to_smart (and the corresponding 
translate_smart_to_oe) are used to switch from one name space to another. 
Remember in the RPM world, we don't use prefixes like "lib32-" on our package 
names, instead we use specific arch's that refer to specific ABI and processor 
tunings.

This is what enables the seamless multilib install on RPM.

What this code does is allows for dependencies to be added to the mix.  If we 
didn't have multilibs then none of this code would be needed, but since we do -- 
the name space of both the package and dependencies need to be translate, not 
just packages as we'd done before.

Generally what this function does:

for each multilib prefx:
    if PN starts w/ a known multilib prefix:
       we translate it to: BPN@arch
       check if the package exists
          if it does add to pkg_list
          else add to "not_found"
anything remaining is translated to the default arch
    check if the package exists
        if it does add to pkg_list
        else add to "not_found"

if there are any "not_found", we assume they must be provides:
    for each multilib prefix:
       if the DEPENDENCY starts w/ a known multilib prefix:
          we translate it without the prefix
          ask smart what provides that dependency
          check if something already in the pkg_list is there, if so skip it
          else use priority ordering to select the best provider -- add to pkg_list
    for anything w/o a multilib prefix, follow the same steps

The reverse smart_to_oe function doesn't ever need to pay attention to 
dependencies so that is not an issue, and the translation is significantly more 
straight forward.

If we had unique namespaces in oe, and didn't use the lib* markers on 
multilibs.. then none of this would be necessary.. (but then of course dpkg and 
opkg wouldn't work properly.)  So the translation is a necessary evil.

Could it be done differently, most likely.  Perhaps identifying a way to do it 
in python would be quicker.. but it's actually pretty fast sine the majority of 
translations happen via a static list and a single grep.  It's only the 
(hopefully) small number of dependencies that happen via individual calls to 
smart which impose a time penalty.

--Mark

> Cheers,
> Paul
>


