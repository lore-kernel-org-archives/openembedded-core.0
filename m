Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7CF7D4E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 4so5461977wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DuM+FqIYXWMFjwcUMHbWc2RXR1ybfgow8m97J9ngUPc=;
	b=FJsAIu3KhtdIXN+mQdkeuUPREQaSO5eznqNrx/aUc53eUT8OenuAuphuvH00Q5Ez/z
	NeURPy9chuDTC4WZwSUlNDoCxhrbnM6u2LVxLn0LbLXu2v8cAP7tKFRMJtvpQNgG2AWP
	DWSkKr/ahisXvUBzuxXb48J4BWztWMXkuDFBU98dhbeJrt6QXfr1zf3ZLkqmD+IKT2qy
	K56NTxoJVXv+Bg9QMBTbBDNWTFHeXldIXnFJl/s4mCrC207OTjaY1Xn/w0YTaoB45GIb
	mmIwFs0KimVuJju/RGCMITBrTQVK0Ws66vvHrqnIH91H9oTdxMSXw251EfYQ/SYZLwIe
	fHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DuM+FqIYXWMFjwcUMHbWc2RXR1ybfgow8m97J9ngUPc=;
	b=c8KT6QELiuaSZx8Wujb/5OrMKatVsEzpaln41qRVnFByv7+4VZLCCB3xgHdnPAiL7p
	S1GPkoOKP4+bjeKjKDG+S+6n5OLVHPLWfTjokymzl21HVHKwtuhVaCdrjlofXlgFf2GM
	HdshcGGoiph5LYc+ok7X6BngHKPNIBt9P52Kw+d386TZMUx5dfnucEkXQyhM5Bf9lgkj
	SIgrnvN1wpIYTqqvrBkDCcszDB/2QxgrSdB3JK9CKu2tDm3vArFscbxAX0/23bTtwDkx
	SZpoBqqHwJXApzmF/taAfXwvDX7cnqs7hf6SS54XruxzBbiERaYt36U3329eN65IX6u6
	/Gew==
X-Gm-Message-State: APjAAAVzyayBJ+tdjxUQHpXqhHAaMEPxWnK8MbTioyjIGQ7DrrEMIa1N
	jOKXiClsJm/kAIPjBKTDpxHSTQWq
X-Google-Smtp-Source: APXvYqwDDARtoIZuX/D63EPQsioxjfmuCUY1/0dUMva1d7y6+gwEOc3S8JbbA2vwWUwK3WzOQ2S9xQ==
X-Received: by 2002:a1c:4844:: with SMTP id v65mr6608439wma.139.1554446271754; 
	Thu, 04 Apr 2019 23:37:51 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:28 +0200
Message-Id: <20190405063736.29750-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] json-glib: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.4.4.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index 95f90569de..31c008db47 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -23,13 +23,8 @@ PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
 GTKDOC_ENABLE_FLAG = "-Ddocs=true"
 GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 
-GI_ENABLE_FLAG = "-Dintrospection=true"
-GI_DISABLE_FLAG = "-Dintrospection=false"
-
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                    '${GI_DISABLE_FLAG}', d)} "
 
 do_install_append() {
 	if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
-- 
2.20.1


