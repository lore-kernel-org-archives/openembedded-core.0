Return-Path: <toshikazu-n@nec.com>
Received: from esa11.hc221-79.ap.iphmx.com (esa11.hc221-79.ap.iphmx.com
	[139.138.31.200])
	by mail.openembedded.org (Postfix) with ESMTP id 93FC861B17
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 07:47:26 +0000 (UTC)
IronPort-SDR: LoN8XHHIM2h61zXG9hgQ7o6SEq9yLmgkuCrim6zKCiMiAsidCsoj6PJ8CjzdSAQS++K8aLZqEb
	orQTufxMJMHXzF9R/PcYt/DsEQ+jtNrHsZhY20nGdPZgYWXRU9avSCP40+7YVxEapedGzYYod3
	i5voLOI5/8nEliovJ/CwRBZbWJ2HA+D6ZeVHDyvY/Czs5HaUFVoKKqeY0BentZKyfSahxw1tzb
	PQJaveqv5KzJLD5ch1VBH+Vrh9nkYHsBef0z3Bwd1U8+fY7XVmI68cpdX64lZLBdsHIsHJMnEI
	ggY=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HnAACP8mVe/64jj9JkHAEBAQEBBwE?=
	=?us-ascii?q?BEQEEBAEBgWoEAQELAYIobFUBATAqjRiJEZo9CQEBAQ4vBAEBhEMCgg8kNwY?=
	=?us-ascii?q?OAgMBAQEDAgUBAQYBAQEBAQEEBAICaQQBAQcKAgGETiEEAQEFCgFDhjkCAQM?=
	=?us-ascii?q?SZxBRVxkigwQBgnqZVQGBKD4CIwE/AQyBBYsyhUqDL4E+gTgBh0mGPT+BEYJ?=
	=?us-ascii?q?fc4o6BI4hiFmBK5cJdoJGfIVuj34agkmMb4t9qm+BaCSBWE0jUIJsUBgNjio?=
	=?us-ascii?q?WjjQyAQExjmkBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,532,1574089200"; d="scan'208";a="10247839"
X-NEC-Delivered: true
Received: from tyo174.gate.nec.co.jp ([210.143.35.174])
	by ob1.hc221-79.ap.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	09 Mar 2020 16:40:05 +0900
Received: from mailsv36.nec.co.jp (mailsv36.nec.co.jp [210.143.35.195])
	by tyo174.gate.nec.co.jp (8.15.1/8.15.1) with ESMTP id 0297e3Bk026562; 
	Mon, 9 Mar 2020 16:40:03 +0900
Received: from gisptrpm001.jp.nec.com ([10.49.113.41])
	by mailsv36.nec.co.jp (8.15.1/8.15.1) with ESMTP id 0297e32H001561;
	Mon, 9 Mar 2020 16:40:03 +0900
Received: from GISPTRPM001.localhost.localdomain (localhost [127.0.0.1])
	by gisptrpm001.jp.nec.com (Postfix) with SMTP id B768A10002E6E;
	Mon,  9 Mar 2020 16:40:03 +0900 (JST)
Received: from gisptrpm001.jp.nec.com (localhost [127.0.0.1])
	by GISPTRPM001.localhost.localdomain (Open ADVANCED MAIL);
	Mon, 9 Mar 2020 16:40:03 +0900
Received: from localhost.localdomain (unknown [10.27.189.215])
	by gisptrpm001.jp.nec.com (Postfix) with ESMTP id A548B2004B05B;
	Mon,  9 Mar 2020 16:40:03 +0900 (JST)
From: Toshikazu Nakayama <toshikazu-n@nec.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 16:35:08 +0900
Message-Id: <1583739309-11200-2-git-send-email-toshikazu-n@nec.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583739309-11200-1-git-send-email-toshikazu-n@nec.com>
References: <1583739309-11200-1-git-send-email-toshikazu-n@nec.com>
Subject: [RFC PATCH 1/2] vuln-cve: vulnerability task with plug and call style
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
X-List-Received-Date: Mon, 09 Mar 2020 07:47:27 -0000

A do_vulnerability() which can run CVE tasks plugged by function variables
VULNFUNC_SCAN_CVE, VULNFUNC_JUDGE_CVE and VULNFUNC_REPORT_CVE.

