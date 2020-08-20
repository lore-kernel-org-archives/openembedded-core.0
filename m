Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.109582.1597927782287786893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 05:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eNoMdvBO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id 88so1917965wrh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5M8S6cZSR7nllm8EdjPpLwRh6xryAoaNnQU/GhyebrY=;
        b=eNoMdvBO/P18zh9LeDhljIzQAhcBxslFbYTDJ5ewEQ+cPbNnI48Hz7pftadoPig0bS
         kjeVS8ADbLMUAzP+snDKEX44s6dXAK8QVukkZTYSEiJVO5YYvLRHcj/AtxBl4uE+mBZq
         ZMWP05hC4gxQofVyGha1k25BuNJqw8L/fHL+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5M8S6cZSR7nllm8EdjPpLwRh6xryAoaNnQU/GhyebrY=;
        b=aO36dfc9tzIB7dJwEW/5cOVZCBhITuRAyya0eLVY3Yxb1ms2YjXBPtrJsmAIPvgUml
         Ypm5RVhhP3UBmJDg6lksa1bvfMzxiU470Ix5MnzvVZ2xU6fEA6ryVfEJPBwSHjHyrpKj
         ZRQb2XMiyR6lOFl5yhPzS6YZjBBaK2Q1+M71muxMSIIzOeJbPkyNwQKq9l7+YT+8FJiE
         ho4/NH6tSB19xoeaLJN0VyCfjmTWG/sreIKT4rV73Rkywhlvma6f0kVecDNHJ1XGqur0
         seqt57W1o5Cmx9j2pZbV/PnnUO9jcdTZxZEgJJX2rV4C5eMMAFqdxhmKsRlahp6jQn46
         w0Ng==
X-Gm-Message-State: AOAM533e7OZqonPProKN8Wxq8HkAeM6sNYDYt8mEYdlsjENUwxZ39Yt1
	NBqCNOem1wyFwPQHBXgW/hLUUg==
X-Google-Smtp-Source: ABdhPJwm/1JoVtyPsml9bvP6OJ6RjQgG/X70b2wlzlnETJhuvoVqCkdNmbVE0rxIQtxfD34SCL5XyQ==
X-Received: by 2002:adf:e911:: with SMTP id f17mr3053424wrm.397.1597927780580;
        Thu, 20 Aug 2020 05:49:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id k1sm4329733wrw.91.2020.08.20.05.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 05:49:40 -0700 (PDT)
Message-ID: <0c4384d70e7548a14b57b67f260d027220c2e15c.camel@linuxfoundation.org>
Subject: Re: hash equivalency and PR service - RFC
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 20 Aug 2020 13:49:38 +0100
In-Reply-To: <54f14f4e-00f3-950f-c28e-7da70857804b@kernel.crashing.org>
References: <54f14f4e-00f3-950f-c28e-7da70857804b@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-19 at 23:44 -0500, Mark Hatle wrote:
> I've been working recently to try to get hash equivalency and PR service to work
> together properly.  Earlier today I sent a patch to address one of the issues I
> found (un-related to PR service).
> 
> In order to replicate the condition, I've been using poky master (oe should work
> fine) with the following configuration:
> 
> BB_HASHSERVE = "auto"
> BB_SIGNATURE_HANDLER = "OEEquivHash"
> 
> PRSERV_HOST ??= "localhost:0"
> 
> PKGR[vardepsexclude] = "EXTENDPRAUTO"
> 
> INHERIT += "reproducible_build"
> 
> INHERIT += "buildhistory"
> 
> I then run:
> 
> MACHINE=qemuarm64 bitbake glibc
> 
> Go in and edit meta/recipes-core/glibc/glibc_2.32.bb, search for the
> do_patch_append and add "# modify hash".
> 
> Re-run the build command.  The result SHOULD be the system detects that nothing
> changed (in do_package, inspecting log.do_package should show it changed the
> unihash.)  And then the rest is accelerated.  However, the PKGR (from the PR and
> AUTOPR) cause this to fail, as well as any embedded dependencies that also have
> PR/AUTOPR embedded into them.  Both of these are written to pkgdata files, and
> when compared to prior builds for hashs will always be different.
> 
> I tried to break this by moving the AUTOPR value into a separate file that was
> not used to calculate hash information.  For the most part this works, but I ran
> into some problems.  (See below).
> 
> I've generated a patch:
> 
> https://github.com/mhatle/poky/commit/86fbd639261319de4c951708d9805abba6036510
> 
> (I'm not entirely happy with the change, but I think it's a reasonable start for
> a review to make sure the direction of the change is reasonable.)
> 
> The header of the patch explains some of the work that I've done:
> 
> 
> When the PR service is enabled a number of small changes happen to variables.
> 
> During the do_package task, EXTENDPRAUTO will get a value placed into it that
> is intended to be used to extend the PR.  This value will get written to
> various intermediate files and will result in the computed hash never being
> equivalent.
> 
> To resolve this issue, we create a new file with the extension ".oe_nohash".
> This extension contains various values that need to be passed from task to
> task, but NOT calculated within the scope of the task hash.  The items
> placed into the nohash are captured in package.bbclass in PKGDATA_VAR_NOHASH.
> 
> The PKGDATA_VAR_NOHASH is also used to prevent expansion of the value when
> users are written to the various pkgdata files.  This expansion is prevented
> by replacing the variable references ${VAR} with ##{VAR}## in a local
> data store.  The pkgdata loading routines then know to load the nohash and
> translate the ##{VAR}## back to ${VAR} automatically.
> 
> Additionally package dependencies rely on variables that also eventually
> include EXTENDPRAUTO.  So instead of resolving the variable at getVar time,
> we keep them as references.
> 
> The goal is instead of taking:
> 
> RRECOMMEND_package-dev = 'package = ${EXTENDPKGV}'
> 
> and making it:
> 
> RRECOMMEND_package-dev = 'package = 1.0-r0.1'
> 
> We want to keep EXTENDPKGV which internally refers to EXTENDPRAUTO
> which is already in the special NOHASH category.
> 
> NOTE:  The above is not working properly in the case of ${@...} python
> functions.  This is because the bb.utils.explode_dep_version2 does not
> understand how to expand or deal with ${@ ... } syntax.  (It expects
> a comma or space separated list, so the spaces cause problems!)
> 
> 
> If anyone has any ideas how to address the RRECOMMEND issue above, I could use
> some help.  I'm going to keep working on it, but I'm not sure how to get the
> system to expand some but not everything.  (I might need to use the same local
> datastore trick in this expansion that I used elsewhere.)

The trick to write out without EXTENDPKGV expanded would be along the
lines of:

localdata = bb.data.createCopy(data)
localdata.delVar("EXTENDPKGV")

then access the variables from localdata where EXTENDPKGV should be
left unexpanded in the results.

The potential problem would be any cases where it was already expanded
before this code.

Cheers,

Richard



