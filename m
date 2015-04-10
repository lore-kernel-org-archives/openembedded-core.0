Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1C18965C98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 15:37:55 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so21650491wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TBtxQC4PqrwtQBfj2aZ5JwMqYyPzb3/PtJh9fgYRkd4=;
	b=FyTwXwPZ9rnZRYXiWOCcO13UzM3A80IKM4rOQ8LlRSRi4WhILA+/6pJxmE+if5TPVd
	RNYcqVOsfs3T/1TfRTDRCQClDXd3OpskRGLdke7bTXqqInqQgyIMQcsOJnyE8YUrbcI2
	t6fkVXFN+7livkKmAe88S5S8yoWiRqCtQgF5lOApy6rQpWz4ymx6ohNhOn3YgaFyNv06
	NBR9xRYZ8sPqU0hyzw5R1Rt+Jg40jp6014eiYQVuxlVM4dR4IVA9ir+VJG9wN5DKz5sg
	qQevTtmqYv/lPZevNWUPrtT0M9QCiFBGCEXpGxKCFr0cKERKqN48Zn8CC0RRHplG/ahQ
	Hyww==
X-Received: by 10.180.84.97 with SMTP id x1mr5824220wiy.1.1428680275953;
	Fri, 10 Apr 2015 08:37:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id o5sm4220051wia.0.2015.04.10.08.37.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 08:37:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Apr 2015 17:38:08 +0200
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20150410153808.GA2338@jama>
References: <1428674774-29364-1-git-send-email-Martin.Jansa@gmail.com>
	<5527E5CE.7050706@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5527E5CE.7050706@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 10 Apr 2015 15:37:57 -0000
X-Groupsio-MsgNum: 64240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 10:01:34AM -0500, Mark Hatle wrote:
> I'm a bit confused by this.  Why is symlink saving space over hardlink?
>=20
> The hardlinked items should retain their hard link status through the pac=
kaging
> and into the image.  If not, it sounds like there is a bug in the packagi=
ng
> mechanism you are using (opkg, deb, rpm?) and/or the image generation.

Yes there is bug in package.py:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7586

> And just because 'ls' shows the sizes, the fact they are hard linked means
> they're not taking up duplicate space.

I know what hardlink is, but if you read the message carefully then
you'll see that without this change we're installing 1 stripped binary
and one unstripped with 3 hardlinks and I don't want any unstripped
binaries in my small recovery rootfs. Symlinks help with that until
package.py is fixed.

> I know there is a lot more then just e2fsprogs that does a hard link vs s=
ymlinks
> for various command, which is why I'm trying to understand where we might=
 have a
> problem.

Yes package.py still needs to be fixed to fix other recipes as well,
this one was just most important for me, because our rootfs doesn't fit
into recovery partition since upgrade to Dizzy.

Cheers,

> On 4/10/15 9:06 AM, Martin Jansa wrote:
> > * install populate-extfs.sh from contrib, be aware that in order
> >   to use it you need to set DEBUGFS shell variable, otherwise it will
> >   try to use debugfs from relative path which is almost always
> >   incorrect:
> >     CONTRIB_DIR=3D$(dirname $(readlink -f $0))
> >     DEBUGFS=3D"$CONTRIB_DIR/../debugfs/debugfs"
> >=20
> > * use symlinks to install e2fsck, mke2fs, without this option we have:
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-=
r0/image/sbin/
> >   ...
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 e2fsck
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
> >   101982430 -rwxr-xr-x 5 bitbake bitbake 972K Apr 10 15:43 fsck.ext4dev
> >   ...
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mke2fs
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext3
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
> >   101982441 -rwxr-xr-x 5 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
> >   ...
> >=20
> >   which would be OK, because they are hadlinks, but after runstrip in
> >   do_package we get one stripped binary and 4 hardlinks to the original
> >   one:
> >=20
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-=
r0/packages-split/e2fsprogs-e2fsck/sbin
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 e2fsck
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext2
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext3
> >   101982713 -rwxr-xr-x 8 bitbake bitbake 972K Apr 10 15:43 fsck.ext4
> >   101983136 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:43 fsck.ext4dev
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-=
r0/packages-split/e2fsprogs-mke2fs/sbin/
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mke2fs
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext2
> >   101988266 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:43 mkfs.ext3
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4
> >   101982716 -rwxr-xr-x 8 bitbake bitbake 348K Apr 10 15:43 mkfs.ext4dev
> >=20
> >   That's super annoying for big files like this which are often include
> >   in small recovery images. Using --enable-symlink-install option resul=
ts
> >   in one stripped binary and 4 symlinks:
> >=20
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-=
r0/packages-split/e2fsprogs-e2fsck/sbin/
> >   102113806 -rwxr-xr-x 2 bitbake bitbake 185K Apr 10 15:50 e2fsck
> >   102113813 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext2 ->=
 e2fsck
> >   102113814 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext3 ->=
 e2fsck
> >   102113812 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4 ->=
 e2fsck
> >   102113815 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 fsck.ext4dev=
 -> e2fsck
> >   $ ls -lahi tmp-glibc/work/arm920tt-oe-linux-gnueabi/e2fsprogs/1.42.9-=
r0/packages-split/e2fsprogs-mke2fs/sbin/
> >   102113804 -rwxr-xr-x 2 bitbake bitbake  72K Apr 10 15:50 mke2fs
> >   102113825 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext2 ->=
 mke2fs
> >   102113826 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext3 ->=
 mke2fs
> >   102113823 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4 ->=
 mke2fs
> >   102113824 lrwxrwxrwx 1 bitbake bitbake    6 Apr 10 15:50 mkfs.ext4dev=
 -> mke2fs
> >=20
> >   Saving cca 1,5MB.
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta=
/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> > index 66065bc..95b4550 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> > @@ -26,7 +26,7 @@ SRC_URI +=3D "file://acinclude.m4 \
> >  SRC_URI[md5sum] =3D "3f8e41e63b432ba114b33f58674563f7"
> >  SRC_URI[sha256sum] =3D "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad=
1241d82f2d041f2802"
> > =20
> > -EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbindi=
r} --enable-elf-shlibs --disable-libuuid --disable-uuidd --enable-verbose-m=
akecmds"
> > +EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbindi=
r} --enable-elf-shlibs --disable-libuuid --disable-uuidd --enable-verbose-m=
akecmds --enable-symlink-install"
> >  EXTRA_OECONF_darwin =3D "--libdir=3D${base_libdir} --sbindir=3D${base_=
sbindir} --enable-bsd-shlibs"
> > =20
> >  do_configure_prepend () {
> > @@ -54,6 +54,8 @@ do_install () {
> >  	oe_multilib_header ext2fs/ext2_types.h
> >  	install -d ${D}${base_bindir}
> >  	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
> > +
> > +	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
> >  }
> > =20
> >  do_install_append_class-target() {
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUn7mAACgkQN1Ujt2V2gBxsyQCgmBmzqrvh709JhAJolrXXPbyW
0R8AoKeI99vqD2cgsSWy5oxlSjYxXKqI
=31+g
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
