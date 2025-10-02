Return-Path: <rtie@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF82CCD182
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 09:59:35 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web11.5054.1759399169459277978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 02:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=rtie@gmx.de header.s=s31663417 header.b=hFUax3ki;
 spf=pass (domain: gmx.de, ip: 212.227.17.21, mailfrom: rtie@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759399168; x=1760003968; i=rtie@gmx.de;
	bh=TVInS+hWZTzmlrn1pAlFOYtq5PwUmOQ0VLlrVHyvUPk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hFUax3kiCSSkNsqICbFnaOemRY180CKGby9YDJOaST+TYHTkOTmh7ejKfJF1v4U/
	 avlIVEZxyrJDc1+NKVo+ozraVELZr3yS0v3cc99MD/RGvg2mwx82amhmGr4mjK9fy
	 Qm0VH0e6JCg154WewoWhYSBXCSulF1Ud9OF9an0AOnhPo05YaB8J6wifauXATO/SR
	 kBVEQHGGB25q3eoBeNstFCOdzYxbXjh5HDTuVGYKzAbroAjDU8l2Oo65+ARdR0Qlr
	 mL9/rQ8EuBmXpeDPtTesasfyYtUPF6E/OLjg6lO8IlMasYh/rwcGb2jQJeVBF+ro7
	 822mdJWq6DK0mWI5YQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from bugfish.tua.local ([87.245.7.122]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhQC-1uYXpT3pSu-00d5Hd; Thu, 02
 Oct 2025 11:59:27 +0200
From: Robert Tiemann <rtie@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: Robert Tiemann <rtie@gmx.de>
Subject: [PATCH 2/2] udev-extraconf: Avoid slashes in mountpoint names
Date: Thu,  2 Oct 2025 11:59:25 +0200
Message-ID: <20251002095925.2521779-3-rtie@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002095925.2521779-1-rtie@gmx.de>
References: <20251002095925.2521779-1-rtie@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SbHftrMKx4A/4GqelLdu0bVOHM4bVDixjNUXEUrUR1d4BM+bFEt
 XRd+2gDcYdkIZA1MomvEzbV/0wXYFVNni7M4VN8BVMvxiTa1Pybz0CwQLF2qDcfueYzpYuw
 Vh6INnBJn0k7NTqOIHg3qrPAOSYzmC3hP6GsZD2IdsaRcHOfAPcpDznii1BnTTXfHRC1jwl
 FXZAk2Gee1vquYMR9I9aQ==
UI-OutboundReport: notjunk:1;M01:P0:E/YfTjcFwdo=;d4apGTQq/UWo2sAOZqzkkLy2Zjl
 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
 od5dhi6Gqmqh8qWc8=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 09:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224346

Devices with labels such as "Hello/World/Foo/Bar" cause mount.sh to
create the directory structure @MOUNT_BASE@/Hello/World/Foo/Bar. The
partition is mounted to the nested "Bar" directory. On device removal,
the directory structure is not cleaned up.

This commit replaces all forward slashes in partition labels by
underscores to avoid this edge case.

Signed-off-by: Robert Tiemann <rtie@gmx.de>
=2D--
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes=
-core/udev/udev-extraconf/mount.sh
index fe78f3aba5..4827779e2f 100644
=2D-- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -178,7 +178,7 @@ rm_dir() {
=20
 get_label_name() {
 	# Get the LABEL or PARTLABEL
-	LABEL=3D`/sbin/blkid "$1" | grep -o 'LABEL=3D".*"' | cut -d '"' -f2`
+	LABEL=3D`/sbin/blkid "$1" | grep -o 'LABEL=3D".*"' | cut -d '"' -f2 | se=
d 's,/,_,g'`
 	# If the $DEVNAME has a LABEL or a PARTLABEL
 	if [ -n "$LABEL" ]; then
 	        # Set the mount location dir name to LABEL appended
=2D-=20
2.43.0


