Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 416DC60557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 18:19:39 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so12361634pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2Z+P/nTrKkGResxoB6h804C4hksf6o+dqV8AY+9x7V4=;
	b=HBUWpFCWu+3jP6ZZgc51pfr0DfMr3BPKeDzIOuWRHDLKIelfdmWdjuK1N7oVwo58mj
	u3I7gHUnFl3HuJTfB1AhALSoTzAfrK7+7KsHjcnLfm6IQT6/ArUHZ9xXS6CJ2mQfgbfg
	GhkSp3WXYEnUR3dO9q+4s2vIfSOkmkRKjoNp2b07vPHCvgsbBst+8fK2+eugyoeK0iKV
	rn8XU0ANkeQTz7w3FOPjNygUGXWx8YZ3piYt2rAqDhZMt2rC7zEypX5qJL+AB4SGAqpv
	8DbgNRDqSgmfibPvE+kxWhnv80NnQOv7FQHyqMIpqXvVga6huMVLKK6JHyAtAiYsNVCh
	i/Ig==
MIME-Version: 1.0
X-Received: by 10.70.47.9 with SMTP id z9mr72489870pdm.69.1435083581109; Tue,
	23 Jun 2015 11:19:41 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Tue, 23 Jun 2015 11:19:41 -0700 (PDT)
In-Reply-To: <1435077176.11489.92.camel@linuxfoundation.org>
References: <1434704980.14710.108.camel@linuxfoundation.org>
	<CALbNGRSi6wrQwNP21MoUQR=LdD7HW+EOd6ZF-9_jGbr4Uty+8g@mail.gmail.com>
	<1435077176.11489.92.camel@linuxfoundation.org>
Date: Tue, 23 Jun 2015 20:19:41 +0200
Message-ID: <CALbNGRTxYpHttoF1+vjcTwOnskYKho8X4R5Ug=+rWY8FGibEpw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Strip files in sysroot
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
X-List-Received-Date: Tue, 23 Jun 2015 18:19:43 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 23, 2015 at 6:32 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> Do I understand this right: Stripping is disabled by default (because
>> it would cause trouble for remote debugging)?
>
> No, this is only stripping of the sysroot files, not target. Its due to
> the way locale packaging happens for glibc. It does mean some files in
> the sysroot are not stripped when they could be but its no change from
> the existing behaviour before the patch.
>
> Cheers,
>
> Richard
>
Sorry for insisting - maybe I need more explanation:

From my understanding staging sequence is:

* do_install installs to recipe's image folder
* do_populate_sysroot -> sysroot_stage_all() creates hardlinks to
recipe's sysroot-destdir folder
* do_populate_sysroot -> sysroot_strip() strips files in recipe's
sysroot-destdir (=files in recipe's image folder)
* through sstate_install the files are hard linked to MACHINE's
sysroot (STAGING_DIR_HOST)

I see two issues activating stripping

1. If do_package starts after stripping only stripped packages are
packed also for dbg. I think nothing gaurantees that packaging occurs
before do_populate_sysroot.
2. When remote debugging I tell debugger: set sysroot <content of
STAGING_DIR_HOST>. Where do I find a unstripped sysroot now?

Andreas

