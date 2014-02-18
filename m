Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 16EC86E8A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 14:56:36 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id uy17so7275733igb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 06:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=C3IN74QBfywWuRGqH8BYGD5uEeWs0yStH+EYrnbbVjs=;
	b=eJRP+bNKJi0s941ZiGmgOafs+Tkf70gbMR9xCAGNBk33LWGRPzhUpwNvQh3HXn+s+p
	fvcCI2alKTiKKK+CpwvtJBpCaqYFV13J+CSa7nZdG2FAJYrdmgwz90C2mY9b5/i7wafV
	tlmqh3Jc49wkMsm8MbQeNlaQUgnz+UNuor6jEnE4rFPR8yLrI5qBWX0Vpr+2am1obmsu
	UPXaPNLiJtFLSxgQQR5DLjY2xrWbYZ7ngSY5JX4Ilpb2BjvOF7y8L1ChYAoG0dfjJeFr
	O7NcUS4CUeYDnChhk6CkiX+niiKZ5/9X4NyXEC19baGYLAxYFS9UZJyAdCM+NW6DgE52
	GbeA==
X-Received: by 10.43.181.69 with SMTP id ph5mr694713icc.78.1392735396964; Tue,
	18 Feb 2014 06:56:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 18 Feb 2014 06:56:06 -0800 (PST)
In-Reply-To: <1392725322-15042-1-git-send-email-net147@gmail.com>
References: <1392725322-15042-1-git-send-email-net147@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2014 06:56:06 -0800
Message-ID: <CAMKF1soAoZQg5=oGg_G3Cv5pnW=4ZFys3k=YFNsZ-6UhBfmpkQ@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: fix cpio IMAGE_CMD to preserve working directory
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
X-List-Received-Date: Tue, 18 Feb 2014 14:56:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 4:08 AM, Jonathan Liu <net147@gmail.com> wrote:
>  }
>  IMAGE_CMD_cpio () {
>         ${CPIO_TOUCH_INIT}
> -       cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> +       (cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio))
>  }
>

this would fork a new shell. you could also do something like
 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc
>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) && cd -

