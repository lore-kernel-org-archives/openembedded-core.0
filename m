Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id 141C66067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:21:40 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id u134so32812479ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 19:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NNOc6i3lWdymN1hOnoGDIH3SRdSzTvPfQ+jgIufmy/Y=;
	b=D6WHMT9xFtXiogPSw2TZ0hqemHNrPD8+prbmTJ90SMAJhxWhcJwsmUJ+9W9gLgtbDc
	39oOna3XbCAwg28zDHhwgx8LyXzTuyZ4YksPQ868n3Sf8Ue5NhPQzlWXwVEnPkbM/afz
	ZL5I6Oqu1Ke+4GHbPBvSlKrBPMLaFx+yjCvbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NNOc6i3lWdymN1hOnoGDIH3SRdSzTvPfQ+jgIufmy/Y=;
	b=M+Ma4Td80HpFgKFwqzZh6XVZ0KushQKHPyoFCx7dMQwTyoI5RaYrvuwyfl1Ro3C1tF
	uPk6ZJtynM1dgd14o9CZkdgqI+FbXeTp8EvhfWR11RFZw2uyOvEo0UBkOTMEXPZ0UvBh
	TqbP8E5nMuX6B+EynSuDJ46iIn8BfMXtRzynUnRXfi2YOVSg/i8S5DOxrQ/he9KKThzv
	n1gY6UU+mik0cS8JUjiKdKnJL8gXaSp9WFnpyyw2npSDHrseJyqy5iIYSLCwmqytpih4
	e4hu6KmMkkVvcGUsaK3D4GtMn5zf2DsYF/Pp0HV/xxzYBj3WLbh1QGnBzHLEQNPpeWZL
	wrjw==
X-Gm-Message-State: ALyK8tIBLJBjwE5CpDdxiLkiesmMk2bEPc7NcoK8E/C5of2YjVpqSYoJAbEvmQA6X4RtWw==
X-Received: by 10.37.38.201 with SMTP id m192mr27599894ybm.156.1468981301309; 
	Tue, 19 Jul 2016 19:21:41 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-B199-1101-CD04-8ABF.dyn6.twc.com.
	[2606:a000:1407:c0e8:b199:1101:cd04:8abf])
	by smtp.gmail.com with ESMTPSA id a138sm200663ywe.8.2016.07.19.19.21.40
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 19:21:40 -0700 (PDT)
Date: Tue, 19 Jul 2016 22:21:48 -0400
From: Tom Rini <trini@konsulko.com>
To: George McCollister <george.mccollister@gmail.com>
Message-ID: <20160720022148.GO7260@bill-the-cat>
References: <cover.1468862824.git.george.mccollister@gmail.com>
	<1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marex@denx.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] kernel-fitimage: add initramfs support
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
X-List-Received-Date: Wed, 20 Jul 2016 02:21:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 18, 2016 at 12:57:55PM -0500, George McCollister wrote:

> If INITRAMFS_IMAGE is set, build an additional fitImage containing the
> initramfs. Copy the additional fitImage and the source (*.its) file, used
> to create it to DEPLOYDIR. The fitImage containing the initramfs must be
> built before do_deploy and after do_install to avoid circular dependencies.
> 
> UBOOT_RD_LOADADDRESS - Specifies the load address used by u-boot for the
>                        initramfs.
> UBOOT_RD_ENTRYPOINT  - Specifies the entry point used by u-boot for the
>                        initramfs.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

