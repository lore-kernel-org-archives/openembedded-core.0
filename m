Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 40A30610FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:45:55 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id tp5so1146366ieb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aC9YNhzPfHihIKqPoGyQQtbEb19pRShR379BM5NNnk8=;
	b=Zdc8hiNU2z6Fs4OxATtOoH9snTQSpxZMDXYGr0VLWHLeF9j7C7P0ZTRSmTsssHUG9V
	BJ6Ws2IAtD+8ZN9w3looUKbt6aRKfGdJKPNmZXjiY+ViqW4go/Y8+FL6E0cv8YjuCDVo
	rE1TBTcVW3RB5CtCehjTCF0nbWPSbUGqJV5e+mrnWEUomIP8wLpXmQ/hZkyPaa0onvoh
	hvD/RDAtSFy5lwRsiCMfbg4zhglF29WJExWS715j4OlQWJymx9lx7S9DilKhS/fWnosO
	UGj/BScBzCEY3Ld86060f/P6E5a3G7osSSBVLEjvo0pVOJy2gbMDPh7qG5mU7vCln7RM
	+1KQ==
X-Received: by 10.43.77.212 with SMTP id zj20mr23785524icb.5.1381848356686;
	Tue, 15 Oct 2013 07:45:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.5.225 with HTTP; Tue, 15 Oct 2013 07:45:26 -0700 (PDT)
In-Reply-To: <1381844435.29912.422.camel@ted>
References: <1381844435.29912.422.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2013 07:45:26 -0700
Message-ID: <CAMKF1sr=L9W+T1izdxJGRznd3BnZLYW58qPs0y5EnRkETZp68A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross-canadian: Fix SHLIBSDIR when using multilib
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
X-List-Received-Date: Tue, 15 Oct 2013 14:45:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 15, 2013 at 6:40 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Both nativesdk and multilib use MLPREFIX for their partciular purposes. When
> we have both set, cross-canadian can confuse SHLIBSDIR. This forces the
> variable to the correct value for cross-canadian, fixing toolchains in
> multilib builds.
>
> [YOCTO #5333]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
> index 4387d05..7181c60 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -95,3 +95,8 @@ USE_NLS = "${SDKUSE_NLS}"
>  # We have to us TARGET_ARCH but we care about the absolute value
>  # and not any particular tune that is enabled.
>  TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
> +
> +# If MLPREFIX is set by multilib code, shlibs
> +# points to the wrong place so force it
> +SHLIBSDIRS = "${PKGDATA_DIR}/nativesdk-shlibs"
> +SHLIBSWORKDIR = "${PKGDATA_DIR}/nativesdk-shlibs"

in the patch that did not work for me
I was using ${SDKPKGSUFFIX} instead of hardcoding 'nativesdk'
and += instead of =

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

