Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFC36D7C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 12:31:28 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id h16so340637oag.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 04:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ZgX6tHiL9cNOfIXlYuCqD5k3bSCQRDdi1w2VCf1wR7k=;
	b=D7L2Rcsl7Q3S+dARSW9eaiZC10bIiw+idZcYtLiWsj367awD681vByPpsuEVyM4vKk
	zQXsK3X6FjsV9Epsjag02s+wYuH4td9W57cTuConriY6cW0O8slpPZq5kLu0fvNic6Td
	Ck9ky4XxqDYIpAAfjd9CMPVfCqbARO1hebpO5kABqtC+MmsmdtQNOy5pZtYLtaZ1DcRy
	jIQtN2AjgeQVYTuq2QYMd/Ay0LcRKxQ4fvN8AkMRhsl0n8bTh64KRP9kCdglwJI09nHC
	dSLJc8zZ051gTMb3ed04LOtg+5jOhtKnSOVldZpIekFWOB3KeUEuoRbixWpsMK827Za+
	riAw==
MIME-Version: 1.0
X-Received: by 10.60.134.42 with SMTP id ph10mr1834747oeb.76.1384345889499;
	Wed, 13 Nov 2013 04:31:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 13 Nov 2013 04:31:29 -0800 (PST)
In-Reply-To: <2313870.fFWNQPWmKH@helios>
References: <cover.1384305535.git.mark.hatle@windriver.com>
	<1384307965-10290-2-git-send-email-mark.hatle@windriver.com>
	<2313870.fFWNQPWmKH@helios>
