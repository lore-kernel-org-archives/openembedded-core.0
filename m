Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U3qEh-0001RK-Pn
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 16:51:35 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Fri, 8 Feb 2013
	16:35:40 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 131BC291D4C;
	Fri,  8 Feb 2013 16:35:41 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Feb 2013 16:35:33 +0100
Message-ID: <1360337733-51730-3-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1360337733-51730-1-git-send-email-bjst@enea.com>
References: <1360337733-51730-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 2/2] libiconv: Remove RPATH from binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 15:51:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Modify libtool to not add RPATH.
This solves https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2669

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-support/libiconv/libiconv_1.14.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-=
support/libiconv/libiconv_1.14.bb
index 6666866..b1d2612 100644
--- a/meta/recipes-support/libiconv/libiconv_1.14.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -34,6 +34,12 @@ do_configure_prepend () {
 	rm -f m4/libtool.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4 m4/lt~o=
bsolete.m4 libcharset/m4/libtool.m4 libcharset/m4/ltoptions.m4 libcharset/m=
4/ltsugar.m4 libcharset/m4/ltversion.m4 libcharset/m4/lt~obsolete.m4
 }
=20
+do_configure_append () {
+        # forcibly remove RPATH from libtool
+        sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spe=
c=3D""|g' *libtool
+        sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3D_NO_RPATH_|g' *=
libtool
+}
+
 do_install_append () {
 	rm -rf ${D}${libdir}/preloadable_libiconv.so
 	rm -rf ${D}${libdir}/charset.alias
--=20
1.7.5.4



