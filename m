Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C442C7F29D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 05:57:05 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c2so697631plz.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 22:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F/P5mBb6vSshdZm48hiQW2YdtnA58ht19R3mcVV+owU=;
	b=iewgRJwEmwxHN/BGO63vvv/LBxerJK/LLuWIqUdqeSdKU/7CFJ2hvz2v2OM4tzo531
	y2YPB2m8hLfLQGReR+4sX10gm4C0e5rj/bu/OlNiTlht6J7gCs8Up7q1VIhOh7YQaUDK
	U5WoSmlUy6uwnaCPctTjbhgsdYIPXETex1KHA8HWp6gajCQKPXfumcFaX01iMxrRVOqq
	G4XEQSTEbPHgAJ5eDeN/C8+sJeKqDPfU6IWb7Y7asuTJ1dOv5bNscjpVfynr1jQnrGKh
	8HLr4qO/Zty2ADqZyIH+eYCfu85Wax7NxR+am4wcrI4Mn69dgciz/+FYslN6fXOvDB2H
	ti4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F/P5mBb6vSshdZm48hiQW2YdtnA58ht19R3mcVV+owU=;
	b=ofLgTsXvhMznH/RsAxfmEiILls4+cffSNTlqXs/WvokBMpBM+WLIUmtrsCInwX+8go
	CIf6iCN4bZCzI4OfA+xxT8Cm3Yay0f11UMES0vnkMmGpuO+lsJwlql6zgWvD68/q+kce
	8rvdmi02RdntvyAZbRNGHTV9JqBD3bdit8hURQYTJi59HSSlQ94QcBva/5ganVefy4+Q
	ICmcUfxNk7gQfffDjL9bc1k1D3gLDTdLbbn9jJ2UMgoFUo4xOhy3+MMuoyP8fcaxZeUM
	TJox6XANEiYMr+fgI9ee+0vim+WdB8pf2vkfNi096uhKw5ir5rF7GlBWWINfuYf45JsX
	EtPg==
X-Gm-Message-State: APjAAAXWdg0TXlOpsFYKQN2nUnrCxfxP2HNRyGCjyCskCq5as+za5KCn
	lr7WAcdnD4VoWwJKpV08kINM3d2alVQ=
X-Google-Smtp-Source: APXvYqx3XHmDl2L15N0Ibx8nvbDtX46MB0pQtODIWCPgeoljFbMV7Tzx3vtfOKJ25baTQW0fqQWcHA==
X-Received: by 2002:a17:902:1a4:: with SMTP id
	b33mr2785436plb.141.1565848626212; 
	Wed, 14 Aug 2019 22:57:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a12sm1285396pgv.48.2019.08.14.22.57.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 22:57:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 22:56:54 -0700
Message-Id: <20190815055655.6759-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH V2 1/2] util-linux: Make pam specific logic apply to target recipe alone
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
X-List-Received-Date: Thu, 15 Aug 2019 05:57:05 -0000
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
v2:
- Add missing do_install append qualifier
- No need to mark ALTERNATIVE_${PN}-doc target specific

 meta/recipes-core/util-linux/util-linux.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 84c7012752..1fa82363b1 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -190,20 +190,19 @@ do_install () {
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 
 	rm -f ${D}${bindir}/chkdupexe
+}
 
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+do_install_append_class-target () {
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
-- 
2.22.0


