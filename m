Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.6835.1610538327739556934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 03:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SCw35ENo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id r4so1322780wmh.5
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 03:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=T3so1bom6PS95pUn9KxFW4dFMTrNwIdR74SRR/ecPTU=;
        b=SCw35ENoA9jdzMiNGyLMoxj/TC5i6a4AwEVWThbTPHXWJQNz5ngi9otZV2M0tA76St
         CRgC/AuFSZymIJHA41E35C1lOOjtwUfrekltLEjlLyUixNq8dUZcW495nfA9aWHy9kBB
         NhPEGpPNIdYXPUEKbH98Ay3ZUBjNtIwvnWDqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T3so1bom6PS95pUn9KxFW4dFMTrNwIdR74SRR/ecPTU=;
        b=R6ChX4YjyicdaHcg3TSfVFmE9kzosVFZKCwlj271tUtASBSgUNppKpyFrmAE4DHpEt
         1jYF3RoGyJMJgl0ji2fWPV2UQqT/XI+nTjDqW1Tm9mjr1Vh1qO6IB4vAp3ugXVClvCHU
         glbtr/zrSMT7koJJ9d7IpaUMYgFS39JIu9Qspj16K9nGmL6Z77DABMiA4eQrVuHoVq7n
         bLKODtlMyXVd23cOvDJxXmBbOhaUZ8OJY1qHxwjZb7ktF4/PIyXsrm0zPNv5ly7TQCQV
         MAb7E6DNm9FsvVTqpGKL3FkQKCVeWQyPW4n72d82Q3KNsQm3kVoYCE3NA1mt7BJFiwx+
         jm2Q==
X-Gm-Message-State: AOAM531vKqDk3ZXmHUMaywjqan1AuqlswFf9vefZLZTqtmixDLrQG+w4
	CMTK7j/ObEYjteuHy21cezAjNg==
X-Google-Smtp-Source: ABdhPJz32IMcETsrrMv2uvTBQfC19pooY6BlhuuLTfPA61mKb34Vtqa6qdd4teb5oKSTH0Dd4/S38g==
X-Received: by 2002:a1c:6506:: with SMTP id z6mr1824724wmb.55.1610538326217;
        Wed, 13 Jan 2021 03:45:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:13d8:a80b:9a6d:1409? ([2001:8b0:aba:5f3c:13d8:a80b:9a6d:1409])
        by smtp.gmail.com with ESMTPSA id z6sm2459983wmi.15.2021.01.13.03.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 03:45:25 -0800 (PST)
Message-ID: <4cde6b73149d57c967f77d213baf3b33e0cfd63b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] qemurunner: Add support for qmp commands
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2021 11:45:23 +0000
In-Reply-To: <20210112231109.4048330-3-saul.wold@windriver.com>
References: <20210112231109.4048330-1-saul.wold@windriver.com>
	 <20210112231109.4048330-3-saul.wold@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-12 at 15:11 -0800, Saul Wold wrote:
> This adds support for the Qemu Machine Protocol [0] extending
> the current dump process for Host and Target. The commands are
> added in the testimage.bbclass.
> 
> Currently, we setup qemu to stall until qmp gets connected and
> sends the initialization and continue commands, this works
> correctly.
> 
> With this version, the monitor_dumper is created in OEQemuTarget
> but then set in OESSHTarget as that's where we get the SSH failure
> happens. Python's @property is used to create a setter/getter type
> of setup in OESSHTarget to get overridden by OEQemuTarget.
> 
> By default the data is currently dumped to files for each command in
> TMPDIR/log/runtime-hostdump/<date>_qmp/unknown_<seq>_qemu_monitor as
> this is the naming convenstion in the dump.py code.
> 
> We use the qmp.py from qemu, which needs to get installed in the
> recipe-sysroot-native of the target image.
> 
> [0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/testimage.bbclass    |  6 ++++++
>  meta/lib/oeqa/core/target/qemu.py |  6 ++++++
>  meta/lib/oeqa/core/target/ssh.py  | 17 +++++++++++++++-
>  meta/lib/oeqa/targetcontrol.py    |  3 +++
>  meta/lib/oeqa/utils/dump.py       | 31 +++++++++++++++++++++++++---
>  meta/lib/oeqa/utils/qemurunner.py | 34 ++++++++++++++++++++++++++++++-
>  6 files changed, 92 insertions(+), 5 deletions(-)

For fun I thought I'd try this on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1748

Looks like we may need to use importlib to import the qmp module as
otherwise oe-selftest can't launch (and the qmp module may not be
installed yet).

I didn't wade through all the errors, just the oe-selftest one.

I also noticed warnings from builds that did work.

Cheers,

Richard

