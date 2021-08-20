Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.82133.1629458021419564080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 04:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rjnXEg16;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id n7so16793066ljq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 04:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8td0ONgrlvSqQUVEFwKPGaOs7ntSJUrPj39bSlZsLsg=;
        b=rjnXEg16g1mNR85ZVjbhX31eYxEE8omstfkudFS58azKUQmMAUZZb1o5tJDyE8aYfv
         Q2aPM8eVw7eFlCNSFohsHnXdSoN3tUgFUCyLfa7vrN26EfmCR90D/h1kp58jTBfYnpAl
         rdhm83C0zGHjmBAeM5OoXv6OovqUgtdWoikMW6b7jHOYSYyV0EWl6hp4nQgo72OlLq0I
         fjqrDf0JU505PZ11UyNGG+8sG4CTYGesBLTg5On0vKOm9daQLLnU7+//kXF5QvuwNdpc
         3MPof0ZUXi4/HfWzkPO+GUZogtY+FW7k9Y/CjOlpoAYQEpJtBLiJf9ymWvorDqbN2QFq
         2RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8td0ONgrlvSqQUVEFwKPGaOs7ntSJUrPj39bSlZsLsg=;
        b=dsaNjGAFFzJj9UwE6yusDlJk7MI0SUIBibfNFaiR7JErrOYhkCZFPC48qEpSoNnv5N
         jRnu2BCVGqqRrCgSN6CXtsMGb6dI4M2fZWFmMpWWkJwIvDfBnMyGenMteOjUkdQikPFO
         fYXy28KhH5Bpysda92P4MUu53wjVjLtfuyhA/zHDVYjc1/72Xk0NPboRaPzLlizVw2hb
         mPS42v9M8PkFdoglbLpgYGsMRCMJqIjkuz//28JdTlp+xMlmi22nrvRjvEl6KsXJhxHM
         BYBf/pIxFMjHwRk9XdLuwv7yVSRgPLnheIcu1Wf75+afpOwHrHHjmkx9GQ3UPIMvAsts
         riyw==
X-Gm-Message-State: AOAM532jTYF3cSgYmfG7AZnTSsKLHhlLh5Em8FJLDQn71YW/m2RUPUEF
	fK1ll17MAYjqXMCg8ByHmSyb1Tq047atlXMUNzc=
X-Google-Smtp-Source: ABdhPJysbkvHIoC3+rc7qxTKeW9KTOf0aJh8gjKJcRWdnOO/XcMCLx+lA0pGKDcmCoFde9X3NyIY9lEBitL+dxsoQZA=
X-Received: by 2002:a2e:89d8:: with SMTP id c24mr15698150ljk.419.1629458015190;
 Fri, 20 Aug 2021 04:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629213685.git.bruce.ashfield@gmail.com> <91f494738fb9c63499fae982fb7b09cb29c3afed.1629213685.git.bruce.ashfield@gmail.com>
In-Reply-To: <91f494738fb9c63499fae982fb7b09cb29c3afed.1629213685.git.bruce.ashfield@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Fri, 20 Aug 2021 13:13:14 +0200
Message-ID: <CAHtQpK4rAfAjB7dwXoz4D42887whGu5xgrxGcCxKRYmNUiE3-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] lttng-modules: update to 2.13.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Bruce,

On Tue, Aug 17, 2021 at 5:27 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating to 2.13.0, so we can pick up the latest -stable and
> support for 5.14+ kernels.
>
> We refresh one patch for new context, and update the LICENSE
> checksum due to commit 2df37e95fa4303 [Cleanup: Move headers from
> toplevel to include/lttng/]. which impacted the LICENSE file (but
> licensing is the same).

I'm seeing a build failure with this new LTTng and CONFIG_TRACEPOINTS
not enabled on the kernel 5.13.12. The failure comes from the Kbuild,
which does not demote the missing trace point config option from error
to warning. There is a patch file already in the layer, but it is only
appended to the 'class-devupstream' and is missing in the SRC_URI.

I was going to submit the patch to recipe to have it included, but
testing the build stage with this patch included I'm seeing a lot of
other errors then, something like:

lttng-modules-2.13.0/src/lttng-tracepoint.c:227:36: error: 'struct
module' has no member named 'num_tracepoints'
-- or --
src/probes/../../include/instrumentation/events/rpc.h:208:36: error:
implicit declaration of function 'rpc_qname'
[-Werror=implicit-function-declaration]

and the list goes on... :/

Have you seen this during testing of this new version? Any advise on
where to look next?

>
> MODULES_MODULE_SYMVERS_LOCATION must also be specified in this
> release, as the lttng build has moved the module target to a
> 'src' subdirectory.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 32 ++++++-------------
>  ...ules_2.12.6.bb => lttng-modules_2.13.0.bb} |  6 ++--
>  2 files changed, 14 insertions(+), 24 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.12.6.bb => lttng-modules_2.13.0.bb} (88%)
>
>


-- 
Regards,
Andrey.
