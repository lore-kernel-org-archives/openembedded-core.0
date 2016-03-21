Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2B260290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:25:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2L9PrSH022252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:25:53 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 02:25:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2016 02:25:49 -0700
Message-ID: <5d8eede8b5f8fa67fc8a341abdaabfd66f0a3dd4.1458551516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1458551516.git.liezhi.yang@windriver.com>
References: <cover.1458551516.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] rpm: check _gpg_passphrase before ask for input
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
X-List-Received-Date: Mon, 21 Mar 2016 09:25:53 -0000
Content-Type: text/plain

rpm always asked for pass phrasae when add signature, which made it
can't work non-interactively, this patch fix the problem. It will work
non-interactively if _gpg_passphrase is defined, and work as before if
not.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...heck-_gpg_passphrase-before-ask-for-input.patch |   70 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |    1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch b/meta/recipes-devtools/rpm/rpm/rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch
new file mode 100644
index 0000000..c68681c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch
@@ -0,0 +1,70 @@
+From bb48dbc88a58bc05a43d71a3375fb05358119ec5 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 20 Mar 2016 20:20:16 -0700
+Subject: [PATCH] rpmqv.c: check _gpg_passphrase before ask for input
+
+rpm always asked for pass phrasae when add signature, which made it
+can't work non-interactively, this patch fix the problem. It will work
+non-interactively if _gpg_passphrase is defined, and work as before if
+not.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ macros/macros.in |    7 +++++--
+ rpmqv.c          |   17 ++++++++++-------
+ 2 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/macros/macros.in b/macros/macros.in
+index 2e5b07d..01b3aad 100644
+--- a/macros/macros.in
++++ b/macros/macros.in
+@@ -520,15 +520,18 @@ $_arbitrary_tags_tests	Foo:Bar
+ #	Macro(s) to hold the arguments passed to GPG/PGP for package
+ #	signing and verification.
+ #
++
++%_gpg_passphrase_way %{?_gpg_passphrase:--passphrase "%{_gpg_passphrase}"}%{!?_gpg_passphrase:--passphrase-fd 3}
++
+ %__gpg_check_password_cmd	%{__gpg} \
+-	gpg --batch --no-verbose --passphrase-fd 3 -u "%{_gpg_name}" -so -
++	gpg --batch --no-verbose %{_gpg_passphrase_way} -u "%{_gpg_name}" -so -
+ #%__pgp_check_password_cmd	%{__pgp} \
+ #	pgp +batchmode=on +verbose=0 "%{_pgp_name}" -sf
+ #%__pgp5_check_password_cmd	%{__pgp} \
+ #	pgps +batchmode=on +verbose=0 +armor=off "%{_pgp_name}" -f
+ 
+ %__gpg_sign_cmd			%{__gpg} \
+-	gpg --batch --no-verbose --no-armor --passphrase-fd 3 --no-secmem-warning \
++	gpg --batch --no-verbose --no-armor %{_gpg_passphrase_way}  --no-secmem-warning \
+ 	-u "%{_gpg_name}" -sbo %{__signature_filename} %{__plaintext_filename}
+ #%__pgp_sign_cmd			%{__pgp} \
+ #	pgp +batchmode=on +verbose=0 +armor=off \
+diff --git a/rpmqv.c b/rpmqv.c
+index b306486..7604396 100644
+--- a/rpmqv.c
++++ b/rpmqv.c
+@@ -831,13 +831,16 @@ int main(int argc, const char ** argv)
+ #endif
+ 	    )
+ 	    {
+-		passPhrase = Getpass(_("Enter pass phrase: "));
+-		if (rpmCheckPassPhrase(passPhrase)) {
+-		    fprintf(stderr, _("Pass phrase check failed\n"));
+-		    ec = EXIT_FAILURE;
+-		    goto exit;
++		passPhrase = rpmExpand("%{?_gpg_passphrase}", NULL);
++		if (passPhrase == NULL || passPhrase[0] == '\0') {
++			passPhrase = Getpass(_("Enter pass phrase: "));
++			if (rpmCheckPassPhrase(passPhrase)) {
++			    fprintf(stderr, _("Pass phrase check failed\n"));
++			    ec = EXIT_FAILURE;
++			    goto exit;
++			}
++			fprintf(stderr, _("Pass phrase is good.\n"));
+ 		}
+-		fprintf(stderr, _("Pass phrase is good.\n"));
+ 		/* XXX Getpass() should realloc instead. */
+ 		passPhrase = xstrdup(passPhrase);
+ 	    }
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index eba043e..7621f8f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -114,6 +114,7 @@ SRC_URI += " \
 	   file://rpm-python-AddErase.patch \
 	   file://rpm-rpmpgp-popt.patch \
 	   file://rpm-fix-lua-tests-compilation-failure.patch \
+	   file://rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch \
 "
 
 # OE specific changes
-- 
1.7.9.5


