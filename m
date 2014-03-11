Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2B48E6F768
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 05:07:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2B578pL012437; Tue, 11 Mar 2014 05:07:09 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 88ZO6yZqZ1YK; Tue, 11 Mar 2014 05:07:08 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2B570rc012422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 11 Mar 2014 05:07:04 GMT
Message-ID: <1394514414.19455.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Zanussi <tom.zanussi@intel.com>
Date: Mon, 10 Mar 2014 22:06:54 -0700
In-Reply-To: <1394496310.1279.25.camel@empanada>
References: <1394317437-6551-1-git-send-email-joaohf@gmail.com>
	<1394413459.7883.23.camel@ted> <1394496310.1279.25.camel@empanada>
X-Mailer: Evolution 3.8.4-0ubuntu1 
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
X-List-Received-Date: Tue, 11 Mar 2014 05:07:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2014-03-10 at 19:05 -0500, Tom Zanussi wrote:
> On Sun, 2014-03-09 at 18:04 -0700, Richard Purdie wrote:
> > On Sat, 2014-03-08 at 19:23 -0300, João Henrique Ferreira de Freitas
> > wrote:
> > > OE-core commit f3a95ca6886b55e5819b068bdbd2cceb882d91a6 removed the
> > > populate-extfs.sh. So mke2fs should be used to create ext2/3/4 image.
> > > 
> > > Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
> > > ---
> > >  scripts/lib/mic/kickstart/custom_commands/partition.py | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > index 91d751e..e0a82f5 100644
> > > --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > > @@ -174,7 +174,6 @@ class Wic_PartData(Mic_PartData):
> > >          """
> > >          Prepare content for an ext2/3/4 rootfs partition.
> > >          """
> > > -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
> > >  
> > >          image_rootfs = rootfs_dir
> > >          rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
> > > @@ -199,11 +198,10 @@ class Wic_PartData(Mic_PartData):
> > >  
> > >          extra_imagecmd = "-i 8192"
> > >  
> > > -        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, rootfs)
> > > +        mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
> > > +            (self.fstype, extra_imagecmd, rootfs, image_rootfs)
> > >          rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
> > >  
> > > -        populate_cmd = populate_script + " " + image_rootfs + " " + rootfs
> > > -        rc, out = exec_native_cmd(pseudo + populate_cmd, native_sysroot)
> > >  
> > >          # get the rootfs size in the right units for kickstart (Mb)
> > >          du_cmd = "du -Lbms %s" % rootfs
> > 
> > Don't we need to be careful to find the binary from the native sysroot
> > here since that is the one with the root directory option?
> > 
> 
> Hmm, exec_native_cmd(mkfs_cmd, native_sysroot) is being used to do the
> 'mke2fs -d', which should do the right thing... Am I missing something?

I hadn't realised that the exec_native_cmd took care of resolving the
prefix for you. The populate_script had a prefix because its used with
pseudo (I'd thought it was so it found the right command). 

That does raise another question though, how does this work now pseudo
isn't used?

Cheers,

Richard


