Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id 81D8F7FCE9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 14:00:42 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 18so8277474oin.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 06:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2pa8z00TYWvRbPcwsLwGSTq2vilOZAE7cnK2onJ30h4=;
	b=q5/vWZBhGdxR8J7bc8ntpr8n3+WUkeqBryuovPzjwUd7y5ACveUez3jtk/BBk66ya5
	Rcdk8Ath+NSYTFA7BEvKtukWlL6iEMLskNF1rWtZWMRf4EB742TQXpB1zrV/YRWNFHoI
	f9P74O5Fw73EFXjT3eYjb+Qt4ZBA2V5Xs2Fbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2pa8z00TYWvRbPcwsLwGSTq2vilOZAE7cnK2onJ30h4=;
	b=d7ICM5w9aRBHeXinRgmP6zDmKuRVTUsNT2OE304bUw8S0/1/k63AucTYtsUtt6Io8f
	qJB0QN2SDQ0BvqGe9OdzagaY4XG5XcmJRjttew/W5C5IOD/oUEbQEO9rW7iYkO/q1MAL
	PNPHfzAomyfvXdVwXgW4upjjr7an2Ujp5WxZwM1IJUCm59HjPOdFh6uGglWdaIfalqNo
	wJTG6CdMqCErEgRIKlaXLD4iw0PGI6rXhqqNwgnkWLxURkhvZml9VpEAERx5eypD/TiY
	b/XE47DAfA6pk5BHSDh+ypypIhp13dwihKLZ/X1D2lpfpi2/EYzx93LaLCX8UI0ymgSk
	LExg==
X-Gm-Message-State: APjAAAXkxtO+n3pVky6vYHQ9vPLx6vHw2ZFAOcpfBBDS31Tvkr5A5v+Z
	19yFakkTyviPGMWNuBvmn1ci3VxlUtMGZ2zl4IuNNw==
X-Google-Smtp-Source: APXvYqySKEpTYZ9FsyPSXQw961i+Adv1Rr7TplJS85QyxnveTo04dIVg2EIYsovlmkBvGdwOGnTPVBgt0kwcDV3c8q0=
X-Received: by 2002:a54:4e8d:: with SMTP id c13mr12797377oiy.27.1578924043518; 
	Mon, 13 Jan 2020 06:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
	<CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
	<CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
In-Reply-To: <CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 13 Jan 2020 14:00:33 +0000
Message-ID: <CAM9ZRVut=Wu37sJ5A8fi3be-Bm3vWYepK4Sp2x=r7Et0xoy3WA@mail.gmail.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] wic: fix images build in parallel
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
X-List-Received-Date: Mon, 13 Jan 2020 14:00:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2020 at 13:57, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > >
> > > OE wic plugins create temporary file with the index of the line
> > > tmp file name. This causes race in case several builds run in time.
> > > Add more entropy as timestamp to remove this race.
> >
> > How would two wic images to be built in parallel with the same work
> > directory? To my understanding an image recipe only supports building
> > a single wic image.
> >
> > Thanks,
> > Paul
>
> bitbake image1 image2 image3
> all images build .wics and use about the same files, like firmware.
> Issue is similar to that:
> https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html

Each image has its own work directory though.

I'll take a look in more detail later today or tomorrow, if wic is
writing temporary files outside of the work directory then that's a
bug and should be fixed.

