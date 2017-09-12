Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB3886FFC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 13DA81807C;
	Tue, 12 Sep 2017 13:23:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id qfNytyQxxSNg; Tue, 12 Sep 2017 13:23:44 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 087A41819B;
	Tue, 12 Sep 2017 13:23:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2A501E07A;
	Tue, 12 Sep 2017 13:23:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D73911E072;
	Tue, 12 Sep 2017 13:23:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 12 Sep 2017 13:23:42 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id CB154DCD;
	Tue, 12 Sep 2017 13:23:42 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 12 Sep 2017 13:23:42 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1263.000; Tue, 12 Sep 2017 13:23:42 +0200
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] externalsrc.bbclass: Avoid symlink clashes
	for virtclasses
Thread-Index: AQHTIA9eU+FJfUsA20a7ca3wutzOkqKxMkhH
Date: Tue, 12 Sep 2017 11:23:42 +0000
Message-ID: <1505215422363.98035@axis.com>
References: <20170828145816.17208-1-olani@axis.com>,
	<20170828145816.17208-2-olani@axis.com>
In-Reply-To: <20170828145816.17208-2-olani@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 2/2] externalsrc.bbclass: Avoid symlink clashes	for virtclasses
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
X-List-Received-Date: Tue, 12 Sep 2017 11:23:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I noticed that the preceding commit has been merged. =0A=
Is there some problem with this one?=0A=
=0A=
--=0A=
Ola Nilsson=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Ola x Nilsson <olani@axis.com>=
=0A=
Sent: Monday, August 28, 2017 16:58=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH 2/2] externalsrc.bbclass: Avoid symlink clashes  =
     for virtclasses=0A=
=0A=
There was a race condifion in externalsrc_configure_prefuncs when the=0A=
same source folder is used for several variants of the same recipe,=0A=
like this:=0A=
=0A=
EXTERNALSRC_pn-foo =3D "..."=0A=
EXTERNALSRC_pn-foo-native =3D "..."=0A=
=0A=
The symlinks were created once for each variant of the recipe, and=0A=
where they led in the end depended on which do_configure task executed=0A=
last.  Create one set of symlinks for each variant by adding an EXTSRC_SUFF=
IX=0A=
variable to the end of the link names.=0A=
Tries to handle all known virtclasses and multilib variants.=0A=
=0A=
Use a lockfile for externalsrc_configure_prefuncs to protect the=0A=
.git/info/exclude file.=0A=
=0A=
Signed-off-by: Ola x Nilsson <olani@axis.com>=0A=
---=0A=
 meta/classes/externalsrc.bbclass        | 16 ++++++++++-=0A=
 meta/lib/oeqa/selftest/cases/devtool.py | 48 +++++++++++++++++++++++++++++=
++++=0A=
 2 files changed, 63 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class=0A=
index 8141f25e04..980e339cdc 100644=0A=
--- a/meta/classes/externalsrc.bbclass=0A=
+++ b/meta/classes/externalsrc.bbclass=0A=
@@ -24,8 +24,21 @@=0A=
 # EXTERNALSRC_BUILD_pn-myrecipe =3D "/path/to/my/source/tree"=0A=
 #=0A=
=0A=
+def get_symlink_suffix(var, suffixes, d):=0A=
+    # Like oe.utils.prune_suffix but return the suffix instead=0A=
+    for suffix in suffixes:=0A=
+        if var.endswith(suffix):=0A=
+            return suffix=0A=
+    if var.startswith('nativesdk-'):=0A=
+        return '-nativesdk'=0A=
+    prefix =3D d.getVar("MLPREFIX")=0A=
+    if prefix and var.startswith(prefix):=0A=
+        return '-' + prefix[:-1]=0A=
+    return ''=0A=
+=0A=
 SRCTREECOVEREDTASKS ?=3D "do_patch do_unpack do_fetch"=0A=
