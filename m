Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj7bG-0005zb-L3 for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 12:04:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06AvJMf019427
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 10:57:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18968-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 10:57:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06AvDNT019421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 10:57:14 GMT
Message-ID: <1325847433.20759.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 10:57:13 +0000
In-Reply-To: <CAAQYJAtV9moez4thDcRtbm_0w=b+F_q2ag344PiUytRe_g-ysg@mail.gmail.com>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com> <4F03982D.1080601@linux.intel.com>
	<CAAQYJAtWXeBqnf5OPWE4bpo87Uo454X8qDE7C_QEL7Pu3_k+_w@mail.gmail.com>
	<CAAQYJAvu-n9eyXV8kj3=34_wzhdfec5Nit9uUy_ar=jFK1tFaQ@mail.gmail.com>
	<1325766615.20759.67.camel@ted> <4F0633EB.9030708@linux.intel.com>
	<CAAQYJAtV9moez4thDcRtbm_0w=b+F_q2ag344PiUytRe_g-ysg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jan 2012 11:04:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 02:00 +0100, Andrea Adami wrote:
> On Fri, Jan 6, 2012 at 12:36 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> >
> >
> > On 01/05/2012 04:30 AM, Richard Purdie wrote:
> >> On Thu, 2012-01-05 at 01:05 +0100, Andrea Adami wrote:
> >>> I'd say we have to test for the in-existence of the file instead of
> >>> blindly touching it.
> >>> Smthg like
> >>>
> >>> if [! -e ${IMAGE_ROOTFS}/init]; then
> >>> touch ${IMAGE_ROOTFS}/init
> >>> fi
> >
> > Why? Touch creates it if it doesn't exist and updates the modtime if it
> > does. It doesn't modify the content of the file if it exists. What is
> > the motivation for testing for it's existence?
> >
> touch fails with Permission denied because one package in my rootfs
> already created the symlink
> 
> >>>
> >>>
> >>> Now, repeating that block for all 4 cpio images is a bit ugly... better ideas?
> >>
> >> Make it a shell function we call? I'd also check for
> >> ${base_sbindir}/init first too?
> >
> > Why check for that? So we can link to it instead of creating an empty file?
> 
> Nonsense, kernel looks for /init
> ( http://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt
> )

Yes, please ignore my comment about /sbin/init, I'm misremembering
something. We should deal with the symlink case though.

Cheers,

Richard



