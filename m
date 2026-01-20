Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DF6D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 10:31:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3574.1768905088985456240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 02:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hlEf+7oe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so22058035e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 02:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768905087; x=1769509887; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uwVaUQlBbtrRMzXrZAe+URbd1gLvSkKYm7kRJxmfyYw=;
        b=hlEf+7oegibzi4OtwMvyer64yH8c84qhZwU8vYlYkZogcwORk0bZTnc+6ACAuY4ZSo
         +533HAUJc3ue4ZNF9R01/MUAXV8eGKMZ7CxL7zGrg4CA1HzeL9dsVeeKl4NAi+u8cLzZ
         Za1YKYTA2dtWRLtvFUBG5HecejT7M9U0WDqqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905087; x=1769509887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwVaUQlBbtrRMzXrZAe+URbd1gLvSkKYm7kRJxmfyYw=;
        b=kchHUR/GeAwPuJsJ9Nuha5gmcJzmrtMDapvafAxtY1sZiDolqgz8Ft2F+NzMjDJd8v
         bXzwVZyPOW7d5OTLFZeHVtqlukAM7EgGbF/RVFGYMaQGGjuogKCtTpQSDlaPb8MIqcii
         YSQqeqgWfRAc5W1Mr1OHNxI081Kv/6dC/9pAcLmX/I6oQ7SOPB9JUTwSBPp4g5JoKYvx
         f/aX3RBjPc+8ZlsJGHPCPRMxj12gKsdSkawGVevxF/6s/LFBA/15+UTSMnoWQWIQZDXW
         Aaw8gz1t49+DvCxTe+7uRcxcKf6H2NARzEk5uYuUNIZnw6nHCrf4L82ttEySJI7a3WL4
         NTmw==
X-Gm-Message-State: AOJu0YwAdg9Ke6CmnUf+rAFAjgxU4jGR3tZuZszMci0GQK6a0mHeOyQK
	L9j1llr8lW2CNaDkLdy/Ik5kEJrszUJW7C7ujgxjPGDeqF9Wo50BWzw5babUtNhYHP4=
X-Gm-Gg: AY/fxX6ZDdKt0dLbbnnC24ESbGVTwQTloXwtbPRuqqJBVOri9oEDRqi5qdmqccuh/d5
	C/tkQWSeUO32sIIpf7pIzKAjPnWurnAN0t2TplDd0L1ysxFG1F+w2hoRPuVB38w73/9KjHmsGop
	Li2UB/GPXmmUqIa4AAtN/e195LtTxq44A0dTZafGEssCMx2jdZ44a6jRhTQPPx20I1+6oQakQaZ
	4zeDnZTtWc+zBZTbeG5LnFiQD6nmgr5qHfGbV2hc6mThby3iWAKLoIU63GUcxsHaQT8r+jWofb6
	aEzIg9HdybsMUUOCnylgQSpehbcWoR4V9UI2G9S+IB1x/aqv2zd8iQvFS/NLTKROspfJQXEq1WZ
	v2Uf0iPclTHxPUaatAHxC+5lqIhKJeqiLNBhbs0Zs/SYrcKdNKdBRKIKLa4/vG49o8p5FBWOzCF
	5qms8zxQRsx/sPaosX37omUC3Jgjy4ZhfxaBBDY7ISNovTENhbEu/2edTwX/bSQNLtfLST/B/E
X-Received: by 2002:a05:600c:1910:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-4801eb181b8mr171536665e9.35.1768905087072;
        Tue, 20 Jan 2026 02:31:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:62c:c694:1cc8:4ee1? ([2001:8b0:aba:5f3c:62c:c694:1cc8:4ee1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm180128485e9.7.2026.01.20.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:31:26 -0800 (PST)
Message-ID: <83cb39fb9474846d054baa83925e63cb4bdef32c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] pseudo: Update to 1.9.3 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, Mark Hatle
	 <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jan 2026 10:31:25 +0000
In-Reply-To: <CAMSfU+5Xyi8RZFaC4q4b9B9DGGB7=AjbKkvn2s+WtJKcsBVRKA@mail.gmail.com>
References: <20260120085227.3719998-1-richard.purdie@linuxfoundation.org>
	 <CAMSfU+5Xyi8RZFaC4q4b9B9DGGB7=AjbKkvn2s+WtJKcsBVRKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229656

On Tue, 2026-01-20 at 09:59 +0100, Yoann Congal wrote:
> Le=C2=A0mar. 20 janv. 2026 =C3=A0=C2=A009:52, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> a =C3=A9cri=
t=C2=A0:
> > Pulls in the following changes:
> >=20
> > =C2=A0 Makefile.in: Bump version to 1.9.3
> > =C2=A0 configure: Minor code quality changes
> > =C2=A0 pseudo: code quality scan - resolved various potential issues
> > =C2=A0 makewrappers: improve error handling and robustness
> > =C2=A0 Update COPYRIGHT files
> > =C2=A0 ports/linux/pseudo_wrappers.c: Call the wrappers where possible
> > =C2=A0 ports/linux/pseudo_wrappers.c: Workaround compile error on Debia=
n
> > 11
> > =C2=A0 ports/linux/pseudo_wrappers.c: Reorder the syscall operations
> > =C2=A0 ports/unix/guts/realpath.c: Fix indents
> > =C2=A0 pseudo_util.c: Skip realpath like expansion for /proc on Linux
> > =C2=A0 test/test-proc-pipe.sh: Add test case for proc pipes
> > =C2=A0 ports/unix/guts/realpath.c: realpath fails if the resolved path
> > doesn't exist
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Do you think I should take this for stable inclusion? (leaning toward
> yes)

Good question. Copying Mark.

I suspect it will be easier all around if we did take it. There are a
lot of fixes in here and it is hard to know which ones any given user
might need or run into. There isn't any real feature work, just various
fixes for new glibc calls or existing code. The failure modes for
pseudo are problematic for end users who wouldn't understand many of
them. The realpath/proc fixes are the most invasive piece.

I would suggest we wait a little bit before taking it, just so we can
test things with master and ensure there is are no regressions.=20

You would need to take the dpkg ADMINDIR change as well as the pseudo
changes won't work without that.

I'm open to other thoughts either way...

Cheers,

Richard

