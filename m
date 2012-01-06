Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RjC9Z-0000iw-S0
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 16:56:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q06Fn0gf012628
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 07:49:00 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 6 Jan 2012 07:49:00 -0800
Message-ID: <4F0717EB.7050807@windriver.com>
Date: Fri, 6 Jan 2012 09:48:59 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <201201060029.45032.schnitzeltony@gmx.de>
In-Reply-To: <201201060029.45032.schnitzeltony@gmx.de>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q06Fn0gf012628
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
X-List-Received-Date: Fri, 06 Jan 2012 15:56:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 1/5/12 5:29 PM, Andreas M=FCller wrote:
> Hi
>
> currently some libs are moving from $libdir (/usr/lib) ->  $base_libdir=
 (/lib). I
> have the following questions:
>
> * can sombody explain a bit more what is it for and how the decision is=
 made to
> transit libs? I read the commit messages but still have no idea what th=
is
> enhances / fixes. What is 'not safe' or - I guess the insane.bbclass mo=
dification
> deals same issue - 'system recovery'. Is that something I (should) have=
? :)

The issue is based on the separation of the "root" (/) and "user" (/usr)=20
partition.  It is reasonable, and in many cases advisable to breakup the =
system=20
into multiple partitions.  The FHS (and UNIX tradition) support the idea =
of a=20
small root filesystem w/ a /usr partition adding the majority of the=20
functionality to the system.  (Note: in OE-Core the 'user' partition is=20
equivalent to the exec_prefix, which some distributions make '/' in order=
 to=20
flatten the filesystem.  In this case the code will detect root and user =
are the=20
same and do nothing.)

The problem being identified, and resolved is that if a binary exists in =
the=20
root partition, then all of it's support libraries must also exist in the=
 root=20
partition.  I.e. "/bin/grep" can't refer to "/usr/lib/libncurses.so".  Be=
cause=20
during early boot a script may use grep for functionality, but if /usr is=
 not=20
yet mounted it will fail.  Detecting this is fairly simple -- correlate t=
he=20
libraries required by an executable in the root partition and verify they=
 are=20
not requiring anything located in the /usr partition.

Similarly if shell scripts require functionality that only exist in /usr,=
 then=20
they may also cause a failure condition if /usr is not yet mounted.  (Thi=
s of=20
course is much harder to detect, which is why this test is only a warning=
 and=20
likely to only ever be a warning as there will potentially be a lot of fa=
lse=20
positives.)

When a QA situation is detected there are three common solutions to the p=
roblem:

*) Move the required library from the user partition to root

*) Move the binary from the root partition to the user partition

*) Change the options of the binary to no longer require the library in t=
he user=20
partition

Each of the above should be evaluated based on the implicit goal that the=
 root=20
partition continue to be "small", with the rule of thumb that it needs to=
=20
contain enough to do early boot and mount of the user filesystem -- and=20
potentially recovery activities in case of a failure.

(I see Scott answered the question below already..)

--Mark

> * can somebody please take care what I see with meta-oe / obexd:
>
> | ./arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dlink ccac=
he arm-
> angstrom-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vectorize      -=
mthumb-
> interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -mthumb-=
interwork -mno-
> thumb --sysroot=3D/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/glib-2.0=
 -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/glib-2.0/inc=
lude   -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/include/dbus-1.0=
 -
> I/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/usr/lib/dbus-1.0/inc=
lude -
> D_FILE_OFFSET_BITS=3D64 -DOBEX_PLUGIN_BUILTIN -
> DPLUGINDIR=3D\""/usr/lib/obex/plugins"\" -O -fno-omit-frame-pointer -g =
-
> feliminate-unused-debug-types -pipe -O0 -Wl,--export-dynamic -Wl,-O1 -W=
l,--hash-
> style=3Dgnu -Wl,--as-needed -o src/obexd gdbus/mainloop.o gdbus/watch.o
> gdbus/object.o gdbus/polkit.o plugins/bluetooth.o  plugins/filesystem.o
> plugins/opp.o plugins/ftp.o plugins/pbap.o plugins/vcard.o plugins/mas.=
o
> plugins/irmc.o plugins/syncevolution.o btio/btio.o src/main.o src/plugi=
n.o
> src/log.o src/manager.o src/obex.o src/mimetype.o src/service.o src/tra=
nsport.o
> src/server.o plugins/phonebook.o plugins/messages.o -ldbus-1 -lpthread =
-lrt   -
> lglib-2.0 -lopenobex -lbluetooth   -lical -licalss -licalvcal -lpthread=
 -ldl
> | arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
> `/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/lib/libusb-1.0.la' o=
r
> unhandled argument `=3D/lib/libusb-1.0.la'
> | make[1]: *** [src/obexd] Error 1
>
> libusb-1.0.la still resides in .../sysroots/overo/usr/lib. Maybe it nee=
ds
> transition too? If yes: Are there also others which need libtool-lib tr=
ansition?
>
> Thanks
>
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



