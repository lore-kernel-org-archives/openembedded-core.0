Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2385CC98305
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:24:34 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5998.1790069065278896704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=YQvaRrwU;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id 1DE3BDF95
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 11:24:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.249]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8wjc-3frliN0; Tue, 22 Sep 2026 11:24:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 4/5] license_finder: normalise license texts before hashing
Date: Tue, 22 Sep 2026 11:23:35 +0200
Message-ID: <20260922092411.262885-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922092411.262885-1-f_l_k@t-online.de>
References: <20260922092411.262885-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1790069060-CAFFA986-3C599A31/0/0 CLEAN NORMAL
X-TOI-MSGID: d37d016a-ff01-4d6f-8cc1-af3a41ee01cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790069062; i=f_l_k@t-online.de;
	bh=zb+mgCNRfU2BWRhsVmBhdpDWRzVc+kXlDQj24U5RiNE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YQvaRrwU2AT0vlGkuJxYQwoX9xyc6PWTvGLwIHxt7LqwqswNzA6+hXbuJHg4h9slX
	 xn2v7DCsqIWsND35o/MiMpftlJj0iaK4AwgocCRlWAwoavP4J6YyfIZQjfMamkEo+w
	 1gCfMDjoz4GloDz7ZUCAnTik8FerirBr/VNk06ic9Cl/5FV2l/LXmVay7wBHpvve4h
	 MTfQxb6buc7gf66kpxLzuXr0gMr7fOThaFy2HzIc+mHBiJuPkFoT+wTGGWjOtOul4+
	 Fy+kRLm6S3760k21lOlNd5pF3OgBRbweXDPDCILA02NyuGUjBEP/ywcFMjzbbjgvb8
	 UrXlP1bmoKU8Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246400

Matching by the md5 of a lightly crunched text missed most of the
common BSD, MIT, ISC, MPL-2.0 and Apache-2.0 copies in a Go module
tree: list markers, punctuation, case, the copyright holder's name in
the BSD advertising clause, the party in the ISC disclaimer and the
Apache-2.0 appendix all changed the hash. Compare the lower-cased word
stream instead, strip those variable parts, and only treat a line as a
license title at the top of the file. For rclone's 256 module license
files this brings the unrecognised ones down from 57 to 25, the rest
are dual-license files or texts with additions. The canonical licenses
are hashed in sorted order and the first name wins so that formatting
twins map to a stable name.

license-hashes.csv also holds hashes of texts crunched the old way, for
example the short Apache-2.0 boilerplate notice, so the old algorithm
stays as a third lookup step and none of the existing entries is lost.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/lib/oe/license_finder.py | 61 +++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/license_finder.py b/meta/lib/oe/license_finder.p=
y
index 9c217cf891..b500f3a599 100644
--- a/meta/lib/oe/license_finder.py
+++ b/meta/lib/oe/license_finder.py
@@ -46,40 +46,52 @@ def _crunch_known_licenses(d):
=20
     lic_dirs =3D [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_P=
ATH') or "").split()
     for lic_dir in lic_dirs:
-        for fn in os.listdir(lic_dir):
+        for fn in sorted(os.listdir(lic_dir)):
             path =3D os.path.join(lic_dir, fn)
             if not os.path.isfile(path):
                 continue
             # Hash the exact contents
             md5value =3D bb.utils.md5_file(path)
-            md5sums[md5value] =3D fn
-            # Also hash a "crunched" version
+            md5sums.setdefault(md5value, fn)
+            # Also hash a "crunched" version. Some licenses only differ
+            # in formatting, the first name in sort order wins for those=
.
             md5value =3D _crunch_license(path)
-            md5sums[md5value] =3D fn
+            md5sums.setdefault(md5value, fn)
=20
     return md5sums
=20
=20
-def _crunch_license(licfile):
+def _crunch_license(licfile, legacy=3DFalse):
     '''
     Remove non-material text from a license file and then calculate its
     md5sum. This works well for licenses that contain a copyright statem=
ent,
     but is also a useful way to handle people's insistence upon reformat=
ting
     the license text slightly (with no material difference to the text o=
f the
     license).
+
+    With legacy set, the text is crunched the way it was before the word
+    stream normalisation, which is what the hashes in license-hashes.csv
+    were made with.
     '''
=20
     import oe.utils
=20
     # Note: these are carefully constructed!
-    license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?.{0,1=
5} ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
+    if legacy:
+        license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?.=
{0,15} ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
+    else:
+        license_title_re =3D re.compile(r'^#*\(? *(This is )?([Tt]he )?(=
[A-Z0-9].{0,14})? ?[Ll]icen[sc]e( \(.{1,10}\))?\)?[:\.]? ?#*$')
     license_statement_re =3D re.compile(r'^((This (project|software)|.{1=
,10}) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) =
under the .{1,10} [Ll]icen[sc]e:?$')
     copyright_re =3D re.compile(r'^ *[#\*]* *(Modified work |MIT LICENSE=
D )?Copyright ?(\([cC]\))? .*$')
     disclaimer_re =3D re.compile(r'^ *\*? ?All [Rr]ights [Rr]eserved\.$'=
)
     email_re =3D re.compile(r'^.*<[\w\.-]*@[\w\.\-]*>$')
     header_re =3D re.compile(r'^(\/\**!?)? ?[\-=3D\*]* ?(\*\/)?$')
     tag_re =3D re.compile(r'^ *@?\(?([Ll]icense|MIT)\)?$')
