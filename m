Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7934F60C61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:29:01 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s1so4509209wrv.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EhE3lZKOW+DOWsjhjiI/fhaUGNz5cPbDAQFAqTEeCqM=;
	b=nJbtSZtZna+DXfugNjo2Bqs+PTiYckFSFh2SXPPJ1cHao9BW/ai4mC+SPqdbFiGl+z
	+IkRku8kltsQ0jOrnbBjCwdbNFwLFQKrFCtRnCxtc/sZtjaz/vvs9CG8DjTvnmOa3wkY
	U4S42ZOW8QvA/aOKp0cR/sgQSJqU/em03Qy4gIhn2XNwWab1hYECSEr/06eTvadO7FaJ
	L5nyKBgkDfIuqlLGuOSRuBCMNCOhkCN09lSQED0qWzWJJ5FBCsQBMczynNxeV4QcsH41
	8oNUgjcP6qTcJxc/xxbHIQiCdGsc5EUvmX6tVHFtmkwdtwtIMkc3tGZ5jhtc7k0MAMJ3
	9jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EhE3lZKOW+DOWsjhjiI/fhaUGNz5cPbDAQFAqTEeCqM=;
	b=jwOMkCclHxJe7bleb6jTAJNzSkdk6pj0lQVlaefG+mpuZEzW68/ct9GgIgLiPnJ4OW
	A0Qc7hpEmlAEbRlcBr/cboyWL/8ctxnv6gtU2TAaLFwWP83igw4+10LdKjgAJ83b4mrg
	Lu0ccvycTDzY868RJLUZ2g/M1HU/XvZJwRZrrjzMCYLtFidsgREeMEaLm/wtA2KO4+Ou
	e7wk56PJ75l49DdKcBS5rYghNwjlNS+zQ6pqsANVHw0zZRH2PdfJrqh5o2GKmj8+6I6y
	JeIej+GNn1+OEWczAxVunkKh91ahHeGSdm/RD9lagnlHPIyWhSI/Nwy0emqHJ+J86y3u
	hpYQ==
X-Gm-Message-State: ANhLgQ3SLSGugQg5ht6KtpkNJjYtYJHwzKtl8z7v3oCjB5D0Me5FBYSa
	/NaRFYVBhrNTSP1z/oXvymN2cGIx
X-Google-Smtp-Source: ADFU+vuXZxewe7iBO4bD58XfFbUoFNfPge3KNJ48BHFJ18mCmclRt8B7Nltkc+6MOnCAwftQLHM3CA==
X-Received: by 2002:a5d:6344:: with SMTP id b4mr6558639wrw.354.1584458941913; 
	Tue, 17 Mar 2020 08:29:01 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.29.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:29:01 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:23:01 +0000
Message-Id: <20200317152303.4600-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 09/11] systemd: Enable smack based on DISTRO_FEATURES
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
X-List-Received-Date: Tue, 17 Mar 2020 15:29:03 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_245.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_245.bb b/meta/recipes-core/systemd/systemd_245.bb
index 19a8f0cb18af..a7fae930f770 100644
--- a/meta/recipes-core/systemd/systemd_245.bb
+++ b/meta/recipes-core/systemd/systemd_245.bb
@@ -57,7 +57,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux sysvinit usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
@@ -81,7 +81,6 @@ PACKAGECONFIG ??= " \
     randomseed \
     resolved \
     set-time-epoch \
-    smack \
     sysusers \
     timedated \
     timesyncd \
@@ -99,7 +98,6 @@ PACKAGECONFIG_remove_libc-musl = " \
     nss \
     nss-mymachines \
     nss-resolve \
-    smack \
     sysusers \
     userdb \
     utmp \
-- 
2.17.1


