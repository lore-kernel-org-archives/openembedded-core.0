Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 04068723B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 17:11:36 +0000 (UTC)
Received: by igcxg11 with SMTP id xg11so25736760igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=7I8RA6mqK/FO2DnLxu743DDPPFOCZ76zq8wmHiKKhrc=;
	b=Znar9eOEm3IAbDa2Xqzrc//5rrI4Kp5Tqf9OqKBqHDOnt3ixHkHF8mRj1ggLgOvQB0
	o4HCG4uyXOVl7Vnw3Rv9i3dnNcaSvEtMglQJVVBvMsiH+t7M8F5aAUI3bF50kZOZ0Cr7
	liicTSBGB6H2mG9pndOspvGO/q5AuP3U7TUKsc4VwqdBsYZSt15WinuFWSAj8+EDf6Hi
	ky9q3e9j3M8RX+LuHWaD2h9llUBMPiBJTky7Jza8En4hMMJxGGsYs/5YJN4S+S95zzp/
	/M8tyeEzM+Kl/ZAJKuaTyp8yaHE1jFRipyrLywgtok9Wl9z73aeKWP4SDhZX/Nq5XmkU
	xpTg==
MIME-Version: 1.0
X-Received: by 10.50.43.130 with SMTP id w2mr46168254igl.30.1427476297754;
	Fri, 27 Mar 2015 10:11:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Fri, 27 Mar 2015 10:11:37 -0700 (PDT)
In-Reply-To: <1427476146.2868.3.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
	<20150326082923.GA7370@ad.chargestorm.se>
	<CAP9ODKr7QnmGCFfh+HnB1d_TE0CDCkqSgG75if11E_Z+CMq5sA@mail.gmail.com>
	<1427377220.2918.8.camel@bottazzini-ThinkPad-T430>
	<20150327145747.GE21905@ad.chargestorm.se>
	<1427476146.2868.3.camel@bottazzini-ThinkPad-T430>
Date: Fri, 27 Mar 2015 14:11:37 -0300
X-Google-Sender-Auth: lx2_D1OxJbxZ0byJFQF53xoT_Mc
Message-ID: <CAP9ODKp5iZEjD2RXsLzD_s92gcqke_mGS7jxF0XG4YRUXww_cw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Anders Darander <anders@chargestorm.se>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: split modules into packages
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
X-List-Received-Date: Fri, 27 Mar 2015 17:11:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 27, 2015 at 2:09 PM, Bottazzini, Bruno
<bruno.bottazzini@intel.com> wrote:
> On Sex, 2015-03-27 at 15:57 +0100, Anders Darander wrote:
>> * Bottazzini, Bruno <bruno.bottazzini@intel.com> [150326 14:40]:
>>
>> > On Qui, 2015-03-26 at 08:56 -0300, Otavio Salvador wrote:
>> > > On Thu, Mar 26, 2015 at 5:29 AM, Anders Darander <anders@chargestorm.se> wrote:
>> > > > * Bruno Bottazzini <bruno.bottazzini@intel.com> [150325 22:50]:
>>
>> > > >> if one wants to launch a simple deamon, most modules are not
>> > > >> required.
>> > > >> He will be able to save space and exclude unwanted packages
>> > > >> from the final image.
>>
>> > > > I like this, though I've got a few questions that I just noticed.
>>
>> > > >> -PACKAGECONFIG ??= "xz ldconfig \
>> > > >> +PACKAGECONFIG ??= " \
>> > > >> +                   gcrypt \
>> > > >> +                   kmod \
>> > > >> +                   ldconfig \
>> > > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
>> > > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
>> > > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
>> > > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
>> > > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
>> > > >> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>> > > >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>> > > >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
>>
>> > > > It might be worth noting that xz has gone from being explicitly enabled,
>> > > > to depend on a DISTRO_FEATURES.
>>
>> > > Agreed and we shouldn't explode the number of possible dsitro
>> > > features. I'd also prefer if xz were kept enable by default so we
>> > > don't make a behavior change under the hood.
>>
>> > > ...
>> > > >>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
>> > > >> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
>>
>> > > > Why do you remove networkd as a PACKAGECONFIG?
>>
>> > > If there is a real reason for this, it must be recorded in commit log as well.
>>
>> > Guys, if you continue this patch you will see that networkd will always
>> > be enabled. Systemd will always configure/make it however, the package
>> > will not be installed if the user wants to.
>>
>> > With PACKAGECONFIG, we may not get everything "for free" as some data
>> > files will be installed regardless as well as some components from
>> > systemd cannot be disabled by their build system but we can run without
>> > them, for instance we can run without journald.
>>
>> The advantage of also keeping the PACKAGECONFIG for e.g. networkd (and
>> as much other things as possible) is that we're also reducing the build
>> time and size. Sure, it might not be by much, but all small bits are
>> valuable.
>>
>
> You are right! Maybe we should mix them ?
>
> e.g. if PACKAGECONFIG networkd is disabled then the package
> systemd-services-networkd will not be included.
>
> What do you think?

You can add the files conditionally so these empty packages won't be generated.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

