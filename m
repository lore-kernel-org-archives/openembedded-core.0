Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04799C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:05:27 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51.1784300722502946344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dHpEWDz9;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a46a53abc9so2917109b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784300722; cv=none;
        d=google.com; s=arc-20260327;
        b=mZcax3vxok59Gw1+24UiJlY8pHLxJs/f6URbLxqXBKfQXcVU2O0W16OUkAd+9yS85Q
         QxlYvzjRUhdZLON6me8Ym0f6FYzWiMg7/BknU01uOK4RfM85L2rF1lFry81KP3l8Bdv9
         RbQ9aOgBk/Tg/c0fdIWgrkFrmXF0FkuAvDgly1nQaBrTxIFfsGOg28jCzW0KOsywC+ZR
         DoFPqUZgHfm55/TdJd1xCkYXC3g3DWMKA7yKMyyHnNOI5qqGPrg5EFKHUsuKDCCRW/XS
         2LXFh9BX+ga3dZqO1rWgq13HoV26wlFF7ryELyoTqUwGrwWX2M+H1W+0KPQhOgDGKz6Q
         PwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZuUtoUCPognh56f8SUr+mgRP4U8IyM3+UYUZKnfa+ng=;
        fh=rdKmjCQKNQNb8apMRFYA9kwA8M3ChUWLa1NIBv1xMgc=;
        b=c5/av+LctMJHa51tpT4idfaHQBXlKdZ3MJKKk0WumYAPBpSaWJIMt9/lsN02RVjNyA
         WD3Cn4pxT57op1KYzemu+F/hs8yo6H9zBOYOcKNLyPX6xd7NBqR9zoyu2YXaqa27dDUn
         uOtn5rHmGob7chLn5SuOL9AzOi1NuACSaZr1TqRFcfuHu19DVZKV3vzKH7ImUJC0KKnv
         KRPpWcriFFLLXMogasHcq/Uz7PsuIsd5DUDSijOqoJ1zNcrLTTrhCH039TR0JL+0wAcQ
         TOoz5Mx6sM1PJ7YHLHw6Gj3zZe1aw5YeUKkdSPqQkQheEvqFQrYd7TautrnPu7qkGx4E
         ZHRA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784300722; x=1784905522; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuUtoUCPognh56f8SUr+mgRP4U8IyM3+UYUZKnfa+ng=;
        b=dHpEWDz9rLE6G6I+q6NJ25Vg6cYv0rkTY0Wdefw+wBWbh6qYBKKF5oml9XNoYV4xas
         xzlzHyhYY2Pzx09/5sTl4QnuQaT9fi443ZMHgr9XjPUH5mdPlM0RI6ewrJiZlcwfpMhg
         XzW7tyPCJPAe14I9n6dBTP9Kb2Fv+J1pBA1t5j2Qj0gBlQdny0h2Q0oWwgRtzVh9L++i
         3dzEvYDB4AI0n6ZXBKkLef383xV/zy/srwTJgMkFUIsB/AYAqeMmSgDupZt/DR5cXllP
         0D4wgFAduSIAgMFtX96YdQDl9IXnlIP1HDEEUG8rjHYIqwzGBAn8TRj+5S/ej+LNoVgF
         tN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300722; x=1784905522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZuUtoUCPognh56f8SUr+mgRP4U8IyM3+UYUZKnfa+ng=;
        b=BGVoK+uUMOb9eq8XYw7a4x8v8kKrhpg5PKDGN7vcbWHFn4ZpK/9j7TYqf/UQYjw9sQ
         STwi39uvFHyW8/vZZvPB5MH25mhwan2FHOlhKRNHse2zPrAe6VLbgQJrLzAbsgjGitSX
         GY0azn/3cMeueK+utA9+pbzlX47J5SbCheSb1YTRB7Li1DkIhEojKMpu1GtIARitdgbb
         EaWFMV4wHgCOYcK49xmncrqBLarW67z/2K60DuavjgC2WbN/PP0W66c5p0GwM5WBdkZO
         a9AD5pLCkxTgUXBWrQKpH77FMuTyFcQ1EUbCEJv0s4FVs+sgEz8dG1B3bfsraTZIHx5f
         DqwQ==
X-Gm-Message-State: AOJu0Ywx3EBFBqIAyxTj+9cK6e2QuuSEmJlvhCSUJLWCacKYKekWb8Vu
	cMmw1VXBmR5m4YVh3nVoIBoppp+VRJ2GUU5lePek+cSwHmjBUGSHflEzms26D1QkEcStWQdENJF
	/B7b495MDlAIco5v4qLUvK1tw3/jvoeq5Vg==
