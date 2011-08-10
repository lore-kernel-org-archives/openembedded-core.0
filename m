Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>)
	id 1QqxvF-0001vk-2H; Wed, 10 Aug 2011 03:49:29 +0200
Received: by eyb7 with SMTP id 7so565086eyb.18
	for <multiple recipients>; Tue, 09 Aug 2011 18:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=i0sgw2zkGZvNT4acBLCKpJGgmx0hMZBOjWRCNkys4Fk=;
	b=ZgobFaFZoCcQyAy++XnPOahaMLXVmSua4B1IlNTgOmVdZ02IcB8PF0hKdKunhQcrTt
	wRd1h09aN1Vhabn+TnMeWUu/0fBc9vcxgSlwmd4GTogxhrw21rjj4kT9L/7pt16sKkZ/
	thZcT09pz1B3DZ+5Qm2KdstKSKlYmolwXSj/w=
MIME-Version: 1.0
Received: by 10.213.20.19 with SMTP id d19mr8119ebb.53.1312940698805; Tue, 09
	Aug 2011 18:44:58 -0700 (PDT)
Received: by 10.213.114.20 with HTTP; Tue, 9 Aug 2011 18:44:58 -0700 (PDT)
Date: Tue, 9 Aug 2011 20:44:58 -0500
Message-ID: <CAD=GYpbJkU2wcOCjuJTdEHD6kakhbfO_GYgw3ztBiz0iPmAMzQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Subject: Help with setting up feeds
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
X-List-Received-Date: Wed, 10 Aug 2011 01:49:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm trying to setup my own feeds. For this purpose, I have rsync'ed
the deploy/ipk directory from my OE core tmp directory to my
webserver, and I edited /etc/opkg/base-feed.conf on my board's root
filesystem with:
src/gz base http://www.hackerbliss.org/joel/feeds/ipk/armv7a/

Now I created and built the systemd recipe, with the PR bumped. The
file is named systemd_v33-r1_armv7a.ipk.

I rebuilt the index with, bitbake -b package-index.bb and did an rsysnc again.

Now I did,

root@joel-laptop:~/repository/beagle/nfs/oe-core# opkg-cl -o . -t .
--offline-root . update

root@joel-laptop:~/repository/beagle/nfs/oe-core# opkg-cl -o . -t .
--offline-root . install systemd

 The install and configure seems to work, however towards the end I
get something like this:

Configuring kernel-3.0.1+.
Configuring update-modules.
Configuring kernel-module-ipv6.
Configuring systemd.
Collected errors:
 * rm_r: Failed to remove dir ./opkg-23q3XI/opkg-intercept-0Dgf2b: No
such file or directory.
 * opkg_conf_write_status_files: Can't open status file
.//usr/lib/opkg/status: No such file or directory.
 * rm_r: Failed to open dir ./opkg-23q3XI: No such file or directory.

Also the 'info' command works

root@joel-laptop:~/repository/beagle/nfs/oe-core# opkg-cl -o . -t .
--offline-root . info systemd
Package: systemd
Version: v33-r1
Depends: dbus-systemd, libcap2 (>= 2.22), libdbus-1-3 (>= 1.4.12),
libudev0 (>= 173), libwrap0 (>= 7.6), udev-systemd, libacl1 (>=
2.2.51),
[..]


but, the 'status' and 'list_installed' opkg commands don't return anything.

Any ideas on what I could be doing wrong?

Thanks,
Joel


