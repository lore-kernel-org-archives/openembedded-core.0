Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE7E7DE93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:24:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a39so16569368qtk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=3SBEbdenZEEFDgUYuO7geAYkmT9vHxquG/T1kvlvT3E=;
	b=AxNHu+OYtTtiw4bdeo3YHh0qwo419Dm1C8/P5MR2Ouw0ACRKv/8tzGPyb80iQmjWhv
	tLkkcgKPwYMtF01ER9NK3OcgZy7TklHQRD3qabxK5FjMNxLcFj5t7c0kdRPD+Awh2/OO
	/r3/huIXrYwyEgIj0e+q2WMCh1yigyCLgZsPaDjk7tAqH9Q8U0pAzIDO8rSmdIt4OZM/
	UNgFMzxazXztX65FZW4vlByvfYvYRbEV89d0wciHZZMV2Jm9Q6n5eUryumj2Cx2VDTIi
	lEvRyOvy3tp8w6U0/AucZCtFZ97CGSTKLydk5EGEx8Pwv2JgAzRZPYuzUk2nvo3Lqu0E
	+bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=3SBEbdenZEEFDgUYuO7geAYkmT9vHxquG/T1kvlvT3E=;
	b=naQnwgXhKeGKJrgO6q5uXjmTXGNaLSUGWICtzVFBA8L+g2mMwmwQmf8+yxKTOV+Zta
	wAaXH4ajKY+KChZ+PYEB5aEH4vkQ18WiKywKL45o5O7+9wX7ibMfT17voCBg86vvgEkY
	qoJe9DTCdiQXeDdcvE95+ECJqEyMscRvyF/dPSuw3dg/E63SeCR3voy4Ru+i16rKojUz
	j65Qs5bXD3GtBlCTOQHufn1By+dMmWorBKHsPhf4fvoew+HnY1idkTqw5o1SKArSryIf
	uzcHEU35QtRPO1XUMInjhWjwshhZ08hrd0Y+BMYxWM80ndi+sGam4FRpB24gwVv7xRxy
	Asmw==
X-Gm-Message-State: APjAAAXNIQcNp8tyMl9MwILIRcT7VqdDHhTg1m5s5zO0ZdRdCqeEnnnB
	9ysPb4gkWpUcSn7vUATk3Ywdf6UAw7WJMJ7X35tF77cD
X-Google-Smtp-Source: APXvYqxHGcI1Hh/kIGxnv17S86cEV+cPqby5z9xcLB/BUFLXLr3VdPqzNZ4egCIZ7Q8YasqkFZRh71j1ysK4ef3qJI8=
X-Received: by 2002:ac8:2d35:: with SMTP id n50mr28040985qta.253.1557804245183;
	Mon, 13 May 2019 20:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190510222653.41487-1-raj.khem@gmail.com>
In-Reply-To: <20190510222653.41487-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 23:23:39 -0400
Message-ID: <CAMKF1sonjM_Qhe91SpQ4G4u7sknAW9W36+_7W=_KGbdh4=1_aQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] epiphany: Do not bypass initialization of variable with __attribute__((cleanup))
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
X-List-Received-Date: Tue, 14 May 2019 03:24:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping^1

On Fri, May 10, 2019 at 6:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is reported with clang e.g.
> ../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:=
391:5: error: cannot jump from this goto statement to its label
>     goto out;
>     ^
> ../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:=
398:20: note: jump bypasses initialization of variable with __attribute__((=
cleanup))
>   g_autofree char *app_file =3D g_build_filename (profile_dir, ".app", NU=
LL);
>                    ^
> ../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:=
385:5: error: cannot jump from this goto statement to its label
>     goto out;
>     ^
> ../../../../../../../workspace/sources/epiphany/lib/ephy-web-app-utils.c:=
398:20: note: jump bypasses initialization of variable with __attribute__((=
cleanup))                                                                  =
                                                   g_autofree char *app_fil=