Variable VULNFUNC_SCAN_CVE is used for the purpose of CVE search based on
CPE (Common Platform Enumeration).

A do_vulnerability() decides two CVE statements 'Patched' or 'Unpatched'
which are coming from the result of CVE patch searching.
However, do_vulnerability() allows VULNFUNC_JUDGE_CVE to change statements.
Then plugged function can check CVE statement moreover by using private
knowledge information. Now plugged functions are only called for 'Unpatched'.

Variable VULNFUNC_REPORT_CVE is used to generate each task's reports.

Here are also implemented following CVE functions.
 cve_assemble_cpe()
  Assemble CPE (Common Platform Enumeration) from recipe variables.
  Assembled CPE list is tossed to functions in VULNFUNC_SCAN_CVE.
 cve_number_sort()
  Sort CVE with 11 digits CVE number (If shorter than 11, fill with zero).
  This can be formatted reports with sorted CVE entries within per package.
 cve_make_git_commitlist()
  Track accumulated git repository commits from base revision to HEAD and
  search CVE number in commit log to gather CVE corresponding commits.
  Gathered commits are compared with CVE number found by VULNFUNC_SCAN_CVE
  and judge 'Patched' or 'Unpatched'.
  For example, Linux kernel 5.2 which has been introduced in "linux-yocto:
  introduce 5.2 recipes" with commit IDs in SRCREV_machine_${MACHINE}s.
  If set those SRCREV commit IDs to CVE_SRCREV_${MACHINE}s, this function
  will search CVE kernel commit from CVE_SRCREV to HEAD.
 cve_make_patchlist()
  Find CVE patches from every layer SRC_URI directory.
  Gathered patches are compared with CVE number found by VULNFUNC_SCAN_CVE
  and judge 'Patched' or 'Unpatched'.
  This function do the same things as get_patches_cves() which is implemented
  at meta/cve-check.bbclass.
 cve_trim_upon_dirs()
  Trim upper directory path than layer directory to make formatted reports.
  This is used to specify patch or git repository containing places.

Finally vulnerability task publishes per package "vulnerability.summary"
and "vulnerability.patchlist" reports.
First one is reporting CVE number list and their judgement, second one is
reporting only about 'Patched' with their patch or commit information to
be found out.

Signed-off-by: Toshikazu Nakayama <toshikazu-n@nec.com>
---
 meta/classes/vuln-cve.bbclass | 285 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)
 create mode 100644 meta/classes/vuln-cve.bbclass