Date: Wed, 13 Nov 2013 10:31:29 -0200
X-Google-Sender-Auth: HN4KSZqIRJxoUlOwTkrkhTdZo0U
Message-ID: <CAP9ODKrMsuFsVM9HZ+2A5Y0jnLm2+k2FJ+FUX3q-HkL3FCNeCA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 13 Nov 2013 12:31:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 13, 2013 at 8:33 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
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
>>  meta/classes/package_rpm.bbclass | 79
>> ++++++++++++++++++++++++++++++++++++++-- 1 file changed, 75 insertions(+),
>> 4 deletions(-)
>>
>> diff --git a/meta/classes/package_rpm.bbclass
>> b/meta/classes/package_rpm.bbclass index 31265d9..9fe0e6c 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -166,6 +166,7 @@ translate_oe_to_smart() {
>>       [ ! -e ${target_rootfs}/install/tmp/fullpkglist.query ] && smart
>> --data-dir=${target_rootfs}/var/lib/smart query --output
>> ${target_rootfs}/install/tmp/fullpkglist.query
>>
>>       pkgs_to_install=""
>> +     not_found=""
>>       for pkg in "$@" ; do
>>               new_pkg="$pkg"
>>               if [ -z "$sdk_mode" ]; then
>> @@ -184,7 +185,6 @@ translate_oe_to_smart() {
>>                               fi
>>                               subst=${pkg#${mlib}-}
>>                               if [ "$subst" != "$pkg" ]; then
>> -                                     feeds=$@
>>                                       while [ -n "$1" ]; do
>>                                               arch="$1"
>>                                               arch=`echo "$arch" | tr - _`
>> @@ -197,6 +197,76 @@ translate_oe_to_smart() {
>>                                       done
>>                                       if [ "$pkg" = "$new_pkg" ]; then
>>                                               # Failed to translate, package not found!
>> +                                             not_found="$not_found $pkg"
>> +                                             continue
>> +                                     fi
>> +                             fi
>> +                     done
>> +             fi
>> +             # Apparently not a multilib package...
>> +             if [ "$pkg" = "$new_pkg" ]; then
>> +                     default_archs_fixed=`echo "$default_archs" | tr - _`
>> +                     for arch in $default_archs_fixed ; do
>> +                             if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$'
>> ${target_rootfs}/install/tmp/fullpkglist.query ; then
>> +                                     new_pkg="$pkg@$arch"
>> +                                     # First found is best match
>> +                                     break
>> +                             fi
>> +                     done
>> +                     if [ "$pkg" = "$new_pkg" ]; then
>> +                             # Failed to translate, package not found!
>> +                             not_found="$not_found $pkg"
>> +                             continue
>> +                     fi
>> +             fi
>> +             #echo "$pkg -> $new_pkg" >&2
>> +             pkgs_to_install="${pkgs_to_install} ${new_pkg}"
>> +     done
>> +
>> +     # Parse the not_found items and see if they were dependencies (RPROVIDES)
>> +     # Follow the parsing example above...
>> +     for pkg in $not_found ; do
>> +             new_pkg="$pkg"
>> +             smart --data-dir=${target_rootfs}/var/lib/smart query --provides=$pkg
>> --output ${target_rootfs}/install/tmp/provide.query +         grep '^[^@
>> ]*@[^@]*$' ${target_rootfs}/install/tmp/provide.query | sed -e
>> 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' >
>> ${target_rootfs}/install/tmp/provide.query.list || : +                prov=`echo
>> $pkgs_to_install | xargs -n 1 echo | grep -f
>> ${target_rootfs}/install/tmp/provide.query.list || :` +               if [ -n "$prov"
> ];
>> then
>> +                     # Nothing to do, already in the list
>> +                     #echo "Skipping $pkg -> $prov, already in install set" >&2
>> +                     continue
>> +             fi
>> +             if [ -z "$sdk_mode" ]; then
>> +                     for i in ${MULTILIB_PREFIX_LIST} ; do
>> +                             old_IFS="$IFS"
>> +                             IFS=":"
>> +                             set $i
>> +                             IFS="$old_IFS"
>> +                             mlib="$1"
>> +                             shift
>> +                             if [ "$mlib" = "default" ]; then
>> +                                     if [ -z "$default_archs" ]; then
>> +                                             default_archs=$@
>> +                                     fi
>> +                                     continue
>> +                             fi
>> +                             subst=${pkg#${mlib}-}
>> +                             if [ "$subst" != "$pkg" ]; then
>> +                                     feeds=$@
>> +                                     smart --data-dir=${target_rootfs}/var/lib/smart query
>> --provides=$subst --output ${target_rootfs}/install/tmp/provide.query
>> +                                     grep '^[^@ ]*@[^@]*$'
> ${target_rootfs}/install/tmp/provide.query |
>> sed -e 's,\(.*\)-[^-]*-[^-]*\(@[^@]*\)$,\1\2,' >
>> ${target_rootfs}/install/tmp/provide.query.list || : +                                        while [
> -n "$1"
>> ]; do
>> +                                             arch="$1"
>> +                                             arch=`echo "$arch" | tr - _`
>> +                                             shift
>> +                                             # Select first found, we don't know if one is better then
> another...
>> +                                             prov=`grep '^[^@ ]*@'$arch'$'
>> ${target_rootfs}/install/tmp/provide.query.list | head -n 1` +
> if [ -n
>> "$prov" ]; then
>> +                                                     new_pkg=$prov
>> +                                                     break
>> +                                             fi
>> +                                     done
>> +                                     if [ "$pkg" = "$new_pkg" ]; then
>> +                                             # Failed to translate, package not found!
>>                                               echo "$attemptonly: $pkg not found in the $mlib feeds
> ($feeds)." >&2
>>                                               if [ "$attemptonly" = "Error" ]; then
>>                                                       exit 1
>> @@ -210,9 +280,10 @@ translate_oe_to_smart() {
>>               if [ "$pkg" = "$new_pkg" ]; then
>>                       default_archs_fixed=`echo "$default_archs" | tr - _`
>>                       for arch in $default_archs_fixed ; do
>> -                             if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$'
>> ${target_rootfs}/install/tmp/fullpkglist.query ; then
>> -                                     new_pkg="$pkg@$arch"
>> -                                     # First found is best match
>> +                             # Select first found, we don't know if one is better then
> another...
>> +                             prov=`grep '^[^@ ]*@'$arch'$'
>> ${target_rootfs}/install/tmp/provide.query.list | head -n 1` +                                if
> [ -n
>> "$prov" ]; then
>> +                                     new_pkg=$prov
>>                                       break
>>                               fi
>>                       done
>
> Sigh... this code is getting ridiculously complicated. Shouldn't Smart be
> doing more of the heavy lifting here?

Agreed; this seems OE is doing too much.

Another think which bothers me is it being RPM specific ... :-(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

