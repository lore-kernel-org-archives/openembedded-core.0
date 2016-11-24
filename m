Return-Path: <uol@pengutronix.de>
X-Greylist: delayed 964 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Nov 2016 06:31:47 UTC
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id A820760119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 06:31:47 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <uol@pengutronix.de>) id 1c9nJv-00044o-PM
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2016 07:15:43 +0100
Received: from uol by pty.hi.pengutronix.de with local (Exim 4.84_2)
	(envelope-from <uol@pengutronix.de>) id 1c9nJv-00077d-Gz
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2016 07:15:43 +0100
Date: Thu, 24 Nov 2016 07:15:43 +0100
From: Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<1479916616.31880.48.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1479916616.31880.48.camel@intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:49:32 up 13 days, 16:57,  7 users,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/1.6.2-neo (2016-06-11)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Thu, 24 Nov 2016 06:31:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Nov 23, 2016 at 04:56:56PM +0100, Patrick Ohly wrote:
> On Wed, 2016-11-23 at 15:22 +0200, Ed Bartosh wrote:
> > On Wed, Nov 23, 2016 at 02:08:28PM +0100, Kristian Amlie wrote:
> > > On 23/11/16 13:08, Ed Bartosh wrote:
> > > > On Tue, Nov 22, 2016 at 12:54:52PM +0100, Kristian Amlie wrote:
> > > > [...]
> > > > This can be done by extending existing rootfs plugin. It should be able
> > > > to do 2 things:
> > > > 
> > > > - populate content of one rootfs directory to the partition. We can
> > > >   extend syntax of --rootfs-dir parameter to specify optional directory path to use
> > > > 
> > > > - exclude rootfs directories when populating partitions. I'd propose to
> > > >   introduce --exclude-dirs wks parser option to handle this.
> > > > 
> > > > Example of wks file with proposed new options:
> > > > part /     --source rootfs --rootfs-dir=core-image-minimal       --ondisk sda --fstype=ext4 --label root --align 1024 --exclude-dirs data --exclude-dirs home
> > > > part /data --source rootfs --rootfs-dir=core-image-minimal:/home --ondisk sda --fstype=ext4 --label data --align 1024
> > > > part /home --source rootfs --rootfs-dir=core-image-minimal:/data --ondisk sda --fstype=ext4 --label data --align 1024
> > > > 
> > > > Does this make sense?
> > > 
> > > Looks good. The only thing I would question is that, in the interest of
> > > reducing redundancy, maybe we should omit --exclude-dirs and have wic
> > > figure this out by combining all the entries, since "--exclude-dirs
> > > <dir>" and the corresponding "part <dir>" will almost always come in
> > > pairs. Possibly we could mark the "/" partition with one single
> > > --no-overlapping-dirs to force wic to make this consideration. Or do you
> > > think that's too magical?
> > >
> > Tt's quite implicit from my point of view. However, if people like it we
> > can implement it this way.
> 
> I prefer the explicit --exclude-dirs. It's less surprising and perhaps
> there are usages for having the same content in different partitions
> (redundancy, factory reset, etc.).
> 
> Excluding only the directory content but not the actual directory is
> indeed a good point. I'm a bit undecided. When excluding only the
> directory content, there's no way of building a rootfs without that
> mount point, if that's desired. OTOH, when excluding also the directory,
> the data would have to be staged under a different path in the rootfs
> and the mount point would have to be a separate, empty directory.
> 
> I'm leaning towards excluding the directory content and keeping the
> directory.

what about having both possibilities by leaning against the syntax that rsync
uses to specify if a whole source directory or only it's contents shall be
synced to some destination site (see [1])?

In analogy to this to exclude only the contents of the directory named 'data'
you would use

  --exclude-dirs data/

but to additionally exclude the dir itself as well it would read

  --exclude-dirs data

Best regards
Ulrich

[1] http://man.cx/rsync(1)#heading6
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

