Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3899F60FC1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 03:23:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA23N1Fd004730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Nov 2013 20:23:01 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 1 Nov 2013 20:22:59 -0700
Message-ID: <52747050.8070303@windriver.com>
Date: Sat, 2 Nov 2013 11:24:00 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1380189657.git.Qi.Chen@windriver.com>
	<936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
	<526FAB30.9070600@windriver.com> <1383302692.25877.135.camel@ted>
In-Reply-To: <1383302692.25877.135.camel@ted>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] sysvinit: fix missing of boot log
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
X-List-Received-Date: Sat, 02 Nov 2013 03:23:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2013 06:44 PM, Richard Purdie wrote:
> On Tue, 2013-10-29 at 20:33 +0800, ChenQi wrote:
>> ping
>>
>> Any comment on this one?
> Yes, shouldn't the boot ordering be tweaked to ensure the tmpfs is
> available rather than force mounting it within this init script? This
> looks like a hack around the problem rather than fixing a real issue.

Agree.

Currently in our project, the mountall.sh (mounting the local 
filesystem) starts really late at boot time. It's started after `udev', 
`checkroot.sh', `modutils.sh', `bootlogd' and even `urandom'.
I think we should make it start before udev. In this way, the same hack 
in the udev's init script could also be removed.
The hack was there in udev's init script because the udev's automount 
rule might need to write to the /tmp directory.

I will send out a new patchset.

Best Regards,
Chen Qi

> The -c part is ok so please resend without the mount.
>
> Cheers,
>
> Richard
>
>
>> Best Regards,
>> Chen Qi
>>
>> On 09/26/2013 06:02 PM, Qi.Chen@windriver.com wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Previously, our system had no boot log even if the bootlogd daemon was
>>> started correctly. The root cause is that the log file doesn't exist
>>> when starting the bootlogd.
>>>
>>> Add '-c' option to bootlogd so that it will create the boot log if
>>> it doesn't exist.
>>>
>>> Besides, we need to make sure that tmpfs has been mounted. Otherwise,
>>> the boot log will still be missing.
>>>
>>> [YOCTO #5273]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>    meta/recipes-core/sysvinit/sysvinit/bootlogd.init |    5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
>>> index 7b87827..3a10a3c 100755
>>> --- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
>>> +++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
>>> @@ -42,14 +42,15 @@ esac
>>>    
>>>    case "$ACTION" in
>>>    	start)
>>> +		mount -a -t tmpfs 2>/dev/null
>>>    		echo -n "Starting $DESC: "
>>>    		if [ -d /proc/1/. ]
>>>    		then
>>>    			umask 027
>>>    			start-stop-daemon --start --quiet \
>>> -				--exec $DAEMON -- -r
>>> +				--exec $DAEMON -- -r -c
>>>    		else
>>> -			$DAEMON -r
>>> +			$DAEMON -r -c
>>>    		fi
>>>    		echo "$NAME."
>>>    		;;
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>


