Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 31C9A6D4EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 00:39:12 +0000 (UTC)
Received: from [98.142.64.238] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1Vc2ld-000Po0-Rh for openembedded-core@lists.openembedded.org;
	Fri, 01 Nov 2013 00:39:14 +0000
Received: from [192.168.0.83] ([192.168.0.83]) (authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	rA10dAes012816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Thu, 31 Oct 2013 19:39:11 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.64.238
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1/PY03+oawyV5ISwzp7UPWFePN6IVUQR34=
Message-ID: <1383266350.8081.11.camel@omclinuxballt.devnet.ordermatic.net>
From: Brian Lloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 19:39:10 -0500
In-Reply-To: <52726100.5070205@windriver.com>
References: <cover.1383197850.git.blloyd@familyhonor.net>
	<2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
	<52726100.5070205@windriver.com>
X-Mailer: Evolution 3.6.4 (3.6.4-3.fc18) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] Enhancements to allow core file debugging to work properly from devices
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
X-List-Received-Date: Fri, 01 Nov 2013 00:39:12 -0000
Content-Type: multipart/alternative; boundary="=-RXFIbDiG0ijbQbSJ4cVa"

--=-RXFIbDiG0ijbQbSJ4cVa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The patch adds gcore when gcore package is added to the install packages
list for an image.  That gives a simple core generation wrapper around
gcc, which might simplify your testing.
It appears -dev includes -dbg, and the file I want is in -dbg, so I can
submit a new patch limiting to only -dbg just fine.  The -dev for
glib-thread-db isn't very big so I didn't catch the extra files not
really needed.  I have used this in an image that was still 50mbish in
size.  Since before I made the patch, I made a hybrid system by manually
placing the one debug symbols file onto the disk, and once the symbols
file was in place cores generated became readable, and before that the
cores were unreadable, I have strong evidence only the debug symbols are
needed.

gcore PID
is the syntax to create a core dump using the helper script.  You can
also use gdb directly to debug or generate a core dump.  If the program
is multi-threaded, without the above patch a core loaded into a system
that has full -dev config (either an SDK or larger system image for
development) could not properly read the core dump.  With the above
patch or adding the debug symbol file manually, the core could be read
by the debugger.  Since I am building a i686 based system, I am able to
run my images on a PC in a sysroot, which made my testing easier.  I
also tried via a standard end system type disk on a device and a
development environment loaded on the device, and got the same results.


Brian


On Thu, 2013-10-31 at 08:54 -0500, Mark Hatle wrote:

> On 10/31/13, 1:54 AM, blloyd wrote:
> > gdb includes a script to make generating core files trivial.  Add a package to allow inclusion of this script in images.  GDB also requires symbols that are usually stripped from the threads library to properly generate a core dump.  Therefore, ensure when gdb is installed the necessary debug file is also present so gdb is fully functional.
> >
> > Signed-off-by: blloyd <blloyd@familyhonor.net>
> > ---
> >   meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----
> >   meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-
> >   2 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> > index 6954954..02eef85 100644
> > --- a/meta/recipes-devtools/gdb/gdb-common.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> > @@ -61,8 +61,10 @@ do_install_append() {
> >   	rm -rf ${D}${datadir}/locale
> >   }
> >
> > -RRECOMMENDS_gdb_append_linux = " glibc-thread-db "
> > -RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db "
> > -RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db "
> > -RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db "
> > -
> > +# Unfortunately, for gdb multi-threading to function reliably it must have the eglibc debug symbols
> > +# which are a part of the eglibc-dev package.  So we have added a dependency on that here.
> > +RRECOMMENDS_gdb_append_linux = " glibc-thread-db eglibc-dev "
> > +RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
> > +RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db eglibc-dev "
> > +RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
> > +RDEPENDS_gcore_append = " gdb "
> 
> The debug symbols should be in the -dbg package, not the -dev package.  The -dev 
> package should simply be symlinks and special development only components, while 
> the -dbg is the split symbols.
> 
> With the eglibc-dbg installed onto the gdb environment, it should be possible to 
> have all necessary symbols to do whatever processing is required.  If this 
> doesn't work, it likely needs to be investigated.  (If something in -dev is 
> required, likely there is another bug somewhere else that needs to be fixed in 
> the packaging of eglibc.)
> 
> Do you have steps on using this code (a test command perhaps?).  I've recently 
> been asked to investigate some issues with debugging when using libpthread, and 
> I suspect the problem may be over zealous stripping of the libpthread.so on the 
> target.  But I still haven't finished my evaluation yet.
> 
> --Mark
> 
> > diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> > index 3321a24..9bf0e86 100644
> > --- a/meta/recipes-devtools/gdb/gdb.inc
> > +++ b/meta/recipes-devtools/gdb/gdb.inc
> > @@ -10,5 +10,12 @@ SRC_URI += "file://kill_arm_map_symbols.patch \
> >   #export CFLAGS_append=" -L${STAGING_LIBDIR}"
> >
> >   # cross-canadian must not see this
> > -PACKAGES =+ "gdbserver"
> > +PACKAGES =+ "gdbserver gcore"
> >   FILES_gdbserver = "${bindir}/gdbserver"
> > +FILES_gcore = "${bindir}/gcore"
> > +
> > +do_install_append() {
> > +  # When trying to find what went wrong with a program, a core dump can be very helpful
> > +  # Go ahead and make it easier to get one when we have gdb on the system
> > +  install -m 0755 ${S}/gdb/gdb_gcore.sh ${D}${bindir}/gcore
> > +}
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



