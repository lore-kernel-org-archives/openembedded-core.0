Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGEbF-0005xr-5J
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 20:41:17 +0200
Received: by bkat8 with SMTP id t8so1254890bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 11:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=eXzm1q4Oa39OnNsPfpygw5v2oeqQdnc63PqMVBwGbwg=;
	b=iupiRkpXecBI2VCmyzy0RYgWBwEJXyYoS6LAQ0vjIzNKhXj6TNdQTRoWA/uJ1rPYc8
	d0myz97R0hIqOdCwmL1BDLbM0vcgnkAmYFPKCCelV10i3tlonhWdPnHNe5ybClCm8Q7L
	5RRlhhxXhG5uKA/LMMWRcULg6QWoKFPdShKr0=
Received: by 10.204.154.209 with SMTP id p17mr2770147bkw.20.1318962927083;
	Tue, 18 Oct 2011 11:35:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm3138717bks.11.2011.10.18.11.35.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 11:35:26 -0700 (PDT)
Date: Tue, 18 Oct 2011 20:35:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111018183520.GB556@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Race condition or something when fetching local files?
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
X-List-Received-Date: Tue, 18 Oct 2011 18:41:17 -0000
X-Groupsio-MsgNum: 11162
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have noticed that even local patches are stored in downloads dir,=20
but today I've noticed that wrong file was used later in do_patch.
I have latest oe-core/meta-oe + latest bitbake.

Pulseaudio was building here for first time

downloads/buildfix.patch is from previous build of xf86-video-intel-2.16.0
$ head downloads/buildfix.patch
Newer mesa doesn't provide dri support, just dri2. The intel driver
=2E..

pulseaudio has right one:
 $ head /OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/p=
ulseaudio-0.9.23/buildfix.patch
Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>

Upstream-Status: Pending

Index: pulseaudio-0.9.11/src/pulsecore/atomic.h
=2E..

but while building pulseaudio it's using wrong downloads/buildfix.patch

$ bitbake -e -b /OE/shr-core/openembedded-core/meta/recipes-multimedia/puls=
eaudio/pulseaudio_0.9.23.bb | grep ^FILESPATH | sed "s/:/\n/"
FILESPATH=3D"/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseau=
dio/pulseaudio-0.9.23-r5/linux-gnueabi
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/arm
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/build-linux
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/pn-pulseaudio
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/nokia900
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/shr
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/forcevariable
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/libc-glibc
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23-r5/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/linux-gnueabi
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/arm
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/build-linux
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/pn-pulseaudio
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/nokia900
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/shr
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/forcevariable
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/libc-glibc
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/linux-gnueabi
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/arm
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/build-linux
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/pn-pulseaudio
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/nokia900
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/shr
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/forcevariable
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/libc-glibc
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/linux-gnueabi
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/arm
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/build-linux
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/pn-pulseaudio
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/nokia900
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/shr
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/forcevariable
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/libc-glibc
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o-0.9.23/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/linux-gnueabi
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/arm
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/build-linux
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/pn-pulseaudio
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/nokia900
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/shr
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/forcevariable
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/libc-glibc
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudi=
o/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/lin=
ux-gnueabi
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/arm
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/bui=
ld-linux
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/pn-=
pulseaudio
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/nok=
ia900
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/shr
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/for=
cevariable
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/lib=
c-glibc
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/files/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/linux-gnu=
eabi
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/arm
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/build-lin=
ux
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/pn-pulsea=
udio
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/nokia900
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/shr
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/forcevari=
able
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/libc-glibc
/OE/shr-core/openembedded-core/meta/recipes-multimedia/pulseaudio/"

-c cleansstate doesn't help

rm -rf downloads/buildfix.patch* and probably also -c cleanall _does_ help =
and do_patch finished now OK.


log from first build:
NOTE: Running task 6777 of 7835 (ID: 6734, /OE/shr-core/openembedded-core/m=
eta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb, do_fetch)
NOTE: package pulseaudio-0.9.23-r5: task do_fetch: Started
NOTE: package pulseaudio-0.9.23-r5: task do_fetch: Succeeded
NOTE: Running task 6778 of 7835 (ID: 6730, /OE/shr-core/openembedded-core/m=
eta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb, do_unpack)
NOTE: package pulseaudio-0.9.23-r5: task do_unpack: Started
NOTE: package pulseaudio-0.9.23-r5: task do_unpack: Succeeded
NOTE: Running task 6779 of 7835 (ID: 6731, /OE/shr-core/openembedded-core/m=
eta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb, do_patch)
NOTE: package pulseaudio-0.9.23-r5: task do_patch: Started
ERROR: Error executing a python function in /OE/shr-core/openembedded-core/=
meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb:
CmdError: Command Error: exit status: 1  Output:
Applying patch buildfix.patch
can't find file to patch at input line 13
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Newer mesa doesn't provide dri support, just dri2. The intel driver
|hasn't quite caught up and whilst the configure checks work, the
|global includes have not and need manually tweaking.
|
|RP 2011/10/12
|
|Upstream Status: Superceeded
|
|Index: xf86-video-intel-2.16.0/src/intel.h
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|--- xf86-video-intel-2.16.0.orig/src/intel.h   2011-10-12 20:36:18.5871879=
94 +0100
|+++ xf86-video-intel-2.16.0/src/intel.h        2011-10-12 20:36:30.7171880=
11 +0100
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch buildfix.patch does not apply (enforce with -f)

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "patch_do_patch", line 136, in <module>
ERROR:
ERROR:   File "patch_do_patch", line 133, in patch_do_patch
ERROR:
ERROR:   File "/OE/shr-core/openembedded-core/meta/lib/oe/patch.py", line 3=
38, in Resolve
ERROR:     raise sys.exc_value
ERROR:
ERROR: The code that was being executed was:
ERROR:      0132:                       raise bb.build.FuncFailed(str(sys.e=
xc_value))
ERROR:      0133:               resolver.Resolve()
ERROR:      0134:
ERROR:      0135:
ERROR:  *** 0136:patch_do_patch(d)
ERROR:      0137:
ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
ERROR:      0129:                       patchset.Import({"file":local, "rem=
ote":url, "strippath": striplevel}, True)
ERROR:      0130:               except Exception:
ERROR:      0131:                       import sys
ERROR:      0132:                       raise bb.build.FuncFailed(str(sys.e=
xc_value))
ERROR:  *** 0133:               resolver.Resolve()
ERROR:      0134:
ERROR:      0135:
ERROR:      0136:patch_do_patch(d)
ERROR:      0137:
ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
ERROR: Function 'patch_do_patch' failed
ERROR: Logfile of failure stored in: /OE/shr-core/tmp/work/armv7a-vfp-neon-=
oe-linux-gnueabi/pulseaudio-0.9.23-r5/temp/log.do_patch.28119


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6dxucACgkQN1Ujt2V2gBwb6wCggrpAfAZWGe7ByaPKKxLSuXCA
RvUAn1+eUCE4xclK/st+gQV0k68BkO3I
=ldAx
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
