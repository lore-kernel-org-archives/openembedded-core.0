Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 360EF79279
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 19:31:33 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id s17-v6so2013394vke.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kYmCYlJYZmyVYagaoicIjbr3qyJjGUARZpKQYn1e4Cc=;
	b=l8gNubAOz5cWT8C7SZcT1PQJUkre0NpQ/cRw/02LYYazc91Lqmth3kwi6iZfb8tGaj
	2IJeM1+7uFlIpl8vA5hzdKy9XNo/bYSGKGWhICxMKWADW7ikSDlk3GqPMEww1Z059ItH
	rrd4vvotdx8b/4V2DqU+qM8IM6xLRTE0KiALZuJ35XNs7kGQJDKiyoBuVM45dafgFGXM
	AtdmwJt8QRhGQY4P+kYuBBEwB+zE+ne1rZ9GO07oChlyjLxk7rdfVEOvt3sg3ADepPBP
	FQsJkQ4fnYd1Jjqm8QiKuTYyEvzK2yafI1KH9PE2CIKl+iTVtB5mkUwDIZA6o8mOvxJ9
	dRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kYmCYlJYZmyVYagaoicIjbr3qyJjGUARZpKQYn1e4Cc=;
	b=g1U9akeBcucW5hRx37T+N7qphM3TtkltHhRRKjAdyKKffjU4WGfgVqqcz7XVvkqn/t
	M377ZeZCyYVZWfwf3c5sw0DMRMyvENJjwI3AtcUaSZKZrO4JEX1S3GImNnJdzmo26VEV
	3T4SmvdrQhiZoOXOMLoPQhHAEbPIRx6vRozwVLyNR9ldZuXeplYRQufpf9C+geyh5b2L
	H9Rk+judgZNyCConaQxr13SBWp/nWmuuLUOwIl3NH+XaFKmBWGy1qj6fCmHGA1nSYNOp
	FPs6o7aINdpsek2yCEaY6D+TG9x11g5aUsXtjN5r2NqObv+IOGb/DH5lRgxO0sc0GcVe
	UsAg==
X-Gm-Message-State: AOUpUlEOvHMDm48nn59ESGyR4ZtfOKsSbV06b2BA/wBSfh7n+6pbzspg
	8u9EH5VWYls8w0LTLDYfUP1bB5eTpLp3fyV6fNY=
X-Google-Smtp-Source: AA+uWPzuUJlJwSlY/DKr/V2Fzlb2Vvo/wiitdrpVOBdHumA9+88Z+n/QF7S4i39PJzb4oUIC34j6XYjewxiiZ5smUMY=
X-Received: by 2002:a1f:10ce:: with SMTP id
	75-v6mr20252451vkq.83.1534447894937; 
	Thu, 16 Aug 2018 12:31:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 16 Aug 2018 12:31:34 -0700 (PDT)
In-Reply-To: <20180816062633.29868-1-anuj.mittal@intel.com>
References: <20180816062633.29868-1-anuj.mittal@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Aug 2018 12:31:34 -0700
Message-ID: <CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: enable profile optimized builds
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
X-List-Received-Date: Thu, 16 Aug 2018 19:31:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 15, 2018 at 11:26 PM, Anuj Mittal <anuj.mittal@intel.com> wrote:
> Enable profile guided optimization (pgo) for python3. Enabling pgo in
> python is generally as simple as invoking the target profile-opt which:
>
> - builds python binaries with profile instrumentation enabled,
> - runs a specific profile task using that python to get the profile
> data and,
> - feeds the compiler with this profile data and rebuilds python.
>
> This change invokes qemu-user for the second step of running a profile
> task using target python. Depending on how long profile task takes to
> run, this might add a significant time to compilation (which would be
> true for native builds too). The default profile task can be changed by
> the users depending on what makes sense for their use case (or can be
> left empty). In case qemu-user isn't supported, profile task won't be run.

Is it important to re-create the profile data during every build or
would we get most of the same benefits from using reference data which
is generated offline? How big is the data file? Is it binary or text?
Is the data expected to be target architecture specific?

If reference data were used, what are the consequences of the data not
corresponding exactly to the current build configuration? A build
failure? Or just a decrease in the effectiveness of the optimisation?

Does the profiling instrumentation measure execution timing? Or only
the frequency / order in which functions are called? ie is there any
concern that data generated from running under qemu may not be optimal
for running on the target?

