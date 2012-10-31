Received: from plesk3.srihosting.com ([69.19.236.78])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tmiket@recipes4linux.com>) id 1TTedF-0006Y8-Ka
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 21:11:22 +0100
Received: (qmail 12306 invoked by uid 48); 31 Oct 2012 12:57:42 -0700
Received: from 69.199.146.210 ([69.199.146.210]) by
	webmail.recipes4linux.com (Horde Framework) with HTTP; Wed, 31 Oct 2012
	12:57:42 -0700
Message-ID: <20121031125742.78794k4e3lgpz30g@webmail.recipes4linux.com>
Date: Wed, 31 Oct 2012 12:57:42 -0700
From: "T.Michael Turney" <tmiket@recipes4linux.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <20121030115615.77684awm7w5p1fqc@webmail.recipes4linux.com>
	<1720082.VE0UplCuMC@helios>
In-Reply-To: <1720082.VE0UplCuMC@helios>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gtk+ native recipe question
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
X-List-Received-Date: Wed, 31 Oct 2012 20:11:22 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Quoting Paul Eggleton <paul.eggleton@linux.intel.com>:

> Hi there,
>
> On Tuesday 30 October 2012 11:56:15 T.Michael Turney wrote:
>> My first post, chose -core over -devel somewhat arbitrarily as I don't
>> understand distinction of OE-classic yet.
>
> Basically, OE-Classic is largely unmaintained (aside from critical update=
s to
> the 2011.3-maintenance branch) and should not be used for new work - use =
OE-
> Core for that instead. So you're on the right path already :)
>
>> In order to get an existing OE system (builds on Fedora) to build correc=
tly
>> on 64-bit Ubuntu 12.04 I had to modify a number of recipe files.
>
> That's definitely not expected...

These package recipes were modified for reason:
gtk+  : issue mentioned in this post, pulling in host glib
orc   : bad code in examples, honestly no idea how it built on Fedora
pango : add libxrender-native to DEPENDS_virtclass-native
perl  : change glibpth to reference Ubuntu 64-bit library paths
soci  : added configure.in.patch to correctly set SQLITE3_DIRS, as =20
with orc, no idea how this built on Fedora

>
>> In order to get native gtk+ to build I had to add no-demos.patch
>> to SRC_URI_append.  The patch file already existed in recipes tree
>> but wasn't being referenced in the .bb file.
>>
>> Second change was adding glib-2.0-native to DEPEND_virtclass-native in
>> same file.
>
> So, the version in master and the danny branch (most recent stable, just
> branched the other day) already includes this. Are you using a different
> branch/release?

We took snapshot at beginning of 2011, last commit in git tree prior
to our mods is:

af8541c1ba14f5b075f5fdf93fc7f0689656432c
Author: Alex Ferguson <thoughtmonster@gmail.com>  2011-01-31 08:43:44

I realize this somewhat limits interest in this issue, hence my original
query to just better understand the build system and an idea of what I
should be looking at in terms of bitbake/openembedded dependencies.

>
>> Problem was manifested with unresolved reference to g_bytes_unref when
>> building gtk+ native.  Ubuntu 12.04 has more recent glib install than in
>> OE project I'm building and g_bytes_unref is visible in host glib but no=
t
>> OE version.
>>
>> With this change and a few other similar minor changes in .bb files, the
>> system builds.  However, the bitbake build line has to be invoked twice.
>>
>> For example, let's say I'm building foo-image and foo1-image, and I run:
>>
>> bitbake foo-image foo1-image
>>
>> This command fails building gtk+ native.
>
> Fails how? Can you mention the actual error you're receiving?

This is tail-end of build log that fails, with last command-line =20
issued from bitbake...

| x86_64-linux-libtool: link: gcc -shared  -fPIC -DPIC  =20
.libs/gtkimcontextxim.o .libs/imxim.o   -Wl,-rpath =20
-Wl,home/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1=
-r10.4/gtk+-2.20.1/gdk-pixbuf/.libs -Wl,-rpath -Wl,home/tturney/gitrepos/be=
ngalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1-r10.4/gtk+-2.20.1/gdk/.libs=
 -Wl,-rpath -Wl,home/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-n=
ative-2.20.1-r10.4/gtk+-2.20.1/gtk/.libs -Wl,-rpath -Wl,/home/tturney/gitre=
pos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,home/tturney/=
gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib -L/home/tturney/gitrepo=
s/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1-r10.4/gtk+-2.20.1/gdk-p=
ixbuf/.libs -L/home/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-na=
tive-2.20.1-r10.4/gtk+-2.20.1/gdk/.libs -L/home/tturney/gitrepos/bengalbb/t=
mp/sysroots/x86_64-linux/usr/lib ../../gdk-pixbuf/.libs/libgdk_pixbuf-2.0.s=
o -L=3Dhome/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib -L/=
/home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib ../../gdk=
/.libs/libgdk-x11-2.0.so -L=3D/usr/lib ../../gtk/.libs/libgtk-x11-2.0.so /h=
ome/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1-r10.=
4/gtk+-2.20.1/gdk/.libs/libgdk-x11-2.0.so //home/tturney/gitrepos/bengalbb/=
tmp/sysroots/x86_64-linux/usr/lib/libXext.so /home/tturney/gitrepos/bengalb=
b/tmp/work/x86_64-linux/gtk+-native-2.20.1-r10.4/gtk+-2.20.1/gdk-pixbuf/.li=
bs/libgdk_pixbuf-2.0.so //home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_6=
4-linux/usr/lib/libpangocairo-1.0.so //home/tturney/gitrepos/bengalbb/tmp/s=
ysroots/x86_64-linux/usr/lib/libatk-1.0.so //home/tturney/gitrepos/bengalbb=
/tmp/sysroots/x86_64-linux/usr/lib/libcairo.so //home/tturney/gitrepos/beng=
albb/tmp/sysroots/x86_64-linux/usr/lib/libpixman-1.so //home/tturney/gitrep=
os/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libpng12.so //home/tturney/gi=
trepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libX11.so //home/tturney/=
gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libxcb.so //home/tturne=
y/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libpthread-stubs.so /=
/home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libXau.so=
 //home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libXdmc=
