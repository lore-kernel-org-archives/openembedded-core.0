Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 85AC577FC9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 14:23:38 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u138so2547652wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=24mKWMGXUnGH1Yoi09xhDHHyIWImnBJ1FuJQUbaO8VY=;
	b=lBEawCiotnNC8FjX7OJS3rR5EbgKNQrW8wnEEW6ajgcVqJqNm9kpZDCo1oIYIsP0rL
	xLvMXlOGzwe8uAmtQpX+9jdwPAkJm5XYuFxLfamSt/5KQ9qNE13FCTOdQisrN4t5K7jj
	BXGoIQqSiiR2IH9u95WxDaetv9Vk/N0d27j9KYdsuNZcft7JJSR49daunhgkD1+hV/ee
	X8I6+nVwugFsgrthV5Evz4m6oCptWZDlsumzK1c/KSNaV0nhhw8wiMg+W0rRh0I+g3Gf
	z+MC2cFIC80uOUbiFyTZCWjKKbcdjAYZgP7jPF9Mg92uCL1Qx/Bthrpeyjdsa067mt7C
	udSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=24mKWMGXUnGH1Yoi09xhDHHyIWImnBJ1FuJQUbaO8VY=;
	b=jSF6Gf4YcwUi+WWDzzhWotUGHQYpmEap1ADgHcTagbiTK+GpbBWMM1Vs1XcxZNseuu
	IsYclOK0UzD6JEfKktN4tXQvrgY3IZ/7ygbEbQhRRbYZCbKV5HMZtnQgpU1Gcqq4T/lY
	gXb7OKcWacCpUTf0oPFqJFRimFLEHGbss1Pt9CoYS45jiU6JXqYnFgV/78Ab3SRjU55s
	HC52ZvjJaS9/JBqI87lCFdgwljkx4g372zmBKXmnXWGIRGJWRYP3jvISziS28YnY9BB0
	OTvEmNhXnRTBx1EwHPqBHohE6ULTInUIJzkIF7a/vBnJuejLaEMoe6Ir/H2SZ6POgnM7
	O4OQ==
X-Gm-Message-State: AMCzsaV4wJw+jzOs0H+EEJpUDuJnWL3fQkIkfS6la4mRgY1wP9UWQWPQ
	6x2KrOScbC9F4jenHET44t+FanN7zbWeCdHlCVnSvojq
X-Google-Smtp-Source: AOwi7QDLVzkZ2enA+kWCeLpuEQXkPHvLMCjyfYUI8N3Djr5Oj4IrTjzspiekEqXBY23uMhjjyWehZackDnKgRGHqkdc=
X-Received: by 10.28.19.11 with SMTP id 11mr20584705wmt.122.1507213419123;
	Thu, 05 Oct 2017 07:23:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Thu, 5 Oct 2017 07:23:38 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 5 Oct 2017 15:23:38 +0100
Message-ID: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Thu, 05 Oct 2017 14:23:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So, after fixing all my build issues I now have runtime issues :(

Software written in go fails on qemux86 with illegal instruction traps:

    root@qemux86:~# netns ls
    [   18.984298] traps: netns[491] trap invalid opcode ip:807b541
sp:bf9694bc error:0[   18.985354]  in netns[8048000+1c3000]
    Illegal instruction
    root@qemux86:~# runc
    traps: runc[492] trap invalid opcode ip:807b561 sp:bff6ec1c
error:0[   21.604966]  in runc[8048000+457000]
    Illegal instruction

I've done a git bisect and tracked this down to commit 20b35747
"qemuboot.conf: make cpus match built artifacts" on master. This has
been backported to pyro as commit d9456782 and I've confirmed that I
have the same issue on pyro. On pyro in particular this is a
regression as the patch was backported after pyro was released.

The important change is:

    -QB_CPU_x86 =3D "-cpu qemu32"
    +QB_CPU_x86 =3D "-cpu pentium2"

So my guess was that the go toolchain isn't limiting itself to the
instructions supported by pentium2.

To fix things I've added the following line to meta/classes/go.bbclass
and meta/recipes-devtools/go/go-common.inc:

    export GO386 =3D "387"

As documented in https://golang.org/doc/install/source, this ensures
that sse2 instructions aren't used. This fixes the issue and I now
have working go binaries on qemux86 :)

So my question is: should we just set GO386 =3D "387" so that it applies
to all go binaries and accept the slight loss of performance on x86
systems that do support sse2 instructions? Or should we make this
MACHINE specific so that sse2 instructions can be used where
supported?

Whatever we do will need backporting to pyro as well.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

