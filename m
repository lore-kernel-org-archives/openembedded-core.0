Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.1662.1594061317569503924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 11:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J8S6gYwQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 17so43113129wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 11:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4owjHhScuT0Q0TwyPiuPxfVucrAm7xYVbN4uAckSoY=;
        b=J8S6gYwQA/MQO1oQQWzxtEMOHmdQf2d1xV45YFWxEo9xJLWUWW60oHrmAp5hMiHOyS
         FkSn1t7eoHl2G2rjcLQLSWkmXXnGsvvyu1YTGuj2nclNk2XYo5Vx6ipa9kQgS5zvUf60
         YiFjVsVM0ldiTpWW3d1UoOyl8Sg9y8em9my9HWGqWXrdCVN8bP4HHieVS8JsZFhzoirw
         ythBp5pkkXhY7TREbe32Sz7+svbuUvf2vK1b8MyhjXWwZffvY7T0LVkRMcCUaagKjoM0
         ggspTTax+U7AVxG4NySi5E+AbQBdJKsH0mr5tRv+keApcQ0e7JvQm9FlX6jXXCMa0lox
         urqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4owjHhScuT0Q0TwyPiuPxfVucrAm7xYVbN4uAckSoY=;
        b=g93YcvzVHdMfq1MWaVLVqwrnQqpZI5czwQqchJ9VVHm7KXmQHk9OGYJsHsYyiyw16z
         Q5f3+xI0YPIJUIFD+YwRgitdDPcKFv636VlXCNgaLh9/nwPCg2gON6RzJcACHKAJ94UB
         yw3Nhpd1qNnxXiL/zOM/TUbrCyv7m65kvmjCgKVhCdeE3pvIGba7z1FBx6QOetfw93Ac
         c9JaZmtcJTZuJopm3FG1VwUM9sGYimEAj3JC9X9E67+hBSRi+MsT6P81wDrDFnOVqRW2
         CxnLl22p+KarnBDOAxKyJa3RXwkFvN+0bvU+wdbUdbEYVDbWI/U1lHvwklHAEtFANQTT
         iP5w==
X-Gm-Message-State: AOAM5333Y8uHIASnKjMfMoueqiC/NC856wQ25SyWHAl5LSICnbH8JKb3
	s2MzFXqe5JFTnQrR1GOH1y2YbFhsB5XWjLGV1Z8=
X-Google-Smtp-Source: ABdhPJyz9UUk47RMO00q1/98mOJO968UwBJI3S0ZJPPp/s6pLIMvmcRHx7E7mLWHUVRs3flUozM98o7W/9GM/ltb96I=
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr550756wmd.111.1594061316019;
 Mon, 06 Jul 2020 11:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <3c9dfa31c3ffcb882fb400f2513e14ae1d830ae6.1594050175.git.steve@sakoman.com>
 <4d68fb48-b134-cba3-5500-59db0b3f2433@gmail.com>
In-Reply-To: <4d68fb48-b134-cba3-5500-59db0b3f2433@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 6 Jul 2020 08:48:24 -1000
Message-ID: <CAGDS+nn10h8AsL4cCVS2X7CwQyDETVFaVe+6LSq_J0oP=PF58Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/25] classes/archiver: run do_unpack_and_patch after do_preconfigure
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 6, 2020 at 7:15 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Steve,
>
> Please also grab f02c190433 ("classes/archive: do_configure should not depend on do_ar_patched") as it fixes a bug introduced by this patch

Thanks, I'll also drop this patch from the pull request and add it
along with the fix in next week's batch of patches.

Steve

> On 7/6/20 11:10 AM, Steve Sakoman wrote:
>
> From: Joshua Watt <JPEWhacker@gmail.com>
>
> The commit 8a7c779487 ("classes/archiver: Create patched archive before
> configuring") fixed a race condition when using the archiver, but
> introduced a bug where the GCC source would occasionally be deleted due
> to the archiving code running before do_preconfigure. Instead, make sure
> the archiving code runs after do_preconfigure by making
> do_unpack_and_patch depend on it. This makes more sense anyway since
> do_preconfigure is effectively an extension of do_patch.
>
> This fixes errors like:
>
>  cat: .../gcc/defaults.h: No such file or directory
>
> when making certain configuration changes
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit d4be264061023ae0ea6e023d82a7b99605bfc22c)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/archiver.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index a8d3afcbe9..bf275f4543 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -583,8 +583,8 @@ do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
>  addtask do_deploy_archives_setscene
>
>  addtask do_ar_original after do_unpack
> -addtask do_unpack_and_patch after do_patch
> -addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
> +addtask do_unpack_and_patch after do_patch do_preconfigure
> +addtask do_ar_patched after do_unpack_and_patch before do_configure
>  addtask do_ar_configured after do_unpack_and_patch
>  addtask do_ar_mirror after do_fetch
>  addtask do_dumpdata
>
>
> 
