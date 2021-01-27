Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.5173.1611735936375060120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 00:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X6V8pbVn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id c128so837962wme.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 00:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9W5zrdAMgg/LPK4yiNqyBKSqY+3oB2ML32On3eJAKhQ=;
        b=X6V8pbVnSkIqow6VS/OBysojneuja1U35IulBV+cGmo54DxKIsueUy1Au1qAk06w/K
         niTwCVvpCAAzBbcev4jAzz9cg6UzQQwdoa1dXMGSOzI5jVwjOeuoD4Cjk2acsAOuufEp
         1XYpjI8BjIL+zd5iZnX00z5McVhoaoDO9fyiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9W5zrdAMgg/LPK4yiNqyBKSqY+3oB2ML32On3eJAKhQ=;
        b=piSvz7jVSDOAYjZQ5UG9Q+JMJafTgz7v3xjh9LL9SA2ZN4OSgGRC/SUpe3ECtjdWyh
         OLt1VMNIMB6MHVF8bIzHiHnZt7cFQbFPLC3WwevqDpTDwGnvhgaoYCSvPpN57YO9q/HP
         qfEllWy8SwK04XWSnKW3vZjeVXXNpXgZT/C1fVXYv7V7Nf/toCqD3vbq8eBubd4+rb20
         /anDoMIiZi7YKwORpMRvl+AyCL8WIpPhHJoHeZ2XvL3GWZsIN+P2XYW8hjCbVMQYHifA
         zcn1XBfYUegX5MsyiCTWLRAfmEqHHyGu2UxhNylGSKu1+l26PGy7BH7Ksv37eld/URq/
         x+8g==
X-Gm-Message-State: AOAM530uUrI8LwV5UhiEWVRWr0rzJDLbxruzZTnAde8+25DMNCx4buqr
	TxTsvXPxwxkq/6m3BsF2xcF9tg==
X-Google-Smtp-Source: ABdhPJweDqEPV1EyVmGPNWIOT2S3onXVAYDHmkh8j2X30dzW6/Pe2zSpEicmE8G85rTtY0kFjY8qYg==
X-Received: by 2002:a1c:ba04:: with SMTP id k4mr3109525wmf.16.1611735934772;
        Wed, 27 Jan 2021 00:25:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id n11sm2177710wra.9.2021.01.27.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 00:25:34 -0800 (PST)
Message-ID: <7ae582bd8a678a8bd443c9a78e395fc3796f4131.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] Enable QMP Dumping for testimage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 08:25:33 +0000
In-Reply-To: <20210126173107.2204111-1-saul.wold@windriver.com>
References: <20210126173107.2204111-1-saul.wold@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-26 at 09:31 -0800, Saul Wold wrote:
> I hope that this is the final pass!
> 
> This patch set enables getting debug information from QEMU via the
> Qemu Machine Protocol interface. The Qemu source provides a qmp.py
> module which is instaled in the recipe-sysroot-native and loaded 
> via python's importlib during runtime.
> 
> The initial commands that I issue to qmp with a failure is detected
> is: query-status and query-block. The output goes into formated json
> files as follows:
> 
> tmp/log/runtime-hostdump/202101061054_qmp
> ├── qmp_00_query-block
> ├── qmp_00_query-status
> ├── qmp_01_query-block
> └── qmp_01_query-status
> 
> Comments welcome, I tested this by calling the monitor_dump code 
> directly in the target/ssh.py code instead of waiting for a given
> failure.
> 
> This has been tested with both testimage and oe-selftest as they 
> take different code paths to the qemurunner code with different
> parameters.  I also tested oe-selftest with and without the -j option.
> I saw 1 failure which I think is due to my setup and not the code in
> question, runtime_test.TestImage.test_testimage_virgl_gtk_sdl failed

I ran this through the autobuilder and it looks better but we're not
quite there. We did reproduce the
runtime_test.TestImage.test_testimage_virgl_gtk_sdl failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1758/steps/14/logs/stdio

and given its giving a traceback here:

     0275:        try:
     0276:            self.qmp = qmp.QEMUMonitorProtocol(qmp_port)
     0277:            self.qmp.connect()
     0278:        except socket.error as msg:
 *** 0279:            self.logger.error("Failed to connect qemu monitor socket: %s" % msg[1])
     0280:            return False
     0281:
     0282:        # Release the qemu porcess to continue running
     0283:        self.run_monitor('cont')
Exception: TypeError: 'FileNotFoundError' object is not subscriptable

I'd say that is an issue with this patch, it needs to more gracefully
handle that. It could be its attempting the test and expecting a
failure elsewhere in the stack as I think you're right that not every
vrtigl test runs on every system. You could check older logs to see if
this is expected to pass or skip.

Besides that we are seeing a lot of warnings:

stdio: WARNING: core-image-minimal-1.0-r0 do_testimage: Qemu ended unexpectedly, dump data from host is in /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/log/runtime-hostdump/202101270227_qemu
stdio: WARNING: core-image-sato-1.0-r0 do_testimage: Qemu ended unexpectedly, dump data from host is in /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/log/runtime-hostdump/202101270227_qemu
stdio: WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Qemu ended unexpectedly, dump data from host is in /home/pokybuild/yocto-worker/pkgman-non-rpm/build/build/tmp/log/runtime-hostdump/202101270227_qemu

The build is a lovely toaster orange:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1787

so I suspect there is some other side effect we also need to fix.

Sounds like we're getting there though!

Cheers,

Richard



