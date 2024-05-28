Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F8AC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 08:48:11 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.17677.1716886086708525007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 01:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wq8nWjg+;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso5252521fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716886085; x=1717490885; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sE6C41Hkfx4NdHaDtiE+I1COguMlu6pGbqQcO96Qlv4=;
        b=Wq8nWjg+0ehOQ9OUYBQLLPbH+pcyEmy4n7FHFV8VCo70VMd7gTeYD8//iY79X/l8mr
         anBaPfLqRFX7AYqi5/3DAPWYbgoB+eS4AHFa4zTq2Ks7kHo7nRN2lA9l1EJd+ufT9obK
         FWHl8hLsjc7n8kSvqjMEenTQj6hOCLvrCiiaplnQExnUrJP75ZfsCGD9FLqXBSn97YRv
         YiNf2OA9L9sDN+lM0/swNyfEmzQmYGETT7le51NsWGu4vvJ19x6u8iLRHHWbnp6rGSGc
         SnXN7wWTgLQx9AQlSzD9R/Kv3fxO87TLavuagc2rWn+cfLh++WTeqv1RwaT+QrM/X1MU
         sVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716886085; x=1717490885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE6C41Hkfx4NdHaDtiE+I1COguMlu6pGbqQcO96Qlv4=;
        b=a3UQtdggRU+ShrpYgQD4H/tV7J8XLnOpaUV3aRUhHCUINs7ja0iP2AeLqgw4g9fqxO
         iDGHWez8TMNelyPmTwLDzX/91eMeN09AbKJoBn9YSsYE9P2J2ZEuN3pN3rw0gdU8CwrT
         nq0Ee9bfeL/hptBMhADEoZpTrm70zb1LqgtDw4aP9x1zm2Y/D1yifxMUl1xfKjNpiCnG
         VZ1A3GYEonIXLOna/ebj7XEBIPMmCKPXmM7RKtYYb3Rv3i/F7dU4mvfVJnRYiPmUKCfZ
         ZTd1xfiryqavHGhe5TOI/Wyd6qwE8Mq56vLfIF0JJYhNmnhGyMcHZo9FwjRu0BZJjsb+
         Z21Q==
X-Gm-Message-State: AOJu0YwiMp9LAbYak6IF8qsxyK+9dB3OZ+lxh5YE0bHM/q5T5a/TehiI
	HRX/25r6o0AoUYGj7BEhixeb0ZRU8noa6di6auSGJuUnkiPXm8rOSDvuZA==
X-Google-Smtp-Source: AGHT+IEz9G9sIZALifXP5sHByB1+ROpcEKE+O+5dlr7nqoKufTR085ZlY+EBeAGZ0qhBnKtYcenr+g==
X-Received: by 2002:a05:6512:318c:b0:529:b5cb:d64c with SMTP id 2adb3069b0e04-529b5cbd6d2mr2368435e87.7.1716886084581;
        Tue, 28 May 2024 01:48:04 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4c0adsm889958e87.94.2024.05.28.01.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 01:48:04 -0700 (PDT)
Date: Tue, 28 May 2024 10:54:17 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] bootimg-partition: break out code to a common
 library.
Message-ID: <ZlWbuZAjLfG9BAVg@gmail.com>
References: <20240525085023.6042-1-marcus.folkesson@gmail.com>
 <20240525085023.6042-2-marcus.folkesson@gmail.com>
 <913d0052-6ba8-4e30-bea8-ce910acd9e64@cherry.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/I3DsUimH/IISA4t"
Content-Disposition: inline
In-Reply-To: <913d0052-6ba8-4e30-bea8-ce910acd9e64@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 08:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199954


--/I3DsUimH/IISA4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

On Mon, May 27, 2024 at 05:20:53PM +0200, Quentin Schulz wrote:
> Hi Marcus,

[...]

>=20
> > --- /dev/null
> > +++ b/meta/lib/oe/bootfiles.py
> > @@ -0,0 +1,56 @@
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +# Copyright (C) 2024 Marcus Folkesson
> > +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> > +#
> > +# Utility functions handling boot files
> > +
> > +# Look into deploy_dir and search for boot_files.
> > +# Returns a list with files to copy.
> > +#
>=20
> It returns a list of tuples with (original filepath relative to deploy_di=
r,
> desired filepath renaming) if I read the code properly, I think this is
> really important information.

Agree. I will add that to the comment.


[...]

> >   from glob import glob
>=20
> You should be able to remove this import as it was only used in the code
> that is now moved to the lib.

True, I will remove the import.

>=20
> Otherwise looks good to me, so
>=20
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> Thanks,
> Quentin

Best regards,
Marcus Folkesson

--/I3DsUimH/IISA4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmZVm7QACgkQiIBOb1ld
UjLg6hAAvlP1O/Ny9pUN0AzowOmMyQM9VIYZ3f+Ll0yr11OVqfISlVVMVEFYMvQ5
Txx9jnDuKpLmhwLVjIp5aLX/nDi42ImymN5gmtl61k8ngC0U6Im1iilq8/YyJVGq
C1ZEWBosYthb1MjxjGeQ8F1iq0w42Va/rzsG4lMmZq5MtOdGgbMNqb3BHWjLcz9h
HGdHJGMLBxU4zsHjS5Stdr3qwTkeLhznADuKsNKh5BD8VSduT9U5lHYRUUx2CmGy
O0REmQv43fcZGgz79jzbetg3bJ1eb4w8VccyYEqQz4bK/bQROTT1fesP0yUX5B5x
DmBHkvYf8FNEHIrce1o/fESVryDI8pACebB3fht4cg+dB7qw/2tumxRcfQxJcyq0
roWZ+1e1OcYvTuYyMjNO5gxZOyfXaSsE5ISohD7IrVt/IdqnkCBDIb8FLQiBrUQw
1+b0C1qBW77kUf4hXmieqmkJRHI6LXEXGBDJyVsgbWLVGtwO8VMr0mpsBEHv/I8d
cprtYlivQ/cGTrSK40UrdpHxDxgLB4pN9BR3XqniJaGYGNGSIPt1DRjvCRLqaNKR
xTiS+GUaXAi9PcmAen5crb9Dneb99GiKBXb6V9cELrGzQ7TqRIrcY1MTHafNvqsP
ZqUkuf0ZZUInCg/XnEw2VBD4xqcypj2AARN/IMPReZCeTVgzAk8=
=IKp+
-----END PGP SIGNATURE-----

--/I3DsUimH/IISA4t--

