Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.5341.1596027338724935069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CR7YW0Ke;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id z18so17986781wrm.12
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=IU6d3xpfOrRMdiRoDnTw3nZdkQCyTCNT/w5OCa8HZq8=;
        b=CR7YW0KesHlrs16xe7DPhLmYJmIlq/dLePvoZkArd9SXrKSheetkyjbZzr+cq20Gyg
         071W6/ED3+QH6Tpf2Q5F/uAzm1VwgEo379P7GVCYCuTPZWRY5/ZvJ87s9pGFAqXul/mo
         6QK+jLTr02I0MjwQCzWt96jFuIGtlXqK3+mpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IU6d3xpfOrRMdiRoDnTw3nZdkQCyTCNT/w5OCa8HZq8=;
        b=fzNn+gD39201Zf68c7mEdvNoXmUz2LdWSv9UvqrbnolLaFaoMuIO+qNI9c6u8IMQkU
         azKHo4OSlZY1uaODgkynwFFGbVvUsWII5lYVx6PJNbNktgP1HHBsp5CWwNC4mo7St86w
         4E6iT0s1YZxmVWlA+jK4Yj5bsOWlM1UseQVFzOZQqJiOzmaRwHGYgReK2GjLg1mOMDLY
         fUEJVC/1+YQN94Whah/OYUs4MaJaR9dTjHkVRtM3A4EmaAJHe5EkAlNGbTBiOn3TMagZ
         N3wDCA0eIy4xwfxyoAaFD8WhQ9LeBJv5KMlrRgN7R4yb5Mnr576ybdn1yk0Cm4Gu3FYk
         9/Hg==
X-Gm-Message-State: AOAM530oa8ww0uvsGjkoE1zE6XpOiGN0OyCs+RKWsSC7UlUFz2s2jK7+
	4Kdxsf1WXSN5qzew9Nx987C+Qw==
X-Google-Smtp-Source: ABdhPJyw65kmMzZ8ZgdrAo7f0fvfXpZItlhKApiiOrmkPxro/8ICobMpYL4KDCK/cW9MI6DWn4fUjQ==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr28696390wrw.31.1596027337206;
        Wed, 29 Jul 2020 05:55:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:20af:3d2:ab93:e15b])
        by smtp.gmail.com with ESMTPSA id g18sm5886840wru.27.2020.07.29.05.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:55:33 -0700 (PDT)
Message-ID: <1d98a4bfac9233184149c8442726d7580b65b4b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] recipes-devtools/gcc: gcc-Fix-argument-list-too-long-error.patch is buggy
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: qiuguang.zqg@alibaba-inc.com, openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2020 13:55:30 +0100
In-Reply-To: <G4Ph.1595776855082351500.T0aS@lists.openembedded.org>
References: <G4Ph.1595776855082351500.T0aS@lists.openembedded.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-26 at 08:20 -0700, qiuguang.zqg@alibaba-inc.com wrote:
> A few days ago, I tried to compile a gcc plugin with the toolchain from poky sdk.
> It failed with errors about missing header files such as backend.h etc.
> 
> After investigation, I found that the problem was brought by a gcc patch:
> 0012-gcc-Fix-argument-list-too-long-error.patch (which is considered derived from the original patch)
> 
> - headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
> + headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
> 
> It changes the commands of install-plugin, making the sorting taken effect before the shell globs.
> Thus results in the header files under gcc $(srcdir) being not installed.
> 
> By checking log.do_install, we can find that the `headers=' statement to run is incorrect and will not work as expected:
> headers="$(cd *.def) *.h ../../../../../../../work-shared/gcc-10.1.0-r0/gcc-10.1.0/gcc/../include/ansidecl.h ...
> 
> As the patch says,
> "The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle it, ..."
> my suggestion is that we can simply take care of PLUGIN_HEADERS:
> 
> - headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
> + headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \

Thanks for the report, I've submitted and later merged a patch to fix it.

Cheers,

Richard

