Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UWqFk-00022W-Mf
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 17:44:36 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3TFQSIi025330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 29 Apr 2013 17:26:29 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UWpyF-0000h5-LK; Mon, 29 Apr 2013 17:26:27 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 17:26:17 +0200
Message-Id: <1367249183-2579-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.96
X-Spam-Score: -6.4
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.cvg.de id
	r3TFQSIi025330
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/7] bitbake.conf: fix definition of ${libexecdir}
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
X-List-Received-Date: Mon, 29 Apr 2013 15:44:49 -0000
X-List-Received-Date: Mon, 29 Apr 2013 15:44:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The GNU standard requires that

  The definition of =E2=80=98libexecdir=E2=80=99 is the same for all pack=
ages
  [http://www.gnu.org/prep/standards/html_node/Directory-Variables.html]

This means that it must not contain neither:

* multilib qualifiers, nor
* the package name

The recent definition of libexecdir violates this because it can
expand e.g. to

* /usr/lib64/openssh for a 64 bit openssh.bb and
* /usr/lib/dropbear for a 32 bit dropbear.bb

Calls of the 32 bit dropbear to ${libexecdir}/sftp-server will fail
hence.

Patch sets libexecdir to '/usr/lib' as done e.g. by Debian.  Because the
patch changes some basic variables, requires changes of recipes
packaging wildcard '${libexecdir}/*' and can cause silent breakage,
further testing of the generated images is needed and the patch is not
applicable to Dylan.

Wildcard '${libexecdir}/*' in FILES list must be removed after this
change because '${libexecdir}' can become equal to '${libdir}' and these
directories require a different packaging.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1f4fbc5..9b864ec 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -38,7 +38,7 @@ export systemd_unitdir =3D "/lib/systemd"
 export bindir =3D "${exec_prefix}/bin"
 export sbindir =3D "${exec_prefix}/sbin"
 export libdir =3D "${exec_prefix}/${baselib}"
-export libexecdir =3D "${libdir}/${BPN}"
+export libexecdir =3D "${exec_prefix}/lib"
 export includedir =3D "${exec_prefix}/include"
 export oldincludedir =3D "${exec_prefix}/include"
 localedir =3D "${libdir}/locale"
@@ -52,7 +52,7 @@ bindir_native =3D "${prefix_native}/bin"
 sbindir_native =3D "${prefix_native}/sbin"
 includedir_native =3D "${prefix_native}/include"
 libdir_native =3D "${prefix_native}/lib"
-libexecdir_native =3D "${libdir_native}/${BPN}"
+libexecdir_native =3D "${prefix_native}/lib"
 base_libdir_native =3D "/lib"
 datadir_native =3D "${prefix_native}/share"
 bindir_cross =3D "/bin"
--=20
1.8.1.4



