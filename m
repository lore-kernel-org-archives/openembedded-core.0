Received: from ocean.emcraft.com ([213.221.7.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dima_ch@emcraft.com>) id 1RO6Y3-0000Jm-I3
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 12:42:31 +0100
Received: from vladimir.emcraft.com ([172.17.0.253])
	by ocean.emcraft.com with esmtp (Exim 4.76)
	(envelope-from <dima_ch@emcraft.com>)
	id 1RO6S1-00070I-FP; Wed, 09 Nov 2011 14:36:17 +0300
From: Dmitry Cherukhin <dima_ch@emcraft.com>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4EB97190.1060107@linux.intel.com>
References: <135de91f015deb0c4e3c3d01d83963fc20ecc5f7>
	<1320758932-4181-1-git-send-email-dima_ch@emcraft.com>
	<4EB97190.1060107@linux.intel.com>
Organization: Emcraft Systems
Date: Wed, 09 Nov 2011 15:36:17 +0400
Message-ID: <1320838577.3601.107.camel@vladimir.emcraft.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-1.fc12) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt-mobility: qa_configure stage failed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: dima_ch@emcraft.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 09 Nov 2011 11:42:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Saul,

> Even with this patch, I am still seeing Host Contamination issue with 
> all the QtMobility recipes.
> 

I performed git pull and then rebuilt all packages. Both qt-mobility
recipes built successfully. Do you mean that your build is still failed,
or the build is not failed but there are some warnings? If the build is
failed, then could you please provide the file
.../tmp/work/armv5te-poky-linux-gnueabi/qt-mobility-embedded-1.2.0-r0/qt-mobility-opensource-src-1.2.0/config.log ?

Dima

> Sau!
> 
> > Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> > ---
> >   .../qt4/files/qt-mobility-configure.patch          |   17 +++++++++++++++++
> >   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 ++-
> >   2 files changed, 19 insertions(+), 1 deletions(-)
> >   create mode 100644 meta/recipes-qt/qt4/files/qt-mobility-configure.patch
> >
> > diff --git a/meta/recipes-qt/qt4/files/qt-mobility-configure.patch b/meta/recipes-qt/qt4/files/qt-mobility-configure.patch
> > new file mode 100644
> > index 0000000..d61ec03
> > --- /dev/null
> > +++ b/meta/recipes-qt/qt4/files/qt-mobility-configure.patch
> > @@ -0,0 +1,17 @@
> > +When building qt-mobility, the qa_configure stage failed because the catalogue /usr/lib
> > +is used in some Makefiles within configure tests. We manually removed this catalogue.
> > +
> > +Upstream-Status: Inappropriate [embedded]
> > +Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> > +
> > +--- qt-mobility-opensource-src-1.2.0/configure.orig	2011-05-10 10:06:01.000000000 +0200
> > ++++ qt-mobility-opensource-src-1.2.0/configure	2011-11-08 12:34:56.347645968 +0100
> > +@@ -583,6 +583,8 @@
> > +     fi
> > +
> > +     $QMAKE_EXEC $QMKSPEC "$relpath/config.tests/$2/$2.pro" 2>>  "$CONFIG_LOG">>  "$CONFIG_LOG"
> > ++    cp Makefile Makefile.old
> > ++    sed -e 's@-L/usr/lib@@'<Makefile.old>Makefile
> > +     printf  " ."
> > +     "$MAKE" clean>>  "$CONFIG_LOG"
> > +     printf "."
> > diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> > index f665e64..11aad8b 100644
> > --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> > +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> > @@ -5,7 +5,8 @@ LICENSE = "LGPLv2.1"
> >   LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
> >   		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
> >
> > -SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz "
> > +SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
> > +	   file://qt-mobility-configure.patch "
> >
> >   SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
> >   SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"




