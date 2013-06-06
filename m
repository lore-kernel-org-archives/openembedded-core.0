Return-Path: <net147@gmail.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id DD5F76A60F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 07:34:11 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id x14so1706124vbb.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 00:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xX+yPxioZWhXnJVuGHcRF2dSx/MtHea/2PMhqVev7ng=;
	b=k20/Kc9UPbSrEmobzEHkDUBcB/Cdaw2/57H12XRkMjHGMBCCDoiVPia8yp5nYL53tM
	5nb/1i0/ICJmm8oTnStCoNmXxAG9M6iOeRF00DLo2H2o1pmKzTMN7KhKNmyw0YyRJKt3
	PjvDG3M4zATaQbaUS5dgcn9fHpxQD7FM50lxU2i4JWXo9jR/wjYB2rarMbHarFHRuVfl
	qGuohXV48QlRX0gWROJIrEZ9e5pmqBCZ5pSdCFF7lGgs01Ox8ldJyWspVnhqT/G7aaX2
	cOIyPkr8QINWJ0TC5pWL9KPdFekk57Z/PUr0fuztOxjQZ5y/2e4LtjGqEOwU6cBadHKU
	O3cQ==
MIME-Version: 1.0
X-Received: by 10.52.35.133 with SMTP id h5mr503403vdj.109.1370504052456; Thu,
	06 Jun 2013 00:34:12 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Thu, 6 Jun 2013 00:34:12 -0700 (PDT)
In-Reply-To: <1370501684-26590-1-git-send-email-net147@gmail.com>
References: <1370501684-26590-1-git-send-email-net147@gmail.com>
Date: Thu, 6 Jun 2013 17:34:12 +1000
Message-ID: <CANwerB3Ha-dUVEGrzW8FkSpRD13qRqfbZrxSy9pftYR793s9yg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/qmake2: export QMAKEPATH
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
X-List-Received-Date: Thu, 06 Jun 2013 07:34:13 -0000
Content-Type: text/plain; charset=UTF-8

On 6 June 2013 16:54, Jonathan Liu <net147@gmail.com> wrote:
> QMAKEPATH is exported so that qmake is able to detect the webkit module,
> load it and add it to the QT_CONFIG variable. The detection is done in
> mkspecs/features/qt_config.prf which reads the qmake QMAKE_MKSPECS
> builtin. qmake will read QMAKEPATH, append /mkspecs to it and prepend it
> to the QMAKE_MKSPECS list builtin returned. qt_config.prf will then load
> modules matching modules/qt_*.pri inside each directory in QMAKE_MKSPECS.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/classes/qmake2.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
> index 8b9861c..03ad2f1 100644
> --- a/meta/classes/qmake2.bbclass
> +++ b/meta/classes/qmake2.bbclass
> @@ -5,6 +5,7 @@ inherit qmake_base
>
>  DEPENDS_prepend = "qt4-tools-native "
>
> +export QMAKEPATH = "${STAGING_DATADIR}/qt4"
>  export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
>  export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
>  export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
> --
> 1.8.2.3
>
This may be causing some packaging QA problems. I am investigating...

Regards,
Jonathan

