Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.12429.1598359059046967148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Di+Gb23m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id q14so1431090wrn.9
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 05:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9JWGjQ+qyMlTUF+wF5mRokF92PzhYGDYvu62PjuytSc=;
        b=Di+Gb23mYk/ugk3wGH6o849HofZ3FBgEOKX9y1VywBcSiJZX/IYeTmJ8pDl3bdoBZc
         JCVAZzkb+lULwZBZMMOiZkzMLKpAawVsf7abg4G1OGWcQWM4DGrK4Bu+MmBsVapcnBGM
         6ekKeW//bf6sUKhL3rMxIQPtVI8H5+eCOTu48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9JWGjQ+qyMlTUF+wF5mRokF92PzhYGDYvu62PjuytSc=;
        b=p4YjGaET8cn7kKJqXxmrjUXLW1Vm4Gr2U5VP/N7cmlhbmujShp65+XhBywl16elxHR
         4/fGwKo/wn/PqBvHnKBIOVL48I3hMTVGB6rrftU1Wxu1K/Pgntp2nYxfnYomVjFvt56a
         VXCCfE3h6qwhzYPVDLGizUi3IpUVj6BpopixJPU4cxxN8FKO2XwDOFiql3q65YjiS69E
         7gl9VRgK5Z9a1K/DGYkUBsYgts4/Fg8gnJXN47vvAjJVt+WVOiTE4PD3QZ+4oMruh7Dj
         +Jod4m8CnDLwxWjrkkyeS629ckkV7opwYVHFFWDQM+kDXcBDG0fO36yDX6RITZhm5RDy
         UQrQ==
X-Gm-Message-State: AOAM533yn4c5dBOjvrWRVQGqWG4aHcbWyewA/HO0iQ9h4Ngec1JAc2Pr
	Im1IGuTGFtHowQBZuKDuLiweAw==
X-Google-Smtp-Source: ABdhPJyP7ZeYIjQSBmPJ4jlnbgWNzmCG1Qt4E8dHPQggBz8QjD/MEkKARt5ur9tI3sOz6gd1COF1ig==
X-Received: by 2002:a05:6000:c:: with SMTP id h12mr10189084wrx.49.1598359057338;
        Tue, 25 Aug 2020 05:37:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id b8sm8694901wrx.76.2020.08.25.05.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 05:37:36 -0700 (PDT)
Message-ID: <0fad824f6ba54c1ca81b2c21aee58a5fea9ecb18.camel@linuxfoundation.org>
Subject: Re: do_populate_lic problems
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2020 13:37:33 +0100
In-Reply-To: <5044ffcf-5959-1ada-0ae6-b351e55b4c0c@prevas.dk>
References: <5044ffcf-5959-1ada-0ae6-b351e55b4c0c@prevas.dk>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-25 at 11:13 +0200, Rasmus Villemoes wrote:
> There are a couple of problems with do_populate_lic, especially
> around
> the kernel and u-boot recipes.
> 
> First, we have a race condition in kernel recipes:
> 
> addtask populate_lic after do_patch before do_build
> addtask symlink_kernsrc before do_configure after do_unpack
> 
> so there's no ordering between those two tasks. I have in fact seen
> do_populate_lic fail because (part of) it runs just between the two
> lines
> 
>             shutil.move(s, kernsrc)
>             os.symlink(kernsrc, s)
> 
> WARNING: Could not copy license file /mnt/...
> ...
> ERROR: QA Issue: ...: LIC_FILES_CHKSUM points to an invalid file:
> 
> and it's fairly easy to reproduce with a monkey-patch:
> 
> @@ -148,7 +148,9 @@ python do_symlink_kernsrc () {
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            import time
>              shutil.move(s, kernsrc)
> +            time.sleep(15)
>              os.symlink(kernsrc, s)
>  }
> 
> I think this could be fixed by making symlink_kernsrc run before
> do_patch rather than do_configure - in fact, AFAICT, there's the exact
> same lack of ordering with do_patch, it's just that nobody usually has
> any .patch files for the kernel when it's maintained in git.

I agree with that solution, please send a patch for that.

> Second, as I've reported previously [1], creating hard-links to files in
> kernel or u-boot source repositories, as do_populate_lic does, leads
> to scripts/setlocalversion falsely appending a "-dirty" string. It
> doesn't happen if one is building a kernel containing ff64dd485730 or
> a backport of it (e.g. v5.0+, v4.19.82+) _and_ one has git >= 2.14.
> U-Boot hasn't
> copied ff64dd485730 yet, so it can always happen for U-Boot. Since
> there's no ordering between do_populate_lic and do_compile, it's not
> even deterministic whether that -dirty string is appended. So while
> appropriate tools and patched upstream projects will make the problem
> go
> away, I'm wondering the hardlink optimization is really worth the
> trouble it causes.
> 
> [1] https://lists.openembedded.org/g/openembedded-core/message/137702

We use hardlinks a lot and it does help for disk IO and performance.
Has this issue been raised with u-boot upstream? They're usually
helpful and there are a few of the maintainers using OE so I think
they'd want to fix this if they know about it.

Cheers,

Richard