-EXTERNALSRC_SYMLINKS ?=3D "oe-workdir:${WORKDIR} oe-logs:${T}"=0A=
+EXTSRC_SUFFIX =3D "${@get_symlink_suffix(d.getVar('PN'), d.getVar('SPECIAL=
_PKGSUFFIX').split(), d)}"=0A=
+EXTERNALSRC_SYMLINKS ?=3D "oe-workdir${EXTSRC_SUFFIX}:${WORKDIR} oe-logs${=
EXTSRC_SUFFIX}:${T}"=0A=
=0A=
 python () {=0A=
     externalsrc =3D d.getVar('EXTERNALSRC')=0A=
@@ -128,6 +141,7 @@ python () {=0A=
             d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*')=
=0A=
 }=0A=
=0A=
+externalsrc_configure_prefunc[lockfiles] +=3D " ${S}/conf_prefunc.lock"=0A=
 python externalsrc_configure_prefunc() {=0A=
     s_dir =3D d.getVar('S')=0A=
     # Create desired symlinks=0A=
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py=0A=
index 88d69724f9..4119280b48 100644=0A=
--- a/meta/lib/oeqa/selftest/cases/devtool.py=0A=
+++ b/meta/lib/oeqa/selftest/cases/devtool.py=0A=
@@ -491,6 +491,54 @@ class DevtoolTests(DevtoolBase):=0A=
         result =3D runCmd('devtool status')=0A=
         self.assertNotIn('mdadm', result.output)=0A=
=0A=
+    def test_devtool_modify_configure_prefunc(self):=0A=
+        self.write_config("""=0A=
+MACHINE =3D "qemux86-64"=0A=
+require conf/multilib.conf=0A=
+MULTILIBS =3D "multilib:lib32"=0A=
+DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"=0A=
+""")=0A=
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')=0A=
+        self.write_recipeinc('emptytest', '''=0A=
+BBCLASSEXTEND =3D "native nativesdk"=0A=
+do_patch[noexec] =3D "1"=0A=
+INHIBIT_DEFAULT_DEPS =3D "1"=0A=
+''')=0A=
+        self.track_for_cleanup(self.recipeinc('emptytest'))=0A=
+        targets =3D 'emptytest emptytest-native nativesdk-emptytest lib32-=
emptytest'=0A=
+        self.add_command_to_tearDown('bitbake -c clean ' + targets)=0A=
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')=0A=
+        self.track_for_cleanup(tempdir)=0A=
+        runCmd('devtool modify emptytest -x %s' % tempdir)=0A=
+        self.track_for_cleanup(self.workspacedir)=0A=
+        self.append_recipeinc('emptytest', 'EXTERNALSRC_pn-emptytest-nativ=
e =3D "%s"\n' % tempdir)=0A=
+        self.append_recipeinc('emptytest', 'EXTERNALSRC_pn-nativesdk-empty=
test =3D "%s"\n' % tempdir)=0A=
+        self.append_recipeinc('emptytest', 'EXTERNALSRC_pn-lib32-emptytest=
 =3D "%s"\n' % tempdir)=0A=
+        bitbake('-c cleansstate ' + targets)=0A=
+        bitbake('-c configure ' + targets)=0A=
+=0A=
+        def assert_link(linkname, destdir):=0A=
+            linkname =3D os.path.join(tempdir, linkname)=0A=
+            self.assertExists(linkname)=0A=
+            self.assertTrue(os.path.islink(linkname))=0A=
+            dst =3D os.readlink(linkname)=0A=
+            self.assertEqual(dst, destdir)=0A=
+=0A=
+        bbvars =3D {'': get_bb_vars(['WORKDIR', 'T'], 'emptytest'),=0A=
+                  '-native': get_bb_vars(['WORKDIR', 'T'], 'emptytest-nati=
ve'),=0A=
+                  '-lib32': get_bb_vars(['WORKDIR', 'T'], 'lib32-emptytest=
'),=0A=
+                  '-nativesdk': get_bb_vars(['WORKDIR', 'T'], 'nativesdk-e=
mptytest')}=0A=
+        for variant in bbvars:=0A=
+            assert_link('oe-logs' + variant, bbvars[variant]['T'])=0A=
+            assert_link('oe-workdir' + variant, bbvars[variant]['WORKDIR']=
)=0A=
+=0A=
+        with open(os.path.join(tempdir, '.git/info/exclude')) as efile:=0A=
+            lines =3D set(efile.readlines())=0A=
+            expected =3D {'/%s%s\n' % (base, sfx)=0A=
+                        for base in ['oe-logs', 'oe-workdir']=0A=
+                        for sfx in bbvars}=0A=
+            self.assertTrue(expected <=3D lines)=0A=
+=0A=
     @OETestID(1620)=0A=
     def test_devtool_buildclean(self):=0A=
         def assertFile(path, *paths):=0A=
--=0A=
2.11.0=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

