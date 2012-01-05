Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Riwqu-0006zM-Uw
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 00:36:11 +0100
Received: (qmail invoked by alias); 05 Jan 2012 23:28:44 -0000
Received: from p4FDF0BFB.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.11.251]
	by mail.gmx.net (mp029) with SMTP; 06 Jan 2012 00:28:44 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+5tk0v+/C5kqpC0vMk9tMM6ZeCzEfN81dMSr+Jbv
	17TS7t+FqW1S3j
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 6 Jan 2012 00:29:44 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201201060029.45032.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Thu, 05 Jan 2012 23:36:11 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

currently some libs are moving from $libdir (/usr/lib) -> $base_libdir (/lib). I 
have the following questions:

* can sombody explain a bit more what is it for and how the decision is made to 
transit libs? I read the commit messages but still have no idea what this 
enhances / fixes. What is 'not safe' or - I guess the insane.bbclass modification 
deals same issue - 'system recovery'. Is that something I (should) have? :)
* can somebody please take care what I see with meta-oe / obexd:

| ./arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link ccache arm-
angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-
interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-
thumb --sysroot=/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -
I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0 -
I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/glib-2.0/include   -
I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/dbus-1.0 -
I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/dbus-1.0/include -
D_FILE_OFFSET_BITS=64 -DOBEX_PLUGIN_BUILTIN -
DPLUGINDIR=\""/usr/lib/obex/plugins"\" -O -fno-omit-frame-pointer -g -
feliminate-unused-debug-types -pipe -O0 -Wl,--export-dynamic -Wl,-O1 -Wl,--hash-
style=gnu -Wl,--as-needed -o src/obexd gdbus/mainloop.o gdbus/watch.o 
gdbus/object.o gdbus/polkit.o plugins/bluetooth.o  plugins/filesystem.o  
plugins/opp.o plugins/ftp.o plugins/pbap.o plugins/vcard.o plugins/mas.o 
plugins/irmc.o plugins/syncevolution.o btio/btio.o src/main.o src/plugin.o 
src/log.o src/manager.o src/obex.o src/mimetype.o src/service.o src/transport.o 
src/server.o plugins/phonebook.o plugins/messages.o -ldbus-1 -lpthread -lrt   -
lglib-2.0 -lopenobex -lbluetooth   -lical -licalss -licalvcal -lpthread -ldl
| arm-angstrom-linux-gnueabi-libtool: link: cannot find the library 
`/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/lib/libusb-1.0.la' or 
unhandled argument `=/lib/libusb-1.0.la'
| make[1]: *** [src/obexd] Error 1

libusb-1.0.la still resides in .../sysroots/overo/usr/lib. Maybe it needs 
transition too? If yes: Are there also others which need libtool-lib transition?

Thanks

Andreas


