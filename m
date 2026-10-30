Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1420.1793397832712206068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 15:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=QMhJH7a1;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.17, mailfrom: oe@myspectrum.nl)
Received: from submission14.mail.transip.nl (unknown [10.103.8.165])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4jGZqn3nvgzTPNPy
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 23:03:49 +0100 (CET)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission14.mail.transip.nl (Postfix) with ESMTPSA id 4jGZqm5vtsz3RgQtt;
	Fri, 30 Oct 2026 23:03:48 +0100 (CET)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 7BBB220155;
	Fri, 30 Oct 2026 22:03:47 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <2b344c11-ae83-4579-8431-eb0370ea7167@myspectrum.nl>
Date: Fri, 30 Oct 2026 23:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH scarthgap 00/19] Disable compromised CA
 certificates
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
 <18E1415384CA8ABA.3062525@lists.openembedded.org>
 <8968080d-ebc1-40f4-a2ff-9ce05b67ceea@myspectrum.nl>
 <338ca9bacb931c03c9701c43e3f50f0642019958.camel@pbarker.dev>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <338ca9bacb931c03c9701c43e3f50f0642019958.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission14.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1793397828; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=tg5tioWQKjHO9QNvIuEx+lX/66hJm9cDLRDLiO/LiqQ=;
 b=QMhJH7a1oW2OpwZNbjvH/Kl9mv2ieiik7fZ8MtceXQokiEOW9jo3MaikgDdXT/UyTgjPPu
 MmX69qOGglgE4I8IIs7Fzz+rVHCUGPOim23zIWKSk6pBcYuJYZR/+FInW9/yEgVj2bDbQT
 oYZGTODDUn+rh5cXA39XtKnvuQnZ3R+BDaEG2uQH/bQaFjfgqYR4rbZs1k7vpz9bHgMbE5
 bXo4uv0fOKW9dOoWZS4lz/2ogxg5XvJ/evAKCj/kzccCQhDH3GlyGTGzL+Pp3Nw65vO/m9
 0u9dQJ+uNrzhANSqLg4GfT6DNsFPJu1ORI9omFucgrcldVLCzwpi+f2iK42tqw==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 22:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249074

Hi Paul,

On 10/24/26 10:47, Paul Barker wrote:
> On Fri, 2026-10-23 at 23:10 +0200, Jeroen Hofstee wrote:
>> Hello Paul, sorry again,
>>
>> pip has the same problem,
>> https://github.com/victronenergy/openembedded-core/commit/867c6f1f48bf8bec3a6b394dcde26f97ba1413a7
> Hi Jeroen,
>
> It goes much further than this! If you want the full horror then look at
> the NixOS tracking issue [1]. They identified 883 packages in their
> collection which embed a copy of the CA certificate store. We probably
> have less than that, certainly in OE-core, but getting this fixed fully
> is going to take time.
>
> For python3-pip blacksail is on v26.2.1, and v26.2.2 is just a fix for
> this single security issue we can cherry-pick that to blacksail easily.
> For wrynose & scarthgap though we need a targeted backport patch. What
> you have in your victronenergy fork of OE-core looks right - please
> could you submit that to the list for wrynose & scarthgap?
>
> [1]: https://github.com/NixOS/nixpkgs/issues/576475
>
>
Yes, this is worse than I would have guessed. This pip showed up
in a local scan, which already surprised me. As zipped copy of that
surprised, inside python, surprised me even more. (it is in
python3-misc if you are looking for it).

The interpreters and libraries seem to actively add code to revoke
them. It is a bit of a pity that that is required.

Anyway, I submitted the wrynose version and will see if it gets merged.
I can easily submit the scarthgap version as well.

With kind regards,
Jeroen

