Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BB6FD374E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:22:53 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44027.1772022170474005025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OxFVCLQ/;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506a93ba42dso73506901cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 04:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772022169; x=1772626969; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+aQPLR4jIMjO7fEvzxt/3FEwxCnRdtjU0ANT9cs+Rpk=;
        b=OxFVCLQ/1dkeEwG28X7juMZ1GPVFiZ7AvVh9k25TIS3CZv2ztel+BJSoqG4fIobIHW
         oqu8vjpVy0HGOqB+1ULVeMAV3QBRiBuECsZ4hu6+X+NJwlTWYErTcdPChgJ6x29+rIm8
         PjTs4HpX7F4/SpKdNHbEM8Gncy+nKCWrEo+d2uMKxwF8e3u5fVt+J/LxI0jRxqauMLti
         1+q1P+IIeHkzdfN4XNsZoGpAEO5lUb8K87ql3KEz8YWSbOyl7Zo2VpmQndgEIObGy77T
         /iWg1RCQW3LtNbb7pJbSi3l0WEyAy6mmezGQz0xO5bC+rum8UTnw0CMAT+jp4uKaYrGt
         BmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022169; x=1772626969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aQPLR4jIMjO7fEvzxt/3FEwxCnRdtjU0ANT9cs+Rpk=;
        b=HYU5cy4Ven56mcH2STxdC50BfyiepgJ97I3qCe6/zcnAy/HhhKuM5fk/k5JcReaYag
         yQJVdPPGEcyF1Oaa8laEIkw5Oka8ttVz6GoFLxxoHKlwaVQX2RpmS8rqytblmD+yfZke
         pEjrOgKNbEzh1IJKm/uJG4yLSVTL7a8j6swiSOaEUaiRz1q2jZnH9w2CamnwPEGqEgVa
         e7bYUlLX6RLdyQIrWefZRDuFYpNf7o2PY8zjMtEp3AWfq9WbHyC+eobvFuCohPP4hKDB
         s7rSILEswCIP4+AqCLnw/KL+YQEiY+GtMYskOqNHkCRDX1G5qwcA/V5bhYksMoBIjX9c
         pfUA==
X-Gm-Message-State: AOJu0YxC9omdEZCx2Ev74BdKGBKoj5uwbAA7YVT9Nveg6uMkEGcDbK0A
	Zbj/qHjn9w1nlX1gzcp+yvPc01vM3D23nBUmX+7MtCg8m95ibNkMucTQ2K51TFmN
X-Gm-Gg: ATEYQzws5C/OtVesOML7EIqXaib6NIc9VlbKTOHYyoD1fPB0L+FPhJfHT8CmQDWmgK+
	io4uYx1n8xZ43Ix/nZQp0dUvyB3kUCq+5xBzyC/H2ezzzG72AO/IUODd55mV874CyO4iy/dYuOV
	0S76hIrGelsQS2X1dRsgMxqKzH6sH3tmA832E8zGBbW9ca5TnAYzdwHKYQzBe/weNUxBcLcjjcJ
	l9zykntBsmDWv0lwrTUMpr4KRcDKgmIPZT5INytnKH/oelhSWGHb8GsomzXvtE1WYuX7kR7OysC
	hJV1MNPW2vLtHs55iJrzdT5y2q16NDc0jaXXNDYZ/tZb2uyytHmnUhch7b5WSman+gZx/HTU60C
	nCmAXSUYQcaW1u/Kj9JMjriZ0eyxDIHA2IjArA5p5czFdDMk2Vf/f/SuSSi1N9d0+/g5V0gL4vg
	qgyh34+MTO5nXo1zV08vQHaDbeSwdw55ITGQ4neGdv6116A0GQF+PJ4Nm5we1hyEgxoA==
X-Received: by 2002:a05:622a:406:b0:506:a51d:93e8 with SMTP id d75a77b69052e-50741f9b2efmr1610311cf.45.1772022169219;
        Wed, 25 Feb 2026 04:22:49 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e7747f0sm122138456d6.51.2026.02.25.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 04:22:48 -0800 (PST)
