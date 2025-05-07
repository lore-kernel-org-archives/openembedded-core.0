Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789BDC3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 19:10:35 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.4271.1746645033248279476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 12:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/RehiPs;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47ae894e9b7so2722171cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746645032; x=1747249832; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8wprV4DbYkaytyek42Qj7uOdAtnHMtUtTBfRDe8S3/0=;
        b=m/RehiPs5xVpMFGt2e9txMUdWotsQ40bJBEbNbqeT57Sxrxn8BnG8HWkmtztSZpwtU
         EAG4X8X3Ts5YP656YXoxgNm85Y75Yd+Yu0FKgbAj9EvyL/2sIXSXSfPWCRcQ7erqVlP0
         pqQPZO48RtGydbUw6EAqFEgul9gk5Vu2dlrvu1g0uPUyzQ6tVauBHTDhu33RRRvPlGnk
         Wp76avZn8vFnIOmDEH2w9UpJCDVukgs+JIjXxeQtIFJAG5Fmft7gOu8RW333MrGuYxfS
         NOyYaIOBhJvxFbkr+Z7MMF8HNl/Vi9GR5gNuAFAX31yO9je8lbje4eSxS5LvC5B+fqUJ
         0HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746645032; x=1747249832;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wprV4DbYkaytyek42Qj7uOdAtnHMtUtTBfRDe8S3/0=;
        b=sKdiLXwiXw/Hh+ypNyVyESz/Ez7owANFkaazGYyCM8fOt7YO5MdhliVMy8cDcNmnK1
         MZlAtCA3Bmao/yvCvYl5+DF+NUqPzpnKSqzZk1RdiZmsaH69ECq1XbX+p0uYGrZ9NnVG
         5jcZkBvG0l+G1JGUWwLpxvLulNtbY1tOAvm7zcQhuumnwP68S79iCeuFpURRtNiilfto
         SvzF8dmUIvAc2YdHwo0BAQoQlGpE5BO06Qf8AjS58KpfuVqbeAJ5Gfe6ZImx/2HYToBP
         e++mOaVIVoxftQWDW3Yb8TVJ+KE3g1MjW/smLaWZH3eHnh5/wgSw26FddYYMsNrz556H
         qAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3+PHEhi9lI8+sXvmXuyirYzEvvqtwT35dQty91PYWSNUS58Mvr5RVKoaRQJ8uRT2Ys5x/Wzrrzs8v8goZfLldTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxqBWpaWyuFWJiquTnnCQ0zKlU+TSRtNou+eN3FTpG302h4JZd1
	lnZjcK2FL0/dcs2nCm92Kvc6teH/1IloCmYrdexzMoSEuYke1KC5
X-Gm-Gg: ASbGncs3CciXCruXZ+uSA3q7V6RYPBikYssUxP7k06ztlNfvSbBXHsZQgx3+6zDEVJP
	2stEnA4Xwt4nJJcb1vKXhRTaKcqZMIJUgOd1MUSW//NZR/pYhRLEXi6cq1aWyn77CslelgqJNMw
	cMnStR0o9AFpN1ebSnrldVby08a7hp45EbDk4L2TGqra4x9WQA6QJPJK7XhNYBxvrpDSWxW6eYR
	isE8RIWQ/tRwUNN63/dHgNImvWcrvktulAR0FNYmP00GuaQztq78vkQZ2TjyQxQ3SC0t4ZyiVG3
	lEz3GBr4IDtffUAmLpUx068t2/pILestsY0iyACkkFG2pS7Egti5BgfSdmSevuHIj4N7
X-Google-Smtp-Source: AGHT+IGOGlMhKaRc7YnO5+68r+HXUIrPT7TNuFtj4sYmwR7dIqFZ/+1pxOml2i0R0lnV08JqBYi/jg==
X-Received: by 2002:ac8:5f85:0:b0:476:add4:d2c0 with SMTP id d75a77b69052e-49227294f03mr67916401cf.35.1746645032232;
        Wed, 07 May 2025 12:10:32 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49221270288sm18551471cf.24.2025.05.07.12.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 12:10:31 -0700 (PDT)
Date: Wed, 7 May 2025 15:10:29 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <20250507191029.GA24048@localhost>
References: <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org>
 <aBtspIFmf7KoIZ_7@nuoska>
 <20250507182924.GA700@localhost>
 <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
 <CAMKF1sq6ttpUeRCsSY9WbY8hixTkhaCOB61u6AB-=xVqhTVn+g@mail.gmail.com>
 <20250507190449.GA7882@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507190449.GA7882@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 19:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216131

On Wed 2025-05-07 @ 03:04:49 PM, Trevor Woerner wrote:
> On Wed 2025-05-07 @ 11:38:12 AM, Khem Raj wrote:
> > On Wed, May 7, 2025 at 11:34 AM Ross Burton <Ross.Burton@arm.com> wrote:
> > >
> > > On 7 May 2025, at 19:29, Trevor Woerner via lists.openembedded.org <twoerner=gmail.com@lists.openembedded.org> wrote:
> > > >
> > > > I stumbled across this build issue via a completely different route than most
> > > > others, it seems, and certainly different than what you have described. I'm
> > > > not using meta-security and I'm not using tpm2. Therefore your patch will do
> > > > little to solve my build, and others will likely stumble across this issue by
> > > > other routes as well.
> > >
> > > For what it’s worth, we’re seeing this without meta-security too.  This needs to be worked around in core (personally, I’d remove —fatal-warnings from systemd until openssl includes the GCS hints).
> > >
> > 
> > thats a bigger hammer, I would suggest to apply
> > LDFLAGS:append:aarch64 = " -Wl,-z,gcs-report-dynamic=none"
> > in systemd recipe in core
> 
> If we want to make the hammer smaller, it's only triggered when:
> 
> 	PACKAGECONFIG:append:pn-systemd = " openssl"
> 

diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
index acf97517a94a..995b55580e4a 100644
--- a/meta/recipes-core/systemd/systemd_257.5.bb
+++ b/meta/recipes-core/systemd/systemd_257.5.bb
@@ -240,6 +240,7 @@ RESOLV_CONF ??= ""
 # bpf-framework: pass the recipe-sysroot to the compiler used to build
 # the eBPFs, so that it can find needed system includes in there.
 CFLAGS:append = " --sysroot=${STAGING_DIR_TARGET}"
+LDFLAGS:append:aarch64 = " ${@bb.utils.contains('PACKAGECONFIG', 'openssl', '-Wl,-z,gcs-report-dynamic=none', '', d)}"

 EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nogroup \


