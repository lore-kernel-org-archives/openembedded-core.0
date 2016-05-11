Return-Path: <k4230r6@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0E9362135
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:18:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r12so11413071wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VTPq//GWPI8ShM5xmtRiXv1lvGCu/+gvA8iANL52/gI=;
	b=v8fSBCBqCxQWgB115cdWUB9/Z0NtMXXcWWK0TRqlkN3qZzZgIm0nDK/D9hq5YqKZXd
	QwhDIDPsWQATV3mhlzKgJ0vyv4TNZNaYWbRrjFo6culaV5eOh63lFMYuESCzoNrt9ZIV
	rG6OUo3kYcCxk1X87o51Y8eGnnKNDU97N50rGltpQJNVGWYQhxi/99n57a5BX1RJD2OY
	ZZPKA0HOqAKeUv7mk9dmTetlgk6UiU7rO3/QxposKExTd6s/XAQ3Qz1yOPh++EGaIjE3
	xBEcC1TuYtVramFJzW+nFuF0LtMVQwIqa7A/UHJtdm1NVW6BC3p4/z4+jqIAF2128XiE
	95Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VTPq//GWPI8ShM5xmtRiXv1lvGCu/+gvA8iANL52/gI=;
	b=Cfzocyv3M6eNtNDfKBF1BNn6ahNJoX+wmr0EUCYxTEvtIJVeeP6o2QeRS6hH+LK7QM
	AzXXMxJCzhCqryjYZKaksUMOsHAuY513KVoRUBeSnQKM7w+lRImfV32UC7R8yf0o+Ftr
	S+0r0otlwLfO0KXpTKWqUIJF4g1SwEC1nF3Cw5nC0zPt/jRlXQPJ6I8zpLMylwMfpFUO
	0N7U9UVnZfvuJ0L1bvkMx0draqsQ9hTREMF5/0XVyrVLf67IWpj4eJqt2Tl60lt348G0
	B5FzC6zuETt2vxe8iqOQB2JN8eBVCv76dVH2mB128yqPMIQEvInuq7oCzDm+02++rq3G
	nK7w==
X-Gm-Message-State: AOPr4FWo9/1VsKq6qeXlbxvqsEFmk7XqN6bRqyui9M7fHxrSC2+WuY14qylySZwSSVAqSg==
X-Received: by 10.194.116.9 with SMTP id js9mr6306855wjb.112.1462994336172;
	Wed, 11 May 2016 12:18:56 -0700 (PDT)
Received: from quadros.fritz.box
	(HSI-KBW-078-043-133-099.hsi4.kabel-badenwuerttemberg.de.
	[78.43.133.99]) by smtp.gmail.com with ESMTPSA id
	w9sm35639092wme.19.2016.05.11.12.18.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 12:18:55 -0700 (PDT)
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 21:18:48 +0200
Message-Id: <1462994328-28828-1-git-send-email-k4230r6@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bluez5: fixed path to bluetoothd in sysvinit script
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
X-List-Received-Date: Wed, 11 May 2016 19:18:56 -0000

Within the sysvinit script the path to bluetoothd is wrong. Because of this
the init scripts silently terminates without any message

Signed-off-by: Christian Ege <k4230r6@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc  | 4 ++++
 meta/recipes-connectivity/bluez5/bluez5/init | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 9063629..b3cd8ed 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -61,6 +61,10 @@ do_install_append() {
 	    install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/
 	fi
 
+  if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
+    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
+  fi
+
 	# Install desired tools that upstream leaves in build area
         for f in ${NOINST_TOOLS} ; do
 	    install -m 755 ${B}/$f ${D}/${bindir}
diff --git a/meta/recipes-connectivity/bluez5/bluez5/init b/meta/recipes-connectivity/bluez5/bluez5/init
index 1606a5c..489e9b9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/init
+++ b/meta/recipes-connectivity/bluez5/bluez5/init
@@ -3,7 +3,7 @@
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 DESC=bluetooth
 
-DAEMON=/usr/lib/bluez5/bluetooth/bluetoothd
+DAEMON=@LIBEXECDIR@/bluetooth/bluetoothd
 
 # If you want to be ignore error of "org.freedesktop.hostname1",
 # please enable NOPLUGIN_OPTION.
-- 
2.1.4


