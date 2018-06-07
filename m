Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2FD7852F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 18:48:53 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id c41-v6so6680975plj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kyqXML5g7ILSJWWOVNdCzwO8OV9YI1xAdbWnUsROkvc=;
	b=F2R+sSTSckbGI+94s1hjpswVxuisRjahYx6QQThD31dr01c2jFzFtkEk09uVgNPeHn
	E2ThRc/hs9T5HznjZxtkm4aZvpo1WUmSqPQwpav7RuCCTjte/9TY4bnaIBH1oppo7jLg
	qZlaObz8KTWQbLrYmhKAAscuLYbnsiXhQRV5p4vpc3EqdjvMluPA9buO1ugaIjqCigMs
	DXYB09wJ+6vfyUl5aRB1Mgwr902fiMzcUgVv+FyYWMvrgdgR8fFAiTh3kPO0CK1YBoW0
	jHLzQLUiTvf4iK1bqm4vD6zl1VO1WeThSohKU2GkmxZsGjYazWSIQZFuMc8J38UIgRQy
	9SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kyqXML5g7ILSJWWOVNdCzwO8OV9YI1xAdbWnUsROkvc=;
	b=tszVcI7vpZdDGc5b03QsHi4ex+2I6UdQiDhXsNGpH/eeh0sCyFlUIT44n7WWydaVl7
	xrUrxOFn3dGYpOlbwQHOjtyPYIvE6wb1OuCXOsg+Q55K0TV80nOHM1DducCrU0SEwmRD
	R4jW0Hm+iqr86nR3a2DmRnxcf74XKFt4k9Ck6vUjcGeA/9M5zlU6uWFpZNbn+SZJtZtG
	N5YyShpKhgIU3KyTkZxvsGbdisjK1YdIAg9fJRzFA2kV0hss4aHaD/bfFkIEadctz/Tx
	4ZvmBXTxTaq6TcOPoLzOxDuTHHGAmr2fpdJeZruNfEma2HGwIGSkXr5qkq1w7Jj+V64m
	vBbw==
X-Gm-Message-State: APt69E3Q5KmjXJenH+5w2qsQiQU7Vpld1BkaFIOly8C0zPP91Nh3IMAI
	yG/E59PfHxy4APmxW/tUJTiOgA==
X-Google-Smtp-Source: ADUXVKJ+ANFaAO7923XON8BLif+HRp19FW0fXIWMTkZeSD3C/pSD4ABAy0cUDy8obek02W5FiT+WNQ==
X-Received: by 2002:a17:902:14b:: with SMTP id
	69-v6mr3265084plb.184.1528397334227; 
	Thu, 07 Jun 2018 11:48:54 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f30-v6sm27103558pgn.76.2018.06.07.11.48.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 11:48:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 11:48:38 -0700
Message-Id: <1528397320-32269-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/7] openssh: sync local ssh_config + sshd_config files with upstream 7.7p1
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
X-List-Received-Date: Thu, 07 Jun 2018 18:48:53 -0000

Changes are mostly related to the removal of support for SSH v.1
protocol, which was dropped from openssh sshd in 7.4p1:

  https://www.openssh.com/txt/release-7.4

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../openssh/openssh/ssh_config                     | 12 ++++-----
 .../openssh/openssh/sshd_config                    | 29 ++++++----------------
 2 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
index 9e91915..e0d0238 100644
--- a/meta/recipes-connectivity/openssh/openssh/ssh_config
+++ b/meta/recipes-connectivity/openssh/openssh/ssh_config
@@ -1,4 +1,4 @@
-#	$OpenBSD: ssh_config,v 1.28 2013/09/16 11:35:43 sthen Exp $
+#	$OpenBSD: ssh_config,v 1.33 2017/05/07 23:12:57 djm Exp $
 
 # This is the ssh client system-wide configuration file.  See
 # ssh_config(5) for more information.  This file provides defaults for
@@ -31,14 +31,14 @@ Host *
 #   AddressFamily any
 #   ConnectTimeout 0
 #   StrictHostKeyChecking ask
