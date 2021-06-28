Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9007.1624873503471052287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 02:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EDhfzbjw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j1so20409082wrn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QYMItOpjKFy8m0C0zRgFnkKeCioK6gZ0YYspN1r/fZ8=;
        b=EDhfzbjw9z7/anctEcDkRKhSFF26VHTOLaGTbEPa9/LhpYAw37LhlhaI+M/eyNTJVi
         HttAxuMtiNttXVhKtVzd/+RCFuNYCRuS7abU9Oc9Uc6nifnQfYQs3jpYkcU6KI/6qoP/
         oSyllz2y74+W+AAOlNsbZ780pdH6AQn2WIJog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QYMItOpjKFy8m0C0zRgFnkKeCioK6gZ0YYspN1r/fZ8=;
        b=SAp6/KtrXTVN657/JaGHk+72jpmdp4euC4QjrQrs6YbXWpXbyS/ejecIwQdgmBu/K1
         bhIERK0WycZfxPT+36SmXu9PiITTshCJoquqhuVMi0EoyhBnFw+83KvA6rdXaf/V8k4+
         1eKT62UmBGJNSLS9fDlZokJR5S4Tw7M5AUmsYHHnYwoulU0cESTpR2ZaW2oyLRPw3ClV
         IDWV1czoBXafdx6dXigBlQugTNTTyxIyzR99yjCORBWfutksmjysQmYS7b2FzOP8vm7x
         ipwrpJGUE7nUeWpYFpFRvEyaAJXNEvAX2CDD2irPBK4kuOmud+YUjfSRKcJRSEP14bAT
         6PSg==
X-Gm-Message-State: AOAM533H9D7S9QESz6T1/9yvINNMBXwxnMVH+sLQTwFW4foONys0m3Pb
	1I5HZJA+GOxhFtjcutpyNlqjYA==
X-Google-Smtp-Source: ABdhPJwVpBCWzOt+kaQCUync8G8xnTgxCjUnP1LyaJRqoWntfeY565trBToQkrzdDByDIb3JXBN6JQ==
X-Received: by 2002:adf:de89:: with SMTP id w9mr25332350wrl.375.1624873501954;
        Mon, 28 Jun 2021 02:45:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id k6sm12613993wms.8.2021.06.28.02.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 02:45:01 -0700 (PDT)
Message-ID: <7bca010b00b257841490c707059d6488ce1b2646.camel@linuxfoundation.org>
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Cc: Alex Stewart <alex.stewart@ni.com>
Date: Mon, 28 Jun 2021 10:45:00 +0100
In-Reply-To: <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
	 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
	 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
	 <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
	 <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-28 at 11:17 +0200, Rasmus Villemoes wrote:
> On 25/06/2021 18.13, Richard Purdie wrote:
> > On Fri, 2021-06-25 at 17:45 +0200, Rasmus Villemoes wrote:
> > > On 25/06/2021 14.16, Richard Purdie wrote:
> > > > On Fri, 2021-06-25 at 09:37 +0200, Rasmus Villemoes via lists.openembedded.org wrote:
> > > > > I noticed that if I have an image recipe that says
> > > > > 
> > > > > IMAGE_INSTALL += "kernel-module-foo"
> > > > > 
> > > > > it fails as expected when the kernel hasn't been built with CONFIG_FOO=m.
> > > > > 
> > > > > However, if at the same time some other package which happens to get
> > > > > installed in the same image says
> > > > > 
> > > > > RRECOMMENDS_${PN} += "kernel-module-foo"
> > > > > 
> > > > > the image build silently succeeds, obviously without any foo.ko
> > > > > included. This doesn't seem right. [I'm well aware that the RRECOMMENDS
> > > > > line alone works as expected, this is about the case where both the
> > > > > above lines are in play.]
> > > > 
> > > > Which package backend are you using and does this happen if you
> > > > use a different one, particularly swapping ipk and rpm?
> > > > 
> > > > That might tell us if this is a package manager issue or a bitbake
> > > > metadata one.
> > > 
> > > I was using ipk. It seems to work as expected (i.e. fail the build) when
> > > using rpm.
> > 
> > That is probably a bug that needs opening against opkg in bugzilla then.
> > Added Alex to Cc: (opkg maintainer).
> 
> Indeed, thanks. Alex, do you have enough context from the above, or do I
> need to do anything explicitly to file a bug?

Please open a bug in bugzilla: https://bugzilla.yoctoproject.org/

That way we ensure it is tracked and doesn't get lost.

Cheers,

Richard