-    url_re =3D re.compile(r'^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
+    if legacy:
+        url_re =3D re.compile(r'^ *[#\*]* *https?:\/\/[\w\.\/\-]+$')
+    else:
+        url_re =3D re.compile(r'^ *[#\*]* *https?:\/\/[\w\.\/\-]+\.?$')
+    list_marker_re =3D re.compile(r'^(\(?[0-9a-zA-Z]{1,2}[\.\)]|[\*\-=E2=
=80=A2o]) +')
=20
     lictext =3D []
     with open(licfile, 'r', errors=3D'surrogateescape') as f:
@@ -97,9 +109,11 @@ def _crunch_license(licfile):
                 continue
             elif url_re.match(line):
                 continue
-            elif license_title_re.match(line):
+            # Titles and statements are only dropped at the top of the
+            # file, further down they are wrapped sentences of the text
+            elif (legacy or len(lictext) < 3) and license_title_re.match=
(line):
                 continue
-            elif license_statement_re.match(line):
+            elif (legacy or len(lictext) < 3) and license_statement_re.m=
atch(line):
                 continue
             # Strip comment symbols
             line =3D line.replace('*', '') \
@@ -108,6 +122,9 @@ def _crunch_license(licfile):
             line =3D line.replace('sub-license', 'sublicense')
             # Squash spaces
             line =3D oe.utils.squashspaces(line.strip())
+            # Drop list markers, "1." and "*" are used interchangeably
+            if not legacy:
+                line =3D list_marker_re.sub('', line)
             # Replace smart quotes, double quotes and backticks with sin=
gle quotes
             line =3D line.replace(u"\u2018", "'").replace(u"\u2019", "'"=
).replace(u"\u201c","'").replace(u"\u201d", "'").replace('"', '\'').repla=
ce('`', '\'')
             # Unify brackets
@@ -115,9 +132,30 @@ def _crunch_license(licfile):
             if line:
                 lictext.append(line)
=20
+    text =3D ' '.join(lictext)
+    if legacy:
+        return hashlib.md5(text.encode('utf-8', errors=3D'ignore')).hexd=
igest()
+
+    # Only the words matter, not case or punctuation
+    text =3D text.lower()
+    text =3D text.replace('and/or', 'and')
+    text =3D re.sub(r'https?://\S+', ' ', text)
+    text =3D re.sub(r'[^a-z0-9]+', ' ', text).strip()
+    # The Apache-2.0 appendix is instructions, not license terms, and
+    # the end marker is often left out
+    text =3D re.sub(r' appendix how to apply the apache license to your =
work.*? limitations under the license', '', text)
+    text =3D text.replace(' end of terms and conditions', '')
+    # Names of copyright holders in the BSD advertising clause and the
+    # ISC disclaimer, and the extra paragraph reference in X11-style MIT
+    text =3D re.sub(r'neither the name of .*? nor the names of', 'neithe=
r the name of nor the names of', text)
+    text =3D text.replace('copyright owner', 'copyright holder')
+    text =3D re.sub(r'\b(the authors?|isc|the copyright holders?) discla=
ims?\b', 'the author disclaims', text)
+    text =3D re.sub(r'shall (the authors?|isc|the copyright holders?) be=
 liable', 'shall the author be liable', text)
+    text =3D text.replace('permission notice including the next paragrap=
h shall', 'permission notice shall')
+
     m =3D hashlib.md5()
     try:
-        m.update(' '.join(lictext).encode('utf-8'))
+        m.update(text.encode('utf-8'))
         md5val =3D m.hexdigest()
     except UnicodeEncodeError:
         md5val =3D None
@@ -183,6 +221,9 @@ def match_licenses(licfiles, srctree, d, extra_hashes=
=3D{}):
         if not license:
             crunched_md5 =3D _crunch_license(resolved_licfile)
             license =3D md5sums.get(crunched_md5, None)
+        if not license:
+            crunched_md5 =3D _crunch_license(resolved_licfile, legacy=3D=
True)
+            license =3D md5sums.get(crunched_md5, None)
             if not license:
                 rel_fn =3D os.path.relpath(licfile, srctree + "/..")
                 license =3D oe.spdx_license.UnknownId("Unknown")
--=20
2.55.0


