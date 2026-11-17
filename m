Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14587.1794910191506907582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MCDdtQuT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 54260C4D3D7
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01AEB5FC81
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:09:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B013711BC05E5;
	Tue, 17 Nov 2026 11:09:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794910188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JgVTkuota10YeVuoMsR3KmsIIqJ5rsUqinEDTQXoZwc=;
	b=MCDdtQuTksGKFiSCfDmTIEcGJXo1aZWm6iQoCeU6Y+5BUakdSlqIwEyu3rFhM1NGgsvxeU
	UBJVCtapq/9Fi/bydtkt8IBpmzonEHT39DA0k2Z/EQ60bweyNIHnZrizr5AkVBGzCWp1dF
	4C+T2TXb3/7xDK/4fLDTQe/Q9dZTaaV8qDGKZeyFmKvsCoPTnIppSL+/wqlrWdwTReYgQI
	TwoULC3XuCmztOv9xOcFJElKump0zAlRBbwhorzak3zGtpbIZb2MlAIPVtlIl9FoaaTTzO
	g0XUi/HrStw5+G2sBYzBJ9qvkN0A8Dv4Xhv1nzVkGZQlTUlxLmLZo3zKQzkTNQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 11:09:47 +0100
Message-Id: <DMXEK4LWEZJH.2MIWDYR9RRMC7@bootlin.com>
Subject: Re: [OE-core] [PATCH 05/13] lib/oe: move
 oe.types.{is_x86,qemu_use_kvm} to oe.qemu
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <antonin.godard@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
 <20261116-oe-lib-docstrings-v1-5-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-5-0c894f6a1064@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250419

On Mon Nov 16, 2026 at 5:09 PM CET, Antonin Godard via openembedded-core wr=
ote:
> The oe.types library represents OpenEmbedded types such as booleans,
> integers, etc. which is unrelated to what these two functions do:
> is_x86() checks if a given arch matches the x86 architecture, and
> qemu_use_kvm() is used to return True to enable KVM based on the current
> target architecture.
>
> Move these two functions to oe.qemu which is more appropriate. Adapt
> usage in OE-Core as a consequence.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---

Hi Antonin,

Thanks for your patch.


> --- a/meta/lib/oe/qemu.py
> +++ b/meta/lib/oe/qemu.py
> @@ -52,3 +52,27 @@ def qemu_run_binary(d, rootfs_path, binary):
>      base_libdir =3D rootfs_path + d.getVar("base_libdir", False)
> =20
>      return qemu_wrapper_cmdline(d, rootfs_path, [libdir, base_libdir]) +=
 rootfs_path + binary
> +
> +def is_x86(arch):
> +    """
> +    Check whether ``arch`` is ``x86`` or ``x86_64``, return ``True`` if =
it is,
> +    ``False`` otherwise.
> +    """
> +    if arch.startswith('x86_') or re.match('i.*86', arch):
> +        return True
> +    else:
> +        return False
> +
> +def qemu_use_kvm(kvm, target_arch):
> +    """
> +    Enable kvm if target_arch =3D=3D build_arch or both of them are x86 =
archs.
> +    """
> +
> +    use_kvm =3D False
> +    if kvm and boolean(kvm):

Missing import of oe.types here? We are probably also missing os and re.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/5078
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/4956

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

