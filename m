Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8E96460043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 16:15:46 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so58406735igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mhhNfJXyeRisavbL3ab4NvEhsTJMLAO4hGvdYbCmWyc=;
	b=Bpcx9AZURn1Iid0Cql70Hm3N4pIkX1aMGaL9L85TIREAuTJ9LHQQQRnjakaAk75Zyi
	vK9L5Oh7FUL10k3zIzZ5L15tNSvpz38JSmwueAGP3gPYXR0dL1sdRO+lOfczzQKNbVIy
	Y0bx/LZRXg6jQEl6YZS4xHPaKv79Z0jSlIhrGwpr+DOvpB+cQ/Kgd0Su7gSTGBeg4Fnb
	kGYPqAIwjwajh3RJmM73kSg6K5ITmlZBKO/nkywc8JDzvOrDlM1BC2xrJj9Fp2CRoxQ3
	EULXX/+KZb8pmwtYEc+6LdsVMXd5gaJ7JG/Q92WrPA/wDsiyiP7eHAPYYzCri45/CRBr
	mKqA==
X-Received: by 10.50.93.69 with SMTP id cs5mr9984477igb.4.1431274544568; Sun,
	10 May 2015 09:15:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Sun, 10 May 2015 09:15:14 -0700 (PDT)
In-Reply-To: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 May 2015 09:15:14 -0700
Message-ID: <CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Sun, 10 May 2015 16:15:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 10, 2015 at 7:28 AM, Armin Kuster <akuster808@gmail.com> wrote:
> | tset.o:(.debug_loc+0xe8): undefined reference to `.LCL0'
> | tset.o:(.debug_loc+0xf7): undefined reference to `.LCL0'
>
> thanks Khem
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.14.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> index 03a24f0..22b111a 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> @@ -110,6 +110,9 @@ inherit autotools gettext
>
>  acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
>
> +FULL_OPTIMIZATION_powerpc_remove = "-O2"
> +FULL_OPTIMIZATION_append_powerpc = " -Os "
> +

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=741d3bf91144973d26de647039fa60b87a09edf1
fixes same issue for libx11

I am wondering if we should make this change in some common config
metadata file to list all recipes that need this workaround
untill gcc is fixed for it may be arch-powerpc.inc, since then it will
be easy to remember to unbolt them once gcc is fixed.

>  # Specify the default rpm macros in terms of adjustable variables
>  rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
>  rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

