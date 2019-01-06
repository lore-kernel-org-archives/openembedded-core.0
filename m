Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC99F6D51A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Jan 2019 23:08:35 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y56so36264538edd.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2019 15:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BBJczrimjlu8Pr7XkGm0WKiJVRru57UN17xs673vGUU=;
	b=Jln7hcb2FingIA3Sl87ZGhveOkxmVKWvKTH+NAaj6ZowhTHHDiPB3ChbbguvxY7fIq
	RgvpcvMs6oiRXSH+4sREQxn+P46tlg+rrCOX05uieAMulDAEJMolRCeor0+ahl7JLVNf
	52xHOaJ4xV5JndyP9NaRQcVQgRDsgi5e++2GZfwLyEt2/JAZFrriQVi4jtA1JcOZ6PGw
	p0lBvXP9368eFepwI40/KKJNfwt348ZJS17lIz+bQJ6+ENfYlmXkvpt9H9ScFIe5QZIv
	McUTaQ7AOi1sDAPKqVC+r+7V+1rvrqIqWqCrw6hlsceFm14Zsg9bMhYAyZn8XF63UzJM
	oVSw==
X-Gm-Message-State: AA+aEWZck5e598yE4br8NKhRjpuhHxecPKuSR4eRJpKlfoszj8EdEmBm
	zD/I4zHYRa0m1Dj3JPVBWd9VrzUi
X-Google-Smtp-Source: AFSGD/UYnBqDKh60NkErNmOsdOajEE+U34ZqgsdF34KbSEwgVJL52uWmWMnTyqnY9HvZjNENFKp4Xg==
X-Received: by 2002:a50:8907:: with SMTP id e7mr54931756ede.252.1546816116185; 
	Sun, 06 Jan 2019 15:08:36 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	b46sm27180661edc.57.2019.01.06.15.08.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Jan 2019 15:08:35 -0800 (PST)
Message-ID: <7561c555f243ddaaa45bdd28eed97394c35d67e5.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 06 Jan 2019 23:08:34 +0000
In-Reply-To: <20190106181350.25386-2-jacob.kroon@gmail.com>
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
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
X-List-Received-Date: Sun, 06 Jan 2019 23:08:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 2019-01-06 at 19:13 +0100, Jacob Kroon wrote:
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
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 33eb1b00f6..00f0701dec 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -7,7 +7,8 @@
>  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
>  #
>  
> -BUILDHISTORY_FEATURES ?= "image package sdk"
> +BUILDHISTORY_FEATURES ?= "image package sdk \
> +  ${@ "md5" if
> bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ""}"
>  BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
>  BUILDHISTORY_DIR_IMAGE =
> "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
>  BUILDHISTORY_DIR_PACKAGE =
> "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
> @@ -526,7 +527,12 @@ buildhistory_list_files() {
>  		eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
>  	else
>  		eval $find_cmd
> -	fi | sort -k5 | sed 's/ * -> $//' > $2 )
> +	fi | sort -k5 | sed 's/ * -> $//' > $2
> +	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1', '0',
> d)}" = "1" ] ; then
> +		md5filename=$(echo $2 | sed 's/\.txt$/-md5.txt/')
> +		find -type f | xargs -I{} -n1 md5sum {} | sort -k2 >
> $md5filename

Why don't you
  find . -type f -exec md5sum {} + | sort -sk2 > $md5filename
?
It'll be quite a bit faster because way fewer processes will be spawned.

Am I missing something?

I don't know what the intended use-case of the md5 files is, but could
sha256 or similar maybe be more appropriate?

Cheers,
Andre'


> +		[ -s $md5filename ] || rm $md5filename # remove result if
> empty
> +	fi )
>  }
>  
>  buildhistory_list_pkg_files() {
> -- 
> 2.11.0
> 


