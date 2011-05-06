Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QILI1-0000Xj-9g
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 15:41:53 +0200
Received: by wye20 with SMTP id 20so2709925wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 06:39:12 -0700 (PDT)
Received: by 10.216.246.74 with SMTP id p52mr3749356wer.41.1304689152203;
	Fri, 06 May 2011 06:39:12 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	bd8sm2003735wbb.48.2011.05.06.06.39.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 06:39:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 6 May 2011 15:39:09 +0200
Message-Id: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 13:41:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

The past few days I have gotten systemd to work in OE.dev and I have =
some questions on how to do in the oe-core universe. First some =
background:

Systemd is a /sbin/init replacement using ideas from apples launchd like =
socket activation. Startup scripts are replaced by .ini like files:

sshd.socket:
------------------------------------------
[Unit]
Description=3DOpenSSH Server Socket.
Conflicts=3Dsshd.service

[Socket]
ListenStream=3D22
Accept=3Dyes

[Install]
WantedBy=3Dsockets.target
------------------------------------------

sshd@.service
------------------------------------------
[Unit]
Description=3DOpenSSH per connection server daemon.
After=3Dsyslog.target=20

[Service]
ExecStartPre=3D/usr/sbin/sshd -t
ExecStart=3D-/usr/sbin/sshd -i
StandardInput=3Dsocket
------------------------------------------

The above 2 units combined will start openssh as soon as port 22 is =
being accessed. This is comparable with inetd. For sysV style init you =
can use something like this:

sshd.service:
------------------------------------------
[Unit]
Description=3DOpenSSH server daemon.
After=3Dsyslog.target network.target

[Service]
Type=3Dforking
PIDFile=3D/var/run/sshd.pid
EnvironmentFile=3D/etc/sysconfig/sshd
ExecStartPre=3D/usr/sbin/sshd -t
ExecStart=3D/usr/sbin/sshd $OPTIONS

[Install]
WantedBy=3Dmulti-user.target
------------------------------------------

All those files are placed in /lib/systemd/system. You can make those =
exec the old sysv scripts if you wish.

Now onto my issues:

packaging:
	In OE .dev I added FILES_${PN} +=3D "${base_libdir}/systemd" to =
udev, dbus, rsyslog and avahi. This means we end up with both sysV =
script and systemd units. What I would like to have is ${PN}-sysvinit =
and ${PN}-systemd and the image recipe can choose which init systems =
gets used. Is something like that possible? Are there better ways? Note =
that systemd support sysV initscripts as well, but it needs some care =
with naming. As I understand it, if a unit is found with the same name =
as a sysV script, only the unit will get used.
A rootfs postprocess command that deletes /etc/init.d won't work, since =
it will come back when upgrading the packages.

building:
	At the moment systemd enabled software installs the units =
regardless or config options. What should be do with software that has =
an option for that? And what if we need to patch the units files in? The =
initsystem is a choice at the image level, so artificially limiting it =
to a distro choice is not a good idea.

sharing:
	The Arch people have a github with their custom units: =
https://github.com/falconindy/systemd-arch-units/ Do we use those? Do we =
use fedora ones https://bugzilla.redhat.com/show_bug.cgi?id=3D697698 ? =
People on #systemd are talking about a shared repo on fd.o, but nothing =
tangible yet.

And related to this: how do I get the "installed but not packaged" =
output back? The bitbake logging changes are hiding it now, which is =
counterproductive.=20

So, what are your thoughts on all this?

regards,

Koen=


