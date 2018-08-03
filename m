Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 578 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Aug 2018 22:48:19 UTC
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id 0BFC878E7C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 22:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=10389; q=dns/txt;
	s=iport; t=1533336501; x=1534546101;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=lW8BRGpx50JKrhpgxzU2TIfQRAjSLC0dSZKircJ9Je8=;
	b=iXsd/PKEGC6FeTo2zNWVJcNwfPOtjozns4iS+JYBfv0jHmfULHysc04M
	og7/R6CoMzSQmTLxypKdSs4wut1MPFbJHr9SdnFHWy/GcXrfpy94EMLNk
	HEyBERRKnUyJRbeAmH3fvP0nZximZvyBFRbT8NTKceUz3ypO4eHjgHhmI Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DTAADR2GRb/5tdJa1cGgEBAQEBAgE?=
	=?us-ascii?q?BAQEIAQEBAYMkKoFiKAqLfZMVkRyBeguEbIMQITQYAQIBAQIBAQJtHQuGIxM?=
	=?us-ascii?q?SASk0IycEDgWCVUuCALMtilMUiHUXgUE/hUqJLgKHc4R+PHOMDQkCj0KBSoc?=
	=?us-ascii?q?RhT6IGYoWAhEUgSQdOECBEnAVO4JpkFNvAY8IgRsBAQ?=
X-IronPort-AV: E=Sophos;i="5.51,440,1526342400"; d="scan'208";a="152271856"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Aug 2018 22:38:41 +0000
Received: from XCH-ALN-009.cisco.com (xch-aln-009.cisco.com [173.36.7.19])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id w73McfUf020947
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 3 Aug 2018 22:38:41 GMT
Received: from xch-aln-009.cisco.com (173.36.7.19) by XCH-ALN-009.cisco.com
	(173.36.7.19) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Fri, 3 Aug 2018 17:38:40 -0500
Received: from xch-aln-009.cisco.com ([173.36.7.19]) by XCH-ALN-009.cisco.com
	([173.36.7.19]) with mapi id 15.00.1320.000;
	Fri, 3 Aug 2018 17:38:40 -0500
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] cve-report.bbclass: add class
Thread-Index: AQHUK3qLM4woIUuUJECq4vFN04hkCA==
Date: Fri, 3 Aug 2018 22:38:40 +0000
Message-ID: <1533335978004.84414@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.61.232.111]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.36.7.19, xch-aln-009.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Cc: "mariano.lopez@linux.intel.com" <mariano.lopez@linux.intel.com>,
	"xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: [PATCH 2/2] cve-report.bbclass: add class
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
X-List-Received-Date: Fri, 03 Aug 2018 22:48:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Implements "report_cve" and "report_patched" tasks.=0A=
=0A=
"report_patched" prepares image manifest with patched CVE info.=0A=
"report_cve" runs cvert-* scripts to generate kernel and package CVE report=
s.=0A=
=0A=
You can configure it to set report filenames, reuse NVD feeds,=0A=
stop after manifest generation and ignore specific classes,=0A=
like native, nativesdk, etc.=0A=
=0A=
CC: Mariano Lopez <mariano.lopez@linux.intel.com>=0A=
Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>=0A=
---=0A=
 meta/classes/cve-report.bbclass | 241 ++++++++++++++++++++++++++++++++++++=
++++=0A=
 1 file changed, 241 insertions(+)=0A=
 create mode 100644 meta/classes/cve-report.bbclass=0A=
