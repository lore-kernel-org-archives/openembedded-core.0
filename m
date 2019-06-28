Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD6E67EA97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:31:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so6097889wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=0BkSylX5sFv6Yk7ZoRpe09VvhQnMxl3qH0CKrzlhdBY=;
	b=AaxlTWmUoZE0K2jEk0SoDNGBNwP3BtQ0Uiv8KoCsBEb6plON5pGoJp8IRLfbSuOgg4
	k1g1pSDjEInP3lX+zNhAecb7RBAWl5a1ZNohYUFmn/mVy1g3UuoAkN6k4Gi+KNCUa5Yv
	ZTMTbGs80v7/9tUVFzN8zCoMVV8/58qXCVd4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0BkSylX5sFv6Yk7ZoRpe09VvhQnMxl3qH0CKrzlhdBY=;
	b=PewHJa+geAcFuylEtfW+u7u7/SaTWTWjJ/U0SjoHIzqxR93y0yW5JrHYGtjqNcgFhn
	V4jLtPew3tJXUCk2/zVjn1/4QQywC585AyFfkiWCIcsHMMvDsrx50hgssed7jQWVpzmt
	z1WR57EddxiEVsspciXE+ZTw0wf2UnXmPBIF1QOJ5WzTbGVjULxVRa6YW1GiW7v9mE5S
	1paHrRQ/itQvahf+pgjOIbY9FRYo5Hj7PNkW6+nhjTBTfjV9ThbxWhHLg2qttSNsrWzX
	8rIjchIIWW5q3cFFCUzO/0Krc6HkZEEkAOi7LFKnZ7WbfQ+Y+JUEcNE1SkEch0lMfmUk
	9CnA==
X-Gm-Message-State: APjAAAUndoknKoC5H3at5bcgHspdYZ17Od322zBAHsO3zPogeKZFQviM
	vcgRXvsFxqqMh/mcXTc4WWxUdUyyJ7Y=
X-Google-Smtp-Source: APXvYqxm51AOgIC/Szg7l2UscyHPWGowPxr1zS7tgbGwFgDwR+cidMLmQmkXsDXECZnFtwstn44xYA==
X-Received: by 2002:adf:ebc3:: with SMTP id v3mr2776802wrn.61.1561725067675;
	Fri, 28 Jun 2019 05:31:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x6sm2663092wru.0.2019.06.28.05.31.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 28 Jun 2019 05:31:06 -0700 (PDT)
Message-ID: <20e09f37db12c606887073c60dc6b77a7d0ffeca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2019 13:31:04 +0100
In-Reply-To: <8e2fc3746a5d073925891a1f9d2d18d46513a91c.1561714128.git.Qi.Chen@windriver.com>
References: <cover.1561714128.git.Qi.Chen@windriver.com>
	<8e2fc3746a5d073925891a1f9d2d18d46513a91c.1561714128.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Fri, 28 Jun 2019 12:31:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-28 at 17:29 +0800, Chen Qi wrote:
> Check the existence of systemctl before invoking it. This is because
> even if 'systemd' is in DISTRO_FEATURES, it's possible that systemd is
> not even installed. e.g. container-test-image in meta-selftest layer.
> This would fix the following test case when using systemd as the init
> manager.
> 
>   containerimage.ContainerImageTests.test_expected_files
> 
> Also remove the IMAGE_EXTRADEPENDS setting, as nothing references this
> variable.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index d2b2fb9..2115c6c 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -666,10 +666,11 @@ reproducible_final_image_task () {
>  }
>  
>  systemd_preset_all () {
> -    systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
> +    if [ -e ${STAGING_DIR_NATIVE}${bindir}/systemctl ]; then
> +	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
> +    fi
>  }

Shouldn't we be checking something in the image rather than the
presence of a tool?

Cheers,

Richard




