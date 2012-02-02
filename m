Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RsvIq-0007Rq-IB
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 12:58:12 +0100
Received: by wibhq7 with SMTP id hq7so1804914wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 03:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=uKpxTCoeKNfE7FKpr+f2lzX91hO8pfQ7CUtZfd+Ritk=;
	b=Hp90b4GD5nX3adCZeESp+8FOPEq46JMxleC1S0oaP8Y0V4NiYie3w9dPJBpaoPoL0+
	yFZ/vk49LSMetC/zI4jtvsIsw2zyxVaVS4LLbWgDy1Oy8z28RzUoyq7RoLwSvwoui3LD
	i8ZVYN0Tl2PX0OeFHHX/ZS+ssokAVtvBxk5CM=
MIME-Version: 1.0
Received: by 10.181.11.227 with SMTP id el3mr3971055wid.18.1328183416296; Thu,
	02 Feb 2012 03:50:16 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Thu, 2 Feb 2012 03:50:16 -0800 (PST)
Date: Thu, 2 Feb 2012 12:50:16 +0100
Message-ID: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 02 Feb 2012 11:58:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

for some time now I've been working on a port of Plasma Active, the
next generation touch user interface from KDE.
If you never heard about Plasma Active see [1].
For touch devices it is much more satisfying to use a GUI that is
designed for this input method, so I started porting it.
Someone already built Plasma Active for the Pandaboard [2] but it was
compiled native on the device, but somehow this inspired me to start
this project.

The work in progress can be viewed in the repository on github [3].
First of, if anyone does similar work or just likes to participate -
feel free to contact me.


Current Status (may change every minute)
Kdelibs is working, plasma active misses the path to kconfig_compiler
but won't accept a CMake variable (patching the CMake file could solve
this).
Other native dependencies are also working (things like automoc).
The program kde4-config is taken from the host, but could (should) be
replaced with a dummy script, as it only returns some (invalid) values
like prefix ,exec_prefix, qt_bindir and some other paths.


Current problems:
There were some problems along the way, but as of now the most have
been solved or worked around.
If anyone could give a hint how the problems could be solved more
gracefully, then it could happen that we have Plasma Active soon :)

After testing a bit, if QT_INCLUDE_DIR is set to OE_QMAKE_INCDIR_QT it
may work on cross compiling environments, however some times errors
like this occur (PARALLEL_MAKE=""):
-
arm-angstrom-linux-gnueabi-g++  ....
-I/work/oe-core/tmp-eglibc/sysroots/overo/usr/include/QtCore ....
AuthBackend.h:24:19: fatal error: QObject: No such file or directory
-
But inside of /work/oe-core/tmp-eglibc/sysroots/overo/usr/include/QtCore
there is QObject and QObject.h ...

In CMake, setting CMAKE_MODULEPATH won't change the module search path.
Variables don't overwrite the set module path, so
-DCMAKE_MODULEPATH=${SOMEPATH} won't work.
As workaround the recipe generates it's own toolchain file after
CMake, is there any way to overwrite the function
"cmake_do_generate_toolchain_file()" in my recipe?
(Addig a do_generate_toolchain_file() function to my recipe won't do anything)

Like posted before, OE_QMAKE_INCDIR_QT won't work if compiling native
as Qt4-native is handled differently from Qt4x11.
This is also worked around by creating a custom CMake toolchain file
with QT_INCLUDE_DIR=${STAGING_INCDIR}/Qt ${STAGING_INCDIR}/QtCore ...

There are other CMake configure pitfalls (all cross compiling scripts
in kdelibs are commented out) but it seems that at least the most of
them showed already during build time.

One of the remaining things that still bug me is kde4-config,
personally I wonder why the KDE folks use a executable to get the
prefix / exec_prefix and the like where a script could be used?


Current WIP:
KActivities
KDE-Workspace
KDE-Runtime


For the RFC part:
It would really help if anyone could look over the recipes and point
up where it can be improved.
If you want to build it, please note that kdelibs-dev should be
installed as until now the native kde-config is used.
For the patches to the CMake files it would help to point out errors
or easier ways to accomplish the intended goals.


[1] Mobile Plasma Active desktop: http://plasma-active.org/
[2] Building Plasma Active on the Pandaboard:
http://ezjd.blogspot.com/2011/10/building-plasma-active.html
[3] "meta-kde" repository:
https://gitorious.org/openembedded-core-layers/meta-kde

-- 
Regards
Samuel