Date: Wed, 25 Feb 2026 07:22:46 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v6 0/9] standalone wic
Message-ID: <aZ7plh9OlN8CTVVB@localhost.localdomain>
References: <20260225074931.1661345-1-twoerner@gmail.com>
 <DGNZ4TTUX39Y.3K965DAB0AOLE@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DGNZ4TTUX39Y.3K965DAB0AOLE@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231955

On Wed 2026-02-25 @ 11:34:41 AM, Mathieu Dubois-Briand wrote:
> On Wed Feb 25, 2026 at 8:49 AM CET, Trevor Woerner via lists.openembedded.org wrote:
> > This series of patches splits wic out from oe-core into its own 
> > standalone utility. The wic utility will continue to be under The Yocto
> > Project umbrella, but will no longer be integrated into the project
> > as part of oe-core. The ultimate goal is to make wic a completely
> > independent tool, hosted on PyPI, with its own tests, development
> > roadmap, and releases.
> >
> > Some benefits include:
> > - relieving the oe-core maintainers from having to review wic patches
> > - allow the tool to be used outside of The Yocto Project
> > - provide more flexibility to explore other features, libraries,
> >   mechanisms, etc 
> >
> > These changes have been tested with oe-selftest as follows:
> >         $ sudo .../layers/openembedded-core/scripts/runqemu-gen-tapdevs <my numeric group id> 4
> >         $ oe-selftest -v -r wic 
> >
> > Previously, I had two separate patch sets for wic on oe-core: one 
> > to create a standalone utility, and one to re-implement variable
> > sector-size handling. Both these were combined to create a combined "v5"
> > patch set.
> >
> > In v6 the major changes are:
> > - code cleanups to remove cases of "if sector_size and sector_size =
> >   512" in places where we can guarantee sector_size will exist
> > - cleanups to replace "getattr(var, 'sector_size', 512) or 512" since
> >   the 3rd arg to getattr() is already setting a default if the variable
> >   name is not found
> > - many comment and commit comment improvements
> > - error out if extraopts includes options to set the sector-size in wks
> >   files
> > - patch 2 (add ufs class) was dropped
> > - patches 3 and 4 were reversed (move/save wks files before removing the
> >   rest of wic from oe-core)
> >
> > For the patch sets up to and including v5:
> > For the standalone patch set:
> > v1: an RFC patchset was sent out, split up into small patches for easy
> >     review
> > v2: add wic utility to list of native dependencies of
> >     image_types_wic.bbclass
> > v3: squash all commits together to apply atomically
> > v4: (does not exist)
> > v5: rebase on latest master
> >     split commits back out acknowledging any bisection that lands
> >     between them will fail
> >     combine with sector-size patch
> >
> > For the sector-size patch:
> > v1: initial patch set 
> > v2: add Mark as co-author of ufs class
> >     try to fix a build warning when not using wic 
> > v3: actually fix warning when not using wic 
> > v4: deprecate, but allow, WIC_SECTOR_SIZE to continue to be used to set 
> >     the sector-size both from config files and the environment
> >     warn when both are used, but prefer cmdline value
> >     change partition type of sample wks to gpt 
> > v5: fix a bug where WIC_SECTOR_SIZE is not given anywhere
> >     combine with standalone patch set 
> >
> >
> > Trevor Woerner (9):
> 
> Hi Trevor,
> 
> Thanks for the new version.
> 
> We have some test failure as the wic tool is not found in path. I
> believe we already discussed that previously, but I'm not sure what was
> the conclusion.
> 
> Poky - The Yocto Project testing distribution
> Running '. ./init-build-env; wic create directdisk -e core-image-sato -o ${BUILDDIR}/tmp/deploy/wic_images/qemux86/directdisk/core-image-sato/' with output to /srv/pokybuild/yocto-worker/wic/build/build/command-1-cmds.log in /srv/pokybuild/yocto-worker/wic/build/build
> /bin/bash: line 1: wic: command not found
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/15/builds/3190
> 
> I will let other tests finish, so we can have an overview of the
> situation.

Thanks for the report.

Are these failures from oe-selftests defined in oe-core?
I can't quite figure out which tests these are.

