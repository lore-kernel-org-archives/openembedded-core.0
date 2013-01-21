Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGYn-0005pN-4I
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:33:36 +0100
Received: from mail-bk0-f71.google.com ([209.85.214.71])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:17:39 -0800
Received: by mail-bk0-f71.google.com with SMTP id jm19so6571823bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=OVqRRb3pBFZ5Bn9oyLugx0sZdkNrsdhUdzWCBuegVrs=;
	b=NjV1YGMFmXgOujyMTQof+62jEfXPLsEH0J1siPaZZvzk24FLlPT9KaznwwYjdgr3Qo
	NTAycByif/kTubABfN+FhkiS1EuGiKuGcVk1KW9oAbVcZFzSw6qXTL+LC0Ri3VeUuWgq
	adZvlZSL3zwI60l/3q7tQvYOeJeRp7WQrNB97CM9sAz7otljHHxYfojho27gjiIN1RT9
	v84KyHBprh0UOBbLb2eE/aMXHLRaQWPVCKxLhtSQozCcfC5VbMW30GoK3LDigu2oIrUI
	HbNjA34OhVFN4N/wByCN8p78MKp/TQgujHO5PF3N5+loa945pR7ES5YrTUAk3HPjJQM/
	p01g==
X-Received: by 10.180.108.236 with SMTP id hn12mr15079215wib.6.1358770654561; 
	Mon, 21 Jan 2013 04:17:34 -0800 (PST)
X-Received: by 10.180.108.236 with SMTP id hn12mr15079122wib.6.1358770653603; 
	Mon, 21 Jan 2013 04:17:33 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s10sm18415972wiw.4.2013.01.21.04.17.32
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:17:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:15:30 +0000
Message-Id: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358770449.git.ross.burton@intel.com>
References: <cover.1358770449.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkyYE9Nz0bn3DzwL0mXWHe1o85qSpDhKM6vbSze11SV7BS515JPwzsGt5VoZpVl2KV+k2fI82T+KX+HkxD56TQdyWAGRhA5Rpf5Pxmd7/1IhStfVPFiPniqbbe7SFRCUjF7jnhVpN0NZcYu56lZsqk4yoCkdn2liFCHqjGsESqSBTNncjUTtZbBJSL08k9AOnKpQr7q
Subject: [PATCH 1/5] systemd: skip in non-systemd distros to fix world builds
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
X-List-Received-Date: Mon, 21 Jan 2013 12:33:39 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_196.bb |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index 1861437..85bb4f9 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -247,3 +247,11 @@ update-alternatives --remove reboot ${base_bindir}/systemctl
 update-alternatives --remove shutdown ${base_bindir}/systemctl
 update-alternatives --remove poweroff ${base_bindir}/systemctl
 }
+
+
+# As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
+# building udev and systemd in world builds.
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
+}
-- 
1.7.10.4



