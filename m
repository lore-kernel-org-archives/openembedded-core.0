Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id EC4CD60F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 09:16:06 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hf12so3927794vcb.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 02:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=A86jYRZ4BxFnHbp1NGb58Lt2WIrsfiqohfBpJAcV53Q=;
	b=goFKx8ywXsrqOkAzzcd3LV6MNBFMqdZdveUvdJypk7E/zlSft800fnhFT2YDJOtlBS
	sT2q1RJZ9+/pWPugxH57BKzcR5P6zaIP3aPcYa0p+7wHLXHn05QqowSTk6fMGAFlriO8
	MPIp7BURVOu8TXhzmG3ub9KKTscMd3G81FZ1s1be54AcLuLgwitav638Q/fdYsly/nGg
	9A4yrJIG1mvvVKJ6aHF5izAH2rsJ1WsoEz/kJs+448zGwwknE04mdByCcZXEnT/7UmnT
	0XoE2QqNO+f5071XXlalUpWcG9P6n6OrVhenMQLhyKrMjo/4xQbBotlOrDReJ7yLnNyA
	iV2w==
X-Gm-Message-State: ALoCoQk7rig5wMTefZZYhxzDMCbvE3DN+Gxta73zYRoAySKAyvHE4lI8EtC65J93PRHDVVRo1wKr
X-Received: by 10.52.230.233 with SMTP id tb9mr25967916vdc.17.1379409368439;
	Tue, 17 Sep 2013 02:16:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 17 Sep 2013 02:15:48 -0700 (PDT)
In-Reply-To: <5237C039.4080001@windriver.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
	<dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
	<C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
	<5237C039.4080001@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Sep 2013 10:15:48 +0100
Message-ID: <CAJTo0LaL_rxVQRdd8r1dkG5zV5FFLk5xBnWP34ME4P2oxu=Gnw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Tue, 17 Sep 2013 09:16:07 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2013 03:36, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The upstream of libxml2 has not fixed this issue:
> git clone git://git.gnome.org/libxml2
>
> And I have filed a bug to them
> https://bugzilla.gnome.org/show_bug.cgi?id=708205
>
> After this is fixed and released, also need to report another
> bug to LSB to update their libxml2 source code.
>
> The time cycle is long, should we mark this bug as "Waiting For Upstream"
> or accept this patch to workaround for LSB test.

Using my amazing ability of talking to the upstream maintainer (DV in
#xml on irc.gnome.org) I've sorted this out.

The CVE is for *Chromium's fork of libxml*.  Not upstream libxml2.
The patch changes a public structure by adding fields *in the middle*,
so that broke the ABI.  That's two good reasons to revert the patch.
As Daniel has said in the bug, this patch was the quick fix that
Chromium did as they statically link to libxml2 so the API breakage
isn't an issue, the proper fix is already in libxslt.  As long as we
have libxml 2.9.0 and libxslt 1.1.27 onwards (which we do), the issue
is correctly fixed.

So, NAK to this patch, and a revert incoming.

Ross

