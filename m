Return-Path: <drew.moseley@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <9e4e3fdc-93dc-c2c6-909d-5ab0a3331648@gmail.com>
Date: Fri, 19 Aug 2022 11:13:19 -0400
MIME-Version: 1.0
Reply-To: drew@moseleynet.net
Subject: Re: [OE-core][PATCH] rng-tools: Change "Requires" to "WantedBy" for dev-hwrng.device
References: <f01236ab-4fa1-94b7-e44d-fc43cfeb0fe5@gmail.com>
 <20220815182503.2007534-1-drew@moseleynet.net>
 <6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de>
 <c018dc5e-f1d6-12cf-3e86-56978e63522f@windriver.com>
 <df0d6b90-d714-0f64-554a-25a9ce3ec427@gmail.com>
 <b33d2d3d-0650-dea5-4f8c-9eebfb425d80@windriver.com>
From: "Drew Moseley" <drew.moseley@gmail.com>
In-Reply-To: <b33d2d3d-0650-dea5-4f8c-9eebfb425d80@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------j8dI836azTaI0LrWjzp9170k"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Dragos-Marian Panait <dragos.panait@windriver.com>, Claudius Heine <ch@denx.de>, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com

--------------j8dI836azTaI0LrWjzp9170k
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit


On 8/19/22 11:07 AM, Dragos-Marian Panait wrote:
>
>
> On 19.08.2022 17:34, Drew Moseley wrote:
>>
>> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>>
>> On 8/19/22 8:50 AM, Dragos-Marian Panait wrote:
>>>
>>> Hi Claudius,
>>>
>>> On 19.08.2022 12:36, Claudius Heine wrote:
>>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>>
>>>> Hi Dew.
>>>>
>>>> On 2022-08-15 20:25, drew.moseley@gmail.com wrote:
>>>>> From: Drew Moseley <drew@moseleynet.net>
>>>>>
>>>>> The previous change to remove the dependency on systemd-udev-settle
>>>>> caused boot delays at least on qemu. It seems that change required
>>>>> a hwrng device but that's not necessarily available on all platforms.
>>>>>
>>>>> This changes the "Requires" to a "WantedBy" as modeled after the
>>>>> version of this file on Ubuntu 20.04.
>>>>>
>>>>> Signed-off-by: Drew Moseley <drew@moseleynet.net>
>>>>> ---
>>>>> meta/recipes-support/rng-tools/rng-tools/rng-tools.service | 3 +--
>>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git 
>>>>> a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service 
>>>>> b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>>>>> index 0f50890dcb..b013d95932 100644
>>>>> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>>>>> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>>>>> @@ -3,8 +3,6 @@ Description=Hardware RNG Entropy Gatherer Daemon
>>>>>   DefaultDependencies=no
>>>>>   After=systemd-udev-settle.service
>>>>>   Before=sysinit.target 
>>>>> <https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$> 
>>>>> shutdown.target 
>>>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$> 
>>>>>
>>>>> -Requires=dev-hwrng.device
>>>>> -After=dev-hwrng.device
>>>>>   Conflicts=shutdown.target 
>>>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$> 
>>>>>
>>>>>
>>>>>   [Service]
>>>>> @@ -32,3 +30,4 @@ SystemCallFilter=@system-service
>>>>>
>>>>>   [Install]
>>>>>   WantedBy=sysinit.target 
>>>>> <https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$> 
>>>>>
>>>>> +WantedBy=dev-hwrng.device
>>>>
>>>> This looses the order. Have you tried just replacing `Requires` with
>>>> `Wants`. So something like this:
>>>>
>>>>
>>>> ```
>>>>
>>>> Before=sysinit.target 
>>>> <https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$> 
>>>> shutdown.target 
>>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$> 
>>>>
>>>> Wants=dev-hwrng.device
>>>> After=dev-hwrng.device
>>>> Conflicts=shutdown.target 
>>>> <https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$> 
>>>>
>>>>
>>>> ```
>>>>
>>>> If that still would cause the long waiting time on qemu?
>>>>
>>>> I haven't investigated the qemu issue, but maybe qemu just doesn't
>>>> provide a hardware random source? If it doesn't provide a hardware
>>>> random source, then installing rng-tools on there might also not 
>>>> make sense.
>>>> Alternatively maybe just adding a start timeout might solve it?
>>>> regards,
>>>> Claudius
>>>
>>>
>>> I've tested the patch on a NUC7, results are the same as with qemu:
>>> - increased boot time
>>> - timeout for rng-tools.service
>>> [ TIME ] Timed out waiting for device /dev/hwrng.
>>> [DEPEND] Dependency failed for Hard…e RNG Entropy Gatherer Daemon.
>>>
>>> Regards,
>>> Dragos
>>>
>>
>> Interesting. I guess this patch should definitely be ignored and the 
>> patch from Khem that removes both the dev-hwrng and 
>> systemd-udev-settle depencies is the right approach. That means that 
>> the original problem that adding systemd-udev-settle was meant to 
>> solve, is no longer solved but it seems that the proposed solutions 
>> here have adverse effects elsewhere.
>>
>> Simply removing the systemd-udev-settle dependency fixes the issue 
>> that my customer has that caused me to start investigating here.
>>
>> Drew
>>
>> -- 
>> mailto:drew@moseleynet.net
> Sorry for the confusion, I did not test any additional patches/changes 
> that have been suggested in this email thread.
> My test was performed on current Yocto master sources. No additional 
> patches.
> I just wanted to inform that the boot delay is also observed on real 
> hw, not just qemu.
> Again, sorry for the confusion.
>
> Dragos


