Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S16AO-0007G9-U4 for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 02:11:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1P12suC015899
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 01:02:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14946-09 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 01:02:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1P12lVT015893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 01:02:48 GMT
Message-ID: <1330131768.13788.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2012 01:02:48 +0000
In-Reply-To: <20120225000546.GO3769@jama.jama.net>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
	<1329992873.32110.58.camel@ted> <20120225000546.GO3769@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/4] gdb-cross-canadian: use NATIVESDK paths as it happens to be here
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
X-List-Received-Date: Sat, 25 Feb 2012 01:11:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-02-25 at 01:05 +0100, Martin Jansa wrote:
> On Thu, Feb 23, 2012 at 10:27:53AM +0000, Richard Purdie wrote:
> > On Mon, 2012-02-13 at 16:40 +0100, Martin Jansa wrote:
> > > * seems like config/config in -L was also wrong
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   10 ++++++++--
> > >  1 files changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > index b5746ce..bac63b7 100644
> > > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > @@ -10,12 +10,18 @@ RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
> > >  
> > >  EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
> > >  
> > > +NATIVESDK_NAME = "oecore-${SDK_ARCH}-${SDK_ARCH}"
> > > +NATIVESDK_PATH = "/usr/local/${NATIVESDK_NAME}"
> > > +NATIVESDK_PATHNATIVE = "${NATIVESDK_PATH}/sysroots/${SDK_SYS}"
> > > +NATIVESDK_LIBDIR = "${NATIVESDK_PATHNATIVE}${libdir_nativesdk}"
> > > +NATIVESDK_INCLUDEDIR = "${NATIVESDK_PATHNATIVE}${includedir_nativesdk}"
> > > +
> > >  do_configure_prepend() {
> > >  cat > ${WORKDIR}/python << EOF
> > >  #! /bin/sh
> > >  case "\$2" in
> > > -        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
> > > -        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> > > +        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_INCLUDEDIR}/python${PYTHON_BASEVERSION}/" ;;
> > > +        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_LIBDIR}/python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> > >          --exec-prefix) echo "/usr" ;;
> > >          *) exit 1 ;;
> > >  esac
> > 
> > I made some experiments with "bitbake gdb-cross-canadian-x86-64 -e" and
> > it seems to me that:
> > 
> >        --includes) echo "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}/" ;;
> >        --ldflags) echo "-L${STAGING_LIBDIR}/../python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> > 
> > should work ok here?
> 
> No it's not the same.
> 
> With default oe-core settings it behaves like this:
> 
> python-nativesdk is staged in the same directory for all 3 MACHINEs I
> was using for test (qemuarm, qemux86, qemux86-64)
> 
> SDKMACHINE=i686:   SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/
> SDKMACHINE=x86-64: SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux
> 
> while STAGING_INCDIR is different for each machine
> SDKMACHINE=i686:
>   STAGING_LIBDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-i586/sysroots/i686-oesdk-linux/usr/lib/i586-oe-linux"
>   STAGING_LIBDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-x86_64/sysroots/i686-oesdk-linux/usr/lib/x86_64-oe-linux"
>   STAGING_LIBDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-arm/sysroots/i686-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"
> SDKMACHINE=x86-64:
>   STAGING_LIBDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-i586/sysroots/x86_64-oesdk-linux/usr/lib/i586-oe-linux"
>   STAGING_LIBDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux"
>   STAGING_LIBDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"
> 
> notice that not only SDK_NAME tripple is changing
> SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
> so we keep it the same across all MACHINES with:
> NATIVESDK_SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${SDK_ARCH}"
> 
> but also toplevel SYSROOT is different
> i686-nativesdk-oesdk-linux
> i686-oesdk-linux-nativesdk
> and
> x86_64-nativesdk-oesdk-linux
> x86_64-oesdk-linux-nativesdk
> 
> So nativesdk staging is broken and python-nativesdk should be staged
> separately for each SDK_ARCH/TARGET_ARCH combination or we need those
> NATIVESDK_SDK_NAME variables for cross-canadian -> nativesdk deps.

All becomes clear now. 

I seem to remember strongly disagreeing with:

SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
SDKPATH = "/usr/local/${SDK_NAME}"

that is in bitbake.conf but probably wasn't able to articulate why at
the time. You'll note that poky.conf does:

SDK_VERSION := "${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot')}"
SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"

so the SDKPATH is not dependent on TARGET_ARCH. It doesn't need to
depend on SDK_ARCH either although that is not the problematic part
here.

If you think about what is happening, bitbake will reuse the sstate
files for each nativesdk, they are meant to be equivalent for each
SDKMACHINE. If you hardcode TARGET_ARCH into the path, they are not.

So I'd say that SDKPATH containing SDK_NAME is clearly bogus and
TARGET_ARCH needs to be removed in somehow at the very least. Fix that
and your problems should go away. The patches you're sending don't fix
the root problem though.

Cheers,

Richard



