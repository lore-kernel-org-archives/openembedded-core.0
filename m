Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D280C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 12:12:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10775.1639051929805939562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 04:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dNflLhd+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso5144025wmh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 04:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AjF2MuChst0U7efQJ1nQ1E0Qz5BOTXMdPltLbhk+6Yk=;
        b=dNflLhd+ovX8CmLGpbZYRnVB67DKeY3ByU64tpYBhu+LGU56yo3iIZ9GSY7iob0u7i
         KCbMZ9O8clPtfy2GFZyxyAb8UeMv7oWRG5cdM0HjoheFxIFlfWxedpXUXV+lkMB44k2E
         v8zzaubrSXAR04l+/6LyjwiPwgfviEEFTEL9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AjF2MuChst0U7efQJ1nQ1E0Qz5BOTXMdPltLbhk+6Yk=;
        b=iFooqLgi99RjPKxUB6iAwkL141+rw3nhqvfGZfUHTfgQ6BBupnle+VqiV7iUEgljU7
         jApCwQ+c6gH9JdIA5PbLgrwTYVlVzeylvpD3l4hrNjF/Ev5dG3zpraALSmHAZQ7Plm+l
         8dHhJc2MLdbJWADn+xilX7k3JxEv4VMa2s5d9x+bJFN4wHg3IvlQcMrnVfEoKOjLNXwM
         fDw+TiGCkCumT/h1YUPhxYuEbbZbYxAE4WUYq88A5t9w88+hI1sSmSwZ8iTK02Qve+yG
         hBQ8nORhIRtXHwJqny+FfMrZPmdxVO/mPv47UPH5F7GmOl4uvVnzs9HlS4slHYPHSFlK
         kM0A==
X-Gm-Message-State: AOAM530pnVGrt+dc4VQ4rJiK8uPnN9yGNADdWWVOGaY0OL0vWGab1TAT
	ZWQBVqN7+zamFrew/bcNUquCtQ==
X-Google-Smtp-Source: 
 ABdhPJzvRo/0Mqr20pcKpFuVcw0bBeYYiPNy0YFZItmsPV8gXO9WFMaJnfAVoRPWidMyGNvmheswtw==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr6726364wmg.145.1639051927999;
        Thu, 09 Dec 2021 04:12:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb2b:2e37:1385:897e?
 ([2001:8b0:aba:5f3c:cb2b:2e37:1385:897e])
        by smtp.gmail.com with ESMTPSA id
 bg12sm6105448wmb.5.2021.12.09.04.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 04:12:07 -0800 (PST)
Message-ID: 
 <ab2226704dded8c823c02a45b051bd65683de13b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/29] insane.bbclass: do not hardcode oe-core
 path in upstream-status check
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 09 Dec 2021 12:12:04 +0000
In-Reply-To: <20211208215947.1979470-2-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
	 <20211208215947.1979470-2-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 12:12:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159446

On Wed, 2021-12-08 at 22:59 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/insane.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 240f3aad62..8a47da5a09 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1176,7 +1176,9 @@ python do_qa_patch() {
>         (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
>  
>         # skip patches not in oe-core
> -       if '/meta/' not in fullpath:
> +       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
> +       match_oecore = oecore_re.search(fullpath)
> +       if not match_oecore:
>             continue
>  
>         content = open(fullpath, encoding='utf-8', errors='ignore').read()

Sorry about the miscommunication on this. I believed this patch would break
things and that the sstate tests should have spotted it. They didn't as the test
case doesn't quite cover this issue but there is a real problem here even though
they pass.

You can see the problem if you run:

$ bitbake bash -c patch

then

$ bitbake-dumpsig tmp/stamps/XXX-poky-linux/bash/5.1.8-r0.do_patch.sigdata.XXX* | grep BBFILE_PATTERN

and you see your build path to the metadata exposed:

Variable BBFILE_PATTERN_core value is ^/media/build1/poky/meta/

which means the hashes just became metadata path specific. We can't do that.

I've realised the sstate tests don't pick this up since the metadata is in a
fixed location for the tests so it doesn't change. As well as fixing this patch,
we should revise the sstate sigs tests to test for changes in metadata path
changing the sigs.

Cheers,

Richard





