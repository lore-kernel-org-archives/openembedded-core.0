Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.23771.1629724984890595264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b17zrCm9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id f5so26203142wrm.13
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 06:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Nm5gAlGQLg3+yCQLSwbgJx2Fn+lvuD05U6ylh2b4RJ8=;
        b=b17zrCm94iH+EAfQa/y7UxNwD1JJs1F+IqVLKtYd2DOB/XvW+Ct3I4Fr136ijmri/P
         /V5DMTtWnBCVdKd4RPdhBDgBZVK7XREHs5SES1nCyAlrbJBaKn22SVLyuS6JYCXFofow
         A02ue48wwvExVUeudCldzVch/FnZ6MT8gsnw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Nm5gAlGQLg3+yCQLSwbgJx2Fn+lvuD05U6ylh2b4RJ8=;
        b=iFi1ZHHb3twIsaRD2KYvIQSKQjtg+3iFoRLGK1CPLW4B9cM7ZteaPCiiIXuErP/B+J
         6AoiE+ogmyl4mVzB6CRxJAW+EDW3sG/J9MT375FILNcRDLuxVpIa2vA/jQJPcGfYo2pg
         RzRvPSA5h1ksAvxZQ2oQKvAM6ARo54PFuDY+lXWF8m6G6BVCT0jNv+xxKFcA6WRLONKm
         MJth6uZiZfRLKBrXJFIJ/hcOqQQ8fdltcbYPl0kVLLGciGUwbwiWr1r/1ccrUxENb44z
         uDCcltY4xufgTGbSU39Lzi0UGF4fn4UMzWGNjWfWA+BLys6dBL9F6ZDxHWvbjGYy1Ft7
         Ukuw==
X-Gm-Message-State: AOAM5303yyLDArWyhi3VA4xida2vQbaFJ/EpGtLSvkYbjixn2OPBRIlS
	T4j1+w2e21IaUptXvTX2UEZevA==
X-Google-Smtp-Source: ABdhPJyUokL1lpp334QrKiET1dkbhw/13/rI1OFTOjfAtrL5BQUKMCPIV+tfRBaPNUOb/M7yO3JG5w==
X-Received: by 2002:adf:f101:: with SMTP id r1mr10339793wro.355.1629724983250;
        Mon, 23 Aug 2021 06:23:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d09e:54e5:5f12:c43c? ([2001:8b0:aba:5f3c:d09e:54e5:5f12:c43c])
        by smtp.gmail.com with ESMTPSA id p12sm12137968wmq.44.2021.08.23.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 06:23:02 -0700 (PDT)
Message-ID: <3fc9ff4e880846c2cfd52fb5659c3294424ac176.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6] package_rpm.bbclass: Handle posttrans scriptlets
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: zboszor@pr.hu, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
Date: Mon, 23 Aug 2021 14:23:01 +0100
In-Reply-To: <fb092fdd-103a-9eb9-c070-b72313d45fdd@pr.hu>
References: <20210823122323.97400-1-zboszor@pr.hu>
	 <20210823122323.97400-2-zboszor@pr.hu>
	 <CANNYZj_VL-bxXG_mb-Z5QaWhHZvr4p+LVnvgODm84tRkSrFjEA@mail.gmail.com>
	 <fb092fdd-103a-9eb9-c070-b72313d45fdd@pr.hu>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-08-23 at 15:14 +0200, Zoltan Boszormenyi via lists.openembedded.org
wrote:
> It's documented at www.rpm.org, Red Hat and SuSE.
> 
> https://docs.fedoraproject.org/en-US/packaging-guidelines/Scriptlets/
> https://en.opensuse.org/openSUSE:Packaging_scriptlet_snippets
> https://rpm-packaging-guide.github.io/
> 
> It's available since RPM 4.4. RPM 4.16.1.3 is in Hardknott.
> 
> A short Google search showed that *maybe* dpkg also supports it,
> or at least there are(were?) plans to implement it:
> https://wiki.debian.org/i18n/TranslationDebsProposals
> 
> With postinst, the time when the scriptlet runs may depend
> on the order of the packages in the upgrade transaction and
> may run with the older binaries in place.
> 
> The posttrans scriptlet runs at the very end of the
> install/upgrade transaction, just like the OPKG "intercept"
> scripts.
> 
> I successfully tested it long ago with a kernel upgrade
> that was running dracut on the new version, plus a dracut
> upgrade in the same session. Dissecting the initramfs proved
> that with postinst, the old dracut version generated it,
> while with posttrans, the new one did.
> 
> Who would want to use it? Anyone who needs some finalizer
> script to be run at the end of an RPM/DNF transaction.
> 
> I started on Angstrom and I know opkg doesn't implement this
> and Yocto inherited it. This patch is basically a heads up
> that there's another way to do the same thing. Maybe opkg
> implements this some day, maybe not. Anyway, Yocto in general
> will need more changes before the main package.bbclass can
> start to use it for all package formats.
> 

There is a bigger issue here which is how can anyone use this without making
their recipe rpm specific? I'm very reluctant to add functionality like this
unless we have a way to emulate it or fall back on the other package formats.

The intercept pieces are used by both rpm and opkg and actually do something
slightly different, they stack common calls until the end of the transaction.
This means for example we can call "ldconfig" once rather than in every
postinst.

Cheers,

Richard



