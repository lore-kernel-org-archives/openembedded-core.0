Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3528165E2B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:26:54 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so2020133wib.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 01:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NdZf4SKxnX/D3LQh9TQ1Tt3RZERb5qlJ2ZerbAxhZGg=;
	b=Oy1BpduKkE6C74flb/4qljqv8ZInCDlmVMH3eTG3zVo+HVb6uvtdFRQum9mjYimWlg
	pCgKirgEanMz7lRv83gOjyP5FgJtYIwe0DUqdWleAKwQoEIE4e4uN5KUA1dkRTLFGkOF
	JTe72k+XT0gL5+R2zD0vEcUmRMnFBCUCmH9T5dYxFTDomlDPtLTZ2+X+CcMK5FszI71U
	CjLsSRQN7nGBaVrI3sNE/uvUDBCj72p1/TKHdQudkDFAoqmYccRZbGmN4gbBktsuO8Nt
	O+Ds/OtT9xxfhk0IOSV8iB5qzxt3KXjU6iXQvTwa3IqlNm6pZARRrZjaITkjZiTAYgcY
	NnhQ==
X-Gm-Message-State: ALoCoQlL9xYtarj6/P8db3sCe755Be5XeC9lzXfVQSWiaMhgVlqsR26HK00fJfP7vIHTWNJbgHOB
X-Received: by 10.180.11.148 with SMTP id q20mr9563679wib.56.1407572815635;
	Sat, 09 Aug 2014 01:26:55 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id ex4sm16478075wic.2.2014.08.09.01.26.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 01:26:54 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 10:26:49 +0200
Message-Id: <1407572810-26063-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 1/2] nssmyhostname: fix runtime dependencies
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
X-List-Received-Date: Sat, 09 Aug 2014 08:26:57 -0000

This should fix:

19:40 <fabo> ERROR: Unable to install packages. Command '/mnt/ci_build/workspace/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f /mnt/ci_build/workspace/tmp/work/genericarmv8-oe-linux/linaro-image-minimal/1.0-r0/opkg.conf -o
             /mnt/ci_build/workspace/tmp/work/genericarmv8-oe-linux/linaro-image-minimal/1.0-r0/rootfs --force_postinstall --prefer-arch-to-version   install opkg-collateral stress libnss-myhostname2 run-postinsts auto-serial-console
             util-linux-fsck stress-dbg packagegroup-co
19:41 <fabo> sed: can't read /mnt/ci_build/workspace/tmp/work/aarch64-oe-linux/nss-myhostname/0.3-r0/image/etc/nsswitch.conf: No such file or directory

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index d8ec863..b9ddeaf 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -13,6 +13,9 @@ SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67
 
 inherit autotools
 
+# /etc/nsswitch.conf needs to be present
+RDEPENDS_${PN} = "base-files"
+
 pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
 		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-- 
1.9.3


