Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id A23EE73123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:09:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p68so1338696qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=mrBmNpqwu9LHCJdumGcPe2rs+Cr48MjKKvi1ge6R4Cs=;
	b=SN7rVKX+CO3ub32rQZ3xu+sjreQr9rf9ZRyLeZ4+lcvwe5BnvBp4/3R9QEFGDIJXVV
	3VFB9DqC/+ZXBq7qGr71NRL/0uKHAfa/CQIGXvrGGmcKJcxA1uTi72mT8ZEAcCEXWAIQ
	WfHIQs33PfSbhPudv4uiIUjHnZHxScbodzXwroDwjrwoOKe0/JqSTkwM0sNYdin2Cw9L
	eJ4w4Dww5m9BVdbkMKEwkjVJP7TG5SOTqO5/W7iypP2zxuR5lBqffMCP0uIYW/4keO0s
	oebtWTlRIPz1rhfVP/hnNFVLWK35JJxfApie5ZkkaMWYaC3eZUlY81z7wx4h4uOMGjLe
	NKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=mrBmNpqwu9LHCJdumGcPe2rs+Cr48MjKKvi1ge6R4Cs=;
	b=A5GhR3gUCpQ9VxNCwbH4wvLI7LbubF9FO3zJo7T/BAxPynUVvLRgVfkP8SVVVbEVaL
	77pOwNkX/UC2xw5T8D45UwF49hUxavQPilO5JrcNaU4WZ3VHGhBToke5aZx6FSMhJ2mJ
	gJomGGnkz7RVD979I0YaTygv/F2r8jrh1zJU3rIYYTrcFE/mfSN/aJLCVjWQvWCNNR4b
	/TaIgJjIcamnZHEApnCff1ugR6MDf/SBRBfZxfgyN5K0EP3oz4ZzvVRFSn/xWM4kw8uh
	zoWBMgpAAawtXavjZYQoiI3YKH6PusRx88l5jDiPx8Lz4bK/s3bxtRiLTTzx9/nukiNs
	Fklg==
X-Gm-Message-State: AFeK/H13R8JWycgihj+RJTqdnWuyeI416N4iswpMFS0Q4I9+9pVc727ytHSr6CSErwg4Rg==
X-Received: by 10.55.33.166 with SMTP id f38mr22740303qki.5.1491394169267;
	Wed, 05 Apr 2017 05:09:29 -0700 (PDT)
Received: from centrium.lab.ossystems ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	q66sm13832411qkd.69.2017.04.05.05.09.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 05:09:28 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 09:09:15 -0300
Message-Id: <20170405120916.17095-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 1/2] wpa-supplicant: Use systemd-tmpfiles to create volatiles files and dirs
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
X-List-Received-Date: Wed, 05 Apr 2017 12:09:28 -0000

Volatiles files are installed in different locations depending on
distro feature update-rc.d or systemd. For update-rc.d volatiles
configuration files are installed in /etc/default/volatiles and
for systemd in /etc/tmpfiles.d/. So, we need to install volatiles
files in correct location depending on what distro feature is used.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d       | 1 +
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb    | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d
new file mode 100644
index 0000000000..5b27498b8e
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.tmpfiles.d
@@ -0,0 +1 @@
+d /var/run/wpa_supplicant   0700    root    root    -   -
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
index 146bccfaa7..ff4ad34d51 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
+           file://wpa_supplicant.tmpfiles.d \
           "
 SRC_URI[md5sum] = "091569eb4440b7d7f2b4276dbfc03c3c"
 SRC_URI[sha256sum] = "b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450"
@@ -93,10 +94,11 @@ do_install () {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}/${systemd_unitdir}/system
 		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
+		install -Dm 0644 ${WORKDIR}/wpa_supplicant.tmpfiles.d ${D}${sysconfdir}/tmpfiles.d/wpa_supplicant.conf
+	else
+		install -d ${D}/etc/default/volatiles
+		install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 	fi
-
-	install -d ${D}/etc/default/volatiles
-	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
 }
 
 pkg_postinst_wpa-supplicant () {
-- 
2.11.0


