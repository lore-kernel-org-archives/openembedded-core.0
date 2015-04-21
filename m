Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id B1B3B7226D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 08:48:26 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so58459287wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rh/oGoFyLzgWfnFlU3Ez6nLqTPS01KwWBCzi7TSS7N4=;
	b=Gj5ApQXsn0gA6QR+MADRiF30jvRRvN/ir8BXZKfF1J13k/pnCF22Pf82MKGfKY+UvD
	Iqiq2656TrLF8f09y+CUn7gKUaO+jRbVNaB9ZXnjUSsItoaPTuMDq1ZBtIPts0q1I2+M
	wpbtNj1W7mNtJJ1uLwz5WoqnBjGwFaZ5O+9ywWKdopmhhmu5ZZtdzsx8TMJuk9McQP7C
	DhoZVvcYTLbFB/GJdP7o68haTx4vaqhrnC4BX0BwcgjNaovmm+54KO8XUFP1DGiNasyb
	+Kxu9P7eY3DhFUScQ0A382OTDbg1Sx9+IwsHY9Q9suqFiaTr8uhdDX74WJ0pLB1R4+9S
	Ospw==
MIME-Version: 1.0
X-Received: by 10.194.170.132 with SMTP id am4mr37762294wjc.143.1429606106809; 
	Tue, 21 Apr 2015 01:48:26 -0700 (PDT)
Received: by 10.28.157.17 with HTTP; Tue, 21 Apr 2015 01:48:26 -0700 (PDT)
In-Reply-To: <1429597491.26983.66.camel@linuxfoundation.org>
References: <1428674774-29364-1-git-send-email-Martin.Jansa@gmail.com>
	<20150420130541.GD3686@jama>
	<1429597491.26983.66.camel@linuxfoundation.org>
Date: Tue, 21 Apr 2015 10:48:26 +0200
Message-ID: <CA+chaQd3FpHrXUAR3RiH92=s56KyfU2etKjrLnTJWee0tJb_sg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: Package populate-extfs.sh and enable symlink install
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
X-List-Received-Date: Tue, 21 Apr 2015 08:48:27 -0000
Content-Type: multipart/alternative; boundary=089e013c6be22a4bf00514381c78

--089e013c6be22a4bf00514381c78
Content-Type: text/plain; charset=UTF-8

I was hoping to get this simple work around in all release branches and
then if the root issue is found and fixed, we can test it a bit longer in
master.

I'll double check the actual commit, but I'm sure I see this behavior in
dizzy (and the work around was also first tested in dizzy, because that was
blocking us in building small enough initramfs image).

On Tue, Apr 21, 2015 at 8:24 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2015-04-20 at 15:05 +0200, Martin Jansa wrote:
> > On Fri, Apr 10, 2015 at 04:06:14PM +0200, Martin Jansa wrote:
> > > * install populate-extfs.sh from contrib, be aware that in order
> > >   to use it you need to set DEBUGFS shell variable, otherwise it will
> > >   try to use debugfs from relative path which is almost always
> > >   incorrect:
> > >     CONTRIB_DIR=$(dirname $(readlink -f $0))
> > >     DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"
> > >
> > > * use symlinks to install e2fsck, mke2fs, without this option we have:
> > >   $ ls -lahi
> tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/image/sbin/
> > >   ...
> > >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 e2fsck
> > >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
> > >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
> > >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
> > >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4dev
> > >   ...
> > >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mke2fs
> > >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
> > >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext3
> > >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
> > >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
> > >   ...
> > >
> > >   which would be OK, because they are hadlinks, but after runstrip in
> > >   do_package we get one stripped binary and 4 hardlinks to the original
> > >   one:
> > >
> > >   $ ls -lahi
> tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin
> > >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 e2fsck
> > >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
> > >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
> > >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
> > >   101983136 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:43 fsck.ext4dev
> > >   $ ls -lahi
> tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
> > >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mke2fs
> > >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
> > >   101988266 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:43 mkfs.ext3
> > >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
> > >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
> > >
> > >   That's super annoying for big files like this which are often include
> > >   in small recovery images. Using --enable-symlink-install option
> results
> > >   in one stripped binary and 4 symlinks:
> > >
> > >   $ ls -lahi
> tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin/
> > >   102113806 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:50 e2fsck
> > >   102113813 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext2
> -> e2fsck
> > >   102113814 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext3
> -> e2fsck
> > >   102113812 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4
> -> e2fsck
> > >   102113815 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50
> fsck.ext4dev -> e2fsck
> > >   $ ls -lahi
> tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/
> > >   102113804 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:50 mke2fs
> > >   102113825 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext2
> -> mke2fs
> > >   102113826 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext3
> -> mke2fs
> > >   102113823 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4
> -> mke2fs
> > >   102113824 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50
> mkfs.ext4dev -> mke2fs
> > >
> > >   Saving cca 1,5MB.
> >
> > Ping, this is needed also in fido and dizzy branches.
>
> I'm still hoping we can fix the packaging code so that we avoid this
> problem with hardlinked files which is why I'm holding off this
> slightly.
>
> Also, are you sure this problem applies in dizzy? The change the
> introduced this problem wasn't in dizzy as far as I remember but I could
> be wrong...
>
> Cheers,
>
> Richard
>
>
>

