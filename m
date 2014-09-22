Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 00783609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 09:41:57 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so2564171qge.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 02:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kA+n8zQw3u0/pEVueBujtqeFH1xGAoMAvLhmYqMsQrc=;
	b=A7IDScXDJekjfJyPa6/MRi9ldYnhgoNDDR/a/P2GWhblo8v0ppTLrpMl1kJcoLetIv
	eQICgEFjpJobieiYwb5pbSlxhQdC1E3paugfP0DQUa2u64x9HyKmmi8SHHPtQNsdXvKG
	vwRKdpXfjGsO1tWS2B0XvEn6NnGEpFonrP37IUcyz7LSPS/DKudM18S1Envcwqq2HTvd
	tVw5ovrKD8CZg9D3uQxJDqogab4RFL1veRmyZq/I2HjgN+J37aVC4RcZBFLubgApfdzX
	mYnFFSzXzJPD21v8CdVfDMP0iHBWs9x3mTkJ/tlRNiTnWyY11cEpcUH3C0XhCmwPxOzG
	nXBg==
X-Gm-Message-State: ALoCoQnD0t3AonC8FBQmfoy0PesCPgbYYVBfAQI6x+So/1hY+A/f5coriOShVh1ww+0BA3/lIaJL
X-Received: by 10.224.104.2 with SMTP id m2mr20905184qao.52.1411378918782;
	Mon, 22 Sep 2014 02:41:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Mon, 22 Sep 2014 02:41:38 -0700 (PDT)
In-Reply-To: <541E7FD4.4010105@pseudoterminal.org>
References: <541E7FD4.4010105@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Sep 2014 10:41:38 +0100
Message-ID: <CAJTo0LZqCeDbVzvjbo6FhdEy9MxuFxuWik=Cntg8FnWngC-RgA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: waf.bbclass does not clean up properly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Sep 2014 09:42:05 -0000
Content-Type: text/plain; charset=UTF-8

On 21 September 2014 08:35, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> is there a reason why the waf bbclass does not call "./waf distclean" in a
> do_clean() function?
> As a result, the out-of-tree build directory is around even after performing
> a bitbake -c clean or bitbake -c cleansstate call.

It sounds like your recipe is doing out of tree builds wrong, because
waf.bbclass doesn't support them.

There's a variable for "build tree", and it's $B, and $B is wiped on
clean.    autotools.bbclass and cmake.bbclass use $B for the location
of out-of-tree builds, and waf.bbclass should respect it too.

As you use waf and out-of-tree builds, would you be able to fix the class?

Ross

