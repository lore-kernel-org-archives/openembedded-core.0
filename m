Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFC76007C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 22:25:04 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id gf11so3139591vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 15:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=SSMdnrDqitxevRrqqc1ZywIWnyetbbmUXpuppHvJ3hA=;
	b=GXDsqa2hhz/wH+mH/r5CQ7KZ+Z5QWZxx0zZ0fwA7bkbtNWkUVp32FOoD3xTpRaOICN
	+6ZQgBtj/cucEjXqIWxXAv4ly7nbVWbL1MyvXZwODuIrHWpyC5SWjolZSuO0QJ8NFNAn
	48uhu0iro8EpGpBN5ROP5lrs2qBo6XiLzi/bik+9LfeDC0TZ6EsOll4CxVKeAPKfWhox
	qGHOU2Igw1VRRqxNIWUm42R0YONKFclcdjxso0Y48V5CUO9q+Zo6LM/v51uNjYI/1Opn
	+IjpSqUB8j/PINyArQe/eeu9jQoiasCIxtcPwcBOpaWJB4MqFIMjtRt6vIbNnXgQ9xhI
	qRrg==
MIME-Version: 1.0
X-Received: by 10.58.251.144 with SMTP id zk16mr11767295vec.37.1372803411384; 
	Tue, 02 Jul 2013 15:16:51 -0700 (PDT)
Received: by 10.52.114.170 with HTTP; Tue, 2 Jul 2013 15:16:51 -0700 (PDT)
In-Reply-To: <2559197.ry45lNsPXD@helios>
References: <1372787148-9023-1-git-send-email-elizabeth.flanagan@intel.com>
	<1372791267.2074.25.camel@pb-ThinkPad-R50e>
	<CAPhnLPBiYU6CGXZV-Y8khPD593iGO5AtgHMeFRMHtf3hG8jNnw@mail.gmail.com>
	<2559197.ry45lNsPXD@helios>
Date: Tue, 2 Jul 2013 15:16:51 -0700
Message-ID: <CAPhnLPBYnQViXa8qY7dYqC7NzQYw4ceqLTimpngwXW8Jh-TbJA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnCep4BEKyruvmZzUYgr/PGHxLb1WqiC3ovPlRMee/tvTBaptX67iUtSPZdVlN+zp0xqYLG
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] layer.conf: Bumping LAYERVERSION_core
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
X-List-Received-Date: Tue, 02 Jul 2013 22:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 2, 2013 at 2:50 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Beth,
>
> On Tuesday 02 July 2013 12:20:00 Flanagan, Elizabeth wrote:
>> This goes back to my RFC:
>>
>> http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39016
>
> Sorry, I meant to reply to that email and didn't get around to it, my
> apologies.
>
>> As we are removing meta-toolchain* and replacing it with bitbake
>> <imagename> -c populate_sdk this causes issues with those of us who
>> need to do automated builds both on the current development branch and
>> on prior development branches.
>>
>> Example: For prior releases, I need to build meta-toolchain*. Without
>> having a simple way to figure out where this is no longer the case, I
>> (and other folks who run automated builds) end up having to jump
>> through a lot of hoops trying to figure out where this layer changed.
>> Utilizing LAYERVERSION_* to do it makes sense as there is a
>> significant change that would cause issues for build engineers. Prior
>> to this I was utilizing LCONF, which was the wrong solution, but just
>> happened to work in the example I'm thinking of.
>
> I can definitely see this being useful as something you can do a conditional on
> within the autobuilder code; however the original intention was that
> LAYERVERSION would only get bumped on changes that would break other layers
> (being that it was designed to match up with versioned layer dependencies) and
> I'm not sure this is one of those changes.
>
> This situation has come up a lot over the life of this project, and I wonder
> if it's time to look at having something a bit more organised - perhaps part
> of the static configuration of the autobuilder could be within the metadata,
> i.e. just the values needed to specify the right version-specific behaviour?
> For the purposes of the Yocto Project autobuilder we can add the needed
> definitions in the meta-yocto layer rather than needing to modify OE-Core.
> Could that work?
>

I really think that this is something that needs to be at the
individual layer level. One of the other reasons why is that, while
admittedly, the yocto-autobuilder is my main concern, I can see people
utilizing a lot of different autobuilders or even different
yocto-autobuilder configurations. We obviously can't track those, nor
should we.

When things change in oe-core (or any layer) enough that an image
definition disappears or changes the way we compose bblayers.conf or
auto.conf, there needs to be something that I can utilize as a
conditional so I can maintain backwards compatibility.

I've been lucky so far in that the times these have come up I can
usually peg off of LCONF_VERSION or a branch name as long as I never
need to build a prior version of the branch. But that is a really
lousy solution that has caused me no small amount of headache and I
can see the instance coming where this is not a viable solution. I'm
more than happy to hear an alternative solution though that helps not
just the yocto-autobuilder but also anyone else utilizing a different
CI system.

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

-b

-- 
Elizabeth Flanagan
Yocto Project
Build and Release

