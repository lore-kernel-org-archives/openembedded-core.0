Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB2716AB81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 06:21:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S6Ldjo009720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2013 23:21:39 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 27 Jun 2013 23:21:39 -0700
Message-ID: <51CD2B86.3050906@windriver.com>
Date: Fri, 28 Jun 2013 14:21:58 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1372389991.git.Qi.Chen@windriver.com>
	<a09510a0b0b388029c673ff1725a09e6ae99856d.1372389991.git.Qi.Chen@windriver.com>
	<51CD265C.7070106@linux.intel.com>
In-Reply-To: <51CD265C.7070106@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] udev-cache: take a read-only rootfs into consideration
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
X-List-Received-Date: Fri, 28 Jun 2013 06:21:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2013 01:59 PM, Saul Wold wrote:
> On 06/27/2013 10:00 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> In case of a read-only rootfs, no matter the /etc is read-only or
>> it's bind mounted with tmpfs, the udev cache handling should be
>> skipped, as the data cannot be persisted between reboots.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/udev/udev/init       |    5 +++--
>>   meta/recipes-core/udev/udev/udev-cache |    6 ++++++
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/udev/udev/init 
>> b/meta/recipes-core/udev/udev/init
>> index 9b81700..38ea666 100644
>> --- a/meta/recipes-core/udev/udev/init
>> +++ b/meta/recipes-core/udev/udev/init
>> @@ -18,6 +18,7 @@ export TZ=/etc/localtime
>>   [ -x @UDEVD@ ] || exit 1
>>   [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
>>   [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
>> +[ -f /etc/default/rcS ] && . /etc/default/rcS
>>
>>   readfile () {
>>      filename=$1
>> @@ -52,8 +53,8 @@ case "$1" in
>>       mount -a -t tmpfs 2>/dev/null
>>       mkdir -p /var/volatile/tmp
>>
>> -    # cache handling
>> -    if [ "$DEVCACHE" != "" ]; then
>> +    # Cache handling. Skip cache handling in case of a read-only 
>> rootfs.
>> +    if [ "$ROOTFS_READ_ONLY" = "no" -a "$DEVCACHE" != "" ]; then
>>               readfile /proc/version
>>               VERSION="$READDATA"
>>               readfile /proc/cmdline
> Do you think it would be possible in a fix embedded device to have the 
> udev cache created and installed in a read-only FS?
>
> Sau!
>
Thanks for pointing it out.
Yes, you're right.
No matter how the cache is installed, if the $DEVCACHE file exists and 
the $READDATA matches, we could use the cache.
I'll send out a V2.

//Chen Qi

>> diff --git a/meta/recipes-core/udev/udev/udev-cache 
>> b/meta/recipes-core/udev/udev/udev-cache
>> index 8a84fa9..3e0eff6 100644
>> --- a/meta/recipes-core/udev/udev/udev-cache
>> +++ b/meta/recipes-core/udev/udev/udev-cache
>> @@ -15,8 +15,14 @@ export TZ=/etc/localtime
>>   [ -x @UDEVD@ ] || exit 1
>>   [ -d /sys/class ] || exit 1
>>
>> +[ -f /etc/default/rcS ] && . /etc/default/rcS
>>   [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
>>
>> +if [ "$ROOTFS_READ_ONLY" = "yes" ]; then
>> +    [ "$VERBOSE" != "no" ] && echo "read-only rootfs, skip udev-cache"
>> +    exit 0
>> +fi
>> +
>>   if [ "$DEVCACHE" != "" -a -e /dev/shm/udev.cache ]; then
>>       echo "Populating dev cache"
>>       (cd /; tar cf "$DEVCACHE" dev)
>>
>
>