diff --git a/meta/classes/vuln-cve.bbclass b/meta/classes/vuln-cve.bbclass
new file mode 100644
index 0000000..0c7b78c
--- /dev/null
+++ b/meta/classes/vuln-cve.bbclass
@@ -0,0 +1,285 @@
+# vulnerability tasks about CVE.
+
+CPE23[application] = "cpe:2.3:a:"
+CPE23[OperatingSystem] = "cpe:2.3:o:"
+CPE23[hardware] = "cpe:2.3:h:"
+CVE_PART ?= "application"
+CVE_VENDOR ??= "${BPN}"
+CVE_PRODUCT ??= "${BPN}"
+CVE_VERSION ??= "${PV}"
+CVE_VERSION_DEPTH ?= ""
+## Sub CVE functions
+def cve_assemble_cpe(d, vendor_string=None, product_only=False):
+    """
+    Assemble CPE version 2.3 format from corresponding variables.
+    """
+    # Examples for CPE assembler usage (strongly match to CPEv2.3 assignment).
+    # - apache2 [CVE_VENDOR=apache/CVE_PRODUCT=http_server]
+    #  => cpe:2.3:a:apache:http_server:${PV}:
+    # - binutils_2.32.0 [CVE_VENDOR=gnu/CVE_VERSION_DEPTH=2]
+    #  => cpe:2.3:a:gnu:binutils:2.32:
+    # - perl+pathtools_3.73 [CVE_VENDOR=perl/CVE_PRODUCT+=pathtools/
+    #                        CVE_VERSION[pathtools]=3.73]
+    #  => cpe:2.3:a:perl:perl:${PV}:*, cpe:2.3:a:perl:pathtools:3.73:*
+    # - krb5 [CVE_VENDOR=mit/CVE_PRODUCT='kerberos kerberos_5'/
+    #         CVE_VERSION[kerberos]=5-${PV}/CVE_VERSION[kerberos_5]=${PV}]
+    #  => cpe:2.3:a:mit:kerberos_5:${PV}:*, cpe:2.3:a:mit:kerberos:5-${PV}:*
+    #
+    # Usage about vendor_string or product_only.
+    # - bash in wrlinux_rcpl-9.0.0.10 [vendor_string=wrlinux/product_only=True]
+    #  => cpe:2.3:a:wrlinux:bash:
+    #   => cpe:2.3:a:wrlinux:bash:9.0.0.10
+    # This CPE is not for OE-Core common but for local product's knowledge.
+    part = d.getVar('CVE_PART', True)
+    try:
+        part = d.getVarFlag('CPE23', part, True)
+    except:
+        bb.fatal("Unknown CPE target syntax [%s]" % part)
+    if vendor_string:
+        vendor = vendor_string
+    else:
+        vendor = d.getVar('CVE_VENDOR', True)
+    cpes = []
+    for product in d.getVar('CVE_PRODUCT', True).split():
+        if ":" in product:
+            # Taking care of CVE_PRODUCT format's compatibility
+            # Priority setting: vendor_string > CVE_PRODUCT > CVE_VENDOR
+            if not vendor_string:
+                (vendor, product) = product.split(":", 1)
+            else:
+                product = product.split(":", 1)[1]
+        if product_only:
+            cpe = "%s%s:%s" % (part, vendor, product)
+            cpes.append(cpe)
+            continue
+        verlist = d.getVarFlag('CVE_VERSION', product, True)
+        if not verlist:
+            verlist = d.getVar('CVE_VERSION', True)
+        for version in verlist.split():
+            version = version.split("+git")[0]
+            depth = d.getVarFlag('CVE_VERSION_DEPTH', product, True)
+            if not depth:
+                depth = d.getVar('CVE_VERSION_DEPTH', True)
+            if depth:
+                vers = version.split('.')
+                version = vers[0]
+                for i in range(1, int(depth)):
+                    version = "%s.%s" % (version, vers[i])
+            version = version.lower().replace("-p", ":p")
+            cpe = "%s%s:%s:%s:*" % (part, vendor, product, version)
+            cpes.append(cpe)
+    return cpes
+
+def cve_number_sort(cveid):
+    (head, year, number) = list(cveid.split('-'))
+    return year + number.zfill(7)
+
+# CVE patch file or git commit
+def cve_make_git_commitlist(d, fr, to="HEAD"):
+    """
+    Pick git commit ids about CVE fix from source repository as possible.
+    """
+    if not fr:
+        return []
+    s = d.expand('${S}')
+    cmd = "cd %s; git whatchanged %s..%s | grep -w ^commit" % (s, fr, to)
+    (retval, commitlist) = oe.utils.getstatusoutput(cmd)
+    if retval:
+        return []
+    import re
+    cve_match = re.compile("CVE\-\d{4}\-\d+")
+    commits = []
+    for commit in commitlist.split("\n"):
+        meta = commit.split()[1]
+        cmd = "cd %s; git log -1 %s" % (s, meta)
+        (retval, commitlog) = oe.utils.getstatusoutput(cmd)
+        if retval:
+            continue
+        cves = []
+        for match in cve_match.finditer(commitlog):
+            for cve in commitlog[match.start():match.end()].split():
+                cves.append(cve)
+        cves = list(set(cves))
+        if len(cves) > 0:
+            shortlog = commitlog.split('\n')[4].strip()
+            # Marking
+            d.setVarFlag('CVE_PATCH_TYPE', meta, 'gitmeta')
+            d.setVarFlag('CVE_PATCH_NAME', meta, shortlog)
+            d.setVarFlag('CVE_PATCH_WHEREIS', meta, s)
+            d.setVarFlag('CVE_PATCH_ATTR', meta, meta)
+            d.setVarFlag('CVE_PATCH_CVES', meta, cves)
+            commits.append(meta)
+    return commits
+
+def cve_make_patchlist(d):
+    import bb.utils
+    import re
+    cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+    patches = []
+    for url in bb.utils.exec_flat_python_func('src_patches', d):
+        cves = []
+        abspatch = bb.fetch.decodeurl(url)[2]
+        fname_match = cve_file_name_match.search(abspatch)
+        if fname_match:
+            cve = fname_match.group(1).upper()
+            cves.append(cve)
+        with open(abspatch, "r", encoding="utf-8") as f:
+            try:
+                patch_text = f.read()
+            except UnicodeDecodeError:
+                f.close()
+                with open(patch_file, "r", encoding="iso8859-1") as f:
+                    patch_text = f.read()
+        # Search for one or more "CVE: " lines
+        for match in cve_match.finditer(patch_text):
+            # Get only the CVEs without the "CVE: " tag
+            for cve in patch_text[match.start()+5:match.end()].split():
+                cves.append(cve)
+        cves = list(set(cves))
+        if len(cves) > 0:
+            md5 = bb.utils.md5_file(abspatch)
+            patch = os.path.basename(abspatch)
+            # Marking
+            d.setVarFlag('CVE_PATCH_TYPE', patch, 'diff')
+            d.setVarFlag('CVE_PATCH_NAME', patch, patch)
+            d.setVarFlag('CVE_PATCH_WHEREIS', patch, os.path.dirname(abspatch))
+            d.setVarFlag('CVE_PATCH_ATTR', patch, md5)
+            d.setVarFlag('CVE_PATCH_CVES', patch, cves)
+            patches.append(patch)
+    return patches
+
+def cve_trim_upon_dirs(d, path):
+    if path.startswith('/'):
+        items = (path.lstrip('/')).split('/')
+    else:
+        items = path.split('/')
+    layerdir = ""
+    layers = d.getVar('BBLAYERS', True).split()
+    for item in items:
+        layerdir += "/%s" % item
+        if layerdir in layers:
+            path = "%s" % item + path.replace(layerdir, '', 1)
+            break
+    return path
+
+## Main task
+# Append functions to these variables from its anonymous() in foo.bbclass.
+VULNFUNC_SCAN_CVE[type] = 'list'
+VULNFUNC_SCAN_CVE = ""
+VULNFUNC_JUDGE_CVE = 'list'
+VULNFUNC_JUDGE_CVE = ""
+VULNFUNC_REPORT_CVE[type] = 'list'
+VULNFUNC_REPORT_CVE = ""
+python do_vulnerability() {
+    pn = d.getVar('PN', True)
+    destdir = os.path.join(d.getVar('VULNSTATEDIR', True), pn)
+    bb.utils.mkdirhier(destdir)
+    g = globals()
+
+    cvelist = []
+    # Gather potential CVE list by using CPE matching
+    for scan in (d.getVar('VULNFUNC_SCAN_CVE', True) or "").split():
+        if scan in g:
+            cves = g[scan](d, cve_assemble_cpe(d), destdir)
+            if len(cves) > 0:
+                cvelist.extend(cves)
+    if not cvelist:
+        return
+    # Remove duplicated CVEs and sort.
+    cvelist = list(set(cvelist))
+    cvelist = sorted(cvelist, key=cve_number_sort)
+
+    # Gather CVE patches which are going to be applied.
+    patchlist = []
+    if d.getVar('CVE_SRCREV', True):
+        commits = cve_make_git_commitlist(d, d.getVar('CVE_SRCREV', True))
+        if commits:
+            patchlist.extend(commits)
+    patches = cve_make_patchlist(d)
+    if patches:
+        patchlist.extend(patches)
+
+    # Whether detected CVE is 'Patched' or 'Unpatched' or 'Something by foo's'.
+    for cveid in cvelist:
+        cves = []
+        for patch in patchlist:
+            if cveid in d.getVarFlag('CVE_PATCH_CVES', patch, True):
+                # patch is applied for cveid, populate CVE patch information.
+                patch_type = d.getVarFlag('CVE_PATCH_TYPE', patch, True)
+                patch_name = d.getVarFlag('CVE_PATCH_NAME', patch, True)
+                patch_whereis = d.getVarFlag('CVE_PATCH_WHEREIS', patch, True)
+                patch_whereis = cve_trim_upon_dirs(d, patch_whereis)
+                patch_attr = d.getVarFlag('CVE_PATCH_ATTR', patch, True)
+                if patch_type == 'gitmeta':
+                    cves.append("Commit-log %s" % patch_name)
+                    cves.append(" commitID %s" % patch_attr)
+                    cves.append(" git repository %s" % (patch_whereis))
+                    cves.append('=' * 60)
+                else:
+                    cves.append("Patch-name %s" % patch_name)
+                    cves.append(" md5sum %s" % patch_attr)
+                    cves.append(" layer at %s" % patch_whereis)
+                    cves.append('=' * 60)
+        if len(cves) > 0:
+            # Patch set for cveid is delivered by.
+            d.setVarFlag('CVEJUDGE', cveid, "Patched")
+            d.setVarFlag('CVEDESC', cveid, '\n '.join(cves))
+        else:
+            # Patch set is not found out, set unpatched.
+            d.setVarFlag('CVEJUDGE', cveid, "Unpatched")
+            # Try plugin function to resolve CVEJUDGE by using other ways.
+            for judge in (d.getVar('VULNFUNC_JUDGE_CVE', True) or "").split():
+                if judge in g:
+                    g[judge](d, cveid)
+            continue
+
+    # Make vulnerability report files.
+    for cveid in cvelist:
+        with open(os.path.join(destdir, 'cve.summary'), "a") as s:
+            s.write("%s: %s\n" % (cveid, d.getVarFlag('CVEJUDGE', cveid, True)))
+        if d.getVarFlag('CVEJUDGE', cveid, True) == "Patched":
+            with open(os.path.join(destdir, 'cve.patchlist'), "a") as p:
+                msg = "<%s>\n" % cveid
+                if d.getVarFlag('CVEDESC', cveid, True):
+                    msg += " %s\n" % d.getVarFlag('CVEDESC', cveid, True)
+                p.write(msg)
+    # Make appendix report files.
+    for report in (d.getVar('VULNFUNC_REPORT_CVE', True) or "").split():
+        if report in g:
+            g[report](d, destdir, cvelist)
+}
+addtask do_vulnerability after do_patch before do_build
+# Some vulnerability plugged tasks tend to prefer calling after do_install
+# if called functions require build configuration or binary in their purpose.
+# Those are guaranteed after compile($B)/install($D) sections have been done.
+# If wants, bbclass can replace task position in its anonymous() constructor.
+# For example, foo wants to do_vulnerability after do_install.
+# foo.bbclass: __anonymous()
+#  1) bb.build.deltask('vulnerability', d)
+#  2) bb.build.addtask('vulnerability', None, "do_install", d)
+# Note that replacing all thing after build forced, that'll meet unrecoverable
+# fatal exception.
+#    "The file %s is installed by both libgcc and libgcc-initial, aborting"
+# This proposal can not guarantee such risks under build dependencies,
+# libgcc is staying in blacklist of after do_install() at this moment. 
+
+VULN_CVE_DIRECTORY = "${DEPLOY_DIR}/vuln-cve"
+VULNSTATEDIR = "${WORKDIR}/vuln-cve-destdir"
+SSTATETASKS += "do_vulnerability"
+do_vulnerability[sstate-inputdirs] = "${VULNSTATEDIR}"
+do_vulnerability[sstate-outputdirs] = "${VULN_CVE_DIRECTORY}"
+do_vulnerability[dir] = "${VULNSTATEDIR}/${PN}"
+do_vulnerability[cleandirs] = "${VULNSTATEDIR}"
+do_vulnerability[nostamp] = "1"
+
+python do_vulnerability_setscene() {
+    sstate_setscene(d)
+}
+addtask do_vulnerability_setscene
+python __anonymous() {
+    # Exclude possible unnecessary recipes.
+    pn = d.getVar('PN', True)
+    if pn.endswith("-native") or pn.startswith("nativesdk-") or "-cross-" in pn or "-crosssdk" in pn:
+        bb.build.deltask('vulnerability', d)
+}
-- 
2.7.4


