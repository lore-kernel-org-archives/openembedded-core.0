Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ULC62-00032B-3d
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 13:38:24 +0100
Received: by mail-da0-f54.google.com with SMTP id p1so4512378dad.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PkKU3Y39Obbfn59e+1ktg5rwa5+W/hh5DJl/mynnk6U=;
	b=biYoXw7RbQyF/IFZcf+rbgBsHTDeULpgEzp6j1SJ/bw1lcxaU74pBILH19YhF2B7Xz
	kMQNDfe6QQJuO4MkRoQX9IyGBXSeBdudc1EksDG0ecQyIHagwotmsX712GU4ZLDsj/uv
	Xux+/wsC5t2+w2Kk2YF0p+foYY94FQqJjMwH00qOlPyv2Iz5nK6f/HeCZFLd0fNKW2rP
	kHnPFGP/bRAPOzDvNm+Rv1KaYV3qmWn7tGg675q0gIinziPsVeLzigHfsI1lTiCflbMG
	PY+Y9HSr/YOZo2S61MfkzNodIgPjgq9+/lyLTYRRauDGIrZXsL0R7QOUytiaWOrNCy8e
	oUig==
X-Received: by 10.66.117.196 with SMTP id kg4mr26013345pab.95.1364473278415;
	Thu, 28 Mar 2013 05:21:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	hw16sm27534772pab.19.2013.03.28.05.21.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 05:21:17 -0700 (PDT)
Date: Thu, 28 Mar 2013 13:21:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130328122110.GA5105@jama>
References: <cover.1364456659.git.raj.khem@gmail.com>
	<ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ddbbb594a0a4c3ff64bb5e4ce0be895a5e2f0193.1364456659.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: Upgrade to 199
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
X-List-Received-Date: Thu, 28 Mar 2013 12:38:24 -0000
X-Groupsio-MsgNum: 37187
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2013 at 12:48:29AM -0700, Khem Raj wrote:
> udevadm is now moved from /usr/bin to /bin so account for that
> bash completions for udevadm should be packages with udev-utils
> since thats where udevadm itself is, they were in systemd package
> which is not correct location for it
>=20
> Backport patches for readahead fixes on spinning disks
> and to tackle error reported on missing /etc/sysctl.conf

Looks like it creates few new (empty) directories:

WARNING: QA Issue: systemd: Files/directories were installed but not
shipped
  /etc/kernel
  /etc/kernel/install.d
  /usr/lib/kernel
  /usr/lib/kernel/install.d

