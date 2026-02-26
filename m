Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136B5FCE08C
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:07:41 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70484.1772114857474838322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=09yMgioP;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb3a8494c5so86152085a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772114856; x=1772719656; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvPU4Yiv1YHcW8X1ADAM6wRcVbwfwPIn924EuCLNsIw=;
        b=09yMgioP19hOliJTlpErLOpgyp8dV50acWndXQek54JxGCExT57PamT1zftLeKiAyk
         8P4YS1cgyoKGAyK5KrWUJk9udb2Ei6/PrWm5c2DZ++XEL6rVnmJoXr6vTasdVsb9pvoO
         CFqLqjzk3mQekrKoKZewMcJWZFS7ZzBbRz3+d3Fn/SutWmxV88Da7H+ZB6cdaFhXTP2z
         yy4VjjS+VzBh7qGlYXSK257qTTUbaL+mik3uBld94MrdFnN6yE7wo62v0v7sz+Sh/h5Z
         2nchUwrKQYZGtzzjppAX8+S0wWPf1Tcz32u9ZrxLoy4id8EghIf8q7bj5FwtXaGlZHW5
         ucXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114856; x=1772719656;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvPU4Yiv1YHcW8X1ADAM6wRcVbwfwPIn924EuCLNsIw=;
        b=frmHacOA3tnefDdpAmk0eJ5+oKhESDdJkcORJDXv+lxjWLloVLvu1t7UhGVPOlDnNn
         JxQizTQQ7KC+13gChs9RGSW7RR3eJFCogQWYXl+ThgCXIl2Z2/7MkaN4tgtVWq8i/1Gn
         XPlQM6GRHDetVMXQYtLPO2NXzwSLG/ZSgShW4Gr+qbp0sp3Ei63QO4LfBFAqqmcXTaEa
         UMxK/8wkHNRnppmr2b3SEa3eUxf7YjEfPEoet6sRt4wdYMT7bg8IqM52z75J2JHKtw4a
         +Th3HPZeaORzl4Kk/xP9tUEmoLV/dAOaRYZVjCbIMxI6/7kV+2pSCJut3GR4RH6nXjaE
         S8ew==
X-Forwarded-Encrypted: i=1; AJvYcCXJEftmgCESM7Vh6Jtl/WDceOW7sqUrr+71UOJEd9hBnIi3PYECTWZZmUm0IXvwhUQWpZdDxafVbPa9sZid1nMeMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzulXN+fac+Kgy1h6GrLq1asLX0toz6wuwjwXe2qg0Fb85TaXf8
	MV/6v71PV+A/FdIoUDXV2ET9Iur46zS9PqlKmpxWqus6b66AalHM5/fMGz3iarrfSII=
X-Gm-Gg: ATEYQzyZpILc2+YfOsQcCi2pj+a3WL5+Rk4CfdANULhggFCnoLsOaU5MKbK8TYU97Yp
	cxtXi+GcLZ5eHaNbS8Avfm0Nx7r8ntmrH/CfzVk48ZCmW4gN8OEXnX3BHgHbILtomhRr4TUnv/D
	yHww7YTHAmndlwn7Cgq3VK0VzAhORWNowbuAmeyaPWhPv3l0LGTPB1uKBihIJD0PNwBceMSULJA
	DZab951hR8Vjjl/x8TJwNgexpykuzTRUp0N2yRELum2eaAHLoTjsXD6rcPEj74UJMHUDTUxZVbD
	tXpt5hcSxFrThFWZuvGzjR53kk8Ay8uJCZguQQgR6SidwnL9wUbSfNHtzLUZwVvtoKpPNIFNxoF
	X9g4DBkzmcX1CW7JSVbaIwO+UNiwEcqdpZKMKHgFlbD6TtmJi9gnHdLezE9HDYKCblDY925pMPQ
	LjhzRZACxlY7pnp2DQNzoAk0YiSWjTdTcA9WvRgfxBhU8iDc++XDbRTKYhXuXlZZXtsuJIOQ8iL
	5JG
X-Received: by 2002:a05:620a:4691:b0:8c7:1afd:a535 with SMTP id af79cd13be357-8cbc11241b2mr244116585a.25.1772114856292;
        Thu, 26 Feb 2026 06:07:36 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c715ae92sm19670906d6.5.2026.02.26.06.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 06:07:35 -0800 (PST)
Message-ID: <790134e9-2a3e-4029-91a9-98df0b05b8cd@baylibre.com>
Date: Thu, 26 Feb 2026 09:07:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [Openembedded-architecture] Improving DISTRO_FEATURES backfill &
 opt-out
To: richard.purdie@linuxfoundation.org, paul@pbarker.dev,
 "openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <ba0a57bc87f3563f43f46f663e1733fd552a7a03.camel@pbarker.dev>
 <089b277ea34cd0d9246e9eef717ae5d9d9ad9527.camel@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: <089b277ea34cd0d9246e9eef717ae5d9d9ad9527.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232028


