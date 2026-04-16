Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE25F8A15A
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 10:32:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10872.1776335514379385985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 03:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZyTxO6aO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso128020255e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776335513; x=1776940313; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6R+Ct7RRB6KKbaTe9ZBRCKvTlnNoO5onU8ODqML6PDU=;
        b=ZyTxO6aO643sGBiEEp2uCCcO3e/30GNepaWgxHu22sjZSxRkherlweX7YTEOOJDYmk
         fSsfL2PVnKAQhBZ/VISWs54cPqDJzMCLaDxvmiFMSSfBFF4SRQPNi3XtqeJ2WXCkL7TZ
         eoq9xXuzdJoKHk1ar9QZdx5dhwtk17TXoSj6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335513; x=1776940313;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6R+Ct7RRB6KKbaTe9ZBRCKvTlnNoO5onU8ODqML6PDU=;
        b=kRh5arVaQPsbnA7nwg48SZyVkUO5TG6OXekpgZiaXmC3aDFjUKA4WFnKB2E3VK2urR
         Eb9u/5dfJPiOqVCLAoXFG3Ph05gvhLcaZjW9h6MURtm9oyLC+dtyLyikhMRh9fdz1vBd
         dGHkzYVZnNOlqJ+0Dt3Kq8ayNqvn29J7xIgUJ+E3K0Xor9ktcU0+8Un1WQj+3FNT+viX
         DihiRgFFIt3qpArBvqC9kQekDI9+5NI1Jq1ZwAmTNPfZVSn2NImvsPhHkRcB2gHKehaO
         mbE4SDdVDwHj004us0vAIt2nZfylBD5g/tN2x6Uq6d4+AIBuUqfYZ6Z2+/JgiZRljWM+
         QSYw==
X-Forwarded-Encrypted: i=1; AFNElJ/HL/9TkTsR5ahYoAXM1ZNzGKcXzmqN5Wq9FGGinbt3jVIFRgo280s2r2PQbTS2W4/Elt+dCkjS2Sn11tjXGKSBCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4n3HfrN+77OmuvlHGThVL/CSsRMT+KsiD+owcfPrbdVYo8mrR
	94LXFKWEGid+LFCu6ra4Ec+hpjeg6PDvPkC3huTkNOTS6fUoi0HkxWp2bgmUe3lxPJ8=
X-Gm-Gg: AeBDiessskXTQdNcgqTXTdbxBfwEDvjN3DSt7lnulnJuuApqagPUJsKvwDFzTn9neor
	kj/dxzx16UTOKSGOMss8HR2DDcG5+BXVreJvE3cXk9ZAjRFsJYH8EVxeMz35TWqP+P6ZDH58tAX
	Q7dxmA8h2E+e8h7Z/wB/SZY6WYg1pMKoo1Sq9Ehp4zlUxC+DkIKvuThJb3uTSqWMiliC49FTj+U
	9iX9WqFqKyLdMmDKnhK67ATMdeu2Eu5i7T6jdagOt99PNBqZLXetzjvCm9IaN4XMXZiAOSZwjO5
	SWuNT43y43DT3UDFRPIYnFKt0nctvnocuUoC/nF84Qz8vfzRy0oXKFe4lD1/A5QQ6HsfgoDzeeM
	IYhAGpzgBsccyTPj2aQMgv9gDuYfUACdF9getS3zP+2dyUh7pcxyI1Il7G3twFKThZJk/VPu8vD
	n/3mAzUlbAgnL/G1ZMO60JwTBKY/fAkpB/Ap95HgxzKFLgrXU/nXrL/98YXOdU8s8lb+YVg91dU
	IJVVzp0N8ywl9PiTFD/CvBF5pI=
X-Received: by 2002:a05:600c:890e:b0:488:bd79:94d8 with SMTP id 5b1f17b1804b1-488d684331emr235650685e9.18.1776335512652;
        Thu, 16 Apr 2026 03:31:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9444:ba74:dc4b:e8c7? ([2001:8b0:aba:5f3c:9444:ba74:dc4b:e8c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f581d8eesm44182515e9.9.2026.04.16.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 03:31:52 -0700 (PDT)
Message-ID: <ae7097bacdb935c2dfb6b5392b31eeda9b5ebfff.camel@linuxfoundation.org>
Subject: Re: [PATCH] devtool-source: set S variable to a sub dir of UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Date: Thu, 16 Apr 2026 11:31:51 +0100
In-Reply-To: <20260416-fix-devtool-source-v1-1-3a9b689fbe16@bootlin.com>
References: <20260416-fix-devtool-source-v1-1-3a9b689fbe16@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 10:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235397

On Thu, 2026-04-16 at 10:14 +0200, Benjamin Robin (Schneider Electric) wrot=
e:
> If a recipe set UNPACKDIR to a directory that is not contained within
> WORKDIR, before this modification, this generates the following error:
> "S should be set relative to UNPACKDIR."
>=20
> S should not be updated, otherwise the recipe may not find the extracted
> sources. In all recipes, S should reference the UNPACKDIR variable.
> There is an exception for the kernel to prevent infinite recursion
> when expanding the STAGING_KERNEL_DIR variable.
>=20
> So, only updates UNPACKDIR to be within the DEVTOOL_TEMPDIR directory.
>=20
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
> I have done various testing, but since I don't know all the requirements
> of devtool, and all the impacts of this change, I may have broken some
> stuff (I hope not).
>=20
> This patch fixes the following command:
> =C2=A0- devtool upgrade sbom-cve-check-update-cvelist-native
>=20
> It does not break the following commands:
> =C2=A0- devtool upgrade linux-yocto
> =C2=A0- devtool upgrade python3-sbom-cve-check

For reference devtool has a strong test suite and you can run it with
"oe-selftest -r devtool".

Cheers,

Richard

