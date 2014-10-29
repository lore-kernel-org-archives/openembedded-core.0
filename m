Return-Path: <martin@hundeboll.net>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id B619B60670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 13:18:47 +0000 (UTC)
Received: from [172.26.72.41] (192.38.55.25.natpool.es.aau.dk [192.38.55.25])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 3A61D1BF29B;
	Wed, 29 Oct 2014 14:18:47 +0100 (CET)
Message-ID: <5450E937.7040501@hundeboll.net>
Date: Wed, 29 Oct 2014 14:18:47 +0100
From: =?UTF-8?B?TWFydGluIEh1bmRlYsO4bGw=?= <martin@hundeboll.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
	<1414581527-5448-2-git-send-email-martin@hundeboll.net>
	<CANyK_8d3=cmQ0aDxwDtzGZcqHvaL1fhasnS2kimBia0WhJgSuw@mail.gmail.com>
In-Reply-To: <CANyK_8d3=cmQ0aDxwDtzGZcqHvaL1fhasnS2kimBia0WhJgSuw@mail.gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] scripts: use python2 explicitly in shebangs
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
X-List-Received-Date: Wed, 29 Oct 2014 13:18:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 2014-10-29 14:05, Paul Barker wrote:
> On 29 October 2014 11:18, Martin Hundebøll <martin@hundeboll.net> wrote:
>> As distributions start moving to python3, scripts should explicity
>> request python2 in the shebang. This patch changes all occurences of
>>      #!/usr/bin/python and #!/usr/bin/env python
>> to
>>      #!/usr/bin/env python2
>>
>
> <snip lots>
>
>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
>> index bba6f8f..b514aa5 100755
>> --- a/scripts/oe-buildenv-internal
>> +++ b/scripts/oe-buildenv-internal
>> @@ -33,7 +33,7 @@ fi
>>   # sanity.bbclass because bitbake's source code doesn't even pass
>>   # parsing stage when used with python v3, so we catch it here so we
>>   # can offer a meaningful error message.
>> -py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
>> +py_v3_check=`/usr/bin/env python2 --version 2>&1 | grep "Python 3"`
>>   if [ "$py_v3_check" != "" ]; then
>>          echo >&2 "Bitbake is not compatible with python v3"
>>          echo >&2 "Please set up python v2 as your default python interpreter"
>> @@ -43,7 +43,7 @@ fi
>>   # Similarly, we now have code that doesn't parse correctly with older
>>   # versions of Python, and rather than fixing that and being eternally
>>   # vigilant for any other new feature use, just check the version here.
>> -py_v26_check=`python -c 'import sys; print sys.version_info >= (2,7,3)'`
>> +py_v26_check=`python2 -c 'import sys; print sys.version_info >= (2,7,3)'`
>>   if [ "$py_v26_check" != "True" ]; then
>>          echo >&2 "BitBake requires Python 2.7.3 or later"
>>          return 1
>
> This is the section of shell script which checks the python version
> when you run 'oe-init-build-env'. If you want to change the way python
> is ran I'd start by looking at this code. If this script could
> automatically try 'python2' if 'python' is found to be Python 3, and
> ensure the correct interpreter is used in all commands that run after
> the environment is setup that would be fantastic. It'd probably be a
> mess to implement though.

True and true. It would be nice with some auto-config which sets up the 
environment to use the right python binary/symlink, and shouldn't be too 
messy if it's doable through something similar to virtualenv. I've seen 
similar approaches done with autoconf in gnome's jhbuild (although it 
failed on Arch too).

Yet, it's still needed to correct all the places using /usr/bin/python 
directly instead of depending on the environment.

> The change as it currently stands looks confusing as py_v3_check is
> set by running python2.

It becomes kind of redundant, yes. Maybe spit out a warning and some 
hints if default is python v3? A lot of packages might still depend on 
python2 as default, so users should be warned...

> I used to use a virtualenv to temporarily set Python 2 as the default
> for the shell in which I ran bitbake commands. That was a while ago
> though, all my current builds are running on Ubuntu 12.04/14.04 server
> instances which I access via ssh from my Arch Linux box.

Using a compatible distro-install is of course the easiest way to get 
going. Could also work with a virtual machine.

If this has interest, I will work on a python snippet to detect the 
possible python version, and setup the environment correspondingly.

Thanks,
Martin

