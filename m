Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Qot2z-0007Mr-Af
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 10:12:53 +0200
Received: by wyg30 with SMTP id 30so1237085wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=d3KcgxOnP7RRh2W4Dmzg+tGZB3lKuHXU6BeH59c/3sw=;
	b=X2HuRC/ebIQSP9rX49DP3EnGEAJKpYMwjDToTsvraEraU/H8DEAUyJJQ07tihz7ymL
	bvwqC5HUFZfXXB36c6gpYFdWMiwpdwyOraTnU4HqZPl0SNLn++CGFRNLkl5DRHY2C1Qz
	rnNeHth+rNC6VBomFkEnMYE6o7xM28X5gm1Ck=
MIME-Version: 1.0
Received: by 10.227.6.205 with SMTP id a13mr396693wba.106.1312445310113; Thu,
	04 Aug 2011 01:08:30 -0700 (PDT)
Received: by 10.227.2.74 with HTTP; Thu, 4 Aug 2011 01:08:30 -0700 (PDT)
In-Reply-To: <4E396097.1000207@gmail.com>
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
	<4E396097.1000207@gmail.com>
Date: Thu, 4 Aug 2011 10:08:30 +0200
Message-ID: <CAGiJk9fsRGZiA92vpOcT8X95KscOg-vFxqdB7hcW16MOSk0PWQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error running QEMU with oe-core / angstrom console-image, hwclock: can't open '/dev/misc/rtc' : No such file or directory
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
X-List-Received-Date: Thu, 04 Aug 2011 08:12:53 -0000
X-Groupsio-MsgNum: 7518
Content-Type: multipart/mixed; boundary=002215974dee7f196904a9a97c11

--002215974dee7f196904a9a97c11
Content-Type: text/plain; charset=ISO-8859-1

2011/8/3 Khem Raj <raj.khem@gmail.com>:
> There is a smart script in scripts/ dir that you could use something like
> this
>
> runqemu /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
>
> and it will setup everything (even networking) for you
>
Already tried this one, but for some unknown reasons it doesn't work,
I get the following output:
-
samuel@S-Linux:/var/oe-core/setup-scripts$ runqemu
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
Set MACHINE to [qemuarm] based on kernel
[/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]

Continuing with the following parameters:
KERNEL: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin]
ROOTFS: [/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2]
FSTYPE: [ext2]
Setting up tap interface under sudo
[sudo] password for samuel:
sudo runqemu-ifup <gid> <native-sysroot-basedir>
samuel@S-Linux:/var/oe-core/setup-scripts$
-
This is all, no QEMU window appears or any other messages, or do I
have run something else.

For remote debugging purpose I wrote a generic script that will set up
a tap and bridge interface and restores the network connection after
qemu closes.
This script can also run QEMU with standard network settings.
Basically runqemu and my scripts should do the same thing(?), but
since runqemu doesn't work for me I made my own scripts (also it won't
need sudo if the standard network option is used).

The scripts are attached in this mail, to run the script you could use
"sh /somedir/generic_qemu_loader.sh --help".
This script however may not work on other systems than ubuntu, I share
it only for information exchange purpose.
If you still want to use it, keep in thought that I am a beginner in
shell coding!

The difference between the standard network settings and the
bridge/tap interfaces is, that the standard network only supports
outgoing TCP and UDP connections while the bridge/tap interface can be
used to host, for example, a gdbserver.


Regards
Samuel

--002215974dee7f196904a9a97c11
Content-Type: application/x-gzip; name="generic_qemu_loader.tar.gz"
Content-Disposition: attachment; filename="generic_qemu_loader.tar.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gqxftmk90

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

--002215974dee7f196904a9a97c11--
