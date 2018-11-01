Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08A1B79DC9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 12:22:28 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id h21-v6so7553952ywa.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 05:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TDN6O+zY+7YyvFzU5f+Wb969qCxdYeTuFzMHSoAg3SA=;
	b=dUrjn9jRhLm8A9Klh0n9k8n1+VC701DaI6OL2Oydx6gVriApLwJuOPeadrLJqL7Xp5
	XrUa91D5pZx9m/EbUKtGW2OzNiEw44PJZb1bF78NwnrpTSAWlIRfZ5qsBZmrWnmZK/wk
	j8KrvPHyTqyHfzuyqnrHujYHdo+Pql5JqSk5FXyBdziHipCectJxF4qvAmiJYDYr6T+T
	fGlhd1YsVZe4apTgJagTlYoL1BObSCK61IvSKohRxh4adgw0YREdZEcRlZhJAJrLy3jL
	REsaliuuCU79Hpf0S1oVXw/5PMRGxbRfjjb9HDfGwulZQrs338HyTKQPudKdvqp63/o/
	GNXw==
X-Gm-Message-State: AGRZ1gLmJx2YlNlqUKGsZ7oct/6U5uoG2a/D1bukXV7i2xQl1zwOnmIE
	5mynp8Q/0mDXcef5Jypn7nHzHcOy
X-Google-Smtp-Source: AJdET5dJzUDmAGZ1WzOaPDJSoCsU6/H75znLm7M4IhqVaNbNOHKLJ4Ug3DtNb584sv+IY5og2EwFAw==
X-Received: by 2002:a81:ed8:: with SMTP id
	207-v6mr6652692ywo.425.1541074949630; 
	Thu, 01 Nov 2018 05:22:29 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	10-v6sm4306099ywt.47.2018.11.01.05.22.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 05:22:28 -0700 (PDT)
Message-ID: <dd0f0d44e10ffd42f28bc7a5a939c99112481db9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Nov 2018 12:22:26 +0000
In-Reply-To: <7d0550c8af1ad69f6b7832e8d5605e4fd09fe475.camel@linuxfoundation.org>
References: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
	<7d0550c8af1ad69f6b7832e8d5605e4fd09fe475.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.1-1 
Mime-Version: 1.0
Subject: Re: broken sstate archives
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
X-List-Received-Date: Thu, 01 Nov 2018 12:22:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-10-30 at 16:49 +0000, Richard Purdie wrote:
> On Tue, 2018-10-30 at 15:45 +0000, André Draszik wrote:
> > Having updated poky from 028a292001f64ad86c6b960a05ba1f6fd72199de
> > (end-of
> > July) to 3b77e7b7852549dcfbc426d4ce258e6e857c0acd (mid October), at
> > least
> > two broken sstate archives have been created:
> > 
> > * the sstate archive for update-rc.d package_write_ipk contains a
> > broken
> >   main package update-rc.d_0.8-r0_all.ipk
> > * zlib populate_sysroot has a broken sysroot-
> > destdir/lib/libz.so.1.2.11
> > 
> > For the update-rc.d case:
> > * tar tzvvf displays a reasonable size for all files inside the
> > sstate
> >   archive
> > * tar xzf extracts all files and sets a size on update-rc.d_0.8-
> > r0_all.ipk,
> >   but it's all NULs, and hence is broken
> > * for those who know midnight commander, it's 'open' displays a size
> > of
> >   0 bytes for update-rc.d_0.8-r0_all.ipk in the first place
> > 
> > 
> > For the broken zlib sstate archive, things are similar, additionally:
> > * the zlib ipk packages (and their contents) contained inside
> >   sstate_zlib_*_package_write_ipk.tgz are actually not broken
> > 
> > 
> > The original (first) build resulting from my poky.git update had
> > actually
> > completed successfully. It is only subsequent builds trying to use
> > the
> > generated sstate artefacts that now don't work.
> > 
> > I can't say for sure whether or not other sstate artefacts are
> > broken, too.
> > 
> > 
> > Any ideas how this could have happened? Have similar issues been seen
> > before?
> 
> I've not seen/heard of any reports of that before and it is worrying.
> The question is can you reproduce it? As things stand that is a little
> bit of a hard one to replicate/debug :(
> 
> Which host OS and filesystem was it?

I now have continuous rebuilds of above described scenario on two different
physical machines and am getting broken sstate archives in a similar way to
the description above every now and then for varying recipes and/or varying
files inside a given sstate archive on one of the two machines (the faster
one) so far.

Unfortunately I don't know which of the two physical machines was involved
in my original description.

The faster machine is running Debian 9.5 and kernel 4.9.110-3+deb9u5 the
other Debian unstable and kernel 4.18.8-1 - builds happen inside a Debian 9
docker container in any case. Both machines use btrfs.


Nevertheless I'm tempted to rule out hardware issues, though because:
* The sstate archives are either just archiving the output of
  do_populate_sysroot (which itself is just hard-linking the output of
  do_install), and that same do_populate_sysroot output is also used during
  compilation of dependent recipes
* Or the sstate is created by archiving the output of do_package_write_ipk,
  where again the same IPKs (hard-linked) are used to build the final image
* The defect seems to be inside the .tar, but an sstate archive is a
  .tar.gz, and no temporary uncompressed .tar is stored in the file-system
  to create the compressed .tar.gz

Please correct me if this reasoning is flawed.


I'll play with a few bits and variations to try to narrow things down, but
given the nature it'll likely take a while to get more insights.


Cheers,
Andre'



