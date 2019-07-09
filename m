Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD417E417
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 11:12:29 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j5so22895636ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 04:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xUoaLfZb03ASoEx92cLhuFm/3EzeHlY7pCwF27Fmz7g=;
	b=Dt4rGsg36+slgHxobTnfDf1otmXCRJJluhJ4wYE8dn21rxk4C9o4uV4OcV/WPsK6P3
	Sx8wz326sEvc/luWaPf/Sv+dnGJVSQ0kxVBgDg7XVTFoLayIEWy4rlX7ryzUG2tTic1D
	uQQLmGP5mOrr5Wkdtc2bCGWQzHhWVg4L1ywu+7/TpbJueq8So/S7WAQoL5+qjVukPa8d
	gu/K2IrxK/Fg3WgyeywzKhtofI3PkTB/LE5Rm5iWHl9p5sERerkqBhnHTwxWMb+EYg+n
	NaGcssRk4sukMYPDD3Pztla7qXzf4posVhHLRTxdA9EuF0/1Roqncfp2GWwM/YiD7oaD
	uHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xUoaLfZb03ASoEx92cLhuFm/3EzeHlY7pCwF27Fmz7g=;
	b=GC70FDZahJnIloO9dxsh5LwBOy8WX6dZwRsoG0NlMTIy1q6dpFUlq4owfzr0cfqRwC
	E0986aDUotpZheGiYR215AcSFDkOiR/rYWIgbgFNwTGA8RzgFHCdoaNQJCleVIWLAYHh
	WjEzw2Hu36R7d5txY15qQIUDIX7uIjcZ+5LNyiW+7DAHHteChA4GK6hEWQOOzJ5LcpeM
	sj3duqoGlS9S02yaPuidNODpxegP2hdOENSgTe1B9x8pP3Y1eEe2c5Z0v37aWaqW2LXk
	EOGuKOZNB9SDnbkVRFzQnTSeqWmlfSQuRFPny2RbrsCV1gw4gaw4DU1GMW4b0k7BeINw
	cZiQ==
X-Gm-Message-State: APjAAAV63BHPHo5NVeZG733YHJhac6fVgthsiv9yRVQORDuo4oMDlCeb
	ERUV7FGc50AulE13ud11ctz4AN5VlP2Po0CDOFqR0Wym
X-Google-Smtp-Source: APXvYqxqNR+qSZz4HTsGAkeCUCGoJLZIopsfvvJz08Lqkg/6tnN81hx0p4a6scBrBg6PzR4MVzilFeLSM4KMkBOkOhw=
X-Received: by 2002:a5e:de0d:: with SMTP id e13mr5169416iok.144.1562670750213; 
	Tue, 09 Jul 2019 04:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190709084334.28399-1-ricardo@ribalda.com>
In-Reply-To: <20190709084334.28399-1-ricardo@ribalda.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 9 Jul 2019 12:12:19 +0100
Message-ID: <CAO5Uq5RXK1k23fQZ2ov2vq5pomza=FzVb1umwyh2ArmVez44nw@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix interface bring-up on kernels >= 5.2
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
X-List-Received-Date: Tue, 09 Jul 2019 11:12:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 9:43 AM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> With kernels >=5.2  systemd-networkd is unable to bring up the link.
>
> eth0: Could not bring up interface: Invalid argument
>
> This is already reported upstream and fixed on master:
>
> https://github.com/systemd/systemd/issues/12784
>
> They recommend Debian to backport two patches.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---

Could we just move the SRCREV to the top of systemd-stable, which
includes a change that looks a lot like this problem, but isn't the
exact same change?

-- 
Alex Kiernan

