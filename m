Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id D0D4960CC9
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:10 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id dw13so3084838pjb.4
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hn3+w7hT6FHOYWEruIcNtXJykAsCvIqL7Vph5+GPufI=;
	b=SLNqs81qDT6pq3TWkQHPezvXzv9zKbP6ghDjdRnFchvxnvo2BoHWAgoJS2Qdcn8YHk
	x1HlLZcscIlrkMY76NFKtL1qkMC7w6vrJaq3jFvUSKZggE2YtTeFOn1Oi89N5PJ5dJw/
	PKaXE+WK2gZs96gcXJNW5EtTni10rnUYVkfyCjF6q45dck7q6gjB+0jVEfJFFZByTaXR
	W3YHG9Op68xWI9kpYeZHfgAbMSCM/QgJ1YX8cCkaoe210fzRbLIdODl4WnGrEfOD1Pdz
	L0AVi/lh/jxf5AMin9asalho0M63LOMPtkbGyj1SJ2Newmv7uadljEhPDkkKM543PPWE
	tMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hn3+w7hT6FHOYWEruIcNtXJykAsCvIqL7Vph5+GPufI=;
	b=d+bcFvcu4zLGjuoq9OhYooM3Xd6tdJfJ2aoPcIli4tmP9ZnCBNTemxLgu35Ol7paiB
	ss6M0f38VtBxHzWBoZtUvWb4myCL4XkT/jFbN9vXbZHcMRMbe4H3PjdbAUcLVdSo3Uli
	bnK0eJOopGwcStNgYG0PuDZH1XR5vT19AGGj6vOajCsa9/TcSnTtYBiL3FrNe/1VzLdV
	oVk51sog9EUvDO2mAbYfXOV393KVLtOoqsDfo3EtkubM3hV6MROzveG9zZUFNYmSd1uo
	lrj7wX4jnidraLn0cqdxkNMrjvI75lZs+bXarQ6AZ3sUO5J2zbi1bkOsig/h/pD+pw7v
	An7g==
X-Gm-Message-State: APjAAAXHLDSJxlRNg090sc/dv7JDqLOrzI4h3fsSH6vR+VR5d6Xh3b4I
	KRpmtTvPNrFWHgTELpZB6hIn8BaV
X-Google-Smtp-Source: APXvYqw5q33D+AmRNyid9nr5dlnnqggbpH+6b6Vo0o/HMuz3DJHQKdMaEGt+R4D6WHBrmJYFXtCKVg==
X-Received: by 2002:a17:902:7004:: with SMTP id
	y4mr8778414plk.263.1581264611773; 
	Sun, 09 Feb 2020 08:10:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.11
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:38 -0800
Message-Id: <9e8ee3be00fde21585dd0f593782a89f55ebad7b.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 10/29] classes/reproducible_build: Read SDE file later
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:10 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Defers the resolution of the SOURCE_DATE_EPOCH until the variable needs
to be actually realized with a value. The previous method of loading the
value in anonymous python had issues because it could occur before other
anonymous python functions that affect the location of the epoch file,
such as when a recipe uses AUTOINC/AUTOREV or allarch.bbclass.

Also adds more logging to help diagnose issues in the future.

[YOCTO #13763]

(From OE-Core rev: b3313a10a3eb93f0a3710a35de0404fb49cd6202)

(From OE-Core rev: 10515e5f7e38edbc4430e2599062a9ce6fdb42a8)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 40 +++++++++++++++++++------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 39b6e40cac..750eb950f2 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -44,10 +44,12 @@ SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 SSTATETASKS += "do_deploy_source_date_epoch"
 
 do_deploy_source_date_epoch () {
-    echo "Deploying SDE to ${SDE_DIR}."
     mkdir -p ${SDE_DEPLOYDIR}
     if [ -e ${SDE_FILE} ]; then
+        echo "Deploying SDE from ${SDE_FILE} -> ${SDE_DEPLOYDIR}."
         cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
+    else
+        echo "${SDE_FILE} not found!"
     fi
 }
 
@@ -56,7 +58,11 @@ python do_deploy_source_date_epoch_setscene () {
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
     if os.path.exists(sde_file):
-        os.rename(sde_file, d.getVar('SDE_FILE'))
+        target = d.getVar('SDE_FILE')
+        bb.debug(1, "Moving setscene SDE file %s -> %s" % (sde_file, target))
+        os.rename(sde_file, target)
+    else:
+        bb.debug(1, "%s not found!" % sde_file)
 }
 
 do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
@@ -164,16 +170,32 @@ python do_create_source_date_epoch_stamp() {
         f.write(str(source_date_epoch))
 }
 
+def get_source_date_epoch_value(d):
+    cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
+    if cached:
+        return cached
+
+    epochfile = d.getVar('SDE_FILE')
+    source_date_epoch = 0
+    if os.path.isfile(epochfile):
+        with open(epochfile, 'r') as f:
+            s = f.read()
+            try:
+                source_date_epoch = int(s)
+            except ValueError:
+                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to 0" % s)
+                source_date_epoch = 0
+        bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
+    else:
+        bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
+
+    d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
+    return str(source_date_epoch)
+
+export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
         d.appendVarFlag("do_unpack", "postfuncs", " do_create_source_date_epoch_stamp")
-        epochfile = d.getVar('SDE_FILE')
-        source_date_epoch = "0"
-        if os.path.isfile(epochfile):
-            with open(epochfile, 'r') as f:
-                source_date_epoch = f.read()
-            bb.debug(1, "SOURCE_DATE_EPOCH: %s" % source_date_epoch)
-        d.setVar('SOURCE_DATE_EPOCH', source_date_epoch)
 }
-- 
2.17.1


