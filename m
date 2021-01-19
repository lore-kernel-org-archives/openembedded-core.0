Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.15079.1611078845919534086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 09:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WDfr6uSw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d13so20569435wrc.13
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wuZyNzGDv3sEpveQaDC88UV1Z1vspxbRRHUD7yY2RKQ=;
        b=WDfr6uSwz53aBJ+lssYzehpMymH0GDAWVgzAcD61y5r5tMT2rHj3npNR2t4sGjYIa/
         B+1mH1Jes0bjGs+fBazmzgxUD3TN/QSBa3DgATGzdmBBdwa9yHKnCZqO6T71VzSu7dnn
         eg67R+hA89IrqRpjpbVJUFVJYbWz7FIJqYWdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wuZyNzGDv3sEpveQaDC88UV1Z1vspxbRRHUD7yY2RKQ=;
        b=hCeEKPi9zuSlWF3YREAnObxnzpZEC3nLmOS9kIMNtZdz/Y860Ie68kZci9I9JwPuLr
         JXscBpRBl3DYhA8OQqfaoZEgzmJX/nwnDaeACYVWxHg3AgJeRU7amGr6xrm7nkWUuT4B
         okfu9g++Ow8N65Ew99/6QIFKcgtU4OLWtCXZLtHvs/YSH2py2TPHuzDLhxACsqa1x3hN
         hEkml9Ifcga2RZ/KcM/8RIsG510OqFkJzKnjkAchMEyl3Rwc44Bsp5pnFuTc5YsGm2Lu
         Oacmsyt7aUMxbrgUYRJvPURgOFl76TBCH4YYN7JvqsGIM/bRxKUtXmghQTVcdGA1OR8m
         NQiw==
X-Gm-Message-State: AOAM531rWzvs9Ik/iiQY7PfAn4ZKdy1JcuRYPfZIeQnr9f2U950N6CCb
	Hjkwr8XDAlk82yulZlSGWRTl4A==
X-Google-Smtp-Source: ABdhPJzJ4y62yublgWvQ8dOgIiA+hEKI81mn0xQd3lp+YliVmNUOUlmTMQV9xt9OMPjSFB4J3n8VxQ==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr5396668wru.398.1611078844517;
        Tue, 19 Jan 2021 09:54:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id m82sm5783025wmf.29.2021.01.19.09.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 09:54:04 -0800 (PST)
Message-ID: <45d63db6a8595ed5e74975e874e4a24c610228bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] uninative limitation: UNINATIVE_MAXGLIBCVERSION
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alan Kozlay <alan.kozlay@ves.solutions>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 17:54:03 +0000
In-Reply-To: <CAJE9sGmu6VUQGBtxpDHh6RH9B44DRfeuSNrMrB4Ea5N1GWLFhw@mail.gmail.com>
References: 
	<CAJE9sGmu6VUQGBtxpDHh6RH9B44DRfeuSNrMrB4Ea5N1GWLFhw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 12:15 -0500, Alan Kozlay wrote:
> All,
> Why does uninative.bbclass (around line 86) revert to my hosts glibc
> if that version is above the uninative version but our sstate-cache
> is only local (not hosted/shared)?
> 
> I want to know in general terms (what could go wrong), but in case
> you're wondering, my specific environment is:
> 
> Building with "zeus" release but can't update, at this time.  The
> "zeus" release provides glibc 2.31 uninative glibc.
> 
> My build machine is running Fedora 33 (glibc 2.32) and I'm leveraging
> the x86_64-buildtools-extended-nativesdk-standalone-3.1 tool.  Yes, I
> know that "zeus" is 3.0 but the "extended" version (also provides a
> compatible native gcc) wasn't introduced until the 3.1 version of the
> standalone tools.  But 3.1 seems to work after back porting some 3.1
> fixes into some bbappend files I made.
> 
> But, again, my question is about the general case and not
> specifically my environment.
> 
> Anyone?

Your build will generate binaries that link to glibc 2.32 specific
symbols. These can then be added to sstate and since uninative only has
2.31, they won't work on a system that doesn't have glibc 2.32. This
means that it would break the promises about being able to share sstate
between distros.

glibc is only backwards compatible, not forwards compatible so there
isn't anything we can do to fix this limitation, only detect and avoid
problems by separating the binaries.

I'd note that upgrading just uninative to a new version should be a
safe operation and should be able to be cherry-picked alone safely.

Cheers,

Richard

