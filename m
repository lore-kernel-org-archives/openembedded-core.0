Return-Path: <athoik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC0277E0E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 21:02:26 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y15so3584743wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Sep 2017 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+yAsfImcbOSYKUN+dK1/LOrVg1wTkwq2pImQtQIcdAk=;
	b=QQLgJkXkaECw1fzk/TGkiBnnrCiQut5+Rbaa730ir8vkhXaFpK1sjKzksn+ot5+SRy
	pCj0Iz3TDz23Gdr5+ZiIcdI5CNdktXrF2kLC5xK9nzzM2sawXRvOKLkhnjnIWbTGybOe
	ewwnNH/i8YUV24WqK3nC6TYhFd2/vvxhL6bPCbRql7GZi26mvnfS4gF6cK/nFHSJ3lM2
	FNRradI0APIAsIpY/+esmiQLvA+1QAALAg9VpDY/iCbKN3UAVU5gQUuL1kpwWBulUeyd
	hMlos1+UdMTTwa30+KiMIHNIB8t8+POTVQsogTNa36BpzfKYYbfI2eWfRHIszMdcbUIH
	mMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+yAsfImcbOSYKUN+dK1/LOrVg1wTkwq2pImQtQIcdAk=;
	b=pbEbnH4qtV688SpylhmZwkaLn0JAKWiw9gbuebIUiH2cDjB0RiPpB81AbuhkB8KmFJ
	idswoT7ZU5rX6xO/Unx2V3bQD6II4f7QTuOqAhUJpBfZYm7Lbrh+FNoK3eZlg8MWyCAb
	bGcXizzyW9OLmhsC4xQ69X+Bir03tJ/zp97z7444iIRs/jk8DaCqOzZQFQ7WHwlXGy4n
	JpsvkgKxH6WZqSeGE96FVkyuqYm/GAZ7y2aGgrIZADzI1ihvSik6Z4UiP+dnnfXfOtTf
	VfV5u+hAJfwyIx5kqkSWKDhbdAo58T7AHdn+vED6Poz4OW6GPaoLRAMc06Y6zXjQBjbv
	GA5w==
X-Gm-Message-State: AHPjjUhvZ0xnwDfL/sLXdH1OG0NOdF6q8vHvpTQYZGCVNfxQkfwPxtGg
	URKMNxTQ14YDf89+
X-Google-Smtp-Source: ADKCNb6YYcg6ne1Ju8bpXpVkw/Zpm2/Y/ixvHAXxRDiioT8+4dJ4tv3UZp0EZiMySrLng83dUKtcmw==
X-Received: by 10.223.153.163 with SMTP id y32mr333008wrb.8.1504731747602;
	Wed, 06 Sep 2017 14:02:27 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	m127sm1887448wmm.33.2017.09.06.14.02.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Sep 2017 14:02:27 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Sep 2017 00:07:07 +0300
Message-Id: <1504732027-31142-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH] vsftpd: link with wrap when tcp-wrappers configured
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
X-List-Received-Date: Wed, 06 Sep 2017 21:02:27 -0000

By default we do not build vsftpd with tcp-wrappers, so we should not include lib wrap.
Make lib wrap optional depending on tcp-wrappers PACKAGECONFIG.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index e524614..7a20356 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -37,6 +37,7 @@ PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
 PAMLIB = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
+WRAPLIB = "${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '-lwrap', '', d)}"
 NOPAM_SRC ="${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
 
 inherit update-rc.d useradd systemd
@@ -54,7 +55,7 @@ do_configure() {
 }
 
 do_compile() {
-   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} -lwrap"
+   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} ${WRAPLIB}"
 }
 
 do_install() {
-- 
2.1.4


