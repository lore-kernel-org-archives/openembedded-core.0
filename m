Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B327B60E23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:20:19 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id z12so7618656wgg.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=86z13r00rUkKxmvJMI3FdyyAkeULkB+ZHh64vOZ4VGs=;
	b=FrbKc0JelQ8uo/ktN33aSfXvmvPesb4gGPxnNLH7YR709VszBZ3betdoAYbFWN3yG0
	KiH58xDgaS67pnpVz/oZYK9N+HxPy6SiQgcZIv2xJgRZYSO9zPL/cVAjvLqOSFXosWzY
	SqX5o/dEE9MojmvMnNiodoIJU4VECmFSj93kNYfZwa4ok4VakZ/N4k1FbsMEZ9LRIkss
	fFWsyaXoOoPqC0DfNPHJyP4HuAHfsIxCiiNFSNjqXENHW3JQwaVaeXCkPLE+xTlybECT
	9zXANWJ+bJpagx5PTpnkUN69A0wlzmPoFt2Drca+5UQo8juB3UdjWSme0fMXDbaJLyj1
	dzsg==
X-Gm-Message-State: ALoCoQmE8dU/ZwUvaTOy2O+Y2CBMynA2dlnRxIlUQRvRXN7f3OXeIuMEduEY4chcIfYzpyEcCpiC
X-Received: by 10.194.9.100 with SMTP id y4mr25255171wja.22.1387383620395;
	Wed, 18 Dec 2013 08:20:20 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm2179947wij.7.2013.12.18.08.20.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 08:20:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 16:20:06 +0000
Message-Id: <1387383607-4005-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
References: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/6] systemd: pass --root in prerm if running on host
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
X-List-Received-Date: Wed, 18 Dec 2013 16:20:20 -0000

If a systemd image is built without a package manager then packages will be
removed from an image during rootfs generation, but without passing --root the
systemctl will look on the *host* system.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index efc1adc..2bd63a4 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -38,12 +38,18 @@ fi
 }
 
 systemd_prerm() {
+OPTS=""
+
+if [ -n "$D" ]; then
+    OPTS="--root=$D"
+fi
+
 if type systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		systemctl stop ${SYSTEMD_SERVICE}
 	fi
 
-	systemctl disable ${SYSTEMD_SERVICE}
+	systemctl $OPTS disable ${SYSTEMD_SERVICE}
 fi
 }
 
-- 
1.7.10.4


