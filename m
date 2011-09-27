Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8bTC-0003GU-J1
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 19:29:27 +0200
Received: by vwe42 with SMTP id 42so6096009vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 10:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=HZV/LZbogLn/iZ2QjH8qNMSY7/HIOn0YqYi/waV2dyI=;
	b=BpHEII6GzX4Buym3Gll+9hBz1B3lQ4TomipR6mkhvBKBiWcdI9wPSLk+iCJg3cbLld
	ioLPJt52R8/n0MR4l1OGvYhQy4StweLu1NMx7ffMyT1/pfK6nweaG8IuDW7aZ1hRVVCu
	Nqx4cykeGxpSZYpoIp75ydyD4a0BSiL43d2oE=
Received: by 10.68.16.38 with SMTP id c6mr38550700pbd.5.1317144240033; Tue, 27
	Sep 2011 10:24:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.98 with HTTP; Tue, 27 Sep 2011 10:23:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2011 10:23:30 -0700
Message-ID: <CAMKF1spia2JSMq_jQwUUKJWUzjNC+pD-qKTiBAaSDujHuB3iPg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Selectable linker (ld or gold) per recipe
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
X-List-Received-Date: Tue, 27 Sep 2011 17:29:27 -0000
Content-Type: text/plain; charset=UTF-8

Hello

We have gold and ld available to us as linker alternatives. When
linking webkit with ld it takes 45 mins and grabs 2G of memory where
as with gold on same machine
it took 7 minutes. But then we can not use gold to link glibc and
kernel and may not work on all supported arches. So gold may not be a
complete replacement for ld. A good solution is that we make it
possible
to choose linker at compile time when building the application. gcc
does not have provisions to select linker on commandline although it
has configure
options to select default linker.

We can use two solutions

One where <target>-ld is a wrapper to ld.gold or ld.bfd and calls the
linker based on commandline options passed to it e.g
arm-oe-linux-gnueabi-ld -gold and arm-oe-linux-gnueabi-ld -bfd and
this option can be passed thru the compiler with -Wl and same wrapper
gets symlinked to the ld called by compiler driver if no option is
specified than bfd linker
is used


Second option is that we install both linkers and then add necessary
option to gcc to select the linker I have not explored this option but
it certainly would be useful

This can give us some base so we can select linker per recipe

Ideas ?

Thanks

-Khem


