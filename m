Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.15460.1601139235453500428
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 09:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fmwcp2H8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id z1so7267714wrt.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9fw+V/KDJ7reabnuoPF/ljGwMeqr4Rz+egw6EssLaTw=;
        b=Fmwcp2H8n3fd2ZJ1n1NDrfU4tTSm7P/qe+bjJZ8y9gWA6FtdsXXMY+0Pyh9Nmj1pYA
         kT437kuWUc2fH8xiLntUhvcwP+jIirnhTCBtj3VDtta8uqaFdWqtldGmGKRkgI4BAVJ0
         SmzP9PQgRAPJx30iN5yU1RSRsqX9a/ysi+T/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9fw+V/KDJ7reabnuoPF/ljGwMeqr4Rz+egw6EssLaTw=;
        b=qFevfstwTw6X3Y8YSp1VOFcQLa/hCWf4Ygj6f5rQJ15Nn2ax5u3EHTluKT+XzORmdW
         KAxWcRAewGpXMnTcCfJTDu/55+XNgL+nGavjFB1j3DqQ0MngglZ7l+OqC6sY57EwlHk0
         c9cxWqrvQxjdKjtt7GKPtgkiPxlXtQpD77lrW3g9y4LZIMzDgESAf0Xf8koBA2GpIrfP
         CtEBpVML2GR+DBVl6j6+Wq8vSj+S07bXzlkzJ0v/9Wl3JQ8LJcRcRuf7zKMG0hKLYTCO
         iGlq/MmLvt6NX0kKJrZp12++D4RLU7+9j5WslfzCdqLDokUMpXlkQTJ9VgBz6KcqqmCp
         wLEw==
X-Gm-Message-State: AOAM531YYy/uLb8DCnGp4yAvcvWdWldRAb3o5qeV9DF9IntEFvPEq6P0
	klpCqnsK97WIfxuTRRU6LXnjDA==
X-Google-Smtp-Source: ABdhPJwwDtrcXzphCwPecpIMKf9eFKt175+5GgFUWXfdurCeM2nxGeA+kHFhDnQo4t0BIa3jthJyHQ==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr10457916wrn.109.1601139233376;
        Sat, 26 Sep 2020 09:53:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90bc:6f26:fb38:5724])
        by smtp.gmail.com with ESMTPSA id y6sm7223537wrn.41.2020.09.26.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 09:53:45 -0700 (PDT)
Message-ID: <6e0d702a9bc90ffa2604d725c7831a4c030645c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base: Rework and improve do_unpack WORKDIR cleanup from previous builds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Sep 2020 17:53:42 +0100
In-Reply-To: <CAP9ODKrd5=5GH5VSsp-zM55TZX8xstd+_Qsipav7NJ5UzCbarw@mail.gmail.com>
References: <20200925233040.2649208-1-richard.purdie@linuxfoundation.org>
	 <CAP9ODKrd5=5GH5VSsp-zM55TZX8xstd+_Qsipav7NJ5UzCbarw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-09-25 at 22:44 -0300, Otavio Salvador wrote:
> Em sex., 25 de set. de 2020 às 20:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > We have multiple bugs ocurring because when do_unpack reruns, it
> > just
> > dumps the data base into WORKDIR. This means if a file was removed
> > from
> > a directory in a file://subdir/ url, that file would be left in the
> > build confusing users.
> > 
> > Also if files are entirely removed from SRC_URI, they would still
> > exist
> > in WORKDIR. Read the shadow recipe and the /etc/pam.d/ conditionals
> > for an example of how this can break in interesting ways.
> > 
> > To work around these issues, improve the cleaning code to remove
> > anything
> > except temp/ since it contains logs of the currently running task
> > and
> > *recipe-sysroot* since do_fetch and do_unpack have dependencies
> > which may
> > be added there already. That directory is setup to look after
> > itself.
> > 
> > We also have to create ${S} since that is a side effect of the
> > current
> > [cleandirs] which is no longer needed after this change.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Cool; this seems to address some annoying corner cases :-)

Sadly testing shows we simply can't do this. I've tried adding all
kinds of tweaks in to make it work and there are just too many corner
cases.

For example I just saw a recipe on the autobuilder fail as it did this
(from log.task_order):

do_package_write_deb_setscene (22542): log.do_package_write_deb_setscene.22542
do_populate_lic_setscene (22563): log.do_populate_lic_setscene.22563
do_packagedata_setscene (22912): log.do_packagedata_setscene.22912
do_package_setscene (28295): log.do_package_setscene.28295
do_deploy_source_date_epoch_setscene (29226): log.do_deploy_source_date_epoch_setscene.29226
do_fetch (14380): log.do_fetch.14380
do_unpack (19794): log.do_unpack.19794
do_patch (23663): log.do_patch.23663
do_prepare_recipe_sysroot (48174): log.do_prepare_recipe_sysroot.48174
do_configure (21716): log.do_configure.21716
do_compile (2203): log.do_compile.2203
do_install (48352): log.do_install.48352
do_package_write_ipk (34415): log.do_package_write_ipk.34415
do_package_write_rpm (34825): log.do_package_write_rpm.34825
do_package_qa (6590): log.do_package_qa.6590
do_populate_sysroot (6894): log.do_populate_sysroot.6894

i.e. the do_unpack then wiped out the do_package_setscene and more.

Ultimately I think we may have to inject a directory, WORKDIR/sources/
where everything would be downloaded to. That will mean updating
WORKDIR references in recipes.

For 3.2 we may be able to unpack to a different directory
(WORKDIR/soruces?) then move things into position, *but* log a list of
what was done so we can delete it later if we rerun do_unpack.

That is rather ugly though.

Cheers,

Richard





