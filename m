Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 84E506025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 20:42:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so8095090wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 12:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4pdsx9PU6VSAHe9QK3Vth8/XGTR0A5fAc7llFF2lgYo=;
	b=ugVtGWoqXhmiQ4zHS66M2XwpJLUGRIm7XHNceSJbKEry+O1Rg8QDRnId0cYuecrS2r
	zfMNtGPlonxChRygvxr1zZh2SWEuiOZJdd1gR/wk7OEo+bX3CJfNynJC7ZwPFZEVKIZM
	ll15+ihFp0dTXJXGu2R+h0JN2MnDMpu4Hi3TpRae12Zo5Y5zTjqVA6yG+XQscQ/0jHKQ
	bCOOQc/RDSL1rrM3TLn8lmqLr9sQ1nPdGpqSqQlS8gcqRHYgp/eZsBzLNWtR2aHKGN/K
	Helxh9fTsR4tjA7qN8uKSILvzpEOmx+vgPom3DYU4FPGLMq76tr37o3Yi0CCWNdMqmkB
	u4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4pdsx9PU6VSAHe9QK3Vth8/XGTR0A5fAc7llFF2lgYo=;
	b=HI+HLoj0EkM0K3F+JHbTqyigfpfYcE2RQH0dy9S64M9BTyc3tNgn8y6wzKGr8B63Sj
	xTO1C9q1a+aAA+/FKYTjesc3jYxAtVa6IwkSu4Ve7WnDZSdtYVk86N5z16JbPZ+YwHEQ
	BKvduai4XlxlK28U/G2yNFoaEnGWZLmxf6XKfo7ZFHwbktLcAT6ZcfZsVSmaF3AHaqJi
	BZureHhWAT1nw5ciHF5GBFpqHStZmmM4NeIFcKzo2Udpud9d/WiaVeI2uZKAtYbIDneV
	Ul9bCS13H8S9iqzH66y91EHxZioFJEpgVUWf6M2Fc9OLIgBscTLz1WKMRfKLsuj9KeyO
	AanA==
X-Gm-Message-State: AIkVDXIw8qe8YACLFrRedsREZ+qYEA7XPG7dsRYqhpA0SVWrYFRTtEuhQ+JScx16VwVJ0BpUhWIRKoTX4xmSFQ==
X-Received: by 10.223.149.39 with SMTP id 36mr20029374wrs.125.1485808974203;
	Mon, 30 Jan 2017 12:42:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.98.164 with HTTP; Mon, 30 Jan 2017 12:42:53 -0800 (PST)
In-Reply-To: <CAMKF1spAAtA=vjmUYx-WrpTmZjXrh0bdEmmesO=NS8BYEfNY8w@mail.gmail.com>
References: <1485489993-29677-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spAAtA=vjmUYx-WrpTmZjXrh0bdEmmesO=NS8BYEfNY8w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 30 Jan 2017 12:42:53 -0800
Message-ID: <CAJ86T=X6SmEw9eJQAmmGUuq33e2vreHAuGZ77WDC1dHwwEsymg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: respect USE_LDCONFIG when setting default PACKAGECONFIG
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
X-List-Received-Date: Mon, 30 Jan 2017 20:42:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2017 at 10:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jan 26, 2017 at 8:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Avoid trying to call ldconfig at run-time in distros which force
>> USE_LDCONFIG to 0 and therefore don't provide it.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-core/systemd/systemd_232.bb | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
>> index cc8781e..cfe6958 100644
>> --- a/meta/recipes-core/systemd/systemd_232.bb
>> +++ b/meta/recipes-core/systemd/systemd_232.bb
>> @@ -39,8 +39,10 @@ SRC_URI_append_libc-uclibc = "\
>>  "
>>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>
>> +USE_LDCONFIG ?= "1"
>
> now that we have more recipes using this variables. I think it should
> to global config space. May be have it as a DISTRO_FEATURE is more
> appropriate

Patches for both approaches have now been sent to the list.

>> +
>>  PACKAGECONFIG ??= "xz \
>> -                   ldconfig \
>> +                   ${@base_conditional('USE_LDCONFIG', '1', 'ldconfig', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

