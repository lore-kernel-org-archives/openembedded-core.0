Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Seoep-00031T-Bp
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 16:34:51 +0200
Received: by eaal1 with SMTP id l1so238955eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ondqsOUKUf2kJywjYBjX95McqGlwNBYs5B8utzs2FnE=;
	b=rCw3cudZ4ruC6AJg2aBW78R2XRg/6UQJ5g3UULmS4Q+g6+sO+y/6KPSNovwmUlRoH2
	E+NgvfXksjaZiAIiSxDOqzDmVe/Td0E493HqevFazlzRYWSuDjF0BTuKFQxviiu4RSUY
	8cgzAox+9gNZgq2AY2xZJgL4itgIg5TB2dCjDODkMeBeewa9t5mjES0pcg1Gu8YPz9W3
	ck+Qh0nube5bUKPs3ZfkjnP6x+wOlyr6R5UDnaFHxQAw6GAUwpEPrM0L/OnhOhVOQz7A
	nYJGn2fNkVfExuF3Sayw/ST0S1A4x+rdf51q+eRzoVWLBgV9Vqe9hqZbVfVOtAaegyQU
	5Rqw==
Received: by 10.14.119.197 with SMTP id n45mr7523905eeh.180.1339597455322;
	Wed, 13 Jun 2012 07:24:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 13 Jun 2012 07:23:44 -0700 (PDT)
In-Reply-To: <383a2fd8ee2090cddea30dc5a825d3983780298b.1339568577.git.liezhi.yang@windriver.com>
References: <cover.1339568577.git.liezhi.yang@windriver.com>
	<383a2fd8ee2090cddea30dc5a825d3983780298b.1339568577.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jun 2012 07:23:44 -0700
Message-ID: <CAMKF1soaKgna7bFFrfC5gS47Mk6DvOmEkf6jQx99SQjsOfKOzA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] gcc-cross: argument list too long when do_install
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
X-List-Received-Date: Wed, 13 Jun 2012 14:34:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2012 at 1:27 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> There would be an "Argument list too long" error when the length of
> tmpdir is longer than 190, this is caused by:
>
> headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
>
> The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
> it, use the $(sort list) of GNU make which can handle the too long list
> would fix the problem, the header would be short enough after sorted.
> The "tr ' ' '\012'" was used for translating the space to "\n", the
> $(sort list) doesn't need this.
>
> This doesn't impact the output, so it doesn't need the PR bump.
>
> [YOCTO #2591]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-common.inc | =C2=A0 =C2=A04 ++++
> =C2=A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
> index 45828bb..c3b79ab 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -102,6 +102,10 @@ do_headerfix () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i ${S}/gcc/config/*/linux*.h -e \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0's#\(GLIBC_DYNAMIC=
_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
> +
> + =C2=A0 =C2=A0 =C2=A0 # Fix the "Argument list too long" error
> + =C2=A0 =C2=A0 =C2=A0 sed -i ${S}/gcc/Makefile.in -e \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 's#headers=3D`echo $(P=
LUGIN_HEADERS) | tr .*012.* | sort -u`#headers=3D\"$(sort $(PLUGIN_HEADERS)=
)\"#'
> =C2=A0}
>

can it be created as a patch? gcc recipes are getting complex already

> =C2=A0addtask headerfix after do_unpack before do_patch
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


