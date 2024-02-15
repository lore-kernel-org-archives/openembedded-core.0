Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C650C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 19:08:32 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.1039.1708024109705941306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 11:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=QnEru3mV;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (173-175-175-024.res.spectrum.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8A3C020B2000;
	Thu, 15 Feb 2024 11:08:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8A3C020B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1708024109;
	bh=PZF5JoLOdMfmW5+S6tRMlTVdgGUBd2HKpWyFwSHLMdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QnEru3mVsCdYO36OsEm7TRLwAX2iOqV5JL0dddBcxomIpgAHSibiSCOhNzs6nkeZk
	 oRl6SZPGKkdVuOJyKrGRolsLDE9AH3rcJIBcD1fGyT07gyAI40ghL12S1ovVIeqFcT
	 C/2LyTBqd6f7wSGJGP297kRNUSRz8cfBJWE/TX50=
Content-Type: multipart/alternative;
 boundary="------------dA5gmKx8FxYV8w0nbv0LvEK0"
Message-ID: <43abff26-0b40-4393-924b-60fabcbc377c@linux.microsoft.com>
Date: Thu, 15 Feb 2024 12:10:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] usrmerge: add the distro feature to nativesdk
 builds when added to target and enable symlink creation for both
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Maanya Goenka <maanyagoenka@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
Cc: Maanya Goenka <maanyagoenka@microsoft.com>
References: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
 <20240201025621.1632547-2-maanyagoenka@linux.microsoft.com>
 <fac899458e20aa7cac770ce215fc7cb4bfbce513.camel@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
In-Reply-To: <fac899458e20aa7cac770ce215fc7cb4bfbce513.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 19:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195693

This is a multi-part message in MIME format.
--------------dA5gmKx8FxYV8w0nbv0LvEK0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/24 03:27, Richard Purdie wrote:
> On Thu, 2024-02-01 at 02:56 +0000, Maanya Goenka wrote:
>> From: Maanya Goenka<maanyagoenka@microsoft.com>
>>
>> Add usrmerge to DISTRO_FEATURES_FILTER_NATIVESDK (and DISTRO_FEATURES_FILTER_NATIVE for consistency),
>> since we have come across cases where the distro feature would be required by both contexts.
>> As a supplement to this change, when creating the merged usr symlinks at the do_populate_sdk stage,
>> these need to be created for both the target and native sysroots within the SDK.
>>
>> Signed-off-by: Maanya Goenka<maanyagoenka@microsoft.com>
>> Signed-off-by : Alejandro Hernandez Samaniego<alhe@linux.microsoft.com>
>> ---
>>   meta/classes-recipe/image.bbclass | 2 ++
>>   meta/conf/bitbake.conf            | 4 ++--
>>   2 files changed, 4 insertions(+), 2 deletions(-)
> This doesn't quite follow. "target", "nativesdk" and "native" are all
> different separate filesystems and not connected. Yes, you can use
> usrmerge on some (or all?) of them but you don't have to have them
> match.
>
> Forcing them to match is likely just working around an underlying issue
> which needs to be fixed.
>
> What were the real failures?

Hello Richard,

Apologies for the late response.

I do agree that target, native and nativesdk are all separate and that you could use usrmerge on some
or all. I understand your point and I'm to blame for the suggestion to add usrmerge to the NATIVE case
for consistency.

The proposed patch is trying to fix an issue for a use case related to systemd.

Newer versions of systemd do not function properly without usrmerge because upstream systemd is dropping
support for non-usrmerge cases, which is typically fine because usrmerge works well for the TARGET.

https://lists.freedesktop.org/archives/systemd-devel/2022-September/048352.html

However, we are using some NATIVESDK systemd components that require usrmerge to work as well hence why
we needed to add usrmerge to the NATIVESDK filter since systemd components where expecting usr/foo locations
in the nativesdk filesystem.

While I understand that using nativesdk systemd components may not be widely common, I do believe its a
valid usecase.

I'd like to clarify that I'm not aware of any native systemd usecase and that my suggestion to add usrmerge
to the NATIVE filter was only for consistency, but not required (apologies for that again).

