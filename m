Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TiVtq-000448-42
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 20:53:55 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:44899 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TiVfl-000889-BD; Tue, 11 Dec 2012 14:39:21 -0500
Date: Tue, 11 Dec 2012 14:39:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20121210230353.GA11623@jama.jama.net>
Message-ID: <alpine.DEB.2.02.1212111424130.29254@oneiric>
References: <alpine.DEB.2.02.1212061253340.15222@oneiric>
	<50C0E055.4070105@windriver.com>
	<alpine.DEB.2.02.1212061316510.16942@oneiric>
	<20121210230353.GA11623@jama.jama.net>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: slightly confused about .bbappend file and FILESPATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 19:53:55 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 11 Dec 2012, Martin Jansa wrote:

> On Thu, Dec 06, 2012 at 01:19:57PM -0500, Robert P. J. Day wrote:
> > On Thu, 6 Dec 2012, Mark Hatle wrote:
> >
> > > On 12/6/12 12:03 PM, Robert P. J. Day wrote:
> > > >
> > > >    currently writing a tutorial page on how .bbappend files and
> > > > FILESPATH work, and i wanted to use a live example, but now i'm
> > > > confused.
> > >
> > > The way it works is the same way as PATH in the shell.  It's just a set of
> > > search paths.
> > >
> > > >    using meta-ti layer, i chose to build core-image-minimal for a
> > > > beagleboard, for which the meta-ti layer has the following under
> > > > recipes-core/netbase/ that i want to use as an example:
> > > >
> > > > $ find
> > > > .
> > > > ./netbase_5.0.bbappend
> > > > ./netbase-5.0
> > > > ./netbase-5.0/beagleboard
> > > > ./netbase-5.0/beagleboard/interfaces
> > > > $
> > > >
> > > > where the .bbappend file contains only:
> > > >
> > > > THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> > >
> > > I believe this is the default value of 'THISDIR' already, so there is no
> > > reason to specify it in the .bbappend itself.
> > >
> > > > FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> > >
> > > In this example, it's incorrect.  As you have a directory named
> > > "netbase-5.0", so your FILESPATH should be: ${THISDIR}/${PN}-${PV}
> >
> >   ok, so that's just a bug in the setting of FILESPATH in that one
> > example?  whew.  i was seriously wondering how badly i misunderstood
> > how this feature worked.
> >
> >   as soon as my beagle core-image-minimal finishes building, i should
> > be able to trivially check that the interfaces file used to populate
> > the rootfs image is the one from oe-core and not the one that should
> > have come from meta-ti.
>
> See FILESEXTRAPATHS in other bbappends and
>
> meta/classes/base.bbclass:FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}","${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
>
> + definition of fce base_set_filespath:
> meta/classes/utils.bbclass:def base_set_filespath(path, d):

  i'm still not sure what your point is here.  to be perfectly clear,
if i'm pulling in the meta-ti layer and building a core-image-minimal
for a beagleboard, it appears that the overriding network interfaces
file from the meta-ti layer does *not* override the one from oe-core
since this is the full value of FILESPATH being used:

# FILESPATH="${@base_set_filespath(["${THISDIR}/${PN}"], d)}
${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
FILESPATH="/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/linux-gnueabi
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/arm
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/build-linux
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/pn-netbase
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/dm814x-evm
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/ti814x
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/armv7a
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/class-target
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/forcevariable
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/libc-glibc
/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/linux-gnueabi
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/arm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/build-linux
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/pn-netbase
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/dm814x-evm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/ti814x
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/armv7a
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/class-target
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/forcevariable
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/libc-glibc
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/linux-gnueabi
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/arm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/build-linux
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/pn-netbase
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/dm814x-evm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/ti814x
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/armv7a
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/class-target
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/forcevariable
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/libc-glibc
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/linux-gnueabi
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/arm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/build-linux
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/pn-netbase
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/dm814x-evm
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/ti814x
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/armv7a
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/class-target
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/forcevariable
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/libc-glibc
/home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/"

  note that the directories from the meta-ti layer don't include the
(correct) value of netbase/netbase-5.0, since (as i understand it) the
line in base.bbclass you refer to:

FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",  \
  "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"

only causes the expansion into the common variants of the directory
name for the oe-core layer (as you can see above).  so under oe-core,
you'll get the automatic directory name variants netbase, netbase-5.0
and files (exactly what you see above).

  but under the meta-ti layer for netbase, you *don't* get that since
here's the netbase_5.0.bbappend file:

  THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
  FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"

which (unless i'm cripplingly mistaken) will prepend the set of
directories *only* under precisely that name "${THISDIR}/${PN}", which
is exactly netbase/netbase, which is wrong.

  am i completely misunderstanding what's happening here?  as i see
it, the trivial fix is to simply tweak the .bbappend file to read:

FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}-${PV}}"], d)}:"

i already submitted a patch for that to the meta-ti list, i just want
to confirm that the above really is a bug in the netbase .bbappend
file in that it won't pick up the overriding interfaces file.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



