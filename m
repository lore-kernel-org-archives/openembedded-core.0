Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.29185.1591620611736241731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=McEfzU/2;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id e2so18109169eje.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hAXZiz6dpekaBcCJhh8hyEx+hQ8t5Jo/9kGuGKFLp50=;
        b=McEfzU/2OT1t59UzhkVydrvwYEPBjmzPnHT3gDF8Rh8g9ehj4NzD2Wjw58SnIoT1hf
         azYqUmxILICXOYvJWRf0laxagPeYTUgsbFTIChvkN0t50mCGOEbfcK2l6rbyBUlsWeWD
         aoUTW8Ilo/M3CaZR7M23QwkM91pU2KncYGTOQN0WmvE0OOi8J4bicgSgV0DrVdMmXlQ7
         RGI+AAU9Xc9cPhSPcYezxlQvMWfr3Amhy01xtFxq1MIGHIxwR08WqQ+tA+qyrQNb1qf0
         ONk5BYQx0j5HebNoAqeDn6MX+AhDRvn0CW52UYuCY7MyMhi/UTM+E3OBgniFE6isCSD7
         p4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hAXZiz6dpekaBcCJhh8hyEx+hQ8t5Jo/9kGuGKFLp50=;
        b=p6qE5htcMGb1q+XZPG4A7qHAqy3V8A5NBISd2EwyC8x5r6lnfh2sb2093Ro36Fhj6+
         9XM3qw3l7vD1MuMl3qj2KRZmx0Qwf/ANNRFYjZ02Jy/Gw42cg/KE6TmsmdSi7KktGMfW
         /ZYgnJMBdjPGKjWzdwCaJNNP46jlE77NM+s2/5FJUFEmharJ2Pj8OU0Hc526fB5On6//
         +N/3f/Nxk1TtpKeeusnyDOCqH3x/CCgiT7jL6e1bNuCRpc/LHMs2Fur9kFjt++2hUZ7T
         rxaQBYxMbJIjenIU/A02QxEHVM8FhCg/HZN+JxW10i8bNPUHk30fd/PQ9h+SDBzknDyh
         LGdQ==
X-Gm-Message-State: AOAM531b+k2DewNZGSczpaCApq6GJQPZelJlosOptAGKnTI8bjKq/vX+
	rv0QxubLSCi3zxZvqdGH+FYAXDfgDT+M1BsfCpk=
X-Google-Smtp-Source: ABdhPJykAGiQBntgn4pYjJ9uFXPOCNi2Xj8ebQsvghJMzvsUPe8A2ecR72Bom22VH495u1bjgC3DQYuDryITA/Fspi4=
X-Received: by 2002:a17:906:4356:: with SMTP id z22mr20409142ejm.334.1591620609928;
 Mon, 08 Jun 2020 05:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <67e32d06-6dc2-5566-f362-d7c2dd736618@windriver.com>
 <CADkTA4M+tRVzebByfDPmM2kwALcakrSoS4CQ87zAj759cBksEA@mail.gmail.com> <ae0f0097-c805-ac7b-5706-4833ffcc0244@windriver.com>
In-Reply-To: <ae0f0097-c805-ac7b-5706-4833ffcc0244@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 8 Jun 2020 08:49:58 -0400
Message-ID: <CADkTA4N=0ZmZyrb7Qe8hwbB1sFJU+FStkJHTaR-u+dXxM41wHA@mail.gmail.com>
Subject: Re: The change pointed to by a .scc file not detected when compile kernel
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>, zyang <zhangle.yang@windriver.com>, 
	"Asselstine, Mark" <mark.asselstine@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 8, 2020 at 1:39 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Bruce,
>
> On 6/4/20 9:04 PM, Bruce Ashfield wrote:
> > On Thu, Jun 4, 2020 at 12:52 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>
> >> Hi Bruce,
> >>
> >> Currently, the change pointed to by a .scc file not detected when
> >> compile kernel, for example:
> >>
> >> 1, add DISTRO_FEATURES_append = " virtualization" to conf/local.conf to
> >> enable virtualization DISTRO_FEATURES and also add meta-virtualization
> >> layer to conf/bblayers.conf
> >>
> >> 2, bitbake -cconfigure linux-yocto
> >>
> >> 3,
> >> $ grep -Rn CONFIG_IO_DELAY_0XED
> >> tmp/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
> >> 5367:# CONFIG_IO_DELAY_0XED is not set
> >>
> >> 4, modify the lxc.cfg which introduced by lxc.scc under
> >> meta-virtualization layer
> >> $ git diff
> >> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg
> >> b/recipes-kernel/linux/linux-yocto/lxc.cfg
> >> index 3fefc03..b7a19a8 100644
> >> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> >> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> >> @@ -1,3 +1,4 @@
> >> +CONFIG_IO_DELAY_0XED=y
> >>    CONFIG_CGROUP_DEVICE=y
> >>    CONFIG_CPUSETS=y
> >>    CONFIG_PROC_PID_CPUSET=y
> >>
> >>
> >> 5, bitbake -cconfigure linux-yocto
> >>
> >> 6,
> >> $ grep -Rn CONFIG_IO_DELAY_0XED
> >> tmp-glibc/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
> >> 5367:# CONFIG_IO_DELAY_0XED is not set
> >>
> >> The change for CONFIG_IO_DELAY_0XED doesn't take effect.
> >
> > Does the same thing happen with a cleanall ? There's an open bug about
> > the checksuming of those SRC_URI elements, and you are likely hitting
> > it if there's no cleansstate or cleanall happening.
>
> No, it works if execute a cleanall before the step 6. But it should work
> even if we don't execute cleanall.
>
> BTW, what's the status of the bug you mentioned?

It's waiting on some input from Richard, its on the fix list for the
coming release though.

Cheers,

Bruce

>
> Thanks,
> Mingli
>
> >
> > Also, you've confirmed that CONFIG_IO_DELAY_0XED isn't missing any
> > config options that it has as dependencies ?
> >
> > Bruce
> >
> >>
> >> Thanks,
> >> Mingli
> >
> >
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
