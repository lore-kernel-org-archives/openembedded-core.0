Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1AB473905
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 21:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NLmjkg015796; Tue, 23 Jun 2015 22:48:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xSpY4lZ-50uu; Tue, 23 Jun 2015 22:48:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NLmWqg015767
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Jun 2015 22:48:43 +0100
Message-ID: <1435096112.11489.100.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 23 Jun 2015 22:48:32 +0100
In-Reply-To: <CALbNGRTxYpHttoF1+vjcTwOnskYKho8X4R5Ug=+rWY8FGibEpw@mail.gmail.com>
References: <1434704980.14710.108.camel@linuxfoundation.org>
	<CALbNGRSi6wrQwNP21MoUQR=LdD7HW+EOd6ZF-9_jGbr4Uty+8g@mail.gmail.com>
	<1435077176.11489.92.camel@linuxfoundation.org>
	<CALbNGRTxYpHttoF1+vjcTwOnskYKho8X4R5Ug=+rWY8FGibEpw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 23 Jun 2015 21:48:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-06-23 at 20:19 +0200, Andreas Müller wrote:
> On Tue, Jun 23, 2015 at 6:32 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> Do I understand this right: Stripping is disabled by default (because
> >> it would cause trouble for remote debugging)?
> >
> > No, this is only stripping of the sysroot files, not target. Its due to
> > the way locale packaging happens for glibc. It does mean some files in
> > the sysroot are not stripped when they could be but its no change from
> > the existing behaviour before the patch.
> >
> > Cheers,
> >
> > Richard
> >
> Sorry for insisting - maybe I need more explanation:
> 
> From my understanding staging sequence is:
> 
> * do_install installs to recipe's image folder
> * do_populate_sysroot -> sysroot_stage_all() creates hardlinks to
> recipe's sysroot-destdir folder
> * do_populate_sysroot -> sysroot_strip() strips files in recipe's
> sysroot-destdir (=files in recipe's image folder)

When it strips files, the hardlink is broken and replaced with a
stripped copy.

> * through sstate_install the files are hard linked to MACHINE's
> sysroot (STAGING_DIR_HOST)
> 
> I see two issues activating stripping
> 
> 1. If do_package starts after stripping only stripped packages are
> packed also for dbg. I think nothing gaurantees that packaging occurs
> before do_populate_sysroot.

Nothing does but the copy in image remains unstripped as above.

> 2. When remote debugging I tell debugger: set sysroot <content of
> STAGING_DIR_HOST>. Where do I find a unstripped sysroot now?

That is not really the way the sysroot has been intended to be used.
Inhibiting the sysroot stripping for target files would seem to be the
best thing to do if you do wish to use the sysroot that way:

INHIBIT_SYSROOT_STRIP_class-target = "1"

Cheers,

Richard


