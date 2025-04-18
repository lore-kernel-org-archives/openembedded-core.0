Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECC3C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 19:35:33 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.3857.1745004923643275773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 12:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ubq0ABX2;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f2b04a6169so21738696d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 12:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745004923; x=1745609723; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O86mRbKos06Luj9eDwKUJ+VhAV64puPZyMdWwCiIXSQ=;
        b=Ubq0ABX2fr/Uc3wRVSyf3KBYXUJQV7+6Wi+mbg27lXx5hbPWvml1yz5XYLGHcg6z6/
         KG9+GNrmOjO0c2byxtSmIw9FSWrn3eeRm4az6aDKHOl6vRXVZWROcFlLR+Qj9zS0cfnB
         4XiUL2Ak294gTSAuBMVM0lAhFQ5wTlgeTIvSMyafAk4ftI+/QAT96sBmvMY0AY1mImy+
         Pf+ws5v96U3aGMwp8vTVMDOVbck0cw7Ee0bz5AG/8i9B+ee9peTLlNeKGobgqsD4hKrd
         El8lJyOfXOQ0dbJZOCdbJN+rP9i39ASyosx3Nz6Cjvs3lyvpK45/XPcb00EGyssmtJ92
         Wfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745004923; x=1745609723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O86mRbKos06Luj9eDwKUJ+VhAV64puPZyMdWwCiIXSQ=;
        b=bxQ85OpNI3Sj8aGHcvqB7whxt31DnwKu0gsJ4z7mDtt+XTAY+8qkek6RCgcyqUVE5g
         1vtSCnNGPN/jMFtwWY8WS/NelKdh0eTldLxDWsUxt5XnIXVyy79GuJGe5edZ2HfwC1gV
         lpXPKurW/L4GMIwH7V5TzOjEBgzrb92crlKh0EcL26eU2/XZ2iAhue8itiX5KSvP2JWH
         g2SwsVGXShKNc1ofhZMkSp+WxY2vg7Jm+huwE0861Yly9sJWsHzgR7g4+nfHd9MTxULg
         WMG9L4lOm5wsLx3G8Jy5v6jA0rPk7jHEHqPJuAOHwSUgw0WMSWtL/T5mr+ugZjAn1khM
         YTlQ==
X-Gm-Message-State: AOJu0YyrMs9WINiobLBz0lBX8eTZpQhU20bL3YrbRhbq3DCSVOgYh7xp
	mF5LyoDyEZi3Ma4MJjhTmvUvO56j0p685ooY9jGobCB3w+Bv1TbL40YZC7Gv
X-Gm-Gg: ASbGncvXrgBPJL+30luGx8hVSy8fkOqlGc+zUEJ4FkhlUdirYvdyc0+8DuBSs+2qeyn
	ZA9vAQgKVC1R6shhq6JIIa04GQ+phjivbi2Nc/Go9eV5ekxo8V2F8/WNiQb9Vd6naHcfvnNLqBi
	SBuaU92T9uTHXJGLbqBzYF/JC8Fj/0LC41o4U+6w2vt4PRJIGBsGCk4N9XSr8L/4KPr4sUv1WZi
	oG33Hlhl+BWAoyROE+H3fe7No8AhnxYlt3UZdjaAAPWn4hyJvGco39AmS5/+tRJLOYChBydRL/N
	0lAYLeviWt1gwzz8SBCfvBetvFQg4zt27NJNyXJ2gXMjmkeeTswFIwt6WUnX4g5Sdttxkb3aQML
	jNXidJgEIqAew28sLZao=
X-Google-Smtp-Source: AGHT+IG2/q3Pnvl5x523Zx7nt+CrA9EYMBii7mb7qcPfTvhuUZ6kwjwW5FKZHMnO0UFSheoG0XujfQ==
X-Received: by 2002:ad4:5d43:0:b0:6eb:2878:e1fa with SMTP id 6a1803df08f44-6f2c4688548mr67451246d6.45.1745004922615;
        Fri, 18 Apr 2025 12:35:22 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21d3asm13696656d6.100.2025.04.18.12.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:35:22 -0700 (PDT)
Date: Fri, 18 Apr 2025 15:35:20 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Michal Sieron <michalwsieron@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-module-split: Allow for external conf
 files
Message-ID: <aAKpeGEgdlK3jOdy@gmail.com>
References: <CADkTA4O_t=cggrERmZV8L64X9n3iEatdtqj5_NcGYxzcxAPDCw@mail.gmail.com>
 <20250417151158.282362-2-michalwsieron@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417151158.282362-2-michalwsieron@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 19:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215140

In message: Re: [OE-core] [PATCH] kernel-module-split: Allow for external conf files
on 17/04/2025 Michal Sieron wrote:

> > Whenever we add a different code path, we need to add a test to
> > the oe selftests, both for the existing case (if there isn't one already)
> > and the new one. Without those tests, we'll get a better understanding
> > of how this is supposed to work, that it doesn't break existing users
> > and we'll know when it breaks in the future (since this obviously won't
> > be a default path with our reference distros).
> 
> The problem with this is that there are no existing tests for
> kernel-module-split.bbclass. So I would need some heavy assistance with
> writing such test cases :(

We can definitely help with this, having specific questions will
help of course, but this is worth the effort (and in fact may be
the only way to get this merged).

I'm no expert in self-tests either, but can offer some of my
time to sort through the issue.

The code is simply to complex now to not be tested at all. We don't
need something complex, just something that ensures a conf file is
generated in both cases.

> 
> But I do agree that tests are generally a good idea.
> The whole reason I sent the patch is because I noticed that behavior
> change between kirkstone and scarthgap caused by this change in
> oe-core:71460993f350bca3d5a22115fd5551696f955c9f.

Agreed!

> 
> > A comment about how your high level description in the long log relates
> > to needing to move these variables outside of the conditional would be
> > helpful.
> ...
> > A quick comment here would help as well. This is now outside the
> > conditional, so a comment indicating that the file at "name" can either
> > be generated above or placed there by a recipe will help with
> > maintenance.
> 
> Will try to somehow explain it in v2 of the patch.
> 
> > Also, what happens if the file at "name" is updated ? I don't
> > think the module splitting would be re-run, so would we have a
> > "stale" file ? Should that file be something in the kernel-module
> > recipe that triggers a rebuild if it is changed ? I don't see that
> > mentioned (maybe I'm imagining the problem) or a requirement
> > on the recipe.
> Wouldn't that alter do_install's checksum? Otherwise I don't think I
> have an answer.
> 
> 
> Anyway, while I was preparing this response I noticed some other things.
> 
> 1. pkg_postinst hook
> There is this `pkg_postinst` part for "autoload". I guess I should move
> that hook so it is also installed when .conf is vendored, is that right?
> Although that wasn't there before the regression commit I found.

At a glance .. yes, we'd want to keep that same behavior in both
modes.

> 
> 2. Duplicated entries in (CONF)FILES:*
> Even before my patch FILES:* and CONFFILES:* entries for kernel
> module packages are for some reason doubled. But that is probably for
> another patch.

Yes, it would be best to do this patch, and a second separate one
that sorts that out. If the logical changes are separate, they are
easier to review and merge.

Bruce

> 
> Best regards,
> Michal

