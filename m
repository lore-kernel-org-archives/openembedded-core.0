Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3B2C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 14:43:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10360.1783521785671004071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 07:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Cb9SshGI;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47dedd17e12so64588f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 07:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783521784; x=1784126584; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CBb2W+WdfXc6WsDuwhMtkBDeyzqF2i5m7Wlp5p2feME=;
        b=Cb9SshGInnLA3bl9us4ol0+mpKkkC2+brFJoyAq+wSeL6mfKNNo+JiWcXPe37iiku8
         fRJ6f/qaYBYIou6zoVoFvFjyOYwx+PCNG+m4xAN0q3MfXtk0ENDrzZItRFUubtPGip3e
         AN7/HQaST9S7WVVD0bke+vuqotiD4D9SS1pSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521784; x=1784126584;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBb2W+WdfXc6WsDuwhMtkBDeyzqF2i5m7Wlp5p2feME=;
        b=qOKC1U/yB0BqfBKcG5LAOSXiW9JZXqX8tQW6Dn3ZsM1zneMuNZfyNvkF1tjcyJc/Qn
         2Pq9j1X8cG1Jpg5zavzwlU2rEX9u57Zwxg2jvNd+Fz3aXoRAEMB+kW3i2tjLoRXn4eRC
         jtb0fVDjz17ie7+PK4VGQpASRbmuUiIbcefmGSiy/ir4AqF9C8CKSgg8dyrJKQQshz/p
         tehYFFwVWyoZlVlh/I+3pH3HrYEiClf9yvICusmdGyRxNZK2AZhVqu/IeAWZ0Ng6XLMn
         JvuHn39SlBOWbctKWmjneJpkwn9MoogyY3X0HpObWJC1OvzeyzOGtBF4cJ6WjhVUpwfX
         zpMA==
X-Gm-Message-State: AOJu0YzieYStlrkqNDpPSl2hjbukwz1hjDJBPsvGMLyb8Ip1doNXLLG7
	7m8HjrKp1k3SLOBL6u6G2dN7KuND7sEa4zhOXrQ8jlt/GuQEFIvJ9S0xBSrCBylkd8s=
X-Gm-Gg: AfdE7cnLvRceMHxnRbJ1spf74pTYgk6VtHCgBtAVT44KbVK68PPSAh9ZmzrT/SYwiQW
	5lgXECKUindLtlZabWUp9lA4IMkZ9n5zI3lR//OAWNhLztgQ86jC08xPuKIE+uglNEdgH6mUCej
	7UN8F07/aozkAKYd6/8u/JWimY1wJy8NqTxBdVHGwiLpbRDm+4F5DgVod0Un1RDEt++GlSf22E6
	gWu6I1qDzOJ2WNBMmBCkJvcglvHx4MIGHQtoTRqzMelkp9ISoEK/BZ/ktwan12hEdXQfU4JXuAp
	E6cETXfIKyl7uVL3ZCSQ10BCEpS7QL50UVONwiU9LzJaFzBH+Jwu4OmKijRxYuqWCRWRRRGxoSB
	TNnPcFRxCQnHXT5lKcWtCMDWE1WoLdYaA1wWObVd/PXqHNvrmkEF2jq4iEXXV/IEXGKCTJTSnB0
	LYAty5JJKutYND8pDM2q77BlWGWqm1vBHch2+iXRoEpdN9ONeSc0kOTMfnmzrfiOAf3PHAN6aNI
	ZkuTsevdsEOeWbYYnsAGwYSNe2nvA1Ae8g=
X-Received: by 2002:a05:6000:1a85:b0:472:c96c:eeb with SMTP id ffacd0b85a97d-47df06c81f5mr3634851f8f.0.1783521783852;
        Wed, 08 Jul 2026 07:43:03 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm43961389f8f.26.2026.07.08.07.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:43:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------I5SW5weHYaQh0zMnz1Dx7F0U"
