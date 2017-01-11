Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 58D8971AC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 15:57:04 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cRLGj-0005AX-25; Wed, 11 Jan 2017 16:57:02 +0100
Message-ID: <1484150216.3966.19.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2017 15:56:56 +0000
In-Reply-To: <CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Wed, 11 Jan 2017 15:57:05 -0000
Content-Type: multipart/alternative; boundary="=-w8ldDBn0iVH0ZIBGTws7"

--=-w8ldDBn0iVH0ZIBGTws7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-01-11 at 12:19 +0000, Burton, Ross wrote:
> 
> > On 11 January 2017 at 03:51, Khem Raj <raj.khem@gmail.com> wrote:
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> > This fails when building gdk-pixbuf for x86-64 with gobject-
introspection enabled:
> 
> > > > > > > > > > > > | /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/gdk-
pixbuf/2.36.1-r0/build/gdk-pixbuf/tmp-
introspectylz98kc7/.libs/GdkPixbuf-2.0: Relink `/data/poky-
master/tmp-glibc/sysroots/intel-corei7-64//usr/lib/libpng16.so.16'
with `/data/poky-master/tmp-glibc/sysroots/intel-corei7-
64//lib/libpthread.so.0' for IFUNC symbol `longjmp'
> > > The gdk-pixbuf link does use -lpthread, is this saying that libpng
should be linked against pthread too?  I can replicate on demand if
you have any suggestions.
> 
> 

That's what it's saying, and this was introduced by the fix for:

https://sourceware.org/bugzilla/show_bug.cgi?id=20019

But I think this new behaviour is in itself a bug.  It isn't reasonable
to expect any library that calls longjmp() to link -lpthread just in
case it might end up coexisting with another library that does.  (The
fact that libpthread defines longjmp is arguably a bug in itself, but
one that we are stuck with.)

p.


--=-w8ldDBn0iVH0ZIBGTws7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Wed, 2017-01-11 at 12:19 +0000, Burton, Ro=
ss wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 11 January 2017 at 03:51, Khem =
Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite=
"><div id=3D"gmail-:5cu" class=3D"gmail-a3s gmail-aXjCH gmail-m1598ba80a384=
f278">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br></div><br></blockquote></div><br>This fails when=
 building gdk-pixbuf for x86-64 with gobject-introspection enabled:<br></di=
v><div class=3D"gmail_extra"><br></div><blockquote type=3D"cite">| /data/po=
ky-master/tmp-glibc/work/corei7-64-poky-linux/gdk-pixbuf/2.36.1-r0/build/gd=
k-pixbuf/tmp-introspectylz98kc7/.libs/GdkPixbuf-2.0: Relink `/data/poky-mas=
ter/tmp-glibc/sysroots/intel-corei7-64//usr/lib/libpng16.so.16' with `/data=
/poky-master/tmp-glibc/sysroots/intel-corei7-64//lib/libpthread.so.0' for I=
FUNC symbol `longjmp'<br></blockquote><div class=3D"gmail_extra"><br></div>=
<div>The gdk-pixbuf link does use -lpthread, is this saying that libpng sho=
uld be linked against pthread too?&nbsp; I can replicate on demand if you h=
ave any suggestions.</div></div>
</blockquote><div><br></div><div>That's what it's saying, and this was intr=
oduced by the fix for:</div><div><br></div><div><a href=3D"https://sourcewa=
re.org/bugzilla/show_bug.cgi?id=3D20019">https://sourceware.org/bugzilla/sh=
ow_bug.cgi?id=3D20019</a></div><div><br></div><div>But I think this new beh=
aviour is in itself a bug. &nbsp;It isn't reasonable to expect any library =
that calls longjmp() to link -lpthread just in case it might end up coexist=
ing with another library that does. &nbsp;(The fact that libpthread defines=
 longjmp is arguably a bug in itself, but one that we are stuck with.)</div=
><div><br></div><div>p.</div><div><br></div></body></html>

--=-w8ldDBn0iVH0ZIBGTws7--
