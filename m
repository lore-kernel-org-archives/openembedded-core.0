Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 71BF273306;
	Sun, 14 Jun 2015 15:43:22 +0000 (UTC)
Received: by iecrd14 with SMTP id rd14so17489108iec.3;
	Sun, 14 Jun 2015 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=nxrbZIpLSpnjckqbCg6xHlc4Uskr+U2m7pxLHdZ/Hnw=;
	b=uBXbIQ2Wo4uxnUqHPrukc9J13Lxc8SVTkotki9NxmPSwOfQ8k2uZyJnPiv3UYxHzF4
	gtduQR1XbjwNHkPL7t3LDc6rXBwumN9LhQr8A3lbVZbXrsiZH5BDBIsEQT+5Ptu7yZBj
	enxJNC+HFDPt+9cxZ4FvqBcCuZAp7riOYPobw3O5/vdKiYMXz6RCX46evMm6H5quPeL7
	Cl905az86R+NkpdhbsJy9n6NC4gw37zfUkfcj7/QBdj48wLTVpBbp9ecMFhxlLlstvff
	fOjHTM5pNd0TwpaHUxJaF/x0WWD77FRRQfKvyNqw+oMCPcHj7LifcOTDxCGTyIuWoJWV
	41ww==
X-Received: by 10.50.43.196 with SMTP id y4mr15662465igl.14.1434296603267;
	Sun, 14 Jun 2015 08:43:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sun, 14 Jun 2015 08:42:52 -0700 (PDT)
In-Reply-To: <1433858847-31079-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1433858847-31079-1-git-send-email-ricardo.ribalda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jun 2015 11:42:52 -0400
Message-ID: <CAMKF1spnp0qX9Fczd8+Y0BOyZ9jDiYnHobyjFe5KU2LtCU=eEg@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] [meta-oe] opencv: Add OpenCV 3.0
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
X-List-Received-Date: Sun, 14 Jun 2015 15:43:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2015 at 10:07 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> -Support for new PACKAGECONFIGS
> -Merge with opencv-samples
>
> Since it is not backward compatible with 2.x and cannot be installed in
> parallel it has a DEFAULT_PREFERENCE of -1.

I would have thought that ABI breakages like this should be parallel
installable to facilitate migration path. Are you sure it can not live
together with opencv2 ?
if it could I would have suggested to call the recipe opencv3_xx.bb

>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.0.bb | 127 +++++++++++++++++++++=
++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recip=
es-support/opencv/opencv_3.0.bb
> new file mode 100644
> index 000000000000..60a96af1fe68
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
> @@ -0,0 +1,127 @@
> +SUMMARY =3D "Opencv : The Open Computer Vision Library"
> +HOMEPAGE =3D "http://opencv.willowgarage.com/wiki/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://include/opencv2/opencv.hpp;endline=3D41;md5=
=3D6d690d8488a6fca7a2c192932466bb14"
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0 oracle-jse-jdk ant"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRCREV_opencv =3D "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
> +SRCREV_contrib =3D "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
> +SRCREV_FORMAT =3D "opencv"
> +SRC_URI =3D "git://github.com/Itseez/opencv.git;nobranch=3D1;name=3Dopen=
cv \
> +          git://github.com/Itseez/opencv_contrib.git;nobranch=3D1;destsu=
ffix=3Dcontrib;name=3Dcontrib"
> +
> +PV =3D "3.0+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE =3D "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_LIBDIR}=
/${PYTHON_DIR}/site-packages/numpy/core/include \
> +                -DOPENCV_EXTRA_MODULES_PATH=3D${WORKDIR}/contrib/modules=
 \
> +                 -DWITH_1394=3DOFF \
> +                 -DCMAKE_SKIP_RPATH=3DON \
> +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENA=
BLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)=
} \
> +                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
> +"
> +
> +PACKAGECONFIG ??=3D "eigen jpeg libav png tiff v4l tbb samples\
> +                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",=
 "", d)}"
> +PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen,=
"
> +PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"
> +PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
> +PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"
> +PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
> +PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
> +PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> +PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper=
,"
> +PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBL=
AS=3DOFF,libclamdblas,"
> +PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=
=3DOFF,libclamdfft,"
> +PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers,"
> +PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DO=
FF,gstreamer1.0 gstreamer1.0-plugins-base,"
> +PACKAGECONFIG[oracle-java-amd64] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}=
/include -DJAVA_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLU=
DE_PATH=3D${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/=
libjawt.so -DJAVA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,or=
acle-jse-jdk ant,"
> +PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMP=
LES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
> +PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"
> +
> +inherit distutils-base pkgconfig cmake
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python"
> +export JAVA_HOME=3D"${STAGING_DIR_TARGET}/usr/share/java/"
> +export ANT_DIR=3D"${STAGING_DIR_TARGET}/usr/share/ant/"
> +
> +TARGET_CC_ARCH +=3D "-I${S}/include "
> +
> +PACKAGES +=3D "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples=
 ${PN}-apps python-opencv"
> +
> +python populate_packages_prepend () {
> +    cv_libdir =3D d.expand('${libdir}')
> +    cv_libdir_dbg =3D d.expand('${libdir}/.debug')
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenC=
V %s development package', extra_depends=3D'${PN}-dev', allow_links=3DTrue)
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenC=
V %s development package', extra_depends=3D'${PN}-dev')
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV=
 %s development package', extra_depends=3D'${PN}-dev')
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV =
%s library', extra_depends=3D'', allow_links=3DTrue)
> +
> +    pn =3D d.getVar('PN', 1)
> +    metapkg =3D  pn + '-dev'
> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> +    blacklist =3D [ metapkg ]
> +    metapkg_rdepends =3D [ ]
> +    packages =3D d.getVar('PACKAGES', 1).split()
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.=
endswith('-dev'):
> +            metapkg_rdepends.append(pkg)
> +    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
> +
> +    blacklist =3D [ metapkg ]
> +    metapkg_rdepends =3D [ ]
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and not =
pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-do=
c') :
> +            metapkg_rdepends.append(pkg)
> +    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
> +
> +}
> +
> +PACKAGES_DYNAMIC +=3D "^libopencv-.*"
> +
> +FILES_${PN} =3D ""
> +FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"
> +FILES_${PN}-dbg +=3D "${libdir}/.debug"
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> +FILES_${PN}-doc =3D "${datadir}/OpenCV/doc"
> +FILES_${PN}-java =3D "${datadir}/OpenCV/java"
> +FILES_${PN}-java-dbg =3D "${datadir}/OpenCV/java/.debug/"
> +FILES_${PN}-samples =3D "${datadir}/OpenCV/samples/"
> +FILES_${PN}-samples-dbg =3D "${datadir}/OpenCV/samples/bin/.debug"
> +
> +INSANE_SKIP_${PN}-apps =3D "staticdev"
> +INSANE_SKIP_${PN}-java =3D "libdir"
> +INSANE_SKIP_${PN}-java-dbg =3D "libdir"
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +
> +INSANE_SKIP_python-opencv =3D "True"
> +SUMMARY_python-opencv =3D "Python bindings to opencv"
> +FILES_python-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> +RDEPENDS_python-opencv =3D "python-core python-numpy"
> +
> +do_install_append() {
> +    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
> +    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> +
> +    # Move Python files into correct library folder (for multilib build)
> +    if [ "$libdir" !=3D "/usr/lib" ]; then
> +        mv ${D}/usr/lib/* ${D}/${libdir}/
> +        rm -rf ${D}/usr/lib
> +    fi
> +
> +    install -d ${D}${datadir}/OpenCV/samples/bin/
> +    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples=
/bin/
> +}
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

