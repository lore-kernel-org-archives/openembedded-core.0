Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 712D97CDEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 05:38:18 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id i2so705415plt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 22:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K3F3CRZwhnLt+11OsQ65ScbuyNWiGMPq6M/pZ4BkrNc=;
	b=N/HEom3umxA4j/qSdvBIjObQY507LpYPBnOZi6FFbMM+fmip1+w0QxVZCOJYxdu2X8
	LdHNO5f8+KfxT3rHJE9rnu8wjvXUEkdIAQ7m+C8JHP9KeXkeWIT0Osw/1Vnie3U/vy38
	4IPvUUIfgdwrgc3TYzp29u058p7L4qL57k1tWgwVzZHpKgdAeeBlW5+tHZJS056oBT16
	+I3+rvy5V/I+4FPeQrubp80UK/caKtOdwPMCSQUCFSH0roRtf5OyLFGUnqydFvN4D2Eg
	LQ49UL+xeWAm4EUxlXbEfnwvM07gpigLOEsT+x9y+382PsvaOqBUSVctuFmAB/7g/Mm2
	XfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K3F3CRZwhnLt+11OsQ65ScbuyNWiGMPq6M/pZ4BkrNc=;
	b=q6sXRcJKMqgREoAe/w2iCZKIJpsPoSB5Q42PhdxArbgAsp5U9a/PFi7xNFNRm+sqRZ
	NosACL5ipQviWP/LVeoxutUiJfZrhktQ3faHR8uqRz6omIdxL3NorOg59AKAQs/TKve+
	9zcxxIutOaLx1N1WUAlH6GqRNuRZfcZzz4IGchrnETdR8/ebt+zGayzovA0k1fXVCNd8
	R2h8gsWURq/Dyr4D04pxY5H+R5z4sPjtILZ8UrRHL7b+4uJ43+DMxuv0mqdCU6iwnKKn
	8Tu3UlpgsukGXMhkuoQOOOWDtgyNMALxUGQnh3SQ0VP+KXgzZ30UJ8zaJih5Wbfieiin
	DO3Q==
X-Gm-Message-State: APjAAAXbc+urWuvU5hA/cH3A8RHiFs+IMYz2I1cbNqxIPihHe8BtfJCF
	wCJSMMRr26AVwjAvs48nAxxAXKCR9zg=
X-Google-Smtp-Source: APXvYqzCe9LC/0UDaR1BbCAbecFmUMQzph8azFsZQiZ6H5eMUD2M/AYwOj/AH1nkg/mQvTRiqAtSuA==
X-Received: by 2002:a17:902:ac87:: with SMTP id
	h7mr2971401plr.36.1565847498719; 
	Wed, 14 Aug 2019 22:38:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id g8sm1266629pgk.1.2019.08.14.22.38.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 22:38:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 22:38:09 -0700
Message-Id: <20190815053810.8238-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] util-linux: Make pam specific logic apply to target recipe alone
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
X-List-Received-Date: Thu, 15 Aug 2019 05:38:18 -0000
Content-Transfer-Encoding: 8bit

This helps with a case where a distro builds one image with systemd and
another with sysvinit, it ends up recompiling almost everything since
python3-native gets rebuilt and tracing dependencies with
bitbake-diffsigs shows that the chain ends at util-linux-native being
recompiled because distro features now does or does not have 'pam'

Hash for dependent task python/python3_3.7.4.bb:do_prepare_recipe_sysroot:virtual:native:/mnt/a/yoe/sources/openembedded-core/meta/recipes-devt
ools/python/python3_3.7.4.bb changed from 8befaac4f995aaff3f95d27c9caaf1006f86e1344b02c1ae82f5d12f885f2240 to 2a45fe0cd0d3640a88c4a5c8b1880c4e9
a089cc7446a91d2a920c1cef6fa916a
    Hash for dependent task util-linux/util-linux_2.34.bb:do_populate_sysroot:virtual:native:/mnt/a/yoe/sources/openembedded-core/meta/recipes-
core/util-linux/util-linux_2.34.bb changed from 0db292cb2e37d5788bdcf51038b2802d748b719d860aca3a26d7a793b0cf3905 to 15d6e165f025f10c2c455df8a87
5cafe021eaed4214c793e708d4827a58ca89d
        Hash for dependent task util-linux/util-linux_2.34.bb:do_install:virtual:native:/mnt/a/yoe/sources/openembedded-core/meta/recipes-core/util-linux/util-linux_2.34.bb changed from 54bb4ee6bdb5c7fc260dabddb4932cb0e554a62cd92aba080a18306291fb470b to e25b1119ce8dd7ca43fbd2db771e04fa
6ff6b9d701fd78ac6c443224b036ed9f                                                                                                                           basehash changed from 8e8687a866689a697001dedc0a43f478e68e6efe270bd77362f24c6000f9e882 to 62df6610eab9c1b1a17d7132943507641c8538690
f26186843c86144d4598e64
            Variable do_install value changed:

rm -f ${D}${bindir}/chkdupexe
-   if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+   if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
        install -d ${D}${sysconfdir}/pam.d
        install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
        install -m 0644 ${WORKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
@@ -47,5 +47,4 @@
        rm -f ${D}${base_sbindir}/nologin
        rm -f ${D}${base_bindir}/kill

    -DISTRO_FEATURES{pam} = Unset
    PACKAGECONFIG{pam} = Unset

So far it seems this pam conditional code in util-linux is target
specific and would not apply to native or nativesdk recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 84c7012752..5b1b919800 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -190,20 +190,19 @@ do_install () {
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 
 	rm -f ${D}${bindir}/chkdupexe
+}
 
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+do_install_class-target () {
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
 		install -d ${D}${sysconfdir}/pam.d
 		install -m 0644 ${WORKDIR}/runuser.pamd ${D}${sysconfdir}/pam.d/runuser
 		install -m 0644 ${WORKDIR}/runuser-l.pamd ${D}${sysconfdir}/pam.d/runuser-l
-	fi
-	if [ "${@bb.utils.filter('PACKAGECONFIG', 'pam', d)}" ]; then
 		# Required for "su -" aka "su --login" because
 		# otherwise it uses "other", which has "auth pam_deny.so"
 		# and thus prevents the operation.
 		ln -s su ${D}${sysconfdir}/pam.d/su-l
 	fi
 }
-
 # nologin causes a conflict with shadow-native
 # kill causes a conflict with coreutils-native (if ${bindir}==${base_bindir})
 do_install_append_class-native () {
@@ -267,7 +266,7 @@ ALTERNATIVE_${PN}-doc = "\
 blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
 mountpoint.1 nologin.8 rfkill.8 sulogin.8 utmpdump.1 uuid.3 wall.1\
 "
-ALTERNATIVE_${PN}-doc += "${@bb.utils.contains('PACKAGECONFIG', 'pam', 'su.1', '', d)}"
+ALTERNATIVE_${PN}-doc_append_class-target = "${@bb.utils.contains('PACKAGECONFIG', 'pam', ' su.1', '', d)}"
 
 ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
-- 
2.22.0


