Return-Path: <bkylerussell@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id EE8CE60745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 14:17:33 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id fn2so830462pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VmRhJ0SxsJ0+v87bGfAyw1BkBOP9lxodCScvV9ye0hc=;
	b=e0JR3cqkoSBe1pMaaF5KANzWBFawlvGB9YeYW1dR/pk8PpKn4+zbynEqL5d9iODode
	TPWUiIkH11MoeJKbrfkBCbo3FviIHMYeERKN05Tj5nIEKvPX7mwcbbwvT6L2biVHqK/v
	EIIgZZrcJ5GprUBIRr8/2uT0UUQsEBLcM7xd4nC6fVHtPDRf1aK9x+7kGPIMfE+Ygffc
	+9EVr02AGkZmH0i4pzeFxyedK5gvb9S6cSQZDLTZY8AK/S3UxezuDHjMCJy6cogNKp+N
	Wu2aiOyI80sgJCmVa7IYj6dwR+6neKwA78vvPix4HAREBcqRPCYw89wv7ZdjZM42D4uV
	Tnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VmRhJ0SxsJ0+v87bGfAyw1BkBOP9lxodCScvV9ye0hc=;
	b=WkZkctPQ7d5W3Dk9ttK1QeHSsQ2XrCKu0ITS47h7bSxZrlGx+NPjF4OvM+4Vd3qU95
	ZnA1ENh/UULagxGakrg77OD5lrAd0u4qeCtd6XSINi+yrBVS2ZOddYSK1P0CPxg5RQIP
	7wQYwS33+LuIFE0gCEZh66KLn57D0UZvfAD40WHLnkAPRTrDdxHbJGQo/kXs7kIoxmkr
	hXol9hr/pD0fZU+WbuqBAbeFGo/KTbjko7ddLSGPFI5IH46A1NHXquvKq0rTV4iuHqaS
	F11wnONe8f1g4C5YYQrzA9g0VxPtyG3XNcjP+mer1/y1aRDWn2g3X4o6E3iYxFamZ7ul
	Gcxw==
X-Gm-Message-State: AA6/9RmMfYYFX5sAOZvYmGBhrui7uhrluovUtIfyOx3fsTpsqdx7gp7cfazxwLAqIC0uPw==
X-Received: by 10.66.63.40 with SMTP id d8mr7374662pas.103.1476195454963;
	Tue, 11 Oct 2016 07:17:34 -0700 (PDT)
Received: from brrussell-Latitude-E6530.dhcp.lexmark.com ([192.146.101.8])
	by smtp.gmail.com with ESMTPSA id
	c15sm4771940pfd.53.2016.10.11.07.17.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 07:17:34 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 10:17:16 -0400
Message-Id: <1476195437-24040-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] pixbufcache: Ensure sysroot dependencies are satisfied
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
X-List-Received-Date: Tue, 11 Oct 2016 14:17:34 -0000

Reverts part of b411085fefc8582d24c172db5f6610705eb44c2f

Makes sure gdk-pixbuf-native populates the sysroot during setscene;
otherwise, gdk-pixbuf-query-loaders may not actually be available at the
time the completion function runs, causing a build failure.

Similarly, packages providing loader libraries should append to
PIXBUFCACHE_SYSROOT_DEPS with their runtime dependencies.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/classes/pixbufcache.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index dbe11e1..3c1e398 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -65,3 +65,17 @@ pixbufcache_sstate_postinst() {
 	fi
 }
 
+# Add all of the dependencies of gdk-pixbuf as dependencies of
+# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can work
+# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only add
+# gdk-pixbuf-native if we're not building gdk-pixbuf itself.
+#
+# Packages that use this class should extend this variable with their runtime
+# dependencies.
+PIXBUFCACHE_SYSROOT_DEPS = ""
+PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
+    ${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} \
+"
+
+do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
+do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS', True).replace('_setscene','')}"
-- 
2.7.4


