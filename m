Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1UOSKc-0005IA-65
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 14:35:01 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C84D8F811E1; Sat,  6 Apr 2013 06:17:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 640B3F811DC;
	Sat,  6 Apr 2013 06:17:38 -0600 (MDT)
Message-ID: <51601264.7060807@mlbassoc.com>
Date: Sat, 06 Apr 2013 06:17:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Incorrect FILESPATH usages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2013 12:35:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have run across a problem where a main recipe is written in
such a way that makes using .bbappend impossible.  This happens
if the main recipe has an explicit assignment for FILESPATH.
In this case, the .bbappend is unable to add to that path, e.g.
to add a machine specific patch, etc.

I found all of these in the current meta-data:
   gthomas@zeus:/local/poky-cutting-edge$ find meta -type f | grep -v ' ' | xargs grep ^FILESPATH
   meta/classes/base.bbclass:FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
   meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb:FILESPATH = "${FILE_DIRNAME}/linuxdoc-tools-native/"
   meta/recipes-devtools/python/python-pygobject_2.27.91.bb:FILESPATH = "${FILE_DIRNAME}/python-pygobject:${FILE_DIRNAME}/files"
   meta/recipes-devtools/python/python-native_2.7.3.bb:FILESPATH = "${FILE_DIRNAME}/python-native/:${FILE_DIRNAME}/python/"
   meta/recipes-devtools/gcc/gcc-4.7.inc:FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
   meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb:FILESPATH = "${FILE_DIRNAME}/qemu-helper"
   meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb:FILESPATH = "${FILE_DIRNAME}/qemu-helper"
   meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb:FILESPATHPKG =. "squashfs-tools-${PV}:"
   meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb:FILESPATH = "${FILE_DIRNAME}/cdrtools-native/"
   meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb:FILESPATH = "${FILE_DIRNAME}/${PN}/"
   meta/recipes-graphics/clutter/cogl.inc:FILESPATH = "${FILE_DIRNAME}/cogl"
   meta/recipes-graphics/clutter/clutter-gst.inc:FILESPATH = "${FILE_DIRNAME}/clutter-gst"
   meta/recipes-graphics/clutter/clutter.inc:FILESPATH = "${FILE_DIRNAME}/clutter"
   meta/recipes-graphics/clutter/clutter-gtk.inc:FILESPATH = "${FILE_DIRNAME}/clutter-gtk"
   meta/recipes-graphics/xorg-lib/libx11.inc:FILESPATH = "${FILE_DIRNAME}/libx11"
   meta/recipes-bsp/x-load/x-load_git.bb:FILESPATH = "${FILE_DIRNAME}/x-load-git/${MACHINE}:${FILE_DIRNAME}/x-load-git/"
   meta/recipes-bsp/u-boot/u-boot.inc:FILESPATH =. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
   meta/recipes-support/libpcre/libpcre_8.32.bb:FILESPATH .= ":${@base_set_filespath([bb.which(BBPATH, 'recipes-support/libpcre/files', direction=True)], d)}"
   meta/recipes-core/dbus/dbus-ptest_1.6.8.bb:FILESPATH = "${FILE_DIRNAME}/dbus-${PV}"
   meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb:FILESPATH = "${FILE_DIRNAME}/${PN}-${PV}/"
   meta/recipes-core/eglibc/eglibc_2.17.bb:FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' 
], d)}"
   meta/recipes-core/eglibc/cross-localedef-native_2.17.bb:FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
   meta/recipes-core/uclibc/uclibc-git.inc:FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
   meta/recipes-kernel/systemtap/systemtap_git.inc:FILESPATH = "${FILE_DIRNAME}/systemtap"
   meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb:FILESPATH = "${FILE_DIRNAME}/trace-cmd"
   meta/recipes-multimedia/gstreamer/gst-plugins.inc:FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"

In my case, I wanted to write recipes-devtools/python/python-pygobject_2.27.91.bbappend
to add a patch I'm working on here.  The only way I could get my .bbappend file to
function was to remove the FILESPATH assignment from the main recipe.

I believe that most of these assignments are incorrect and should be removed.
I can send a patch for the one that I've built & tested, but I'm not sure I
should be mucking about with all the others...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


