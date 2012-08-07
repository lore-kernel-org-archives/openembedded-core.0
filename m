Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1Syd0y-0006P9-0T
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 08:11:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q775xmOV010459
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 22:59:48 -0700 (PDT)
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 6 Aug 2012 22:59:48 -0700
Message-ID: <5020AED3.1020406@windriver.com>
Date: Tue, 7 Aug 2012 13:59:47 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <501FBD86.3090705@windriver.com>
In-Reply-To: <501FBD86.3090705@windriver.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q775xmOV010459
Cc: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
Subject: Re: Could we build tar-replacement firstly and not parallel if tar-replacement is needed to build
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
X-List-Received-Date: Tue, 07 Aug 2012 06:11:36 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Paste a RFC PATCH

[RFC PATCH 1/1] bitbake: compile tar-replacement firstly, and not paralle=
l

Compiling tar-replacement or not is decided by version of host tar,
if the host tar version is lower than 1.23, Compiling tar-replacement
is needed.

When doing popoluate tar-replacement sysroot to write the tar to
sysroot, but writing is not finished. other packages probably
use the being written tar to unzip file, which will lead to failure
and report the below error:
"bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy "

Now we compile tar-replacement firstly and not parallel to ensure
that a being written tar command will not be used.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
  scripts/bitbake |   14 +++++++++++++-
  1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 3772d82..eb6b144 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -134,7 +134,19 @@ if [ $buildpseudo -gt 0 ]; then
              fi
          done
      done
-    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
+
+    if [ $needtar =3D "1" ]; then
+       NUM_THREAD_LINE=3D`grep -n "^\s*BB_NUMBER_THREADS" conf/local.con=
f=20
|awk -F':' '{print $1}'`
+	test -n "$NUM_THREAD_LINE" &&
+	sed -i ''"$NUM_THREAD_LINE"'s/^\s*BB_NUMBER_THREADS/#\0/g' conf/local.c=
onf
+
+	bitbake $TARTARGET -c populate_sysroot
+
+	test -n "$NUM_THREAD_LINE" &&
+	sed -i=20
''"$NUM_THREAD_LINE"'s/^#\s*BB_NUMBER_THREADS/BB_NUMBER_THREADS/g'=20
conf/local.conf
+    fi
+
+    bitbake pseudo-native $additionalopts -c populate_sysroot
      ret=3D$?
      if [ "$ret" !=3D "0" ]; then
          exit 1
--=20
1.7.4.1


On 2012=E5=B9=B408=E6=9C=8806=E6=97=A5 20:50, Rongqing Li wrote:
> Hi:
>
> Building failed several times when building tar-replacement-native is
> needed,
> The error log shows
> "bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text
> file busy". this log proves "an attempt was made to execute a
> pure-procedure
> program that is currently open for writing."
>
>
> Before this error, tar-replacement do_populate_sysroot just starts,
> (tar-replacement-native-1.26-r2: task do_populate_sysroot: Started)
> After this error, we see tar-replacement do_populate_sysroot just
> finish.
>
> So I think the root cause is that do_populate_sysroot sqlite is using
> a tar command which being opened to written. in fact, all packages
> need tar to do_popolate_sysroot()
>
> I see building tar-replacement-native is started in bitbake file,
> could we build tar-replacement firstly, not parallel if needed.
>
>
>
> diff --git a/scripts/bitbake b/scripts/bitbake
> index 3772d82..1bb8fed 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -134,7 +134,10 @@ if [ $buildpseudo -gt 0 ]; then
>               fi
>           done
>       done
> -    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysro=
ot
> +
> +    if [ $needptar =3D "1" ]; then
> +       sed -i 's/BB_NUMBER_THREADS =3D/#BB_NUMBER_THREADS =3D/g'
> conf/local.conf
> +       bitbake $TARTARGET
> +       sed -i 's/#BB_NUMBER_THREADS =3D/BB_NUMBER_THREADS =3D/g'
> conf/local.conf
> +    fi
> +
> +    bitbake pseudo-native $additionalopts -c populate_sysroot
>       ret=3D$?
>       if [ "$ret" !=3D "0" ]; then
>           exit 1
>
>
> since building tar-replacement or not depends on host tar version, it i=
s
> hard to add a tar dependence to any package, and I did not have a good =
way
> to fix this bug except the upper.
>
> Any advice and suggestion are welcome
>
>

--=20
Best Reagrds,
Roy | RongQing Li




