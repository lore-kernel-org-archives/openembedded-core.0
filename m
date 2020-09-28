Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.6312.1601329351537127693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 14:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dpR8Nlqt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id b79so2605230wmb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=t84A1sFVgCNnq/vN/ngPm21zoWNmO9hGt+zJpjL2cTY=;
        b=dpR8NlqtpJz3N3dPsM9fff14Ja+dPky3mPf/MPx95z/4bBiU23rruC3uOihSKynN+B
         GIO2hdt/z8enno5mgkV1mtU+CsYKnfzrIzABWiJha/WQGUBMi6rMynKvNN1pCafQf3YH
         VlZeXBv5uo2g02sx0U6snZOwgbyxufuvzp9ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=t84A1sFVgCNnq/vN/ngPm21zoWNmO9hGt+zJpjL2cTY=;
        b=Qh9Br/IO9Nn8PvpNBLVUwJMPqEHRArm9bZDUvhBTdLVe0riNEnxFMFsl62NUYSB9pS
         e67DHgsrDQzFpO8W1sRIdldJsJmDcpioyxXqpvkxCA4AQA7MWFUdgfIDA4gHks0uidZ/
         ztHfAfRmQXFvAiBVnWB22K2SX0AGMnkBPcGfAWOgJQ5yrmaGD7R7LgzrdEjE4FaGXZ8T
         Eo7b5duA9fq++Vump/3Lvt10hOaJqr99lTzlssQVNL8eg+48R9sY+9AWNaQqU39HLTn9
         T9b6RjV8atjg+Uqm+esuCzLGzLc4bDaC7fWeIEtVzhyK1eR5XYPpNjjWaeIr2osJ1vqQ
         EAqA==
X-Gm-Message-State: AOAM533dDfyUt5niSKrovrm8hzFAhysdtF9ouj4wdSS9KMxEX1QZ50xK
	resZVh0O/o6YE+DewLN/B0z51A==
X-Google-Smtp-Source: ABdhPJyEvzv+d1RKciH/7ylzxgYDIt9K8vfVykUz1VpJWNDpKzTmkvb/ui8BoJrs3Y8fHdZLljPu+A==
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr1117269wmj.116.1601329349744;
        Mon, 28 Sep 2020 14:42:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6c:353e:c478:dfd1])
        by smtp.gmail.com with ESMTPSA id q68sm580390wme.25.2020.09.28.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 14:42:21 -0700 (PDT)
Message-ID: <cef99332d290dc2fb0c39b8fa3ee022b64674ee6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] pseudo: Ignore mismatched inodes from the db
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2020 22:42:18 +0100
In-Reply-To: <20200928105617.11183951@seebsdell>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	 <20200928133803.2741507-2-richard.purdie@linuxfoundation.org>
	 <20200928091341.3eebf87c@seebsdell>
	 <19cfd5621921a2cf1f19be76bf216c7ac42b2e4e.camel@linuxfoundation.org>
	 <20200928105617.11183951@seebsdell>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-28 at 10:56 -0500, Seebs wrote:
> On Mon, 28 Sep 2020 15:51:53 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> 
> > I understand. I have strong evidence that the current handling of
> > such
> > a case does the wrong thing though as copying the data from the
> > original inode leads to pretty bad corruption in its own right.
> 
> Yes.
> 
> But if you had to choose between (1) discard the possibly-bad data,
> and (2) abort(), 2 would be a MUCH better fix.
> 
> Don't treat this as a thing to be worked around. Treat it as a giant
> red flag that *we no longer have a sound reason to think that the
> database is valid*.

Ultimately I agree.

Lets plan that we need to put an abort() here. We're not quite at the
point we can do that and I think changing the behaviour is a reasonable
first step so I do plan to add this patch however I will plan some
further patches to turn it into an abort(). How quickly I can do that
will depend upon what kind of issues it throws up.

> > In many ways I'd like to make these corner cases hard errors. In
> > order
> > to do that we need to ensure we're not hitting them though and to
> > do
> > that we need the next patch.
> 
> Yeah.
> 
> > Once we have the ability to ignore subtrees, we could just hard
> > error
> > for the potential corruption cases and force those issues to be
> > addressed properly.
> 
> I think that is the right path.

It helps to know that! I wasn't sure if you'd hate the path filtering.

Cheers,

Richard