=0A=
diff --git a/meta/classes/cve-report.bbclass b/meta/classes/cve-report.bbcl=
ass=0A=
new file mode 100644=0A=
index 0000000..00508a9=0A=
--- /dev/null=0A=
+++ b/meta/classes/cve-report.bbclass=0A=
@@ -0,0 +1,241 @@=0A=
+# Class to inherit when you want to generate a CVE reports.=0A=
+#=0A=
+# Generates package list file, kernel and package CVE reports.=0A=
+#=0A=
+# Example:=0A=
+#   echo 'INHERIT +=3D "cve-report"' >> conf/local.conf=0A=
+#   bitbake -c report_cve core-image-minimal=0A=
+#=0A=
+# Variables to be passed to "cvert-*" scripts:=0A=
+#=0A=
+# CVE_REPORT_MODE[foss]=0A=
+#     Path to the CVE FOSS report to be generated.=0A=
+#=0A=
+# CVE_REPORT_MODE[kernel]=0A=
+#     Path to the CVE kernel report to be generated.=0A=
+#=0A=
+# CVE_REPORT_MODE[restore]=0A=
+#     Path to the CVE blob data file.=0A=
+#=0A=
+#     E.g. for multiple MACHINEs:=0A=
+#     (1) generate CVE blob:=0A=
+#         cvert-update --store /path/to/cvedump $TEMP/nvdfeed=0A=
+#     (2) for mach in $(get_machine_list); do=0A=
+#             (source oe-init-build-env "build-$mach";=0A=
+#             echo 'CVE_REPORT_MODE[restore] =3D "/path/to/cvedump"' >> co=
nf/local.conf;=0A=
+#             echo 'CVE_REPORT_MODE[foss] =3D "/path/to/report-foss-'${mac=
h}'"' >> conf/local.conf;=0A=
+#             echo 'CVE_REPORT_MODE[kernel] =3D "/path/to/report-kernel-'$=
{mach}'"' >> conf/local.conf;=0A=
+#             MACHINE=3D$mach bitbake -c report_cve core-image-minimal)=0A=
+#         done=0A=
+#=0A=
+# CVE_REPORT_MODE[offline]=0A=
+#     Either "0" or "1". Offline mode ("--offline" parameter for cvert-* s=
cripts).=0A=
+#=0A=
+# CVE_REPORT_MODE[feeddir]=0A=
+#     Path to the NVD feed directory.=0A=
+#=0A=
+# CVE_REPORT_MODE[packagelist]=0A=
+#     Path to the package list file to be generated.=0A=
+#=0A=
+# CVE_REPORT_MODE[packageonly]=0A=
+#     Either "0" or "1". Generate package list file, then stop.=0A=
+#=0A=
+# CVE_REPORT_MODE[blacklist]=0A=
+#     Ignore specific class.=0A=
+#=0A=
+=0A=
+CVE_REPORT_MODE[foss] ?=3D "${LOG_DIR}/cvert/report-foss.txt"=0A=
+CVE_REPORT_MODE[kernel] ?=3D "${LOG_DIR}/cvert/report-kernel.txt"=0A=
+CVE_REPORT_MODE[offline] ?=3D "0"=0A=
+CVE_REPORT_MODE[feeddir] ?=3D "${LOG_DIR}/nvdfeeds"=0A=
+CVE_REPORT_MODE[packagelist] ?=3D "${LOG_DIR}/cvert/package.lst"=0A=
+CVE_REPORT_MODE[packageonly] ?=3D "0"=0A=
+CVE_REPORT_MODE[blacklist] ?=3D "native,nativesdk,cross,crosssdk,cross-can=
adian,packagegroup,image"=0A=
+=0A=
+CVE_PRODUCT ??=3D "${BPN}"=0A=
+CVE_VERSION ??=3D "${PV}"=0A=
+=0A=
+addhandler generate_report_handler=0A=
+generate_report_handler[eventmask] =3D "bb.event.BuildCompleted"=0A=
+=0A=
+def cvert_update(d):=0A=
+    """=0A=
+    Sync up with NVD=0A=
+    """=0A=
+=0A=
+    import tempfile=0A=
+    import subprocess=0A=
+=0A=
+    bb.utils.export_proxies(d)=0A=
+=0A=
+    dump =3D os.path.join(d.getVar("LOG_DIR"), "cvedump")=0A=
+=0A=
+    bb.note("Storing CVE database %s" % dump)=0A=
+=0A=
+    cmd =3D [=0A=
+        "cvert-update",=0A=
+        "--store", dump,=0A=
+        d.getVarFlag("CVE_REPORT_MODE", "feeddir")=0A=
+    ]=0A=
+=0A=
+    if d.getVarFlag("CVE_REPORT_MODE", "offline") !=3D "0":=0A=
+        cmd.append("--offline")=0A=
+=0A=
+    try:=0A=
+        output =3D subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT=
).decode()=0A=
+        bb.debug(2, "Call '%s':\n%s" % (" ".join(cmd), output))=0A=
+    except subprocess.CalledProcessError as e:=0A=
+        bb.error("Failed to run cvert-update: '%s'\n%s: %s" % (" ".join(cm=
d), e, e.output))=0A=
+=0A=
+    return dump=0A=
+=0A=
+# copied from cve-check.bbclass=0A=
+def get_patches_cves(d):=0A=
+    """=0A=
+    Get patches that solve CVEs using the "CVE: " tag.=0A=
+    """=0A=
+=0A=
+    import re=0A=
+=0A=
+    pn =3D d.getVar("PN")=0A=
+    cve_match =3D re.compile("CVE:( CVE\-\d{4}\-\d+)+")=0A=
+=0A=
+    # Matches last CVE-1234-211432 in the file name, also if written=0A=
+    # with small letters. Not supporting multiple CVE id's in a single=0A=
+    # file name.=0A=
+    cve_file_name_match =3D re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")=0A=
+=0A=
+    patched_cves =3D set()=0A=
+    bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)=0A=
+    for url in src_patches(d):=0A=
+        patch_file =3D bb.fetch.decodeurl(url)[2]=0A=
+=0A=
+        # Check patch file name for CVE ID=0A=
+        fname_match =3D cve_file_name_match.search(patch_file)=0A=
+        if fname_match:=0A=
+            cve =3D fname_match.group(1).upper()=0A=
+            patched_cves.add(cve)=0A=
+            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, pat=
ch_file))=0A=
+=0A=
+        with open(patch_file, "r", encoding=3D"utf-8") as f:=0A=
+            try:=0A=
+                patch_text =3D f.read()=0A=
+            except UnicodeDecodeError:=0A=
+                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"=
=0A=
+                        " trying with iso8859-1" %  patch_file)=0A=
+                f.close()=0A=
+                with open(patch_file, "r", encoding=3D"iso8859-1") as f:=
=0A=
+                    patch_text =3D f.read()=0A=
+=0A=
+        # Search for one or more "CVE: " lines=0A=
+        text_match =3D False=0A=
+        for match in cve_match.finditer(patch_text):=0A=
+            # Get only the CVEs without the "CVE: " tag=0A=
+            cves =3D patch_text[match.start()+5:match.end()]=0A=
+            for cve in cves.split():=0A=
+                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))=0A=
+                patched_cves.add(cve)=0A=
+                text_match =3D True=0A=
+=0A=
+        if not fname_match and not text_match:=0A=
+            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)=0A=
+=0A=
+    return patched_cves=0A=
+=0A=
+=0A=
+python generate_report_handler() {=0A=
+    if d.getVarFlag("CVE_REPORT_MODE", "packageonly") !=3D "0":=0A=
+        return=0A=
+=0A=
+    import subprocess=0A=
+=0A=
+    restore =3D d.getVarFlag("CVE_REPORT_MODE", "restore")=0A=
+=0A=
+    if not restore:=0A=
+        restore =3D cvert_update(d)=0A=
+=0A=
+    if os.path.exists(os.path.join(d.getVar("STAGING_KERNEL_DIR"), '.git')=
):=0A=
+        report_kernel =3D d.getVarFlag("CVE_REPORT_MODE", "kernel")=0A=
+=0A=
+        bb.note("Generating CVE KERNEL report: %s" % report_kernel)=0A=
+=0A=
+        cmd =3D [=0A=
+            "cvert-kernel",=0A=
+            "--restore", restore,=0A=
+            "--output", report_kernel,=0A=
+            d.getVar("STAGING_KERNEL_DIR")=0A=
+        ]=0A=
+=0A=
+        try:=0A=
+            output =3D subprocess.check_output(cmd, stderr=3Dsubprocess.ST=
DOUT).decode()=0A=
+            bb.debug(2, "Call '%s':\n%s" % (" ".join(cmd), output))=0A=
+        except subprocess.CalledProcessError as e:=0A=
+            bb.error("Failed to run cvert-kernel: '%s'\n%s: %s" % (" ".joi=
n(cmd), e, e.output))=0A=
+=0A=
+    if os.path.exists(d.getVarFlag("CVE_REPORT_MODE", "packagelist")):=0A=
+        report_foss =3D d.getVarFlag("CVE_REPORT_MODE", "foss")=0A=
+=0A=
+        bb.note("Generating CVE FOSS report: %s" % report_foss)=0A=
+=0A=
+        cmd =3D [=0A=
+            "cvert-foss",=0A=
+            "--restore", restore,=0A=
+            "--output", report_foss,=0A=
+            d.getVarFlag("CVE_REPORT_MODE", "packagelist")=0A=
+        ]=0A=
+=0A=
+        try:=0A=
+            output =3D subprocess.check_output(cmd, stderr=3Dsubprocess.ST=
DOUT).decode()=0A=
+            bb.debug(2, "Call '%s':\n%s" % (" ".join(cmd), output))=0A=
+        except subprocess.CalledProcessError as e:=0A=
+            bb.error("Failed to run cvert-foss: '%s'\n%s: %s" % (" ".join(=
cmd), e, e.output))=0A=
+}=0A=
+=0A=
+addhandler build_started=0A=
+build_started[eventmask] =3D "bb.event.BuildStarted"=0A=
+=0A=
+python build_started() {=0A=
+    packagelist =3D d.getVarFlag("CVE_REPORT_MODE", "packagelist")=0A=
+    bb.utils.remove(packagelist)=0A=
+    bb.utils.mkdirhier(os.path.dirname(packagelist))=0A=
+    bb.note("Package list: ", packagelist)=0A=
+}=0A=
+=0A=
+addtask do_report_cve after do_report_patched=0A=
+=0A=
+do_report_cve[recrdeptask] =3D "do_report_cve do_report_patched"=0A=
+do_report_cve[recideptask] =3D "do_${BB_DEFAULT_TASK}"=0A=
+do_report_cve[nostamp] =3D "1"=0A=
+=0A=
+do_report_cve() {=0A=
+    :=0A=
+}=0A=
+=0A=
+python do_report_patched() {=0A=
+    if not d.getVar("SRC_URI"):=0A=
+        return=0A=
+=0A=
+    cve_product =3D d.getVar("CVE_PRODUCT")=0A=
+=0A=
+    if not cve_product or cve_product =3D=3D 'linux_kernel':=0A=
+        # Linux kernel CVEs are processed by cvert-kernel=0A=
+        return=0A=
+=0A=
+    cve_version =3D d.getVar("CVE_VERSION")=0A=
+    patched_cves =3D get_patches_cves(d)=0A=
+=0A=
+    with open(d.getVarFlag("CVE_REPORT_MODE", "packagelist"), "a") as fil:=
=0A=
+        fil.write("%s,%s,%s\n" % (cve_product, cve_version, " ".join(patch=
ed_cves)))=0A=
+        bb.debug(2, "Append to package-list: '%s,%s,%s'" % (cve_product, c=
ve_version, " ".join(patched_cves)))=0A=
+}=0A=
+=0A=
+addtask do_report_patched after do_unpack before do_build=0A=
+=0A=
+do_report_patched[nostamp] =3D "1"=0A=
+=0A=
+python() {=0A=
+    for b in d.getVarFlag("CVE_REPORT_MODE", "blacklist").split(","):=0A=
+        if bb.data.inherits_class(b, d):=0A=
+            bb.build.deltask("do_report_patched", d)=0A=
+            break=0A=
+}=0A=
-- =0A=
2.1.4=0A=

