Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8750C71BB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h15so1673904edb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8x29IpA7DtHmMldHmSD/5RHFfq5O7Dzv6GOgM6+sQic=;
	b=sEo31Ir2Ur4cq33vfgO4hyvIZhhmcnHH7J7g7CAsX0oD9PsZLGkGD2XH0tH+37VIog
	dG4jj3paabwKmhBqFdut+64epnCLQai2dJl181P7E+m5gSCnYYL48bfpIlr3tmokRhYt
	OJxz2TfDpBdNQHuwt4+T4Osy5VsGwPLfaiuWoqa6ATN1zDvMKVgk4Kibt6W3TeCahATw
	FIdnukFuh2Fq/Qo1kwtoexYbC3yhVHeKbgDlIkOvPyznNazmyVGjzrW1Qaxo3Psdv5Jt
	lpemXIRW6c38g/Y0EjCYtx4eU5vPO2NJjBDVM0ou4O8MDxorT1HSegGGB0tQvBNr9gUq
	QK2g==
X-Gm-Message-State: AHQUAuZ3kGCGanIBSKZSlncymihb3RHXbuR4pley/mMgAplVN7LEdHPZ
	EiKsy3Fou1Sd7AQ5I+x8Pb7HIo9F
X-Google-Smtp-Source: AHgI3IZPnhsZWUneH6TT2bWPUvU0JUvlYbKZTC2vaDf7roKCZvwJl1oz9PxZ7hMKqr/wmq/r7hBJAg==
X-Received: by 2002:a50:cf41:: with SMTP id d1mr1931882edk.242.1549333965837; 
	Mon, 04 Feb 2019 18:32:45 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:45 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:29 +0000
Message-Id: <20190205023241.29707-2-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 01/13] update-alternatives: correctly escape PATHs when updating FILES_${PN}
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The recently added support for updating FILES based on the file renames
that are happening here is using a regex replace, but failed to
properly escape the search pattern (the full path). This manifests itself
in FILES not being updated as soon as the full path contains any
character that has a special meaning, e.g. '+'.

In other words an original path (alt_target in the code) like
    /opt/poky/2.6+snapshot/sysroots/i686-pokysdk-linux/sbin/losetup
can't be matched, and hence we fail to update FILES with the new value,
causing packaging errors.

Fix by using re.escape() on the original path before passing into re.sub()

Fixes: 5c23fe378732 ("update-alternatives: try to update FILES_${PN} when
renaming a file"), or bcb3e7b7f88a in poky.git

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/update-alternatives.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index e252651128..537e85d9a3 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -138,12 +138,12 @@ python apply_update_alternative_renames () {
     if not update_alternatives_enabled(d):
        return
 
-    from re import sub
+    import re
 
     def update_files(alt_target, alt_target_rename, pkg, d):
         f = d.getVar('FILES_' + pkg)
         if f:
-            f = sub(r'(^|\s)%s(\s|$)' % alt_target, r'\1%s\2' % alt_target_rename, f)
+            f = re.sub(r'(^|\s)%s(\s|$)' % re.escape (alt_target), r'\1%s\2' % alt_target_rename, f)
             d.setVar('FILES_' + pkg, f)
 
     # Check for deprecated usage...
-- 
2.20.1


