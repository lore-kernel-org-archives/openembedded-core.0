Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rol3z-0004N6-MS
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 01:13:40 +0100
Received: by iabz21 with SMTP id z21so3065813iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 16:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=z0MqxTQXLaCiwHc1+4c+5lD8xHlmsqBW2rz0r4jtIj0=;
	b=LbjBaznHq0V7XPzJBNCd0ZwncL198uy5C0icFwVm4jj8Ui5U3TrxsC2UYYhPKkXeqq
	kVUhrixOMhOHhaOka5Qyrt1FdRF9OAk+XDZ47Z1UlCq/0xZ7y4rFS77jbkXYftlOQdZr
	MTZxAUCjE2gTxtMJjEiWJYVFsPczW2wmwHg4E=
Received: by 10.50.15.231 with SMTP id a7mr3862203igd.8.1327190756849;
	Sat, 21 Jan 2012 16:05:56 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id g34sm27573074ibk.10.2012.01.21.16.05.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 16:05:55 -0800 (PST)
Date: Sat, 21 Jan 2012 16:05:51 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120122000551.GE12691@sakrah.homelinux.org>
References: <201201060029.45032.schnitzeltony@gmx.de>
	<4F0717EB.7050807@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4F0717EB.7050807@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Sun, 22 Jan 2012 00:13:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (06/01/12 09:48), Mark Hatle wrote:
> On 1/5/12 5:29 PM, Andreas Müller wrote:
> >Hi
> >
> >currently some libs are moving from $libdir (/usr/lib) ->  $base_libdir (/lib). I
> >have the following questions:
> >
> >* can sombody explain a bit more what is it for and how the decision is made to
> >transit libs? I read the commit messages but still have no idea what this
> >enhances / fixes. What is 'not safe' or - I guess the insane.bbclass modification
> >deals same issue - 'system recovery'. Is that something I (should) have? :)
> 
> The issue is based on the separation of the "root" (/) and "user"
> (/usr) partition.  It is reasonable, and in many cases advisable to
> breakup the system into multiple partitions.  The FHS (and UNIX
> tradition) support the idea of a small root filesystem w/ a /usr
> partition adding the majority of the functionality to the system.
> (Note: in OE-Core the 'user' partition is equivalent to the
> exec_prefix, which some distributions make '/' in order to flatten
> the filesystem.  In this case the code will detect root and user are
> the same and do nothing.)
> 
> The problem being identified, and resolved is that if a binary
> exists in the root partition, then all of it's support libraries
> must also exist in the root partition.  I.e. "/bin/grep" can't refer
> to "/usr/lib/libncurses.so".  Because during early boot a script may
> use grep for functionality, but if /usr is not yet mounted it will
> fail.  Detecting this is fairly simple -- correlate the libraries
> required by an executable in the root partition and verify they are
> not requiring anything located in the /usr partition.
> 
> Similarly if shell scripts require functionality that only exist in
> /usr, then they may also cause a failure condition if /usr is not
> yet mounted.  (This of course is much harder to detect, which is why
> this test is only a warning and likely to only ever be a warning as
> there will potentially be a lot of false positives.)
> 
> When a QA situation is detected there are three common solutions to the problem:
> 
> *) Move the required library from the user partition to root
> 
> *) Move the binary from the root partition to the user partition
> 
> *) Change the options of the binary to no longer require the library
> in the user partition
> 
> Each of the above should be evaluated based on the implicit goal
> that the root partition continue to be "small", with the rule of
> thumb that it needs to contain enough to do early boot and mount of
> the user filesystem -- and potentially recovery activities in case
> of a failure.
> 
> (I see Scott answered the question below already..)
> 

from OE point of view its good to support as many options as possible
and the idea is ok however I think not all packages are written in a way
that the installs can be made easility relocatable. If you change a
package to make it more nicely relocatable then please write patches
that can be submitted upstream to respective packages instead of having
tweaks in the metadata. My concern is that we will have so many of these
changes in metadata as kludges to build such packages.


> --Mark
> 
> >* can somebody please take care what I see with meta-oe / obexd:
> >
> >| ./arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link ccache arm-
> >angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-
> >interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-
> >thumb --sysroot=/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -
> >I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0 -
> >I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/glib-2.0/include   -
> >I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/dbus-1.0 -
> >I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/dbus-1.0/include -
> >D_FILE_OFFSET_BITS=64 -DOBEX_PLUGIN_BUILTIN -
> >DPLUGINDIR=\""/usr/lib/obex/plugins"\" -O -fno-omit-frame-pointer -g -
> >feliminate-unused-debug-types -pipe -O0 -Wl,--export-dynamic -Wl,-O1 -Wl,--hash-
> >style=gnu -Wl,--as-needed -o src/obexd gdbus/mainloop.o gdbus/watch.o
> >gdbus/object.o gdbus/polkit.o plugins/bluetooth.o  plugins/filesystem.o
> >plugins/opp.o plugins/ftp.o plugins/pbap.o plugins/vcard.o plugins/mas.o
> >plugins/irmc.o plugins/syncevolution.o btio/btio.o src/main.o src/plugin.o
> >src/log.o src/manager.o src/obex.o src/mimetype.o src/service.o src/transport.o
> >src/server.o plugins/phonebook.o plugins/messages.o -ldbus-1 -lpthread -lrt   -
> >lglib-2.0 -lopenobex -lbluetooth   -lical -licalss -licalvcal -lpthread -ldl
> >| arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
> >`/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/lib/libusb-1.0.la' or
> >unhandled argument `=/lib/libusb-1.0.la'
> >| make[1]: *** [src/obexd] Error 1
> >
> >libusb-1.0.la still resides in .../sysroots/overo/usr/lib. Maybe it needs
> >transition too? If yes: Are there also others which need libtool-lib transition?
> >
> >Thanks
> >
> >Andreas
> >
> >_______________________________________________
> >Openembedded-core mailing list
> >Openembedded-core@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


