Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1k4l-0008WQ-8C
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:43:35 +0100
Received: by pvc30 with SMTP id 30so756143pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=eRzju13xGwVnKMrGROsck0ioJRZs0bNWZhLuAvHfKC4=;
	b=VOl4sZl6jad/ZbWNBKCU1RwSFCh7qC6gjW/UFNDMpB85wJoSm+Ts1acD5OpT0uhTWl
	2Pii+lA/dGTHUaOLoENHSbptgiWM4b8A3mO6tZkNA95s68rJj2UPlnyCPQIRBVBp5OJI
	dySL9RnllBgU34h/Bdkw2MAdEYQfnxBNFkX/U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fR/mT+FtWw0lVh95hDheECnMsQh9DpmDckamt83LI6X/onWVSZXxiKmDDvhN8nrU0h
	ET2XUAER8pwxYNWEOgBeVyCUYF8PdcN8CdXLAYGL02Mkgv205ad57sYUhfQmGN+m5ybn
	MjwWOrZZOZolbD3EadJ2onB5MxX/iTV645R38=
Received: by 10.142.48.20 with SMTP id v20mr3122962wfv.430.1300732490334;
	Mon, 21 Mar 2011 11:34:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w27sm7591911wfd.4.2011.03.21.11.34.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:34:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:34:44 -0700
Message-Id: <2a46643e032d11e07f6dfec471cadea8e9dba827.1300732395.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300732395.git.raj.khem@gmail.com>
References: <cover.1300732395.git.raj.khem@gmail.com>
Subject: [PATCH V2 1/1] scripts/poky-qemu-internal: Add call to stty
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
X-List-Received-Date: Mon, 21 Mar 2011 18:43:35 -0000

When qemu is booted into console with -nographics
then after exiting the terminal line settings are messed
up. This patch calls stty sane to restore the terminal
settings to default.

stty is part of coreutils which is installed on all
host distros hence there is no need to warn about it
being available or not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/poky-qemu-internal |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/poky-qemu-internal b/scripts/poky-qemu-internal
index 8fd1834..556ce69 100755
--- a/scripts/poky-qemu-internal
+++ b/scripts/poky-qemu-internal
@@ -189,6 +189,7 @@ cleanup() {
         echo "poky-export-rootfs stop $ROOTFS"
         poky-export-rootfs stop $ROOTFS
     fi
+    stty sane
 }
 
 n1=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-- 
1.7.4.1



