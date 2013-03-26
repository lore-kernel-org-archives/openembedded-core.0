Received: from mail-we0-f177.google.com ([74.125.82.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXO5-00077G-3d
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:19 +0100
Received: by mail-we0-f177.google.com with SMTP id o45so1652893wer.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=3TcpnVljUIlsSwgzo7kVk1BBwRNQYV5370rWOrlUH2Y=;
	b=FL6U6GxhEir6EnZi+f/yHR1PniIlG8dlrSaE8yHP9PBwdeBn3oE3WBObNok3KnbgWj
	kXkewyXBS+Q1gNifPpHwDeLxXZRQy7+vsiPwGm9VyJ1sjmRLH08Qqkshw1SDMqzUBeEq
	umbS+3gMi/Bu9kXa3VsQ5YxYNpqdpmXMDW9F+WP9WTJbEB7rmW7qlRMEizI5rBg7D3DE
	CBsUWWIyfVKGQFl9oGk3ZtC+Qd25b59pVISKLiypMasFyfQ/85cxNT6nua0XrwYOsJj+
	wJg3XtlTyYM/2u6dR0o6qXDs5Xgi1QSd+8lpuW1PiedO9EUbvjBOqBGQxMs2Z8UAOVKJ
	+iHw==
X-Received: by 10.194.86.234 with SMTP id s10mr10380994wjz.34.1364316797490;
	Tue, 26 Mar 2013 09:53:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:09 +0000
Message-Id: <7bed4b92edf4cf514f6d2fc9518bc483dab28107.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmuniOHyLMyca5QV7E6gct2XS6R4Zyx152mIInwbg0rx8xz4KoiT85ehv23MIMbJy/2OSq1
Subject: [PATCH 11/24] update-rcd: drop depends to recommends, check for update-rcd in scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 17:10:23 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass |   15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 06b91c1..0997702 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -6,7 +6,7 @@ UPDATERCD_virtclass-cross = ""
 UPDATERCD_class-native = ""
 UPDATERCD_class-nativesdk = ""
 
-RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
+RRECOMMENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
 
 INITSCRIPT_PARAMS ?= "defaults"
 
@@ -18,7 +18,9 @@ if test "x$D" != "x"; then
 else
 	OPT="-s"
 fi
-update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
+if type update-rc.d >/dev/null; then
+	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
+fi
 }
 
 updatercd_prerm() {
@@ -28,10 +30,13 @@ fi
 }
 
 updatercd_postrm() {
-if [ "$D" != "" ]; then
-	update-rc.d -f -r $D ${INITSCRIPT_NAME} remove
+if test "$D" != ""; then
+	OPT="-f -r $D"
 else
-	update-rc.d ${INITSCRIPT_NAME} remove
+	OPT=""
+fi
+if type update-rc.d >/dev/null; then
+	update-rc.d $OPT ${INITSCRIPT_NAME} remove
 fi
 }
 
-- 
1.7.10.4



