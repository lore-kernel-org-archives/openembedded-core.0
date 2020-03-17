Return-Path: <alhe@linux.microsoft.com>
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mail.openembedded.org (Postfix) with ESMTP id C2F8260B47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:58:22 +0000 (UTC)
Received: from [10.8.8.50] (unknown [172.83.40.229])
	by linux.microsoft.com (Postfix) with ESMTPSA id 784AB20B9C02;
	Tue, 17 Mar 2020 08:58:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 784AB20B9C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1584460703;
	bh=8OCMpYw+ZZ4dQaet38ENgJRkIQvUeUjVdz3IYiEBm90=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=M7H6XfWmzrhN3rbBaoZTUqo6MehPvIWCqEDO1YD9COygllQ/wDB5R27hWyfDiCZDW
	rCsrpq/xzi/FGNBXkS+4+O0dhVAcd94KWtRxAD6pa20tCdL7I/RWiQADLy74MDl+75
	zeNYbN+a5VS8vn3ReNrM9u1ALCRBg0EDpbqSgcwc=
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200315061311.19344-1-alhe@linux.microsoft.com>
	<f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org>
From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Message-ID: <f3789b3e-9707-b8c7-f8da-f2d1c278c423@linux.microsoft.com>
Date: Tue, 17 Mar 2020 15:58:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org>
Subject: Re: [PATCH] Windows: Enable Windows builds under WSLv2 and warn accordingly
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
X-List-Received-Date: Tue, 17 Mar 2020 15:58:22 -0000
Content-Type: multipart/alternative;
	boundary="------------9280367D898A78EB8A22F079"
Content-Language: en-GB

--------------9280367D898A78EB8A22F079
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Richard,

On 3/15/2020 4:48 AM, Richard Purdie wrote:
> On Sat, 2020-03-14 at 23:13 -0700, Alejandro Hernandez Samaniego wrote:
>> Due to the architectural changes between Windows Subsystem for Linux
>> v2, and WSL v1 it should now be possible to run bitbake on the
>> several distros offered through the Microsoft Store.
>>
>> WSLv2 is available on Windows 10 build number > 18917
>>
>> The current build number may be checked by opening a cmd prompt on
>> Windows and running:
>>
>> C:\Users\myuser>ver
>>
>> Microsoft Windows [Version 10.0.19041.113]
> Thanks, this is useful information. How much of our system works on
> WSL2? runqemu? testimage? eSDK? virtgl? Is anything known not to work?
> This email implies everything works?
>
> My big worry here is that we have a set subset of bugs which only occur
> on WSL2. We're struggling with the bug reports we have today, adding in
> a whole new set with no help to support that is a concern.

I have tested enough to be confident that this should not be the case, testimage works,
runqemu works (after creating the tap interfaces), unless you have specific tests that
you want me to run for virtgl, I did test virtgl on runqemu and ran the image along with
some basic graphics testing, esdk works, I just ran bitbake-selftest and oe-selftest and
they both work, I understand your concern but I dont believe this would be the case.

>
> Is this for 3.1 LTS? Are Microsoft going to be able to help us in any
> way? How "official" is this change?

I can speak for myself and say that if there are any WSL related bugs, they can be assigned
to me during TRIAGE and I will take a look at them, also note that these are only the
changes on the OE part of things, WSLv2 will be generally available on Windows 10 v2004
https://devblogs.microsoft.com/commandline/wsl2-will-be-generally-available-in-windows-10-version-2004/

So, while my hope is that this can be merged on Dunfell, if possible I'd like to backport
this to Zeus at least, note that the previous check simply won't work on WSLv2 and it wont
throw any errors about it, I believe people will start using this regardless and its better
if we warn them properly about the process (I have tested both current master and Zeus).

If that is not possible then at the very least we should throw an error as well for WSLv2 on
previous releases.

>>           if "Microsoft" in l:
>> -            return "OpenEmbedded doesn't work under WSL at this time, sorry"
>> +            return "OpenEmbedded doesn't work under WSLv1, please upgrade to WSLv2 if you want to run builds on Windows"
>> +        elif "microsoft" in l:
>> +            bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
>>       return None
>>   
>>   # Tar version 1.24 and onwards handle overwriting symlinks correctly
> Is Microsoft vs microsoft the best check we can have? Should we be
> checking the version specifically?

AFAIC this is a good way to test it, it is kept across all Microsoft Store Distros for both WSLv1 and WSLv2.

Cheers,

Alejandro

>
> Cheers,
>
> Richard

--------------9280367D898A78EB8A22F079
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hey Richard,
</pre>
    <div class="moz-cite-prefix">On 3/15/2020 4:48 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Sat, 2020-03-14 at 23:13 -0700, Alejandro Hernandez Samaniego wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Due to the architectural changes between Windows Subsystem for Linux
v2, and WSL v1 it should now be possible to run bitbake on the
several distros offered through the Microsoft Store.

WSLv2 is available on Windows 10 build number &gt; 18917

The current build number may be checked by opening a cmd prompt on
Windows and running:

C:\Users\myuser&gt;ver

Microsoft Windows [Version 10.0.19041.113]
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks, this is useful information. How much of our system works on
WSL2? runqemu? testimage? eSDK? virtgl? Is anything known not to work?
This email implies everything works?

My big worry here is that we have a set subset of bugs which only occur
on WSL2. We're struggling with the bug reports we have today, adding in
a whole new set with no help to support that is a concern.</pre>
    </blockquote>
    <pre>I have tested enough to be confident that this should not be the case, testimage works,
runqemu works (after creating the tap interfaces), unless you have specific tests that
you want me to run for virtgl, I did test virtgl on runqemu and ran the image along with
some basic graphics testing, esdk works, I just ran bitbake-selftest and oe-selftest and
they both work, I understand your concern but I dont believe this would be the case.

</pre>
    <blockquote type="cite"
cite="mid:f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Is this for 3.1 LTS? Are Microsoft going to be able to help us in any
way? How "official" is this change?</pre>
    </blockquote>
    <pre>I can speak for myself and say that if there are any WSL related bugs, they can be assigned
to me during TRIAGE and I will take a look at them, also note that these are only the
changes on the OE part of things, WSLv2 will be generally available on Windows 10 v2004
<a href="https://devblogs.microsoft.com/commandline/wsl2-will-be-generally-available-in-windows-10-version-2004/">https://devblogs.microsoft.com/commandline/wsl2-will-be-generally-available-in-windows-10-version-2004/</a>

So, while my hope is that this can be merged on Dunfell, if possible I'd like to backport
this to Zeus at least, note that the previous check simply won't work on WSLv2 and it wont
throw any errors about it, I believe people will start using this regardless and its better
if we warn them properly about the process (I have tested both current master and Zeus).

If that is not possible then at the very least we should throw an error as well for WSLv2 on
previous releases.
</pre>
    <blockquote type="cite"
cite="mid:f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <blockquote type="cite"
cite="mid:f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
         if "Microsoft" in l:
-            return "OpenEmbedded doesn't work under WSL at this time, sorry"
+            return "OpenEmbedded doesn't work under WSLv1, please upgrade to WSLv2 if you want to run builds on Windows"
+        elif "microsoft" in l:
+            bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is Microsoft vs microsoft the best check we can have? Should we be
checking the version specifically?</pre>
    </blockquote>
    <pre>AFAIC this is a good way to test it, it is kept across all Microsoft Store Distros for both WSLv1 and WSLv2.

Cheers,

Alejandro
</pre>
    <blockquote type="cite"
cite="mid:f3cec84a2711d700cf49ccad001eb9c1c36eef49.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------9280367D898A78EB8A22F079--
