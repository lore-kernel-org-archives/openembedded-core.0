Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAA9C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 07:07:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.43337.1752736057461859879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 00:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GqIqZlbF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B91EE444A4;
	Thu, 17 Jul 2025 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752736055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YhemnQVbAmu098eywcE1tMgyxGS2XwQOJgqxqn2+7MA=;
	b=GqIqZlbFwXmJOmVLw86lxxSm3qf/s6Yr/Dx1ve4MqEzdRLAnX0PzcmxlSaJH+z2O8KxpOr
	7zMy+LvMDC49AEdZxmuUszAL28SxIcpWHkq2iN8OoKUiB2EFfL/yboT8j8VzyNJIB+MoUk
	+4gETx2YcJ/69iPVWUzHTz7OUg21k48eeaFL+XrNrpbsZo4QAlH+jl0+AjGXC9Ixr65GhV
	e/F8NahdQ0Fu3V3Fhui+1aTdfZU/rfXL4Z7uGn3rkDdlLnidpynfK/+jrIe6rFbwaeFaU7
	jRYmeDy76C6mBVOWIiurKIRqNKPZ5Vwe7bzc1Kpg3V0fqj2QJ3Qg0mbXdSg6pQ==
Date: Thu, 17 Jul 2025 09:07:33 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org,
	JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Subject: Re: [OE-core] [PATCH 1/1] spdx3: Add optional kernel configuration
 export to build_parameter for virtual/kernel
Message-ID: <20250717070733.GB504568@tpx1.home>
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com>
 <aHdwpmxe3-5x1P1e@nuoska>
 <20250716113437.GA491407@tpx1.home>
 <CADkTA4PYcTMOeYyRpDRt8wefnkQEcQkXqustRrS-gczfnig7MQ@mail.gmail.com>
 <20250716143024.GA504568@tpx1.home>
 <CADkTA4PJP5KGKCGwZPkWAW8AkpM_fpPKBCCTmRCsBEncOH3DEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4PJP5KGKCGwZPkWAW8AkpM_fpPKBCCTmRCsBEncOH3DEw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehleelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfevgedvgeelgeffjeekvefgkeekieduleeluedvvdeuveejleejteeggefhjeejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehtphiguddrhhhomhgvpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegsrhhutggvrdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheplffrgfghhhgrtghkvghrs
 ehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 07:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220517

On Wed, Jul 16, 2025 at 10:51:09AM -0400, Bruce Ashfield wrote:

[...]

>
>    I wouldn't call capturing the configuration like this patch is doing
>    "minimal", so
>    we'll agree to disagree on that point.
>

Sure, I meant it in the context of the entire space of possible build parameters in
Yocto, compared to attempting to reflect all variables, overrides, dependencies,
and task-level configuration required to fully reproduce a build.

>      (like kernel .config, PACKAGECONFIG, etc.) where:
>          - The structure is already well-defined
>          - The data is relevant for security or compliance
>          - And the cost of extraction is very low
>
>    And arguably not the best or most efficient format ...
>

There’s already an inherent trade-off in Yocto between build performance and build
reproducibility. This patch stays within that space by offering optional, low-cost
metadata that helps improve traceability without impacting core functionality.

>      This is fully gated behind an opt-in variable (and could default to
>      disabled).
>      The idea is not to replace existing tools but rather to provide a
>      structured,
>      portable format for key metadata, especially in SBOM-driven
>      environments where SPDX
>      is already part of the process.
>
>    It must default to disabled in my opinion. But I can already hear the
>    arguments
>    that will say "it won't be tested if it isn't on by default, etc" ...
>    and that is where we
>    will have the conflict about whether it is on, or off, by default.
>

OK fair point.

>      In my use case, this metadata is consumed by a targeted diff tool;
>      not treating
>      SPDX as the end-goal, but more like a transport format. This
>      approach lets us
>      reuse existing SPDX outputs without interfering with or duplicating
>      the role of
>      more purpose-built tools.
>      So I hear you: this shouldn't become bloated, mandatory. The goal is
>      simply to make
>      sure when people do need to trace how something was built,
>      especially in CI or
>      audit contexts, they have a consistent hook, and it can be disabled
>      entirely if
>      not useful.
>
>    It is something that I can ignore (which is good), so I'll just keep
>    watching to
>    ensure that it doesn't become mandatory, or fail configurations on
>    compliance
>    and I'll be happy.
>    I feel that we are moving more and more towards a "pipeline" or
>    "loadbuild" use
>    case for OE, and that's also what I guard against.
>    I'm already not happy how long SPDX adds to developer builds, so at
>    some point
>    I need to revisit disabling it completely (it used to fail when I first
>    tried that).

I agree SPDX can feel heavyweight when misused, we’re aiming to keep it scoped
and useful, especially where it improves communication between devs and security
teams.

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