Message-ID: <06e0d937-9113-4deb-9930-04d804d6aea7@konsulko.com>
Date: Wed, 8 Jul 2026 17:43:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [[PATCHv2] meta: Add pam to DISTRO_FEATURES if using
 systemd
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
References: <20260707090248.417251-1-leon.anavi@konsulko.com>
 <ak0mCn1v18QBHsYI@navimatix.de>
 <CALtQ3O07H7h7v5GzckUB=Am2R7KaX6ZK=tpUhQLUPK0ovkEBmQ@mail.gmail.com>
 <ak4Iqn1lnJUP2Myd@navimatix.de>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <ak4Iqn1lnJUP2Myd@navimatix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 14:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240488

This is a multi-part message in MIME format.
--------------I5SW5weHYaQh0zMnz1Dx7F0U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jörg,

On 7/8/26 11:52, Jörg Sommer wrote:
> Leon Anavi schrieb am Mi 08. Jul, 09:37 (+0300):
>> On Tue, Jul 7, 2026 at 7:25 PM Jörg Sommer<joerg.sommer@navimatix.de>
>> wrote:
>>
>>> Leon Anavi via lists.openembedded.org schrieb am Di 07. Jul, 12:02
>>> (+0300):
>>>> Add pam to the list of DISTRO_FEATURES in init-manager-systemd.inc.
>>>> This way pam will available if variable VIRTUAL-RUNTIME_init_manager
>>>> has been set to systemd. Otherwise having systemd in conjunction
>>>> with wayland but without pam leads to a conflict with the
>>>> REQUIRED_DISTRO_FEATURES for weston related recipes.
>>>>
>>>> This adjustment is required following these recent changes that
>>>> switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
>>>> wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
>>>>
>>>> - 159148f4de2595556fef6e8678578df83383857b
>>>>    meta: Support opting out of any distro features
>>>>    (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
>>>>    with wayland and vulkan.)
>>>>
>>>> - 0b4061c5d50261f826d0edb4b478d2d305274b7c
>>>>    conf: Switch to systemd by default and simplify init manager selection
>>>>
>>>> This fixes issues with test_machine_world when running the
>>>> yocto-check-layer script for BSP layers that include weston in the
>>>> dependency chain, for example meta-tegra:
>>>>
>>>> ERROR: Required build target 'meta-world-pkgdata' has no buildable
>>> providers.
>>>> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
>>> 'l4t-graphics-demos', 'weston']
>>>> The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
>>>> enabled. Therefore, it makes sense to also add pam to the defaults
>>>> through DISTRO_FEATURES in init-manager-systemd.inc.
>>>>
>>>> Signed-off-by: Leon Anavi<leon.anavi@konsulko.com>
>>>> ---
>>>>   meta/conf/distro/include/init-manager-systemd.inc | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/conf/distro/include/init-manager-systemd.inc
>>> b/meta/conf/distro/include/init-manager-systemd.inc
>>>> index 63fd225ca5..2e9eef24b5 100644
>>>> --- a/meta/conf/distro/include/init-manager-systemd.inc
>>>> +++ b/meta/conf/distro/include/init-manager-systemd.inc
>>>> @@ -1,5 +1,5 @@
>>>>   # Use systemd for system initialization
>>>> -DISTRO_FEATURES:append = " systemd usrmerge"
>>>> +DISTRO_FEATURES:append = " systemd usrmerge pam"
>>> systemd and usrmerge are required features for systemd. But pam is optional
>>> and should be in DISTRO_FEATURES_DEFAULTS to allow for easy opt-out.
>>>
>>>
>> Thank you for your feedback but please note that version 1 of my patch was
>> adding pam to DISTRO_FEATURES_DEFAULTS if systemd was enabled. Here is a
>> link to v1 of my patch:
>> https://lists.openembedded.org/g/openembedded-core/message/240113
> Thanks for the link. For an unknown reason I do not get all mails from the
> list. I suspect it's an outlook feature.
>
>> Following the code review and feedback provided by Paul Barker I modified
>> the patch and submitted version 2. For your convenience, here is a link to
>> Paul's email with his recommendation that init-manager-systemd.inc is the
>> better place for this:
>> https://lists.openembedded.org/g/openembedded-core/message/240233
> Yes, I think so too. But as Paul said: “I'm not sure we want to enable pam
> for everyone using systemd, there may be many systemd users who don't use
> weston.” And I am one of these users who do not want pam.
>
> My idea was to add to init-manager-systemd.inc this line:
>
> DISTRO_FEATURES_DEFAULTS += "pam"

