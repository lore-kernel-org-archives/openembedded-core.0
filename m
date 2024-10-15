Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45863D216AF
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 14:23:36 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.14896.1729002206230160061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 07:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eOURPpxP;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5743074bso12771181fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729002204; x=1729607004; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp/esQr9iuk80lmypwa9MtQLvjpx+OVt3P2+LYSTjjU=;
        b=eOURPpxPPgGNwpHh/eY6dMXT8teewSQUQ+Ae9E4KdmGiovPEmHegvR5K28uIPcG5FZ
         BBPA5qILRjIwcP/4PEV9GQx3Izp7ztVf74T8QFIGsjmX+18xv4UflsKJ+cvNiWUtJg8S
         YB2t1IyPhAv4+o0BiYQzitQef7K/6He325qm/a95yWYhOhLmnZ/99n356BmQnFvVgmPX
         CMqUQDia9+1q1YzXeFzNYkrljugXU3vfUl+PF6YPUCPa2VrVBqfB5jvKmn9SoZ98tqMh
         FHtwnt7sBT+AfoiJqWqOmu/v9IU0fEYGy2xYBQRRbCBQKKQQTjUf57foPfpedEMuTbeT
         Z/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729002204; x=1729607004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp/esQr9iuk80lmypwa9MtQLvjpx+OVt3P2+LYSTjjU=;
        b=QqBPkMLRNo/9svn4TxyZ/28lzKbMvDL2AQr5Bp3z1FByM9ijLi7ezWdsMR4A2uSJIF
         4qSVSPwmtdVelpC5GBxk6JXJ5PY/7e9lyHnQIr9xGtitkRHdryIQsl1vL26YV1LdmNS4
         mvCey42xCvSeyXvgRfbpfqk5K9IWHCaaOKR/fps9UhqRmDVcLdlc4XnD8g5TqClEdxT3
         rXWZ2fEKJmwIC0F3gfF5qMUAsMROcAxjh9AmSQxF1PXWZgwlpyAF9lYhRd11xvC5LBqc
         v94bhiSsBp27SuIN+NIodDpVsJ2lNJnrNLXmG9S2cuUsh4kZu7YHPPo60drf5f6ZNLxw
         79nQ==
X-Gm-Message-State: AOJu0YzWEiKjevkVS8DTjlAs6vCHjGz1G7WP0aKD+u3rXq6PkS8ItwmF
	Q7n3VG6Q6O5d2LCPzYqZ9UFTJWr3PcmmJ690lfUgVSUn4Wzk81SQjpeAHue9psAPM0zDfXIzcTv
	4t4Q=
X-Google-Smtp-Source: AGHT+IGTToZiESdaDpvKQcGvmw67Ioqf5JAHJN3WQ3niDrp0Lo0SfaoeHI5UuSGGGG3ThTj7GjqvwQ==
X-Received: by 2002:a2e:74f:0:b0:2f7:6277:f2be with SMTP id 38308e7fff4ca-2fb30f77d08mr38810471fa.22.1729002202981;
        Tue, 15 Oct 2024 07:23:22 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb5d135e7bsm1610241fa.63.2024.10.15.07.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 07:23:21 -0700 (PDT)
Date: Tue, 15 Oct 2024 17:23:18 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
Message-ID: <Zw561r2P1DH1y3xC@nuoska>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
 <17FE4B15CF045259.4702@lists.openembedded.org>
 <Zw4PXRX28-qB8FjT@nuoska>
 <874585dde5c3fe6685e9c8b250cd02dc2404f26c.camel@linuxfoundation.org>
 <Zw5Qm1ZEScA196fh@nuoska>
 <de120c84628b099ba1528c82e681171c206b6cd2.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de120c84628b099ba1528c82e681171c206b6cd2.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 14:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205919

Hi,

On Tue, Oct 15, 2024 at 03:13:44PM +0100, Richard Purdie wrote:
> On Tue, 2024-10-15 at 14:23 +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:
> > > The arm test still fails:
> > > 
> > > https://valkyrie.yoctoproject.org/#/builders/23/builds/267/steps/14/logs/stdio
> > > 
> > > The traceback is at least cleaner now I fixed the lock error. I did
> > > test with KVM disabled.
> > 
> > Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64
> > build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu
> > 20.04?
> > 
> > I will remove the tests as it is clearly too hard to get these
> > running.
> > 
> > It is a bit hard to figure out in which environments selftests are
> > running.
> 
> Please don't remove them. The automated tests are the main reason the
> project actually continues to function in any sane way.
> 
> For that reason I really do appreciate having them and would like to
> see more of them.
> 
> Unfortunately I don't know enough about the subject area to help on
> this. I have at least tried to improve the failure messages and run out
> the one area I knew was potentially an issue (KVM on arm).

Did the test pass on x86_64 build host in your CI?

How about I run the wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64
test only on x86_64 BUILD_ARCH and aarch64 TARGET_ARCH for now?

A decorator like this could help:

--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -228,3 +228,15 @@ class skipIfNotArch(OETestDecorator):
         arch = self.case.td['HOST_ARCH']
         if arch not in self.archs:
              self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotBuildArch(OETestDecorator):
+    """
+    Skip test if BUILD_ARCH is not present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['BUILD_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)

Cheers,

-Mikko

