Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDED8787ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:42:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i186so3839380wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OmNF+xcYJIxGrREg4cBly421UiQET2Lv9z0MefNixh4=;
	b=YtfuxbiXE7cQP20eTGGPO3XDo9Z3ZXCVkilgCx2qteizFULNpSabhgTfJ7k65IHq3u
	XZKRP/LJzo8482SOefasPo6eW1OnhnSYMm01dAs5oCFCIWgGWZHYL0L8yVLElz/n2/9j
	MewouU3KthlFu8MHd3j3NwnwxfvVrIvbQt6StDLpR+cA3vEilV43DtPthMN5irR+fbgB
	wi/NFKDzf08UJYmg6J8nQ5RDHg5/UDbV3OcB8ZLuGshaIA8USR9c5/warbhsEyLpbpJm
	vX9oPsFnq+6F7SzkY31DZwoEdUB2ZT8ThJtYLF8FiZmSL7ahlCvgiqWFJC7pHHJAM2z5
	tC2Q==
X-Gm-Message-State: AKwxytenHfD1we0AjLycyCVrgv8quS5RL3HyYdBr1kL56lhuby1zGu1T
	mVnKjAu3x/3GYWmDAFEYFf6/6aJcpM0=
X-Google-Smtp-Source: AH8x225o0gURD1SsHyF6Q48M2w9dst7boJyyJIQa8bnbiIny6NEccYrun+NNNf0T+d0YX4s2iIKIRQ==
X-Received: by 10.80.220.206 with SMTP id v14mr9631edk.196.1516372943224;
	Fri, 19 Jan 2018 06:42:23 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x25sm6749148eda.8.2018.01.19.06.42.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 06:42:22 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 14:42:12 +0000
Message-Id: <20180119144213.7364-3-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180119144213.7364-1-git@andred.net>
References: <20180119144213.7364-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/3] connman: Fix a crash using wispr over TLS
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
X-List-Received-Date: Fri, 19 Jan 2018 14:42:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jian Liang <jianliang@tycoint.com>

This is happened when doing wispr against a HTTPS URL
rather than the default one, i.e.
http://ipv4.connman.net/online/status.html

When gnutls_channel is instantiated, the gnutls_channel->established
has to be initiated as FALSE. Otherwise, check_handshake function
won't work. A random initial value 1 of gnutls_channel->established
will make check_handshake return G_IO_STATUS_NORMAL, when the channel
is actually not ready to be used. The observed behaviours are,

- wispr is getting random errors in wispr_portal_web_result
- ConnMan crashes on exit after those random errors
- when wispr is luckly working, ConnMan doesn't crash on exit

Signed-off-by: Jian Liang <jianliang@tycoint.com>
Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 ...iognutls-Fix-a-crash-using-wispr-over-TLS.patch | 41 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.35.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch b/meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch
new file mode 100644
index 0000000000..f9080d4ba9
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch
@@ -0,0 +1,41 @@
+From 929fc9b7068100444e0ffcccd25841f78791e619 Mon Sep 17 00:00:00 2001
+From: Jian Liang <jianliang@tycoint.com>
+Date: Fri, 15 Sep 2017 06:40:08 -0400
+Subject: [PATCH] gweb: Fix a crash using wispr over TLS
+To: connman@lists.01.org
+Cc: wagi@monom.org
+
+When gnutls_channel is instantiated, the gnutls_channel->established
+has to be initiated as FALSE. Otherwise, check_handshake function
+won't work. A random initial value 1 of gnutls_channel->established
+will make check_handshake return G_IO_STATUS_NORMAL, when the channel
+is actually not ready to be used. The observed behaviours are,
+
+- wispr is getting random errors in wispr_portal_web_result
+- ConnMan crashes on exit after those random errors
+- when wispr is luckly working, ConnMan doesn't crash on exit
+
+Signed-off-by: Jian Liang <jianliang@tycoint.com>
+
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=73e53f3bd9e7debae86341f1eee7b97862a56a5e]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+ gweb/giognutls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gweb/giognutls.c b/gweb/giognutls.c
+index 09dc9e7..c029a8b 100644
+--- a/gweb/giognutls.c
++++ b/gweb/giognutls.c
+@@ -421,7 +421,7 @@ GIOChannel *g_io_channel_gnutls_new(int fd)
+ 
+ 	DBG("");
+ 
+-	gnutls_channel = g_new(GIOGnuTLSChannel, 1);
++	gnutls_channel = g_new0(GIOGnuTLSChannel, 1);
+ 
+ 	channel = (GIOChannel *) gnutls_channel;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.35.bb b/meta/recipes-connectivity/connman/connman_1.35.bb
index e7e5d38d61..4663a7e3e8 100644
--- a/meta/recipes-connectivity/connman/connman_1.35.bb
+++ b/meta/recipes-connectivity/connman/connman_1.35.bb
@@ -7,6 +7,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://no-version-scripts.patch \
             file://includes.patch \
             file://0001-session-Keep-track-of-addr-in-fw_snat-session.patch \
+            file://0001-giognutls-Fix-a-crash-using-wispr-over-TLS.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                              "
-- 
2.15.1


