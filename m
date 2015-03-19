Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9248C65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 16:39:17 +0000 (UTC)
Received: by wgra20 with SMTP id a20so67392437wgr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 09:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=UhMiJkQ/0CcLAG+K9eJh41BkkB+KojKTRITpO4l2WQw=;
	b=YJo1vN8iCfxL8YKGxcpQqVOwA0xgZJnZP14BBf/W+SeNg24SQqg/wVNAKxkxueA0Ya
	+QmqH4ssHZfBNVjUEi7VxFJOe1awf3cD88wKpQZtp0rqh+X2fL8QH+xGtnUo7TbwSEC1
	wgiQ3qduWDpaxOp9C917hLxaRzsbg73BdBZK1XMY1agbaPLfqpXUvPni84VqdTVDTLfG
	OsjgjbnCduhHTtmy69nN5+JOdMbp+GsHRvWtR1jeCmF57GfdQUDVkqJnueJ3CRw6aFtL
	2rSP07RZm4woDxkVHW6cR9YSNW0y5mLFZDhAEnPJs2iAAhT39jJZ4XAnp4o9gH1guZUI
	pe4Q==
X-Received: by 10.180.98.131 with SMTP id ei3mr17732268wib.62.1426783158358;
	Thu, 19 Mar 2015 09:39:18 -0700 (PDT)
Received: from [10.53.92.192] (089144230192.atnat0039.highway.a1.net.
	[89.144.230.192])
	by mx.google.com with ESMTPSA id ub1sm2609388wjc.43.2015.03.19.09.39.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Mar 2015 09:39:17 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <1426764810.29168.49.camel@linuxfoundation.org>
References: <1426764810.29168.49.camel@linuxfoundation.org>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 19 Mar 2015 17:39:12 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <B83906C4-D2EF-4D2A-80FD-C8CBF3AEA6B3@gmail.com>
Subject: Re: [PATCH] runqemu-internal: Add cpio support for qemux86 so that we can boot poky-tiny images
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
X-List-Received-Date: Thu, 19 Mar 2015 16:39:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On March 19, 2015 12:33:30 PM GMT+01:00, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>poky-tiny generates cpio.gz images, add support for these so we can
>boot
>them using runqemu.
>
>Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
>index 6594dc3..2db5566 100755
>--- a/scripts/runqemu-internal
>+++ b/scripts/runqemu-internal
>@@ -408,6 +408,11 @@ if [ "$MACHINE" = "qemux86" ]; then
>KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32 root=$DROOT rw
>mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
>QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE $ROOTFS_OPTIONS
>$QEMU_UI_OPTIONS"
>     fi
>+    if [ "${FSTYPE:0:4}" = "cpio" ]; then

Is that positional handling mandated by the POSIX-1003.1 2008 shell?

Otherwise case $FSTYPE in ..
Would cleanup the rest if the mess below..

With that clarified it changed
Acked-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

Thanks,

>+        KERNCMDLINE="vga=0 uvesafb.mode_option=640x480-32
>root=/dev/ram0 rw mem=$QEMU_MEMORY $KERNEL_NETWORK_CMD"
>+        QEMUOPTIONS="$QEMU_NETWORK_CMD -cpu $CPU_SUBTYPE -initrd
>$ROOTFS $QEMU_UI_OPTIONS"
>+    fi
>+
>     if [ "$FSTYPE" = "nfs" ]; then
>         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
>             echo "Error: NFS mount point $ROOTFS doesn't exist."



