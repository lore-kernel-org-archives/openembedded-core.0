Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.11242.1600332617262894728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2020 01:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MPduZ3rZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id e11so3954177wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=G0YKxI4qP9Ay7V5SavUhn7rJ2zP1quXYcxkEUn9VhXU=;
        b=MPduZ3rZpE7NTEFh36608tlKcoi1YznlQD16izXznTCOjogELu1ZYK1sNS+ojRbwVC
         hdJdWm4ZuXwFRuefZJF54YiZ2bB/aPWW7ebfRx0ILVkD9Qy4SCdNQqvCWVRgZLF0K4nW
         uOgHZwfI0nud1iQm6/r9SXKHOjMiTgWc80sw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=G0YKxI4qP9Ay7V5SavUhn7rJ2zP1quXYcxkEUn9VhXU=;
        b=j3gzz1bM6ESy1cltXVladbuiCfhtZAtuEig/s0wg9Txp+pzz8QwY/P9PrT53em1IMH
         1nBVNsCOVdcrnByD24ZHWxc/Q8DtznBgm0NfJ6SD4eXx8PrV/YOJVBRbGLowvNxu+58Q
         1j8mLCEhjZiktV8CPe67wB1jjlv8MEiDaxgZXX0VEAHcjWE20nBRAXjH+YQL5GrtkWR7
         UvITsBo24gf39ILb80vPY3qv0GSv0F2yvAVRwU5jnVFJZLXDm1CgIz7laIKB4GGQjtEQ
         AMHcxA72UnpdukG+cLUNAxvYCkPlCSN/cycQlqVlcTf9pjXp9bXjhG8F161jh/mRWor7
         uxUg==
X-Gm-Message-State: AOAM532Cy/92LeKdY0bDeQsQ+bJuXzBUd+5zjjrLJWxMltbDpRlmxwIb
	gS6io1jnHcvj9tAJ9D2djgiAgQ==
X-Google-Smtp-Source: ABdhPJw/1lgvn11oIgKmpMrR57OCRvmkdmDqFJoTsgd9LU1Axhqm7V1sdhAwqtfiS6oZaYdxJnu4GA==
X-Received: by 2002:a7b:ca56:: with SMTP id m22mr8376243wml.12.1600332615292;
        Thu, 17 Sep 2020 01:50:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.1.a.4.b.6.6.4.7.f.7.9.a.9.8.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.1.a.4.b.6.6.4.7.f.7.9.a.9.8.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c89a:97f7:466b:4a17])
        by smtp.gmail.com with ESMTPSA id c14sm30514303wrm.64.2020.09.17.01.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 01:50:14 -0700 (PDT)
Message-ID: <d647ea733e23afb8ecd9f9b4d01d9bdc7d414cbf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] fix memcheck vgtests remove fullpath-after flags
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2020 09:50:13 +0100
In-Reply-To: <20200916232304.1706541-1-stacy.gaikovaia@windriver.com>
References: <20200916232304.1706541-1-stacy.gaikovaia@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Stacy,

On Wed, 2020-09-16 at 19:23 -0400, Stacy Gaikovaia wrote:
> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> 
> Previously in:
>     f75792b28e valgrind: make a few more ptests pass
> the vagrind test runner was adjusted to suppress part
> of a path that only exists when run in the yocto ptest
> environment. Unfortunately this change includes the
> valgrind version and when valgrind was last updated,
> the patch was not changed. Rather than continually updating
> the patch or even generating the version dynamically,
> we can simply change the expected output for two tests.
> 
> The reason the option: --fullpath-after=foo was
> introduced into the effected valgrind ptests was to
> deal with builds where ccache is used. Compiling with
> ccache enabled sometimes causes the source file absolute
> name to be found in a full path that is not the same as $PWD.
> 
> See commit c80f32e662dfa2a4f046960a25d5b8b7a8821bea in
> valgrind for more information about changes to the
> arguments that test badfree3 and varinfo5 run with.
> 
> There is also a minor fix to add the missing overloading.pm
> perl package and put the dependencies in alphabetic order.
> 
> Upstream-Status: Inappropriate [embedded specific]

Thanks for this, the fix looks good. There are a couple of minor tweaks
needed to the commit message. The subject line needs a "valgrind:" in
it so at a glance we can see which bit of the system the patch affects.

The Upstream-Status should be in the patch being applied, not in the
commit message.

Since I wanted to get this merged for M3 and time is short, I've
tweaked the commit message while merging so no need to resend, I just
mention it for future changes!

Cheers,

Richard

