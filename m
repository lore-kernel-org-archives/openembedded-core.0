Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBORD-0001Zz-Cq for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 12:10:56 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95ABo8E013280 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 11:11:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eJeQOoBCH+Pc
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 11:11:50 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95ABjFU013276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 11:11:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 11:05:15 +0100
In-Reply-To: <1317808871.14671.126.camel@ted>
References: <CADWjqk4pPWNYzO7Cua7xYXa55g=BWqwAY8taHhLwV=xaesDWPA@mail.gmail.com>
	<1317808871.14671.126.camel@ted>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317809123.14671.127.camel@ted>
Mime-Version: 1.0
Subject: Re: pkg-config bug crashes 'bitbake glib-2.0-native' in FC15.x86_64
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
X-List-Received-Date: Wed, 05 Oct 2011 10:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 11:01 +0100, Richard Purdie wrote:
> On Wed, 2011-10-05 at 03:21 -0600, dashesy wrote:
> > Hi,
> > 
> > I am using these in my local.conf with master branch of oe-core:
> > DISTRO="angstrom-2010.x"
> > MACHINE="beagleboard"
> > 
> > The build for 'bitbake glib-2.0-native' (or actually 'bitbake
> > meta-toolchain') will finally reach a run.do_configure for 'package
> > glib-2.0-native-1_2.28.8-r5: task do_configure: Started'
> > which runs the "oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config"
> >  for auto build
> > This leads to the following chain
> > pkg-config(cross)->gnome-config->pkg-config->glib-config->pkg-config->...
> > 
> > dashesy  21266 21265 21266  0    1 01:56 pts/0    00:00:00 /bin/sh -e
> > /home/dashesy/buildroot/oe-core/build/tmp-eglibc/work/x86_64-linux/glib-2.0-native-1_2.28.8-r5/temp/run.do_configure.21265
> > root     21870   935 21870  0    1 01:56 ?        00:00:00 sleep 60
> > dashesy  22246 21266 22246  0    1 01:56 pts/0    00:00:00 /bin/sh
> > /home/dashesy/buildroot/oe-core/build/tmp-eglibc/work/x86_64-linux/glib-2.0-native-1_2.28.8-r5/glib-2.28.8/configure
> > --build=x86_64-linux --host=x86_64-linux --target=x86_64-linux
> > --prefix=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr
> > --exec_prefix=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr
> > --bindir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin
> > --sbindir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/sbin
> > --libexecdir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/libexec
> > --datadir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share
> > --sysconfdir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/etc
> > --sharedstatedir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/com
> > --localstatedir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/var
> > --libdir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib
> > --includedir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/include
> > --oldincludedir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/include
> > --infodir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/info
> > --mandir=/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/man
> > --disable-silent-rules --disable-dependency-tracking --disable-dtrace
> > --disable-systemtap --enable-nls --enable-dtrace=no
> > dashesy  22671 22246 22671  0    1 01:56 pts/0    00:00:00
> > /home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config
> > --exists --print-errors zlib
> > dashesy  22672 22671 22672  0    1 01:56 pts/0    00:00:00 sh -c
> > gnome-config --libs zlib > /dev/null 2>&1
> 
> Something odd is happening here. We have a patch in OE-Core against
> pkg-config which should disable "leagacy" pkg-config functionality.
> 
> I took a look and it somehow looks like the patch got broken. Could you
> try again with 
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip8&id=de51d6ffae1d6a4f594687d5bdef25e731f44dfa
> 
> applied please? I think this should fix this problem.

Sorry, this should be:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip8&id=8d04d67271e5698ede8c08d3b6e3d4d7e38ffb0c

Cheers,

Richard



