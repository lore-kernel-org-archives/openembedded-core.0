Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 06F3073D53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 07:16:15 +0000 (UTC)
Received: by wizk4 with SMTP id k4so128074509wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:reply-to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=zhi/XWcHr8kQncl8Bn5fyFnRyUl7RP8LCxiFKoLhzT0=;
	b=jNN4pC4dUmGxTfwXVgLAgCQgOOIlBLVAATHprrUURE2q+L1yUAVQVHoA5GwMdHHryI
	Az4fxBZVGauB/mZg5qA3/eij/EmNvF19/davRu+Pl77JJmtsKeHZixZis9RonAdI3PM1
	M9ntEWx2uHamwDlr0fbXC62Mf0Wb8wPf1IFa0+TJzKgjnjisYmZ+aEhVvGyln7Yj8YoB
	v0b08+3D6Lf2WtjusSQfosh0kHmJ9VywSGQCoE6sDldx21RzfnDS23Mw3x2TncIkNx1W
	Y6L2kZwuoFlwvwiqN/vyRi0nNEbzUjVDd3xYNX824IXs5SxC+aOci2eFciNoWs6T/Ixn
	eOgw==
X-Received: by 10.180.14.67 with SMTP id n3mr26544990wic.92.1430205376351;
	Tue, 28 Apr 2015 00:16:16 -0700 (PDT)
Received: from chl500346.localnet (mail.neratec.com. [46.140.151.2])
	by mx.google.com with ESMTPSA id js3sm32687780wjc.5.2015.04.28.00.16.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 00:16:15 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 09:16:14 +0200
Message-ID: <10219056.VACbEekqmg@chl500346>
Organization: Privat
User-Agent: KMail/4.14.6 (Linux/3.19.0-15-generic; KDE/4.14.6; x86_64; ; )
In-Reply-To: <20150427233642.GB3687@piout.net>
References: <1430177347-15550-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20150427233642.GB3687@piout.net>
MIME-Version: 1.0
Subject: Re: [PATCH] wic: remove intermediate partitions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: adrian.freihofer@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Apr 2015 07:16:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Is there a reason to write "exec_cmd("rm -f %s" % rootfs)" instead of using python functions such as os.remove(), os.rmdir() or shutil.rmtree()?
I know, there are a lot of similar lines in the existing code...

On Tuesday 28 April 2015 01.36:42 Alexandre Belloni wrote:
> Hi,
> 
> On 28/04/2015 at 01:29:07 +0200, Alexandre Belloni wrote :
> > Remove intermediate partitions that may have been created by a previous
> > wic invocation. Those partitions are causing issues on some systems. In
> > particular vfat partition creation is hanging on mcopy execution on
> > Fedora.
> > 
> 
> I forgot to add that this fixes #7573.
> 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  scripts/lib/wic/kickstart/custom_commands/partition.py | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
> > index ff906010b8bf..b228b0d73902 100644
> > --- a/scripts/lib/wic/kickstart/custom_commands/partition.py
> > +++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
> > @@ -230,6 +230,7 @@ class Wic_PartData(Mic_PartData):
> >          image_rootfs = rootfs_dir
> >          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
> >  
> > +        exec_cmd("rm -f %s" % rootfs)
> >          du_cmd = "du -ks %s" % image_rootfs
> >          out = exec_cmd(du_cmd)
> >          actual_rootfs_size = int(out.split()[0])
> > @@ -281,6 +282,7 @@ class Wic_PartData(Mic_PartData):
> >          image_rootfs = rootfs_dir
> >          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
> >  
> > +        exec_cmd("rm -f %s" % rootfs)
> >          du_cmd = "du -ks %s" % image_rootfs
> >          out = exec_cmd(du_cmd)
> >          actual_rootfs_size = int(out.split()[0])
> > @@ -325,6 +327,7 @@ class Wic_PartData(Mic_PartData):
> >          image_rootfs = rootfs_dir
> >          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
> >  
> > +        exec_cmd("rm -f %s" % rootfs)
> >          du_cmd = "du -bks %s" % image_rootfs
> >          out = exec_cmd(du_cmd)
> >          blocks = int(out.split()[0])
> > @@ -377,6 +380,7 @@ class Wic_PartData(Mic_PartData):
> >          image_rootfs = rootfs_dir
> >          rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
> >  
> > +        exec_cmd("rm -f %s" % rootfs)
> >          squashfs_cmd = "mksquashfs %s %s -noappend" % \
> >                         (image_rootfs, rootfs)
> >          exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
> > @@ -415,6 +419,7 @@ class Wic_PartData(Mic_PartData):
> >          """
> >          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> >  
> > +        exec_cmd("rm -f %s" % fs)
> >          dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
> >              (fs, self.size)
> >          exec_cmd(dd_cmd)
> > @@ -442,6 +447,7 @@ class Wic_PartData(Mic_PartData):
> >          """
> >          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> >  
> > +        exec_cmd("rm -f %s" % fs)
> >          dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
> >              (fs, self.size)
> >          exec_cmd(dd_cmd)
> > @@ -466,6 +472,7 @@ class Wic_PartData(Mic_PartData):
> >          Prepare an empty vfat partition.
> >          """
> >          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> > +        exec_cmd("rm -f %s" % fs)
> >  
> >          blocks = self.size
> >  
> > @@ -492,6 +499,7 @@ class Wic_PartData(Mic_PartData):
> >                        "Proceeding as requested." % self.mountpoint)
> >  
> >          fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> > +        exec_cmd("rm -f %s" % fs)
> >  
> >          # it is not possible to create a squashfs without source data,
> >          # thus prepare an empty temp dir that is used as source
> 
> 