--=-RXFIbDiG0ijbQbSJ4cVa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.6.4">
</HEAD>
<BODY>
The patch adds gcore when gcore package is added to the install packages list for an image.&nbsp; That gives a simple core generation wrapper around gcc, which might simplify your testing.<BR>
It appears -dev includes -dbg, and the file I want is in -dbg, so I can submit a new patch limiting to only -dbg just fine.&nbsp; The -dev for glib-thread-db isn't very big so I didn't catch the extra files not really needed.&nbsp; I have used this in an image that was still 50mbish in size.&nbsp; Since before I made the patch, I made a hybrid system by manually placing the one debug symbols file onto the disk, and once the symbols file was in place cores generated became readable, and before that the cores were unreadable, I have strong evidence only the debug symbols are needed.<BR>
<BR>
gcore PID<BR>
is the syntax to create a core dump using the helper script.&nbsp; You can also use gdb directly to debug or generate a core dump.&nbsp; If the program is multi-threaded, without the above patch a core loaded into a system that has full -dev config (either an SDK or larger system image for development) could not properly read the core dump.&nbsp; With the above patch or adding the debug symbol file manually, the core could be read by the debugger.&nbsp; Since I am building a i686 based system, I am able to run my images on a PC in a sysroot, which made my testing easier.&nbsp; I also tried via a standard end system type disk on a device and a development environment loaded on the device, and got the same results.<BR>
<BR>
<BR>
Brian<BR>
<BR>
<BR>
On Thu, 2013-10-31 at 08:54 -0500, Mark Hatle wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
On 10/31/13, 1:54 AM, blloyd wrote:
<FONT COLOR="#737373">&gt; gdb includes a script to make generating core files trivial.  Add a package to allow inclusion of this script in images.  GDB also requires symbols that are usually stripped from the threads library to properly generate a core dump.  Therefore, ensure when gdb is installed the necessary debug file is also present so gdb is fully functional.</FONT>
<FONT COLOR="#737373">&gt;</FONT>
<FONT COLOR="#737373">&gt; Signed-off-by: blloyd &lt;<A HREF="mailto:blloyd@familyhonor.net">blloyd@familyhonor.net</A>&gt;</FONT>
<FONT COLOR="#737373">&gt; ---</FONT>
<FONT COLOR="#737373">&gt;   meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----</FONT>
<FONT COLOR="#737373">&gt;   meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-</FONT>
<FONT COLOR="#737373">&gt;   2 files changed, 15 insertions(+), 6 deletions(-)</FONT>
<FONT COLOR="#737373">&gt;</FONT>
<FONT COLOR="#737373">&gt; diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc</FONT>
<FONT COLOR="#737373">&gt; index 6954954..02eef85 100644</FONT>
<FONT COLOR="#737373">&gt; --- a/meta/recipes-devtools/gdb/gdb-common.inc</FONT>
<FONT COLOR="#737373">&gt; +++ b/meta/recipes-devtools/gdb/gdb-common.inc</FONT>
<FONT COLOR="#737373">&gt; @@ -61,8 +61,10 @@ do_install_append() {</FONT>
<FONT COLOR="#737373">&gt;   	rm -rf ${D}${datadir}/locale</FONT>
<FONT COLOR="#737373">&gt;   }</FONT>
<FONT COLOR="#737373">&gt;</FONT>
<FONT COLOR="#737373">&gt; -RRECOMMENDS_gdb_append_linux = &quot; glibc-thread-db &quot;</FONT>
<FONT COLOR="#737373">&gt; -RRECOMMENDS_gdb_append_linux-gnueabi = &quot; glibc-thread-db &quot;</FONT>
<FONT COLOR="#737373">&gt; -RRECOMMENDS_gdbserver_append_linux = &quot; glibc-thread-db &quot;</FONT>
<FONT COLOR="#737373">&gt; -RRECOMMENDS_gdbserver_append_linux-gnueabi = &quot; glibc-thread-db &quot;</FONT>
<FONT COLOR="#737373">&gt; -</FONT>
<FONT COLOR="#737373">&gt; +# Unfortunately, for gdb multi-threading to function reliably it must have the eglibc debug symbols</FONT>
<FONT COLOR="#737373">&gt; +# which are a part of the eglibc-dev package.  So we have added a dependency on that here.</FONT>
<FONT COLOR="#737373">&gt; +RRECOMMENDS_gdb_append_linux = &quot; glibc-thread-db eglibc-dev &quot;</FONT>
<FONT COLOR="#737373">&gt; +RRECOMMENDS_gdb_append_linux-gnueabi = &quot; glibc-thread-db eglibc-dev &quot;</FONT>
<FONT COLOR="#737373">&gt; +RRECOMMENDS_gdbserver_append_linux = &quot; glibc-thread-db eglibc-dev &quot;</FONT>
<FONT COLOR="#737373">&gt; +RRECOMMENDS_gdbserver_append_linux-gnueabi = &quot; glibc-thread-db eglibc-dev &quot;</FONT>
<FONT COLOR="#737373">&gt; +RDEPENDS_gcore_append = &quot; gdb &quot;</FONT>