--089e013c6be22a4bf00514381c78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was hoping to get this simple work around in all release=
 branches and then if the root issue is found and fixed, we can test it a b=
it longer in master.<div><br></div><div>I&#39;ll double check the actual co=
mmit, but I&#39;m sure I see this behavior in dizzy (and the work around wa=
s also first tested in dizzy, because that was blocking us in building smal=
l enough initramfs image).</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Tue, Apr 21, 2015 at 8:24 AM, Richard Purdie <span =
dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targe=
t=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Mon=
, 2015-04-20 at 15:05 +0200, Martin Jansa wrote:<br>
&gt; On Fri, Apr 10, 2015 at 04:06:14PM +0200, Martin Jansa wrote:<br>
&gt; &gt; * install populate-extfs.sh from contrib, be aware that in order<=
br>
&gt; &gt;=C2=A0 =C2=A0to use it you need to set DEBUGFS shell variable, oth=
erwise it will<br>
&gt; &gt;=C2=A0 =C2=A0try to use debugfs from relative path which is almost=
 always<br>
&gt; &gt;=C2=A0 =C2=A0incorrect:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0CONTRIB_DIR=3D$(dirname $(readlink -f $0))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DEBUGFS=3D&quot;$CONTRIB_DIR/../debugfs/debugf=
s&quot;<br>
&gt; &gt;<br>
&gt; &gt; * use symlinks to install e2fsck, mke2fs, without this option we =
have:<br>
&gt; &gt;=C2=A0 =C2=A0$ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e=
2fsprogs/1.42.9-r0/image/sbin/<br>
&gt; &gt;=C2=A0 =C2=A0...<br>
&gt; &gt;=C2=A0 =C2=A0101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15=
:43 e2fsck<br>
&gt; &gt;=C2=A0 =C2=A0101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15=
:43 fsck.ext2<br>
&gt; &gt;=C2=A0 =C2=A0101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15=
:43 fsck.ext3<br>
&gt; &gt;=C2=A0 =C2=A0101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15=
:43 fsck.ext4<br>
&gt; &gt;=C2=A0 =C2=A0101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15=
:43 fsck.ext4dev<br>
&gt; &gt;=C2=A0 =C2=A0...<br>
&gt; &gt;=C2=A0 =C2=A0101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15=
:43 mke2fs<br>
&gt; &gt;=C2=A0 =C2=A0101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15=
:43 mkfs.ext2<br>
&gt; &gt;=C2=A0 =C2=A0101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15=
:43 mkfs.ext3<br>
&gt; &gt;=C2=A0 =C2=A0101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15=
:43 mkfs.ext4<br>
&gt; &gt;=C2=A0 =C2=A0101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15=
:43 mkfs.ext4dev<br>
&gt; &gt;=C2=A0 =C2=A0...<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0which would be OK, because they are hadlinks, but aft=
er runstrip in<br>
&gt; &gt;=C2=A0 =C2=A0do_package we get one stripped binary and 4 hardlinks=
 to the original<br>
