Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 10FE0731CA;
	Wed, 13 Jan 2016 00:22:57 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f206so346837320wmf.0;
	Tue, 12 Jan 2016 16:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pztw79/laDp3lUO8wGawlXwpNRrilyW7sPC1SHOPvOY=;
	b=kvCntet8svDrN71LmwodDxTlX8w/uU7j+qmx+u8Vjvm3Pbmpm8va3ht2gh+YsUJb/q
	MWxAknZ1fjNH1Xgqa/1NeoKuHjLIq4PL8+mcO5zBk+EZGAih1aYOM01mxPDcFScviDc0
	XlekRckggRAaqt9J+Mumv3xWRdMzvqx9A6iPERmKwMMjw8KcOfSAFXTE/oTVfBKFlgTs
	nCxAF2Lar8UY41LVhs+OYn8wyuYz/v0FFPCoSmM2ErASxOjJH5LkidmbylxOuJeKL4/8
	s5Z42tSJZ3NGFU/EWXSTN51jnwDGUk+iyCOCoRX289SBKdnOyxP5/rzR2ygVPYtFqmBZ
	8fAQ==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr140747213wjf.43.1452644577817;
	Tue, 12 Jan 2016 16:22:57 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 12 Jan 2016 16:22:57 -0800 (PST)
In-Reply-To: <CAMKF1spYKDvYh2uvVBVqesyFM0_jAdYYTBnzEnOfQ-YQXw-xsA@mail.gmail.com>
References: <39606447-07D3-4F1F-93A1-CB9C77114535@gmail.com>
	<1462345.ZzKELdxCEg@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1spYKDvYh2uvVBVqesyFM0_jAdYYTBnzEnOfQ-YQXw-xsA@mail.gmail.com>
Date: Tue, 12 Jan 2016 16:22:57 -0800
Message-ID: <CAJ86T=XNsV6gVhFvN2EEDbTV=FWaDL+XnLJjBj5t9kJVfViirg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Cached size of off_t
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
X-List-Received-Date: Wed, 13 Jan 2016 00:23:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 12, 2016 at 4:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jan 12, 2016 at 4:09 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Tue, 12 Jan 2016 15:23:33 Khem Raj wrote:
>>> Hi
>>>
>>> We cache size of off_t in site files and the value is 4 in most cases
>>>
>>>
>>> meta/site/arm-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>>> meta/site/ix86-common:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>>> meta/site/nios2-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>>> meta/site/powerpc32-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
>>> meta/site/x32-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
>>> meta/site/x86_64-linux:ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=8}
>>>
>>>
>>> However this value is wrong when largefile support is enabled (which is
>>> default) on most OE based distros. It also lands us in nasty bugs which are
>>> complicated to uncover eg. the curl issue
>>>
>>> http://git.openembedded.org/openembedded-core/commit/?id=3c58712465494e441c4
>>> 036a7cf21d2e6d343efab
>>>
>>> and just in OE-Core more e.g. grub2,libsndfile1,pax are showing same
>>> symptoms.
>>>
>>> I think this value should be left for configure to compute and
>>> autotools.bbclass should pass --{enable|disable}-largefile based upon
>>> DISTRO_FEATURES enabling largefile support
>>>
>>> Do we see any downsides or point I might have missed
>>
>> IIRC I think the issue was older configure scripts without the capability to
>> compute this properly (where we're not auto-reconf'ing them).
>
> Thanks Paul.
> I think in that case it is better to move that into the concerned
> recipe and let defaults be reversed

How do these older configure scripts work today for MIPS and SH4 which
don't seem to define ac_cv_sizeof_off_t in their site files?

>>
>> Ross, any thoughts?
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

