Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 888546B91D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 07:14:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7M7EwS3018237
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 03:14:59 -0400 (EDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 22 Aug 2013 00:14:58 -0700
Message-ID: <5215BA7B.9040902@windriver.com>
Date: Thu, 22 Aug 2013 15:15:07 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1376968627.git.jackie.huang@windriver.com>
	<6f2bc301767250c371bb8d927e54425bdeda6f37.1376968627.git.jackie.huang@windriver.com>
	<54332AB2-FDDB-44C5-BCD8-00989CF8B700@gmail.com>
	<5215B78D.9060900@windriver.com>
In-Reply-To: <5215B78D.9060900@windriver.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 4/6] openssh: add init.d/sshd status command for LSB compliance
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
X-List-Received-Date: Thu, 22 Aug 2013 07:15:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 03:02 PM, jhuang0 wrote:
>
>
> On 8/22/2013 2:42 PM, Khem Raj wrote:
>> Hi Jackie
>>
>> One thing comes to mind is that these scripts are hardcoding the 
>> binaries and may be it would be
>> nicer to replace the bindir, libdir and so on at install time, that 
>> would make them flexible where /usr
>> is not used e.g. but I guess thats a general problem with capture 
>> init scripts all around probably.
>
> Yes it is general problem that almost all init scripts have these 
> hardcoding binaries, maybe we need a requirement and do that for all 
> these scripts with a plan.
>
> Thanks,
> Jackie
>

Agree.

If we're going to do this, we need to take the postinst scripts into 
consideration, as the postinst scripts have the same problem.

Best Regards,
Chen Qi

>>
>> On Aug 19, 2013, at 8:25 PM, jackie.huang@windriver.com wrote:
>>
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> Signed-off-by: Li Wang <li.wang@windriver.com>
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> ---
>>> .../openssh/openssh-6.2p2/init                     |   15 
>>> ++++++++++++++-
>>> 1 files changed, 14 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init 
>>> b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
>>> index 6beec84..6bbc573 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
>>> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
>>> @@ -1,6 +1,9 @@
>>> #! /bin/sh
>>> set -e
>>>
>>> +# source function library
>>> +. /etc/init.d/functions
>>> +
>>> # /etc/init.d/ssh: start and stop the OpenBSD "secure shell" daemon
>>>
>>> test -x /usr/sbin/sshd || exit 0
>>> @@ -46,6 +49,11 @@ check_keys() {
>>>     fi
>>> }
>>>
>>> +rh_status() {
>>> +    status /usr/sbin/sshd;
>>> +    return $?
>>> +}
>>> +
>>> export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
>>>
>>> case "$1" in
>>> @@ -84,8 +92,13 @@ case "$1" in
>>>     echo "."
>>>     ;;
>>>
>>> +  status)
>>> +    rh_status;
>>> +    exit $?
>>> +  ;;
>>> +
>>>    *)
>>> -    echo "Usage: /etc/init.d/ssh 
>>> {start|stop|reload|force-reload|restart}"
>>> +    echo "Usage: /etc/init.d/ssh 
>>> {start|stop|status|reload|force-reload|restart}"
>>>     exit 1
>>> esac
>>>
>>> -- 
>>> 1.7.4.1
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>