p.so //home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/lib=
Xrender.so //home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/l=
ib/libgio-2.0.so -lresolv //home/tturney/gitrepos/bengalbb/tmp/sysroots/x86=
_64-linux/usr/lib/libpangoft2-1.0.so //home/tturney/gitrepos/bengalbb/tmp/s=
ysroots/x86_64-linux/usr/lib/libpango-1.0.so //home/tturney/gitrepos/bengal=
bb/tmp/sysroots/x86_64-linux/usr/lib/libfontconfig.so //home/tturney/gitrep=
os/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libfreetype.so //home/tturney=
/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libz.so //home/tturney=
/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libexpat.so //home/ttu=
rney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libgobject-2.0.so =
//home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib/libgmodu=
le-2.0.so -ldl //home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/u=
sr/lib/libgthread-2.0.so -lpthread -lrt //home/tturney/gitrepos/bengalbb/tm=
p/sysroots/x86_64-linux/usr/lib/libglib-2.0.so -lm  -O2 -Wl,-rpath-link -Wl=
,/home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th -Wl,/home/tturney/gitrepos/bengalbb/tmp/sysroots/x86_64-linux/usr/lib -W=
l,-O1 -pthread   -pthread -Wl,-soname -Wl,im-xim.so -o =20
.libs/im-xim.so
| x86_64-linux-libtool: link: ( cd ".libs" && rm -f "im-xim.la" && ln =20
-s "../im-xim.la" "im-xim.la" )
| ../../gtk/gtk-query-immodules-2.0 im-am-et.la im-cedilla.la =20
im-cyrillic-translit.la  im-inuktitut.la im-ipa.la im-multipress.la =20
im-thai.la im-ti-er.la im-ti-et.la im-viqr.la im-xim.la  > gtk.immodules
| =20
/home/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1-r1=
0.4/gtk+-2.20.1/gtk/.libs/lt-gtk-query-immodules-2.0: symbol lookup error: =
/usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so.0: undefined symbol: =20
g_bytes_unref
| make[3]: *** [gtk.immodules] Error 127
| make[3]: Leaving directory =20
`/home/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1-r=
10.4/gtk+-2.20.1/modules/input'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory =20
`/home/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1-r=
10.4/gtk+-2.20.1/modules'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory =20
`/home/tturney/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20.1-r=
10.4/gtk+-2.20.1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gtk+-native-2.20.1-r10.4: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of =20
virtual:native:/home/tturney/gitrepos/bengalbb/openembedded-dev/recipes/gtk=
+/gtk+_2.20.1.bb do_compile =20
failed
ERROR: Task 1918 =20
(virtual:native:/home/tturney/gitrepos/bengalbb/openembedded-dev/recipes/gt=
k+/gtk+_2.20.1.bb, do_compile) failed with =20
256
ERROR: =20
'virtual:native:/home/tturney/gitrepos/bengalbb/openembedded-dev/recipes/gt=
k+/gtk+_2.20.1.bb' =20
failed
ERROR: =20
'virtual:native:/home/tturney/gitrepos/bengalbb/openembedded-dev/recipes/gt=
k+/gtk+_2.20.1.bb' =20
failed
tturney@twt20274:~/gitrepos/bengalbb$

I am assuming the collision comes from...
tturney@twt20274:~/gitrepos/bengalbb/tmp/work/x86_64-linux/gtk+-native-2.20=
.1-r10.4/gtk+-2.20.1/gtk/.libs$ ldd =20
lt-gtk-query-immodules-2.0
         ...
=09libgdk_pixbuf-2.0.so.0 =3D> =20
/usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so.0 (0x00007fc24a80d000)
         ...

tturney@twt20274:/usr/lib/x86_64-linux-gnu$ ldd libgdk_pixbuf-2.0.so.0
         ...
=09libglib-2.0.so.0 =3D> /lib/x86_64-linux-gnu/libglib-2.0.so.0 =20
(0x00007f77f0ce7000)
         ...

libglib-2.0.so.0: symbolic link to `libglib-2.0.so.0.3200.3'

Host version of glib is newer than OE version and has g_bytes_unref.

What is not clear to me yet is why the OE bb recipe for gtk+-native is =20
falling back on the host version of glib the first time through the =20
build.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>




