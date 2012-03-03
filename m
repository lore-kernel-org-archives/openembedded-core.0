Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S3ygn-0000Sa-DZ
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 00:48:37 +0100
Received: by dady9 with SMTP id y9so3328527dad.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 15:40:04 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.242.135 as permitted sender) client-ip=10.68.242.135; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.242.135 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.242.135])
	by 10.68.242.135 with SMTP id wq7mr32911739pbc.134.1330818004057
	(num_hops = 1); Sat, 03 Mar 2012 15:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=OJqiYi7blUTNDiDJzQAEz54EmAAGRbrhUllIvH744yY=;
	b=nqNxmac9iQjo83Bjt2EmPz/7Qb1rwJtOg8yAU+G7S2+4TDx9QplG8X0cHx5Pq1slfG
	T8LyC8G175mXCuoL/VlZWRoYaz076+U7TQ2j7juR14227pmSG6Cp79iukpPA855TXp6s
	oWbAcsg8dfHLTialPQM5fGoC8CDtlk9RPpLvVeWf+bNJeuF8119lKn8erW7afIwsuCw+
	0tXI0IWosecy/Tc2RkK24+boAlcVrqzcOpwHM8TuM4egV1sQQ/BTebOMt0PuPG4ss6MJ
	sK8thIUiWD5BiTkLs9gkEevluDMdp+QCzbQVcfsyRDBFfqBkeGcwTiHDV/jkUygTiyvr
	PukA==
MIME-Version: 1.0
Received: by 10.68.242.135 with SMTP id wq7mr27924351pbc.134.1330818003924;
	Sat, 03 Mar 2012 15:40:03 -0800 (PST)
Received: by 10.143.67.8 with HTTP; Sat, 3 Mar 2012 15:40:03 -0800 (PST)
Date: Sun, 4 Mar 2012 00:40:03 +0100
Message-ID: <CAAQYJAtC-SCxohUjEOcixWA_B+K62O9AMr-d4XWX+PBDpg6i=w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC] keymaps and kernel version
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
X-List-Received-Date: Sat, 03 Mar 2012 23:48:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
while testing some new kernels I found out a broken keymap.
After short research I could identify the cause in
recipes-bsp/keymaps/files/keymap.sh:
...
KERNEL_MAJMIN=`uname -r | cut -d '.' -f 1,2`
if [ -e /etc/keymap-$KERNEL_MAJMIN.map ]; then
    loadkeys /etc/keymap-$KERNEL_MAJMIN.map
fi
...

$ uname -r | cut -d '.' -f 1,2
3.2


I realized we are still using some old keymap-2.6.map and this doesn't
match with KERNEL_MAJMIN.
Now, renaming the keymaps to 3.2 would be only a band-aid,  3.3 is coming.

Maybe we should check for keymap-3.map, i.e.

 uname -r | cut -d '.' -f 1,1

 or embed the machine name instead.

Regards

Andrea


