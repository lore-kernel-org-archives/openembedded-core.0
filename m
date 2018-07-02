Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 86D3778A19
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 21:13:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w62LD4m5028849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 2 Jul 2018 22:13:05 +0100
Message-ID: <536e0253544bf237adf96c6efd2c1712dda715a8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, mike.looijmans@topic.nl
Date: Mon, 02 Jul 2018 22:13:04 +0100
In-Reply-To: <CAO5Uq5Qt9BV4gtROQrDW7+1Szs8226dPc7JnvrUszB0ZyA1LYg@mail.gmail.com>
References: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
	<6b743d05-aa53-bb1c-f96b-f604a77d2911@topic.nl>
	<CAO5Uq5QqToYKu21=eKb7esa-Otxp3epBsn6ExB33Zm0GhUSEiA@mail.gmail.com>
	<CAO5Uq5Qt9BV4gtROQrDW7+1Szs8226dPc7JnvrUszB0ZyA1LYg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Mon, 02 Jul 2018 21:13:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-02 at 18:44 +0100, Alex Kiernan wrote:
> On Mon, Jul 2, 2018 at 4:06 PM Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> > 
> > On Mon, Jul 2, 2018 at 3:55 PM Mike Looijmans <mike.looijmans@topic
> > .nl> wrote:
> > > 
> > > The sftp-server runs fine using dropbear as SSH backend, I'd
> > > expect the same
> > > to be true for the client. Isn't that the case, and will the sftp
> > > client only
> > > work with openssh's ssh?
> > > 
> > 
> > Interesting question... I hadn't realised dropbear didn't have an
> > sftp
> > client, but it's clearly a supported combination:
> > 
> > https://github.com/mkj/dropbear/blob/1656db9e58e7e8188e4ca27ae4892b
> > 14949c56a5/dbclient.1#L159
> > 
> > I'll amend the patch so it depends on ssh not ${PN}-ssh since both
> > dropbear and openssh provide that.
> > 
> 
> Hmm... only that gets you this warning:
> 
> NOTE: Multiple providers are available for runtime ssh (dropbear,
> openssh)
> Consider defining a PREFERRED_RPROVIDER entry to match ssh
> 
> If you've not set it, which feels like a pretty poor upgrade
> experience; I'm not sure how best to deal with that.

This is not an easy problem to solve. This is why we have the horrible
VIRTUAL-RUNTIME_* variables, I wish there were a better way...

Basically, bitbake has to have some idea which one to build, letting
the package manager decide at do_rootfs time isn't really good enough
for deterministic builds.

Cheers,

Richard

