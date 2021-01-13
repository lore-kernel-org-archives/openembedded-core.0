Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.10009.1610553227338885079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 07:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HiceGO7c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d13so2618149wrc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 07:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=zbFC9NeU5gYyvA71ImrhYE5zJkhBq1m6udsZRvPHj/k=;
        b=HiceGO7clokOMPX/RqMtJZ5LqKzOJSy06pzpIGiPN5lRM4MxQmSJpk3o/3FcduW1pW
         S553Zkv/Wx4wtp5t62a6IZHvcDlndS0gO+uL1vp99C9JCZN18cMCOrwL/a6eXHWE/rT6
         x87uQN4Cg6szltepsjuVaDczhnYEYsNGS4kXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zbFC9NeU5gYyvA71ImrhYE5zJkhBq1m6udsZRvPHj/k=;
        b=FyXja1PhCKwBbCs4j816Eo+OLldS5mcP5vG+5MpL9mgzZ/kNqISnJ6q73iTK4jf17o
         aTo0nJcYOZenmV5eW36UftOa2WNiU2S/Vow29gGnxzi+SQ+mJAaVOM/2jsaOzs71AvqJ
         tgUgsyHyskboD50mZADCLlhw+sdHfzmEGj1bceh5gttTGezFTCygnNT697iTy2YjX/CD
         nqEw+hs0cB9lTOzAsnbpHq+cE0CYVIITaNCNGWgWYFsJSccBbvhPtzNp9OQbAf2E6OmT
         Alr3vCBmUnsjP/xcu/66Ry0fO47qIl9Cu7G5RZkeSZ04fwkZNcPBGN/78ANhAH+uCAaM
         IfWg==
X-Gm-Message-State: AOAM5306pqspTViyOwsbVgC1ZbzLuaHHWdfTWR0npNIXnPn60BzvVkwQ
	vlA/UTUJ+21c/K4uoluHuwFeKw==
X-Google-Smtp-Source: ABdhPJxWSSUzVWyKNz/l5FDbXTNYoDvt5IbKsMCEeir8q+KsFCDqehGLR3JPrQScBlUz6RKBI92GuA==
X-Received: by 2002:a5d:6852:: with SMTP id o18mr3190154wrw.371.1610553225734;
        Wed, 13 Jan 2021 07:53:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:13d8:a80b:9a6d:1409? ([2001:8b0:aba:5f3c:13d8:a80b:9a6d:1409])
        by smtp.gmail.com with ESMTPSA id b19sm3352471wmj.37.2021.01.13.07.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 07:53:45 -0800 (PST)
Message-ID: <f8bbeea124b17c5aa5a97d9e40be4b879b6f9407.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Add support for qmp commands
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2021 15:53:41 +0000
In-Reply-To: <305572bc-83d8-986a-2e11-367470149930@windriver.com>
References: <20210112231109.4048330-1-saul.wold@windriver.com>
	 <20210112231109.4048330-3-saul.wold@windriver.com>
	 <4cde6b73149d57c967f77d213baf3b33e0cfd63b.camel@linuxfoundation.org>
	 <305572bc-83d8-986a-2e11-367470149930@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-13 at 07:09 -0800, Saul Wold wrote:
> 
> On 1/13/21 3:45 AM, Richard Purdie wrote:
> > On Tue, 2021-01-12 at 15:11 -0800, Saul Wold wrote:
> > > This adds support for the Qemu Machine Protocol [0] extending
> > > the current dump process for Host and Target. The commands are
> > > added in the testimage.bbclass.
> > > 
> > > Currently, we setup qemu to stall until qmp gets connected and
> > > sends the initialization and continue commands, this works
> > > correctly.
> > > 
> > > With this version, the monitor_dumper is created in OEQemuTarget
> > > but then set in OESSHTarget as that's where we get the SSH failure
> > > happens. Python's @property is used to create a setter/getter type
> > > of setup in OESSHTarget to get overridden by OEQemuTarget.
> > > 
> > > By default the data is currently dumped to files for each command in
> > > TMPDIR/log/runtime-hostdump/<date>_qmp/unknown_<seq>_qemu_monitor as
> > > this is the naming convenstion in the dump.py code.
> > > 
> > > We use the qmp.py from qemu, which needs to get installed in the
> > > recipe-sysroot-native of the target image.
> > > 
> > > [0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt
> > > 
> > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > ---
> > >   meta/classes/testimage.bbclass    |  6 ++++++
> > >   meta/lib/oeqa/core/target/qemu.py |  6 ++++++
> > >   meta/lib/oeqa/core/target/ssh.py  | 17 +++++++++++++++-
> > >   meta/lib/oeqa/targetcontrol.py    |  3 +++
> > >   meta/lib/oeqa/utils/dump.py       | 31 +++++++++++++++++++++++++---
> > >   meta/lib/oeqa/utils/qemurunner.py | 34 ++++++++++++++++++++++++++++++-
> > >   6 files changed, 92 insertions(+), 5 deletions(-)
> > 
> > For fun I thought I'd try this on the autobuilder:
> > 
> Seems it was too much fun, looks like I will need to be able to start at 
> least one build on the AB.
> 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1748
> > 
> > Looks like we may need to use importlib to import the qmp module as
> > otherwise oe-selftest can't launch (and the qmp module may not be
> > installed yet).
> > 
> Ok, I will look into this, it worked correctly for me doing a locally, 
> with do_testimage, but clearly I missed something that between the 
> qemu-system-native install and the testimage.

The issue will be that oe-selftest loads the python modules before
qemu-system-native has been built so it can't import qmp at that time.
This is why I was thinking it may need a later import at runtime using
importlib?

oe-selftest on a clean TMPDIR should reproduce.

Cheers,

Richard