e =3D g_build_filename (profile_dir, ".app", NULL);
>                    ^
>
> Ensure that the initialization is deterministic for goto to work reliably
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Backport a patch instead of doing own
>
>  .../epiphany/epiphany_3.32.1.2.bb             |  1 +
>  ...Clean-up-ephy_web_application_create.patch | 79 +++++++++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-gnome/epiphany/files/0001-web-app-utils-=
Clean-up-ephy_web_application_create.patch
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb b/meta/reci=
pes-gnome/epiphany/epiphany_3.32.1.2.bb
> index ba2e851bb6..49631d92d7 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> @@ -12,6 +12,7 @@ REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>
>  SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOM=
EBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
>             file://0002-help-meson.build-disable-the-use-of-yelp.patch \
> +           file://0001-web-app-utils-Clean-up-ephy_web_application_creat=
e.patch \
>             "
>  SRC_URI[archive.md5sum] =3D "93faec353e9f62519859e6164350fd5d"
>  SRC_URI[archive.sha256sum] =3D "a8284fb9bbc8b7914a154a8eac1598c8b59ae421=
e0d685146fb48198427926be"
> diff --git a/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-u=
p-ephy_web_application_create.patch b/meta/recipes-gnome/epiphany/files/000=
1-web-app-utils-Clean-up-ephy_web_application_create.patch
> new file mode 100644
> index 0000000000..ea644fb985
> --- /dev/null
> +++ b/meta/recipes-gnome/epiphany/files/0001-web-app-utils-Clean-up-ephy_=
web_application_create.patch
> @@ -0,0 +1,79 @@
> +From 49f435217873e679b142f64d3e7def919fb642bb Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@igalia.com>
> +Date: Wed, 8 May 2019 15:58:32 +0000
> +Subject: [PATCH] web-app-utils: Clean up ephy_web_application_create()
> +
> +Fixes #764
> +
> +(cherry picked from commit 4e998d45e4cc549a7ca561a33895b0fbcf7ba6bb)
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/epiphany/commi=
t/a6a022c9c498ad5dcf7f2220644a7520df74ca31]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/ephy-web-app-utils.c | 24 ++++++++++--------------
> + 1 file changed, 10 insertions(+), 14 deletions(-)
> +
> +diff --git a/lib/ephy-web-app-utils.c b/lib/ephy-web-app-utils.c
> +index 97f3f24..fc68a96 100644
> +--- a/lib/ephy-web-app-utils.c
> ++++ b/lib/ephy-web-app-utils.c
> +@@ -374,46 +374,42 @@ ephy_web_application_create (const char *id,
> +                              const char *name,
> +                              GdkPixbuf  *icon)
> + {
> +-  char *profile_dir;
> +-  char *desktop_file_path =3D NULL;
> ++  g_autofree char *app_file =3D NULL;
> ++  g_autofree char *profile_dir =3D NULL;
> ++  g_autofree char *desktop_file_path =3D NULL;
> +
> +   /* If there's already a WebApp profile for the contents of this
> +    * view, do nothing. */
> +   profile_dir =3D ephy_web_application_get_profile_directory (id);
> +   if (g_file_test (profile_dir, G_FILE_TEST_IS_DIR)) {
> +     g_warning ("Profile directory %s already exists", profile_dir);
> +-    goto out;
> ++    return NULL;
> +   }
> +
> +   /* Create the profile directory, populate it. */
> +   if (g_mkdir_with_parents (profile_dir, 488) =3D=3D -1) {
> +     g_warning ("Failed to create directory %s", profile_dir);
> +-    goto out;
> ++    return NULL;
> +   }
> +
> +   /* Skip migration for new web apps. */
> +   ephy_profile_utils_set_migration_version_for_profile_dir (EPHY_PROFIL=
E_MIGRATION_VERSION, profile_dir);
> +
> +   /* Create an .app file. */
> +-  g_autofree char *app_file =3D g_build_filename (profile_dir, ".app", =
NULL);
> ++  app_file =3D g_build_filename (profile_dir, ".app", NULL);
> +   int fd =3D g_open (app_file, O_WRONLY|O_CREAT|O_TRUNC, 0644);
> +   if (fd < 0) {
> +-    LOG ("Failed to create .app file: %s", g_strerror (errno));
> +-    goto out;
> +-  } else {
> +-    close (fd);
> ++    g_warning ("Failed to create .app file: %s", g_strerror (errno));
> ++    return NULL;
> +   }
> ++  close (fd);
> +
> +   /* Create the deskop file. */
> +   desktop_file_path =3D create_desktop_file (id, name, address, profile=
_dir, icon);
> +   if (desktop_file_path)
> +     ephy_web_application_initialize_settings (profile_dir);
> +
> +- out:
> +-  if (profile_dir)
> +-    g_free (profile_dir);
> +-
> +-  return desktop_file_path;
> ++  return g_steal_pointer (&desktop_file_path);
> + }
> +
> + char *
> +--
> +2.21.0
> +
> --
> 2.21.0
>

