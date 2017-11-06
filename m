Return-Path: <amery@geeks.cl>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0892360110
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 22:12:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r196so49369wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 14:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=geeks-cl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vmQj2ZJvU67B1aEM2gw75B1eHjFrX8vFu1EOzFB5OJY=;
	b=CasgDFnfuWyG+rDpe1UEuODWr47UBPJJiFLoDOMJPmM1DFeQoxsXHJTtcgN33t4eZh
	8lrfHzKzSQ+A8D0LzIj/32Jy8cZodtLvtPMUG/ll1kM6GOvZ3aoYccbjwEhRItITbRUP
	N6wzbynEXMz6xbn4bJjA+fwKN/bDunA5D4aXzawtpPYKGKrQpTfm9PIgfOtq1KIRLL9C
	16pRhJT+pK7nwvvsAum5o3DpFahej8TXKM4Uqct9cBQyFIOaxjFcwOjQwjXBx0Hok6PE
	LIGZOjybDdEA9itj4K3Ws8Y8voajAYYKfl/47glzmBwflULubzKZygPRdo+LCWHemjXQ
	nkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vmQj2ZJvU67B1aEM2gw75B1eHjFrX8vFu1EOzFB5OJY=;
	b=o0ter6d9DQmNGeCoIzRQf5S/3GlVLfUG7CZIkcvEFayTytY/iOiZM+Q4PdH2L9AkXa
	b9rqZsMCgyB84Abw9jAUHLcKGVIFEPYHBCBJj5/pZsJ/XNEHe5v07HgiSgwp+euiojSq
	Gy7fDusAMbWgnweAOi2tVM2uz4lAY23rT8ggKQqITS4TuXpvvBNtdlhWyOohd+40+pqU
	VVtSXYcMCiaaIabN5k5IRJDvCPw9SWsKmkiqqcu7FTmFUpfvoMYb6VJBvaS76NLamVMl
	wnrfCRrYH+BApQkQaYNCpnKFiwjPu0y/+Reokr00fx8UJmK+rVTnZhpuzP7VAfI034ag
	PpCA==
X-Gm-Message-State: AJaThX4f0g9ExH+BpYgyWmaM58gzjFtRt8tSI3U3VcVc8OEyeSW+FeYC
	Nn5Zgu2gq0zP8NBXHirZApY7N2aCUvI=
X-Google-Smtp-Source: ABhQp+RvIywmUSfO6gabYb5Nv2yXSDMGpJT23XCi6BOgCclziBxOjUpIKHu/vC4wEVfN0zmrVdJrqQ==
X-Received: by 10.28.37.195 with SMTP id l186mr6798057wml.144.1510006355835;
	Mon, 06 Nov 2017 14:12:35 -0800 (PST)
Received: from localhost ([144.76.71.155])
	by smtp.gmail.com with ESMTPSA id p128sm73113wmb.1.2017.11.06.14.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 14:12:35 -0800 (PST)
From: Alejandro Mery <amery@geeks.cl>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Nov 2017 23:12:23 +0100
Message-Id: <20171106221223.30826-1-amery@geeks.cl>
X-Mailer: git-send-email 2.15.0
Subject: [meta][PATCH] openssh-sshd: regenerate zero-size keys on start
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
X-List-Received-Date: Mon, 06 Nov 2017 22:12:36 -0000

sometimes the first time a machine boots power gets pull out and the content of the
key files doesn't get sync leading to zero-size keys which permanently prevents
ssh access. it's safer to assume that zero-sized files are equivalent to non-existant
keys and generate them again.

Signed-off-by: Alejandro Mery <amery@geeks.cl>
---
 meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 8 ++++----
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb        | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index 5463b1a4cb..8cc31c339a 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -71,19 +71,19 @@ HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | a
 [ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
 
 # create keys if necessary
-if [ ! -f $HOST_KEY_RSA ]; then
+if [ ! -s $HOST_KEY_RSA ]; then
     echo "  generating ssh RSA key..."
     generate_key $HOST_KEY_RSA rsa
 fi
-if [ ! -f $HOST_KEY_ECDSA ]; then
+if [ ! -s $HOST_KEY_ECDSA ]; then
     echo "  generating ssh ECDSA key..."
     generate_key $HOST_KEY_ECDSA ecdsa
 fi
-if [ ! -f $HOST_KEY_DSA ]; then
+if [ ! -s $HOST_KEY_DSA ]; then
     echo "  generating ssh DSA key..."
     generate_key $HOST_KEY_DSA dsa
 fi
-if [ ! -f $HOST_KEY_ED25519 ]; then
+if [ ! -s $HOST_KEY_ED25519 ]; then
     echo "  generating ssh ED25519 key..."
     generate_key $HOST_KEY_ED25519 ed25519
 fi
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 86ca6ff372..2f178b26d8 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
@@ -8,6 +8,8 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
+PR = "r1"
+
 # openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
 DEPENDS = "zlib openssl10"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-- 
2.15.0


