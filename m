Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B16C760290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MNIKix022655; Fri, 22 Jan 2016 23:18:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D6DCtMoeohTp; Fri, 22 Jan 2016 23:18:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MNIEPa022651
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 22 Jan 2016 23:18:16 GMT
Message-ID: <1453504694.6378.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 23:18:14 +0000
In-Reply-To: <56A27C8C.8000403@windriver.com>
References: <1453483030.6378.24.camel@linuxfoundation.org>
	<56A27C8C.8000403@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] uninative: Fix conflicts with normal sysroot
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
X-List-Received-Date: Fri, 22 Jan 2016 23:18:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-22 at 13:01 -0600, Mark Hatle wrote:
> On 1/22/16 11:17 AM, Richard Purdie wrote:
> > Currently this code installs into the standard sysroot, however
> > this causes
> > some conflicts when linking since the linker can look specifically
> > for
> > versioned .so files (e.g. like libpthreads.so.0). This breaks
> > builds
> > of util-linux-native for example.
> > 
> > The easiest solution is to install uninative into its own separate
> > sysroot.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta/classes/uninative.bbclass
> > b/meta/classes/uninative.bbclass
> > index fe1e89b..8686159 100644
> > --- a/meta/classes/uninative.bbclass
> > +++ b/meta/classes/uninative.bbclass
> > @@ -1,6 +1,6 @@
> >  NATIVELSBSTRING = "universal"
> >  
> > -UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64',
> > '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2',
> > '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
> > +UNINATIVE_LOADER ?= "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/
> > lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86
> > -64.so.2', 'ld-linux.so.2', d)}"
> 
> Have you considered changing the name of the ld.so for the uninative
> so that
> there is no way it can conflict with the host system.
> 
> This would require a minor patch to the uninative linker/compiler to
> use the new
> name -- and of course above to know it as well.
> 
> This might be a useful safety to prevent the system from every
> falling back to
> the /lib/... version.

The problem wasn't/isn't ld.so. Its that ${STAGING_DIR_NATIVE}/lib/ is
in the linker paths for -native utils and it was picking up random
pieces of the libc from there like libpthread, even though there was
only versioned .so files there, no .so links. It was those that
conflicted with the host system.

The ld.so references are in the interpreter sections of the binaries so
very hard to get confused and I'm not aware of any issue there, nor can
I really envisage one.

So whilst I appreciate the idea, I'm not sure it solves any issue we
have...

Cheers,

Richard