Doesn't look very useful for our use-case, maybe whole kernel-install
should be in separate package.
http://www.freedesktop.org/software/systemd/man/kernel-install.html

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0002-readahead-chunk-on-spinning-media.patch   |  142 ++++++++++++++=
++++++
>  .../systemd/systemd/0003-readahead-cleanups.patch  |   86 ++++++++++++
>  ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |   33 +++++
>  .../systemd/{systemd_198.bb =3D> systemd_199.bb}     |   11 +-
>  4 files changed, 268 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chun=
k-on-spinning-media.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-clea=
nups.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl=
-Handle-missing-etc-sysctl.conf-proper.patch
>  rename meta/recipes-core/systemd/{systemd_198.bb =3D> systemd_199.bb} (9=
5%)
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-sp=
inning-media.patch b/meta/recipes-core/systemd/systemd/0002-readahead-chunk=
-on-spinning-media.patch
> new file mode 100644
> index 0000000..d57a01c
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-=
media.patch
> @@ -0,0 +1,142 @@
> +Upstream-Status: Backport
> +
> +-Khem 2013/03/28
> +
> +From 94243ef299425d6c7089a7a05c48c9bb8f6cf3da Mon Sep 17 00:00:00 2001
> +From: Auke Kok <auke-jan.h.kok@intel.com>
> +Date: Fri, 22 Mar 2013 15:09:45 -0700
> +Subject: [PATCH 02/17] readahead: chunk on spinning media
> +
> +Readahead has all sorts of bad side effects depending on your
> +storage media. On rotating disks, it may be degrading startup
> +performance if enough requests are queued spanning linearly
> +over all blocks early at boot, and mount, blkid and friends
> +want to insert reads to the start of these block devices after.
> +
> +The end result is that on spinning disks with ext3/4 that udev
> +and mounts take a very long time, and nothing really happens until
> +readahead is completely finished.
> +
> +This has the net effect that the CPU is almost entirely idle
> +for the entire period that readahead is working. We could have
> +finished starting up quite a lot of services in this time if
> +we were smarter at how we do readahead.
> +
> +This patch sorts all requests into 2 second "chunks" and sub-sorts
> +each chunk by block. This adds a single cross-drive seek per "chunk"
> +but has the benefit that we will have a lot of the blocks we need
> +early on in the boot sequence loaded into memory faster.
> +
> +For a comparison of how before/after bootcharts look (ext4 on a
> +mobile 5400rpm 250GB drive) please look at:
> +
> +    http://foo-projects.org/~sofar/blocked-tests/
> +
> +There are bootcharts in the "before" and "after" folders where you
> +should be able to see that many low-level services finish 5-7
> +seconds earlier with the patch applied (after).
> +---
> + Makefile.am                       |    2 +-
> + src/readahead/readahead-collect.c |   28 +++++++++++++++++++++++++---
> + 2 files changed, 26 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 37c1cc2..5861976 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \
> + systemd_readahead_LDADD =3D \
> + 	libsystemd-shared.la \
> + 	libsystemd-daemon.la \
> +-	libudev.la
> ++	libudev.la -lm
> +=20
> + dist_doc_DATA +=3D \
> + 	src/readahead/sd-readahead.c \
> +diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead=
-collect.c
> +index 5d07f47..5d22949 100644
> +--- a/src/readahead/readahead-collect.c
> ++++ b/src/readahead/readahead-collect.c
> +@@ -42,6 +42,7 @@
> + #include <sys/vfs.h>
> + #include <getopt.h>
> + #include <sys/inotify.h>
> ++#include <math.h>
> +=20
> + #ifdef HAVE_FANOTIFY_INIT
> + #include <sys/fanotify.h>
> +@@ -67,6 +68,7 @@
> +  */
> +=20
> + static ReadaheadShared *shared =3D NULL;
> ++static struct timespec starttime;
> +=20
> + /* Avoid collisions with the NULL pointer */
> + #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
> +@@ -205,6 +207,7 @@ static unsigned long fd_first_block(int fd) {
> + struct item {
> +         const char *path;
> +         unsigned long block;
> ++        unsigned long bin;
> + };
> +=20
> + static int qsort_compare(const void *a, const void *b) {
> +@@ -213,6 +216,13 @@ static int qsort_compare(const void *a, const void =
*b) {
> +         i =3D a;
> +         j =3D b;
> +=20
> ++        /* sort by bin first */
> ++        if (i->bin < j->bin)
> ++                return -1;
> ++        if (i->bin > j->bin)
> ++                return 1;
> ++
> ++        /* then sort by sector */
> +         if (i->block < j->block)
> +                 return -1;
> +         if (i->block > j->block)
> +@@ -250,6 +260,8 @@ static int collect(const char *root) {
> +                 goto finish;
> +         }
> +=20
> ++        clock_gettime(CLOCK_MONOTONIC, &starttime);
> ++
> +         /* If there's no pack file yet we lower the kernel readahead
> +          * so that mincore() is accurate. If there is a pack file
> +          * already we assume it is accurate enough so that kernel
> +@@ -447,10 +459,21 @@ static int collect(const char *root) {
> +                                         free(p);
> +                                 else {
> +                                         unsigned long ul;
> ++                                        struct timespec ts;
> ++                                        struct item *entry;
> ++
> ++                                        entry =3D new0(struct item, 1);
> +=20
> +                                         ul =3D fd_first_block(m->fd);
> +=20
> +-                                        if ((k =3D hashmap_put(files, p=
, SECTOR_TO_PTR(ul))) < 0) {
> ++                                        clock_gettime(CLOCK_MONOTONIC, =
&ts);
> ++
> ++                                        entry->block =3D ul;
> ++                                        entry->path =3D strdup(p);
> ++                                        entry->bin =3D round((ts.tv_sec=
 - starttime.tv_sec +
> ++                                                     ((ts.tv_nsec - sta=
rttime.tv_nsec) / 1000000000.0)) / 2.0);
> ++
> ++                                        if ((k =3D hashmap_put(files, p=
, entry)) < 0) {
> +                                                 log_warning("set_put() =
failed: %s", strerror(-k));
> +                                                 free(p);
> +                                         }
> +@@ -518,8 +541,7 @@ done:
> +=20
> +                 j =3D ordered;
> +                 HASHMAP_FOREACH_KEY(q, p, files, i) {
> +-                        j->path =3D p;
> +-                        j->block =3D PTR_TO_SECTOR(q);
> ++                        memcpy(j, q, sizeof(struct item));
> +                         j++;
> +                 }
> +=20
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.pa=
tch b/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
> new file mode 100644
> index 0000000..e0b68df
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
> @@ -0,0 +1,86 @@
> +Upstream-Status: Backport
> +
> +-Khem 2013/03/28
> +
> +From b0640287f784a320661f7206c9ade07b99003fd5 Mon Sep 17 00:00:00 2001
> +From: Auke Kok <auke-jan.h.kok@intel.com>
> +Date: Tue, 26 Mar 2013 11:13:47 -0700
> +Subject: [PATCH 03/17] readahead: cleanups
> +
> +- check for OOM
> +- no need to use floats and round()
> +---
> + Makefile.am                       |    2 +-
> + src/readahead/readahead-collect.c |   20 ++++++++++++++------
> + 2 files changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 5861976..37c1cc2 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \
> + systemd_readahead_LDADD =3D \
> + 	libsystemd-shared.la \
> + 	libsystemd-daemon.la \
> +-	libudev.la -lm
> ++	libudev.la
> +=20
> + dist_doc_DATA +=3D \
> + 	src/readahead/sd-readahead.c \
> +diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead=
-collect.c
> +index 5d22949..e2fd8df 100644
> +--- a/src/readahead/readahead-collect.c
> ++++ b/src/readahead/readahead-collect.c
> +@@ -68,7 +68,7 @@
> +  */
> +=20
> + static ReadaheadShared *shared =3D NULL;
> +-static struct timespec starttime;
> ++static usec_t starttime;
> +=20
> + /* Avoid collisions with the NULL pointer */
> + #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
> +@@ -260,7 +260,7 @@ static int collect(const char *root) {
> +                 goto finish;
> +         }
> +=20
> +-        clock_gettime(CLOCK_MONOTONIC, &starttime);
> ++        starttime =3D now(CLOCK_MONOTONIC);
> +=20
> +         /* If there's no pack file yet we lower the kernel readahead
> +          * so that mincore() is accurate. If there is a pack file
> +@@ -459,19 +459,27 @@ static int collect(const char *root) {
> +                                         free(p);
> +                                 else {
> +                                         unsigned long ul;
> +-                                        struct timespec ts;
> ++                                        usec_t entrytime;
> +                                         struct item *entry;
> +=20
> +                                         entry =3D new0(struct item, 1);
> ++                                        if (!entry) {
> ++                                                r =3D log_oom();
> ++                                                goto finish;
> ++                                        }
> +=20
> +                                         ul =3D fd_first_block(m->fd);
> +=20
> +-                                        clock_gettime(CLOCK_MONOTONIC, =
&ts);
> ++                                        entrytime =3D now(CLOCK_MONOTON=
IC);
> +=20
> +                                         entry->block =3D ul;
> +                                         entry->path =3D strdup(p);
> +-                                        entry->bin =3D round((ts.tv_sec=
 - starttime.tv_sec +
> +-                                                     ((ts.tv_nsec - sta=
rttime.tv_nsec) / 1000000000.0)) / 2.0);
> ++                                        if (!entry->path) {
> ++                                                free(entry);
> ++                                                r =3D log_oom();
> ++                                                goto finish;
> ++                                        }
> ++                                        entry->bin =3D (entrytime - sta=
rttime) / 2000000;
> +=20
> +                                         if ((k =3D hashmap_put(files, p=
, entry)) < 0) {
> +                                                 log_warning("set_put() =
failed: %s", strerror(-k));
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle=
-missing-etc-sysctl.conf-proper.patch b/meta/recipes-core/systemd/systemd/0=
013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
> new file mode 100644
> index 0000000..f2c8e02
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missin=
g-etc-sysctl.conf-proper.patch
> @@ -0,0 +1,33 @@
> +Upstream-Status: Backport
> +
> +-Khem 2013/03/28
> +
> +From 6f6fad96addf6b00b55c98cc0d0d8026b0c1e7ca Mon Sep 17 00:00:00 2001
> +From: Eelco Dolstra <eelco.dolstra@logicblox.com>
> +Date: Wed, 27 Mar 2013 13:41:59 +0100
> +Subject: [PATCH 13/17] systemd-sysctl: Handle missing /etc/sysctl.conf
> + properly
> +
> +Since fabe5c0e5fce730aa66e10a9c4f9fdd443d7aeda, systemd-sysctl returns
> +a non-zero exit code if /etc/sysctl.conf does not exist, due to a
> +broken ENOENT check.
> +---
> + src/sysctl/sysctl.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
> +index 2d43660..79f3f77 100644
> +--- a/src/sysctl/sysctl.c
> ++++ b/src/sysctl/sysctl.c
> +@@ -125,7 +125,7 @@ static int parse_file(Hashmap *sysctl_options, const=
 char *path, bool ignore_eno
> +=20
> +         r =3D search_and_fopen_nulstr(path, "re", conf_file_dirs, &f);
> +         if (r < 0) {
> +-                if (ignore_enoent && errno =3D=3D -ENOENT)
> ++                if (ignore_enoent && r =3D=3D -ENOENT)
> +                         return 0;
> +=20
> +                 log_error("Failed to open file '%s', ignoring: %s", pat=
h, strerror(-r));
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/systemd/systemd_198.bb b/meta/recipes-core=
/systemd/systemd_199.bb
> similarity index 95%
> rename from meta/recipes-core/systemd/systemd_198.bb
> rename to meta/recipes-core/systemd/systemd_199.bb
> index 6a8db51..74b14af 100644
> --- a/meta/recipes-core/systemd/systemd_198.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -23,10 +23,13 @@ SRC_URI =3D "http://www.freedesktop.org/software/syst=
emd/systemd-${PV}.tar.xz \
>             file://var-run.conf \
>             ${UCLIBCPATCHES} \
>             file://00-create-volatile.conf \
> +           file://0002-readahead-chunk-on-spinning-media.patch \
> +           file://0003-readahead-cleanups.patch \
> +           file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-pro=
per.patch \
>             file://init \
>            "
> -SRC_URI[md5sum] =3D "26a75e2a310f8c1c1ea9ec26ddb171c5"
> -SRC_URI[sha256sum] =3D "444492355e5ff0ad99e0691ecaff1081ee8d45901580f47b=
a8b74e56107c71bf"
> +SRC_URI[md5sum] =3D "4bb13f84ce211e93f0141774a90a2322"
> +SRC_URI[sha256sum] =3D "8c4462a04f3ecf7f083782e5e0687913b1d33c6444bf20fa=
2f31df9222965fed"
> =20
>  UCLIBCPATCHES =3D ""
>  UCLIBCPATCHES_libc-uclibc =3D "file://systemd-pam-configure-check-uclibc=
=2Epatch \
> @@ -114,7 +117,7 @@ PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
>  PACKAGES =3D+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-anal=
yze"
> =20
>  USERADD_PACKAGES =3D "${PN}"
> -GROUPADD_PARAM_${PN} =3D "-r lock"
> +GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
> =20
>  FILES_${PN}-analyze =3D "${base_bindir}/systemd-analyze"
> =20
> @@ -224,7 +227,7 @@ FILES_udev +=3D "${base_sbindir}/udevd \
>  FILES_udev-consolekit +=3D "/lib/ConsoleKit"
>  RDEPENDS_udev-consolekit +=3D "${@base_contains('DISTRO_FEATURES', 'x11'=
, 'consolekit', '', d)}"
> =20
> -FILES_udev-utils =3D "${bindir}/udevadm"
> +FILES_udev-utils =3D "${base_bindir}/udevadm ${datadir}/bash-completion/=
completions/udevadm"
> =20
>  FILES_udev-hwdb =3D "${base_libdir}/udev/hwdb.d"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFUNbYACgkQN1Ujt2V2gBw1bgCfUCJVejPuDgQmnUz1C4KN0Btm
xjUAn1uGFkrrQN+8Ie+hRfHoCEFhNl63
=RQBj
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
