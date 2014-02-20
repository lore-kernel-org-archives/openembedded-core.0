Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 376B16F1ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:07:26 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so281611wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 23:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sTSTV8Y92riQhe/Qsdg4/eUO5Vs7s1HFpz2wH8BUA3o=;
	b=GZj5d8A3afwz29sTVXi9LwyZnGPB7er2fpJhlHLwBVnkG1git+zWRQdBooMBcVVhxh
	8mVCItcE7SaarpT3mtRfDL354J5JRpneVADM5gj2K9VcLejJ8xy3Xdc1LIlB7HFCi3/1
	hWRLof02iCXzaNd/4xZ2i65ddI+YLnH8/4aeFtmRtJPaYSDtqo5uonjKfe3GAwhhp2+F
	Zu+xZr674liWXCRreVMnjK5ZiG2SMYNdJaJBrY/ZjAM1zCw1c9hgdvmMaOi7nkTqfss7
	sPkJNIytZmPDQNq4avBgA2LWQDdhYDFiO5Vh7cIJlT+pFrnpPyBafJTbzt+aeRWBqHXP
	uihQ==
X-Gm-Message-State: ALoCoQkU4gTRkUT9ynP72jtHAOKxPbg23yZL5ebG3jXH94QYluv3QJkPDMPIfYV99I8DEim1vpmk
X-Received: by 10.194.170.133 with SMTP id am5mr246519wjc.42.1392880046945;
	Wed, 19 Feb 2014 23:07:26 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	ff7sm58841831wic.10.2014.02.19.23.07.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Feb 2014 23:07:26 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 08:07:22 +0100
Message-Id: <1392880042-22584-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCHv2] openssh: enable PAM at runtime based on DISTRO_FEATURES
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
X-List-Received-Date: Thu, 20 Feb 2014 07:07:27 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Everything is setup to use PAM except for the server config. If 'pam' is
in DISTRO_FEATURES the configs will be changed to enable it.

Syslog will now show:

	Feb 19 09:28:36 beast sshd[2980]: pam_unix(sshd:session): session opened for user koen by (uid=0)

And more importantly:

	koen@beast:~$ loginctl
	   SESSION        UID USER             SEAT
	        c1       1000 koen             seat0
	        c3       1000 koen             seat0
	       c13       1000 koen

	3 sessions listed.

Systemd now registers the session properly so it won't kill things like 'screen'
and 'tmux' when disconnecting the ssh session.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index 9c0bb48..b5e84d4 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -80,8 +80,8 @@ do_compile_append () {
 
 do_install_append () {
 	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
-		install -d ${D}${sysconfdir}/pam.d
-		install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+		install -D -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+		sed -i -e 's:#UsePAM no:UsePAM yes:' ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
-- 
1.8.4.2


