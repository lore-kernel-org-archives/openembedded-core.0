Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f44.google.com (mail-bk0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 113776E7CF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 12:16:59 +0000 (UTC)
Received: by mail-bk0-f44.google.com with SMTP id mz12so1834184bkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 04:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xhe0QLd0sr3mGfXGXi8yWiSLfHnCny9s61gG54D2L8g=;
	b=ggnLvyqVzJPNRbK4XAMkdnXRnQV9HSFpaPIUrL7iNWwPrgQwPpC4N+cj4JrqmV07nk
	+S6y/fHXBuPmjGGNZ/Vc2105VJKu/C0fy66e9W5Ww2xw2CQLJ1GorpmCTVeyblweAvM5
	klZkfvo1aIigR7D3PWeiXOYkbiGYBUwiLK3Kjz94vPoFCrx3OcrbFcTNL0abZrjS98pC
	13sSHaS6oqTQBSexz6oK0uGkI9/l6wGFiH7+p0X2BOOJIpjF/RoPwrcjJ8jfwt6VDRW2
	FCZAfLD3X95xAaSAazMA1zPYad4TAs3ULfJ9iAxU+QFPXtwWoFsOlSnTkCrF1xAGMfYr
	mBeg==
X-Gm-Message-State: ALoCoQkypGms6JWZcAhQsHeWtc8NQpQd5TWRwkGxO9Xx5VntHYMJDQijys8JOH5DBqBOo72SFaf9
X-Received: by 10.204.64.65 with SMTP id d1mr122112bki.108.1390652220401;
	Sat, 25 Jan 2014 04:17:00 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id f3sm6187727bkk.4.2014.01.25.04.16.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sat, 25 Jan 2014 04:16:59 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jan 2014 13:16:52 +0100
Message-Id: <1390652212-30440-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1390652212-30440-1-git-send-email-koen@dominion.thruhere.net>
References: <1390652212-30440-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] openssh: drag in required PAM modules.
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
X-List-Received-Date: Sat, 25 Jan 2014 12:17:00 -0000

/etc/pam.d/opensshd lists keyinit and uid as required, so add them to
RDEPENDS when PAM is enabled.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index b124c8b..94d0efe 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -122,7 +122,7 @@ FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
-RDEPENDS_${PN}-sshd += "${PN}-keygen initscripts-functions"
+RDEPENDS_${PN}-sshd += "${PN}-keygen initscripts-functions ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-- 
1.7.10


