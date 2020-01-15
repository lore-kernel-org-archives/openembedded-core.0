Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 583797FA13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 13:53:01 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q81so577104oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 05:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EBATqjIBNdIMOO2aOy4NiKA4S4DvA5QMWIcmFgoobPA=;
	b=Knx2n4uoXD6zmLW+N1C/RyXm28Yi8sNovuQRpQoWd2SKzq7G42XRHEbTwn6jWf8TNm
	dRPgMgfso30aCRMBdEz/kiWhU8JaTXg3WaO3qg1op3IVR3msxjUCVYdArMYF17FBh1m3
	z8f39NdnQnNXsNVSHePFjFQntnhQfwdespzQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EBATqjIBNdIMOO2aOy4NiKA4S4DvA5QMWIcmFgoobPA=;
	b=KqbHi8V0sEL9shVCRuW6jrQF36glDg2nqDXGk8M0UzTn/gLlQZbJIPrEx9OjC/GnRI
	cFMf6GgN0I5lWjEEhI2jwLs+U4fjJKJffB0ztcZPNYiXaFpzgcvfBMhCbY4lg60IEugA
	WdkCiaTkV/QDyRhuL9tEpZSrFfplSmxPjpm5uN0qjXa3lIcmQu4dVkt1n5GMeBR8Jewu
	RKl8z6EBYOneOLkjJC9p9n+f4GpfhUhAgMPaHouffGWHjuLpDb+zcjR5vuNbYyxz3HB9
	r2xdx7mnF4P04OGTmcvuTL3SOs0ViZcHrJJRfP2X0mhm4XX/JSP+0CxZBuNiXyzAh+2g
	oSGw==
X-Gm-Message-State: APjAAAXqQkZTMLa34qrA0GTedQxN93fzd9qb1B97fyQc69MVUfW8BsWa
	8dUQJ2yLbWjx8K4wPpGupDRilrKZpzia/dGisOX2gg==
X-Google-Smtp-Source: APXvYqz/20xCYlLwVkndjBpKFrYupk2uNwePoUquhhr4MymeOPUN2wNU8G9MGnasRYG+cNnfsIZlcHbZIS+veMAAo90=
X-Received: by 2002:aca:d985:: with SMTP id
	q127mr20076488oig.132.1579096382240; 
	Wed, 15 Jan 2020 05:53:02 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_1C1cqd6qyV_NEMewiYZ2aG-91yDUGzCVwmAKsX7NFwgw@mail.gmail.com>
In-Reply-To: <CAPybu_1C1cqd6qyV_NEMewiYZ2aG-91yDUGzCVwmAKsX7NFwgw@mail.gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Wed, 15 Jan 2020 13:52:51 +0000
Message-ID: <CAM9ZRVsJUJRzsN=cH_y6R2c94tD=DeH91Jp36BOECq6Br_FK8A@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jan Lorenzen <jl@newtec.dk>, ed.bartosh@linux.intel.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Best practices: Multiple images on one partition.
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
X-List-Received-Date: Wed, 15 Jan 2020 13:53:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2020 at 13:05, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Hello
>
> I am trying to figure out the best way to achieve this. I have a
> system with a host and a target. The target netboots form the host and
> have a different package architecture.
>
> Usually I was solving this with one partition per image/machine,
> combined using a .wks file like:
>
> part /export --source rootfs --rootfs-dir=target-image  --fstype=ext4
> --label export --align 1024 --use-uuid --fsoptions defaults,ro
> --extra-space 400M
> part / --source rootfs --fstype=ext4 --label rootfs --align 1024
> --use-uuid --fsoptions defaults,ro --extra-space 400M
>
> and then calling wic file after generating both images. ("wic create....")
>
> This works fine, but now I need to combine both partitions into one.
> The reason is that the partition needs to play nice with the current
> OTA upgrade system.
>
> What would be the best way to do this?
>
> 1) Implement a new wic plugin, called something like muli-rootfs,
> where I can specify multiple rootfs and in which directory to unpack
> them
>
> 2) Implement a .bb file that combines the two images in one.
>
> do_install() {
>     tar -mzxf $HOST/host-image.tar.gz  -C ${D}/
>     tar -mzxf $HOST/target-image.tar.gz  -C ${D}/export
> }
>
> 3) Another way that I am not aware :)

I've recently added the `--include-path` option to wic on master which
may be helpful here:
https://git.openembedded.org/openembedded-core/commit/?id=d4cd27a9837426e809190548a83c6c7c76505114.
My use case was multiple rootfs copies on different partitions, with
extra files added to just one copy of the rootfs. But it may also be
useful for this case.

Thanks,
Paul

