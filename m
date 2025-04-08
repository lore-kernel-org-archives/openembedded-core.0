Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B4AC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 11:39:29 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.73066.1744112364903077340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 04:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=N6vMrcFC;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so6202794e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744112363; x=1744717163; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0rHyby35MUUxc6huVFMo6ouTP3P6fGz+B77cpQTi4U=;
        b=N6vMrcFCPhOmP3fHSNlT/3Lv+q6ulQ+YNjFp9vv6SWegmXgwhYnLYR86lwbYQln/6q
         R9EvDNEFqbaHgWZWGTlSEKPwHAmgCZTUct11w0atTWylejg2M0ZbVG3wc1pz4Y20tzsQ
         TNGiQsKArhfm62V6gqvJk2bhe4aUIbJafJwQM6VBvmFXMJVeo7hYJs2EQOqJqujoDSOq
         1WuvK2+0epP+2pzo2f/wm7EkaSlu8a0RQPdXPbvkFIPxcXfs7ZEKxMrS3aSQYBJi7vH8
         0I30yWqjWnRpcSEohTm5LKOt6mqaidV1oPg7Obq2UgvBilDKpWNGbW6A7BmBNpVX2yWj
         mzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112363; x=1744717163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0rHyby35MUUxc6huVFMo6ouTP3P6fGz+B77cpQTi4U=;
        b=Lw2pnNO7XqTV903nXsfwaSq+Qlcrb1KasRCo/pz1CDL0eBslw50LtmXI0gvaI9Xfd3
         t8pIHnjVGpMY44S+qAIkKzmk7uRKJcKqMw3wDOSLxUUAdWmZ6n0W8XpKtG++jQvsDMOJ
         lZ/lNE5p6mZmZqFSVe7asYnkM4K5gsCVXbGk0z6xT+0dRjxCCwCl+EQUJkACEgKS48Jk
         e2DpKGXhR645w18OH9dvu2bvhvsFQNcTVXv5IO22Fb4ZjL3hJ7om9hoHHMBHrZyvjZp9
         YjH28ftH+YeG2wU662KnYYFVb0RXsOr6d9UiAvFS14Im4BYxKiRrLlPi9DNpzJRD+pwE
         9BLA==
X-Gm-Message-State: AOJu0Yy6DjCSdXPcilSQ5gAVmrCLGFiv2mMEbKqg/kaRX/aQwLEDtZlJ
	pXEeceTynLDyDJ1/lh/YDLWU0vheAupqYCL5ltDThAClXBfaiZuJ0oOF9/zww14=
X-Gm-Gg: ASbGncvCWMnijV1IVf583O1rt2oeSiBy2gyMTaw0QK+ds25tqFImR/Zh9K0lfMUNOvR
	t2inlccIK0l+GxRJ2F2OBQYa0bcCUFtop+hz55lvMlfUb5+YmUpMtqxEUBpe2bUa+Jgh827DIc1
	ubcepOaU1QhzJsNGVaMZH1/pnhrFFXqLN+HhztlbFj4+6FWwvigG/0b3bGFZSjx26WPoQyMNTAE
	TWEgNm5g9+xXuGeCcQTgJza+anvVWN/7EFdG7tbfbFZWO2Uruhyj/PPMAKiehbNPh+Lg9Q1HWQF
	2wg3jc8SSO2cU7g7ji7FRsiGjIYU0BSziFj0SPRFFrtYdgJ7tQZEu8UnYHa4qFFeKe65Ko3ihHW
	Wag==
X-Google-Smtp-Source: AGHT+IHRixYltcZtx4gLbU16vTX9IkoQ4sNbUHqFPESkfrLEMndEoP6KrM0emR+02XLtfRhZq4cxbQ==
X-Received: by 2002:a05:6512:124a:b0:545:c7d:1784 with SMTP id 2adb3069b0e04-54c227dc8b5mr4792682e87.43.1744112362855;
        Tue, 08 Apr 2025 04:39:22 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d5casm1487459e87.190.2025.04.08.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:39:22 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:39:21 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 00/11] systemd based initrd and modular
 kernel support
Message-ID: <Z_UK6Sg2LsE9A_Vo@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com>
 <Z_OIeeFp_hWMjTkJ@nuoska>
 <D90A1HIWOZYV.25J0FOK1DMUDK@bootlin.com>
 <Z_OZ24jicgPP2HaP@nuoska>
 <D90BBNJUDNA5.3UQXSK0K43FNK@bootlin.com>
 <18340261181AE46F.21691@lists.openembedded.org>
 <Z_OzVyWUGja6dkMe@nuoska>
 <D917YFGEAQ3W.14RJYH3FLAVO6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D917YFGEAQ3W.14RJYH3FLAVO6@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 11:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214536

Hi,

On Tue, Apr 08, 2025 at 01:26:21PM +0200, Mathieu Dubois-Briand wrote:
> On Mon Apr 7, 2025 at 1:13 PM CEST, Mikko Rapeli wrote:
> > Hi,
> >
> > On Mon, Apr 07, 2025 at 01:26:06PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > Sent this out as "oeqa wic.py: clean image build dir before rebuild in test_permissions()"
> > separately. I think this test failure is unrelated to the changes but related to the
> > way tests are executed. I think tests behave different depending if sstate has the
> > image recipe output or not.
> >
> > Cheers,
> >
> > -Mikko
> 
> Ok, it seems this patch indeed fixes the oe-selftest on the autobuilder:
> I had some successful builds this morning on a separate branch. Not sure
> about what is really the link between the error we saw locally and the
> one on the autobuilder.
> 
> I will pick both this series and the said patch in my -next branch later
> today.

Thanks. I've also been running wic selftests and they seem to be fine
with this change. I had one additional failure, very similar
pseudo problem, with wic.Wic.test_wic_sector_size test and I was
testing fix/workaround:

--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -852,6 +852,7 @@ bootloader --ptable gpt""")
             config = 'WIC_SECTOR_SIZE = "4096"\n'\
                      'WICVARS:append = " WIC_SECTOR_SIZE"\n'
             self.append_config(config)
+            bitbake('-c clean core-image-minimal')
             bitbake('core-image-minimal')
 
             # Check WIC_SECTOR_SIZE apply to bitbake variable

but I can't reproduce the problem anymore. There is something happening
with sstate cache here. I think builds of core-image-minimal and possibly
world before running selftests hide these problems. I can't explain
the details either.

Cheers,

-Mikko

