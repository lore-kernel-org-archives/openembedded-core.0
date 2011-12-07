Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYP1H-0002Ln-Ez
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 22:27:15 +0100
Received: by qcqw6 with SMTP id w6so819102qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 13:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sm5qu/UjXIqa82Fb0VIzXlCHnk6U6g13kOoq56UKYug=;
	b=oKFIrLd8kpbmSQB7on+ynlbDbxxH8nGdbMVNg0pTp4eNCvwP4DWNeIq8/emcF1Ijo8
	Afo3VM+HSOy9gosXFRc7MXUmd1EPm8MxLMOsOm38O1A0r+IlMzS+MDuM003vHuF4X0yG
	lYTJDlwV5hIPfuPd/y48Yf6AF0mHly4w/yi9Y=
Received: by 10.50.242.1 with SMTP id wm1mr778588igc.30.1323292826117;
	Wed, 07 Dec 2011 13:20:26 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id j1sm5884474igq.2.2011.12.07.13.20.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 13:20:24 -0800 (PST)
Date: Wed, 7 Dec 2011 13:19:56 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207211956.GA6351@sakrah.homelinux.org>
References: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
	<1323174430-24886-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1323174430-24886-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] ppl: fix libgmp paths
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
X-List-Received-Date: Wed, 07 Dec 2011 21:27:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (06/12/11 13:27), Martin Jansa wrote:
> configure:10654: checking how to link with libgmpxx
> configure:11127: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgmpxx.so /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgmp.so -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/ppl/ppl_0.11.2.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-support/ppl/ppl_0.11.2.bb b/meta/recipes-support/ppl/ppl_0.11.2.bb
> index 7536364..b31fc4d 100644
> --- a/meta/recipes-support/ppl/ppl_0.11.2.bb
> +++ b/meta/recipes-support/ppl/ppl_0.11.2.bb
> @@ -11,6 +11,10 @@ SRC_URI[sha256sum] = "e3fbd1c19ef44c6f020951807cdb6fc6a8153cd3a5c53b0ab9cf4c4f6e
>  S = "${WORKDIR}/ppl-${PV}"
>  BBCLASSEXTEND = "native nativesdk"
>  
> -EXTRA_OECONF = "--enable-watchdog --disable-debugging --disable-assertions --disable-ppl_lcdd --disable-ppl_lpsol --disable-ppl_pips --enable-interfaces='c cxx'"
> +# do we have something shorter then this? or can native.bbclass overwrite STAGING_DIR_HOST like nativesdk does?
> +GMP_PREFIX = "${STAGING_DIR_HOST}"
> +GMP_PREFIX_virtclass-native = "${STAGING_DIR_NATIVE}"
> +

I think we should override STAGING_DIR_HOST in native class as well.
Since we do install native packages into local sysroot before populating
the global native sysroot. The comment in class code seems that since
we installed the native packages in position it was needed to be unset
that may not be the case now.

RP thoughts ?

-- 
-Khem


