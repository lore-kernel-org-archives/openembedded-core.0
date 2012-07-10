Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoPa7-0006vG-5y
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 03:49:43 +0200
Received: by eaal1 with SMTP id l1so4251783eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 18:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=rGGsg2yRagsIdTlj3EYbNJ1gVcRIT3FqWNxHqC1xXsE=;
	b=OVW/Xn6hewjRPMPOankTXbVJa1OKxKjAvhlp8CcVp1Fon7wV5IZySae+O49U/FRGv1
	U7qbrRBgWnunu7jwb0Sgp2Kc3K0qmIF/ZyLAblj8S5bahKqUowVJtNplKEm8z6y5kFMp
	EsXtW60Iq6Vej2Yhh0y6ElBYhzdS3fWEqCQ4b85cwZaVK2/mGhcGium9XuP9JzwLmpcT
	MxyiS7CvukOOTSiQpoF9Bn6Y44QKRPye6lGnaQhhNeo4ndcI7KqPP2yEmem4xgKEJe/9
	1OaJMg6fgrtPai7jMGcNPLIrWqVVN9Gd90/aeg7W1i5dGLv2ssv0QYRkPhJ9/G+9VkW6
	+QsA==
Received: by 10.14.37.76 with SMTP id x52mr4302532eea.102.1341884296200; Mon,
	09 Jul 2012 18:38:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 18:37:46 -0700 (PDT)
In-Reply-To: <1341874044-663-1-git-send-email-msm@freescale.com>
References: <1341874044-663-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 18:37:46 -0700
Message-ID: <CAMKF1sp1n_3bXro1VWu=ziq+yMYJ18xvPYVMt9fKXo3ThZ9LHg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: gcc-cross-canadian: use correct location for libraries for powerpc64
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
X-List-Received-Date: Tue, 10 Jul 2012 01:49:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 3:47 PM, Matthew McClintock <msm@freescale.com> wrote:
> This fixes the issue where gcc invokes the linker with an incorrect -L
> library location and gives up because it can't find libraries. It was
> looking in a /lib folder instead of /lib64
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
>  meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 65153b3..c7dbc3c 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>
> -PR = "r2"
> +PR = "r3"
>
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.7.1
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> index efa345f..48b9b13 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> @@ -11,6 +11,8 @@ RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
>  SYSTEMHEADERS = "/usr/include"
>  SYSTEMLIBS = "/lib/"
>  SYSTEMLIBS1 = "/usr/lib/"
> +SYSTEMLIBS_powerpc64 = "/lib64/"
> +SYSTEMLIBS1_powerpc64 = "/usr/lib64/"

How about using

SYSTEMLIBS = "${target_base_libdir}/"
SYSTEMLIBS1 = "${target_libdir}/"

and avoiding the override completely ?


