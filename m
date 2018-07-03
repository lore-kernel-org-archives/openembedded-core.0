Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEF7745F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:37:48 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id h10-v6so1805921wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 05:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Nc0P+/AoUpY5KPAEk0FbSAx1qQsWaF6WM/buo+/10Rw=;
	b=elX9BFX0MHegUk4s/QjGWeqFF5yQ5/lxKXRe3mTE7AxyqGqgtfGS2eK4ND4VYKCY0x
	y///SPA0uKhhPxYC5oFFkS2WsbTZrYDXrn2q0vRr8oqysh0+9yiMNiBR67o8W0DoNllp
	G8pX5Ti1miBIxJ62YUwhxg03V6BgU2YsYF/m6H/DTr7H4LUATN5ZS152F+pCqymuwIb9
	Y1suDkXMOCDBD6zy6oodSuTkrfDcJIIWLzSaU1H2EG3wUmkLh+/2Z0d+Ktg9fxdBa8JS
	2SCP/cCpRG84Nu+wVx4WOxs0Fpkr1a1LUTi8W5BOfCBU95Ep+AiaYt7niDUfpD5ypgKr
	BsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nc0P+/AoUpY5KPAEk0FbSAx1qQsWaF6WM/buo+/10Rw=;
	b=ofFOzLFnppsB6cNLNtS7TBSZBMuCR5wlyGWNltf+SRY9b2ziW05eokvetnFG1MAje0
	tC6G+mMDqT74n3Z5VolWw6uXSbhVl/9OkP41nJdhTQMcHGjGnaodDaoFcgCOEi8ClZud
	i1iUlY+0LcJ3LFb/0aepmOLImIhe1d4/gBHieDiYXHEr3kc05q7yr6BWrOl3HWdt3Bnl
	YcxB6F5COU5QQFNa9ueLpzIZR+J+DPHXvj9zSibSzWtQ72tM8vp5/UQEH6lBno1ZURz5
	3KOI2UU3yIcOII3rum3iw4ok8LHQ2rNbumGEidvFWxD4jUz1TlgDLyEfKODvgMqKyMoe
	LgpA==
X-Gm-Message-State: APt69E3ad8p6a83RLaFTSYtFIeAxuse3WdSjge798w9z2EIyrKq8BMxs
	uEXPImfDLWGwd5QF24Wp8xi82l6d
X-Google-Smtp-Source: AAOMgpdXaS8nkpaSGaa88vIr1lNsB4cjvk8zOu3Q05+HtcNyW2anwYeD1ZzIUS5hxCntN1p6vmC1oQ==
X-Received: by 2002:adf:be8d:: with SMTP id
	i13-v6mr1107939wrh.86.1530621468607; 
	Tue, 03 Jul 2018 05:37:48 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	i4-v6sm2247128wmf.4.2018.07.03.05.37.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jul 2018 05:37:48 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 12:37:33 +0000
Message-Id: <1530621453-19618-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Tue, 03 Jul 2018 12:37:48 -0000

Add missing dependency on the ssh binary for the sftp client to avoid
failure at runtime if it's not been installed through another dependency
chain.

This introduces a note if PREFERRED_RPROVIDER_ssh is not set and it
can be satisfied by multiple providers (e.g. openssh and dropbear).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Depend on ssh not ${PN}-ssh so it can be satisfied by openssh or dropbear

 meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index b3da5f6..3240f1e 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -146,6 +146,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
+RDEPENDS_${PN}-sftp += "ssh"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
 
 RPROVIDES_${PN}-ssh = "ssh"
-- 
2.7.4


