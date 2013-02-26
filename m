Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UAAnr-0002k4-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 04:02:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q2jgD6007990
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Feb 2013 18:45:42 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Mon, 25 Feb 2013 18:45:41 -0800
Message-ID: <512C21DF.7010700@windriver.com>
Date: Tue, 26 Feb 2013 10:45:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1361783630.git.Qi.Chen@windriver.com>
	<cdf763e0896938a5189aa1694b6769f5b6d7190b.1361783630.git.Qi.Chen@windriver.com>
	<512C1725.80906@linux.intel.com>
In-Reply-To: <512C1725.80906@linux.intel.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: start .sh scripts correctly
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
X-List-Received-Date: Tue, 26 Feb 2013 03:02:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 10:00 AM, Saul Wold wrote:
> On 02/25/2013 05:39 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Previously, scripts which end with '.sh' were sourced, so the arguments
>> like 'start' and 'stop' were just ignored.
>>
>> This resulted in some init scripts not being able to start correctly.
>> For example, sourcing hwclock.sh in busybox actually does nothing.
>> It should be invoked as 'hwclock.sh start' or 'hwclock.sh stop'.
>>
>> This patch fixes this issue.
>>
>> [YOCTO #3612]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/sysvinit/sysvinit/rc |   16 +---------------
>>   1 file changed, 1 insertion(+), 15 deletions(-)
>>
>> diff --git a/meta/recipes-core/sysvinit/sysvinit/rc 
>> b/meta/recipes-core/sysvinit/sysvinit/rc
>> index 44bc9bf..50951da 100755
>> --- a/meta/recipes-core/sysvinit/sysvinit/rc
>> +++ b/meta/recipes-core/sysvinit/sysvinit/rc
>> @@ -41,21 +41,7 @@ startup_progress() {
>>   startup() {
>>     # Handle verbosity
>>     [ "$VERBOSE" = very ] && echo "INIT: Running $@..."
>> -
>> -  case "$1" in
>> -    *.sh)
>> -        # Source shell script for speed.
>> -        (
>> -            trap - INT QUIT TSTP
>
> Are you sure you don't want the trap still?  I realize this reset it 
> to default..
>
Yes.

Code snippet from rc:
   # Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
   trap ":" INT QUIT TSTP

So these signals are ignored in rc but passed on to subprocesses.
And the reset is not needed.

If in rc we use
     trap "" INIT QUIT TSTP
then the reset is needed.

Best Regards,
Chen Qi

> Sau!
>
>> -            scriptname=$1
>> -            shift
>> -            . $scriptname
>> -        )
>> -        ;;
>> -    *)
>> -        "$@"
>> -        ;;
>> -  esac
>> +  "$@"
>>     startup_progress
>>   }
>>
>>
>
>



