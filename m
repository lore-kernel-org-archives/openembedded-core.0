Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCIgP-0008Ns-TC
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 00:46:37 +0200
Received: by lagw12 with SMTP id w12so4251302lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Hcw2+irlsSub6VY2SQqY4fsIOMy/WmA5hZHAV1qp0Ak=;
	b=GW1L2qhmwkARPXilmmOH79WIPSw9zE220wAcNqu+XNxjzGTtAzkGakSYdoDamQ5Q18
	wJFSrQkfNmGuM+cEjlhqPpjvbWjxsUcRuToIKNhvWaVrorl/UgDz93SxM7TIgslJvKIM
	1VWt8P8TEXyQck5B1SLHxPmkJcqBowHg24sSxRb1Y7WJsoIDjtkoybRtp1Z/kiKXfPuM
	7YY2+7GERSn6ZAnoo7acSpHuegmWuFUtjoS1KWUOpTRaUqOycx08K38ew78Gu6oNCZn6
	WJsJlT4BNX12m3kGFpt0PJ3ANdM7PhTwsfxmsXb6IIrj72u0eibmZ48Q7tV5AIwPd7a6
	6j2g==
Received: by 10.152.113.229 with SMTP id jb5mr17250026lab.45.1332801457547;
	Mon, 26 Mar 2012 15:37:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Mon, 26 Mar 2012 15:37:07 -0700 (PDT)
In-Reply-To: <69175f6050af8983d9ab9781c01fe4bb29168a3b.1332745722.git.lianhao.lu@intel.com>
References: <cover.1332745722.git.lianhao.lu@intel.com>
	<69175f6050af8983d9ab9781c01fe4bb29168a3b.1332745722.git.lianhao.lu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Mar 2012 15:37:07 -0700
Message-ID: <CAMKF1soVQ2nWXrAOo-sxD9g+Qg7Gu21S+GAOTBGpRgDOQb8KGw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-cross-canadian: Fixed packaging warnings.
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
X-List-Received-Date: Mon, 26 Mar 2012 22:46:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 12:10 AM, Lianhao Lu <lianhao.lu@intel.com> wrote:
> Removed non-shipped empty directories:
> =C2=A0-${prefix}/${TARGET_SYS}
> =C2=A0-${libdir}/../lib
> =C2=A0-${prefix}/include
>
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-package-sdk.inc | =C2=A0 =C2=A07 ++++=
+++
> =C2=A01 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes=
-devtools/gcc/gcc-package-sdk.inc
> index e2095e3..95d6804 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
> @@ -46,6 +46,13 @@ do_install () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${libdir}/../lib/libiberty.a
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${libdir}/libiberty.a
>
> + =C2=A0 =C2=A0 =C2=A0 # Cleanup empty directories which are not shipped
> + =C2=A0 =C2=A0 =C2=A0 # we use rmdir instead of 'rm -f' to ensure the di=
rectories are empty

what if the directories don't exist at all ? then you break the build
unnecessarily.

> + =C2=A0 =C2=A0 =C2=A0 rmdir ${D}${libdir}/../lib
> + =C2=A0 =C2=A0 =C2=A0 rmdir ${D}${prefix}/${TARGET_SYS}/lib
> + =C2=A0 =C2=A0 =C2=A0 rmdir ${D}${prefix}/${TARGET_SYS}
> + =C2=A0 =C2=A0 =C2=A0 rmdir ${D}${includedir}
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Insert symlinks into libexec so when tools w=
ithout a prefix are searched for, the correct ones are
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# found.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dest=3D${D}${libexecdir}/gcc/${TARGET_SYS}/${B=
INV}/
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


