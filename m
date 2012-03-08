Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5kgr-000810-AI for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 22:16:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28L7M1P031245
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 21:07:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31167-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 21:07:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28L7C5Q031239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 21:07:15 GMT
Message-ID: <1331240831.3006.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 13:07:11 -0800
In-Reply-To: <4F58EEDF.70101@windriver.com>
References: <cover.1331107546.git.dvhart@linux.intel.com>
	<83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
	<AE0C8B23-EB0D-4DD3-9BF9-22BAEB66969F@dominion.thruhere.net>
	<4F579506.90805@linux.intel.com> <4F58EEDF.70101@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] kernel.bbclass: Remove warnings for modutils and modprobe.d
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
X-List-Received-Date: Thu, 08 Mar 2012 21:16:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-08 at 11:39 -0600, Mark Hatle wrote:
> On 3/7/12 11:04 AM, Darren Hart wrote:
> >
> >
> > On 03/07/2012 12:21 AM, Koen Kooi wrote:
> >>
> >> Op 7 mrt. 2012, om 09:06 heeft Darren Hart het volgende geschreven:
> >>
> >>> Fixes [Yocto #2036]
> >>>
> >>> The source and build directories are unused, remove them.
> >>>
> >>> The modutils and modprobe.d directories may be used if modules are built that
> >>> are either autoloaded or have modprobe.d entries. This isn't known at install
> >>> time, so check after the package split if these directories are empty and
> >>> remove them if they are.
> >>>
> >>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> >>> CC: Paul Eggleton<paul.eggleton@linux.intel.com>
> >>> ---
> >>> meta/classes/kernel.bbclass |   10 ++++++++++
> >>> 1 files changed, 10 insertions(+), 0 deletions(-)
> >>>
> >>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >>> index 8fbec90..169df33 100644
> >>> --- a/meta/classes/kernel.bbclass
> >>> +++ b/meta/classes/kernel.bbclass
> >>> @@ -105,6 +105,8 @@ kernel_do_install() {
> >>> 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
> >>> 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
> >>> 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
> >>> +		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
> >>> +		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> >>
> >> How do you want to support on-target building of exernal modules?
> >
> > That is an open issue that needs to be addressed, but we don't install
> > the build or source directories now (unless I'm missing something), so
> > these are links to nowhere at the moment.
> >
> > We do have a bug open to support on-target module building. I supect
> > we'll need to add these as part of a headers package or similar. So
> > these may come back.
> >
> 
> Just as a note..  headers package(s) are the wrong way to support kernel modules 
> compilation on the target.  You really need to supply a configured kernel source 
> tree --- often you can dump the .c files though.  Kernel headers (for module 
> compilation) and userspace are often intentionally different.. and people get 
> this confused often.  (I can't express how often I've had to convince someone 
> that, no you can't guaranty a working kernel module from the stuff in /usr/include!)
> 
> The right approach is to provide, as part of the kernel itself, a source 
> tree/headers package tha installes into the 
> "{D}/lib/modules/${KERNEL_VERSION}/source" (or similar) directory, and instruct 
> people to use that location when building kernel modules on the target.

We already provide such a source tree for external module compilation
within the build itself. There is also an open bug to provide the same
tree for on-target use so I think we have a good plan which is
consistent with the above. For now I really want to clean up the warning
messages. We can add correct symlinks once we have on target support so
I've taken Darren's patch.

Cheers,

Richard



