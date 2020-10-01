Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.1261.1601565401737466446
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 08:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DA2zC+lF;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id b12so6014239edz.11
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+92cokxuUUbt7G//hrsFR+LuUaJimi2uTQj/AH8id4=;
        b=DA2zC+lFysbN6YybrHJW4FbDIg+Isr4rMWj3E6brXUxRSsNBA4yiPb672+WMfYCZIc
         xhf/NktLQX8JJXoyoGBVTXA+l/LruOJ1C+SQARW8Z55PojaMDIiBlSnrTGXgmbHxr9P0
         bWJZW1Jam0gYmQU9rWa90kHwkY5JNh7+6Bi4bHc7/CCya0abVC7FzEubcFTgOJDt8JyM
         iBZy3dt0aS4V1XxPVri1efF9bLY9WrR/EcXvb/DohYq/zaiUalD5sYz5ZvMCVScV4PIT
         Mr7JAkPBRnYB8BIQB3dkfz2I4U5ei1FGn0BIHQecuPqQ+vFIBqMaXXKCkuNfHaIcxKaA
         olFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+92cokxuUUbt7G//hrsFR+LuUaJimi2uTQj/AH8id4=;
        b=JoxFbcuq3stpiKmlZWg4QLf2/wYDPDYfNS4xPt/rLBBcCENK7udvaFDP9haUnsYLiw
         wj5Ub+YrFL1ITC5es8VPqa4erIFNcLWxXMqHxyt8EKjZPWAJ0OqMY/bzAtcLiRwk/yDP
         w/5VkScadhJ+aaXbLjN90ZlmrA/oeaDSpz7ebjFHmXPjQ5GfdB8Mzty7HvZeDm6Bm9zn
         36dv5ha8PMTy60OT/xsjPi8+UY16klbVgjcB1nTYLnm9a51V16rX8eBiI54hdyaGCBN9
         2vGsyJRLDjBwqSEoUhU3aFnAgDC3po4vsOnRlrM/nUXRjmtbqdgteErlNrHf3VLpokpG
         hI5Q==
X-Gm-Message-State: AOAM531El16Rq3evJ6ui63Kc/S0JInhUxLz7JK2ak1PRBVJizB5apchy
	ec/3WTwWt3yOV0spY1QmLAHDGnnsy25+8Dbgxgqd+JjZdc8pBw==
X-Google-Smtp-Source: ABdhPJx+dIqFXXuGLaaNvmFbFtYoPAY6ZaX5x/ZkP78b1Ee+dNwpr161FnmY/TTREtVEi+qQHbuU2Iy9tsxrSEa1a5w=
X-Received: by 2002:a50:fc0b:: with SMTP id i11mr8584798edr.164.1601565400146;
 Thu, 01 Oct 2020 08:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201001135927.721794-1-uvv.mail@gmail.com> <CADkTA4OZNhbMaykKi_pU_Af49D-wAjeqQ=3L-y241Lcj7TUd2A@mail.gmail.com>
 <c71e99aa-5669-a75c-1e72-81c176ee71fa@gmail.com> <CADkTA4O_M+Wb5bXdiSTzKJDnB0GJVKoNUhD_t3x5qZsG0EvfLQ@mail.gmail.com>
 <f850b3d4-b530-ade5-d64f-bc8611a1aba9@gmail.com>
In-Reply-To: <f850b3d4-b530-ade5-d64f-bc8611a1aba9@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 1 Oct 2020 11:16:29 -0400
Message-ID: <CADkTA4OoEiOb0B7EcRu2jDs-zQQe9GZByOXMoeE+5gu7qa1heA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: add HOSTCC for out-of-tree modules
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, 
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 1, 2020 at 11:05 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> On 01.10.2020 16:53, Bruce Ashfield wrote:
> > On Thu, Oct 1, 2020 at 10:47 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> >> On 01.10.2020 16:36, Bruce Ashfield wrote:
> >>> We already ran into this with the main kernel flags, and we don't want
> >>> to duplicate them here.
> >>>
> >>> Why aren't what we have in kernel.bbclass working in your scenario ?
> >>>
> >>> Bruce
> >>>
> >> Because kernel.bbclass is not pulled in into the environment of
> >> out-of-tree module recipe. Should it be?
> >> This can easily be checked when you do 'bitbake hello-mod -c devshell'
> >> and examine $EXTRA_OEMAKE variable.
> > Yes, it should be.
> >
> > We build out of tree modules in each autobuilder test run, so it is
> > functional for the most part. I'd be interested to see the reproducing
> > kernel module and build steps, so they can be built into the tests to
> > catch this.
> >
> > But we absolutely do not want to duplicate those flags into this class.
> >
> > So with a reproducer, we can perhaps shuffle things around and make
> > sure that both this new case and the old ones continue to work.
> >
> > Bruce
> >
> That's interesting to know. It has been easy to reproduce in 4.x kernel,
> but with 5.x in master it fails silently. So here's what you do with 5.x
> and meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb module
>
> 1. Set machine to any x86, e.g. qemux86-64
> 2. Enable CONFIG_UNWINDER_ORC in the kernel configuration
> 3. Modify kernel Makefile as follows:
> Vyacheslav, [01.10.20 17:01]
> index 8b1d5b9017a5..e35da9f9bb75 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1058,7 +1058,9 @@ ifdef CONFIG_STACK_VALIDATION
>        echo "int main() {}" | $(HOSTCC) -xc -o /dev/null
> $(HOST_LIBELF_LIBS) -,1,0)
>     ifeq ($(has_libelf),1)
>       objtool_target := tools/objtool FORCE
> +    $(info "Validation enabled")
>     else
> +    $(info "Check failed, disabling stack validation")
>       SKIP_STACK_VALIDATION := 1
>       export SKIP_STACK_VALIDATION
>     endif
>
> 4. If HOSTCC is set properly, then you should see "Validation enabled"
> in log.do_compile of hello-mod recipe.
>

Ah yes.

As in my previous email, those warnings have been around for a bit and
we've just never had a reason to fix them, and in other scenarios,
I've just been explicitly enabling/adding the variables where I need
them. Since (for instance), we can't always assume that HOSTCC is
available on-target, the architecture support, or HOSTCC is the same
as CC, etc, so we want to cover the combinations properly.

The warnings aren't only seen on module build, just a simple 'make
scripts prepare' will show them, so that's enough of a test to see if
they are or aren't picking up the compiler. I wouldn't make these a
failure, just a warning, as they currently are.

Perhaps this is the motivation to do that fixup :D

Bruce

> Any hints where autobuilder tests are? Perhaps I could take a look and
> find a way to cover this...
>
> Vyacheslav



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
