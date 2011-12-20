Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rd3kk-0002am-JR
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 18:45:26 +0100
Received: by yhoo47 with SMTP id o47so4543776yho.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 09:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=eFkYLh6cqvSfdKyRlBzlhWLokPyexeNGiGKCQ0GtnO4=;
	b=MiYCy34RMfRyMbQdd42l4URwk8U3lE66HdKvGw2Fs2lRWFRoQDrZBJTohiqFzaWiSd
	fPNVykvmXaO77fVj1El5M5bVxD5jVolqWqzb9mbBhiJuW0Hdb4dj22ZndzMr7LnjBMeF
	O4B1CuQ5g2rGk1Yy9AE3MC/m/NQOPnmN1E3pM=
Received: by 10.236.155.36 with SMTP id i24mr5418474yhk.43.1324402701477;
	Tue, 20 Dec 2011 09:38:21 -0800 (PST)
Received: from [192.168.1.112] (ip24-251-167-38.ph.ph.cox.net. [24.251.167.38])
	by mx.google.com with ESMTPS id a15sm6971086ana.1.2011.12.20.09.38.19
	(version=SSLv3 cipher=OTHER); Tue, 20 Dec 2011 09:38:20 -0800 (PST)
Message-ID: <4EF0C808.8060609@gmail.com>
Date: Tue, 20 Dec 2011 10:38:16 -0700
From: Christopher Larson <kergoth@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patch.bbclass: abstract out logic that determines patches to apply
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2011 17:45:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This is needed by the copyleft_compliance class, so it can emit series files
for the patches, which greatly increases their usefulness to a user 
trying to
reconstruct the sources outside of OE.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
  meta/classes/patch.bbclass |  196 
+++++++++++++++++++++++--------------------
  1 files changed, 105 insertions(+), 91 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index ac6c1ce..454d9ce 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -7,13 +7,106 @@ PATCHDEPENDENCY = 
