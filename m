Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 48492700FD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 22:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49MGXAQ008788; Mon, 9 May 2016 23:16:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ri5bySee-7K0; Mon,  9 May 2016 23:16:33 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49MGU1t008785
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 9 May 2016 23:16:31 +0100
Message-ID: <1462832190.21831.156.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>, "Bystricky, Juro"
	<juro.bystricky@intel.com>
Date: Mon, 09 May 2016 23:16:30 +0100
In-Reply-To: <CABcZAN=jh=+8PMVw2YMw41Aax1hmssjOVe24SG9XhjB4HgQuwQ@mail.gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
	<CABcZANmJe_UvZ6zeuMTwiyx9X+xY9ATD9XVW7ESrskMtjPL4YQ@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61181DEFA@ORSMSX112.amr.corp.intel.com>
	<CABcZAN=jh=+8PMVw2YMw41Aax1hmssjOVe24SG9XhjB4HgQuwQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 09 May 2016 22:16:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-09 at 09:39 -0700, Christopher Larson wrote:
> 
> 
> On Mon, May 9, 2016 at 9:35 AM, Bystricky, Juro <
> juro.bystricky@intel.com> wrote:
> > Two additional GNU_HASH related errors were observed (breaking some
> > builds) that seem to be related to the patch:
> >  
> > ERROR: bash-3.2.48-r11 do_package_qa: QA Issue: No GNU_HASH in the
> > elf binary: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly
> > -non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48
> > -r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/recho'
> > No GNU_HASH in the elf binary: '/home/pokybuild/yocto
> > -autobuilder/yocto-worker/nightly-non
> > -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages
> > -split/bash-ptest/usr/lib/bash/ptest/tests/zecho'
> > No GNU_HASH in the elf binary: '/home/pokybuild/yocto
> > -autobuilder/yocto-worker/nightly-non
> > -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages
> > -split/bash-ptest/usr/lib/bash/ptest/tests/printenv' [ldflags]
> > ERROR: bash-3.2.48-r11 do_package_qa: QA run found fatal errors.
> > Please consider fixing them.
> >  
> >  
> > ERROR: service-0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the
> > elf binary: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly
> > -qa-skeleton/build/build/tmp/work/core2-64-poky-linux/service/0.1
> > -r0/packages-split/service/usr/sbin/skeleton-test' [ldflags]
> > 
> Huh, I must not have had ptest enabled in my test builds. Thanks,
> will take a look.

The above is an older gplv2 recipe failure which is probably why you
didn't see it.

I'm afraid there were more. pseudo:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
ds/747/steps/BuildImages_1/logs/stdio

qt-x11-free:

https://autobuilder.yoctoproject.or
g/main/builders/nightly-arm-lsb/builds/734/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/buil
ds/744/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
uilds/779/steps/BuildImages/logs/stdio

service in qa-skeleton:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/
builds/753/steps/BuildImages/logs/stdio

ruby and mkefiimage:

https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
s/104/steps/BuildImages/logs/stdio

(selftest also showed mkefimage failure)

Cheers,

Richard


