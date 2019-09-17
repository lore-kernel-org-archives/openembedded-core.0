Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 497877F6D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l11so3669757wrx.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ymm7vxKw0ATMXqxRG3iUHClQsEBfsfzdkmZMKov6AtY=;
	b=t4d2cl0blLHMeke3K4l3R+EB6QIizeB8puiDekvrrk1MeRp0Jlw3pzM9JkGFtut0dr
	O+DiMZgklg/T1uScJU+ZSLHiwFwP8NrB53uBlc+df+KWLXra7O6IwHOxyu0QuebKilwz
	5p+sIT15hyJm3Z27/dtiOMb1xh3+5Ti0LXuDxXk2vGOd51gqdP2q4MST+E0WpSXGIPED
	/E6msVId24kkRFqVxlVXHNzP12BpWR+bPu5+gwjwYk29nNBuAlBoCWANFhz3Rx5xFTjI
	fazjmVk+Ymf8R4ChdMKKI0n9GyMV0/9hjk/PdWjdAaFDLxKfasEzDPEJFw56qN5pPTcR
	R6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ymm7vxKw0ATMXqxRG3iUHClQsEBfsfzdkmZMKov6AtY=;
	b=IVMqV8cxy4dO2UxK8Bf3zVT6ixaBx1QtUvP0NXJ1mqhNCmtjWsBjMCZSyaIpxfr/pG
	gc8KQXnZoZXxwXUZwpMaZDyGYo2ebOdFJBhP+GoxDHskdjy3vvTJum2fyOaGMz+crB37
	I917j55zkzx6bOn97TwePv3nwqdgDsu8/8kk05g1tDe90UoWS3nmqosTA4941BJD2LUf
	7oDyjhgLTJlgppvXHd6Je9DI/4PerhDvT6pE2Cb7L0Ko1+gRcDZRfzmqMXIyD4n3O6ij
	x6shYi/h6/OCV6cV1hcWVdZW+08T4VMQLck1vymTKHE5Or2E+nphf+1TZL6WugIJwTHp
	LJ8g==
X-Gm-Message-State: APjAAAUoQOWvEgtOOl61sPuFd4y10sRurdZCgYm7qthhQJ8fy6V0rPhd
	QKZftdHbZgIkfsouUrmz11sfj56v
X-Google-Smtp-Source: APXvYqw8BW0jiN9x/z1UuLMAS3jDeWIT4SH83AUHCrFkIG7XEn0xyFxcLO+5rglqnYaP0oVsNgCPDA==
X-Received: by 2002:adf:828d:: with SMTP id 13mr3576256wrc.115.1568734583503; 
	Tue, 17 Sep 2019 08:36:23 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:22 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:10 +0300
Message-Id: <20190917153613.4954-6-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 6/9] systemd-boot.bbclass: switch to uefi.conf
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:23 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.conf instead of hardcoding them in the class.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/systemd-boot.bbclass | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 3cd6811a6ce1..47f2adcd7744 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -11,28 +11,21 @@
 
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 
-EFIDIR = "/EFI/BOOT"
+require conf/uefi.conf
 # Need UUID utility code.
 inherit fs-uuid
 
 efi_populate() {
         DEST=$1
 
-        EFI_IMAGE="systemd-bootia32.efi"
-        DEST_EFI_IMAGE="bootia32.efi"
-        if [ "${TARGET_ARCH}" = "x86_64" ]; then
-            EFI_IMAGE="systemd-bootx64.efi"
-            DEST_EFI_IMAGE="bootx64.efi"
-        fi
-
         install -d ${DEST}${EFIDIR}
         # systemd-boot requires these paths for configuration files
         # they are not customizable so no point in new vars
         install -d ${DEST}/loader
         install -d ${DEST}/loader/entries
-        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE} ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
+        install -m 0644 ${DEPLOY_DIR_IMAGE}/systemd-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
         EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_EFI_IMAGE" >${DEST}/startup.nsh
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
         install -m 0644 ${SYSTEMD_BOOT_CFG} ${DEST}/loader/loader.conf
         for i in ${SYSTEMD_BOOT_ENTRIES}; do
             install -m 0644 ${i} ${DEST}/loader/entries
@@ -47,7 +40,7 @@ efi_iso_populate() {
         cp -r $iso_dir/loader ${EFIIMGDIR}
         cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
         EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+        echo "fs0:${EFIPATH}\\${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
         if [ -f "$iso_dir/initrd" ] ; then
             cp $iso_dir/initrd ${EFIIMGDIR}
         fi
-- 
2.23.0


