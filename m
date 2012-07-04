Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmJNI-0003Iw-Bc
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 08:47:44 +0200
Received: by eaal1 with SMTP id l1so2765487eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pBiWCnhVdb3KGVSAqOGkwv+cwyJwX041peujl9vGGzM=;
	b=pNMBtQY1ajex4dmisi1NNgXXWKcxCImczNSQgBz90dKgpY/JwkVX2eMkhHTAVHJeC6
	rtRPph8uL0NkDMxyuvH7O3V6DgqLw3jXNe/qUpvIvwn5QSSGFBwtrsxh03wqlfImM05W
	DB014B2+jKfjGTtGPXHe60+JhBLbdo/T+rXQsAtqa3AqC5BeXjmofmeFXx+SKVO59Mlh
	VwJRpPuwEvfQas1NLxSynGO5rRcEyUpME3HMtFive0Y10/P6gsjCNcKa5QlkVEEjiQA9
	+h5GqLzssAZih9EZhNZDJ0d0+bMcql1gVnGdNhVjHcYA3SH4odFqfW2lr9znctO4M3Yb
	EqJw==
Received: by 10.14.37.76 with SMTP id x52mr5124687eea.102.1341383801767; Tue,
	03 Jul 2012 23:36:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Tue, 3 Jul 2012 23:36:11 -0700 (PDT)
In-Reply-To: <1341372067-24821-1-git-send-email-kartikmohta@gmail.com>
References: <1341372067-24821-1-git-send-email-kartikmohta@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jul 2012 23:36:11 -0700
Message-ID: <CAMKF1sptHs55NFdP4GBxQZL6tmaRWWTUtEwVjNju4KyfNcpvEA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-common: Don't use "is" for comparing strings, use "=="
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
X-List-Received-Date: Wed, 04 Jul 2012 06:47:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 3, 2012 at 8:21 PM, Kartik Mohta <kartikmohta@gmail.com> wrote:
> Needed because the equality check was failing here even though upon
> printing the LHS and RHS were the same.
> As per http://stackoverflow.com/a/2987975/64537, using "is" compares the
> memory addresses of the two objects which is not what we want here. We
> just want to compare the values.

indeed. This looks ok

>
> Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index 45828bb..0a9324a 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -10,7 +10,7 @@ inherit autotools gettext
>  FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/gcc-${PV}"
>
>  def get_gcc_fpu_setting(bb, d):
> -    if d.getVar('ARMPKGSFX_EABI', True) is "hf" and  d.getVar('TRANSLATED_TARGET_ARCH', True) is "arm":
> +    if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
>          return "--with-float=hard"
>      if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
>          return "--with-float=soft"
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


