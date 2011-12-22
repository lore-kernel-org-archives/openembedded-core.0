Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdhYv-0008Bl-Ai for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:15:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMC8g8l022841
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:08:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22733-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:08:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMC8XC5022835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 12:08:34 GMT
Message-ID: <1324555716.24604.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 12:08:36 +0000
In-Reply-To: <20111222091041.GI12791@jama.jama.net>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Regression bug: dbus messagebus user generation is wrong
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
X-List-Received-Date: Thu, 22 Dec 2011 12:15:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-22 at 10:10 +0100, Martin Jansa wrote:
> See http://bugzilla.pokylinux.org/show_bug.cgi?id=1711
> but it's still broken in some cases (on my buildhost 3 from 5 machines
> are broken, 2 are working after last opkg changes).

Do we have any more details on what is broken or how this is happening?
I'm at a loss as to how to help with this.

> Good test is to enable testlab and run this in your deploy/images directory
> find . ! -type l -name \*tar.gz`; do 
>   echo $i; 
>   tar -tvf $i | grep dbus-daemon-launch; 
>   tar --numeric-owner -tvf $i | grep dbus-daemon-launch; 
>   tar xzvpf $i ./etc/group; 
>   grep messagebus ./etc/group; 
> done | tee -a image.test
> 
> And working image needs to have not only messagebus as owner but also
> matching GID in 2nd line and last line from packaged /etc/group. With
> latest opkg fixes it seems to work, but only if there is messagebus in
> packaged /etc/group at all, reported here:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014619.html
> but probably got lost in other issues with new opkg, like this one
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014654.html
> (if D is not needed to be set from opkg then why was offlineroot_varname.patch
> added in first place? and I have updated this after
> offlineroot_varname.patch removal and new version is in shr branch)

I added offlineroot_varname at a point when the export D in
rootfs_ipk.bbclass was later. In the final version I moved it and the
other exports earlier to fix different problems. The patch still looked
like a good idea at that point. When a problem appeared with the patch I
decided just to drop it. We should probably continue to export PKG_ROOT
for compatibility and maybe export D in addition to that.

Cheers,

Richard




