Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 88D80746AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 13:01:57 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id l41-v6so8997018qtl.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v0NG6ExD8o4kPxAFu+alkrsZfiSo9FlF835ipYNXV2k=;
	b=gB213Yo9xYrrwP+PM4fYHnPkUj3MQJgyshUzrL3zPqwNsM3xCZIDdW202Q2jZY0Bos
	03tSteW7WpXyWJ01PrECar1psHMaBA12RrXprgGa85sct1slHtLcHBIiHaB+qntXYfwo
	xssEgVdMHUxeaaVaOitLHsRreAu+oVwwfnVz4XOaU8/bAg1qCZaTCKFpQS6aJoi/ImNN
	0paz5DwMhY6jczvvsqUCIW5zgKqPgG4IDAG3bgNS3mJc5/3kkscjQ+0KsS6xGIe4Delx
	XBfpNUezBldr5Ya2Cqr5SL9iCtLYj3lBC0Klf3FFDBOwT4rDhh0AlDM9P7h2At82MKT7
	LfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v0NG6ExD8o4kPxAFu+alkrsZfiSo9FlF835ipYNXV2k=;
	b=Zjp+HjBdl3FrvYCShu+7T3YQ4R5ciKF5VSQRRv2fryrYkFuu3W9bSIACjCn6eC6f2w
	snjARSAVkotOYMdwZhA6/pwodNJFEl2PeCSJ7O/I/xzrI8syyOyzGg/5klsTKLcBDpS5
	ShLXTjSMMjn0L4tUgXmu8phCZ7YtZRSFPvxXPxqMo1Plh510+ZV7EXimqCYUGQXliU6x
	Y3r/gl+RBvnCZa+UtevTU54KSPDG8TROc/5aRuRC0hdx1TJa9JFi90sMtx4SsYd6EeoC
	9TL5iIdoZVRTXecsn8yhY24cg+yb4NkTPIXOt/Z3m6tVbrS3aWP9g6uo/yh+65ofUUbN
	G0LA==
X-Gm-Message-State: AGRZ1gLWZ5PkVb50Rc3JAJmnKimSdNppngWbRil1BwGgy2H6z7G2wtLF
	UWTbLZodazVQ3mqAJcRvpijLoy3UAFoitnISpuA=
X-Google-Smtp-Source: AJdET5ecu9weH77DiOAfOrqWDznODrlTQgi/Zv6cK/BEvt9zGsHj29H/eDIGMtUvauQBTtIefPvyGF0CiAJKhbQ6zvQ=
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr10599125qvg.194.1540818118095;
	Mon, 29 Oct 2018 06:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <77e2fb99554339ea31caf60700a1595f@agner.ch>
In-Reply-To: <77e2fb99554339ea31caf60700a1595f@agner.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 06:01:31 -0700
Message-ID: <CAMKF1sqsFd=96ARdFX-KdgrOH9iAP5Ndb7aWXTEwGVkAyXFzzg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: luka.pivk@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Lock external repository in custom FSTYPE
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
X-List-Received-Date: Mon, 29 Oct 2018 13:01:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:31 AM Stefan Agner <stefan@agner.ch> wrote:
>
> Hi,
>
> We use meta-updater, which has a custom FSTYPE to build a OSTree
> repository. We share that repository across multiple bitbake executions.
> The underlying OSTree tools lock the OSTree repository before trying to
> interact, and if it fails ("error: Locking repo exclusive failed:
> Resource temporarily unavailable") then the complete build fails (see
> also https://github.com/advancedtelematic/meta-updater/issues/412).
>
> Now I'd rather prefer that two bitbake tasks would serialize the access
> to the OSTree repository. Is there a mechanism in bitbake to lock (and
> wait) for the repository to be not in use?
>
> We tried using bb.utils.lockfile, but the task is written in shell. Also
> inline Python would not work since locking/unlocking need to be done
> within one Python script as far as I understand.
>

perhaps you could use lockfiles something like

do_foo[lockfiles] = ...

> --
> Stefan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

