Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1S9vQW-0008Um-6O
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 10:32:25 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Tue, 20 Mar 2012 17:23:24 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Tue, 20 Mar 2012
	17:23:16 +0800
Message-ID: <1332235259.1041.92.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: <mark.hatle@windriver.com>
Date: Tue, 20 Mar 2012 17:20:59 +0800
In-Reply-To: <4F635E14.7000707@windriver.com>
References: <1331799506.1041.55.camel@localhost.localdomain>
	<4F621801.4000308@windriver.com>
	<1331875115.1041.67.camel@localhost.localdomain>
	<4F635E14.7000707@windriver.com>
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: LSB support?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 20 Mar 2012 09:32:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I do a clean building with the same error. I have not touched the
specific glibc version.

as I said, the do_compile should use the libXrandr in build_sysroot
directory, but it used it in host system. and I have checked that, there
IS the lib in build_sysroot directory.

you can build it successfully, only because your host's lib is using
glibc 2.13, but I'm using archlinux, all package is the newest.

the gconf used host's libXrandr, but want check its dependency in
build_sysroot, that is the reason, MAYBE.

I will do a clean building again, and I don't think it will change
anything.

On Fri, 2012-03-16 at 23:36 +0800, Mark Hatle wrote:
> On 3/16/12 12:18 AM, Ni Qingliang wrote:
> > when building qemux86-64 arch core-image-lsb (distro is poky-lsb), I got
> > /usr/lib/../lib/libXrandr.so.2: undefined reference to
> > `memcpy@GLIBC_2.14' when 'do_compile' gconf 3.2.3.
> >
> > the default eglibc is 2.13, why it needs 2.14?
> 
> Without anything further, the only guess I can make is that either you aren't
> using the version of glibc you think you are, it's gotten some host
> contamination, an explicit reference was added to libXrandr (doubtful), or you
> are using something that was built/cached from a previous build.  (i.e. did you
> build w/ eglibc 2.14/2.15 -- and then switch back to eglibc 2.13 for some reason?)
> 
> On 3/15/12 9:38 PM, Ni Qingliang wrote:
>  > first, thanks your reply.
>  >
>  > Because I can't use task-core-lsb on my device (flash space is not
>  > enough), I have to make a custom lsb-base image (without
>  > perl/python/graphics).
>  >
>  > I have checked the "linuxstdbase", and it will change the configure
>  > option of some packages.
>  >
>  > Indeed, I think the daemon/failure/warning fuctions should be considered
>  > in package lsb's RDEPENDS.
>  >
>  > what I want to know is the rdepends or where is the
>  > daemon/failure/warning.
> 
> It certainly looks like a component is missing somewhere in the shell scrips
> that are provided by the LSB functions.  I would assume that the
> depends/provides is setup properly to point to whatever should be providing the
> missing daemon, failure, warning commands.  If it's not (or if by default -- non
> lsb mode) they're not being built, it's a definite bug.  You shouldn't be able
> to build a non-functional systems.
> 
> Please file a defect on bugzilla.yoctoproject.org.  I will attempt to
> investigate it (or someone else can).  Hopefully it's just as a simple as a
> missing dependency.
> 
> --Mark
> 
> > On Fri, 2012-03-16 at 00:25 +0800, Mark Hatle wrote:
> >> On 3/15/12 3:18 AM, Ni Qingliang wrote:
> >>> Hello, I'm working on custom lsb-base image using oe-core.
> >>>
> >>> and when using the lsb script, found error:
> >>>
> >>> lsb_start_daemon line 44: daemon command not found.
> >>>
> >>> similar thing happend on lsb_log_message: failure and warning command
> >>> not found.
> >>>
> >>> maybe these function should be defined in /etc/init.d/functions?
> >>>
> >>> but there are not these function in this file (belongs to initscripts).
> >>
> >> Did you enable the LSB distribution settings?  Without this, various components
> >> may not be available.
> >>
> >> In Poky, there is a "poky-lsb" distribution type:
> >>
> >> DISTRO = "poky-lsb"
> >> DISTROOVERRIDES = "poky:linuxstdbase"
> >>
> >> DISTRO_FEATURES_append = " pam largefile opengl"
> >> PREFERRED_PROVIDER_virtual/libx11 = "libx11"
> >>
> >> (as well as using the core-image-lsb and/or task-core-lsb components.)
> >>
> >> If you've tried this and those items are still broken, let me know and I can
> >> help investigate further.  (One final note, only LSB 1.4 is currently supported.)
> >>
> >> --Mark
> >>
> >>> Any idea?
> >>>
> >>> thanks!
> >>>
> >>>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



