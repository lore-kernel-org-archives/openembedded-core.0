Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9A465EAE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 13:56:02 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id z6so5306223yhz.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=D4hOeJEm7vm5SFN5JK1ig9TZ2qMtpSCYHWUOW9dL0CA=;
	b=gOR24uT24dcpUycdVEvMeONVCbkg3DYOmlaXWE38TjfIOYf+M4YvJct4jn0qjs3hGJ
	1BvR9pn4c6CKX7ceErguMtQgvPDRVEvQ5pIJ8GI2NIcj7Y+pTnrOkXnHR+TBLDvM/0nn
	JybM2cse2Zcj7YR5+da6wrkNhGGprpb3CdMO/+LEd9URBL9tzPpI1pkmWBewsWIpzOs+
	DP+e0Z/14UOPaiFMiTl4GJHkbBT+AHXh1+sZOd6scd1SSiJZC3K8NDENUKgUzeeTcQR2
	Xt38WQt1lVswFYWASxBOEN2A7XukRMCkos67dC4uwATO1oxGtmJS8Wr4c2PLO9o0SKEI
	cNDQ==
MIME-Version: 1.0
X-Received: by 10.236.63.103 with SMTP id z67mr32332029yhc.2.1397224562814;
	Fri, 11 Apr 2014 06:56:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 11 Apr 2014 06:56:02 -0700 (PDT)
In-Reply-To: <5344BADD.5090106@windriver.com>
References: <CAP9ODKoLt=HMhiGQZmQhDUUFm-efPavZRftR7A8Wf7gECw+Amw@mail.gmail.com>
	<533F8B7C.8010409@windriver.com> <5342BC44.2000708@intel.com>
	<5344BADD.5090106@windriver.com>
Date: Fri, 11 Apr 2014 10:56:02 -0300
X-Google-Sender-Auth: IqWGSwEGhMYgsFvYlyFES198UOw
Message-ID: <CAP9ODKo=89kd-3fejPrsqrtgiRxzTkoX6-gNOasiZE2cF5Oj2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][regression] mesa failed to build
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
X-List-Received-Date: Fri, 11 Apr 2014 13:56:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Apr 9, 2014 at 12:13 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> On 04/07/2014 10:55 PM, Valentin Popa wrote:
>> Indeed the build failure was introduced by that patch, which enters a
>> logical
>> conflict with the bbappend file for mesa.
>> To remain compatible with the future releases I suggest to  not remove/add
>> flags
>> from/to EXTRA_OECONF explicitly, and make  use of what PACKAGECONFIG
>> contains.
>> The first part of the __anonymous function from the bbappend file can be
>> simply
>> replaced with:
>>
>> PACKAGECONFIG_remove = "egl"
>>
>> and the second part with:
>>
>> PROVIDES_remove = "virtual/libgles1 virtual/libgles2 virtual/egl"
>> and
>> PROVIDES_remove = "virtual/libgl" if mx6 is in SOC_FAMILY.
>>
>
> Hi Otavio,
>
> Does Valentin's suggestions work for you, please?

I am traveling and won't be able to test it.

However I am quite surprise this didn't come out /before/ when the
dora updates were in test in AB since meta-fsl-arm is tested in AB
too. We need to figure /why/ this broke and for now I think we ought
to revert this dora patch.

This kind of change needs to be coordinated and raise a build break in
an Yocto Project is unacceptable IMO.

For me it is clear this didn't run in AB before merging. :(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

