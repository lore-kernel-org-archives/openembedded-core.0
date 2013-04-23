Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UUYXO-0007cS-Ct
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 10:25:22 +0200
Received: by mail-ea0-f173.google.com with SMTP id m14so112583eaj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer:x-gm-message-state;
	bh=P3jyNy7z8fUVLutBbaeY0DhDir0Tf4suwSDAQHpRCvU=;
	b=BDwc9zdqx4eXAe9ETA3ofAYBT3sF0k8WC0fI8WE/snPSESi2zH+0eSwRiNd0yKKXPF
	lI6QjSSJSP65BCEdjhmoaZEtyf07DRMht+JC8h2DSil0j5J4tvqJNB8/QvvSFDtalQ7s
	ARQ90v+2wMA6HGKQyVhoYolWa8wf8CKwM2NEfxcFxDlKEGfqU6nbUw0idPsGy04Ekaoi
	FLwrSIomnHHVIudj5/pUhLUaWnALVya9LfY8epLo24J9wSGkRqd/wibEDPoYnwz9fnEF
	/a8gtxxXtreUnaPBH5en/etH4HsMfOBBhYzws50s0iiYQWnoABp8fz+s/U26HvXmtcgX
	6RhQ==
X-Received: by 10.15.101.200 with SMTP id bp48mr48553251eeb.38.1366704457145; 
	Tue, 23 Apr 2013 01:07:37 -0700 (PDT)
Received: from ?IPv6:2001:610:612::806f:be70:89e8:9aa6?
	([2001:610:612:0:806f:be70:89e8:9aa6])
	by mx.google.com with ESMTPS id b5sm45190500eew.16.2013.04.23.01.07.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 01:07:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <FE75BA17-4A83-48A8-A237-54422228FCD7@dominion.thruhere.net>
Date: Tue, 23 Apr 2013 10:07:35 +0200
To: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlTgmf669trAivJmDgg2ujEIugvafmFSc7Ip86OQQd/2K94u41XAr3Px3qS0DZo4UpCGh5J
Subject: DISTRO_FEATURES_BACKFILL_CONSIDERED_append usage
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
X-List-Received-Date: Tue, 23 Apr 2013 08:25:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I've had the following in my DISTRO.conf for a while now:

	DISTRO_FEATURES_BACKFILL_CONSIDERED_append =3D " sysvinit"

And that seems to do the right thing:

	[koen@rrMBP v2013.06]$ MACHINE=3Dminnow bitbake systemd -e | =
grep DISTRO_FEATURES | grep BACK
	# $DISTRO_FEATURES_BACKFILL
	DISTRO_FEATURES_BACKFILL=3D"pulseaudio sysvinit"
	# $DISTRO_FEATURES_BACKFILL_CONSIDERED [2 operations]
	DISTRO_FEATURES_BACKFILL_CONSIDERED=3D"sysvinit"

Except that it doesn't:

[koen@rrMBP v2013.06]$ MACHINE=3Dminnow bitbake systemd -e | grep =
DISTRO_FEATURES | grep sysvinit
#   "alsa argp bluetooth ext2 ipv4 ipv6 irda largefile nfs pam pci =
pcmcia ppp smbfs systemd usbgadget usbhost vfat wifi xattr zeroconf tk =
x11 wayland 3g 	pulseaudio ${DISTRO_GLFEATURES} ${DISTRO_FEATURES_LIBC} =
${LDISGOLD} sysvinit"
DISTRO_FEATURES=3D"alsa argp bluetooth ext2 ipv4 ipv6 irda largefile nfs =
pam pci pcmcia ppp smbfs systemd usbgadget usbhost vfat wifi xattr =
zeroconf tk x11 wayland 3g pulseaudio opengl ipv4 ipv6 libc-backtrace =
libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets =
libc-crypt                                         libc-crypt-ufc =
libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab =
libc-ftraverse                                        libc-getlogin =
libc-idn libc-inet-anl libc-libm libc-libm-big libc-locales =
libc-locale-code                                    libc-memusage =
libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams =
libc-sunrpc                                   libc-utmp libc-utmpx =
libc-wordexp libc-posix-clang-wchar libc-posix-regexp =
libc-posix-regexp-glibc                                       =
libc-posix-wchar-io  sysvinit"

Remembering the IMAGE_FSTYPES_append vs. +=3D discussion, I tried:

	DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"

The result:

	[koen@rrMBP v2013.06]$ MACHINE=3Dminnow bitbake systemd -e | =
grep DISTRO_FEATURES | grep sysvinit
	ERROR: Please ensure that your setting of =
VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in =
DISTRO_FEATURES

Hmmm, let's set VIRTUAL-RUNTIME_init_manager and retry:

	[koen@rrMBP v2013.06]$ MACHINE=3Dminnow bitbake systemd -e | =
grep DISTRO_FEATURES | grep sysvinit
	DISTRO_FEATURES_BACKFILL=3D"pulseaudio sysvinit"=20
	DISTRO_FEATURES_BACKFILL_CONSIDERED=3D"sysvinit"

\o/

So, is this a bug or intended behaviour for =
DISTRO_FEATURES_BACKFILL_CONSIDERED_append?

regards,

Koen=


