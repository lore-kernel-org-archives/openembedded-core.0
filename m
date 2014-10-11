Return-Path: <gary@mlbassoc.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 11 Oct 2014 21:20:11 UTC
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A0FFD6FDEB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 21:20:11 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4B1D6F811E1; Sat, 11 Oct 2014 15:10:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 33573F811DE;
	Sat, 11 Oct 2014 15:10:38 -0600 (MDT)
Message-ID: <54399CE0.5000807@mlbassoc.com>
Date: Sat, 11 Oct 2014 15:10:56 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <543965E7.3040806@pabigot.com>
In-Reply-To: <543965E7.3040806@pabigot.com>
Subject: Re: dbus build host uid/gid leaking into target home directory
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
X-List-Received-Date: Sat, 11 Oct 2014 21:20:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-10-11 11:16, Peter A. Bigot wrote:
> Back at http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053836.html it was noted that the dbus home directory /var/lib/dbus on the target was using the
> build host uid/gid.  Various discussion agreed this shouldn't happen, but there was no resolution in the thread.
>
> I found https://bugzilla.yoctoproject.org/show_bug.cgi?id=1711 which is marked fixed, but on a newly installed system I find:
>
> root@beaglebone:~# ls -l /var/lib
> total 52
> drwxr-xr-x 2 root root 4096 Oct 11  2014 alsa
> drwxr-xr-x 2 root root 4096 Oct 11  2014 arpd
> drwxr-xr-x 2 root root 4096 Oct 11 12:30 connman
> drwxr-xr-x 2  102  105 4096 Oct 11  2014 dbus
>
> where the dbus uid/gid is from my host system as shown by:
>
> root@beaglebone:~# grep dbus /etc/passwd
> messagebus:x:999:998::/var/lib/dbus:/bin/false
> llc[140]$ grep dbus /etc/passwd
> messagebus:x:102:105::/var/run/dbus:/bin/false
>
> This arises in an image extending core-image-base building meta-ti's version of beaglebone.  (I'm actually trying to fix the same problem arising in a patch intended to make sure
> ntp's home directory exists, but the dbus one appears to be the same thing.)
>
> The suggested workaround for opkg of using a pkg_postinst script doesn't work in my case because the rpm post-install script gets run on the build host that's creating rootfs.The
> ownership is wrong in the generated rootfs tar files whether or not there's a post-install script that tries to change it.
>
> For my ntp patch I verified that removing the package and installing it on the target does work as expected.
>
> Does anybody else see this sort of thing?
>
> If not, where in the image packaging code is the magic that's supposed to help pseudo record who's really supposed to own the files and re-apply that when the image packaging is done?

It does not happen in my builds which are more-or-less stock
Poky (I have my own distro and BSP layers).  Must be something
going on in the meta-ti layer?

Are you using the latest OE-core (or Poky/Yocto) master?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

