Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 75C8565DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 17:16:23 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id 1tGQ1p00H0BVjqb01tGQXs; Sat, 11 Oct 2014 10:16:25 -0700
Message-ID: <543965E7.3040806@pabigot.com>
Date: Sat, 11 Oct 2014 12:16:23 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: dbus build host uid/gid leaking into target home directory
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
X-List-Received-Date: Sat, 11 Oct 2014 17:16:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Back at 
http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053836.html 
it was noted that the dbus home directory /var/lib/dbus on the target 
was using the build host uid/gid.  Various discussion agreed this 
shouldn't happen, but there was no resolution in the thread.

I found https://bugzilla.yoctoproject.org/show_bug.cgi?id=1711 which is 
marked fixed, but on a newly installed system I find:

root@beaglebone:~# ls -l /var/lib
total 52
drwxr-xr-x 2 root root 4096 Oct 11  2014 alsa
drwxr-xr-x 2 root root 4096 Oct 11  2014 arpd
drwxr-xr-x 2 root root 4096 Oct 11 12:30 connman
drwxr-xr-x 2  102  105 4096 Oct 11  2014 dbus

where the dbus uid/gid is from my host system as shown by:

root@beaglebone:~# grep dbus /etc/passwd
messagebus:x:999:998::/var/lib/dbus:/bin/false
llc[140]$ grep dbus /etc/passwd
messagebus:x:102:105::/var/run/dbus:/bin/false

This arises in an image extending core-image-base building meta-ti's 
version of beaglebone.  (I'm actually trying to fix the same problem 
arising in a patch intended to make sure ntp's home directory exists, 
but the dbus one appears to be the same thing.)

The suggested workaround for opkg of using a pkg_postinst script doesn't 
work in my case because the rpm post-install script gets run on the 
build host that's creating rootfs.The ownership is wrong in the 
generated rootfs tar files whether or not there's a post-install script 
that tries to change it.

For my ntp patch I verified that removing the package and installing it 
on the target does work as expected.

Does anybody else see this sort of thing?

If not, where in the image packaging code is the magic that's supposed 
to help pseudo record who's really supposed to own the files and 
re-apply that when the image packaging is done?

Peter

