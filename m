Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1Tfjtm-0002Rj-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 05:14:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB43QGJu014982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2012 19:26:16 -0800 (PST)
Received: from [128.224.162.133] (128.224.162.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 3 Dec 2012 19:26:14 -0800
Message-ID: <50BD6D53.5010406@windriver.com>
Date: Tue, 4 Dec 2012 11:26:11 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1354270768-5265-1-git-send-email-ming.liu@windriver.com>
	<50B907DC.7020303@linux.intel.com>
In-Reply-To: <50B907DC.7020303@linux.intel.com>
X-Originating-IP: [128.224.162.133]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] initscripts/urandom: change random-seed directory
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
X-List-Received-Date: Tue, 04 Dec 2012 04:14:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2012 03:24 AM, Saul Wold wrote:
> On 11/30/2012 02:19 AM, Ming Liu wrote:
>> /etc/init.d/urandom fails to start/stop because it tries to save
>> random-seed into /var/lib/urandom folder which does not exist in the
>> file system.
>>
> Why not create it in the recipe's do_install?  Or possibly add it to 
> volatiles file.

OK, It may be a more reasonable solution creating it in do_install, I 
will send the V1 patch.
>
> Also talk with Qi Chen about the readonly FS stuff to make sure this 
> will work.
>

OK, I will talk to Qi.

> Sau!
>
>> Fixed by using /var/lib/misc instead of /var/lib/urandom.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-core/initscripts/initscripts-1.0/urandom | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/urandom 
>> b/meta/recipes-core/initscripts/initscripts-1.0/urandom
>> index eb3a7c3..1cf7c5c 100755
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/urandom
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/urandom
>> @@ -14,18 +14,19 @@
>>   test -c /dev/urandom || exit 0
>>   . /etc/default/rcS
>>
>> +SAVEDFILE=/var/lib/misc/random-seed
>>   case "$1" in
>>       start|"")
>>           test "$VERBOSE" != no && echo "Initializing random number 
>> generator..."
>>           # Load and then save 512 bytes,
>>           # which is the size of the entropy pool
>> -        if test -f /var/lib/urandom/random-seed
>> +        if test -f $SAVEDFILE
>>           then
>> -            cat /var/lib/urandom/random-seed >/dev/urandom
>> +            cat $SAVEDFILE >/dev/urandom
>>           fi
>> -        rm -f /var/lib/urandom/random-seed
>> +        rm -f $SAVEDFILE
>>           umask 077
>> -        dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
>> +        dd if=/dev/urandom of=$SAVEDFILE count=1 \
>>               >/dev/null 2>&1 || echo "urandom start: failed."
>>           umask 022
>>           ;;
>> @@ -34,7 +35,7 @@ case "$1" in
>>           # see documentation in linux/drivers/char/random.c
>>           test "$VERBOSE" != no && echo "Saving random seed..."
>>           umask 077
>> -        dd if=/dev/urandom of=/var/lib/urandom/random-seed count=1 \
>> +        dd if=/dev/urandom of=$SAVEDFILE count=1 \
>>               >/dev/null 2>&1 || echo "urandom stop: failed."
>>           ;;
>>       *)
>>
>
>



