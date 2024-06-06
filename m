Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F64C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 12:27:42 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.13031.1717676858495836407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 05:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uQYG+Nn6;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a087bc74bso8817017b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717676857; x=1718281657; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCK1uApeAKXj2hb/5FLimPO70SmUt3Ddd76BG41hP7Q=;
        b=uQYG+Nn665xfhIGsJwDi6SagrCaANF3nql3xaFS35fhYaeqcmfb4HcxqqPaPiXLT6g
         8bjtP9rMZhZfTnQLES71SOE++wO8xzuODKCgKnfjioQTiNcjXU5395WxoTV1p713caib
         6++7IX7zoPly3p4NBkWGj7xZy4i+FpW1PTZQyDvl3YgccPwCcsf0XzRaAAHOesJMKagS
         j748eBvwZyo1NyiYpkLfC0epPG62BsbBEsWniUHvcZOdAAAch6xMao57nbSlXTB+h12E
         4w2NEFH1h4t4FVjgKRhtIfm5XZ8ne8HPLUf62Dgqotfkahwe1GNV/j7EMX46vNwPuPQQ
         cnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717676857; x=1718281657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCK1uApeAKXj2hb/5FLimPO70SmUt3Ddd76BG41hP7Q=;
        b=ilwfotCUhtXF1h5wXHT4v687v/SdpcsCGKNFMQhmiU6r9ULLpuulAGvPZMKbErGTKU
         4OjzhoI8It3+KYsu9oLj8Rl/DTGFwIJk3tbgEfXRIBUHomkJ7tqhmd4fVDou6MaNDd4Q
         IFje8uUBOqQone4BrOMajzVHZ3ZAvvy9RVtpEbaKMcEBDP2PuKG5S3H3kqRy/+T1jhHF
         mpxlBZ1YGmFw6d3d3UCN0Zeb6J5vX6BSOL+O1jB6jP02qyDX27Evh+YrkX3P03AjbU8U
         kiDsjmVZi3r9T2AhOR1AhFrPak8YlN7pKgYN6wfeRiE2UPHkfi0TtRqCVwFNL6W1osp7
         ctTA==
X-Gm-Message-State: AOJu0YzV4X+CDdsQLAY4BM11TsQT7tpkfhR/8Fv+3aFhyXa40D/WntuM
	3nI9GSbRzWJQgnPZ1VSbNF/gRWpZtKkcRThQcUO2laZ/9RE46vsnD/kpXQ+DDIbze4clrQ2wA8d
	k8phB2DgEX+CdWmPcfHCCpn7nzy9gUyHqzx5xlTam9r+HPjP8pmo=
X-Google-Smtp-Source: AGHT+IFk0uCoFDWD5MymYUsv9/VxZYXzaEwi07n3MzazTp25qXwYALyMZOUcsTilxcsZF4lTryanTXrlJokF9aPz0hI=
X-Received: by 2002:a81:4c49:0:b0:617:cbc7:26fe with SMTP id
 00721157ae682-62cbb4c3c1fmr56515707b3.16.1717676855769; Thu, 06 Jun 2024
 05:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240606033233.2634220-1-yi.zhao@windriver.com>
In-Reply-To: <20240606033233.2634220-1-yi.zhao@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 6 Jun 2024 05:27:24 -0700
Message-ID: <CAOSpxdZ_U3=ot4HZtqph3U2RN3e7bK+PgHdmwzB_WG8JxuQn8g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] dpkg: upgrade 1.21.4 -> 1.21.22
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 12:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200400

After reviewing the very large number of changes from 1.21.4 to
1.21.22 I don't think this appropriate for an LTS release:

https://launchpad.net/debian/+source/dpkg/+changelog

Steve

