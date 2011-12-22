Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1RdffE-0001cO-1e
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 11:14:16 +0100
Received: from [62.99.145.8] (port=44520 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1RdfYI-0005Ms-Fr
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 11:07:06 +0100
Received: from [83.64.51.210] (port=10566 helo=gateway1.hale)
	by smartmx-08.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1RdfYC-0000Mn-Co for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 11:07:00 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pBMA6tnZ024603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 11:06:56 +0100
Received: from entw48 ([192.168.100.138]) by hale.at with MailEnable ESMTP;
	Thu, 22 Dec 2011 11:06:45 +0100
Date: Thu, 22 Dec 2011 11:06:29 +0100 (CET)
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
X-X-Sender: guib@entw48
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20111222091041.GI12791@jama.jama.net>
Message-ID: <alpine.DEB.2.00.1112221104060.26143@entw48>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pBMA6tnZ024603
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1325153218.20248@ku8ux3yVxFMJ3FbL+caGVQ
X-Spam-Status: No
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
X-List-Received-Date: Thu, 22 Dec 2011 10:14:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Thu, 22 Dec 2011, Martin Jansa wrote:

> See http://bugzilla.pokylinux.org/show_bug.cgi?id=1711
> but it's still broken in some cases (on my buildhost 3 from 5 machines
> are broken, 2 are working after last opkg changes).
>
> Good test is to enable testlab and run this in your deploy/images directory
> find . ! -type l -name \*tar.gz`; do
>  echo $i;
>  tar -tvf $i | grep dbus-daemon-launch;
>  tar --numeric-owner -tvf $i | grep dbus-daemon-launch;
>  tar xzvpf $i ./etc/group;
>  grep messagebus ./etc/group;
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


Thanks, for the detailed description. I will try to dig deeper and use a 
bbappend as a hotfix.

Best regards,
Bernhard


--
Scanned by MailScanner.



