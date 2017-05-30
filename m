Return-Path: <dev@codyps.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBBB7779FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 21:14:41 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id f102so119601ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=7Ndmk7hcVOjKU3E0opwDx22EB4mfHlnqEPVGJeYxKsk=;
	b=HDmHlWBCGc/2sQefY/JXbRFAOq6PH53SESA3s2nIs3vYC+j4LTcBjRQoRsc9mNlz+9
	kxVaug/7H1Szc8zK2jJwt387/f9nb6zHaK8s2aYFBHbYbs9bse5HzEvLS2tihbyIQUe+
	dWQCB/ldfgyBxlbi9AvonDffTXQRvm2NeQ8Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7Ndmk7hcVOjKU3E0opwDx22EB4mfHlnqEPVGJeYxKsk=;
	b=Gm+GA8f5vhUOUnI8XcLM65bcPmMXsjqr9kOVR+N6UsmtgL9jEQF54FzhIRfL57UrZc
	ZJPidJipuOVdpnUJMNc2DYHkZ7U9cqacwbm+ZFxDe7AgkaMwNgQ2gPquysjp+XLopDn+
	2d72ABwFNEvoNCTsI31up+O7wKquFoG05k39B3qhCgN4QrNbgEFSFMnc9dSUS2E3hALI
	g496WD3HIivYmv9m8nP2Qw3iQz+Pi9IgnBVTtL3FusAPqzrxPomm/TpnskkVF6Hm1XW1
	pgAxa042ZSDrtAQa9EUhOSYKZeYf9+WRgRpgLIfGhmo4nBAs2nhlzD0pXSHN2fUH1MoD
	6qmA==
X-Gm-Message-State: AODbwcCXVXhk4Ex3LLVI6x9VniQRYpb5MHIMuvsjP6PFKbvTpGvN3aoS
	Q6He4D9Tgd8r2Bgedek=
X-Received: by 10.107.18.203 with SMTP id 72mr19364050ios.149.1496178882785;
	Tue, 30 May 2017 14:14:42 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	c125sm4055893itc.11.2017.05.30.14.14.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 May 2017 14:14:42 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 17:14:36 -0400
Message-Id: <20170530211436.16397-1-dev@codyps.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Tue, 30 May 2017 21:14:42 -0000

The mountprog & nfsprog options given are not supported in the linux
kernel, and the only references I can find to them are in the nfs-utils
source, which notes:

  "mountprog" is supported only by the legacy mount command.  The
  kernel mount client does not support this option.

(and similar for nfsprog).

The kernel (which is what parses `nfsroot=<arg>` when using nfsroot)
has no understanding of nfsprog or mountprog.

The result of this is that trying to mount filesystems exported by
runqemu-export-rootfs in modern kernels (at least in 4.2 and later, and
probably more like 2.6.20 and later) doesn't actually work.

I'm honestly not sure how anyone was using this for nfsroot support.
Maybe an initramfs with a version of nfs-utils that could handle the
mountprog/nfsprog option was in use? Not sure.

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 scripts/runqemu-export-rootfs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index c7992d8223..70cdcdbb13 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -77,10 +77,6 @@ if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
 	exit 1	
 fi
 
-# rpc.mountd RPC port
-MOUNTD_RPCPORT=${MOUNTD_RPCPORT:=$[ 21111 + $NFS_INSTANCE ]}
-# rpc.nfsd RPC port
-NFSD_RPCPORT=${NFSD_RPCPORT:=$[ 11111 + $NFS_INSTANCE ]}
 # NFS server port number
 NFSD_PORT=${NFSD_PORT:=$[ 3049 + 2 * $NFS_INSTANCE ]}
 # mountd port number
@@ -88,7 +84,7 @@ MOUNTD_PORT=${MOUNTD_PORT:=$[ 3048 + 2 * $NFS_INSTANCE ]}
 
 ## For debugging you would additionally add
 ## --debug all
-UNFSD_OPTS="-p -N -i $NFSPID -e $EXPORTS -x $NFSD_RPCPORT -n $NFSD_PORT -y $MOUNTD_RPCPORT -m $MOUNTD_PORT"
+UNFSD_OPTS="-p -N -i $NFSPID -e $EXPORTS -n $NFSD_PORT -m $MOUNTD_PORT"
 
 # See how we were called.
 case "$1" in
@@ -130,7 +126,7 @@ case "$1" in
 	fi
 	echo " "
 	echo "On your target please remember to add the following options for NFS"
-	echo "nfsroot=IP_ADDRESS:$NFS_EXPORT_DIR,nfsvers=3,port=$NFSD_PORT,mountprog=$MOUNTD_RPCPORT,nfsprog=$NFSD_RPCPORT,udp,mountport=$MOUNTD_PORT"
+	echo "nfsroot=IP_ADDRESS:$NFS_EXPORT_DIR,nfsvers=3,port=$NFSD_PORT,udp,mountport=$MOUNTD_PORT"
 	;;
   stop)
 	if [ -f "$NFSPID" ]; then
-- 
2.13.0