On Wed, Jun 5, 2024 at 8:32=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> ChangeLog:
> https://salsa.debian.org/dpkg-team/dpkg/-/raw/1.21.x/debian/changelog
>
> * Add new dependency libmd
> * Update SRC_URI
> * Refresh patch
> * Drop backport patch
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc           |   4 +-
>  ...ive-Prevent-directory-traversal-for-.patch | 328 ------------------
>  ...s-expect-D-to-be-set-when-running-in.patch |  14 +-
>  .../dpkg/{dpkg_1.21.4.bb =3D> dpkg_1.21.22.bb}  |   5 +-
>  4 files changed, 11 insertions(+), 340 deletions(-)
>  delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Arch=
ive-Prevent-directory-traversal-for-.patch
>  rename meta/recipes-devtools/dpkg/{dpkg_1.21.4.bb =3D> dpkg_1.21.22.bb} =
(86%)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/=
dpkg/dpkg.inc
> index 0d17a98b80..b3e8c05d62 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -4,8 +4,8 @@ HOMEPAGE =3D "https://salsa.debian.org/dpkg-team/dpkg"
>  DESCRIPTION =3D "The primary interface for the dpkg suite is the dselect=
 program. A more low-level and less user-friendly interface is available in=
 the form of the dpkg command."
>  SECTION =3D "base"
>
> -DEPENDS =3D "zlib bzip2 perl ncurses"
> -DEPENDS:class-native =3D "bzip2-replacement-native zlib-native virtual/u=
pdate-alternatives-native gettext-native perl-native"
> +DEPENDS =3D "zlib bzip2 perl ncurses libmd"
> +DEPENDS:class-native =3D "bzip2-replacement-native zlib-native virtual/u=
pdate-alternatives-native gettext-native perl-native libmd-native"
>  RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} perl"
>  RDEPENDS:${PN}:class-native =3D ""
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Pre=
vent-directory-traversal-for-.patch b/meta/recipes-devtools/dpkg/dpkg/0001-=
Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
> deleted file mode 100644
> index d249d854fb..0000000000
> --- a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-di=
rectory-traversal-for-.patch
> +++ /dev/null
> @@ -1,328 +0,0 @@
> -From 6d8a6799639f8853a2af1f9036bc70fddbfdd2a2 Mon Sep 17 00:00:00 2001
> -From: Guillem Jover <guillem@debian.org>
> -Date: Tue, 3 May 2022 02:09:32 +0200
> -Subject: [PATCH] Dpkg::Source::Archive: Prevent directory traversal for
> - in-place extracts
> -
> -For untrusted v2 and v3 source package formats that include a debian.tar
> -archive, when we are extracting it, we do that as an in-place extraction=
,
> -which can lead to directory traversal situations on specially crafted
> -orig.tar and debian.tar tarballs.
> -
> -GNU tar replaces entries on the filesystem by the entries present on
> -the tarball, but it will follow symlinks when the symlink pathname
> -itself is not present as an actual directory on the tarball.
> -
> -This means we can create an orig.tar where there's a symlink pointing
> -out of the source tree root directory, and then a debian.tar that
> -contains an entry within that symlink as if it was a directory, without
> -a directory entry for the symlink pathname itself, which will be
> -extracted following the symlink outside the source tree root.
> -
> -This is currently noted as expected in GNU tar documentation. But even
> -if there was a new extraction mode avoiding this problem we'd need such
> -new version. Using perl's Archive::Tar would solve the problem, but
> -switching to such different pure perl implementation, could cause
> -compatibility or performance issues.
> -
> -What we do is when we are requested to perform an in-place extract, we
> -instead still use a temporary directory, then walk that directory and
> -remove any matching entry in the destination directory, replicating what
> -GNU tar would do, but in addition avoiding the directory traversal issue
> -for symlinks. Which should work with any tar implementation and be safe.
> -
> -Reported-by: Max Justicz <max@justi.cz>
> -Stable-Candidates: 1.18.x 1.19.x 1.20.x
> -Fixes: commit 0c0057a27fecccab77d2b3cffa9a7d172846f0b4 (1.14.17)
> -Fixes: CVE-2022-1664
> -
> -CVE: CVE-2022-1664
> -Upstream-Status: Backport [7a6c03cb34d4a09f35df2f10779cbf1b70a5200b]
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - scripts/Dpkg/Source/Archive.pm  | 122 +++++++++++++++++++++++++-------
> - scripts/t/Dpkg_Source_Archive.t | 110 +++++++++++++++++++++++++++-
> - 2 files changed, 204 insertions(+), 28 deletions(-)
> -
> -diff --git a/scripts/Dpkg/Source/Archive.pm b/scripts/Dpkg/Source/Archiv=
e.pm
> -index 33c181b20..2ddd04af8 100644
> ---- a/scripts/Dpkg/Source/Archive.pm
> -+++ b/scripts/Dpkg/Source/Archive.pm
> -@@ -21,9 +21,11 @@ use warnings;
> - our $VERSION =3D '0.01';
> -
> - use Carp;
> -+use Errno qw(ENOENT);
> - use File::Temp qw(tempdir);
> - use File::Basename qw(basename);
> - use File::Spec;
> -+use File::Find;
> - use Cwd;
> -
> - use Dpkg ();
> -@@ -110,19 +112,13 @@ sub extract {
> -     my %spawn_opts =3D (wait_child =3D> 1);
> -
> -     # Prepare destination
> --    my $tmp;
> --    if ($opts{in_place}) {
> --        $spawn_opts{chdir} =3D $dest;
> --        $tmp =3D $dest; # So that fixperms call works
> --    } else {
> --        my $template =3D basename($self->get_filename()) .  '.tmp-extra=
ct.XXXXX';
> --        unless (-e $dest) {
> --            # Kludge so that realpath works
> --            mkdir($dest) or syserr(g_('cannot create directory %s'), $d=
est);
> --        }
> --        $tmp =3D tempdir($template, DIR =3D> Cwd::realpath("$dest/.."),=
 CLEANUP =3D> 1);
> --        $spawn_opts{chdir} =3D $tmp;
> -+    my $template =3D basename($self->get_filename()) .  '.tmp-extract.X=
XXXX';
> -+    unless (-e $dest) {
> -+        # Kludge so that realpath works
> -+        mkdir($dest) or syserr(g_('cannot create directory %s'), $dest)=
;
> -     }
> -+    my $tmp =3D tempdir($template, DIR =3D> Cwd::realpath("$dest/.."), =
CLEANUP =3D> 1);
> -+    $spawn_opts{chdir} =3D $tmp;
> -
> -     # Prepare stuff that handles the input of tar
> -     $self->ensure_open('r', delete_sig =3D> [ 'PIPE' ]);
> -@@ -145,22 +141,94 @@ sub extract {
> -     # have to be calculated using mount options and other madness.
> -     fixperms($tmp) unless $opts{no_fixperms};
> -
> --    # Stop here if we extracted in-place as there's nothing to move aro=
und
> --    return if $opts{in_place};
> --
> --    # Rename extracted directory
> --    opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $tmp);
> --    my @entries =3D grep { $_ ne '.' && $_ ne '..' } readdir($dir_dh);
> --    closedir($dir_dh);
> --    my $done =3D 0;
> --    erasedir($dest);
> --    if (scalar(@entries) =3D=3D 1 && ! -l "$tmp/$entries[0]" && -d _) {
> --      rename("$tmp/$entries[0]", $dest)
> --          or syserr(g_('unable to rename %s to %s'),
> --                    "$tmp/$entries[0]", $dest);
> -+    # If we are extracting "in-place" do not remove the destination dir=
ectory.
> -+    if ($opts{in_place}) {
> -+        my $canon_basedir =3D Cwd::realpath($dest);
> -+        # On Solaris /dev/null points to /devices/pseudo/mm@0:null.
> -+        my $canon_devnull =3D Cwd::realpath('/dev/null');
> -+        my $check_symlink =3D sub {
> -+            my $pathname =3D shift;
> -+            my $canon_pathname =3D Cwd::realpath($pathname);
> -+            if (not defined $canon_pathname) {
> -+                return if $! =3D=3D ENOENT;
> -+
> -+                syserr(g_("pathname '%s' cannot be canonicalized"), $pa=
thname);
> -+            }
> -+            return if $canon_pathname eq $canon_devnull;
> -+            return if $canon_pathname eq $canon_basedir;
> -+            return if $canon_pathname =3D~ m{^\Q$canon_basedir/\E};
> -+            warning(g_("pathname '%s' points outside source root (to '%=
s')"),
> -+                    $pathname, $canon_pathname);
> -+        };
> -+
> -+        my $move_in_place =3D sub {
> -+            my $relpath =3D File::Spec->abs2rel($File::Find::name, $tmp=
);
> -+            my $destpath =3D File::Spec->catfile($dest, $relpath);
> -+
> -+            my ($mode, $atime, $mtime);
> -+            lstat $File::Find::name
> -+                or syserr(g_('cannot get source pathname %s metadata'),=
 $File::Find::name);
> -+            ((undef) x 2, $mode, (undef) x 5, $atime, $mtime) =3D lstat=
 _;
> -+            my $src_is_dir =3D -d _;
> -+
> -+            my $dest_exists =3D 1;
> -+            if (not lstat $destpath) {
> -+                if ($! =3D=3D ENOENT) {
> -+                    $dest_exists =3D 0;
> -+                } else {
> -+                    syserr(g_('cannot get target pathname %s metadata')=
, $destpath);
> -+                }
> -+            }
> -+            my $dest_is_dir =3D -d _;
> -+            if ($dest_exists) {
> -+                if ($dest_is_dir && $src_is_dir) {
> -+                    # Refresh the destination directory attributes with=
 the
> -+                    # ones from the tarball.
> -+                    chmod $mode, $destpath
> -+                        or syserr(g_('cannot change directory %s mode')=
, $File::Find::name);
> -+                    utime $atime, $mtime, $destpath
> -+                        or syserr(g_('cannot change directory %s times'=
), $File::Find::name);
> -+
> -+                    # We should do nothing, and just walk further tree.
> -+                    return;
> -+                } elsif ($dest_is_dir) {
> -+                    rmdir $destpath
> -+                        or syserr(g_('cannot remove destination directo=
ry %s'), $destpath);
> -+                } else {
> -+                    $check_symlink->($destpath);
> -+                    unlink $destpath
> -+                        or syserr(g_('cannot remove destination file %s=
'), $destpath);
> -+                }
> -+            }
> -+            # If we are moving a directory, we do not need to walk it.
> -+            if ($src_is_dir) {
> -+                $File::Find::prune =3D 1;
> -+            }
> -+            rename $File::Find::name, $destpath
> -+                or syserr(g_('cannot move %s to %s'), $File::Find::name=
, $destpath);
> -+        };
> -+
> -+        find({
> -+            wanted =3D> $move_in_place,
> -+            no_chdir =3D> 1,
> -+            dangling_symlinks =3D> 0,
> -+        }, $tmp);
> -     } else {
> --      rename($tmp, $dest)
> --          or syserr(g_('unable to rename %s to %s'), $tmp, $dest);
> -+        # Rename extracted directory
> -+        opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $t=
mp);
> -+        my @entries =3D grep { $_ ne '.' && $_ ne '..' } readdir($dir_d=
h);
> -+        closedir($dir_dh);
> -+
> -+        erasedir($dest);
> -+
> -+        if (scalar(@entries) =3D=3D 1 && ! -l "$tmp/$entries[0]" && -d =
_) {
> -+            rename("$tmp/$entries[0]", $dest)
> -+                or syserr(g_('unable to rename %s to %s'),
> -+                          "$tmp/$entries[0]", $dest);
> -+        } else {
> -+            rename($tmp, $dest)
> -+                or syserr(g_('unable to rename %s to %s'), $tmp, $dest)=
;
> -+        }
> -     }
> -     erasedir($tmp);
> - }
> -diff --git a/scripts/t/Dpkg_Source_Archive.t b/scripts/t/Dpkg_Source_Arc=
hive.t
> -index 7b70da68e..504fbe1d4 100644
> ---- a/scripts/t/Dpkg_Source_Archive.t
> -+++ b/scripts/t/Dpkg_Source_Archive.t
> -@@ -16,12 +16,120 @@
> - use strict;
> - use warnings;
> -
> --use Test::More tests =3D> 1;
> -+use Test::More tests =3D> 4;
> -+use Test::Dpkg qw(:paths);
> -+
> -+use File::Spec;
> -+use File::Path qw(make_path rmtree);
> -
> - BEGIN {
> -     use_ok('Dpkg::Source::Archive');
> - }
> -
> -+use Dpkg;
> -+
> -+my $tmpdir =3D test_get_temp_path();
> -+
> -+rmtree($tmpdir);
> -+
> -+sub test_touch
> -+{
> -+    my ($name, $data) =3D @_;
> -+
> -+    open my $fh, '>', $name
> -+        or die "cannot touch file $name\n";
> -+    print { $fh } $data if $data;
> -+    close $fh;
> -+}
> -+
> -+sub test_path_escape
> -+{
> -+    my $name =3D shift;
> -+
> -+    my $treedir =3D File::Spec->rel2abs("$tmpdir/$name-tree");
> -+    my $overdir =3D File::Spec->rel2abs("$tmpdir/$name-overlay");
> -+    my $outdir =3D "$tmpdir/$name-out";
> -+    my $expdir =3D "$tmpdir/$name-exp";
> -+
> -+    # This is the base directory, where we are going to be extracting s=
tuff
> -+    # into, which include traps.
> -+    make_path("$treedir/subdir-a");
> -+    test_touch("$treedir/subdir-a/file-a");
> -+    test_touch("$treedir/subdir-a/file-pre-a");
> -+    make_path("$treedir/subdir-b");
> -+    test_touch("$treedir/subdir-b/file-b");
> -+    test_touch("$treedir/subdir-b/file-pre-b");
> -+    symlink File::Spec->abs2rel($outdir, $treedir), "$treedir/symlink-e=
scape";
> -+    symlink File::Spec->abs2rel("$outdir/nonexistent", $treedir), "$tre=
edir/symlink-nonexistent";
> -+    symlink "$treedir/file", "$treedir/symlink-within";
> -+    test_touch("$treedir/supposed-dir");
> -+
> -+    # This is the overlay directory, which we'll pack and extract over =
the
> -+    # base directory.
> -+    make_path($overdir);
> -+    make_path("$overdir/subdir-a/aa");
> -+    test_touch("$overdir/subdir-a/aa/file-aa", 'aa');
> -+    test_touch("$overdir/subdir-a/file-a", 'a');
> -+    make_path("$overdir/subdir-b/bb");
> -+    test_touch("$overdir/subdir-b/bb/file-bb", 'bb');
> -+    test_touch("$overdir/subdir-b/file-b", 'b');
> -+    make_path("$overdir/symlink-escape");
> -+    test_touch("$overdir/symlink-escape/escaped-file", 'escaped');
> -+    test_touch("$overdir/symlink-nonexistent", 'nonexistent');
> -+    make_path("$overdir/symlink-within");
> -+    make_path("$overdir/supposed-dir");
> -+    test_touch("$overdir/supposed-dir/supposed-file", 'something');
> -+
> -+    # Generate overlay tar.
> -+    system($Dpkg::PROGTAR, '-cf', "$overdir.tar", '-C', $overdir, qw(
> -+        subdir-a subdir-b
> -+        symlink-escape/escaped-file symlink-nonexistent symlink-within
> -+        supposed-dir
> -+        )) =3D=3D 0
> -+        or die "cannot create overlay tar archive\n";
> -+
> -+   # This is the expected directory, which we'll be comparing against.
> -+    make_path($expdir);
> -+    system('cp', '-a', $overdir, $expdir) =3D=3D 0
> -+        or die "cannot copy overlay hierarchy into expected directory\n=
";
> -+
> -+    # Store the expected and out reference directories into a tar to co=
mpare
> -+    # its structure against the result reference.
> -+    system($Dpkg::PROGTAR, '-cf', "$expdir.tar", '-C', $overdir, qw(
> -+        subdir-a subdir-b
> -+        symlink-escape/escaped-file symlink-nonexistent symlink-within
> -+        supposed-dir
> -+        ), '-C', $treedir, qw(
> -+        subdir-a/file-pre-a
> -+        subdir-b/file-pre-b
> -+        )) =3D=3D 0
> -+        or die "cannot create expected tar archive\n";
> -+
> -+    # This directory is supposed to remain empty, anything inside impli=
es a
> -+    # directory traversal.
> -+    make_path($outdir);
> -+
> -+    my $warnseen;
> -+    local $SIG{__WARN__} =3D sub { $warnseen =3D $_[0] };
> -+
> -+    # Perform the extraction.
> -+    my $tar =3D Dpkg::Source::Archive->new(filename =3D> "$overdir.tar"=
);
> -+    $tar->extract($treedir, in_place =3D> 1);
> -+
> -+    # Store the result into a tar to compare its structure against a re=
ference.
> -+    system($Dpkg::PROGTAR, '-cf', "$treedir.tar", '-C', $treedir, '.');
> -+
> -+    # Check results
> -+    ok(length $warnseen && $warnseen =3D~ m/points outside source root/=
,
> -+       'expected warning seen');
> -+    ok(system($Dpkg::PROGTAR, '--compare', '-f', "$expdir.tar", '-C', $=
treedir) =3D=3D 0,
> -+       'expected directory matches');
> -+    ok(! -e "$outdir/escaped-file",
> -+       'expected output directory is empty, directory traversal');
> -+}
> -+
> -+test_path_escape('in-place');
> -+
> - # TODO: Add actual test cases.
> -
> - 1;
> ---
> -2.33.0
> -
> diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expec=
t-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-=
Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
> index 75ae848264..5e52427caf 100644
> --- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-=
be-set-when-running-in.patch
> +++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-=
be-set-when-running-in.patch
> @@ -1,4 +1,4 @@
> -From dd11ed66640f79143e42d778b58fdd5a61fb5836 Mon Sep 17 00:00:00 2001
> +From 115fed94be9c61d2a8de21e7d169b5872e9ebd09 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 26 Aug 2015 16:25:45 +0300
>  Subject: [PATCH] Our pre/postinsts expect $D to be set when running in a
> @@ -12,21 +12,21 @@ ALIMON 2016/05/26
>  ALIMON 2017/02/21
>  KKang 2019/02/20
>  ---
> - src/main/script.c | 54 +++--------------------------------------------
> - 1 file changed, 3 insertions(+), 51 deletions(-)
> + src/main/script.c | 53 +++--------------------------------------------
> + 1 file changed, 3 insertions(+), 50 deletions(-)
>
>  diff --git a/src/main/script.c b/src/main/script.c
> -index abe65b6..0edb8f1 100644
> +index b4f369dfa..559a49cc5 100644
>  --- a/src/main/script.c
>  +++ b/src/main/script.c
> -@@ -96,58 +96,10 @@ setexecute(const char *path, struct stat *stab)
> - static const char *
> +@@ -97,58 +97,11 @@ static const char *
>   maintscript_pre_exec(struct command *cmd)
>   {
> +       const char *instdir =3D dpkg_fsys_get_dir();
>  -      const char *admindir =3D dpkg_db_get_dir();
>  -      const char *changedir;
>  -      size_t instdirlen =3D strlen(instdir);
> --
> +
>  -      if (instdirlen > 0 && in_force(FORCE_SCRIPT_CHROOTLESS))
>  -              changedir =3D instdir;
>  -      else
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-dev=
tools/dpkg/dpkg_1.21.22.bb
> similarity index 86%
> rename from meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
> rename to meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
> index 7ef6233ee4..04bcc93321 100644
> --- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
> @@ -1,7 +1,7 @@
>  require dpkg.inc
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
> -SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=3Dhttps;=
branch=3Dmain \
> +SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=3Dhttps;=
branch=3D1.21.x \
>             file://noman.patch \
>             file://remove-tar-no-timestamp.patch \
>             file://arch_pm.patch \
> @@ -14,11 +14,10 @@ SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.gi=
t;protocol=3Dhttps;branch=3Dmain
>             file://0001-dpkg-Support-muslx32-build.patch \
>             file://pager.patch \
>             file://0001-Add-support-for-riscv32-CPU.patch \
> -           file://0001-Dpkg-Source-Archive-Prevent-directory-traversal-f=
or-.patch \
>             "
>
>  SRC_URI:append:class-native =3D " file://0001-build.c-ignore-return-of-1=
-from-tar-cf.patch"
>
> -SRCREV =3D "5563bdb608b3413639b69f1c76567cb66ff1a961"
> +SRCREV =3D "48482e4f16467e05a08aa3b3b8048e08f0024609"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200382): https://lists.openembedded.org/g/openembedde=
d-core/message/200382
> Mute This Topic: https://lists.openembedded.org/mt/106517331/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

