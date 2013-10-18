Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63A436CFE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 20:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9IK4DtN008402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Oct 2013 13:04:14 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 18 Oct 2013 13:04:12 -0700
Date: Fri, 18 Oct 2013 15:03:58 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131018150358.493f6279@e6410-2>
In-Reply-To: <1382108670.29912.553.camel@ted>
References: <cover.1381954954.git.tom.zanussi@linux.intel.com>
	<fd09f894b40dadb8bc8b267a26dbf52e22a53d66.1381954954.git.tom.zanussi@linux.intel.com>
	<1382108670.29912.553.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wic: add pseudo to the populate-extfs step
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
X-List-Received-Date: Fri, 18 Oct 2013 20:04:17 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 18 Oct 2013 16:04:30 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> > -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
> > +        populate_script = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > +        populate_script += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
> > +        populate_script += "export PSEUDO_PASSWD=%s;" % rootfs_dir
> > +        populate_script += "export PSEUDO_NOSYMLINKEXP=1;"
> > +        populate_script += "export PSEUDO_DISABLED=0;"
> > +        populate_script += "%s/usr/bin/pseudo %s/usr/bin/populate-extfs.sh" % \
> > +            (native_sysroot, native_sysroot)
> > +
> >          image_extra_space = 10240
> >  
> >          image_rootfs = rootfs_dir  
> 
> I've merged this but I would like to figure out why pseudo can't manage
> more sane defaults rather than needing all of those variables...

Good question. Historical answer:

You need PREFIX to figure out where libpseudo.so is. LOCALSTATEDIR is there
becaus one copy of libpseudo.so can correspond to several different state
dirs. PASSWD is an optional feature, and not enabled by default; maybe it
should be, but the question of what path to use for it is not obvious. I
suppose it could be changed to default to / or the current chroot directory,
but I don't know that that would help. NOSYMLINKEXP is behavior which may
be desireable or undesireable, and it's really usage-specific. Not sure why
DISABLED=0 is needed here.

In a lot of these cases, there's no meaningful way to make a sane default. I
suppose in theory we could search through LD_LIBRARY_PATH to find a
libpseudo.so and guess PREFIX from that, the other bits are pretty hard to
define good defaults for. Arguably, NOSYMLINKEXP has a sane default, it's
just that this is the use case for which the sane default isn't the right
choice.

And I was thinking a bit about a config file, but that wouldn't really work
for several of these; you don't necessarily want NOSYMLINKEXP shared between
different clients running against the same tree.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

