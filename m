Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C0C017E07D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a5so7552344pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DPZv+IdNq0dFeF8FfF5hTcB3qZo0Es+U4e76E3PFxR0=;
	b=QJzEXoOtUI1RyiknzDTI0JSJ8vImpgNrMEIXZolNJvBbo7foqhqOnR4Gvk7NEWHzky
	3ibfJcYJEZIDbkF9OEFXkxLNJVW/WRBZhMMOLPmiRmLGkEA+uW84slFYB8IR02LyoTMF
	jxYPmJ8MMKhvUCOLqJyi2GXrz7D5S7+vAlb3fE1jKx3Pd9Blvci5p/q+Zj4p6FL5XPeW
	1ycJD2cGburbKC//bltYDubTxg7nwd9MphrrWYOwqwjYZ6J0PO9Gn+ZQ9sEmSqL+NQaI
	Y3lAsBZow8VRgSd/riwu4SCfrbF1b1EhPvB5HVOdwTuw5YJ99SdGsI7FKk2r73vnxzO3
	xTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DPZv+IdNq0dFeF8FfF5hTcB3qZo0Es+U4e76E3PFxR0=;
	b=n7eYRyuhSJfTB+0AZcz/Ydad2eqPkUFM4922ReI6o/IixJ4rkQltINOdzQa3kJJtaU
	JGWISjEpLLIDsYAjR6KNVzDOzc9oYWMJenwzg+AajdU6gBjtPBBnG5O7bMoSXZ5hDdoK
	0iwKfvLUsgxxOqlzE/ZYC0U1mbh/pu19LGDBqeXWUs8BlBOY+jnY+wOxNoA4epEuWYEM
	1bIT0rbTstil63dEF3fFR5qI4vK6wv94Fw59cywTpGDBhYe1tTrdwdRpz4rWn3dRFoU/
	O/5DksdCSmrezWRmujEeZ/5QRBBDgb0jr/zP36T7y1kwQxjrV/ziZmqaJztb9YuoDmBH
	3Tgg==
X-Gm-Message-State: APjAAAXwJd7yll/cjXAgvxwv5dchq2F6V9rNeGtzP7zyFqdGLqjESTmk
	KtOlbDk2Bs/9coS/WbBIPw/pujY8
X-Google-Smtp-Source: APXvYqz1HkJ4aXmtU3QUi2KC17ADnZ9uf5hFnFXAD7Az9Sdhm4gHqFl+onFTjjlyUxD3hYNsJPtbaw==
X-Received: by 2002:a17:902:4383:: with SMTP id
	j3mr79526442pld.320.1558403006938; 
	Mon, 20 May 2019 18:43:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:08 -0700
Message-Id: <1f84678f58809dd1743422eb059d766870d416e8.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 06/15] openssh: recommend rng-tools with sshd
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
X-List-Received-Date: Tue, 21 May 2019 01:43:25 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Since openssl 1.1.1 and openssh which uses it, sshd
startup is delayed. The delays range from few seconds
to minutes and even to hours. The delays are visible
in host keys generation and when sshd process is started
in response to incoming TCP connection but is failing
to provide SSH version string and clients or tests time out.

In all cases traces show that sshd is waiting for getentropy()
system call to return from Linux kernel, which returns only
after kernel side random number pool is initialized. The pool
is initialized via various entropy source which may be
missing on embedded development boards or via rngd from
rng-tools package from userspace. HW random number generation
and kernel support help but rngd is till needed to feed that data
back to the Linux kernel.

Example from an NXP imx8 board shows that kernel random number pool
initialization can take over 400 seconds without rngd,
and with rngd it is initialized at around 4 seconds after boot.
The completion of initialization is visible in kernel dmesg with line
"random: crng init done".

More details are available from:

 * https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=912087
 * https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=897572
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=43838a23a05fbd13e47d750d3dfd77001536dd33
 * http://www.man7.org/linux/man-pages/man2/getrandom.2.html

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index b971b2b..976bcc5 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
@@ -148,6 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
+RRECOMMENDS_${PN}-sshd += "rng-tools"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed"
 
 RPROVIDES_${PN}-ssh = "ssh"
-- 
2.7.4