OK, thank you for clarifying it. Sorry, I didn't understand what you had 
in mind in your initial email. Following your suggestion I did it but 
with DISTRO_FEATURES_DEFAULTS:append for consistency how 
init-manager-systemd.inc handles DISTRO_FEATURES. It works fine for my 
use case with yocto-check-layer script. I have just sent v3 of the patch.

>
>>> On the other side: Is pam so much common that it should be enabled by
>>> default?
>>
>> The purpose of my proposed patch is to fix the behavior of the
>> yocto-check-layer script when running it with DISTRO="nodistro" for layers
>> that depend on recipes requiring pam, such as weston. Since the Wrynose
>> release and the previously mentioned git commits by Richard and Paul,
>> openembedded-core has switched to systemd by default and extended
>> DISTRO_FEATURES_DEFAULTS with wayland and vulkan. Because wayland is now
>> enabled by default,
> As far as I can see, wayland was enabled by default before Paul's “meta:
> Support opting out of any distro features”
> 159148f4de2595556fef6e8678578df83383857b. The real breaking change was the
> default init-manager of systemd.

Yes, as mentioned in the git commit message of my patch, it is a 
conjunction between git commits 159148f4de2595556fef6e8678578df83383857b 
and 0b4061c5d50261f826d0edb4b478d2d305274b7c with the primary impact 
from latter because of the switching to systemd by default. Best 
regards, Leon
>
> Hence, the setup must have been broken before, if someone choose systemd.
>
> I would add “pam” to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc,
> because this sets the required features to build all recipes, but users can
> opt-out.
>
> Maybe it's worth to mention this in the release notes that more people
> become aware of they have to set `DISTRO_FEATURES_OPTED_OUT += "pam"`.
>
>
--------------I5SW5weHYaQh0zMnz1Dx7F0U
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Jörg,</p>
    <div class="moz-cite-prefix">On 7/8/26 11:52, Jörg Sommer wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ak4Iqn1lnJUP2Myd@navimatix.de">
      <pre wrap="" class="moz-quote-pre">Leon Anavi schrieb am Mi 08. Jul, 09:37 (+0300):
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Tue, Jul 7, 2026 at 7:25 PM Jörg Sommer <a class="moz-txt-link-rfc2396E" href="mailto:joerg.sommer@navimatix.de">&lt;joerg.sommer@navimatix.de&gt;</a>
wrote:

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Leon Anavi via lists.openembedded.org schrieb am Di 07. Jul, 12:02
(+0300):
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Add pam to the list of DISTRO_FEATURES in init-manager-systemd.inc.
This way pam will available if variable VIRTUAL-RUNTIME_init_manager
has been set to systemd. Otherwise having systemd in conjunction
with wayland but without pam leads to a conflict with the
REQUIRED_DISTRO_FEATURES for weston related recipes.

This adjustment is required following these recent changes that
switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":

- 159148f4de2595556fef6e8678578df83383857b
  meta: Support opting out of any distro features
  (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
  with wayland and vulkan.)

- 0b4061c5d50261f826d0edb4b478d2d305274b7c
  conf: Switch to systemd by default and simplify init manager selection

This fixes issues with test_machine_world when running the
yocto-check-layer script for BSP layers that include weston in the
dependency chain, for example meta-tegra:

