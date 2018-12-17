Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD446C335
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:29:34 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBHDTX2h017348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 14:29:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1545053374;
	bh=qqy1ziSezoOXRAx6y76zMmfR2R9BDczEysW0yxufHdY=; l=915;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=oHb5F/9sKpWmgrRd/U/IWfp1bf0Lmp9sW42kKWKQ+9i8pAlleiIRQl22vwXLyK9rn
	hMG1eCktMVia5BSGbHIcKRP1XZRkeyLEG1wQmbKN7rwsuochAFiSiTP3Hh3qbaqhxd
	YR0sGSltymzMe7v+jOtTEZ+YUcv9EFQ1n/qmAFz8=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBHDTRBo002488 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 17 Dec 2018 14:29:28 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 2EF3F9E35D1;
	Mon, 17 Dec 2018 14:30:04 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	wBHDTHLQ002474
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 17 Dec 2018 14:29:17 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.91) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1gYsxR-007W6z-6i; Mon, 17 Dec 2018 14:29:17 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Burton\, Ross" <ross.burton@intel.com>
References: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
	<20181214181430.1517643-1-enrico.scholz@sigma-chemnitz.de>
	<CAJTo0LbuYUZSMW7oLThvgLVaXi7JNi4GWpCXKPvQ0Y3qvsg4rg@mail.gmail.com>
Date: Mon, 17 Dec 2018 14:29:17 +0100
In-Reply-To: <CAJTo0LbuYUZSMW7oLThvgLVaXi7JNi4GWpCXKPvQ0Y3qvsg4rg@mail.gmail.com>
	(Ross Burton's message of "Mon, 17 Dec 2018 13:15:17 +0000")
Message-ID: <lylg4o7042.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: build with recent attr
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
X-List-Received-Date: Mon, 17 Dec 2018 13:29:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Burton, Ross" <ross.burton@intel.com> writes:

> | In file included from port_wrappers.c:8:0,
> |                  from pseudo_wrappers.c:307:
> | ports/linux/xattr/pseudo_wrappers.c: In function =E2=80=98shared_getxat=
tr=E2=80=99:
> | ports/linux/xattr/pseudo_wrappers.c:134:11: error: =E2=80=98ENOATTR=E2=
=80=99 undeclared (first use in this function)
> |    errno =3D ENOATTR;
>
> Breaks when building with old xattr.

Yes; defining ENOATTR in <attr/xattr.h> was a mistake, violated POSIX
and causes such problems now...  I am tending to rewrite the patch with
something like

-#include <attr/xattr.h>
+#include <sys/xattr.h>
+#include <errno.h>
+#ifndef ENOATTR
+# define ENOATTR ENODATA
+#endif

and I am disussing this with Seebs atm...


Enrico
--=20
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

