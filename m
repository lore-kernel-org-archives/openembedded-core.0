Received: from ford.bithub.de (ford.bithub.de [159.69.22.172])
 by mx.groups.io with SMTP id smtpd.web11.1474.1621279378058127353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 12:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@bithub.de header.s=ford header.b=atU8MMm9;
 spf=pass (domain: bithub.de, ip: 159.69.22.172, mailfrom: philip@bithub.de)
Received: from t420.fritz.box (x4db3605d.dyn.telefonica.de [77.179.96.93])
	by ford.bithub.de (Postfix) with ESMTPSA id 77E7A1FC83;
	Mon, 17 May 2021 21:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bithub.de; s=ford;
	t=1621279376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Gf4mlU5KGewIU3JpoeBmasnwOvI+HvCk1xh8/fFhRc=;
	b=atU8MMm9q0s8B/wXp4dDXmABvgE83PFlgQqZUm7+r6DkfPMohpIWdjY5ojJbZYoBwfsFHZ
	SzMeTQINADp/z8Cl5NI8cNFFE2MrcINZCIN7NweGhIXcrdYm2N6vmMEFKUn0Gw34RKCEDu
	o1uOho+C0fbec77B7I6c3KeLavDqSbtTDvNdNTJJ5qHcCPgT+Uc09kOlEQvNu8vaVB2bXT
	xHsxf4kDjdwiTVPyGX4MdcXYkVGKg9PiEgg9A9WJrFqm+0edls6JeaOL/vUe5pvKGOULxr
	0bM4iDK1ELGnAr9R0ALFixuz54LwHj6V/uZHpRjrteR0RgeCdgmu307EhwVCfA==
From: philip@bithub.de
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip@bithub.de>
Subject: [pseudo][PATCH] wrappers: Avoid -Wcast-function-type warning
Date: Mon, 17 May 2021 21:22:46 +0200
Message-Id: <20210517192246.47874-1-philip@bithub.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

GCC emits this warning for mismatched function types unless the generic
void (*) (void) signature is used ([1]) - e.g.:

  warning: cast between incompatible function types from =E2=80=98int (*)=
(const
  char *)=E2=80=99 to =E2=80=98int (*)(void)=E2=80=99 [-Wcast-function-ty=
pe]

[1] https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wcast-f=
unction-type

Signed-off-by: Philip Lorenz <philip@bithub.de>
---
 ports/linux/pseudo_wrappers.c | 4 ++--
 pseudo_wrappers.c             | 2 +-
 templates/wrapper_table       | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/ports/linux/pseudo_wrappers.c b/ports/linux/pseudo_wrappers.=
c
index ed34115..7659897 100644
--- a/ports/linux/pseudo_wrappers.c
+++ b/ports/linux/pseudo_wrappers.c
@@ -96,7 +96,7 @@ syscall(long number, ...) {
 	 * guess about the number of args; the docs discuss calling conventions
 	 * up to 7, so let's try that?
 	 */
-	void *res =3D __builtin_apply((void (*)()) real_syscall, __builtin_appl=
y_args(), sizeof(long) * 7);
+	void *res =3D __builtin_apply((void (*)(void)) real_syscall, __builtin_=
apply_args(), sizeof(long) * 7);
 	__builtin_return(res);
 }
=20
@@ -137,7 +137,7 @@ prctl(int option, ...) {
 	 * guess about the number of args; the docs discuss calling conventions
 	 * up to 5, so let's try that?
 	 */
-	void *res =3D __builtin_apply((void (*)()) real_prctl, __builtin_apply_=
args(), sizeof(long) * 5);
+	void *res =3D __builtin_apply((void (*)(void)) real_prctl, __builtin_ap=
ply_args(), sizeof(long) * 5);
 	__builtin_return(res);
 }
=20
diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
index 99aabff..9ae1200 100644
--- a/pseudo_wrappers.c
+++ b/pseudo_wrappers.c
@@ -140,7 +140,7 @@ pseudo_init_one_wrapper(pseudo_function *func) {
 #endif
 	f =3D dlsym(RTLD_NEXT, func->name);
 	if (f) {
-		*func->real =3D f;
+		*func->real =3D (void (*)(void)) f;
 	}
 	/* it turns out that in some cases, we get apparently-harmless
 	 * errors if a function is missing, and that printing output
diff --git a/templates/wrapper_table b/templates/wrapper_table
index bb30530..498ca81 100644
--- a/templates/wrapper_table
+++ b/templates/wrapper_table
@@ -6,8 +6,8 @@
  * script if you want to modify this. */
 typedef struct {
 	char *name;		/* the name */
-	int (**real)(void);	/* the underlying syscall */
-	int (*wrapper)(void);	/* the wrapper from guts/name.c */
+	void (**real)(void);	/* the underlying syscall */
+	void (*wrapper)(void);	/* the wrapper from guts/name.c */
 	char *version;		/* the version, if we know and care */
 } pseudo_function;
=20
@@ -15,8 +15,8 @@ static pseudo_function pseudo_functions[] =3D {
 @body
 	{ /* ${comment}; */
 		"${name}${maybe_inode64}",
-		(int (**)(void)) &real_${name},
-		(int (*)(void)) wrap_${name},
+		(void (**)(void)) &real_${name},
+		(void (*)(void)) wrap_${name},
 		${version}
 	},
 @footer
--=20
2.31.1

