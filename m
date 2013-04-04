Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UNdrQ-00050e-IT
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 08:41:25 +0200
Received: by mail-oa0-f47.google.com with SMTP id o17so2359786oag.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 23:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9wXEqfthr0D+cZxfn41tJo2X6Dm/9JxTzqYjXIVxATI=;
	b=Z3zpKoXdMEUh0Jkqb5wWJev1ll8OJl0P03zSLZYPQklrUVZjrSe8w2iNcfr62Duw3V
	P5W2dKd5iUquDmDHsjxG+SvicieAHBKKryiTawmEhQQ6hea0kKy7Pbr/UPmmFThdA/Wc
	E9Cb7a7ZIiUDgcgI5o4uezsauo+5VUopFFJE1y5mxUcvgs58tYtzG1iZgtXegPD23Gvm
	bojf4xltf7iseHkrhzXWFPCjT62crKMiffrpp9fvi5WuDg9R/oQ8486AyTKmt+hb2L8l
	WCDMOOAFlD+mFTHCeThUiSdrxo1+sa/mFls4nH2GlpGdx1akSmiSFEMswiUDPwH6CiM2
	yjOA==
MIME-Version: 1.0
X-Received: by 10.182.40.71 with SMTP id v7mr3050704obk.85.1365056651707; Wed,
	03 Apr 2013 23:24:11 -0700 (PDT)
Received: by 10.60.46.69 with HTTP; Wed, 3 Apr 2013 23:24:11 -0700 (PDT)
In-Reply-To: <1365002659.6526.45.camel@ted>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<1365002659.6526.45.camel@ted>
Date: Thu, 4 Apr 2013 08:24:11 +0200
Message-ID: <CAGiJk9cP1GwyhBGxzsGqRRUzTaRWc6d7eXf3Hz-0MX1VF=Um=g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 06:41:26 -0000
Content-Type: text/plain; charset=UTF-8

2013/4/3 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Wed, 2013-04-03 at 16:51 +0200, Samuel Stirtzel wrote:
>> 2013/4/3 Burton, Ross <ross.burton@intel.com>:
>> > Hi,
>> >
>> > On 2 April 2013 15:15, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>> >>>>> For xserver-nodm-init we would then have something like:
>> >>>>> inherit update-alternatives
>> >>>>> ALTERNATIVE_${PN} = "systemd-def-target"
>> >>>>> ALTERNATIVE_TARGET[systemd-def-target] =
>> >>>>> "${systemd_unitdir}/system/graphical.target"
>> >>>>> ALTERNATIVE_LINK_NAME[systemd-def-target] =
>> >>>>> "${systemd_unitdir}/system/default.target"
>> >>>>> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
>> >>>>>
>> >>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> >
>> > This really needs to be a series of two patches, with this change
>> > implemented too.
>> >
>> >> To comment on this change:
>> >> A developer would expect that a system (hardware or software) behaves
>> >> in a specific matter (the default behavior).
>> >> By changing the default, the system behavior is undefined (as the
>> >> default behavior was changed).
>> >
>> > The behaviour is not undefined, it's perfectly clear - the default
>> > target is multi-user unless changed, and by patching the X startup
>> > recipes in oe-core and meta-oe we handle the majority of cases.
>>
>> When we decide that we handle standard behavior different than the
>> rest of the world, then this patch is basically a fork of systemd.
>
> No, we're not forking systemd, we're talking about configuration.
>
> This is like saying that booting your Linux desktop at a different
> runlevel is forking Linux.

No, by changing a standard configuration that requires other changes
to repair things that are already working you are far beyond
configuration.

>
>> Also we tell every affected software developer:
>> "No your software won't work with OE-core / Yocto Project without
>> adaption, we are incompatible with the systemd standard to make life
>> more comfortable for (some of) us"
>
> We're saying that graphical init scripts need to somehow tell the system
> they're a graphical init script. There are only a small number of these
> out there and adding some identification to them whilst an annoyance,
> isn't a big issue.

No, you are saying the default in systemd is non-graphical target.
Why not tell the system that a non-graphical image needs multi-user.target?
It would be compatible to the rest of the world and would archive the
effect you want.

>
> Integrating new technology like systemd into older systems is hard. You
> sometimes need to add new information to allow the system to work
> properly. This is once such case.

This change is not related to the struggle of upgrading from sysvinit
to systemd.
Even new systems may have this problem, and I don't tell you to ignore
it, but I am trying to contribute to fix it properly.
I hope we can get a solution without the avalanche that breaks
everything affected for no necessary reason.



--
Regards
Samuel


