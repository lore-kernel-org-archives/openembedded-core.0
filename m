Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8650361DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 14:39:34 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id y6so6614236lbh.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4F0YIqDPWhtzm2ZzPem+3ooUTMtvg99FYws+0Y57ZFI=;
	b=YTeYtKbvLPq4WV5daHdQa3lSBxe4iXKdidm72m1ZxFcJce0/a3Y9N/BNdf7LLe2Y7e
	X+BwClJ5t1guvsEuK/8lzb+269SYroiSVfLjn4QJq6BN78idt/HPup6HwkPunSBJCYJU
	qe8jyYzEzTg93dAl6/MFmI6UpMBe9LI4cDLHoINqM/QYRvajaklTzlkT9Svxs/4WVsGw
	ezftQvd95kHp/JRCt17Dcr7x0ABewgmzfsxMhvdn2QNgWe5/IiXucqo5PaKmTU8Y6rJ3
	ncLU2LHIQVtYrG8BteFzjkuIdYZaSLjU5XK4A2nDxHuxuZhCCRBSERaVtRP67gFMIlJV
	/erg==
MIME-Version: 1.0
X-Received: by 10.152.8.115 with SMTP id q19mr35641499laa.16.1379515175074;
	Wed, 18 Sep 2013 07:39:35 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 18 Sep 2013 07:39:35 -0700 (PDT)
In-Reply-To: <ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 18 Sep 2013 10:39:35 -0400
Message-ID: <CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 14:39:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 18, 2013 at 10:25 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org> writes:
>
>> The LDFLAGS is required or some old kernels fails due missing
>> symbols and this is preferred than requiring patches to every old
>> supported kernel.
>> ...
>> +LDFLAGS="-ldl -lutil"
>
> What is with -Wl,-as-needed or the gnu-hash ldflags which are applied
> usually?  Perhaps, hacks like

We don't want to influence the perf build from the build system, unless we
absolutely have to. We want to use the flags and configs that are contained
within the kernel, just as we do with anything from the kernel tree in general.

>
> ----
> do_configure_prepend() {
>   cat <<"EOF" > ${S}/tools/perf/x.mk
> include Makefile
> CFLAGS += ${CFLAGS}
> LDLAGS += ${LDFLAGS}
> EOF
> }
>
> EXTRA_OEMAKE = ... -f x.mk
> ----
>
> would be a better way?

We only want to influence LDFLAGS at the moment, and we'll work to get an
EXTRA_LDFLAGS into the mainline kernel, so creating less scaffolding, versus
more, is what we are shooting for here :)

Bruce

>
>
> Enrico
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

