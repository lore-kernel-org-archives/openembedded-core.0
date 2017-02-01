Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7303E71D8F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 12:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11Cs0X5017306; Wed, 1 Feb 2017 12:54:00 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ULaaabMqEXT0; Wed,  1 Feb 2017 12:53:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11Crvk8017303
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Feb 2017 12:53:59 GMT
Message-ID: <1485953637.14144.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 01 Feb 2017 12:53:57 +0000
In-Reply-To: <CAHiDW_FdD4ms=zYtdsXWvy8gqSWzTrazC3dCkn_vKxtEL4L2oQ@mail.gmail.com>
References: <1485943415-8260-1-git-send-email-jussi.kukkonen@intel.com>
	<1485948194.14144.23.camel@linuxfoundation.org>
	<CAHiDW_GosUv9rS2c5yZXvWgReno1rorTk4cR5J00+XZPb9wytg@mail.gmail.com>
	<1485950456.14144.25.camel@linuxfoundation.org>
	<CAHiDW_FdD4ms=zYtdsXWvy8gqSWzTrazC3dCkn_vKxtEL4L2oQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Fix make_relative_symlink() for RSS
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
X-List-Received-Date: Wed, 01 Feb 2017 12:54:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-01 at 14:38 +0200, Jussi Kukkonen wrote:
> On 1 February 2017 at 14:00, Richard Purdie <richard.purdie@linuxfoun
> dation.org> wrote:
> > On Wed, 2017-02-01 at 13:44 +0200, Jussi Kukkonen wrote:
> > > On 1 February 2017 at 13:23, Richard Purdie <richard.purdie@linux
> > foun
> > > dation.org> wrote:
> > > > On Wed, 2017-02-01 at 12:03 +0200, Jussi Kukkonen wrote:
> > > > > Recipe-specific sysroots broke make_relative_symlink(), which
> > > > > turns absolute symlinks in sysroots into relative ones. Use
> > the
> > > > > difference between the (in-sysroot) paths to construct the
> > > > relative
> > > > > symlink.
> > > > >
> > > > > This fixes links in openssl-native, fontconfig-native and
> > bzip2-
> > > > > native.
> > > > >
> > > > > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > > > > ---
> > > > >
> > > > > sstate is not an area I'm familiar with, please take a good
> > look.
> > > > >
> > > > > As far as I could see outputpath (based on state[2]) was
> > never
> > > > really
> > > > > needed so I did not use it in the new version.
> > > >
> > > > I don't think we can hardcode workdir into here as for tasks
> > like
> > > > do_deploy, this makes no sense. I think we removed most of the
> > > > absolute
> > > > links from the deploy tasks so we currently don't need this, at
> > > > least
> > > > in the common case but the sstate code is meant to be generic.
> > > >
> > > > I am wondering if we need to pass in anything at all, can't we
> > just
> > > > call relpath on the original path and turn it into a relative
> > one
> > > > directly without referencing it back to TMPDIR/WORKDIR?
> > > >
> > > The actual file path during do_populate_sysroot is something like
> > >   /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-
> > > r0/sysroot-destdir/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-
> > > native/1.0.2j-r0/recipe-sysroot-native/usr/lib/ssl/certs
> > >
> > > and the link before make_relative_symlink() points to 
> > >   /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-
> > > r0/recipe-sysroot-native/etc/ssl/certs
> > >
> > > Assuming those are correct, I don't see how to do this without
> > > referencing WORKDIR or TMPDIR?
> > 
> > Good point, I knew I was missing something. How about passing in
> > walkroot/state[1] into the function, then you can subtract that
> > from
> > the actual file, then run relpath between the (srcpath - walkroot)
> > and
> > the link?
>
> Figuring out a sysroot-based path for srcpath is indeed possible (and
> nicer) using state[1] but then I have:
>   path /usr/lib/ssl/certs

Are you sure path isn't /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-
native/1.0.2j-r0/recipe-sysroot-native/usr/lib/ssl/certs ?

>   link /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-
> r0/recipe-sysroot-native/etc/ssl/certs
> 
> Without knowledge of TMPDIR or WORKDIR, I don't see how I can turn
> link into anything like
>    ../../../etc/ssl/certs
> 
> Maybe I'm missing something?

I think you haven't realised path in this (native) case includes
$base_prefix which is the long path. I could well be missing something
too though...

Cheers,

Richard


