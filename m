Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 745E17694F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 12:47:29 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so89622903igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 05:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=bHSMygCkVNvOt89YJ8FBGLPgAjO9/YR++WvL4ercl3A=;
	b=Rje07b5dtKtGjaomwExdnjsQ+N5s5wygCRsFekHZOLR/RdTXKaNCPJNua+k1Gb+D31
	lu3ED3VEYWMhYAvKh1nghYVR2katzJZB7iuwIIhJKTG0e8uvBaTbRyfCcp3Mmx71Jp4C
	4AUE6gxz3R2pJKMQ6Qlt4EM7fZpjgpRd6QWAwrO3Iq58eF1+XuCgT2ddS1DAcnaOxQGN
	pDS8YTKmQpvDqIsVYDEtjHPIDiLGXy39KMZCIgk/9at9XkHZYhpjY1xPNFvl0CfiWQOA
	v0FmxCgB3jqSQd4FNf975c8DhydAiCQYJC7Dp1xl95qApZDkPlI0+5KV+AtUMaFYwi3F
	gdWw==
X-Gm-Message-State: ALoCoQmSsvu6ZVqi0dn62DS1QBB53EYWQX10b/UkMKBTU5ZYbEpiidaL2l2RFL1LLW4o2YBvKwvL
X-Received: by 10.50.79.197 with SMTP id l5mr17334553igx.28.1439297249442;
	Tue, 11 Aug 2015 05:47:29 -0700 (PDT)
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com.
	[209.85.213.182]) by smtp.gmail.com with ESMTPSA id
	f83sm1431644iod.19.2015.08.11.05.47.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 05:47:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbpg9 with SMTP id pg9so89795426igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 05:47:28 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.166 with SMTP id g6mr8031171igt.19.1439297248201; Tue,
	11 Aug 2015 05:47:28 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 11 Aug 2015 05:47:28 -0700 (PDT)
In-Reply-To: <CADkTA4NL2Lz08PzmNhW1d9MiQhezDkmo5FwxpgG851Mc7Wffzw@mail.gmail.com>
References: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
	<CADkTA4NL2Lz08PzmNhW1d9MiQhezDkmo5FwxpgG851Mc7Wffzw@mail.gmail.com>
Date: Tue, 11 Aug 2015 09:47:28 -0300
Message-ID: <CAP9ODKqqG=gsUdoswgSMz6TpDYBXqeekFnS+FC3YhRveRUy0QA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Fix do_shared_workdir task ordering
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
X-List-Received-Date: Tue, 11 Aug 2015 12:47:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2015 at 12:23 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Aug 10, 2015 at 11:21 AM, Stefan M=C3=BCller-Klieser
> <s.mueller-klieser@phytec.de> wrote:
>> commit 02d0a003d60326 [kernel.bbclass: Fix race condition] has surfaced
>> a bug in the generation of the shared_workdir. The task
>> do_compile_kernelmodules adds the exported symbols of the kernel modules
>> to the Module.symvers. By creating the shared_workdir before the modules
>> are compiled, the symbols of the modules are missing in the
>> shared_workdir. Subsequent external module builds will not include the
>> ABI CRC of functions exported in modules. Modprobe will fail to load the
>> external module if CONFIG_MODVERSIONS is enabled.\
>
> Have you seen our bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D8127 ?
>
> It's new .. so probably not.
>
> The significant issue with this, is that we are now forcing anyone
> that needs the
> shared workdir artifacts to build kernel modules.
>
> That's performance issue for many workflows.
>
> I had some changes where I was working to short cut parts of the process,=
 but
> they turned out to miss a few corner cases.
>
> We need to do more thinking on this one, before we can bring in a change =
like
> this .. since avoiding that overhead is something valuable.

I agree that performance is important but correctness seems more
valuable for me. I think the optimization can come as a subsequent
patch ...

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

