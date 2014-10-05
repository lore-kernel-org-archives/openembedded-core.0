Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id AC2446AC6B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Oct 2014 15:14:32 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id w8so2599862qac.19
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Oct 2014 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=uxn93FPcKvAfCTlI7K+DU1ihSDPjMFLfb5guv8WV73I=;
	b=MbpTuv0mG9eK92D9Qh+zoszZJzbv8tdyCF2JhLiamaeXGN0Xt9E49GDmtIzDeMalNE
	U7pmPNhk2c08WAsoSPoGevqbUndOm7Xx+d05Bujr6igEKbT7tQC111Jbvj8dUavdhbSq
	a2Io3t2Dtvh28JTI467pniKrAvl4JjaDOXHqpUE+crDIQzAM2mMk4SuHFaH5F+uwTkBU
	dXw1yyXnpjz36EILPgbP+iz+8WIXCBClfln02I58scYxImtuO59PmmSXWSc+8d0BbSn4
	kOUYXJhYMWtJb9CVq6uwLbizlwMfkbRseTF73GpWlwhuJCN+K0MXUeqFmCYwHnAM3U2y
	F7rQ==
X-Received: by 10.224.60.129 with SMTP id p1mr2579270qah.99.1412522073008;
	Sun, 05 Oct 2014 08:14:33 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	e64sm10461736qga.34.2014.10.05.08.14.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 08:14:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id B87711C65C960; Sun,  5 Oct 2014 12:14:26 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun,  5 Oct 2014 12:14:22 -0300
Message-Id: <1412522062-31211-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] package.bbclass: Reverse runtime symlinks should be tied to package generation
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
X-List-Received-Date: Sun, 05 Oct 2014 15:14:37 -0000

In case a package is not generated (is empty and does not has allow
empty flag set) the package data regarding reverse runtime dependency
shouldn't be done.

This were causing a false-positive in the meta-fsl-arm layer, when
building mesa, as:

,----[ Error during build of MX53 in meta-fsl-arm ]
| ERROR: The recipe mesa is trying to install files into a shared area
|  when those files already exist. Those files and their manifest
|  location are:
|    /.../build/build/tmp/sysroots/imx53qsb/pkgdata/runtime-reverse/libopenvg-dev
|    Matched in manifest-imx53qsb-amd-gpu-x11-bin-mx51.packagedata
| Please verify which recipe should provide the above files.
`----

Fixes [YOCTO: #6795]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/package.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a877d28..f17c8d5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1241,10 +1241,6 @@ python emit_pkgdata() {
         sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
         sf.close()
 
-        # Symlinks needed for reverse lookups (from the final package name)
-        subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
-        oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
-        
         # Symlinks needed for rprovides lookup
         if rprov:
             for p in rprov.strip().split():
@@ -1259,6 +1255,10 @@ python emit_pkgdata() {
         os.chdir(root)
         g = glob('*')
         if g or allow_empty == "1":
+            # Symlinks needed for reverse lookups (from the final package name)
+            subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
+            oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
+
             packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
             open(packagedfile, 'w').close()
 
-- 
2.1.1


