Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SU46n-0005Dc-9V
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:51:17 +0200
Received: by wgbdr1 with SMTP id dr1so4638584wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 15:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=vHQzgi2RyVqk9F7ZlmduzgCvu8StULcv6bnC5M3WsxE=;
	b=zXJH1dbyOzcEc3su0fOHNTruEq1cZJgQBDvoNTgKyP0ZpZFiG++vvc7Rkr2A2EBQWC
	2D/9H6E0eychfLuQWjD6LeHF8qzkf78jyOkLuYi8swM8aDplRkUFxtAoqwOa5eqdcbRF
	YapPMyaaqWSwx0CBaierfsXFd5K+meE7YCIIy2UpV56u1+zxnN2yMaa/Hfmf5/vm6cEK
	u4JKaqe60zZ2xarj2kWHatCnuF6VvUd9FfH+jbfFcpSl2+bGZoJcSMJPfUs6C606DzZP
	XwQVdi2d+w8A8yo16jbmd4fZpuFFog/H2IuHGPhvse0yawDrKAmdPL9iOHBQUW1AdMdC
	Onow==
Received: by 10.180.106.9 with SMTP id gq9mr2252819wib.17.1337035278056; Mon,
	14 May 2012 15:41:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.175 with HTTP; Mon, 14 May 2012 15:40:47 -0700 (PDT)
In-Reply-To: <4FB18881.80702@windriver.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<4FA8611B.8060609@intel.com> <20120508020738.46574fa5@wrlaptop>
	<4FB18881.80702@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 May 2012 15:40:47 -0700
Message-ID: <CAMKF1spwcFM0m5vrznvb9M_P7WF93rtWwyFQ3418b8NLYebfPg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Mon, 14 May 2012 22:51:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 3:34 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -300,14 +300,16 @@ findimage() {
> =C2=A0 =C2=A0 # recently created one is the one we most likely want to bo=
ot.
> =C2=A0 =C2=A0 filenames=3D`ls -t $where/*-image*$machine.$extension 2>/de=
v/null | xargs`
> =C2=A0 =C2=A0 for name in $filenames; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "$name" =3D~ core-image-sato-sdk -o \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"$name" =3D~ core-image=
-sato =C2=A0 =C2=A0 -o \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"$name" =3D~ core-image=
-lsb =C2=A0 =C2=A0 =C2=A0-o \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"$name" =3D~ core-image=
-basic =C2=A0 =C2=A0-o \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"$name" =3D~ core-image=
-minimal ]; then
> + =C2=A0 =C2=A0 =C2=A0 case $name in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*core-image-sato-sdk* | \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*core-image-sato* | \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*core-image-lsb* | \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*core-image-basic* | \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*core-image-minimal*)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ROOTFS=3D$name
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> + =C2=A0 =C2=A0 =C2=A0 esac
> =C2=A0 =C2=A0 done
>
> =C2=A0 =C2=A0 echo "Couldn't find a $machine rootfs image in $where."

thats a better thing can you formulate it into a patch please.


