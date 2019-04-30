Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 88DDA7D23C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:45:37 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id e2so7749342vsc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 04:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UmIwCDOqW65ZtiVe1bMyrqAreVjwgWLVk1KAfdSFRrY=;
	b=ZSsbIVUifenJabxsU1xbVz3H/PybjnocAzuvw/nC2vVdFAYyawt0n+eKfmbAKGhWtf
	K4HFr/YbbhuFf0HZmwpBjaMdh1Z5X9FRQOCuNp+6gbxwGu0u/+cnpByoPnY2kNmP6m+8
	GzOFBxZw+ClkcaPoZo1AGnv33ihNM2YAZhAX5V+R/evACQEb8WqlU7dDZzB1WCzSpqDS
	0ZkXXCqnP8T6oKqKSawbYvteBZyB5z1BuQvCkQk5tWoXtnMIWXO6oDurJevrZGUYafuQ
	cL2bdmJqA7ccyitxUJjMIlvMiBq4qvl6oD6v7+YOp6QimLvdBFbQ+VqMY2OdO1GNkC6N
	MA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UmIwCDOqW65ZtiVe1bMyrqAreVjwgWLVk1KAfdSFRrY=;
	b=O+xmeA6gcZCXnBog7t2h2B9+taaaB17C4JxlB5g9NgYNlMw5NLHWrbi/wOu5WV5wew
	+xzW0cpV4kvyXhaWQj/REYQZPpG4ubnRcjPSrVQNKqWRDUSHkrYEZatY0qY642sEdtTP
	PG+VMLXVP2NyfsEBBKXZNEhebAfjy6VhhrpUwmD8zbNmDcBn5/3cfUSUdE7bUhCB4Xs/
	MgY7nQr2DsJLoDizEwsQu2oFwNIQLEjwCcI58MFPaVYnfBE15Xewm7D7SWLsKGQeHH4x
	gG+MN6K4ZcyfS8cYZAJcX3HVGk4P0gRwjSj+bdFklIP8TWa2xMXiHp44SGzopdVbBum2
	/rRA==
X-Gm-Message-State: APjAAAXsEzjuiwSpZTHF1JqxBM9JLwom0XD/mbhY+RdTkpbbOt6Bp1EK
	hDz/nfdSnhdyFb7UtpG/UOAfpj5Od6sYe2Fba4g=
X-Google-Smtp-Source: APXvYqyhm6d9JtyN/9+1XRyv2eugcLIPj7THohTGqw5dMgE1bHwbrIY2y4vhUxNdl6I63cxekD/D4enQT95LU3ZnUoA=
X-Received: by 2002:a67:f105:: with SMTP id n5mr35706978vsk.181.1556624738234; 
	Tue, 30 Apr 2019 04:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
	<546ea9e32e2fb9ffa97aae5fbd328f653a1949b5.camel@linuxfoundation.org>
In-Reply-To: <546ea9e32e2fb9ffa97aae5fbd328f653a1949b5.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 30 Apr 2019 12:45:27 +0100
Message-ID: <CAO5Uq5RRn7vCwxWvFyZR=OGc_VgnvcckOysqGCFtzbWkszqzsw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] Fix systemd service enables/move towards "stateless" configuration
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
X-List-Received-Date: Tue, 30 Apr 2019 11:45:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 11:59 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-04-29 at 15:43 +0100, Alex Kiernan wrote:
> > This is largely Jonas Bonn <jonas@norrbonn.se> patchset to move
> > towards a
> > "stateless" configuration:
> >
> >   These patches make some modifications to systemd with the long-term
> > goal
> >   of being able to run OE in systemd's "stateless" configuration.
> >   "Stateless" boils down to building an image with empty /etc and
> > /var
> >   directories so that volatile (tmpfs) filesystems can be mounted
> > there;
> >   this requires that the system subsequently be able to populate
> > these
> >   directories dynamically, which systemd mostly takes care of if
> > things are
> >   done right.
> >
> >   In these patches:
> >   i)   Don't include machine-id in writable images so that systemd
> > can run
> >        its first-boot machinery
> >   ii)  Move systemd configuration files out of /etc
> >   iii) Allow systemd to dynamically enable services and populate
> >        /etc/systemd/system via the presets mechanism
> >
> >   There's a long way to go to get to a working "stateless"
> > configuration.
> >   Getting to a "volatile" system (just empty /var) should be easier
> > and I'll
> >   post patches moving things in that direction shortly.
> >
> > As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> > ("meson: stop creating enablement symlinks in /etc during
> > installation"), services such as systemd-networkd are no longer
> > enabled
> > in images.
> >
> > This patch set fixes this problem in addition to satisfying the goal
> > of
> > moving towards "stateless" configurations.
> >
> > The issue with respect to image testing during CI was caused by
> > systemd-time-wait-sync.service being enabled due to the lack of a
> > default preset policy:
> >
> > https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> >
> > We include a default policy of "enable nothing" which matches that
> > used
> > by (at least) Arch and Fedora.
> >
> > Changes in v5:
> > - rebased for systemd 242
> > - install default preset distribution policy of "enable nothing"
> >
> > Changes in v4:
> > - add patch to make systemd-firstboot a non-default option to systemd
> > to
> >   prevent unexpected prompts at runtime
> >
> > Changes in v3:
> > - parameterize preset-file installation location (as suggested in
> > patch
> >   review)
> >
> > Changes in v2:
> > - address patchtest warnings:
> >   - include sign-offs on patches
> >   - include License-Update tag on patch that makes licensing change
> > - dropped patch implementing brute-force removal of unit files
> > installed
> >   by systemd into /etc
> > - reworked the systemd-conf patch to restore the installation of the
> >   base systemd configuration files
> >
> > Jonas Bonn (6):
> >   systemd: don't build firstboot by default
> >   systemd: do not create machine-id
> >   systemd-conf: simplify creation of machine-specific configuration
> >   systemd: create preset files instead of installing in image
> >   systemd-systemctl-native: simplify and support preset-all
> >   rootfs-postcommands: call preset-all for read-only-rootfs
>
> I think this is close but in one of our test configurations it appears
> the ssh server isn't starting:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/548
>
> (the stdio log shows the configuration its building for step 6 and
> step6c shows it failing to ssh into the image)
>
> I reran it and the same error happened twice so it is consistent.
>

I'll have a look - thanks for throwing it through!

-- 
Alex Kiernan

