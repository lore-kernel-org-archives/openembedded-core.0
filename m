Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id B2DC5614EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 17:55:43 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id x123so13624235vsc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qns3K8mV+UaED+vESwYjCY3MBmSEKSwhNvqkdr63oog=;
	b=RNksFW4jRacjKT+G5m9t330lbhckZxhBv0bcGGE0n7GLfYWmi4i0QaY6rL3cJxpbhg
	v0rVP/Sva1CNN8L8fe9lzxcvP8+CTsnnrMzknH+J4yJy1ggVYbIwWLqDS9POfnyp55lb
	AXiwSxwnYmZbAiKVmBWDVZM6cbOowjO7MqtjQ2XqYTxaHKq8wjMZDt21a4iBqXH0iNXh
	nbC9f7u05vb/M3YhTJf+Sen3E4zZOLaDTgch8qmMSyznkmg0YtefYZigYsME3wLTkZr5
	65N23HHcL3YKrO8m8hobomiDoQEXU5jjKU/HppEgwwbWsexPuHlaRLAB3/+FXOgYWmmN
	eY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qns3K8mV+UaED+vESwYjCY3MBmSEKSwhNvqkdr63oog=;
	b=V7hRfRDHWHsO5k7To6WChmNBZS0lfc3qcU4mJvSYD57a3LaBFfUtM46OIACRQ5smDM
	hUBs+inLhRmAd2bU7hqNL4LPHOWhbmBNLcPglXP9M9jcM7EuDzzW/SzSsyQww93+kv8C
	tyFVLHY6I9sFTDRzYoI+zizYUgcN6MZeZySkYyvNKeNVtik1tPw2Fu0fsfZbYcbbJJEu
	FLYYxSSFXknZZOG9obPP5ekuRFDOBA+klkfSvenGHn9zKjeA6eUoa7obNkKP97CWtaB+
	o0OzpoFcVEQ1KEYfQORZqP9uG3OcStM0Ilt9Y07Nz8gzEl7Mnfqix1PaodNQu9xwIC/a
	+yyA==
X-Gm-Message-State: APjAAAVER5biaKRaC5KhUOf4GOJP7hWm1UMgCftApAvAx+4vCKBbIoFy
	Z+Kbeyw8d7FsgfsHf+9mNinVdyG7PKDDDS2l/CgqOC/Q
X-Google-Smtp-Source: APXvYqyAjrGsarM+MatuMnU5DAelqMvsSBI6hFMenpF7O8FkxLdAh7FFyTLUDheUIXQW/k3n/m9ShIXEUCUbD+iljg8=
X-Received: by 2002:a05:6102:a10:: with SMTP id
	t16mr11974178vsa.130.1582048544381; 
	Tue, 18 Feb 2020 09:55:44 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2002170642560.2319307@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002170642560.2319307@localhost.localdomain>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 18 Feb 2020 09:55:34 -0800
Message-ID: <CAJ86T=VKr7GakDvyOwsNbMSEiOFy1WH8mwcCiRNYoTZm8EAQmw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how does "PREFERRED_PROVIDER" interact with layer priorities?
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
X-List-Received-Date: Tue, 18 Feb 2020 17:55:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 4:02 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   (note: when i finally learn python, i'll be able to RTFS and figure
> out stuff like this without assistance. until then ...)
>
>   was going to enhance the explanation of PREFERRED_PROVIDER in the
> docs, until i realized i don't understand it completely.
>
>   first, if there is a recipe named, say, "foo", then even if there
> are other recipes (with different names) that include:
>
>   PROVIDES = "foo"
>
> by default (and ignoring layer priority complications), if there is a
> dependency on "foo", it is the "foo" recipe that will be selected as
> the provider, correct? that is, if there is a recipe that *exactly*
> matches the name requested, that's the selected provider?

Never seen that stated before. The recipe name (actually ${PN}) is
known to be a provider for the recipe because it's prepended to
PROVIDES from bitbake.conf. There probably isn't anything special (ie
no guaranteed precedence) about PROVIDES being set to the recipe name
from bitbake.conf vs being set to something else from within the
recipe.

>   conversely, if one wants to override that default selection, one
> would need to:
>
>   PREFERRED_PROVIDER_foo = "foo_experimental"
>
> in short, if the above is true, then there would seem to be no value
> in ever stating:
>
>   PREFERRED_PROVIDER_foo = "foo"
>
> but i just noticed that that's done a fair bit in oe-core's
> default-providers.inc, as in (just a few examples):
>
>   PREFERRED_PROVIDER_opkg ?= "opkg"
>   PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
>   PREFERRED_PROVIDER_openssl ?= "openssl"
>
> that puzzled me until i saw this snippet from the same file:
>
>   # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
>   PREFERRED_PROVIDER_ltp ?= "ltp"
>
> which inspired the conclusion that if there is a higher priority layer
> that provides that recipe name, *that* recipe would be used instead.
> and since prio of oe-core is 5 and prio of meta-oe is 6, if you want
> the *regular* oe-core recipe of "ltp", you need to explicitly ask for
> it. is that what's going on here? because if it isn't, then i'm
> unclear on the purpose of lines like the above.

If there are multiple possible providers then bitbake will generate a
warning if you don't specify which one you prefer.

> rday
>
> p.s. ironically, i was just going to see what meta-oe's recipe of
> "ltp-ddt" was doing, but that recipe was deleted so, at the very
> least, that comment should be removed.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

