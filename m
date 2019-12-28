Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D67277DD6A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 15:48:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so10700818wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 07:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=itjLtOvHzJfjRT3mGI45wE4rHJlpwrIXKJa1cbA5jAk=;
	b=ChCsjXrbiOtnkCgmM94dL8gSbxBZ64+RjE2L2oMsljqWAWL+4xxmIbDPvMrHDzUqsw
	/xuJ71sbGaZDMZDHiTZ2nB6dVavmIbhuvF9ZVRnUr6WyY+rn1zo/5UFPtzg+wm8Hw4Zd
	aN3zR/CNVmjG7m2W+Uld7Nteitk38osLclnDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=itjLtOvHzJfjRT3mGI45wE4rHJlpwrIXKJa1cbA5jAk=;
	b=bTj/jmqTIex4A521jxceRW72/yiZROAuLcZVDJTvIcUFzjBKcmKSuPYWn4fhJ0LNhB
	73QCVTd2S0trgTWo2C198hntGHNlBSTB8Pyy0wmE6/LFwE3hksDly6sTthX+m6BtgXvL
	cKQE4ODm/mFZFYHCj63fYCSRA9ehy4D6qbQtuZBfYjnPS76Mt2XdxpUbzkitTZ63YtZj
	Sb7h/QNm2wDYehUJzM94v6fpV98P4cBCegOTUY/eCtWT0RQ7SU2pireWgM2PChXnOlU2
	PyUp6u8mrdY3rN48qlI/0+V7mn8PnIQICbAhytE0983d7/qISOW74aYUXopmwpamIrjd
	0u/Q==
X-Gm-Message-State: APjAAAW3IJ+ZFl3i/n3DY5BxmwEympXyORkc/3DzmHgF0XLhp0eQhdre
	0Uo8tFOSk1hR63+dIrlXJyaDPQ==
X-Google-Smtp-Source: APXvYqxc31dHxyKY/C3wEsg0nL/wcNfJcN7k0KO0+0xR4hkhDCUHQuIDVbvAfwUfn2CHDW0SzoCrzA==
X-Received: by 2002:a1c:a504:: with SMTP id o4mr24820975wme.131.1577548087439; 
	Sat, 28 Dec 2019 07:48:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x10sm38831302wrp.58.2019.12.28.07.48.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 07:48:06 -0800 (PST)
Message-ID: <f7a15691a81d776f755e0aecb0a5a3b53e3ef07a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2019 15:48:05 +0000
In-Reply-To: <20191227082705.29041-1-kai.kang@windriver.com>
References: <20191227082705.29041-1-kai.kang@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] dummy-sdk-package: append RREPLACES with DUMMYPROVIDES
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
X-List-Received-Date: Sat, 28 Dec 2019 15:48:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-12-27 at 16:27 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> When multilib is enabled and installs lib32-perl to image, such as
> set
> 
>   IMAGE_INSTALL_append = " lib32-perl"
> 
> it fails to run task populate_sdk of images:
> 
> > Problem: package target-sdk-provides-dummy-1.0-
> > r0.sdk_provides_dummy_target
> >   conflicts with lib32-perl provided by lib32-perl-5.30.1-r0.i586
> 
> Append ${DUMMYPROVIDES} rather than ${DUMMYPROVIDES_PACKAGES} to
> variable RREPLACES that variable DUMMYPROVIDES contains multilib
> variants of the packages.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/meta/dummy-sdk-package.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc
> b/meta/recipes-core/meta/dummy-sdk-package.inc
> index 61afab1d76..91466a36e9 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -25,6 +25,6 @@ python populate_packages_prepend() {
>      p = d.getVar("PN")
>      d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
>      d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
> -    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES}")
> +    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
>  }

This reverts 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=63ad134e3d029accf67e1ba8880f59c7704cb505
?

I believe that is needed for the rpm upgrade which is pending.

Cheers,

Richard


