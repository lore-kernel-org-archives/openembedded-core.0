Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id A5CE36E81A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:03:31 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so4233993obc.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2014 08:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=QLdqWTQg2/8y75HuWJbarVYOXw229mv7zLdRPa77cjY=;
	b=tvatrcxC2GURClhvJdgkvq7DGLRrI7IfuUz8lps8oQh2eoC5IcPyCLjyt39UXf3l21
	LrvEX53Z/LYRh1iUHKfuPc7017OOsQl/1uFiuaqZe7iryBe7pspsO6W59APTZrFS/1an
	GSPoeAQsJvT2Y3e+ASXjHeBAYcXd0IQM6WgNmjRSsP1t0zT3IrAj5IoPRghWas+fTcZp
	HgxqlFTzKL45XsrwsoFj1Tc2JpfI22bA2IBE1t1Ao/no19ZuLqfQDVZQl3zAeKSlJZnk
	ITmAOCgyg8FR2DcPXS9qlN+Iuu2BUm9+Ep7KmYbdMh19EhPcOoiu/gV8g0EIL43gxiXC
	DcFg==
MIME-Version: 1.0
X-Received: by 10.182.160.102 with SMTP id xj6mr13413127obb.19.1391789012165; 
	Fri, 07 Feb 2014 08:03:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 7 Feb 2014 08:03:32 -0800 (PST)
Date: Fri, 7 Feb 2014 14:03:32 -0200
X-Google-Sender-Auth: g22CRucXv7xPxeEPBfA5pPNyKw0
Message-ID: <CAP9ODKpbzOLQkQa5MDiCNdN9M9gAO054tE7X0E_p03C4OKQukw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Proposal for SDK/ADT toolchain changes
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
X-List-Received-Date: Fri, 07 Feb 2014 16:03:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I've written most of this proposal a while ago and I just forgot about
it until I got working in some customer toolchains and see same
problems which I had. So I revisited this and discussed this with some
people to get initial feedback.

I think it is 'good enough' to get a wider discussion about those
issues and possible solutions.

Proposal:

The goal of this proposal is to fix 5 current issues in today's implementation:

1. package specific environment settings in meta-toolchain recipes (qt and qte)

   The logic to populate the environment script, for later use in
toolchain, is all done in the meta-toolchain-qt.inc file so if someone
wants to make a new qt toolchain he/she will end duplicating all this
logic in another meta-toolchain-foo-qt.bb.

2. may a toolchain contain both qt and qte

   Currently this is not supported without dirty hacks but the goal is
to be able to produce a toolchain which has different runtime
libraries support.

3. allow unpack and use of a qte toolchain in addition to a qt one

   This currently does not work, if the toolchain is done for same
arch as the environment script name will clash.

4. allow all this to work fine when calling from -c populate_sdk

    The use of specific toolchain recipes should be avoided as much as
possible so all the problems (from 1 to 3) need to work fine from -c
populate_sdk

5. allow -c populate_sdk to fully replace SDK recipes by allowing SDK
components to be added dynamically based on image contents

With those concerns in mind, I would like to propose the following changes:

a. Change of generated environment-setup script so it has support to
source other scripts which will be placed at
${datadir}/environment-setup.d inside of nativesdk package so the code
from meta-toolchain-qt/qte will be moved to nativesdk-qt-tools
allowing for it to be sourced by any build toolchain (fixes issue 1 &
2 & 4)

b. Change the qt environment script so it always knows about qt and
qte; so at runtime it can check if both are installed and set the
environment for one, depending on a user choice (fixes 3)

c. Fix 5 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=5429)

The change 'b' needs some more thinking as the better would be to have
a generic way to have multiple runtime settings and be able to provide
a choice system for user to choose when doing the environment-setup.
It is not clear how it could be done in a clear way yet.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

