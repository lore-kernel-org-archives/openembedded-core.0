Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.4067.1600795341753498081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 10:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fa3zq5Cj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id s13so4145673wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kgsYX4t8HPxMomehbVzi/6ypd0385M3SNbcE1G+upsA=;
        b=fa3zq5CjdkW35B0bZox2G6ItJZAQnlZdPmTZEmkQb9HCWZDsEgRcNTBbwr8njcEUWQ
         l+VxXHbSTqTwiSeGzll9Du2b/C4hSEYmaZJ8kNgN8qBEuiHFAZ7d2eQDUHneiQHQQjGB
         HQ8XbDWDDPeUDEjZYsTjOaHPjnsr8r0YoNThk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kgsYX4t8HPxMomehbVzi/6ypd0385M3SNbcE1G+upsA=;
        b=iAkcmJX32hLaxVtAJiygLwesyIshZG594O2RVq7I8UNKz+YAkcqO8AXa9xqHJ8zCCQ
         byg4ecRbE5DST+OWjAygIKWIxe/03uFYuIXQLKh+Xdcp0Y50RUbssSr2SXYRaJ5jTq6v
         RoDXmMOeCETYDRcq613IW4Rn+V6vD+AMOAyNhnDgz0MJZnv5NPvo3K7HeeZrCqnt6fZg
         hnzSFJag1SjMkSJbD6NAemaLVtsx36+khKDr94m8okLsFZaVZojqnGSTAfwtD6ToHFBw
         Q5eow26NB0+FlrSVUrBtHf69ZFiaHoqXINwfCXiShpKIpMa8vxgVhUYLTwerb34P2z80
         4KZg==
X-Gm-Message-State: AOAM5303lMmGENkWZALB1IYwcXOpcqW4fLJOOgXEASudcuEgWsbUeq88
	yJ9TZtlwbm2kFju4vnNv+uwh4Q==
X-Google-Smtp-Source: ABdhPJwTWeHsJp874w1sXKrbGA/h3xp2dh86kSdX+ITpkrCtz7qY8Yw9GA/w6xzLs61OSymZCiWsHg==
X-Received: by 2002:a05:600c:2742:: with SMTP id 2mr2062037wmw.136.1600795339956;
        Tue, 22 Sep 2020 10:22:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b044:4921:330b:194d])
        by smtp.gmail.com with ESMTPSA id x2sm27774696wrl.13.2020.09.22.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 10:22:19 -0700 (PDT)
Message-ID: <849dc8348735a3682a6de4be9f76138a73567dc8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: Remove mismatched inodes from the db
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2020 18:22:18 +0100
In-Reply-To: <20200922110610.29c2c97d@seebsdell>
References: <20200922131825.2496981-1-richard.purdie@linuxfoundation.org>
	 <20200922110610.29c2c97d@seebsdell>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-22 at 11:06 -0500, Seebs wrote:
> On Tue, 22 Sep 2020 14:18:24 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> 
> > This can happen when files are deleted outside of pseudo context and
> > the inode is reused by a new file which pseduo then "sees".
> 
> In terms of the original design: This would be considered a usage bug,
> and pseudo issues diagnostics for that. Once files are owned by an
> instance of pseudo, it expects to "see" every change to those files,
> and if you don't do that, then yes, the database is corrupt. But in
> some cases, the behavior was something like "a move within a pseudo
> filesystem" or something similar, and losing the data would also be
> bad.
> 
> Basically, the original design philosophy is that you should *never*
> be modifying things pseudo owns outside of pseudo. And that does impose
> a performance cost on things, *but*, it also gives us a lot of
> confidence in results.

The "fun" here is that "make install" is rewriting Makefiles within the
source code tree. The install step runs under pseudo, earlier ones do
not.

If we rerun earlier non-pseudo steps, the Makefiles get reset to their
original state, then "make install" modifies them again.

We don't run unpack/configure/compile under pseudo for performance
reasons, these steps don't do anything we care about from a pseudo
perspective.

> So my preference on "deleting files outside of pseudo context, inode
> gets reused" would be "don't do that then"; this is why pseudo reports
> diagnostics for those. Being able to tell you what the old path was
> in such cases was actually one of the primary reasons pseudo exists.

We're not intentionally doing it. Perl's makefiles are doing crazy
things. I'm not sure we can:

a) afford to run everything under pseudo

or

b) catch every case of code which modifies files in unexpected places


Part of the trouble here is that we can't tell pseudo "only monitor
files <here>". Realistically, it can't expect to monitor every file on
the system either.

We are breaking pseudo's original design, but in general it seems to
work out fine (and we've been doing pretty this for many years now). We
may need to accept we're not operating entirely as designed and
consider if we could/should be changing some of the responses to these
corner cases accordingly as I don't think we can realistically avoid
them?

Not sure where this leaves us :(

Cheers,

Richard


