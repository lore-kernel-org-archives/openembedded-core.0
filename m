Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30DAEB26E3
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 16:28:35 +0000 (UTC)
Received: from smarthost01a.sbp.mail.zen.net.uk (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23875.1770740911938535929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 08:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=f2gIWRO2;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.1, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <mac@mcrowe.com>)
	id 1vpqbF-000000096FP-3FBv
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Feb 2026 16:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=DFmGcTl8JbifXncyLioFW6dPKjkOtj8O9gycWfCHM0k=; b=f2
	gIWRO2z87KqzkiNStltJ7lnaxhKprThqm8+OysubYmPR3un5UWfId1728HCuH7EXrIKdI/nB82otG
	EHRzKkVi2kyHB4pjHUwtNii5LEEvBdme+OFpbSiZEztb/dt3J4pSm/+bnjSvzjkypWfzqgPbY7AW3
	mK1ojwa7l7sL9P72NVPbY9VrTHN24bMFj4N+Jh+mOobg079nc705Vyld6ITxK+C9P/yg9osAKP6H/
	Sb+soDQdVy/tO6lM8dKm/NZPHufj/1+ImWPIddnhfL9wY9CzwnbGa/uEXwB1VU78INzoSx1jNBZcg
	eAdyxf2YHLSfwPbPbLpEkm2jRkzVzmmw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.98.2)
	(envelope-from <mac@mcrowe.com>)
	id 1vpqbF-000000028lD-3mtx
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Feb 2026 16:28:29 +0000
Date: Tue, 10 Feb 2026 16:28:29 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: XZ_THREADS changing do_image_cpio task hash
Message-ID: <aYtcrTmpsYQl1na9@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 16:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230918

It looks like this problem was raised previously[1] but there was some
confusion that made it look like it had been resolved.

Using current master or scarthgap, if I add:

 XZ_THREADS = "32"
 INITRAMFS_FSTYPES = "cpio.xz"

to local.conf, build core-image-minimal-initramfs (for qemuarm64) and then
tweak this to:

 XZ_THREADS = "8"
 INITRAMFS_FSTYPES = "cpio.xz"

and build core-image-minimal-initramfs again then the task hash for
do_image_cpio changes:

 tmp-glibc/stamps/qemuarm64-oe-linux/core-image-minimal-initramfs/1.0.do_image_cpio.sigdata.b1d5686160dfefe3c2aeddc5caa6a7d3e14e6478392abf81ddaf04d5cbaeaa1e
 tmp-glibc/stamps/qemuarm64-oe-linux/core-image-minimal-initramfs/1.0.do_image_cpio.sigdata.28a20d80e712a003b71146fd37ed1158dc99f4ef68f714e19d25fe6f5c83091b

basehash changed from ea836e918b7b1d732979d58e1e1d249355c59dc3e5a7d15e4be1ae66ff5dfda0 to 0029ad7eb64839cb1d6ac8de22d94676ddf9503b685517225546e651fb49935b
Variable do_image_cpio value changed:
@@ -17,5 +17,5 @@
 	fi

 	cd ${TMPDIR}/work/qemuarm64-oe-linux/core-image-minimal-initramfs/1.0/deploy-core-image-minimal-initramfs-image-complete
-	xz -f -k -c -6 --memlimit=50% --threads=32 --check=crc32 core-image-minimal-initramfs-qemuarm64${IMAGE_VERSION_SUFFIX}.cpio > core-image-minimal-initramfs-qemuarm64${IMAGE_VERSION_SUFFIX}.cpio.xz
+	xz -f -k -c -6 --memlimit=50% --threads=8 --check=crc32 core-image-minimal-initramfs-qemuarm64${IMAGE_VERSION_SUFFIX}.cpio > core-image-minimal-initramfs-qemuarm64${IMAGE_VERSION_SUFFIX}.cpio.xz
 	rm core-image-minimal-initramfs-qemuarm64${IMAGE_VERSION_SUFFIX}.cpio

My understanding of vardepsexclude and vardepvalue means that bitbake.conf
containing:

 XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
 XZ_THREADS[vardepvalue] = "1"
 XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"

ought to avoid the task hash changing. But it doesn't.

Am I missing an obvious reason why the task hash should change? Our build
hosts and developer machines have varying numbers of CPUs and this is
causing a lack of sstate sharing. :(

Thanks.

Mike.

[1] openembedded-core@lists.openembedded.org

