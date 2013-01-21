Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxF9Y-0001j3-QQ
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 12:03:07 +0100
Received: from mail-bk0-f72.google.com ([209.85.214.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 02:47:30 -0800
Received: by mail-bk0-f72.google.com with SMTP id jf3so6464627bkc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 02:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=OVqRRb3pBFZ5Bn9oyLugx0sZdkNrsdhUdzWCBuegVrs=;
	b=OecTM0gNcrRj8O2+3ClHUBlQl7/JQyw0ayTVHW1uj9lb6t88p1eF5lVbe31T0J7xxZ
	bdkDE1o0E52CKEH9Q1N+oSQOEZKIcOP90JHuea0s4I1jKopk5ZLA0HraoR39+QjFw1zu
	gcuF9MZeAMA8mJr3TiaDIaa1/VqWdWsB18K/SVAmX6quKNZYa3zY14+L51ptHEFPQSzC
	gu4/obCnwu3YUCu/yz+Moohm162x3VOOFw6ECuzTI4EUmZHCeUHU6xwDdSWbfg/SHhR+
	xD2H6BmkRRr1o/Hs0enQmitZKBe0KBQThlNd2h/3eQXCv1pZGyxvDxeWbg8IW087tWyx
	iiRw==
X-Received: by 10.180.77.35 with SMTP id p3mr14540661wiw.18.1358765249117;
	Mon, 21 Jan 2013 02:47:29 -0800 (PST)
X-Received: by 10.180.77.35 with SMTP id p3mr14540640wiw.18.1358765248914;
	Mon, 21 Jan 2013 02:47:28 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bz12sm18058001wib.5.2013.01.21.02.47.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 02:47:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 10:45:32 +0000
Message-Id: <1358765132-16394-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmqS8FXf5U0VARHQdDQSxTg/a2haSVJOmCmBY8+f2tIlBeh8clfxgxwwCjDg5NGQpSKfkZHEo2EI5Ie6XI2hExeiY3MHHMeDlS98jMR7+hvpeB2UK4EavJwJSmi/uQCmvPeXHJWl3rMfS6pDClzGIKmHmOJbIG3TdT67gE8XXr4qWrpMJwqjz1wDiY4ObveAjDd3ZHX
Subject: [PATCH] systemd: skip in non-systemd distros to fix world builds
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
X-List-Received-Date: Mon, 21 Jan 2013 11:03:10 -0000

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



