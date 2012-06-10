Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdctB-0006F6-Tq
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jun 2012 09:48:46 +0200
Received: by eekd49 with SMTP id d49so1650818eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2012 00:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=0Fl6BhLkqJi3QCxPvmXdKhxG/hjqY+0mNE+PlEOVrdM=;
	b=B1/Rc+bQgbLfaybiT6n6utDEx18QQuopWl3LE+2cfTs0Vue+iaet8K0Hk9E+N8Vigt
	ed1RNRth8da9JpbmyDkKSgcnfo7Rs5b7rWJXGbxPSAUoU5nillssscerDWGGWsYU6PDu
	Qtxel/f7JDyJSaxdOivU08/Cyu6RdkS5RD/bqtYW78e+PXZg99Dh6oVg2eErllUYBcGa
	154sulUYbQcPqiy+la8WM1WCI2sDwri+kfH6syEMSJ4jTmVg0PEf2kn0rfA3BU2JbJkB
	RcPRj1khkblsEZFXYkmE3d2HdJHCGM4SAMR6nUPT8HJtGmpAnkAN2xame8O3UgzpC/pl
	f5kg==
Received: by 10.14.97.135 with SMTP id t7mr4863302eef.177.1339313893584; Sun,
	10 Jun 2012 00:38:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Sun, 10 Jun 2012 00:37:43 -0700 (PDT)
In-Reply-To: <9dabcaeee29d64ea4b0a8a5d0f4a42ec9369ee8c.1339035261.git.liezhi.yang@windriver.com>
References: <cover.1339035261.git.liezhi.yang@windriver.com>
	<9dabcaeee29d64ea4b0a8a5d0f4a42ec9369ee8c.1339035261.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Jun 2012 00:37:43 -0700
Message-ID: <CAMKF1soOGR4zEFO93Oc=uNHqyLXasVs2C3wdRThkwgqJ7=4ztg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/2] apt-get 0.7.14: hangs at runtime
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
X-List-Received-Date: Sun, 10 Jun 2012 07:48:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 11:33 PM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> This patch had a little problem, it made a infinite loop:
>
> for (K =3D CmdL.FileList + 1; *K !=3D 0; J++)
>

thats a typo. change J++ to K++ in above construct

> But the value of "K" will nerver change, so the apt-get hangs, revert
> this patch first, and will fix the problem in another patch.
>
> Note: Increment the PR from 11 to 12
>
> Revert "apt: Fix a latent bug exposed by gcc 4.7"

I dont think you have to revert it.

>
> This reverts commit 9d526462fe97564652771812ad1d363e9962b1e3.
>
> [YOCTO #2488]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0.../apt/apt-0.7.14/remove-redeclaration.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 57 --------------------
> =C2=A0meta/recipes-devtools/apt/apt_0.7.14.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +--
> =C2=A02 files changed, 2 insertions(+), 61 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-rede=
claration.patch
>
> diff --git a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.pa=
tch b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
> deleted file mode 100644
> index 68cb0b0..0000000
> --- a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Fix build errors
> -
> -deb/deblistparser.cc: In member function 'virtual short unsigned int deb=
ListParser::VersionHash()':
> -deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
> -deb/deblistparser.cc:202:22: error: 'const char** I' previously declared=
 here
> -
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Index: apt-0.7.14/apt-pkg/deb/deblistparser.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apt-0.7.14.orig/apt-pkg/deb/deblistparser.cc =C2=A0 =C2=A0 =C2=A0 20=
12-03-30 11:17:09.112456632 -0700
> -+++ apt-0.7.14/apt-pkg/deb/deblistparser.cc =C2=A0 =C2=A02012-03-30 11:2=
5:40.484481643 -0700
> -@@ -209,18 +209,18 @@
> - =C2=A0 =C2=A0 =C2=A0 /* Strip out any spaces from the text, this undoes=
 dpkgs reformatting
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of certain fields. dpkg also has the =
rather interesting notion of
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reformatting depends operators < -> <=
=3D */
> -- =C2=A0 =C2=A0 =C2=A0char *I =3D S;
> -+ =C2=A0 =C2=A0 =C2=A0char *J =3D S;
> - =C2=A0 =C2=A0 =C2=A0 for (; Start !=3D End; Start++)
> - =C2=A0 =C2=A0 =C2=A0 {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (isspace(*Start) =3D=3D 0)
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*I++ =3D tolower(*Start);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*J++ =3D tolower(*Start);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*Start =3D=3D '<' && Start[1] !=3D '<' &=
& Start[1] !=3D '=3D')
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*I++ =3D '=3D';
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*J++ =3D '=3D';
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*Start =3D=3D '>' && Start[1] !=3D '>' &=
& Start[1] !=3D '=3D')
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*I++ =3D '=3D';
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*J++ =3D '=3D';
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> -- =C2=A0 =C2=A0 =C2=A0Result =3D AddCRC16(Result,S,I - S);
> -+ =C2=A0 =C2=A0 =C2=A0Result =3D AddCRC16(Result,S,J - S);
> - =C2=A0 =C2=A0}
> -
> - =C2=A0 =C2=A0return Result;
> -Index: apt-0.7.14/cmdline/apt-get.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apt-0.7.14.orig/cmdline/apt-get.cc 2012-03-30 11:28:56.048490824 -07=
00
> -+++ apt-0.7.14/cmdline/apt-get.cc =C2=A0 =C2=A0 =C2=A02012-03-30 11:32:0=
0.248499740 -0700
> -@@ -1752,12 +1752,12 @@
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((*Cache)[I].Install() =3D=3D false)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
> -
> -- =C2=A0 =C2=A0 =C2=A0 const char **J;
> -- =C2=A0 =C2=A0 =C2=A0 for (J =3D CmdL.FileList + 1; *J !=3D 0; J++)
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(*J,I.Name()) =3D=3D 0)
> -+ =C2=A0 =C2=A0 =C2=A0 const char **K;
> -+ =C2=A0 =C2=A0 =C2=A0 for (K =3D CmdL.FileList + 1; *K !=3D 0; J++)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(*K,I.Name()) =3D=3D 0)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> -
> -- =C2=A0 =C2=A0 =C2=A0 if (*J =3D=3D 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 if (*K =3D=3D 0) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 List +=3D string(I.Name()) + " ";
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VersionsList +=3D string(Cache[I].Ca=
ndVersion) + "\n";
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devto=
ols/apt/apt_0.7.14.bb
> index 6354f8e..4055294 100644
> --- a/meta/recipes-devtools/apt/apt_0.7.14.bb
> +++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
> @@ -3,12 +3,10 @@ RDEPENDS_${PN} =3D "dpkg"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D0636e73ff0215e8d672d=
c4c32c317bb3"
> =C2=A0require apt.inc
>
> -PR =3D "r11"
> +PR =3D "r12"
>
> =C2=A0SRC_URI +=3D "file://nodoc.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://includes-fix.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://remove-redeclaration.pa=
tch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://includes-fix.patch "
>
> =C2=A0SRC_URI[md5sum] =3D "19efa18fb1ef20c58b9b44e94258b814"
> =C2=A0SRC_URI[sha256sum] =3D "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e92=
4210f151dfc076bcd4045"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


