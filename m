Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.8541.1602534808639692085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 13:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P3RTtvS0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id s9so8689903wro.8
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fyIHDHJz4A99hherp0/1pV52YqcAu2hkWMDRk6W8Rr4=;
        b=P3RTtvS0EWfnPw0TR5FoFszSxdTlTfFxhcOnUtyVStAwJRjcH/DfBPQw5+wjJY46Lv
         GWb4eiZ7zNMTAJzpxE7QdV2L/epC6OCyOuOGhAFD6/SDToABB8kn09AfEE4LEFHdgg2H
         DRGBguvwr1R7SkFUU1InG5GImUp7UNE2SZocY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fyIHDHJz4A99hherp0/1pV52YqcAu2hkWMDRk6W8Rr4=;
        b=dBEUcHr1O4Ri5Av/LBZ6dW9KKrw8H6033cTk19fL+edeqLXqnidNXYRSbyM8vkgpjm
         x5XZHtRBINrL5IDjMzitHJwWa8drjKksuHffnHXy+JxWozGkhH+eKjpFW/c9xGFDmHv8
         CNktYmfsTkpzrGCx0BosCrATETsKh/CIBtJJNYPMeJh6ra3vNkk/jA9aQVVDMVbVGDea
         mxDG/ok2l2RkIy/BWbDI5ffXb1wAUwKT/cqblQtmZ9dVTg4k3+XsBG8fo1qqUMI6oXOf
         GJmEgbD03kWlATO2y+H4Ye/7BfDXXbaRVVhDwN2nqsqiDIDr9ySUFfzQKOqa7GKymnwt
         N5ZQ==
X-Gm-Message-State: AOAM530LRsgwCSernNe70Hq/SzeBeuuNm2SEGA+WTQ6za6JVaRwdyzS5
	AknT5iUMyLtMpROJDKaIH7YMiA==
X-Google-Smtp-Source: ABdhPJwYdMhfANerNwp73gGeI2fGysXhcY+3FRPm2fexAycz2JrybnOO78cVH8UMzUlyeRW9t0oXMQ==
X-Received: by 2002:a5d:5449:: with SMTP id w9mr33533291wrv.182.1602534806969;
        Mon, 12 Oct 2020 13:33:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id w11sm25728364wrs.26.2020.10.12.13.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 13:33:26 -0700 (PDT)
Message-ID: <68a99b0b75f85df90768ea3388fd10ee6dc49d04.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/9] pseudo: Add may unlink patch
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2020 21:33:25 +0100
In-Reply-To: <20201012142045.66f28cb8@seebsdell>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
	 <20201007101449.3132127-6-richard.purdie@linuxfoundation.org>
	 <20201012142045.66f28cb8@seebsdell>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-12 at 14:20 -0500, Seebs wrote:
> On Wed,  7 Oct 2020 11:14:46 +0100
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > +Some operations may call unlink() on an open fd, then call
> > fchown/fchmod/fstat +on that fd. This would currently readd its
> > entry
> > to the database, which +is necessary to preserve its permissions
> > information however since that +file will be lost when it is
> > closed,
> > we don't want the DB entry to persist. +Marking it as may_unlink
> > means the code will know its likely been deleted +and ignore the
> > entry later, giving improved behaviour that simple path +mismatch
> > warnings. We can use an nlink of zero to detect this.
> 
> Eww.
> 
> This seems like it could create a bug. I would argue that calling
> fchown/fchmod on an unlinked thing is almost always a sign that
> something's wrong. I guess fstat is reasonable, but in the fstat
> case,
> it seems to me that there's a risk that the newly created entry won't
> match the properties the file last had. If you have a file in the
> database owned by root, and then you unlink it, and then call fstat
> on
> it, the fstat entry would show it being owned by the user, and if we
> then create a DB entry with the user's ownership, that's actually
> sort
> of wrong.
> 
> But I can't immediately see a way to create a new link from just a
> file descriptor, so it should be short-lived, anyway.

For better or worse there is code in the wild which does this. It seems
to be in code being paranoid about 'securely' creating temp files.

I did see the new ownership being potentially wrong issue but as you
say, it in theory should be a short lived problem.

I'm very open to a better way to solve that issue, this was the most
effective way I could see of differentiating this case between other
"path mismatch" issues which we abort() on.

Cheers,

Richard



