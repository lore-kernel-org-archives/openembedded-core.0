Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R2KLJ-0001Ix-1Y for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 11:59:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8AA0DmB013484 for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 11:00:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iWvtSYy76d7a
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 11:00:13 +0100 (BST)
Received: from [192.168.1.43] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8AA07em013441
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 11:00:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315646891.4368.13.camel@lenovo.internal.reciva.com>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com>  <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
Date: Sat, 10 Sep 2011 10:54:00 +0100
Message-ID: <1315648440.1986.27.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Sat, 10 Sep 2011 09:59:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-10 at 10:28 +0100, Phil Blundell wrote:
> On Sat, 2011-09-10 at 09:24 +0100, Richard Purdie wrote:
> > For what its worth, even on plain qemux86 I'm seeing:
> > 
> > qemu: Unsupported syscall: 240
> > inb: port=0x0000
> > qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> > /media/data1/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-sato-1.0-r0/rootfs/etc/rpm-postinsts/pango-module-basic-fc.sh: line 8: 11084 Segmentation fault      PSEUDO_RELOADED=YES qemu-i386 -L $D $D/usr/bin/pango-querymodules > "$D/etc/pango/pango.modules"
> > 
> > in the rootfs logs. Which reading things online suggests that qemu
> > doesn't support multithreading under qemu user emulation on i386.
> 
> That is rather strange.  It does work ok for me on mips, and I wasn't
> able to make it go wrong on x86-64 either in a quick test.
> 
> The other odd thing is that, from a quick look at the qemu source code,
> it does seem as though sys_futex (which is syscall 240 on i386 and
> syscall 202 on x86-64) ought to be supported if qemu was built with NPTL
> on.  However, in my x86-64 test I did see the "unsupported syscall 202"
> syscall although the binary still seemed to run fine.
> 
> And, well, the third weird thing is that your log message above implies
> that pango-querymodules is trying to do inb(0) which clearly is not
> going to work if you're not root.  I've no idea why it would be wanting
> to do that.

Its something about the context at rootfs generation time.

If I run the command manually, I see:

"""
sh-4.2$ /media/data1/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/qemu-i386 -L . ./usr/bin/pango-querymodules 
qemu: Unsupported syscall: 240
# Pango Modules file
# Automatically generated file, do not edit
#
qemu: Unsupported syscall: 240

(pango-querymodules:24343): GLib-WARNING **: getpwuid_r(): failed due to unknown user id (1000)
# ModulesPath = /usr/lib/pango/1.6.0/modules
#
qemu: Unsupported syscall: 240
/usr/lib/pango/1.6.0/modules/pango-basic-fc.so BasicScriptEngineFc PangoEngineShape PangoRenderFc latin:* cyrillic:* greek:* armenian:* georgian:* runic:* ogham:* bopomofo:* cherokee:* coptic:* deseret:* ethiopic:* gothic:* han:* hiragana:* katakana:* old-italic:* canadian-aboriginal:* yi:* braille:* cypriot:* limbu:* osmanya:* shavian:* linear-b:* ugaritic:* glagolitic:* cuneiform:* phoenician:* common:
/usr/lib/pango/1.6.0/modules/pango-basic-x.so BasicScriptEngineX PangoEngineShape PangoRenderX common:
"""

which looks right. It does crash as part of rpm rootfs generation
though, possibly something to do with pseudo given the root operation it
attempts. Did you test this against rpm or ipk?

Cheers,

Richard




