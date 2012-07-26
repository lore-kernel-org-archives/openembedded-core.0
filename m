Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <manuel.bessler@gmail.com>) id 1SuW8q-0005io-4k
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 00:02:44 +0200
Received: by obcva7 with SMTP id va7so3245137obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=R2ODsL3HO8I6KajilaPb+/35l4x/9/SMx1upgM345WQ=;
	b=QUMnrJHavm8AAoM5J9SVtoui7K/kgXSCbhNPMvsKsu+EJ7BfKZD6nUtiXvWd1May3O
	AU8TUobIXsWWrMrbuc+kkB7DaJwoEoaK8tFjaQ21pVyTsiyMtohQdtIBCMmlSzZjwZir
	GkQp80xBfQcbINhBdP5wViOPvuaataDd0mql85xlk0NqnRHIVQM5W8jQZK28g79niUEn
	MBS0DQiSkytdnEi0Jni+I6AhfBn9sWUSb8cj6R4/y5WpPXozqzDQIvAcUOjN7LY+guGK
	e9o7Ek+Amo0+wdRBOdM6+CI8b/9/mmg3pZk1JqTZ7EvEFjd1+qVYF/m0hYwFfTf3g7JJ
	YXsg==
MIME-Version: 1.0
Received: by 10.60.28.101 with SMTP id a5mr295543oeh.69.1343339472390; Thu, 26
	Jul 2012 14:51:12 -0700 (PDT)
Received: by 10.76.163.68 with HTTP; Thu, 26 Jul 2012 14:51:12 -0700 (PDT)
Date: Thu, 26 Jul 2012 17:51:12 -0400
Message-ID: <CAKSdS8LwF4XvBcuAoJ=36tOMMGF=VRLPoar5Tp9dCf+69JtiOw@mail.gmail.com>
From: Manuel Bessler <manuel.bessler@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: libc-common.bbclass and uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 22:02:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm one of the (seemingly few) people using OE/Yocto on a uclibc platform.

Since I'm using a vendor-supplied toolchain, I had to make a few changes to
keep the build from trying to build uclibc despite it was being supplied via
the toolchain.

Comparing with the external-csl-toolchain recipe I found that it
"require"s eglibc-package.inc,
so I created a uclibc-package.inc. This fixed the above issue of
trying to build uclibc despite
it was already provided by the external toolchain.

In creating uclibc-package.inc I tried to follow closely how
eglibc-package.inc was implemented.

This has worked for me well until I started on the nativesdk with
external toolchain.
I noticed that my external-toolchain-xxx-cross-canadian_xxx.bb recipe
(which provides
uclibc*, binutils-cross-canadian, and gcc-cross-canadian) created
libc6, libc6-dev, and libc6-dbg
packages.

A quick search revealed meta/classes/libc-common.bbclass referencing libc6.
Function populate_packages_prepend() seems to just overwrite
PKG_${BPN} with libc6.

=========================================
python populate_packages_prepend () {
        if d.getVar('DEBIAN_NAMES', True):
                bpn = d.getVar('BPN', True)
                d.setVar('PKG_'+bpn, 'libc6')
...
=========================================

It does not seem to care about uclibc.
Maybe libc-common.bbclass is only for eglibc and might need a better name?
Since this is checking for "DEBIAN_NAMES" and I guess debian is not
uclibc based,
maybe this code is not really the issue...

Do I just need to create a uclibc-common.bbclass ?

Thanks,
Manuel


