Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90EC47F8AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 11:54:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q13so21020887wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 03:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1wRFMv4xG7FOmQupvAj+PXouEc7+gmGSZDKDf5v8ULg=;
	b=gtjVsz/EX8hySyIVQcmAQ59NQasVyKUJkRN3XhK5SrdKhpftL4/IJWNdh71zvfoj/M
	aEnvt4yNUQpxogA7NMh30XHCE0KIjR58IkOdr/EnFHClmXaHVjgM8A60Y6GzMfxFpxTo
	aMByuwGiAtn6nay43WnpxwWpSEuuGDxPiCAKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1wRFMv4xG7FOmQupvAj+PXouEc7+gmGSZDKDf5v8ULg=;
	b=qZ7TflFx9n5uv1OyKOPaCqILu8MAodQZ3h4GOb+PZuq+WSo+gtpz4Ft+M9n8G6Y4Kn
	wWZmlm+GzrewoNJIPP9BvwtV/sRN2uQd+61LEyzrPwadV6N9H0N0ynhN4m7sOPO0xwpe
	kSdRRu7N88a941Bt7iVBdvzUydj+Y6ThkbuFPOy7AimDEuWQO10II7keyFxP09hyDfFm
	ml4wLZK7zx750s9z0OPJRZ9rKwnxK0v0B8nP3dHjzDGsq4icHIPaO8l6bAHpAFEhrbYZ
	1c2BJAv/jH7R/7ksFM+qC/xEMmEKttejiQQJ9UIsuZdPDPolvpLq3JQT3RUMNDlon21z
	5bgA==
X-Gm-Message-State: APjAAAWJMTXLUFYGPBSC1OSQ1GdMvuGEvbzqUil3bPuyAXoyMyNSE7xW
	vTC+VdPturGrnEYrYeSOcT/59SMXU+s=
X-Google-Smtp-Source: APXvYqzmSfzkiaeiB5pYSzAk4Pi5I5tGeeKwaEknwYDdT6zvsPWKOrZ5v6ZoD3Ngcr7PBrvBYum/iA==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr7679837wrk.340.1572954899766; 
	Tue, 05 Nov 2019 03:54:59 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w22sm19220635wmc.16.2019.11.05.03.54.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 03:54:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 11:54:58 +0000
Message-Id: <20191105115458.12060-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] staging: Handle files moving between dependencies
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
X-List-Received-Date: Tue, 05 Nov 2019 11:54:59 -0000
Content-Transfer-Encoding: 8bit

Currently, if files move between recipes, do_prepare_sysroot can fail with a message like

Exception: FileExistsError: [Errno 17] File exists:
'TMPDIR/sysroots-components/core2-64/libx11/usr/include/X11/extensions/XKBgeom.h' ->
'TMPDIR/work/core2-64-poky-linux/gtk+3/3.24.8-r0/recipe-sysroot/usr/include/X11/extensions/XKBgeom.h'

This is because files are removed and then added per package. What needs to
happen is all removes need to be processed, then all additions.

This patch changes the code to process in two phases, removals first, then additions,
which avoids the problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 55a9b52ed22..cca0b7e0d68 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -449,6 +449,7 @@ python extend_recipe_sysroot() {
     msg_exists = []
     msg_adding = []
 
+    # Handle all removals first since files may move between recipes
     for dep in configuredeps:
         c = setscenedeps[dep][0]
         if c not in installed:
@@ -459,7 +460,6 @@ python extend_recipe_sysroot() {
         if os.path.exists(depdir + "/" + c):
             lnk = os.readlink(depdir + "/" + c)
             if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
-                msg_exists.append(c)
                 continue
             else:
                 bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
@@ -470,6 +470,20 @@ python extend_recipe_sysroot() {
         elif os.path.lexists(depdir + "/" + c):
             os.unlink(depdir + "/" + c)
 
+    # Now handle installs
+    for dep in configuredeps:
+        c = setscenedeps[dep][0]
+        if c not in installed:
+            continue
+        taskhash = setscenedeps[dep][5]
+        taskmanifest = depdir + "/" + c + "." + taskhash
+
+        if os.path.exists(depdir + "/" + c):
+            lnk = os.readlink(depdir + "/" + c)
+            if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
+                msg_exists.append(c)
+                continue
+
         msg_adding.append(c)
 
         os.symlink(c + "." + taskhash, depdir + "/" + c)
-- 
2.20.1


