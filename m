Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C495E6CBDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 08:46:06 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so68331wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 00:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rQsAt6EymFhmP00Nlg9gVCyYzhAKn77JEDBaE1LBziU=;
	b=mhxxWFOhI1BDcKO4kDAtI3VskfKcSkDxLUuJcadV6oliJKifjtCPNFoCeY4D3fqamT
	PzHgS5NTwZ6rYSFpPrcKC2mzc7nSIZZjXh9bYuxshCGxuFOMVfq4cHm4ynSAnRZRUJ3H
	aQt9n85Ea9ooo3BmjSOK9aEP49b9w9FDwDWmKZU9bKarFM/ssR9VXUHe6Rea0TwURqch
	zIBStHgH74iK8Q2956I2MgZsujjjPo4IB8aw1QPeeUXB/kZx8ZvyklagHeMr0AnG1RXa
	m8+FjEH+Lk3b63tv0Qn74N2nfAZZWCiIFKaL9yhMqLo7If7BMPQ/KwbINK87Qn/QWyfl
	BGJw==
X-Gm-Message-State: ALoCoQmY5PgBLIn+3qiPLxioSji5GICf9zNSMIAkM9jGXqPIE7mmEeLvPFfbxLQ4j5hc6VHj+QSa
X-Received: by 10.194.175.202 with SMTP id cc10mr12773251wjc.48.1392799566676; 
	Wed, 19 Feb 2014 00:46:06 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id di9sm49795077wid.6.2014.02.19.00.46.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Feb 2014 00:46:05 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 09:45:58 +0100
Message-Id: <1392799558-31118-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] openssh: enable PAM at runtime based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 19 Feb 2014 08:46:08 -0000

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
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index 9c0bb48..5b9ec10 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -82,6 +82,8 @@ do_install_append () {
 	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -d ${D}${sysconfdir}/pam.d
 		install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+		sed -i -e 's:#UsePAM no:UsePAM yes:' ${WORKDIR}/sshd_config
+		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
-- 
1.8.4.2


