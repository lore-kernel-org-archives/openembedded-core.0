Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QqraU-00059L-1y
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 21:03:38 +0200
Received: by fxg11 with SMTP id 11so372686fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=c/CkNOpnWACKoG7AUY2BrTxnKNjnOhTdQjnO9RoVEIo=;
	b=q9aN+LFeq673cFr7GkUxJvcglBf1+j44faIWQ7UrFIvRy5cL+FhQZWao0wQylxcR53
	JloIGDgWKWiOAXFbPimBB2CsUyHTIpz6OaTli5JwdkyqJ6kHpVQarJdJZRb6lI0fiLY9
	EM9a853bJA0x1HHdEocs0fdME9pQSbnjjWKDM=
MIME-Version: 1.0
Received: by 10.223.16.210 with SMTP id p18mr9765845faa.71.1312916348764; Tue,
	09 Aug 2011 11:59:08 -0700 (PDT)
Received: by 10.223.132.196 with HTTP; Tue, 9 Aug 2011 11:59:08 -0700 (PDT)
In-Reply-To: <CAD=GYpZadKJYSOxnhyMtJOWOjO2iX6tpaWrGGZPtcc4bYvzTtQ@mail.gmail.com>
References: <CAD=GYpZadKJYSOxnhyMtJOWOjO2iX6tpaWrGGZPtcc4bYvzTtQ@mail.gmail.com>
Date: Tue, 9 Aug 2011 13:59:08 -0500
Message-ID: <CAD=GYpY1ki5Y_u0KFWf+TJBJxDoSzvpV7W2hXBC1XJqfhruOPw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Cc: beagleboard@googlegroups.com,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd boot hang
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
X-List-Received-Date: Tue, 09 Aug 2011 19:03:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Just posted this on the systemd mailing list.

It seems that I didn't go through enough testing on the
systemd-gnome-image built by OE. The success I reported with boot SD
card instead of over NFS was just a got-lucky case. So SD Card and NFS
alike, the boot still hangs.

Koen and others, could you try my image?
http://www.beagleboard.org/~joelf/images/Angstrom-systemd-GNOME-image-eglib=
c-ipk-v2011.08-core-beagleboard.rootfs.tar.bz2

This is built from meta-angstrom master HEAD
(7c54f644aaf7a5cade2b405bd4a2a7316d3a9dfb).
"bitbake systemd-gnome-image".

Also, Is there a simple way to switch to sysvinit so that I can
atleast be able to boot an oe-core built image and use it as a
baseline? I tried setting IMAGE_INIT_MANAGER =3D "sysvinit" and removing
all systemd dependent packages, but the image failed to build at the
opkg install sysvinit stage saying that certain directories such as
"/var/cache" already exist.

Note: every once in a while with 3.0.1 that's in this image, I get the
power management lookup table kernel-panic. But I can live that for
now.

Thanks,
Joel

On Tue, Aug 9, 2011 at 1:28 PM, Joel A Fernandes <agnel.joel@gmail.com> wro=
te:
> Hi, I'm using kernel 3.0.1 and systemd, the boot process hangs. I am
> booting from an SD Card using the BeagleBoard.
>
> I am passing "systemd.log_target=3Dkmsg systemd.log_level=3Ddebug" in my
> boot arguments but I don't see any debug messages.
>
> Could anyone help me out? Thanks
>
> Starting udev Coldplug all Devices...
> Starting udev Kernel Device Manager...
> Started Load Kernel Modules.
> Started Set Up Additional Binary Formats.
> [ =A0 =A04.701141] udevd[52]: starting version 173
> Started Apply Kernel Variables.
> Starting Syslog Kernel Log Buffer Bridge...
> Started Syslog Kernel Log Buffer Bridge.
> Starting /var/volatile...
> Starting /tmp...
> Starting Setup Virtual Console...
> Started Opkg first boot configure.
> Starting Remount API VFS...
> Starting File System Check on Root Device...
> Starting Lock Directory...
> Starting Media Directory...
> Started Runtime Directory.
> Started udev Kernel Device Manager.
> Started /var/volatile.
> [ =A0 =A04.932647] systemd-fsck[61]: Root directory is writable, skipping=
 check.
> Started /tmp.
> Started File System Check on Root Device.
> Started Lock Directory.
> Started Remount API VFS.
> Started Media Directory.
> Starting Remount Root FS...
> Starting /var/tmp...
> Started /var/tmp.
> Starting Stdio Syslog Bridge...
> [ =A0 =A05.081146] systemd-vconsole-setup[57]: /usr/bin/loadkeys failed
> with error code 1.
> Started Stdio Syslog Bridge.
> [ =A0 =A05.135314] systemd-vconsole-setup[57]: cannot open file us
> Started udev Coldplug all Devices.
> Started Setup Virtual Console.
> Started Remount Root FS.
> Starting Load Random Seed...
> Starting Recreate Volatile Files and Directories...
> Started Load Random Seed.
> Started Recreate Volatile Files and Directories.
> Starting Console System Startup Logging...
> Starting ntpd.service...
> Starting xinetd.service...
> Started SSH Key Generation.
> Starting D-Bus System Message Bus...
> Starting Login Service...
> Starting Permit User Sessions...
> Started Permit User Sessions.
> Starting ntpd: Started Console System Startup Logging.
> Started D-Bus System Message Bus.
> Starting internet superserver: xinetd.
> [ =A0 =A05.773284] ntpd[137]: ntpd 4.2.6p3@1.2290 Fri Jul 29 17:35:18 UTC=
 2011 (2)
> done
> [ =A0 =A05.809906] ntpd[154]: proto: precision =3D 30.517 usec
> [ =A0 =A05.829437] ntpd[154]: Listen and drop on 0 v4wildcard 0.0.0.0 UDP=
 123
> [ =A0 =A05.849182] xinetd[156]: 156 {init_services} no services. Exiting.=
..
> [ =A0 =A05.864044] ntpd[154]: Listen and drop on 1 v6wildcard :: UDP 123
> [ =A0 =A05.882141] ntpd[154]: Listen normally on 2 lo 127.0.0.1 UDP 123
> [ =A0 =A05.906188] ntpd[154]: Listen normally on 3 lo ::1 UDP 123
> [ =A0 =A05.935424] ntpd[154]: peers refreshed
> [ =A0 =A05.939361] ntpd[154]: Deferring DNS for pool.ntp.org 1
> [ =A0 =A06.385498] twl_rtc twl_rtc: rtc core: registered twl_rtc as rtc0
> [ =A0 =A07.948211] ntpd_intres[162]: host name not found: pool.ntp.org
>


