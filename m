Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4ACC78D68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 22:25:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h15-v6so14486951wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 15:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RE4i4dTyOLMAg4OGnLCzKs6FGnHDt+5pcHNPfP26GSQ=;
	b=b6m0sUNMwTC9MqHg9EOt7toH+iexf/ZipqBIq0nskPKoNmtufY2kKQuZoFoFGha51b
	Yai6x+VRiTfGBE6v9Ft06jSCDGw4ASxJU7ZhUAMMjG+QHRg2vPcRcbGn5BY+aNRy9R6k
	MRGl6zenK6C6+cdPpOI2pFemuMMvnfSDLEm6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RE4i4dTyOLMAg4OGnLCzKs6FGnHDt+5pcHNPfP26GSQ=;
	b=DQa3GhGouFtfedEUTc3xyouqYQ0bIItZJQaXzEa8jGeYDYM0n/ZRH72vNoHKeaQweJ
	t8FoMGurWHUAwbeojMMBezQC8rDLw0G2GouzXDHPV7xkQMaKEeLbzfISaEZ9FvF7gNL7
	msRrjHfkU12yUVkDzKuNYKrRkK7JYApBLPvqhhCql7LiZZga2hsBnWb+xByqsxSIkUas
	VUL99O9I62NeE057mQ/dPOuKE7wtupJ60K/VZrDAlBIXGZpANxKwz+zXF4B9FhNH4lw5
	d9e3080OrcFtdlZhFDa6xgtloQdqVZF2vb2dpDfmIJ45Ud9hPvJmBBnT4wfYT0iF8Ma6
	GOag==
X-Gm-Message-State: AOUpUlGVXy/kz5non4QR6aQUtfHt2jCx6HQrKNiSWrW6HhLf29YYAJro
	LWF1vmuXWE2F2Mq4SVi7+0r3kjJLIEENPQ==
X-Google-Smtp-Source: AAOMgpcNvXekxsQH7QW2WteE3nJVXuthx2WTr/hOLhVerfJXPK/OoK58fayV+Jc78nEwQd13e6U5Xg==
X-Received: by 2002:adf:df07:: with SMTP id
	y7-v6mr18071187wrl.117.1532989533959; 
	Mon, 30 Jul 2018 15:25:33 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z7-v6sm11258415wrh.85.2018.07.30.15.25.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 15:25:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 23:25:29 +0100
Message-Id: <20180730222529.17655-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730222529.17655-1-richard.purdie@linuxfoundation.org>
References: <20180730222529.17655-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] libtool: Fix problem with libtoolize in multilib installations
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
X-List-Received-Date: Mon, 30 Jul 2018 22:25:34 -0000

Without this patch /usr/bin/libtoolize is different for each multilib
since their host-triplets are different, despite there being no difference in
the functionality of libtoolize itself.

This change just patches out the problematic line since its just a comment for the user
in help text. Ugly but solves the problem. This fixes issues where libtool and
libXX-libtool couldn't be installed into the same system.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtool/libtool/multilib.patch            | 23 +++++++++++++++++++
 .../recipes-devtools/libtool/libtool_2.4.6.bb |  2 ++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/multilib.patch

diff --git a/meta/recipes-devtools/libtool/libtool/multilib.patch b/meta/recipes-devtools/libtool/libtool/multilib.patch
new file mode 100644
index 00000000000..c4794113efe
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/multilib.patch
@@ -0,0 +1,23 @@
+Without this patch /usr/bin/libtoolize is different for each multilib
+since their host-triplets are different, despite there being no difference in
+the functionality of libtoolize itself.
+
+Ugly, but just patch this out. This fixes issues where libtool and
+libXX-libtool couldn't be installed into the same system.
+
+Upstream-Status: Inapproriate
+RP 2018/7/30
+
+Index: libtool-2.4.6/libtoolize.in
+===================================================================
+--- libtool-2.4.6.orig/libtoolize.in
++++ libtool-2.4.6/libtoolize.in
+@@ -113,7 +113,7 @@ You must 'cd' to the top directory of yo
+ When reporting a bug, please describe a test case to reproduce it and
+ include the following information:
+ 
+-       host-triplet:   @host_triplet@
++       host-triplet    <redacted>
+        version:        $progname (GNU @PACKAGE@) @VERSION@
+        automake:       `($AUTOMAKE --version) 2>/dev/null |$SED 1q`
+        autoconf:       `($AUTOCONF --version) 2>/dev/null |$SED 1q`
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index b8a52408853..f5fdd00e5ee 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -1,5 +1,7 @@
 require libtool-${PV}.inc
 
+SRC_URI += "file://multilib.patch"
+
 RDEPENDS_${PN} += "bash"
 
 #
-- 
2.17.1


