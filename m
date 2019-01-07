Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 862E57BDEE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 14:17:11 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m8so7418239itk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 06:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ezuhsgpW1na0Qykv0CIsclS2fBNn4h8qGh+RFNPFgs4=;
	b=Uv/j5BhRbMzyCJMPZf8IvXEj19uonRfEcXjbzFGQQ5KybRcK0bJPJj64DgCbB0+/Tr
	NjmsBsnAZP59qxMvkW0hE1EXJUmfOWkagV2Okrz2gt5GgMoLnePG8CCVhxJsZUdjg6z2
	etbZ2WI2Z+syps4TfTXT7YFiDu8L54nW/Z64v073U/tAePCSyYcpFg3E06MberTEpa91
	Y7C22DfB+rgZFRogaqosxCc4kXZipd8rpvm3F19OOhiDy6lWwLVxNwZ4f4h7Wb4S8I6S
	K+3yYJk2TaHQXsmE1Emn1Qn+Ki+Q5O0YlR0vCXBCReKbNkzMXC/Wu/5VS4LN0+OXC7H5
	YWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ezuhsgpW1na0Qykv0CIsclS2fBNn4h8qGh+RFNPFgs4=;
	b=juziRAMbCC/vOWn6ZRWpjoo1zXISeZ36CEFUFiB+xBG/ADNJEQ1oIckOS5RVPzcLLQ
	fnImAOan5plpYpPI4YluDxkbdfEDWfDM/Ad8bppVn0KjE8Xf8cC+I7VghUW6/H14Fz7c
	e//j98jRej7zSv7kPhR8I+SnTIbjaD66UBMiPCBglQyCYBv9C1G5+ollN0EzdXzHf8ZY
	vdjoGKzVGACOBDAofe1dS08MhGBt6VewWZzuxJv1Pj1fM2xhhv8a8ImG+lnkhzj5V3BQ
	7AA6EX2nAJykP65rP5gvG/yBQplUxgPLjuRLqaQRpUFunRF+vn2m7pEexAumFEb9ziCw
	rATA==
X-Gm-Message-State: AJcUukeq07Xd6mM4jb+B1Lf78GsxKmoqZgLgEUY698O6SfI05jLbmXjp
	PH5yk7wrfM9I9S6Sr1vKXrp6HhiGf/mwRqiwq3uIW4dF
X-Google-Smtp-Source: ALg8bN7qevfgXf88j7x1bOYjf3Mn98ZSCv5pvIifc+KWJ7eVp13yR1iQA13KNBx8ZgWKuPs00gqkzYLJt2P49cHhm0E=
X-Received: by 2002:a24:edc4:: with SMTP id r187mr8119796ith.158.1546870632138;
	Mon, 07 Jan 2019 06:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
In-Reply-To: <20190106181350.25386-2-jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Mon, 7 Jan 2019 15:17:00 +0100
Message-ID: <CAPbeDCm=0X_8cN6_WCexaLBNcYrVv3zT_27g8uXW_eh-iGc=TA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Mon, 07 Jan 2019 14:17:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 6, 2019 at 7:14 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
> when doing reproducible builds.
>
> When enabled this will additionally create:
>
>   files-in-package-md5.txt
>   files-in-image-md5.txt
>   files-in-sdk-md5.txt
>
> containing the md5 checksums of regular files.
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 33eb1b00f6..00f0701dec 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -7,7 +7,8 @@
>  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
>  #
>
> -BUILDHISTORY_FEATURES ?= "image package sdk"
> +BUILDHISTORY_FEATURES ?= "image package sdk \
> +  ${@ "md5" if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ""}"
>  BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
>  BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
>  BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
> @@ -526,7 +527,12 @@ buildhistory_list_files() {
>                 eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
>         else
>                 eval $find_cmd
> -       fi | sort -k5 | sed 's/ * -> $//' > $2 )
> +       fi | sort -k5 | sed 's/ * -> $//' > $2
> +       if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1', '0', d)}" = "1" ] ; then
> +               md5filename=$(echo $2 | sed 's/\.txt$/-md5.txt/')
> +               find -type f | xargs -I{} -n1 md5sum {} | sort -k2 > $md5filename
> +               [ -s $md5filename ] || rm $md5filename # remove result if empty

I added this remove because I thought it didn't make sense to keep
empty files around, but I now realize that the "files-in-package.txt"
file is kept around, even if empty. Is there a preference on what to
do here ?

> +       fi )
>  }
>
>  buildhistory_list_pkg_files() {
> --
> 2.11.0
>

