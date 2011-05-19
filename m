Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN1La-0005NW-El for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:24:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBLxBP007355;
	Thu, 19 May 2011 12:21:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06869-09; Thu, 19 May 2011 12:21:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBLp3i007349
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 May 2011 12:21:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1305801068.18415.179.camel@lenovo.internal.reciva.com>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
Date: Thu, 19 May 2011 12:21:49 +0100
Message-ID: <1305804109.3424.475.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Thu, 19 May 2011 11:24:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 11:31 +0100, Phil Blundell wrote:
> On Thu, 2011-05-19 at 11:15 +0100, Richard Purdie wrote:
> > We have postinstalls that require to run on the target device. If
> > they're present, we need opkg there to run them, or at least some kind
> > of script to handle that and I think both cases have a requirement on
> > that directory (the rpm backend has a suitable script).
> > 
> > So the current patches which just don't create it don't really address
> > the problem. At the very least the image generation should error if
> > these types of postinstall are present which I guess is my real concern.
> 
> Ah, I see what you mean now.  Yes, it is true that packages which expect
> to get their postinst run on the target will lose in this case.  But,
> practically speaking, this is not likely to be too much of a limitation:
> devices which have O_P_M=none tend to be the same ones that have their
> root filesystem on readonly media, so running postinsts on the target is
> likely to be futile anyway.  (Also, O_P_M=none targets will generally
> not install opkg in their rootfs in any case.)
>
> I agree it would be a good thing for the build to emit an error in this
> case rather than just causing the postinsts to silently not run.  I
> guess the ideal way of dealing with this would be:
> 
> a) introduce a new variable, TARGET_FILESYSTEM_READONLY or some such,
> and make it an error for there to be any packages left in "install ok
> unpacked" at the end of rootfs construction if this flag is set;
> 
> b) for the case where O_P_M="none" but T_F_R is not set, provide an
> additional postprocessor to distill the opkg status file down to just
> the bits that are needed for postinst running, and also provide some
> lightweight script to run the postinsts and then clean up afterwards.

Agreed. I'd like to raise one other issue which is the number of
variables we need to control these things which are effectively binary
flags. I'm leaning towards having a small number of variables containing
flags which trigger certain behaviours. In this case the obvious choices
would be:

IMAGE_FEATURES = "readonly nopackagemanager"

but there are other things which make sense as DISTRO_FEATURES (e.g.
nox11) or MACHINE_FEATURES.

We have these variables and I know Chris has some patches submitted to
improve our handling of such variables. I'm coming down in favour of
extending these into some of these use cases too though.

Thoughts?

Cheers,

Richard




