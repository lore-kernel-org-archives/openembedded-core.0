Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rj0hQ-0006D4-0D
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 04:42:36 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Jan 2012 19:35:11 -0800
Received: by iazz13 with SMTP id z13so2014123iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 19:35:11 -0800 (PST)
Received: by 10.50.187.226 with SMTP id fv2mr5997360igc.20.1325820910896;
	Thu, 05 Jan 2012 19:35:10 -0800 (PST)
Received: from [192.168.1.12] (c-76-115-40-64.hsd1.or.comcast.net.
	[76.115.40.64])
	by mx.google.com with ESMTPS id 5sm31363741ibe.8.2012.01.05.19.35.09
	(version=SSLv3 cipher=OTHER); Thu, 05 Jan 2012 19:35:10 -0800 (PST)
Message-ID: <4F066BEF.5080908@intel.com>
Date: Thu, 05 Jan 2012 19:35:11 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <201201060029.45032.schnitzeltony@gmx.de>
In-Reply-To: <201201060029.45032.schnitzeltony@gmx.de>
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
X-List-Received-Date: Fri, 06 Jan 2012 03:42:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/05/2012 03:29 PM, Andreas Müller wrote:
> Hi
>
> currently some libs are moving from $libdir (/usr/lib) ->  $base_libdir (/lib). I
> have the following questions:
>
> * can sombody explain a bit more what is it for and how the decision is made to
> transit libs? I read the commit messages but still have no idea what this
> enhances / fixes. What is 'not safe' or - I guess the insane.bbclass modification
> deals same issue - 'system recovery'. Is that something I (should) have? :)
> * can somebody please take care what I see with meta-oe / obexd:
>
> | ./arm-angstrom-linux-gnueabi-libtool  --tag=CC   --mode=link ccache arm-
> angstrom-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-
> interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 -mthumb-interwork -mno-
> thumb --sysroot=/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0 -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/glib-2.0/include   -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/dbus-1.0 -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/dbus-1.0/include -
> D_FILE_OFFSET_BITS=64 -DOBEX_PLUGIN_BUILTIN -
> DPLUGINDIR=\""/usr/lib/obex/plugins"\" -O -fno-omit-frame-pointer -g -
> feliminate-unused-debug-types -pipe -O0 -Wl,--export-dynamic -Wl,-O1 -Wl,--hash-
> style=gnu -Wl,--as-needed -o src/obexd gdbus/mainloop.o gdbus/watch.o
> gdbus/object.o gdbus/polkit.o plugins/bluetooth.o  plugins/filesystem.o
> plugins/opp.o plugins/ftp.o plugins/pbap.o plugins/vcard.o plugins/mas.o
> plugins/irmc.o plugins/syncevolution.o btio/btio.o src/main.o src/plugin.o
> src/log.o src/manager.o src/obex.o src/mimetype.o src/service.o src/transport.o
> src/server.o plugins/phonebook.o plugins/messages.o -ldbus-1 -lpthread -lrt   -
> lglib-2.0 -lopenobex -lbluetooth   -lical -licalss -licalvcal -lpthread -ldl
> | arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
> `/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/lib/libusb-1.0.la' or
> unhandled argument `=/lib/libusb-1.0.la'
> | make[1]: *** [src/obexd] Error 1
>
> libusb-1.0.la still resides in .../sysroots/overo/usr/lib. Maybe it needs
> transition too? If yes: Are there also others which need libtool-lib transition?
>
> Thanks
>
> Andreas

Hi Andreas,

I think you mentioned in another thread that the "why" part of your 
question has been addressed. As for the location of libusb-1.0.la - it 
looks like Richard previously missed one of my commits moving 
libusb-compat, and just merged it to oe-core master:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=198f2ac06e60245750a2c6561b8c8e2eaa93f6be

Does this fix the issue?

I may be hard to reach tomorrow, so I hope RP or Mark Hatle can field 
any further questions for me.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