&gt; &gt;=C2=A0 =C2=A0one:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0$ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e=
2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin<br>
&gt; &gt;=C2=A0 =C2=A0101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15=
:43 e2fsck<br>
&gt; &gt;=C2=A0 =C2=A0101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15=
:43 fsck.ext2<br>
&gt; &gt;=C2=A0 =C2=A0101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15=
:43 fsck.ext3<br>
&gt; &gt;=C2=A0 =C2=A0101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15=
:43 fsck.ext4<br>
&gt; &gt;=C2=A0 =C2=A0101983136 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15=
:43 fsck.ext4dev<br>
&gt; &gt;=C2=A0 =C2=A0$ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e=
2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/<br>
&gt; &gt;=C2=A0 =C2=A0101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15=
:43 mke2fs<br>
&gt; &gt;=C2=A0 =C2=A0101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15=
:43 mkfs.ext2<br>
&gt; &gt;=C2=A0 =C2=A0101988266 -rwxr-xr-x 2 bitbake bitbake=C2=A0 72K Apr =
10 15:43 mkfs.ext3<br>
&gt; &gt;=C2=A0 =C2=A0101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15=
:43 mkfs.ext4<br>
&gt; &gt;=C2=A0 =C2=A0101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15=
:43 mkfs.ext4dev<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0That&#39;s super annoying for big files like this whi=
ch are often include<br>
&gt; &gt;=C2=A0 =C2=A0in small recovery images. Using --enable-symlink-inst=
all option results<br>
&gt; &gt;=C2=A0 =C2=A0in one stripped binary and 4 symlinks:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0$ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e=
2fsprogs/1.42.9-r0/packages-split/e2fsprogs-e2fsck/sbin/<br>
&gt; &gt;=C2=A0 =C2=A0102113806 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15=
:50 e2fsck<br>
&gt; &gt;=C2=A0 =C2=A0102113813 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 fsck.ext2 -&gt; e2fsck<br>
&gt; &gt;=C2=A0 =C2=A0102113814 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 fsck.ext3 -&gt; e2fsck<br>
&gt; &gt;=C2=A0 =C2=A0102113812 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 fsck.ext4 -&gt; e2fsck<br>
&gt; &gt;=C2=A0 =C2=A0102113815 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 fsck.ext4dev -&gt; e2fsck<br>
&gt; &gt;=C2=A0 =C2=A0$ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e=
2fsprogs/1.42.9-r0/packages-split/e2fsprogs-mke2fs/sbin/<br>
&gt; &gt;=C2=A0 =C2=A0102113804 -rwxr-xr-x 2 bitbake bitbake=C2=A0 72K Apr =
10 15:50 mke2fs<br>
&gt; &gt;=C2=A0 =C2=A0102113825 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 mkfs.ext2 -&gt; mke2fs<br>
&gt; &gt;=C2=A0 =C2=A0102113826 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 mkfs.ext3 -&gt; mke2fs<br>
&gt; &gt;=C2=A0 =C2=A0102113823 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 mkfs.ext4 -&gt; mke2fs<br>
&gt; &gt;=C2=A0 =C2=A0102113824 lrwxrwxrwx 1 bitbake bitbake=C2=A0 =C2=A0 6=
 Apr 10 15:50 mkfs.ext4dev -&gt; mke2fs<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Saving cca 1,5MB.<br>
&gt;<br>
&gt; Ping, this is needed also in fido and dizzy branches.<br>
<br>
</div></div>I&#39;m still hoping we can fix the packaging code so that we a=
void this<br>
problem with hardlinked files which is why I&#39;m holding off this<br>
slightly.<br>
<br>
Also, are you sure this problem applies in dizzy? The change the<br>
introduced this problem wasn&#39;t in dizzy as far as I remember but I coul=
d<br>
be wrong...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br></div>

--089e013c6be22a4bf00514381c78--
