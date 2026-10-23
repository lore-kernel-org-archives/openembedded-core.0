Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15528.1792785951682932423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 13:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@myspectrum.nl header.s=transip-a header.b=BC212Q0J;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.9, mailfrom: oe@myspectrum.nl)
Received: from submission6.mail.transip.nl (unknown [10.103.8.157])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4jBDXs0QQSzHT9x
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 22:05:49 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission6.mail.transip.nl (Postfix) with ESMTPSA id 4jBDXr1FY3z3ZVDrv;
	Fri, 23 Oct 2026 22:05:48 +0200 (CEST)
Received: from [192.168.178.17] (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 704B220071;
	Fri, 23 Oct 2026 20:05:47 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <06e1700c-7028-4a57-9b20-fb3bd141862d@myspectrum.nl>
Date: Fri, 23 Oct 2026 22:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH scarthgap 00/19] Disable compromised CA
 certificates
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission6.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1792785948; h=from:subject:to:
 references:in-reply-to:date:mime-version:content-type;
 bh=4SMouWunXQ+DZPYFWdqWIkpaVaw6CbcOsVUBqn8FdLY=;
 b=BC212Q0J7X9QDACHljJVlVYZwpC+/Cnr9i5Vk9sh56LavnrDyDEvQq9C/ej+VDZPH9oFyH
 qcjE07i4UvcEXTFHsXdkBlG1MhiRCzowNxNtum1GftvCu9XfHU41Q8yEgUTZ+Lr3aebAZ3
 Ls9QKysYNq14OiqwCxjpK7mEuak2VdO55yWlkMVKom0D7LYn4TMNFvi3yThym4dfarq3dj
 JrhXUUhuw0MJy4olWs67RRIyX9LaLRXzo8a1CpMPuwWiIax/Dc0nyMMCyrKiwiKsdm6Z/p
 H/XHLy2EQUXwixPFVKTTZae8E4fImJs1fUobh/dq1gGWE5u/m7fYUjSGwzJjjQ==
X-Report-Abuse-To: abuse@transip.nl
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 20:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248566

Hello Paul,

For what it is worth, [1] should do the same for scarthgap / 
python3-certifi,
but without porting all new versions back. I don't really mind which 
approach
we take.

[1] 
https://github.com/victronenergy/openembedded-core/commit/4b6650b6cf7d5ebcd60a0bd41c7d9bda3a750a21

Regards,
Jeroen

On 10/23/26 12:50, Paul Barker wrote:
> These changes update ca-certificates & python3-certifi for scarthgap to
> handle the fallout of the recent Emudhra CA certificate compromise.
>
> These patches have already passed testing on the autobuilder, they will
> be merged to scarthgap outside of the usual stable review process once
> they have landed in blacksail & wrynose.
>
> As a consequence, the build backend for python3-certifi is changed to
> python_setuptools_build_meta and support for Python 3.6 (EOL since
> 2021-12-23) is dropped. Both of these are considered acceptable. See
> commit "python3-certifi: upgrade 2025.4.26 -> 2025.6.15" for details.
>
> Branch: https://git.openembedded.org/openembedded-core-contrib/log/?h=pbarker/certs-scarthgap
> AB Build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4976
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
> Alexander Kanavin (1):
>        python3-certifi: upgrade 2025.8.3 -> 2025.11.12
>
> Leon Anavi (1):
>        python3-certifi: Upgrade 2026.1.4 -> 2026.2.25
>
> Paul Barker (2):
>        ca-certificates: Disable compromised CA certificates
>        Revert "python3-certifi: Fix CVE-2024-39689"
>
> Richard Purdie (2):
>        python3-certifi: upgrade 2024.12.14 -> 2025.1.31
>        python3-certifi: upgrade 2026.2.25 -> 2026.4.22
>
> Ross Burton (1):
>        python3-certifi: upgrade 2026.7.22 -> 2026.10.19
>
> Tim Orling (6):
>        python3-certifi: upgrade 2024.2.2 -> 2024.6.2
>        python3-certifi: upgrade 2025.4.26 -> 2025.6.15
>        python3-certifi: upgrade 2025.7.9 -> 2025.8.3
>        python3-certifi: upgrade 2026.4.22 -> 2026.5.20
>        python3-certifi: upgrade 2026.5.20 -> 2026.6.17
>        python3-certifi: upgrade 2026.6.17 -> 2026.7.22
>
> Wang Mingyu (6):
>        python3-certifi: upgrade 2024.6.2 -> 2024.7.4
>        python3-certifi: upgrade 2024.7.4 -> 2024.8.30
>        python3-certifi: upgrade 2024.8.30 -> 2024.12.14
>        python3-certifi: upgrade 2025.1.31 -> 2025.4.26
>        python3-certifi: upgrade 2025.6.15 -> 2025.7.9
>        python3-certifi: upgrade 2025.11.12 -> 2026.1.4
>
>   .../python/python3-certifi/CVE-2024-39689.patch    | 69 ----------------------
>   ...i_2024.2.2.bb => python3-certifi_2026.10.19.bb} |  7 +--
>   ...mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 +++++++++++
>   .../ca-certificates/ca-certificates_20260816.bb    |  1 +
>   4 files changed, 38 insertions(+), 74 deletions(-)
> ---
> base-commit: e95fc48cd797a013178c71d374810e2c08917d0f
> change-id: 20261023-certs-scarthgap-c5343b3616c2
>
> Best regards,
> --
> Paul Barker
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248517): https://lists.openembedded.org/g/openembedded-core/message/248517
> Mute This Topic: https://lists.openembedded.org/mt/121898134/9720520
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [oe@myspectrum.nl]
> -=-=-=-=-=-=-=-=-=-=-=-