On 2026-02-26 07:03, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2026-02-26 at 09:59 +0000, Paul Barker via lists.openembedded.org wrote:
>> 3) Merge the current contents of `DISTRO_FEATURES_BACKFILL` into
>>     `DISTRO_FEATURES_DEFAULT`. This variable will be filtered to disable
>>     any items listed in `DISTRO_FEATURES_OPTOUT` before use, efficiently
>>     and without the use of `:remove`. Deprecate
>>     `DISTRO_FEATURES_BACKFILL` and `DISTRO_FEATURES_BACKFILL_CONSIDERED`,
>>     issuing warnings if either is used.
>>
>> What does that look like practically? Something like this I think:
>>
>>      DISTRO_FEATURES_BASELINE = " \
>>          acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget \
>>          usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp \
>>          pulseaudio gobject-introspection-data ldconfig \
>>      "
>>
>>      DISTRO_FEATURES_DEFAULT = "${@filter_default_features('DISTRO_FEATURES', d)}"
>>      DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
>>
>>      DISTRO_FEATURES_OPTOUT ?= "${DISTRO_FEATURES_BACKFILL_CONSIDERED}"
>>
>>      def filter_default_features(varname, d):
>>          baseline_features = (d.getVar(varname + "_BASELINE") or "").split()
>>          optout_features = (d.getVar(varname + "_OPTOUT") or "").split()
>>
>>          return [feature for feature in baseline_features \
>>                  if feature not in optout_features]
>>
>> (un-tested, may also need some tweaks for performance)
>>
>> Applying the filtering as part of the definition of
>> `DISTRO_FEATURES_DEFAULT` makes it easy to use. If you're already using
>> `DISTRO_FEATURES_DEFAULT:remove` or `DISTRO_FEATURES:remove`, these will
>> still work, though we'd encourage you to adopt the new
>> `DISTRO_FEATURES_OPTOUT` variable. If you're using
>> `DISTRO_FEATURES_BACKFILL_CONSIDERED`, this would still work but our
>> encouragement would be louder - we can issue a warning if this is set
>> saying that it is deprecated and will be removed in a future release.
>>
>> There is one group adversely impacted by this change - anyone who
>> defines `DISTRO_FEATURES` fully themselves without including
>> `DISTRO_FEATURES_DEFAULT` will need to manually add the backfilled
>> features (pulseaudio, gobject-introspection-data & ldconfig) or adapt
>> how they set `DISTRO_FEATURES`. Personally I think that having to adapt
>> to this will not be difficult and it can be well documented as part of
>> the release notes and migration guide.
>>
>> A patch to implement the change should be straightforward, it may need a
>> little effort to address any fall out before release. There are no tests
>> for the `DISTRO_FEATURES_BACKFILL` logic right now, tests for the
>> filtering and opt-out variable can be added along with this change.
>> Impact on the autobuilder should be minimal, I think this is something
>> we can take in with little risk to the core project so it is unlike the
>> proposal to change the default init system for poky. The impact is
>> mostly on users who define their own distro, and we can make migration
>> as easy as possible as outlined above. I should be able to get this in
>> before the M3 build if we want to go ahead with this change before the
>> LTS.
>>
>> We can extend this to `MACHINE_FEATURES_DEFAULT` as well, deprecating
>> `MACHINE_FEATURES_BACKFILL` and `MACHINE_FEATURES_BACKFILL_CONSIDERED`.
>>
>> Thoughts and opinions?
> Keeping DISTRO_FEATURES_DEFAULT around but changing it's meaning does
> make me worry about the transition a lot. I also worry a bit about
> "default" meaning different things to different people.
>
> After we previously discussed it, I'd had a slightly different take on
> what we might do. I was thinking that we might:
>
> Rename:
>    DISTRO_FEATURES_BACKFILL -> DISTRO_FEATURES_OPTOUT
>    DISTRO_FEATURES_BACKFILL_CONSIDERED -> DISTRO_FEATURES_OPTOUT_CONSIDERED
>
> and then move the contents of DISTRO_FEATURES_DEFAULT into
> DISTRO_FEATURES_OPTOUT.
>
> This would make features in "optout" the default, unless you set them
> as 'considered'.
>
> You could perhaps have a DISTRO_FEATURES_OPTEDOUT?
>
> Is is probably a question of finding the right naming for them. We need
> a core way to say "these are the defaults" and then a "remove these
> from the defaults as we explicitly don't want them".

As far as naming goes, when I read "DISTRO_FEATURES_OPTOUT" my mind 
assumes whatever is in that list will be filtered from the default. I 
think that's what Paul is suggesting, so I'm in favour of that approach.
I also looked through the variables glossary quickly for EXCLUDE and 
found: 
https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-PACKAGE_EXCLUDE
Could "DISTRO_FEATURES_EXCLUDE" be a viable name that stays somewhat 
inline with what we're doing there?

Trevor
>
> So having said all that, perhaps we can cheat and use:
>
> DISTRO_FEATURES_DEFAULTS and DISTRO_FEATURES_OPTOUT
>
> which would remove the namespace clash issue?
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2283): https://lists.openembedded.org/g/openembedded-architecture/message/2283
> Mute This Topic: https://lists.openembedded.org/mt/118009864/7611679
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


