Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ud1x8-0005fa-Nj
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 19:26:57 +0200
Received: by mail-ee0-f54.google.com with SMTP id e50so1912326eek.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 10:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=lf0+aia3+GQre/jQ0DUf+HSW2kEtubWI2ARy6mRgBrQ=;
	b=NSCPxBsEnTI7iWc2Qhx80BPWUdH/EOW7LZ4bX8HQN5G9mMu7yXdbjPULose3KfgOdh
	Iuj12eWnZAST+wJjqrvFAZQTFyp37cYYXADR3LdKubDPlQ19uGRtBG7/slnCT/gyzT4H
	ts93sHcP4ynKkHqU6K+E5wts2jBv9PHeaL53SfZMI0Rx8zNPlRsdjCei99nW2MFLtGD5
	RqsDcK3GxhwZztDjZGXbuygNakzKOc8dhihUjOu2OhYLCI79aqedlwNXSypNmrwWLf/i
	nqKVOk3gG/QAxx+JH0U4F9WxskMPijyNrBT3wSzBp8ZU1IMthakCpMBID1fyCkj12UrL
	jkvw==
X-Received: by 10.14.93.201 with SMTP id l49mr49158518eef.23.1368724120463;
	Thu, 16 May 2013 10:08:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	m48sm11588736eeh.16.2013.05.16.10.08.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 10:08:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 18:05:30 +0100
Message-Id: <1368723930-2955-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlsi3Q7NbQJZu0B0+sN2JndtaUKYo7T0L3RdE/UpkEwfT0X/yOTYgDDHUVBBKG/k6uOmEY5
Subject: [PATCH] gtk+3: disable Xinerama support
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
X-List-Received-Date: Thu, 16 May 2013 17:27:02 -0000

GTK+ has enabled by default support for Xinerama, but it's not a build
dependency so this can be enabled or disabled depending if xinerama has been
built previously.

This can cause problems with sstate, and result in situations where
PKG_CHECK_MODULES() for GTK+ can appear successful but the CFLAGS are not set.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
index e2a7ef7..16e3f1f 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb
@@ -39,6 +39,7 @@ do_configure_prepend() {
 EXTRA_OECONF += " \
                  --disable-gtk2-dependency \
                  --disable-glibtest \
+                 --disable-xinerama \
                  --enable-modules \
                  --disable-cups \
 "
-- 
1.7.10.4



