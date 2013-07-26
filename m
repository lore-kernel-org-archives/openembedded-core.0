Return-Path: <riku.voipio@linaro.org>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2896B3D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 13:27:41 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id cl20so403418qab.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 06:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=LkThhi33SdwI6aSCfRhWAXDeOtMI1SRKjtV70I/Humo=;
	b=mL9mz2P048Yp4NBOtkVmlsXMKXeYsfWFXkiQARmbUxmAbJ2KqaIeCEq6foPcKPBkGf
	Bmcv4yGAvjyLylrezdTduBvyyHdaWLxL3TrlUOROutmuckdpKjgbaBXJeUqmxwV/tbUE
	dWVd/kzdyz02RESVUlZB5FdtQBQ21EP2LRma5teZNl1zaO/+2wGertuXx0dIoqvu0Z5F
	76guJk9Yk3Gb+hN+fqg/KrZNbzVJWOiURZSv2tUqn3w7FMohB8qmL0RKT4tWblc/g+2+
	yhr05NN68u9uYMwyknc2p33MAcpRWvozDPT+H2HRiH0uFbOFfzZTeYFJG0msrDH8ia6s
	yPXg==
MIME-Version: 1.0
X-Received: by 10.49.132.41 with SMTP id or9mr54469259qeb.18.1374845261656;
	Fri, 26 Jul 2013 06:27:41 -0700 (PDT)
Received: by 10.49.95.74 with HTTP; Fri, 26 Jul 2013 06:27:41 -0700 (PDT)
Date: Fri, 26 Jul 2013 16:27:41 +0300
Message-ID: <CAAqcGH=ouV4fgpR629AVG2+J2SVY6vbPTyD0JatyMX72oVn-pQ@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkuitOLZDcTOVC095S4wpfaUzOvuag3mSLK+xYGjWcBpL6nPEJtk1yf5ihJgJ+9PhGcEcWD
Subject: too tight inode limits on ext4?
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
X-List-Received-Date: Fri, 26 Jul 2013 13:27:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

So the image has plenty of space:

root@genericarmv8:~# df -h

Filesystem      Size  Used Avail Use% Mounted on
/dev/root       2.3G  961M  1.2G  45% /

root@genericarmv8:~#

but only 48 free inodes:

root@genericarmv8:~# df -i
Filesystem     Inodes IUsed  IFree IUse% Mounted on
/dev/root       34440 34392     48  100% /

ext3 image is much more sensible:

root@genericarmv8:~# df -i
Filesystem     Inodes IUsed  IFree IUse% Mounted on
/dev/root      293888 34392 259496   12% /
e

I understand that the E in OE is about embedded, but still only 48 free
inodes seems a bit too steep. I would presume the amount of free inodes
should be about the same for both ext3 and ext4.

Also fiddling with EXTRA_IMAGECMD_ext4 doesn't seem to have any effect,
so currently ext4 images are not very useful.

Riku

