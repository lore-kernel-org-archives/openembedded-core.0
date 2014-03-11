Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 412596F7D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 00:05:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Mar 2014 17:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,627,1389772800"; d="scan'208";a="497337277"
Received: from unknown (HELO [10.255.12.213]) ([10.255.12.213])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2014 17:05:11 -0700
Message-ID: <1394496310.1279.25.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 10 Mar 2014 19:05:10 -0500
In-Reply-To: <1394413459.7883.23.camel@ted>
References: <1394317437-6551-1-git-send-email-joaohf@gmail.com>
	<1394413459.7883.23.camel@ted>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: Use mke2fs to create the ext2/3/4 image
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
X-List-Received-Date: Tue, 11 Mar 2014 00:05:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2014-03-09 at 18:04 -0700, Richard Purdie wrote:
> On Sat, 2014-03-08 at 19:23 -0300, João Henrique Ferreira de Freitas
> wrote:
> > OE-core commit f3a95ca6886b55e5819b068bdbd2cceb882d91a6 removed the
> > populate-extfs.sh. So mke2fs should be used to create ext2/3/4 image.
> > 
> > Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
> > ---
> >  scripts/lib/mic/kickstart/custom_commands/partition.py | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > index 91d751e..e0a82f5 100644
> > --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > @@ -174,7 +174,6 @@ class Wic_PartData(Mic_PartData):
> >          """
> >          Prepare content for an ext2/3/4 rootfs partition.
> >          """
> > -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
> >  
> >          image_rootfs = rootfs_dir
> >          rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
> > @@ -199,11 +198,10 @@ class Wic_PartData(Mic_PartData):
> >  
> >          extra_imagecmd = "-i 8192"
> >  
> > -        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, rootfs)
> > +        mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
> > +            (self.fstype, extra_imagecmd, rootfs, image_rootfs)
> >          rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
> >  
> > -        populate_cmd = populate_script + " " + image_rootfs + " " + rootfs
> > -        rc, out = exec_native_cmd(pseudo + populate_cmd, native_sysroot)
> >  
> >          # get the rootfs size in the right units for kickstart (Mb)
> >          du_cmd = "du -Lbms %s" % rootfs
> 
> Don't we need to be careful to find the binary from the native sysroot
> here since that is the one with the root directory option?
> 

Hmm, exec_native_cmd(mkfs_cmd, native_sysroot) is being used to do the
'mke2fs -d', which should do the right thing... Am I missing something?

Tom


> Cheers,
> 
> Richard
> 



