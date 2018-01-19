Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AFEE3787C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:42:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v123so3998811wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zs21vBPGTX9k/OEnfcBZBB0yAUw1FciULuMVwnUoeGQ=;
	b=pgZ2Q8TNcLeDg4gUR7TOenDoumHwd/CJXHcYYHEwuhKyEsKD9LIZiZiXCZjMyS0+3Y
	fu9b9mC7M0SSxHrHSHa1e/+aSvd8THMEFnFiyqN2EwR5SqxkRgKqxNEHb/Wpd6v+JhVu
	GsMrrh3noXYvsV98bWytqGvXTrcnooZ3/omYoMu/Jh3Q+jpL3gBDrtTaftehi+Jay4rE
	CUhnylBEzf+WIJXmalmtqHT1lgpduMQ01orlEsHP6ZBfJHdtFZ5E+dT5Boun4Fy1lEHT
	sZvDzvIj/wmYr+Y9onJZ3u+BvfTTXcpPVmkVWtmFazdjtKcukTzkgx74WV/cAISOIO55
	jC5A==
X-Gm-Message-State: AKwxytcjkYCMG3/zCODQASxTFlhIwP4n0/44Hz3Jzk/WRv4h3La9NsqZ
	baGZrQthrZDjswGHqdyj0CwPw/KbBaI=
X-Google-Smtp-Source: ACJfBoubiPLHXfUDvLSadPB/0RlB90b29OlosO4VA7mAUHU/C9I/OvJ8hbB+kwqlLKgOGa4hYGzKCQ==
X-Received: by 10.80.146.240 with SMTP id l45mr13086859eda.125.1516372942185; 
	Fri, 19 Jan 2018 06:42:22 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x25sm6749148eda.8.2018.01.19.06.42.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 06:42:21 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 14:42:11 +0000
Message-Id: <20180119144213.7364-2-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180119144213.7364-1-git@andred.net>
References: <20180119144213.7364-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 1/3] connman: fix nat-postrouting not update issue
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
X-List-Received-Date: Fri, 19 Jan 2018 14:42:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jian Liang <jianliang@tycoint.com>

When more than one session are created with the same
"AllowedInterface", connman failed to update nat-
postrouting rules when new IP address was got

Signed-off-by: Jian Liang <jianliang@tycoint.com>
Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 ...ion-Keep-track-of-addr-in-fw_snat-session.patch | 112 +++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.35.bb  |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch b/meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch
new file mode 100644
index 0000000000..f1b4d0aaa7
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-session-Keep-track-of-addr-in-fw_snat-session.patch
@@ -0,0 +1,112 @@
+From b5fd5945886fa1845db5c969424b63d894fe0376 Mon Sep 17 00:00:00 2001
+From: Jian Liang <jianliang@tycoint.com>
+Date: Fri, 25 Aug 2017 10:02:16 -0400
+Subject: [PATCH 1/2] session: Keep track of addr in fw_snat & session
+To: connman@lists.01.org
+Cc: wagi@monom.org
+
+When there is more than one session in fw_snat's list of sessions,
+fw_snat failed to be re-created when update-session-state is triggered
+with new IP address. This is because index alone is not sufficient to
+decide if fw_snat needs to be re-created. The solution here is to keep
+a track of IP addr and use it to avoid false lookup of fw_snat.
+
+Signed-off-by: Jian Liang <jianliang@tycoint.com>
+
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=f9e27d4abfcab5c80a38e0850b5ddb26277f97c1]
+Signed-off-by: André Draszik <andre.draszik@jci.com>
+ src/session.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/src/session.c b/src/session.c
+index 9e3c559..965ac06 100644
+--- a/src/session.c
++++ b/src/session.c
+@@ -65,6 +65,7 @@ struct connman_session {
+ 	struct firewall_context *fw;
+ 	uint32_t mark;
+ 	int index;
++	char *addr;
+ 	char *gateway;
+ 	bool policy_routing;
+ 	bool snat_enabled;
+@@ -79,6 +80,7 @@ struct fw_snat {
+ 	GSList *sessions;
+ 	int id;
+ 	int index;
++	char *addr;
+ 	struct firewall_context *fw;
+ };
+ 
+@@ -200,7 +202,7 @@ static char *service2bearer(enum connman_service_type type)
+ 	return "";
+ }
+ 
+-static struct fw_snat *fw_snat_lookup(int index)
++static struct fw_snat *fw_snat_lookup(int index, const char *addr)
+ {
+ 	struct fw_snat *fw_snat;
+ 	GSList *list;
+@@ -208,8 +210,11 @@ static struct fw_snat *fw_snat_lookup(int index)
+ 	for (list = fw_snat_list; list; list = list->next) {
+ 		fw_snat = list->data;
+ 
+-		if (fw_snat->index == index)
++		if (fw_snat->index == index) {
++			if (g_strcmp0(addr, fw_snat->addr) != 0)
++				continue;
+ 			return fw_snat;
++		}
+ 	}
+ 	return NULL;
+ }
+@@ -224,6 +229,7 @@ static int fw_snat_create(struct connman_session *session,
+ 
+ 	fw_snat->fw = __connman_firewall_create();
+ 	fw_snat->index = index;
++	fw_snat->addr = g_strdup(addr);
+ 
+ 	fw_snat->id = __connman_firewall_enable_snat(fw_snat->fw,
+ 						index, ifname, addr);
+@@ -238,6 +244,7 @@ static int fw_snat_create(struct connman_session *session,
+ 	return 0;
+ err:
+ 	__connman_firewall_destroy(fw_snat->fw);
++	g_free(fw_snat->addr);
+ 	g_free(fw_snat);
+ 	return err;
+ }
+@@ -393,7 +400,7 @@ static void del_nat_rules(struct connman_session *session)
+ 		return;
+ 
+ 	session->snat_enabled = false;
+-	fw_snat = fw_snat_lookup(session->index);
++	fw_snat = fw_snat_lookup(session->index, session->addr);
+ 
+ 	if (!fw_snat)
+ 		return;
+@@ -420,8 +427,11 @@ static void add_nat_rules(struct connman_session *session)
+ 	if (!addr)
+ 		return;
+ 
++	g_free(session->addr);
++	session->addr = g_strdup(addr);
++
+ 	session->snat_enabled = true;
+-	fw_snat = fw_snat_lookup(index);
++	fw_snat = fw_snat_lookup(index, session->addr);
+ 	if (fw_snat) {
+ 		fw_snat_ref(session, fw_snat);
+ 		return;
+@@ -502,6 +512,7 @@ static void free_session(struct connman_session *session)
+ 	g_free(session->info);
+ 	g_free(session->info_last);
+ 	g_free(session->gateway);
++	g_free(session->addr);
+ 
+ 	g_free(session);
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.35.bb b/meta/recipes-connectivity/connman/connman_1.35.bb
index 950946fe76..e7e5d38d61 100644
--- a/meta/recipes-connectivity/connman/connman_1.35.bb
+++ b/meta/recipes-connectivity/connman/connman_1.35.bb
@@ -6,6 +6,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://connman \
             file://no-version-scripts.patch \
             file://includes.patch \
+            file://0001-session-Keep-track-of-addr-in-fw_snat-session.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                              "
-- 
2.15.1


