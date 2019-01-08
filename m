Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 56D8662133
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 19:54:56 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id w18so8141950ite.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 11:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=k8oP8F9c/ezaKmiPY2tyR5g6oQ9s869w6OYWOUsfWeY=;
	b=Qr4bn5h7yu2UwL1pbU0av9P9zGMk8xn1iPkQ1GYwxUMCYaOVWpnaO+c5AapA2noTrz
	7QclGxlnYIjW4hbqr9R0FXu/dJo+7Nsv6vdcHcm2ucDPq8VgubEOCvWUhCwASZBubb7x
	V+LmxvbAmx/+CdufmI7KyHzItV+VWw53kKZ5GoVVquFKBnWTzGXiqKWkUNxStiRqGp/o
	fcGzGLyTqi2nO0fApaATId8PY3gYzdKMYPbooGsCjeStUVHcLwglDYunGNnnWeh7gSaZ
	hwJna+1gDe3yaZ5io7j3LnRfLxrB0XuPmQEMtzTFDszRVmRqq6uIrv7ct7sV7LglH/38
	F98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=k8oP8F9c/ezaKmiPY2tyR5g6oQ9s869w6OYWOUsfWeY=;
	b=K5PjrY4yvbXJUDTn2PpB4bSgkMHzLzCTaugIpTcJxbsc80/F5Ev+xeCasmpIFXobJR
	pHmjxRfVBMCX8VXKAWaUG6f10FQJol4Ap3C9n8KDks3BIrUd1D8w9Er5j3t2fntijL1W
	v7Ya3wrWBCAY1yKx0KE+cpsh+SvtPdmuL/cwQTxvfJD1J26Gnb3Z66YhguJF1HOgS5EE
	I/MBSPnjIo0z7+j3Srey8lAjAxqTl5HXatthSUO/A/Axd0qgdlh9CrCEX5o0oKMiw5IW
	hyO77zkQZxrjHsQJ0i+pViD18j013lFmKCXYsh31IdzfwjcZ4i2tbXvkrVYZXDiWJjDy
	OASw==
X-Gm-Message-State: AJcUukdGyICWU0atTuCUNL9Tl44i/OVw76H+pNi32hv3TjqtTilypMjA
	vbR1AE9OtKX2Apksjv08d6xvQsGIyhRlrLe7TDV6SvUR
X-Google-Smtp-Source: ALg8bN5KKEan1Tm778V74wNTLm1Ah6vDRhmoD60QzaWJu+GFjoVTxU5uhC6C7zl6IXqWRlwME12vZ7t4j+V4WJ/06Ts=
X-Received: by 2002:a24:214a:: with SMTP id e71mr2318468ita.60.1546977297051; 
	Tue, 08 Jan 2019 11:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20181225092034.31624-1-jacob.kroon@gmail.com>
In-Reply-To: <20181225092034.31624-1-jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Tue, 8 Jan 2019 20:54:43 +0100
Message-ID: <CAPbeDC=OCWZUMBgDgcmUTO4-XO=1f9MTDdVZ9fT7QjOpcu_+gA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-boot: create /dev/console
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
X-List-Received-Date: Tue, 08 Jan 2019 19:54:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 25, 2018 at 10:21 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> The Yocto kernel expects a proper /dev/console to exist before running init,
> otherwise booting will fail with the message:
>
>   Kernel panic - not syncing: /dev/console is missing or not a character device!
>   Please ensure your rootfs is properly configured
>
> Add similar fix as was done for initramfs-framework and initramfs-live-boot
> in commits
>
>   0352841cd92f6316bcac092e2fff9d28c352b36b
>   1b64664f0c388f41084f5db6e46e3e68c53fb6d9
>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
> index 7ae7969f5e..29ec5ec2ff 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
> @@ -9,8 +9,13 @@ S = "${WORKDIR}"
>
>  do_install() {
>          install -m 0755 ${WORKDIR}/init-boot.sh ${D}/init
> +
> +        # Create device nodes expected by some kernels in initramfs
> +        # before even executing /init.
> +        install -d ${D}/dev
> +        mknod -m 622 ${D}/dev/console c 5 1
>  }
>
>  inherit allarch
>
> -FILES_${PN} += " /init "
> +FILES_${PN} += "/init /dev/console"
> --
> 2.11.0
>

ping