Sorry for adding to the confusion. My point was intended to be that I am 
fairly certain the recent patch submitted by Khem will resolve the boot 
delay issue you are having as well as the original boot delay caused by 
systemd-udev-settle.

Drew

-- 
mailto:drew@moseleynet.net

--------------j8dI836azTaI0LrWjzp9170k
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/19/22 11:07 AM, Dragos-Marian
      Panait wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b33d2d3d-0650-dea5-4f8c-9eebfb425d80@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 19.08.2022 17:34, Drew Moseley
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:df0d6b90-d714-0f64-554a-25a9ce3ec427@gmail.com">
        <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
          2.0pt">
          <p class="MsoNormal"
            style="line-height:12.0pt;background:#FFEB9C"><b><span
                style="font-size:10.0pt;color:#9C6500"></span></b><span
              style="font-size:10.0pt;color:red">[Please note: This
              e-mail is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
        </div>
        <div>
          <p><br>
          </p>
          <div class="moz-cite-prefix">On 8/19/22 8:50 AM, Dragos-Marian
            Panait wrote:<br>
          </div>
          <blockquote type="cite"
            cite="mid:c018dc5e-f1d6-12cf-3e86-56978e63522f@windriver.com">
            <p>Hi Claudius,</p>
            <div class="moz-cite-prefix">On 19.08.2022 12:36, Claudius
              Heine wrote:<br>
            </div>
            <blockquote type="cite"
              cite="mid:6d48f3e4-28c9-848d-9b14-cb5f1950c4ca@denx.de">[Please
              note: This e-mail is from an EXTERNAL e-mail address] <br>
              <br>
              Hi Dew. <br>
              <br>
              On 2022-08-15 20:25, <a class="moz-txt-link-abbreviated
                moz-txt-link-freetext"
                href="mailto:drew.moseley@gmail.com"
                moz-do-not-send="true"> drew.moseley@gmail.com</a>
              wrote: <br>
              <blockquote type="cite">From: Drew Moseley <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:drew@moseleynet.net"
                  moz-do-not-send="true"> &lt;drew@moseleynet.net&gt;</a>
                <br>
                <br>
                The previous change to remove the dependency on
                systemd-udev-settle <br>
                caused boot delays at least on qemu. It seems that
                change required <br>
                a hwrng device but that's not necessarily available on
                all platforms. <br>
                <br>
                This changes the "Requires" to a "WantedBy" as modeled
                after the <br>
                version of this file on Ubuntu 20.04. <br>
                <br>
                Signed-off-by: Drew Moseley <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:drew@moseleynet.net"
                  moz-do-not-send="true"> &lt;drew@moseleynet.net&gt;</a>
                <br>
                --- <br>
                 
                meta/recipes-support/rng-tools/rng-tools/rng-tools.service
                | 3 +-- <br>
                  1 file changed, 1 insertion(+), 2 deletions(-) <br>
                <br>
                diff --git
                a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service <br>
                index 0f50890dcb..b013d95932 100644 <br>
                ---
                a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
                <br>
                +++
                b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
                <br>
                @@ -3,8 +3,6 @@ Description=Hardware RNG Entropy
                Gatherer Daemon <br>
                  DefaultDependencies=no <br>
                  After=systemd-udev-settle.service <br>
                  Before=<a
href="https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$"
                  moz-do-not-send="true">sysinit.target</a> <a
href="https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$"
                  moz-do-not-send="true"> shutdown.target</a> <br>
                -Requires=dev-hwrng.device <br>
                -After=dev-hwrng.device <br>
                  Conflicts=<a
href="https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$"
                  moz-do-not-send="true">shutdown.target</a> <br>
                <br>
                  [Service] <br>
                @@ -32,3 +30,4 @@ SystemCallFilter=@system-service <br>
                <br>
                  [Install] <br>
                  WantedBy=<a
href="https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$"
                  moz-do-not-send="true">sysinit.target</a> <br>
                +WantedBy=dev-hwrng.device <br>
              </blockquote>
              <br>
              This looses the order. Have you tried just replacing
              `Requires` with <br>
              `Wants`. So something like this: <br>
              <br>
              <br>
              ``` <br>
              <br>
              Before=<a
href="https://urldefense.com/v3/__http://sysinit.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhOUu8G5A$"
                moz-do-not-send="true">sysinit.target</a> <a
href="https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$"
                moz-do-not-send="true"> shutdown.target</a> <br>
              Wants=dev-hwrng.device <br>
              After=dev-hwrng.device <br>
              Conflicts=<a
href="https://urldefense.com/v3/__http://shutdown.target__;!!AjveYdw8EvQ!bMQ5MfvZXWSzWjMLcLKDiM6wYi4-aF2QLE3CUcAKrFyEDpC2HxgAIFZGkwbGAHCJ81Fwt4gLnBeDKIdmEXOhfig0Hzw$"
                moz-do-not-send="true">shutdown.target</a> <br>
              <br>
              ``` <br>
              <br>
              If that still would cause the long waiting time on qemu? <br>
              <br>
              I haven't investigated the qemu issue, but maybe qemu just
              doesn't <br>
              provide a hardware random source? If it doesn't provide a
              hardware <br>
              random source, then installing rng-tools on there might
              also not make sense. <br>
              Alternatively maybe just adding a start timeout might
              solve it? <br>
              regards, <br>
              Claudius <br>
            </blockquote>
            <p><br>
            </p>
            I've tested the patch on a NUC7, results are the same as
            with qemu:<br>
            - increased boot time<br>
            - timeout for rng-tools.service<br>
            <font size="2" face="Helvetica, Arial, sans-serif">[ TIME ]
              Timed out waiting for device /dev/hwrng. </font><br>
            <font size="2" face="Helvetica, Arial, sans-serif">[DEPEND]
              Dependency failed for Hard…e RNG Entropy Gatherer Daemon.
            </font><br>
            <p>Regards,<br>
              Dragos<br>
            </p>
          </blockquote>
          <p><br>
          </p>
          <p>Interesting. I guess this patch should definitely be
            ignored and the patch from Khem that removes both the
            dev-hwrng and systemd-udev-settle depencies is the right
            approach. That means that the original problem that adding
            systemd-udev-settle was meant to solve, is no longer solved
            but it seems that the proposed solutions here have adverse
            effects elsewhere.</p>
          <p>Simply removing the systemd-udev-settle dependency fixes
            the issue that my customer has that caused me to start
            investigating here.</p>
          <p>Drew<br>
          </p>
          <pre class="moz-signature" cols="72">-- 
<a class="moz-txt-link-freetext" href="mailto:drew@moseleynet.net" moz-do-not-send="true">mailto:drew@moseleynet.net</a>
</pre>
        </div>
      </blockquote>
      Sorry for the confusion, I did not test any additional
      patches/changes that have been suggested in this email thread.<br>
      My test was performed on current Yocto master sources. No
      additional patches.<br>
      I just wanted to inform that the boot delay is also observed on
      real hw, not just qemu.<br>
      Again, sorry for the confusion.<br>
      <br>
      Dragos<br>
    </blockquote>
    <p><br>
    </p>
    <p>Sorry for adding to the confusion. My point was intended to be
      that I am fairly certain the recent patch submitted by Khem will
      resolve the boot delay issue you are having as well as the
      original boot delay caused by systemd-udev-settle.</p>
    <p>Drew<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
<a class="moz-txt-link-freetext" href="mailto:drew@moseleynet.net">mailto:drew@moseleynet.net</a>
</pre>
  </body>
</html>

--------------j8dI836azTaI0LrWjzp9170k--
