Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 48E956B89F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 12:55:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Feb 2014 04:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,523,1389772800"; d="scan'208";a="486113281"
Received: from akdissan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.31])
	by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2014 04:55:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, Saul Wold <sgw@linux.intel.com>
Date: Sat, 22 Feb 2014 12:55:26 +0000
Message-ID: <2119167.FSmXca6tad@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <42DC4075-3C8F-4D01-AFDB-82AD3357C709@gmail.com>
References: <1392929845-23411-1-git-send-email-sgw@linux.intel.com>
	<42DC4075-3C8F-4D01-AFDB-82AD3357C709@gmail.com>
MIME-Version: 1.0
Cc: scott.garman@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu: Ensure ROOTFS path is absolute
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
X-List-Received-Date: Sat, 22 Feb 2014 12:55:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 21 February 2014 21:57:37 Khem Raj wrote:
> On Feb 20, 2014, at 12:57 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > There is a problem if a relative path is passed to the kernel for NFS
> > usage
> > that it will not correctly find it, so ensure that the ROOTFS path is
> > absolute.
> > 
> > [YOCTO #2807]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > scripts/runqemu | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index 0db7ad6..57c5de4 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -462,7 +462,9 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
> > 
> >         error "Unable to determine default rootfs for MACHINE [$MACHINE]"
> >     
> >     fi
> > 
> > fi
> > -# ROOTFS is now set for all cases
> > +# ROOTFS is now set for all cases, now expand it to be an absolute path,
> > it should exist at this point +
> > +ROOTFS=`realpath $ROOTFS`
> 
> I think this change also means we need to add dependency on realpath package
> as prerequisite for build host.

realpath is part of coreutils. Another alternative would be readlink -f (but 
that also appears to be part of coreutils.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