I've reproduced the autobuilder failures locally and I see that taking out usrmerge from the NATIVE filter does
get rid of the errors, if you agree with my statement that nativesdk systemd components are a valid usecase,
we can send a v2 that adds usrmerge to the NATIVESDK filter only to fix such cases.

If you prefer, we could also go one step above that and create a condition to add usrmerge to the NATIVESDK filter
only if systemd is being used or something similar.

Cheers,

Alejandro


>
> For example, this would stop native or nativesdk sstate being reused
> between differently configured builds when it could be.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194983):https://lists.openembedded.org/g/openembedded-core/message/194983
> Mute This Topic:https://lists.openembedded.org/mt/104089708/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------dA5gmKx8FxYV8w0nbv0LvEK0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">On 2/6/24 03:27, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:fac899458e20aa7cac770ce215fc7cb4bfbce513.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Thu, 2024-02-01 at 02:56 +0000, Maanya Goenka wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Maanya Goenka <a class="moz-txt-link-rfc2396E" href="mailto:maanyagoenka@microsoft.com">&lt;maanyagoenka@microsoft.com&gt;</a>

Add usrmerge to DISTRO_FEATURES_FILTER_NATIVESDK (and DISTRO_FEATURES_FILTER_NATIVE for consistency),
since we have come across cases where the distro feature would be required by both contexts.
As a supplement to this change, when creating the merged usr symlinks at the do_populate_sdk stage,
these need to be created for both the target and native sysroots within the SDK.

Signed-off-by: Maanya Goenka <a class="moz-txt-link-rfc2396E" href="mailto:maanyagoenka@microsoft.com">&lt;maanyagoenka@microsoft.com&gt;</a>
Signed-off-by : Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
---
 meta/classes-recipe/image.bbclass | 2 ++
 meta/conf/bitbake.conf            | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This doesn't quite follow. "target", "nativesdk" and "native" are all
different separate filesystems and not connected. Yes, you can use
usrmerge on some (or all?) of them but you don't have to have them
match.

Forcing them to match is likely just working around an underlying issue
which needs to be fixed.

What were the real failures?</pre>
    </blockquote>
    <pre>Hello Richard,</pre>
    <pre>Apologies for the late response.

I do agree that target, native and nativesdk are all separate and that you could use usrmerge on some
or all. I understand your point and I'm to blame for the suggestion to add usrmerge to the NATIVE case
for consistency.

The proposed patch is trying to fix an issue for a use case related to systemd.

Newer versions of systemd do not function properly without usrmerge because upstream systemd is dropping
support for non-usrmerge cases, which is typically fine because usrmerge works well for the TARGET.

<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/archives/systemd-devel/2022-September/048352.html">https://lists.freedesktop.org/archives/systemd-devel/2022-September/048352.html</a>

However, we are using some NATIVESDK systemd components that require usrmerge to work as well hence why
we needed to add usrmerge to the NATIVESDK filter since systemd components where expecting usr/foo locations
in the nativesdk filesystem.

While I understand that using nativesdk systemd components may not be widely common, I do believe its a
valid usecase.

I'd like to clarify that I'm not aware of any native systemd usecase and that my suggestion to add usrmerge
to the NATIVE filter was only for consistency, but not required (apologies for that again).

I've reproduced the autobuilder failures locally and I see that taking out usrmerge from the NATIVE filter does
get rid of the errors, if you agree with my statement that nativesdk systemd components are a valid usecase,
we can send a v2 that adds usrmerge to the NATIVESDK filter only to fix such cases.

If you prefer, we could also go one step above that and create a condition to add usrmerge to the NATIVESDK filter
only if systemd is being used or something similar.

Cheers,

Alejandro
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:fac899458e20aa7cac770ce215fc7cb4bfbce513.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

For example, this would stop native or nativesdk sstate being reused
between differently configured builds when it could be.

Cheers,

Richard
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#194983): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/194983">https://lists.openembedded.org/g/openembedded-core/message/194983</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/104089708/4354175">https://lists.openembedded.org/mt/104089708/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------dA5gmKx8FxYV8w0nbv0LvEK0--