"${PATCHTOOL}-native:do_populate_sysroot"
   inherit terminal
  -python patch_do_patch() {
-	import oe.patch
+def src_patches(d):
+	workdir = d.getVar('WORKDIR', True)
+	fetch = bb.fetch2.Fetch([], d)
+	patches = []
+	for url in fetch.urls:
+		local = patch_path(url, fetch, workdir)
+		if not local:
+			continue
+
+		urldata = fetch.ud[url]
+		parm = urldata.parm
+		patchname = parm.get('pname') or os.path.basename(local)
+
+		apply, reason = should_apply(parm)
+		if not apply:
+			if reason:
+				bb.note("Patch %s %s" % (patchname, reason))
+			continue
  -	src_uri = (d.getVar('SRC_URI', 1) or '').split()
-	if not src_uri:
+		patchparm = {'patchname': patchname}
+		if "striplevel" in parm:
+			striplevel = parm["striplevel"]
+		elif "pnum" in parm:
+			striplevel = parm["pnum"]
+		else:
+			striplevel = '1'
+		patchparm['striplevel'] = striplevel
+
+		patchdir = parm.get('patchdir')
+		if patchdir:
+			patchparm['patchdir'] = patchdir
+
+		localurl = bb.encodeurl(('file', '', local, '', '', patchparm))
+		patches.append(localurl)
+
+	return patches
+
+def patch_path(url, fetch, workdir):
+	"""Return the local path of a patch, or None if this isn't a patch"""
+
+	local = fetch.localpath(url)
+	base, ext = os.path.splitext(os.path.basename(local))
+	if ext in ('.gz', '.bz2', '.Z'):
+		local = os.path.join(workdir, base)
+		ext = os.path.splitext(base)[1]
+
+	urldata = fetch.ud[url]
+	if "apply" in urldata.parm:
+		apply = oe.types.boolean(urldata.parm["apply"])
+		if not apply:
+			return
+	elif ext not in (".diff", ".patch"):
  		return
  +	return local
+
+def should_apply(parm):
+	"""Determine if we should apply the given patch"""
+
+	if "mindate" in parm or "maxdate" in parm:
+		pn = d.getVar('PN', 1)
+		srcdate = d.getVar('SRCDATE_%s' % pn, 1)
+		if not srcdate:
+			srcdate = d.getVar('SRCDATE', 1)
+
+		if srcdate == "now":
+			srcdate = d.getVar('DATE', 1)
+
+		if "maxdate" in parm and parm["maxdate"] < srcdate:
+			return False, 'is outdated'
+
+		if "mindate" in parm and parm["mindate"] > srcdate:
+			return False, 'is predated'
+
+
+	if "minrev" in parm:
+		srcrev = d.getVar('SRCREV', 1)
+		if srcrev and srcrev < parm["minrev"]:
+			return False, 'applies to later revisions'
+
+	if "maxrev" in parm:
+		srcrev = d.getVar('SRCREV', 1)
+		if srcrev and srcrev > parm["maxrev"]:
+			return False, 'applies to earlier revisions'
+
+	if "rev" in parm:
+		srcrev = d.getVar('SRCREV', 1)
+		if srcrev and parm["rev"] not in srcrev:
+			return False, "doesn't apply to revision"
+
+	if "notrev" in parm:
+		srcrev = d.getVar('SRCREV', 1)
+		if srcrev and parm["notrev"] in srcrev:
+			return False, "doesn't apply to revision"
+
+	return True, None
+
+python patch_do_patch() {
+	import oe.patch
+
  	patchsetmap = {
  		"patch": oe.patch.PatchTree,
  		"quilt": oe.patch.QuiltTree,
@@ -29,93 +122,15 @@ python patch_do_patch() {
   	rcls = resolvermap[d.getVar('PATCHRESOLVE', 1) or 'user']
  +	classes = {}
+
  	s = d.getVar('S', 1)
   	path = os.getenv('PATH')
  	os.putenv('PATH', d.getVar('PATH', 1))
  -	classes = {}
-
-	workdir = d.getVar('WORKDIR', 1)
-	for url in src_uri:
-		(type, host, path, user, pswd, parm) = bb.decodeurl(url)
-
-		local = None
-		base, ext = os.path.splitext(os.path.basename(path))
-		if ext in ('.gz', '.bz2', '.Z'):
-			local = os.path.join(workdir, base)
-			ext = os.path.splitext(base)[1]
-
-		if "apply" in parm:
-			apply = parm["apply"]
-			if apply != "yes":
-				if apply != "no":
-					bb.msg.warn(None, "Unsupported value '%s' for 'apply' url param in 
'%s', please use 'yes' or 'no'" % (apply, url))
-				continue
-		#elif "patch" in parm:
-			#bb.msg.warn(None, "Deprecated usage of 'patch' url param in '%s', 
please use 'apply={yes,no}'" % url)
-		elif ext not in (".diff", ".patch"):
-			continue
-
-		if not local:
-			url = bb.encodeurl((type, host, path, user, pswd, []))
-			local = os.path.join('/', bb.fetch2.localpath(url, d))
-		local = bb.data.expand(local, d)
-
-		if "striplevel" in parm:
-			striplevel = parm["striplevel"]
-		elif "pnum" in parm:
-			#bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in 
'%s', please use 'striplevel'" % url)
-			striplevel = parm["pnum"]
-		else:
-			striplevel = '1'
-
-		if "pname" in parm:
-			pname = parm["pname"]
-		else:
-			pname = os.path.basename(local)
-
-		if "mindate" in parm or "maxdate" in parm:
-			pn = d.getVar('PN', 1)
-			srcdate = d.getVar('SRCDATE_%s' % pn, 1)
-			if not srcdate:
-				srcdate = d.getVar('SRCDATE', 1)
-
-			if srcdate == "now":
-				srcdate = d.getVar('DATE', 1)
-
-			if "maxdate" in parm and parm["maxdate"] < srcdate:
-				bb.note("Patch '%s' is outdated" % pname)
-				continue
-
-			if "mindate" in parm and parm["mindate"] > srcdate:
-				bb.note("Patch '%s' is predated" % pname)
-				continue
-
-
-		if "minrev" in parm:
-			srcrev = d.getVar('SRCREV', 1)
-			if srcrev and srcrev < parm["minrev"]:
-				bb.note("Patch '%s' applies to later revisions" % pname)
-				continue
-
-		if "maxrev" in parm:
-			srcrev = d.getVar('SRCREV', 1)		
-			if srcrev and srcrev > parm["maxrev"]:
-				bb.note("Patch '%s' applies to earlier revisions" % pname)
-				continue
-
-		if "rev" in parm:
-			srcrev = d.getVar('SRCREV', 1)		
-			if srcrev and parm["rev"] not in srcrev:
-				bb.note("Patch '%s' doesn't apply to revision" % pname)
-				continue
-
-		if "notrev" in parm:
-			srcrev = d.getVar('SRCREV', 1)		
-			if srcrev and parm["notrev"] in srcrev:
-				bb.note("Patch '%s' doesn't apply to revision" % pname)
-				continue
+	for patch in src_patches(d):
+		_, _, local, _, _, parm = bb.decodeurl(patch)
   		if "patchdir" in parm:
  			patchdir = parm["patchdir"]
@@ -132,12 +147,11 @@ python patch_do_patch() {
  		else:
  			patchset, resolver = classes[patchdir]
  -		bb.note("Applying patch '%s' (%s)" % (pname, 
oe.path.format_display(local, d)))
+		bb.note("Applying patch '%s' (%s)" % (parm['patchname'], 
oe.path.format_display(local, d)))
  		try:
-			patchset.Import({"file":local, "remote":url, "strippath": 
striplevel}, True)
-		except Exception:
-			import sys
-			raise bb.build.FuncFailed(str(sys.exc_value))
+			patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
+		except Exception as exc:
+			bb.fatal(str(exc))
  		resolver.Resolve()
  }
  patch_do_patch[vardepsexclude] = "DATE SRCDATE PATCHRESOLVE"
-- 
1.7.8



