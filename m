Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E093FC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 01:17:54 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.3192.1646097473781294923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MFeISm7l;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s24so20012227edr.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iyWosM0xsSWeSW8wuKePcS9F16xu4DzzcQvYL0vJL2w=;
        b=MFeISm7lveB0gO6470RRNSCT6Fo28saPG1znuUMbbRnG3idYxu2twUIlKGuWWyVc8A
         9yFo4zrpsmDzH7StKvyOZ+y14k2kcOalmMrH0HIenmn7WJMRdzxEPX3saIMpUJTEOqpv
         /pxLaz59qij7/pyUps2xDsUN0PJtzyNJvlVYMTkHsCJiJ9dcIHkjavBxNqiRnvtNfa7G
         aPs32w0lCsJhRRtnXFWyLGPSp56qWhyf6wDMTt+0vyGwThYKJv8GxbNaSRRghSGq6h1p
         AUi7EXXMTnEAEQWfPZsmLQ3FpR7ehf21lm6VccWDsJ8j+GB+jlT7EsOSSkzp+mE5/qMJ
         sAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyWosM0xsSWeSW8wuKePcS9F16xu4DzzcQvYL0vJL2w=;
        b=sSkiuC1DcyqpUbjPD/zcC0TbCvIQxMXdJUR0HNkixouCfTvP8HplangDzUggLMCPfU
         DvtSjtoyoyP5ayRf4EC7U+a0OW5VrHuj9eApbamW+rPw+T5dhiTZMxBu9ygTzbtY0hll
         dCtxjJgNbaI45NYWnLk1WEJCYV2LFT2lS9MvNWVGWHIb5TkkxagHlPVLJx6l7M4uonaK
         5W2MV5uv3UxkX0ZtjWbRRHU6GAOmkHSpWXH11HGNpLrFAvf2OP/aCAI6QGi8ZJv2s2+3
         Xah7DGgxCgKkarcGyXIH+PMSOU270YPXHZIjCoLKFo4znBtgAyBgvYZcmWpJKFdLUGJS
         NW+Q==
X-Gm-Message-State: AOAM532SH4AAPHQ7UHeHyczmfF7cFnIQPJK2kKwQL54n3r8H7OaJl6tQ
	fQ3Oy6Kte7IqKctOnnp807W687Tt2uuSfvKjPE4=
X-Google-Smtp-Source: 
 ABdhPJzxoi6vxU7LQAzJ5YG/T9K3nHt3wXm9KtKsiCPWbcRMywLTaVet60SYF0Jv1DfGqkCryxX9jv5Qj03YewJ3bRc=
X-Received: by 2002:aa7:dcda:0:b0:413:2c17:d969 with SMTP id
 w26-20020aa7dcda000000b004132c17d969mr21892841edu.185.1646097472181; Mon, 28
 Feb 2022 17:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20220228235433.3948994-1-andrei@gherzan.com>
In-Reply-To: <20220228235433.3948994-1-andrei@gherzan.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Feb 2022 20:17:41 -0500
Message-ID: 
 <CADkTA4N+Frh96ZEbdDVKgJFKKhH0-m8YXOxHaYHhKSM7p1pKxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 01:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162519

On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Compile pulls in the go.mod list requiring network. Without this, do
> compile would fail with a similar error to the following:
>
> dial tcp: lookup proxy.golang.org: Temporary failure in name resolution

This is something that needs to be carried in your own layers, IMHO it
isn't appropriate for core.

It isn't about the fetching, it is the entire gap in functionality
that we are missing if go starts fetching dependencies during compile.

Bruce

>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  meta/classes/go.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 9c4c92bffd..dc246c72cb 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -113,6 +113,7 @@ go_do_compile() {
>  }
>  do_compile[dirs] =+ "${GOTMPDIR}"
>  do_compile[cleandirs] = "${B}/bin ${B}/pkg"
> +do_compile[network] = "1"
>
>  go_do_install() {
>         install -d ${D}${libdir}/go/src/${GO_IMPORT}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162517): https://lists.openembedded.org/g/openembedded-core/message/162517
> Mute This Topic: https://lists.openembedded.org/mt/89464905/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

