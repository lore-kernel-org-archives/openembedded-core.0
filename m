Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 012387C0EC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 19:35:43 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id c9so7411169itj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 11:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=z+OeilJe9IxnVJZRJ+TPHbjEl+E6T6UAIrm9W01zkPA=;
	b=XLVFA7vkkv5sVvO1c3htqcFyuPbjJQKRxHA6JiChhEFbzroZAeeCBTGeAHovxen8Vw
	ip5Q6tPxpNIQryCa19Wf1l4ygZROMOMtLvseYMOibDJAmq5oNoOZM4FsI5TrUqqyD7IU
	/sQU1weYSm7iJIIz/+B3eTvmFS9dcWRqZqhdIaTDxAqB9Wz+m8DEvBuYMDo6Q+yYppN1
	wO8RwlVL7VO8H6o0uXVJl05bXWJcpO4S+aX3JwVsvex+MbnJY9qPKzJ9TEOAHIocDp+L
	nI9ADiBd/2/8F+WC6b0BAH4Pq+adFl5ovYLftCkrM0rjOOXuYF6lcmv/+e7B3/ukvRxs
	GROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=z+OeilJe9IxnVJZRJ+TPHbjEl+E6T6UAIrm9W01zkPA=;
	b=Rt2dl8fXqL2aqROB+Ar+JFYXxYF7QfIRaxkvR04M9rLoLyXQiEjn8xwIKNBcwEP1q/
	RN5LfcyNIyDAxBp3HypemI23MbxUJAhZ+nXk8z7g/PNcpXKfK+7YPVBieYHIBYnpa+6r
	nknJVNg4Gm4thn9NuN5AtY6oxaZPzJwE5pPWUAwiL7gYPoQwG/IFiZmZ5lMBBIkyRFIG
	X4EOKGev4WYvzQJrMEvRpeiDiNTHf+zvB2SYEZxasVX22D1FIhPc3W54X9SfI/yDVrIs
	yyJkUrfawaeCzDoKXT9ST+nLt1NPtPjWInJgf9BsGW1ht1NBBQil9L5w4Mx08S76J7Pf
	blBw==
X-Gm-Message-State: AJcUukdqxk3SMik8jn9B/DYvdu9rwE+kJnXG0mdsBfJ8z+SzGVyj51ev
	6RFAFfD5hsE8hXnp4kyxnMTLh0ozOCUlRkeUOBeDLw==
X-Google-Smtp-Source: ALg8bN7ntPAfu01F1RHja9XlMKBO7O6nh7U8mvMA/E94x7mHJMzF+0ft5ZiT3+8+eJSyp8wFe6yoNY3kf3PuCWutL/g=
X-Received: by 2002:a02:8785:: with SMTP id t5mr14300663jai.73.1547321744667; 
	Sat, 12 Jan 2019 11:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20190109203051.12258-1-jacob.kroon@gmail.com>
	<20190109203051.12258-2-jacob.kroon@gmail.com>
In-Reply-To: <20190109203051.12258-2-jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Sat, 12 Jan 2019 20:35:32 +0100
Message-ID: <CAPbeDCkjHbdo0BhFCmsXtpTQD68pNEf80YM0rOQX1Qj1Dp0Xpw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] buildhistory: support generating sha256 checksums of regular files
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
X-List-Received-Date: Sat, 12 Jan 2019 19:35:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 9, 2019 at 9:31 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> Introduce 'sha256' in BUILDHISTORY_FEATURES and enable it by default
> when doing reproducible builds.
>
> When enabled this will additionally create:
>
>   files-in-package-sha256.txt
>   files-in-image-sha256.txt
>   files-in-sdk-sha256.txt
>
> containing the sha256 checksums of regular files.
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> Changes in v2:
>  * Switch to sha256
>  * Let find only build the arguments and execute sha256sum once
>  * Use single quotes in inline python code
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 33eb1b00f6..84f85da0bd 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -7,7 +7,8 @@
>  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
>  #
>
> -BUILDHISTORY_FEATURES ?= "image package sdk"
> +BUILDHISTORY_FEATURES ?= "image package sdk \
> +  ${@ 'sha256' if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ''}"
>  BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
>  BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
>  BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
> @@ -526,7 +527,12 @@ buildhistory_list_files() {
>                 eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
>         else
>                 eval $find_cmd
> -       fi | sort -k5 | sed 's/ * -> $//' > $2 )
> +       fi | sort -k5 | sed 's/ * -> $//' > $2
> +       if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'sha256', '1', '0', d)}" = "1" ] ; then
> +               sha256filename=$(echo $2 | sed 's/\.txt$/-sha256.txt/')
> +               find -type f -exec sha256sum {} + | sort -k2 > $sha256filename
> +               [ -s $sha256filename ] || rm $sha256filename # remove result if empty
> +       fi )
>  }
>
>  buildhistory_list_pkg_files() {
> --
> 2.11.0

Ignore this patch, I completely missed the "task"
BUILDHISTORY_FEATURE, which seems to do this already.

