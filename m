Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TYXfA-0006kT-Ck
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 08:45:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAE7Ux7E025020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Nov 2012 23:30:59 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 13 Nov 2012 23:30:58 -0800
Message-ID: <50A348B0.7070500@windriver.com>
Date: Wed, 14 Nov 2012 15:30:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1352714690.git.Qi.Chen@windriver.com>
	<6a877019d44db98a110eafd29d66010ac22fae5a.1352714690.git.Qi.Chen@windriver.com>
	<50A2D460.8070207@linux.intel.com>
In-Reply-To: <50A2D460.8070207@linux.intel.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] initscripts: improve the way initscripts handle volatile storage
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
X-List-Received-Date: Wed, 14 Nov 2012 07:45:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2012 07:14 AM, Saul Wold wrote:
> On 11/12/2012 03:33 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Change the way how populate_volatile.sh handles link-type config
>> items. Previously, if a link-type config item is encountered, the
>> script does not handle it correctly. If the target exists as a link,
>> the config item is skipped no matter where the target actually points.
>> If the target exists as a file or a directory, it does nothing.
>> This behavious is sometimes confusing; for example, if /run has been
>> created by other recipes, it will not be updated to a symlink as the
>> config file states.
>>
>> This patch makes populate_volatile.sh do things as the config file
>> tells it. As for link-type config items, it creates them properly
>> with an effort to avoid data loss.
>>
>> Besides, it's not appropriate to divide volatile storage handling
>> into two files. Operations for /tmp directory in bootmisc.sh should
>> also be done by populate_volatile.sh.
>>
>> [YOCTO #3404]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../initscripts/initscripts-1.0/bootmisc.sh        |    7 -----
>>   .../initscripts-1.0/populate-volatile.sh           |   28 
>> +++++++++-----------
>>   .../initscripts/initscripts-1.0/volatiles          |    1 +
>>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>>   4 files changed, 15 insertions(+), 23 deletions(-)
>>
>> diff --git 
>> a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh 
>> b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
>> index 4f76cb4..80f7ead 100755
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
>> @@ -54,13 +54,6 @@ fi
>>
>>   #
>>   # This is as good a place as any for a sanity check
>> -# /tmp should be a symlink to /var/tmp to cut down on the number
>> -# of mounted ramdisks.
>> -if test ! -L /tmp && test -d /var/tmp
>> -then
>> -    rm -rf /tmp
>> -    ln -sf /var/tmp /tmp
>> -fi
>>
>>   # Set the system clock from hardware clock
>>   # If the timestamp is more recent than the current time,
>> diff --git 
>> a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh 
>> b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> index d2175d7..baee2ef 100755
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> @@ -47,15 +47,16 @@ mk_dir() {
>>   }
>>
>>   link_file() {
>> -    EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 
>> 2>&1"
>> -
>> -    test "$VOLATILE_ENABLE_CACHE" = yes && echo "    $EXEC" >> 
>> /etc/volatile.cache.build
>> -
>> -    [ -e "$2" ] && {
>> -      echo "Cannot create link over existing -${TNAME}-." >&2
>> -    } || {
>> -      eval $EXEC &
>> -    }
>> +    EXEC="
>> +    if [ -L \"$2\" ]; then
>> +        rm -f \"$2\";
>> +    elif [ -d \"$2\" ]; then
>> +        cp -rf \"$2/*\" \"$1\";
>> +        rm -rf \"$2\";
>> +    fi;
>> +    ln -sf \"$1\" \"$2\" "
>> +        test "$VOLATILE_ENABLE_CACHE" = yes && echo "   $EXEC" >> 
>> /etc/volatile.
> I wonder if we should be testing /etc for writablity here first?  We 
> need to make sure we respect the possibility that the root filesystem 
> with read-only.
>
> Sau!
>
>> +        eval $EXEC &
>>   }
>>
>>   check_requirements() {
>> @@ -119,20 +120,17 @@ apply_cfgfile() {
>>       return 1
>>       }
>>
>> -  cat ${CFGFILE} | grep -v "^#" | \
>> +  cat ${CFGFILE} | grep -v "^#" | sed -e '/^$/ d' | \
>>     while read LINE; do
>>
>>       eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ 
>> \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 
>> TLTARGET=\6/p"`
>>
>>       [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
>>
>> -
>>       [ "${TTYPE}" = "l" ] && {
>>         TSOURCE="$TLTARGET"
>> -      [ -L "${TNAME}" ] || {
>> -        [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- 
>> pointing to -${TSOURCE}-."
>> -        link_file "${TSOURCE}" "${TNAME}" &
>> -        }
>> +      [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- 
>> pointing to -${TSOURCE}-."
>> +      link_file "${TSOURCE}" "${TNAME}" &
>>         continue
>>         }
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles 
>> b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> index e0741aa..f7e2ef7 100644
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> @@ -31,6 +31,7 @@ l root root 1777 /var/lock /var/volatile/lock
>>   l root root 0755 /var/log /var/volatile/log
>>   l root root 0755 /var/run /var/volatile/run
>>   l root root 1777 /var/tmp /var/volatile/tmp
>> +l root root 1777 /tmp /var/tmp
>>   d root root 0755 /var/lock/subsys none
>>   f root root 0664 /var/log/wtmp none
>>   f root root 0664 /var/run/utmp none
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb 
>> b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> index d25838b..251dd06 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system 
>> startup initialization scrip
>>   SECTION = "base"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> -PR = "r137"
>> +PR = "r138"
>>
>>   INHIBIT_DEFAULT_DEPS = "1"
>>
>>
>
Hi Saul:

After looking at bug#3406 and bug#3407, I realize that it is much more 
complex than I thought to make this script work on a read-only rootfs. 
After all, if the rootfs is read-only, we cannot delete things like 
/tmp, /var/run and so on.

Besides, as I mentioned in the last email, there are some other 
initscripts that assume rootfs to be writable. So as far as I can see, 
support for read-only rootfs would not be trivial.

Cheers,
Chen Qi