-#   IdentityFile ~/.ssh/identity
 #   IdentityFile ~/.ssh/id_rsa
 #   IdentityFile ~/.ssh/id_dsa
+#   IdentityFile ~/.ssh/id_ecdsa
+#   IdentityFile ~/.ssh/id_ed25519
 #   Port 22
-#   Protocol 2,1
-#   Cipher 3des
-#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
-#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com,hmac-ripemd160
+#   Protocol 2
+#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc
+#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com
 #   EscapeChar ~
 #   Tunnel no
 #   TunnelDevice any:any
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index b7c3ccd..15f061b 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -1,4 +1,4 @@
-#	$OpenBSD: sshd_config,v 1.80 2008/07/02 02:24:18 djm Exp $
+#	$OpenBSD: sshd_config,v 1.102 2018/02/16 02:32:40 djm Exp $
 
 # This is the sshd server system-wide configuration file.  See
 # sshd_config(5) for more information.
@@ -7,7 +7,7 @@
 
 # The strategy used for options in the default sshd_config shipped with
 # OpenSSH is to specify options with their default value where
-# possible, but leave them commented.  Uncommented options change a
+# possible, but leave them commented.  Uncommented options override the
 # default value.
 
 #Port 22
@@ -15,42 +15,30 @@
 #ListenAddress 0.0.0.0
 #ListenAddress ::
 
-# The default requires explicit activation of protocol 1
-Protocol 2
-
-# HostKey for protocol version 1
-#HostKey /etc/ssh/ssh_host_key
-# HostKeys for protocol version 2
 #HostKey /etc/ssh/ssh_host_rsa_key
 #HostKey /etc/ssh/ssh_host_ecdsa_key
 #HostKey /etc/ssh/ssh_host_ed25519_key
 
-# Lifetime and size of ephemeral version 1 server key
-#KeyRegenerationInterval 1h
-#ServerKeyBits 1024
-
 # Ciphers and keying
 #RekeyLimit default none
 
 # Logging
-# obsoletes QuietMode and FascistLogging
 #SyslogFacility AUTH
 #LogLevel INFO
 
 # Authentication:
 
 #LoginGraceTime 2m
-#PermitRootLogin yes
+#PermitRootLogin prohibit-password
 #StrictModes yes
 #MaxAuthTries 6
 #MaxSessions 10
 
-#RSAAuthentication yes
 #PubkeyAuthentication yes
 
 # The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
 # but this is overridden so installations will only check .ssh/authorized_keys
-AuthorizedKeysFile .ssh/authorized_keys
+AuthorizedKeysFile	.ssh/authorized_keys
 
 #AuthorizedPrincipalsFile none
 
@@ -58,11 +46,9 @@ AuthorizedKeysFile .ssh/authorized_keys
 #AuthorizedKeysCommandUser nobody
 
 # For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
-#RhostsRSAAuthentication no
-# similar for protocol version 2
 #HostbasedAuthentication no
 # Change to yes if you don't trust ~/.ssh/known_hosts for
-# RhostsRSAAuthentication and HostbasedAuthentication
+# HostbasedAuthentication
 #IgnoreUserKnownHosts no
 # Don't read the user's ~/.rhosts and ~/.shosts files
 #IgnoreRhosts yes
@@ -71,7 +57,8 @@ AuthorizedKeysFile .ssh/authorized_keys
 #PasswordAuthentication yes
 #PermitEmptyPasswords no
 
-# Change to no to disable s/key passwords
+# Change to yes to enable challenge-response passwords (beware issues with
+# some PAM modules and threads)
 ChallengeResponseAuthentication no
 
 # Kerberos options
@@ -110,7 +97,7 @@ ChallengeResponseAuthentication no
 Compression no
 ClientAliveInterval 15
 ClientAliveCountMax 4
-#UseDNS yes
+#UseDNS no
 #PidFile /var/run/sshd.pid
 #MaxStartups 10:30:100
 #PermitTunnel no
-- 
1.9.1