X-Gm-Gg: AfdE7ckKxtAmciFmx5xPAc7SDDkO/3gIbiF3w9gVw++H3TwAV2n59WOQ5PFkewsPAKH
	1Q5bVwpcC4hc8jCO7Fx6oZFj33hojLE2xYC9fjonTp/hOal1LpxlmCa3j4ASIWBWpZ4ypiG7CrJ
	HBjAlT4QDIVAaIDBhiKnmByo1yNvSqx81iU6BXAddHYOTYZMFFtXxsPbBEexxeD0f//ndW9teFP
	9cJN1w4D+yS/fQfo9XBDCrUmUpTnxFVnZGPu62CJnscx2MS4gpEwSwAlnvJyQClL80UlGpUW+Sg
	wn/OINGHbvsrq/SDf9ga
X-Received: by 2002:a53:dcd2:0:b0:664:dbfc:e46d with SMTP id
 956f58d0204a3-6683bba41e5mr643667d50.35.1784300624450; Fri, 17 Jul 2026
 08:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <87bjc5svql.fsf@prevas.dk>
In-Reply-To: <87bjc5svql.fsf@prevas.dk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Jul 2026 17:03:32 +0200
X-Gm-Features: AUfX_mxxoBPRcRJAube8q4rvl9ZgEmcmHix6qxl933Y-Pkb9An8x2_ozwRd2WDs
Message-ID: <CANNYZj_mOTsggRo6ORQHwrLxNShTmiEa6XV9JCmoqzz3SjuwNg@mail.gmail.com>
Subject: Re: [OE-core] PACKAGE_EXCLUDE_COMPLEMENTARY question
To: rasmus.villemoes@prevas.dk
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241204

Yocto CI is using a different approach: each ptest package gets its
own image, and they're all built with a meta-target
core-image-ptest-all. Then they're tested in parallel with bitbake -c
testimage core-image-ptest-all. I'd say this scales better and runs
the tests faster than shoving all of ptest into a single image, so I
would explore in that direction, e.g. you can write a custom version
of core-image-ptest-all with exclusion lists.

Alex

On Fri, 17 Jul 2026 at 13:26, Rasmus Villemoes via
lists.openembedded.org
<rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:
>
> Hi
>
> I was playing around with adding ptest packages to our rootfs to see how
> many of those tests would actually succeed on our targets, and if the
> rate was high enough, I'd do it permanently and run them as part of our
> normal test suite.
>
> But it turns out I can't simply turn on ptest-pkgs, as it blows up the
> rootfs beyond what there's room for on many of our targets. One of the
> biggest offenders is openssl-ptest, weighing in at +650M (roughly 3x the
> size of the rootfs before adding any ptest packages...). So I looked
> around for a knob to say "yes, to install most -ptest packages, but not
> these...". There's PACKAGE_EXCLUDE_COMPLEMENTARY, which sort-of seems to
> be intended for this (though undocumented).
>
> However, just adding "openssl" to that variable does not elide
> openssl-ptest from the image. After adding --debug to the
> 'oe-pkgdata-util glob' invocation in install_complementary(), I see that
> yes,
>
> DEBUG: openssl -> !!
>
> the openssl package itself gets ignored, but there are two "aliases"
> (for lack of the proper word) which do end up pulling in openssl-ptest:
>
> DEBUG: libcrypto3 (*-ptest) -> openssl-ptest
> DEBUG: libssl3 (*-ptest) -> openssl-ptest
>
> I suppose adding those as well to PACKAGE_EXCLUDE_COMPLEMENTARY would do
> the job, but playing that game of whack-a-mole can't be how it's meant
> to be.
>
> Coding-wise, this seems to come down to skipregex not being used at all
> in the "# Main processing loop", in particular not after reading the pn
> which a given package came from. But I have no idea how to modify that
> code to take skipregex into account or what could/would break if one did
> that.
>
> Also, had there been for example a openssl-bash-completion package, I
> didn't really want to exclude that from the complementary package
> list. IOW, what I'd really want is not a filter on the input to the
> globbing, but a filter on the output from the "oe-pkgdata-util
> glob". Perhaps something like a PACKAGE_IGNORE_COMPLEMENTARY which would
> be subtracted from complementary_pkgs in install_complementary()? Or
> just use the existing PACKAGE_EXCLUDE and subtract that from the list to
> be installed? Adding openssl-ptest to PACKAGE_EXCLUDE currently fails
> hard because we end up asking the backend to both install and exclude
> the same package.
>
> Rasmus
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241162): https://lists.openembedded.org/g/openembedded-core/message/241162
> Mute This Topic: https://lists.openembedded.org/mt/120313077/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

