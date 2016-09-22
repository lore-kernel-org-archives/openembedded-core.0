Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 838586FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 08:19:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8M8JF6f016674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Sep 2016 01:19:16 -0700 (PDT)
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 22 Sep 2016 01:19:14 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1474167109-6666-1-git-send-email-zhe.he@windriver.com>
	<7a584ad0d258491383c4ea32d530c3be@XBOX02.axis.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <1617c19f-0bed-20b4-dc08-0331f66d3f3f@windriver.com>
Date: Thu, 22 Sep 2016 16:18:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <7a584ad0d258491383c4ea32d530c3be@XBOX02.axis.com>
X-Originating-IP: [128.224.162.234]
Subject: Re: [PATCH] bash2dash conversion
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
X-List-Received-Date: Thu, 22 Sep 2016 08:19:26 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 09/19/2016 07:57 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> zhe.he@windriver.com
>> Sent: den 18 september 2016 04:52
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] bash2dash conversion
>                              ^^^^^^^^^
> Typically this is referred to as "Remove bashisms"...

Yes.

>
>> From: "Tim K. Chan" <nirvanatk@gmail.com>
>>
>> Change bash style to dash style
>>
>> Signed-off-by: Tim K. Chan <nirvanatk@gmail.com>
>> [Adjust context]
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta/classes/systemd.bbclass                            |  4 ++--
>>  meta/classes/update-rc.d.bbclass                        |  6 +++---
>>  meta/classes/useradd_base.bbclass                       |  4 ++--
>>  meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb |  2 +-
>>  meta/recipes-core/glibc/glibc-package.inc               |  2 +-
>>  meta/recipes-devtools/guile/guile_2.0.12.bb             |  6 ++++--
>>  meta/recipes-devtools/rpm/rpm_5.4.16.bb                 | 13 +++++++++++--
>>  7 files changed, 24 insertions(+), 13 deletions(-)
> [cut]
>
>> diff --git a/meta/classes/useradd_base.bbclass
>> b/meta/classes/useradd_base.bbclass
>> index f4dc713..35d5f06 100644
>> --- a/meta/classes/useradd_base.bbclass
>> +++ b/meta/classes/useradd_base.bbclass
>> @@ -59,10 +59,10 @@ perform_groupmems () {
>>  		gshadow="no"
>>  		touch $rootdir${sysconfdir}/gshadow
>>  	fi
>> -	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*"$rootdir/etc/group || true`"
>> +	local mem_exists="`grep "^$groupname:[!:]*:[!:]*:\([!,]*,\)*$username\(,[!,]*\)*"$rootdir/etc/group || true`"
>>  	if test "x$mem_exists" = "x"; then
>>  		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
>> -		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*"$rootdir/etc/group || true`"
>> ++		mem_exists="`grep "^$groupname:[!:]*:[!:]*:\([!,]*,\)*$username\(,[!,]*\)*"$rootdir/etc/group || true`"
>>  		if test "x$mem_exists" = "x"; then
>>  			bbfatal "${PN}: groupmems command did not succeed."
>>  		fi
> The above change cannot be correct. Changing the expression "[^:]" 
> (which means "anything but :") to "[!:]" (which means "! or :") is 
> definitely not the same....

Thanks for careful review. I really missed correcting thisfalse-positive report.

>> diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb
>> b/meta/recipes-devtools/guile/guile_2.0.12.bb
>> index d2fe511..3ada0f1 100644
>> --- a/meta/recipes-devtools/guile/guile_2.0.12.bb
>> +++ b/meta/recipes-devtools/guile/guile_2.0.12.bb
>> @@ -91,8 +91,10 @@ guile_cross_config() {	
>>  	then
>>  	        # Create guile-config returning target values instead of native values
>>  	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
>> -        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
>> -			> ${B}/guile-config.cross
>> +		echo -n '#!' > ${B}/guile-config.cross
>> +		echo -n `which x86_64-linux-guile` >> ${B}/guile-config.cross
>> +		printf ' \\\n--no-auto-compile -e main -s\n!#\n(define %%guile-build-info ' >> ${B}/guile-config.cross
>> +		echo "'(" >> ${B}/guile-config.cross
>>  	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
>>  			-e 's:",[ \t]*": . ":' \
>>  			-e 's:" *}, *\\:"):' \
> I suggest to replace the entire guile_cross_config() function with this:
>
> guile_cross_config() {
> 	# this is only for target recipe
> 	[ "${PN}" = "${BPN}" ] || return 0
>
> 	vars=$(sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
> 	              -e 's:",[ \t]*": . ":' \
> 	              -e 's:" *}, *\\:"):' \
> 	              -e 's:^.*cachedir.*$::' \
> 	              -e '/^  (/p' \
> 	       < ${B}/libguile/libpath.h)
>
> 	# Create guile-config returning target values instead of native values
> 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> 	cat <<EOF >${B}/guile-config.cross
> #!$(which ${BUILD_SYS}-guile) \\
> --no-auto-compile -e main -s
> !#
> (define %guile-build-info '(
> $vars
> ))
> EOF
> 	cat ${B}/meta/guile-config >> ${B}/guile-config.cross
> 	install ${B}/guile-config.cross ${SYSROOT_DESTDIR}${bindir_crossscripts}/guile-config
> }
>
> That should make it a lot simpler to see what is going on.
> Please note that I have corrected the installation path as well.

Definitely simpler and clearer. I'll test and send v2.

Thanks,
Zhe

> //Peter
>
>


