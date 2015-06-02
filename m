Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id F0F3B757BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 20:56:23 +0000 (UTC)
Received: by oihd6 with SMTP id d6so135567593oih.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 13:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Z2NHTWbsnPeALBCERxU8JMbT/rha9bhE88KMhHRkTh4=;
	b=vYZve9A+sO5BXDIBTZvdkAXdseEbuhzHUjXoeIlMh24f4mDnN/LhSnwUDekFRzTQTy
	jOOy5Hj1Ew70tlX4Iw0s+a5pbSCBLSg+otWtYUCx7RTBGyxrNdjeAEFnDnaLgBfWtS0X
	yN4fQqGdlnb7ggxLkhPVnz5sg9Idas+bX19bIyTOIbFjt9TXPAflWCOmQ/inr2+b2l67
	DFia+iYopyAc4VSScoOUDhU3hJKzBHJ9S4kVxW9f7HwzeJiyNk3AKr7McEb2T0mATzce
	U0OK+ay3u509ynubIAXegQSuQOUDpUb1pi+l88w8Pi5S4BvIjI6eiWB2v3qeul+VoKdL
	ZhCA==
MIME-Version: 1.0
X-Received: by 10.60.176.37 with SMTP id cf5mr24513987oec.19.1433278584418;
	Tue, 02 Jun 2015 13:56:24 -0700 (PDT)
Received: by 10.202.44.23 with HTTP; Tue, 2 Jun 2015 13:56:24 -0700 (PDT)
Date: Tue, 2 Jun 2015 13:56:24 -0700
Message-ID: <CAJ86T=XUnB_AUSzQOeU6FjGPdsfbRgr2XZ=MFuwuDFaNkYmKnA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Fixing performance for Intel Atom
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
X-List-Received-Date: Tue, 02 Jun 2015 20:56:24 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

I've recently been looking into a performance regression when
switching from my SoC vendor's pre-compiled legacy SDK toolchain (gcc
4.5.1 + glibc 2.11) to OE. The CPU is a 45nm Intel Atom and my machine
config includes tune-atom.inc. The root cause of the slowdown seems to
be that by default OE for 32bit x86 configures glibc for i586-*-linux
and therefore does not enable the SSE optimised string functions, etc,
etc which are available when building glibc for i686-*-linux.

Performance of the OE builds can be restored by setting X86ARCH32 to
"i686" in tune-core2.inc. This seems to be a correct and valid fix,
applicable to atom, core2 and corei7 and hopefully acceptable for
upstream oe-core.

However, a side effect of the fix is that TRANSLATED_TARGET_ARCH
changes from i586 to i686, which means that any _i586 over-rides stop
working and I'm not sure on the best way to solve that.

Looking at the _i586 over-rides in oe-core and meta-oe, there aren't
many and most could (should?) probably be replaced with _x86 instead.
An alternative might be to duplicate every _i586 over-ride for _i686
(it's already done that way for KLIBC_ARCH and QEMUARCH in meta-oe).
Which would be the preferred approach?

Thanks
Andre
--

