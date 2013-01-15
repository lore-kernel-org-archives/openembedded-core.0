Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1TuyBb-00078A-0h
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 05:31:45 +0100
Received: by mail-wg0-f41.google.com with SMTP id ds1so1570792wgb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 20:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=OrY7GxHtn7hRUJHueMsqKrrRlH2qL90zqfKi/ELH5I8=;
	b=zCqh430UBUXhy1KmMfSZxgrMiYpKNp7MEc4lQhVFQL012Potni9/OFgiSVkf11Qq2a
	1vg/NfUVeFFmF4QHhyukvaN/V+0sbYHTtau0E1YOyWxVakEeBfEWyGaaxGQ1UOf/zoiG
	3bbc1ae5pGnz5qD6cU58bE/HPSJ3wFHqmJ0v938M4mUPCK9eZiTfPrvRKqriUIQEP83b
	cnOn+S/hl8RCdSMlv6nVOBtgK9xNDm9pAUGGzQgYJTC8THmEt83bpcAuTIhgesrAToXF
	XeOzxmMz8O8HuSgU3ecPpDuh56cHm4oEfHYokBGBJLolj0JgX4V1LgGcVoTzqvcplPvm
	HsnQ==
MIME-Version: 1.0
Received: by 10.194.9.197 with SMTP id c5mr139053517wjb.20.1358223380916; Mon,
	14 Jan 2013 20:16:20 -0800 (PST)
Received: by 10.227.132.205 with HTTP; Mon, 14 Jan 2013 20:16:20 -0800 (PST)
Date: Mon, 14 Jan 2013 23:16:20 -0500
Message-ID: <CAHUNapRTL1j5S1hW+VxjGVvGjBPA0uy0kS4g1LpyYT9Q7q9J6Q@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: image creation and deployment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 04:31:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

(sorry I don't have the original email around to which to reply...)

For the past many years I have been accumulating various scripts which
I have used to create the root filesystems for various embedded
systems. These scripts create updates, generate artifacts for creating
bootable CF cards, and produce complete VMDK images in one VMDK file.
This script allows the user on the cmdline to specify things such as
the size, number, and filesystem for a flexible number of partitions.
These scripts work on systems that are both 8 years old, as well as
the latest distributions, they work with systems that have a little
memory, to ones with lots. They can use any of lilo, extlinux, or
u-boot (specified on the cmdline).

I want to begin integrating this work with OE/YP in order to provide a
demonstration so others can evaluate it and decide if this is
something along the lines of what they'd find useful.

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/023484.html
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026938.html

Although I'm quite familiar with my scripts... with OE/YP, not so
much. So I was hoping to find some pointers for how I might proceed
with this integration.

Currently my scripts still require various privileges. So in the same
way that a build runs to completion and then the user might run
"runqemu" from the poky/scripts directory (and be required to give the
root user's password to setup the tap networking), I would like to
create a script in poky/scripts that would be run after a successful
build which also might require root's password.

I would like to ignore any images that are created as part of the
build and rely solely on a package feed.

So, provided a package feed is available, what would be the easiest
way, in a shell script (run after a successful build), to say:
"populate this random (specified) <directory> with all the packages
the user wishes in their image". In other words I don't want to have
to care whether the user has selected RPM or DEB, or IPK, and
(preferably) I don't want to have to care what packages the user has
selected (through various means) to be installed.

I want to setup and create <directory> beforehand, I want OE/YP to
populate it (without deleting <directory> or changing it in any way
other than to populate it), then I want OE/YP to leave it alone for me
to post-process.

Is that possible?

I was thinking that, as a kludge, I could use bitbake-env if I needed
to get bitbake variables into the script.

Any suggestions?