The debug symbols should be in the -dbg package, not the -dev package.  The -dev 
package should simply be symlinks and special development only components, while 
the -dbg is the split symbols.

With the eglibc-dbg installed onto the gdb environment, it should be possible to 
have all necessary symbols to do whatever processing is required.  If this 
doesn't work, it likely needs to be investigated.  (If something in -dev is 
required, likely there is another bug somewhere else that needs to be fixed in 
the packaging of eglibc.)

Do you have steps on using this code (a test command perhaps?).  I've recently 
been asked to investigate some issues with debugging when using libpthread, and 
I suspect the problem may be over zealous stripping of the libpthread.so on the 
target.  But I still haven't finished my evaluation yet.

--Mark

<FONT COLOR="#737373">&gt; diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc</FONT>
<FONT COLOR="#737373">&gt; index 3321a24..9bf0e86 100644</FONT>
<FONT COLOR="#737373">&gt; --- a/meta/recipes-devtools/gdb/gdb.inc</FONT>
<FONT COLOR="#737373">&gt; +++ b/meta/recipes-devtools/gdb/gdb.inc</FONT>
<FONT COLOR="#737373">&gt; @@ -10,5 +10,12 @@ SRC_URI += &quot;<A HREF="file://kill_arm_map_symbols.patch">file://kill_arm_map_symbols.patch</A> \</FONT>
<FONT COLOR="#737373">&gt;   #export CFLAGS_append=&quot; -L${STAGING_LIBDIR}&quot;</FONT>
<FONT COLOR="#737373">&gt;</FONT>
<FONT COLOR="#737373">&gt;   # cross-canadian must not see this</FONT>
<FONT COLOR="#737373">&gt; -PACKAGES =+ &quot;gdbserver&quot;</FONT>
<FONT COLOR="#737373">&gt; +PACKAGES =+ &quot;gdbserver gcore&quot;</FONT>
<FONT COLOR="#737373">&gt;   FILES_gdbserver = &quot;${bindir}/gdbserver&quot;</FONT>
<FONT COLOR="#737373">&gt; +FILES_gcore = &quot;${bindir}/gcore&quot;</FONT>
<FONT COLOR="#737373">&gt; +</FONT>
<FONT COLOR="#737373">&gt; +do_install_append() {</FONT>
<FONT COLOR="#737373">&gt; +  # When trying to find what went wrong with a program, a core dump can be very helpful</FONT>
<FONT COLOR="#737373">&gt; +  # Go ahead and make it easier to get one when we have gdb on the system</FONT>
<FONT COLOR="#737373">&gt; +  install -m 0755 ${S}/gdb/gdb_gcore.sh ${D}${bindir}/gcore</FONT>
<FONT COLOR="#737373">&gt; +}</FONT>
<FONT COLOR="#737373">&gt;</FONT>

_______________________________________________
Openembedded-core mailing list
<A HREF="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</A>
<A HREF="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</A>

</PRE>
</BLOCKQUOTE>
<BR>
</BODY>
</HTML>

--=-RXFIbDiG0ijbQbSJ4cVa--
