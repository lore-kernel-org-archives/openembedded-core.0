Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F79BC47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:18:52 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.17118.1706278724455717560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=g+kiqHF4;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5102188d2aeso370123e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706278723; x=1706883523; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mGjoAw/t2O1+BL90Ix2E+LnAUUKxGS9RI4XpuvBDCc=;
        b=g+kiqHF40V3LuxF+7U+LOxv83d58YJkzjS1clF1EaXVfUgeZiBbl7Irak+NFgqOYL/
         vrST9Dd93RVV/R88/cETi7guDhLBPrj+fBQq1D9M/aBx0XUqCBXTbLn51ghuaq6J0r1C
         7Mp1IpKH4f41y6amBnzQm3oTEwjCZm6NcbkpdrmexNl2A2Wr/HsX0RnEtS82cXVz4YjQ
         wpiBiDqSFylGtn3dJMiNZHnP59EHhwbOUXjvwF2gzT+66kcNIsxs1hQa/4q1XazIdutK
         k53s/hFeE+E5OGU4SycPHfekLGFnVgTMxSwag1xp8GPLp0hAn8BB5SALhuHZk1hMAbxt
         voMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278723; x=1706883523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mGjoAw/t2O1+BL90Ix2E+LnAUUKxGS9RI4XpuvBDCc=;
        b=fH5lcaV1zEMSkAZ72bm8NYoGDwDtqY8ns5DzRFGrGIWbW+ipAjsINaksmnAALWRzvW
         UGyAuOHLX7zDINLJg5N5YEVrOw5/LHVvqKfA1o97G3UFznaIzhG9srquYGrWJ4ZTfLwe
         ptx6LcpLn+Z27LYue+2FMFRh8WmSQK4RMkMpe1zk8ok9U+xIuQe6RVz0dluNbOkX/Hei
         8rDEXSel/iA2R1irKE+pH7CyWFetGoG6sHyBD7+q3ytjaHWo8e7NQyv9Qtn1gZE61guU
         GHQ4MszfxpI1Zumpgv9V47sSOvSw6yrO21tn3dJ78PhR9wCcowwlFnRTUzGjcc/epr2R
         9UNw==
X-Gm-Message-State: AOJu0YzUHC3wL7g22ke69ELcH/YWzvMcuqPTqSSexFThxFxu0uPxmJj1
	Rv3hWXk7cknrcTwzM8qMrQdIYGYpRUNtgKhXA++o4LOmRBpmjXZurBblFvvGChY=
X-Google-Smtp-Source: AGHT+IFlEKwRd/+eI19s9V8oSyRkPonVerzAGrcCxxSDmy7eBo27z9MMNRYbVfRmwc9j6OJkQFahIQ==
X-Received: by 2002:ac2:544f:0:b0:50e:d3dc:2245 with SMTP id d15-20020ac2544f000000b0050ed3dc2245mr709344lfn.58.1706278722657;
        Fri, 26 Jan 2024 06:18:42 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0050ef97ce785sm190261lfb.179.2024.01.26.06.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:18:42 -0800 (PST)
Date: Fri, 26 Jan 2024 16:18:40 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Joakim.Tjernlund@infinera.com
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Message-ID: <ZbO_QLpPEv502Ix1@nuoska>
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
 <1f9e50e96714b8ed49f2e1b62ef769a6d4a32edb.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f9e50e96714b8ed49f2e1b62ef769a6d4a32edb.camel@infinera.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194373

Hi,

On Fri, Jan 26, 2024 at 02:04:18PM +0000, Joakim Tjernlund via lists.openembedded.org wrote:
> On Fri, 2024-01-26 at 14:33 +0100, Alexander Kanavin via lists.openembedded.org wrote:
> > On Fri, 26 Jan 2024 at 14:21, Joakim Tjernlund
> > <Joakim.Tjernlund@infinera.com> wrote:
> > > I will try workaround these somehow but will not go so far as creating a new MACHINE just to
> > > run these tests.
> > 
> > Why would you need a new machine? You only need a new configuration
> > template in addition to existing one (e.g.
> > conf/templates/repro-test/local.conf.sample and bblayer.conf.sample).
> > Then initialize the build with TEMPLATECONF pointing to that.
> 
> Ah, there is an idea. But this will still change the original machine so one cannot switch
> between normal builds and repro builds in he same tree.

FWIW, I ran into the same issues. Many selftests also have dependencies which only work
on pure poky distro, machine and build configs. The dependencies to various features
which break tests are not clearly marked inside the tests.

At least with repro test it is now possible to define different image and recipe
build targets instead of world builds now but sadly these tests can not be run on
real product machine configurations and need a vanilla poky machine and/or distro
configs. I guess patches welcome but not sure into which direction...

Cheers,

-Mikko

