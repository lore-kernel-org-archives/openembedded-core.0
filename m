Return-Path: <dev@codyps.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id F069777F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 22:30:53 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d14so12000568qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 15:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ub7Ua51eP5m4cmRsmMfKkMO8DZPfq7p86+iamyug4oE=;
	b=b23PSy2OtTE12pFnp+CXXm5W6GkKOgEAPA+R9irMaENhl1Hm79RDN1Z/h7WRVYltzJ
	PGC1+/nLekzRTKlvkIGt/qmbEYGh0PgWXs1RgKsUQCV3g0rpI25Rm94TqtQT7m61hlPI
	p/ZzRq9a1yDTtT5Vd7PKwNE02rNplbHJ3vTl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ub7Ua51eP5m4cmRsmMfKkMO8DZPfq7p86+iamyug4oE=;
	b=Vh989Cr/miK5VxB/P127+h+IzwIJF6AVupFWMuPAL96sFY7ctwzp7Zy2t4e8xVieP5
	eax564cUm9bfnW4IvUjNhJqO5Y/nrXRJnsdOdbGtD8yFavWT7JkUyTHO8Vi7/BeBzWKM
	6Zy2Na9MPbEh5QRHwBz4VInJcTdDVSjZ9LCZ4wvVjuv0U8HhyM0QPoq4TeIS5RLvzpO/
	yYgzwG2a9iX60Vlhmd3kj560pCOrLO13XBfqatAVB5b7RC1I4wCSrt3qVM31aey9r5Lq
	mtWarSqwOwp7yAIdSCzFKzfvBmNbRWDq64KSJRofX3JvDLzJ9acbsS1WeESZx+CnDQLi
	dCVw==
X-Gm-Message-State: AKS2vOzPtz+7jfYCvHyIvjujCtOgYhkwSIv6BQvcSRH3eXzgyJNH2QwD
	AsuBeTOzI/xsg//t1Mo=
X-Received: by 10.55.48.15 with SMTP id w15mr13231308qkw.99.1496788254340;
	Tue, 06 Jun 2017 15:30:54 -0700 (PDT)
Received: from localhost (c-73-167-252-82.hsd1.ma.comcast.net. [73.167.252.82])
	by smtp.gmail.com with ESMTPSA id
	a45sm24908315qta.39.2017.06.06.15.30.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Jun 2017 15:30:53 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 18:30:49 -0400
Message-Id: <20170606223049.9301-1-dev@codyps.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH v2] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Tue, 06 Jun 2017 22:30:54 -0000

RPC ports (also known as rpc program numbers) are values:

 - given to rpcbind (aka portmapper) to allow nfsv3 clients that don't
   know the tcp/udp port number of nfsd and mountd to look it up the
   tcp/udp port number, and to

 - allow a single transport (ie: tcp/udp port) to provide multiple
   sunrpc services.

OE has carried patches to nfsutils & linux for some time to support the
mountprog & nfsprog options.

In the case of runqemu-export-rootfs, we don't need to use custom rpc
program numbers because runqemu-export-rootfs tells unfsd not to
register with the portmapper, and unfsd runs the nfs and mount rpc
services on tcp/udp ports unfsd binds itself (iow: the tcp/udp ports are
not shared in the sunrpc sense).

Linux's nfs client does not query rpcbind when tcp/udp port numbers are
specified (in net/sunrpc/clnt.c, call_bind checks for the tcp/udp port
with xprt_bound() and skips the call to rpcbind if xprtsock.c's
xs_setup_udp() or xs_setup_tcp() has found a non-zero tcp/udp port).

The program numbers _are_ sent over the mount & nfs protocol (really,
over sunrpc), and checked to match at both ends. As a result, even when
rpcbind is unused, using different program numbers in unfsd vs linux
nfs client causes mounts to fail (and nfsroot mounts to timeout).

The result is that specifying custom program numbers in
runqemu-export-rootfs doesn't solve any conflicts, it simply requires
that users of runqemu-export-rootfs carry a kernel patch & adds 2 extra
parameters to the kernel command line unnecessarily.

Change runqemu-export-rootfs to use the default program numbers.

For now, I have not dropped the custom program number patches to linux,
nfs-utils, and unfsd just in case someone is using them in a
non-runqemu-export-rootfs context.

CC: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Cody P Schafer <dev@codyps.com>
---
v2: add a much better commit message to clarify some confusion
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


