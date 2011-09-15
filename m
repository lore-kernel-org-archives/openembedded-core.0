Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Cwn-0006ve-Js
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 16:29:50 +0200
Received: by fxi1 with SMTP id 1so707788fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UxAja0lt0aPN/XJRs3Bo/aw6W3K0GAIWHpnWJbmS01I=;
	b=vw+fXRAMVtrb9SdZ9HPVrvfRsc6wYvJCygPY5IKKVSFJB3luRQ+n3fO6bqv0aDca+W
	O9VD4VB5h1SqMKHEBMcQ9uikyiJNjV5gUy9Sz2RI+O4GVBQfpu2Rq0u/34cxjIzNqY31
	zR23D5d+spEf2uyVWF6mPPfCR/+TekIe4q0fg=
Received: by 10.223.34.70 with SMTP id k6mr358307fad.31.1316096678184;
	Thu, 15 Sep 2011 07:24:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c2sm7187946faf.16.2011.09.15.07.24.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 07:24:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 16:24:24 +0200
Message-Id: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1316096375.git.Martin.Jansa@gmail.com>
References: <cover.1316096375.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] openssh: update init script to create ECDSA keys if needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2011 14:29:51 -0000

* Starting with openssh-5.8p1, the server will default to a newer key
  algorithm (ECDSA).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../openssh/openssh-5.8p2/init                     |    4 ++++
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/init b/meta/recipes-connectivity/openssh/openssh-5.8p2/init
index b16cbd6..055dd22 100644
--- a/meta/recipes-connectivity/openssh/openssh-5.8p2/init
+++ b/meta/recipes-connectivity/openssh/openssh-5.8p2/init
@@ -36,6 +36,10 @@ check_keys() {
 		echo "  generating ssh RSA key..."
 		ssh-keygen -q -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
 	fi
+	if [ ! -f /etc/ssh/ssh_host_ecdsa_key ]; then
+		echo "  generating ssh ECDSA key..."
+		ssh-keygen -q -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
+	fi
 	if [ ! -f /etc/ssh/ssh_host_dsa_key ]; then
 		echo "  generating ssh DSA key..."
 		ssh-keygen -q -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
index 89b011d..030a83b 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-- 
1.7.6.1



