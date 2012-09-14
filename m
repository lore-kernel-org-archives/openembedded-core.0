Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TCeXE-0006DZ-07
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 00:38:52 +0200
Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 14 Sep 2012 15:26:06 -0700
Received: by qatn12 with SMTP id n12so321694qat.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 15:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=ICQhOvE9WUpw2IveIp9AzhJeJHeDNXEujGx+EgCf1NQ=;
	b=RiFn+/VYaCKCb0JnwUYrOHeVylqhQ6kx6oYAlKg373I3eC3o92b9II8SqYVWwbE8PX
	/BK25HERWL5REw3M+PHhnWOEDnJz9z6oAwJgk0T/Pnk71/S2faQukTfzuNo96szMAB3X
	7wna3GLECIGRqEeDsXWbOp6zBjEove/2ZYhjwkjJoklmNQpdWPRhAO8t+TOfWqVYZuEd
	YPrmwDMV24Jf89SGeHBsPli9x3dPou22aQ+DjU2zVV9LJzOns1ExNsXuKUuCYmQoMX1K
	yZX93G5s7KWAkEm6lNQMjY2eLDP3CAw2/4WqQ0i+8Ac02erD5wAwMbZ7X9IC5MK7f3PC
	1p8w==
MIME-Version: 1.0
Received: by 10.224.221.206 with SMTP id id14mr10581848qab.66.1347661574689;
	Fri, 14 Sep 2012 15:26:14 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Fri, 14 Sep 2012 15:26:14 -0700 (PDT)
In-Reply-To: <1448670.txDjULYI9R@helios>
References: <1347564379-14252-1-git-send-email-sgw@linux.intel.com>
	<50535FC5.9040802@windriver.com>
	<CAPhnLPA6GodRgpEKwyCdbVPOdv+s3nW3zp2rDUhuj3xw=K3L+g@mail.gmail.com>
	<1448670.txDjULYI9R@helios>
Date: Fri, 14 Sep 2012 15:26:14 -0700
Message-ID: <CAPhnLPCiGmrMy37wamXS-8X94d_XFKGYkmm8HHXJnCvKgPOc3g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkW6aB1i8zH3k0hasHt1buzqAChktC6lFkyiAYhE47Umi4MAmRZjT3G74Tnxcf5qjewaOda
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] license: Ensure we find multilib packages also
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
X-List-Received-Date: Fri, 14 Sep 2012 22:38:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 14, 2012 at 3:11 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 14 September 2012 13:50:22 Flanagan, Elizabeth wrote:
>> We really shouldn't be relying on package data at all for license
>> manifests. As the manifests are relying on list_installed_packages,
>> they end up inaccurate anyway as list_installed_packages does exactly
>> that. List software installed via package. Not installed via the
>> package manager? Then you aren't in the manifest. This ends up missing
>> quite a few things necessary from a release engineering standpoint
>> (like, hey, modutils? The kernel? Not listed in the manifest. IMHO
>> this is wrong.)
>
> What do you mean by modutils? If you mean the earlier suggestion that module-
> init-tools was missing from the manifest, I'm fairly certain that was a
> misunderstanding because of it being replaced by kmod.
>

Correct. Even so, there are things obviously missing from the
manifests. Kernel is the most obvious.

> The thing is, we have no other means of accurately determining the contents of
> the image than the installed package list, given that the package manager is
> ultimately in charge of resolving and installing dependencies during image
> creation. The list may not cover additional files copied into tmp/deploy as
> part of building the image (kernel, bootloader, etc.) - however, that does not
> make it inaccurate as to the contents of the image, let's be clear about that.
>

No, but it's like the joke about the two software managers in a hot
air balloon asking the engineer on the group where they are only to be
told "In a hot air balloon". It's technically correct but the user
case I keep running into here is that people want to know what they're
deploying with a product. The expectation people have (and right or
wrong, it's what I keep running into) is that everything that's on the
hddimg is what is on the manifest.

> I agree we do need to write out the license information for these additional
> files; however, since they aren't actually *in* the image itself, I think we
> need to list these in a separate file. What happens for example if the system
> builds u-boot as a result of building my image, but I don't ever end up
> distributing that with the image?

Then you have a manifest that has software that you end up complying
with the GPL (when you don't really need to) verses having a manifest
that doesn't list software which you do need to comply with the GPL.
Both are wrong, but one is more wrong.

RP is right here. We probably need to list a few different use cases
here and support the most common ones.

>
> As to the mechanism for picking these up, the only real possibility I can see
> is to hook into do_deploy; this is not currently straightforward though since
> that's not something that is implemented generically at the moment.

I'm currently hooking into do_package because, as best I can figure it
out, everything ends up getting packaged, even if it's not installed
via package. I'm happy for other suggestions though.

-b

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