ERROR: Required build target 'meta-world-pkgdata' has no buildable
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">providers.
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">'l4t-graphics-demos', 'weston']
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
enabled. Therefore, it makes sense to also add pam to the defaults
through DISTRO_FEATURES in init-manager-systemd.inc.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
---
 meta/conf/distro/include/init-manager-systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">b/meta/conf/distro/include/init-manager-systemd.inc
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">index 63fd225ca5..2e9eef24b5 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -1,5 +1,5 @@
 # Use systemd for system initialization
-DISTRO_<a class="moz-txt-link-freetext" href="FEATURES:append">FEATURES:append</a> = " systemd usrmerge"
+DISTRO_<a class="moz-txt-link-freetext" href="FEATURES:append">FEATURES:append</a> = " systemd usrmerge pam"
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
systemd and usrmerge are required features for systemd. But pam is optional
and should be in DISTRO_FEATURES_DEFAULTS to allow for easy opt-out.


</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Thank you for your feedback but please note that version 1 of my patch was
adding pam to DISTRO_FEATURES_DEFAULTS if systemd was enabled. Here is a
link to v1 of my patch:
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/240113">https://lists.openembedded.org/g/openembedded-core/message/240113</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks for the link. For an unknown reason I do not get all mails from the
list. I suspect it's an outlook feature.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Following the code review and feedback provided by Paul Barker I modified
the patch and submitted version 2. For your convenience, here is a link to
Paul's email with his recommendation that init-manager-systemd.inc is the
better place for this:
<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/240233">https://lists.openembedded.org/g/openembedded-core/message/240233</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes, I think so too. But as Paul said: “I'm not sure we want to enable pam
for everyone using systemd, there may be many systemd users who don't use
weston.” And I am one of these users who do not want pam.

My idea was to add to init-manager-systemd.inc this line:

DISTRO_FEATURES_DEFAULTS += "pam"</pre>
    </blockquote>
    <p>OK, thank you for clarifying it. Sorry, I didn't understand what
      you had in mind in your initial email. Following your suggestion I
      did it but with DISTRO_FEATURES_<a class="moz-txt-link-freetext" href="DEFAULTS:append">DEFAULTS:append</a> for consistency
      how init-manager-systemd.inc handles DISTRO_FEATURES. It works
      fine for my use case with yocto-check-layer script. I have just
      sent v3 of the patch.</p>
    <blockquote type="cite" cite="mid:ak4Iqn1lnJUP2Myd@navimatix.de">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On the other side: Is pam so much common that it should be enabled by
default?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">

The purpose of my proposed patch is to fix the behavior of the
yocto-check-layer script when running it with DISTRO="nodistro" for layers
that depend on recipes requiring pam, such as weston. Since the Wrynose
release and the previously mentioned git commits by Richard and Paul,
openembedded-core has switched to systemd by default and extended
DISTRO_FEATURES_DEFAULTS with wayland and vulkan. Because wayland is now
enabled by default,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As far as I can see, wayland was enabled by default before Paul's “meta:
Support opting out of any distro features”
159148f4de2595556fef6e8678578df83383857b. The real breaking change was the
default init-manager of systemd.</pre>
    </blockquote>
    <br>
    Yes, as mentioned in the git commit message of my patch, it is a
    conjunction <span style="white-space: pre-wrap">between git commits 159148f4de2595556fef6e8678578df83383857b and </span><span
    style="white-space: pre-wrap">0b4061c5d50261f826d0edb4b478d2d305274b7c with the primary impact from latter because of the switching to systemd by default.

Best regards, Leon

</span>
    <blockquote type="cite" cite="mid:ak4Iqn1lnJUP2Myd@navimatix.de">
      <pre wrap="" class="moz-quote-pre">

Hence, the setup must have been broken before, if someone choose systemd.

I would add “pam” to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc,
because this sets the required features to build all recipes, but users can
opt-out.

Maybe it's worth to mention this in the release notes that more people
become aware of they have to set `DISTRO_FEATURES_OPTED_OUT += "pam"`.


</pre>
    </blockquote>
  </body>
</html>

--------------I5SW5weHYaQh0zMnz1Dx7F0U--

