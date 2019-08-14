Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id ABD937CE73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 05:19:30 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id t14so50181173plr.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 22:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zC/TLTGDlM20gyxKvZ3dJiZlHhr18nffMURklHGMGyw=;
	b=eEEIq2n60IDv23HSdngaCPFQdoTZ6n3tQcTWu1YotXrmfXudMnXx17HhSnWtLy4bg8
	dbcvqogIYWIFwFlFId/0qZBPmuWFsHYapgSmg9VBsFLmLJf6An0sP+kgf28khr06wu4W
	Fl/DKNsLb8MhTYkaCPBOnhtSH1gwGsi6UevoVLC33FxEl4pRzH7WKuXG6t8HfLSEevKU
	JH3rhX/k4Ttue0GUTL1UQWzrmPmNdS8eDI1bvdwxqDDK4Ro1UjgpFGv6UPWEFYJ3v5XP
	NpDfjRdXuW63VgwkX0bgUB0M1tP+3rT+BF9x7Owf7mg1kMs+pt1Klh2ONCY61gdDwfre
	JK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zC/TLTGDlM20gyxKvZ3dJiZlHhr18nffMURklHGMGyw=;
	b=Tjo7ooMYwT87N1IjytdjBX5jsq8MTFTlF+p7W4gNx5z1qPC3Sis2wOt2E+9b9x7Qum
	4N2PwJBvn703tlKqrEjSr2n6lcSUU6RNKLm510BJ1c2AHzDLHztr7jaAAEL97UqracMP
	eKGRLOUa5GM1HKwPPm6EvYPZ6NHAcQB2oSAzFj1COGZquVoAs751zl2D/TFj002HF7Xn
	jXG+rpWrnJMEIoRq8x2Qa5zRRVvQC0Z7LBY+oLEFwhKgs0n/0BoryXnZoZSaisV2ESmW
	eC4gKdWFMuFXY1zIMXnt+lRZB5NWSja34gP/yn9HzKpjXneJkp7jGgMbMPf/9XJD36KB
	S/Wg==
X-Gm-Message-State: APjAAAWU7LIuqswUgUclOXMMkCAEs8LKuzhwSdUmMkUOSgJMBxSjJ6oD
	QIUMo6QUK2sXidQVXoOjhAzvGOxiuTU=
X-Google-Smtp-Source: APXvYqwbLf4o/TCBm9xFYqEqXiNR1EoHgY1wVxsDgq8R/5UjZ/qAkKAECHVBFNjCHxERFNLoltOX7w==
X-Received: by 2002:a17:902:6a:: with SMTP id 97mr1230462pla.257.1565759971265;
	Tue, 13 Aug 2019 22:19:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	v22sm107805527pgk.69.2019.08.13.22.19.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 22:19:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 22:19:18 -0700
Message-Id: <20190814051918.42678-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814051918.42678-1-raj.khem@gmail.com>
References: <20190814051918.42678-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] musl: Delete GLIBC_LDSO before creating symlink with lnr
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
X-List-Received-Date: Wed, 14 Aug 2019 05:19:30 -0000
Content-Transfer-Encoding: 8bit

Fixes rebuild failures after say do_compile fails

| ./tools/install.sh -D -r /mnt/a/yoe/build/tmp/work/riscv64-yoe-linux-musl/musl/1.1.23+gitAUTOINC+d0b547dfb5-r0/image/usr/lib/libc.so /mnt/a/yoe/build/tmp/work/riscv64-yoe-linux-musl/musl/1.1.23+gitAUTOINC+d0b547dfb5-r0/image/lib/ld-musl-riscv64.so.1 || true
| Traceback (most recent call last):
|   File "/mnt/a/yoe/sources/openembedded-core/scripts/lnr", line 24, in <module>
|     os.symlink(target, linkname)
| FileExistsError: [Errno 17] File exists: 'image/usr/lib/libc.so' -> '/mnt/a/yoe/build/tmp/work/riscv64-yoe-linux-musl/musl/1.1.23+gitAUTOINC+d0b547dfb5-r0/imageNone'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 2633229b8c..b2991d4ed5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -64,7 +64,7 @@ do_install() {
 	oe_runmake install DESTDIR='${D}'
 
 	install -d ${D}${bindir}
-	rm -f ${D}${bindir}/ldd
+	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
 	for l in crypt dl m pthread resolv rt util xnet
-- 
2.22.0


