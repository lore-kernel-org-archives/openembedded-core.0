Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F388C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 10:13:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.56278.1749464010169059027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 03:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8255fda859=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55980AeA011547
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 03:13:30 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm1bee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 03:13:29 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 9 Jun 2025 03:13:27 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 9 Jun 2025 03:13:25 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][scarthgap][PATCH 1/1] python3: fix CVE-2024-12718, CVE-2025-4138, CVE-2025-4330, CVE-2025-4517
Date: Mon, 9 Jun 2025 15:43:20 +0530
Message-ID: <20250609101320.760434-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: WiJYtPOOXYYghBr907MT-qDAB1i82AV5
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6846b3c9 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=8AHkEIZyAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=t_lgowvus_p8ynNJMCIA:9 a=mc40v0PPJcZVs2WP:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA3OCBTYWx0ZWRfX1vRmSFYB1Nqt cnkNwSYJ6hg+aOj5E+Oks1vcYEcm+6sYF3e4qrbcJ8sXBBcNdXrdALgdMIojYb3QHBMoN9OqtXF vZ3aJit6SkxaB9cmYDJEWctuS/OUy9qRcGN/4XgvcC+veI+M5ocZnCwOFna6hd0Ojq0BvbRC3Ec
 LxyHFKY0dBLA7DQRCzXESCy94vDwbFT6IzRazKFNV/4fyu1uNMDp6HiBWnLsgmzQCxqS2X5Bct9 B/Ep4oE1tQ6rtgLuEsjNVKvIWpThnAZKtT/a3AWiXnf5z3O4jzFQUWVhpc4es+91wsxbGUJQQGZ twoCOAZYc/zZd0Ia4kFTPlSJWa5cFs+HfwGGJiiAap/IQnvuNqNsB5W1bgtXq20Gt1izsnZ+1oY
 zaLESn84npdWpjf/6KZwetu+rDeneXmkYPZTuB3lgyxugbhKpmSZOT9/KH4pjrd2hjKNsbj5
X-Proofpoint-ORIG-GUID: WiJYtPOOXYYghBr907MT-qDAB1i82AV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55980AeA011547
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 10:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218265

CVE-2024-12718:
Allows modifying some file metadata (e.g. last modified) with
filter=3D"data" or file permissions (chmod) with filter=3D"tar" of files
outside the extraction directory. You are affected by this
vulnerability if using the tarfile module to extract untrusted tar
archives using TarFile.extractall() or TarFile.extract() using the
filter=3D parameter with a value of "data" or "tar".

CVE-2025-4138:
Allows the extraction filter to be ignored, allowing
symlink targets to point outside the destination directory, and the
modification of some file metadata. You are affected by this
vulnerability if using the tarfile module to extract untrusted tar
archives using TarFile.extractall() or TarFile.extract() using the
filter=3D parameter with a value of "data" or "tar".

CVE-2025-4330:
Allows the extraction filter to be ignored,
allowing symlink targets to point outside the destination directory,
and the modification of some file metadata. You are affected by this
vulnerability if using the tarfile module to extract untrusted tar
archives using TarFile.extractall() or TarFile.extract() using the
filter=3D parameter with a value of "data" or "tar".

CVE-2025-4517:
Allows arbitrary filesystem writes outside the extraction directory
during extraction with filter=3D"data". You are affected by this
vulnerability if using the tarfile module to extract untrusted
tar archives using TarFile.extractall() or TarFile.extract() using the
filter=3D parameter with a value of "data" or "tar".

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-12718
https://nvd.nist.gov/vuln/detail/CVE-2025-4138
https://nvd.nist.gov/vuln/detail/CVE-2025-4330
https://nvd.nist.gov/vuln/detail/CVE-2025-4517

Upstream-patch:
https://github.com/python/cpython/commit/19de092debb3d7e832e5672cc2f7b788=
d35951da

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 ...ormalize-link-targets-in-tarfile-add.patch | 1956 +++++++++++++++++
 .../recipes-devtools/python/python3_3.12.9.bb |    1 +
 2 files changed, 1957 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-3.12-gh-135=
034-Normalize-link-targets-in-tarfile-add.patch

diff --git a/meta/recipes-devtools/python/python3/0001-3.12-gh-135034-Nor=
malize-link-targets-in-tarfile-add.patch b/meta/recipes-devtools/python/p=
ython3/0001-3.12-gh-135034-Normalize-link-targets-in-tarfile-add.patch
new file mode 100644
index 0000000000..27d20b230b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-3.12-gh-135034-Normalize-=
link-targets-in-tarfile-add.patch
@@ -0,0 +1,1956 @@
+From 19de092debb3d7e832e5672cc2f7b788d35951da Mon Sep 17 00:00:00 2001
+From: T. Wouters <thomas@python.org>
+Date: Tue, 3 Jun 2025 16:00:21 +0200
+Subject: [PATCH] [3.12] gh-135034: Normalize link targets in tarfile, ad=
d
+ `os.path.realpath(strict=3D'allow_missing')` (GH-135037) (GH-135066)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Addresses CVEs 2024-12718, 2025-4138, 2025-4330, and 2025-4517.
+
+(cherry picked from commit 3612d8f51741b11f36f8fb0494d79086bac9390a)
+
+Co-authored-by: =C5=81ukasz Langa <lukasz@langa.pl>
+Signed-off-by: =C5=81ukasz Langa <lukasz@langa.pl>
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Seth Michael Larson <seth@python.org>
+Co-authored-by: Adam Turner <9087854+AA-Turner@users.noreply.github.com>
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+(cherry picked from commit 19de092debb3d7e832e5672cc2f7b788d35951da)
+
+CVE: CVE-2024-12718, CVE-2025-4138, CVE-2025-4330, CVE-2025-4517
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/19de=
092debb3d7e832e5672cc2f7b788d35951da]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ Doc/library/os.path.rst                       |  33 +-
+ Doc/library/tarfile.rst                       |  20 ++
+ Doc/whatsnew/3.12.rst                         |  34 ++
+ Lib/genericpath.py                            |  11 +-
+ Lib/ntpath.py                                 |  37 ++-
+ Lib/posixpath.py                              |  15 +-
+ Lib/tarfile.py                                | 161 +++++++--
+ Lib/test/test_ntpath.py                       | 284 ++++++++++++++--
+ Lib/test/test_posixpath.py                    | 289 +++++++++++++---
+ Lib/test/test_tarfile.py                      | 313 ++++++++++++++++--
+ ...-06-02-11-32-23.gh-issue-135034.RLGjbp.rst |   6 +
+ 11 files changed, 1064 insertions(+), 139 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2025-06-02-11-32-23.gh-iss=
ue-135034.RLGjbp.rst
+
+diff --git a/Doc/library/os.path.rst b/Doc/library/os.path.rst
+index 51e89087e7f..f5e684f2ccf 100644
+--- a/Doc/library/os.path.rst
++++ b/Doc/library/os.path.rst
+@@ -377,10 +377,26 @@ the :mod:`glob` module.)
+    links encountered in the path (if they are supported by the operatin=
g
+    system).
+
+-   If a path doesn't exist or a symlink loop is encountered, and *stric=
t* is
+-   ``True``, :exc:`OSError` is raised. If *strict* is ``False``, the pa=
th is
+-   resolved as far as possible and any remainder is appended without ch=
ecking
+-   whether it exists.
++   By default, the path is evaluated up to the first component that doe=
s not
++   exist, is a symlink loop, or whose evaluation raises :exc:`OSError`.
++   All such components are appended unchanged to the existing part of t=
he path.
++
++   Some errors that are handled this way include "access denied", "not =
a
++   directory", or "bad argument to internal function". Thus, the
++   resulting path may be missing or inaccessible, may still contain
++   links or loops, and may traverse non-directories.
++
++   This behavior can be modified by keyword arguments:
++
++   If *strict* is ``True``, the first error encountered when evaluating=
 the path is
++   re-raised.
++   In particular, :exc:`FileNotFoundError` is raised if *path* does not=
 exist,
++   or another :exc:`OSError` if it is otherwise inaccessible.
++
++   If *strict* is :py:data:`os.path.ALLOW_MISSING`, errors other than
++   :exc:`FileNotFoundError` are re-raised (as with ``strict=3DTrue``).
++   Thus, the returned path will not contain any symbolic links, but the=
 named
++   file and some of its parent directories may be missing.
+
+    .. note::
+       This function emulates the operating system's procedure for makin=
g a path
+@@ -399,6 +415,15 @@ the :mod:`glob` module.)
+    .. versionchanged:: 3.10
+       The *strict* parameter was added.
+
++   .. versionchanged:: next
++      The :py:data:`~os.path.ALLOW_MISSING` value for the *strict* para=
meter
++      was added.
++
++.. data:: ALLOW_MISSING
++
++   Special value used for the *strict* argument in :func:`realpath`.
++
++   .. versionadded:: next
+
+ .. function:: relpath(path, start=3Dos.curdir)
+
+diff --git a/Doc/library/tarfile.rst b/Doc/library/tarfile.rst
+index 0352cddb16e..a2403b70e29 100644
+--- a/Doc/library/tarfile.rst
++++ b/Doc/library/tarfile.rst
+@@ -249,6 +249,15 @@ The :mod:`tarfile` module defines the following exc=
eptions:
+    Raised to refuse extracting a symbolic link pointing outside the des=
tination
+    directory.
+
++.. exception:: LinkFallbackError
++
++   Raised to refuse emulating a link (hard or symbolic) by extracting a=
nother
++   archive member, when that member would be rejected by the filter loc=
ation.
++   The exception that was raised to reject the replacement member is av=
ailable
++   as :attr:`!BaseException.__context__`.
++
++   .. versionadded:: next
++
+
+ The following constants are available at the module level:
+
+@@ -1039,6 +1048,12 @@ reused in custom filters:
+   Implements the ``'data'`` filter.
+   In addition to what ``tar_filter`` does:
+
++  - Normalize link targets (:attr:`TarInfo.linkname`) using
++    :func:`os.path.normpath`.
++    Note that this removes internal ``..`` components, which may change=
 the
++    meaning of the link if the path in :attr:`!TarInfo.linkname` traver=
ses
++    symbolic links.
++
+   - :ref:`Refuse <tarfile-extraction-refuse>` to extract links (hard or=
 soft)
+     that link to absolute paths, or ones that link outside the destinat=
ion.
+
+@@ -1067,6 +1082,10 @@ reused in custom filters:
+
+   Return the modified ``TarInfo`` member.
+
++  .. versionchanged:: next
++
++     Link targets are now normalized.
++
+
+ .. _tarfile-extraction-refuse:
+
+@@ -1093,6 +1112,7 @@ Here is an incomplete list of things to consider:
+ * Extract to a :func:`new temporary directory <tempfile.mkdtemp>`
+   to prevent e.g. exploiting pre-existing links, and to make it easier =
to
+   clean up after a failed extraction.
++* Disallow symbolic links if you do not need the functionality.
+ * When working with untrusted data, use external (e.g. OS-level) limits=
 on
+   disk, memory and CPU usage.
+ * Check filenames against an allow-list of characters
+diff --git a/Doc/whatsnew/3.12.rst b/Doc/whatsnew/3.12.rst
+index add932b47d7..605ea0b8d42 100644
+--- a/Doc/whatsnew/3.12.rst
++++ b/Doc/whatsnew/3.12.rst
+@@ -2312,3 +2312,37 @@ sys
+ * The previously undocumented special function :func:`sys.getobjects`,
+   which only exists in specialized builds of Python, may now return obj=
ects
+   from other interpreters than the one it's called in.
++
++
++Notable changes in 3.12.10
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
++
++os.path
++-------
++
++* The *strict* parameter to :func:`os.path.realpath` accepts a new valu=
e,
++  :data:`os.path.ALLOW_MISSING`.
++  If used, errors other than :exc:`FileNotFoundError` will be re-raised=
;
++  the resulting path can be missing but it will be free of symlinks.
++  (Contributed by Petr Viktorin for :cve:`2025-4517`.)
++
++tarfile
++-------
++
++* :func:`~tarfile.data_filter` now normalizes symbolic link targets in =
order to
++  avoid path traversal attacks.
++  (Contributed by Petr Viktorin in :gh:`127987` and :cve:`2025-4138`.)
++* :func:`~tarfile.TarFile.extractall` now skips fixing up directory att=
ributes
++  when a directory was removed or replaced by another kind of file.
++  (Contributed by Petr Viktorin in :gh:`127987` and :cve:`2024-12718`.)
++* :func:`~tarfile.TarFile.extract` and :func:`~tarfile.TarFile.extracta=
ll`
++  now (re-)apply the extraction filter when substituting a link (hard o=
r
++  symbolic) with a copy of another archive member, and when fixing up
++  directory attributes.
++  The former raises a new exception, :exc:`~tarfile.LinkFallbackError`.
++  (Contributed by Petr Viktorin for :cve:`2025-4330` and :cve:`2024-127=
18`.)
++* :func:`~tarfile.TarFile.extract` and :func:`~tarfile.TarFile.extracta=
ll`
++  no longer extract rejected members when
++  :func:`~tarfile.TarFile.errorlevel` is zero.
++  (Contributed by Matt Prodani and Petr Viktorin in :gh:`112887`
++  and :cve:`2025-4435`.)
+diff --git a/Lib/genericpath.py b/Lib/genericpath.py
+index 1bd5b3897c3..233f7a3c67d 100644
+--- a/Lib/genericpath.py
++++ b/Lib/genericpath.py
+@@ -8,7 +8,7 @@
+
+ __all__ =3D ['commonprefix', 'exists', 'getatime', 'getctime', 'getmtim=
e',
+            'getsize', 'isdir', 'isfile', 'islink', 'samefile', 'sameope=
nfile',
+-           'samestat']
++           'samestat', 'ALLOW_MISSING']
+
+
+ # Does a path exist?
+@@ -165,3 +165,12 @@ def _check_arg_types(funcname, *args):
+                             f'os.PathLike object, not {s.__class__.__na=
me__!r}') from None
+     if hasstr and hasbytes:
+         raise TypeError("Can't mix strings and bytes in path components=
") from None
++
++# A singleton with a true boolean value.
++@object.__new__
++class ALLOW_MISSING:
++    """Special value for use in realpath()."""
++    def __repr__(self):
++        return 'os.path.ALLOW_MISSING'
++    def __reduce__(self):
++        return self.__class__.__name__
+diff --git a/Lib/ntpath.py b/Lib/ntpath.py
+index c05e965fcb9..1bef630bd9c 100644
+--- a/Lib/ntpath.py
++++ b/Lib/ntpath.py
+@@ -30,7 +30,8 @@
+            "ismount", "expanduser","expandvars","normpath","abspath",
+            "curdir","pardir","sep","pathsep","defpath","altsep",
+            "extsep","devnull","realpath","supports_unicode_filenames","=
relpath",
+-           "samefile", "sameopenfile", "samestat", "commonpath", "isjun=
ction"]
++           "samefile", "sameopenfile", "samestat", "commonpath", "isjun=
ction",
++           "ALLOW_MISSING"]
+
+ def _get_bothseps(path):
+     if isinstance(path, bytes):
+@@ -609,9 +610,10 @@ def abspath(path):
+     from nt import _getfinalpathname, readlink as _nt_readlink
+ except ImportError:
+     # realpath is a no-op on systems without _getfinalpathname support.
+-    realpath =3D abspath
++    def realpath(path, *, strict=3DFalse):
++        return abspath(path)
+ else:
+-    def _readlink_deep(path):
++    def _readlink_deep(path, ignored_error=3DOSError):
+         # These error codes indicate that we should stop reading links =
and
+         # return the path we currently have.
+         # 1: ERROR_INVALID_FUNCTION
+@@ -644,7 +646,7 @@ def _readlink_deep(path):
+                         path =3D old_path
+                         break
+                     path =3D normpath(join(dirname(old_path), path))
+-            except OSError as ex:
++            except ignored_error as ex:
+                 if ex.winerror in allowed_winerror:
+                     break
+                 raise
+@@ -653,7 +655,7 @@ def _readlink_deep(path):
+                 break
+         return path
+
+-    def _getfinalpathname_nonstrict(path):
++    def _getfinalpathname_nonstrict(path, ignored_error=3DOSError):
+         # These error codes indicate that we should stop resolving the =
path
+         # and return the value we currently have.
+         # 1: ERROR_INVALID_FUNCTION
+@@ -680,17 +682,18 @@ def _getfinalpathname_nonstrict(path):
+             try:
+                 path =3D _getfinalpathname(path)
+                 return join(path, tail) if tail else path
+-            except OSError as ex:
++            except ignored_error as ex:
+                 if ex.winerror not in allowed_winerror:
+                     raise
+                 try:
+                     # The OS could not resolve this path fully, so we a=
ttempt
+                     # to follow the link ourselves. If we succeed, join=
 the tail
+                     # and return.
+-                    new_path =3D _readlink_deep(path)
++                    new_path =3D _readlink_deep(path,
++                                              ignored_error=3Dignored_e=
rror)
+                     if new_path !=3D path:
+                         return join(new_path, tail) if tail else new_pa=
th
+-                except OSError:
++                except ignored_error:
+                     # If we fail to readlink(), let's keep traversing
+                     pass
+                 path, name =3D split(path)
+@@ -721,6 +724,15 @@ def realpath(path, *, strict=3DFalse):
+             if normcase(path) =3D=3D normcase(devnull):
+                 return '\\\\.\\NUL'
+         had_prefix =3D path.startswith(prefix)
++
++        if strict is ALLOW_MISSING:
++            ignored_error =3D FileNotFoundError
++            strict =3D True
++        elif strict:
++            ignored_error =3D ()
++        else:
++            ignored_error =3D OSError
++
+         if not had_prefix and not isabs(path):
+             path =3D join(cwd, path)
+         try:
+@@ -728,17 +740,16 @@ def realpath(path, *, strict=3DFalse):
+             initial_winerror =3D 0
+         except ValueError as ex:
+             # gh-106242: Raised for embedded null characters
+-            # In strict mode, we convert into an OSError.
++            # In strict modes, we convert into an OSError.
+             # Non-strict mode returns the path as-is, since we've alrea=
dy
+             # made it absolute.
+             if strict:
+                 raise OSError(str(ex)) from None
+             path =3D normpath(path)
+-        except OSError as ex:
+-            if strict:
+-                raise
++        except ignored_error as ex:
+             initial_winerror =3D ex.winerror
+-            path =3D _getfinalpathname_nonstrict(path)
++            path =3D _getfinalpathname_nonstrict(path,
++                                               ignored_error=3Dignored_=
error)
+         # The path returned by _getfinalpathname will always start with=
 \\?\ -
+         # strip off that prefix unless it was already provided on the o=
riginal
+         # path.
+diff --git a/Lib/posixpath.py b/Lib/posixpath.py
+index f1e4237b3aa..90a6f545f90 100644
+--- a/Lib/posixpath.py
++++ b/Lib/posixpath.py
+@@ -35,7 +35,7 @@
+            "samefile","sameopenfile","samestat",
+            "curdir","pardir","sep","pathsep","defpath","altsep","extsep=
",
+            "devnull","realpath","supports_unicode_filenames","relpath",
+-           "commonpath", "isjunction"]
++           "commonpath", "isjunction", "ALLOW_MISSING"]
+
+
+ def _get_sep(path):
+@@ -438,6 +438,15 @@ def _joinrealpath(path, rest, strict, seen):
+         sep =3D '/'
+         curdir =3D '.'
+         pardir =3D '..'
++        getcwd =3D os.getcwd
++    if strict is ALLOW_MISSING:
++        ignored_error =3D FileNotFoundError
++    elif strict:
++        ignored_error =3D ()
++    else:
++        ignored_error =3D OSError
++
++    maxlinks =3D None
+
+     if isabs(rest):
+         rest =3D rest[1:]
+@@ -460,9 +469,7 @@ def _joinrealpath(path, rest, strict, seen):
+         newpath =3D join(path, name)
+         try:
+             st =3D os.lstat(newpath)
+-        except OSError:
+-            if strict:
+-                raise
++        except ignored_error:
+             is_link =3D False
+         else:
+             is_link =3D stat.S_ISLNK(st.st_mode)
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 0a0f31eca06..9999a99d54d 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -752,10 +752,22 @@ def __init__(self, tarinfo, path):
+         super().__init__(f'{tarinfo.name!r} would link to {path!r}, '
+                          + 'which is outside the destination')
+
++class LinkFallbackError(FilterError):
++    def __init__(self, tarinfo, path):
++        self.tarinfo =3D tarinfo
++        self._path =3D path
++        super().__init__(f'link {tarinfo.name!r} would be extracted as =
a '
++                         + f'copy of {path!r}, which was rejected')
++
++# Errors caused by filters -- both "fatal" and "non-fatal" -- that
++# we consider to be issues with the argument, rather than a bug in the
++# filter function
++_FILTER_ERRORS =3D (FilterError, OSError, ExtractError)
++
+ def _get_filtered_attrs(member, dest_path, for_data=3DTrue):
+     new_attrs =3D {}
+     name =3D member.name
+-    dest_path =3D os.path.realpath(dest_path)
++    dest_path =3D os.path.realpath(dest_path, strict=3Dos.path.ALLOW_MI=
SSING)
+     # Strip leading / (tar's directory separator) from filenames.
+     # Include os.sep (target OS directory separator) as well.
+     if name.startswith(('/', os.sep)):
+@@ -765,7 +777,8 @@ def _get_filtered_attrs(member, dest_path, for_data=3D=
True):
+         # For example, 'C:/foo' on Windows.
+         raise AbsolutePathError(member)
+     # Ensure we stay in the destination
+-    target_path =3D os.path.realpath(os.path.join(dest_path, name))
++    target_path =3D os.path.realpath(os.path.join(dest_path, name),
++                                   strict=3Dos.path.ALLOW_MISSING)
+     if os.path.commonpath([target_path, dest_path]) !=3D dest_path:
+         raise OutsideDestinationError(member, target_path)
+     # Limit permissions (no high bits, and go-w)
+@@ -803,6 +816,9 @@ def _get_filtered_attrs(member, dest_path, for_data=3D=
True):
+         if member.islnk() or member.issym():
+             if os.path.isabs(member.linkname):
+                 raise AbsoluteLinkError(member)
++            normalized =3D os.path.normpath(member.linkname)
++            if normalized !=3D member.linkname:
++                new_attrs['linkname'] =3D normalized
+             if member.issym():
+                 target_path =3D os.path.join(dest_path,
+                                            os.path.dirname(name),
+@@ -810,7 +826,8 @@ def _get_filtered_attrs(member, dest_path, for_data=3D=
True):
+             else:
+                 target_path =3D os.path.join(dest_path,
+                                            member.linkname)
+-            target_path =3D os.path.realpath(target_path)
++            target_path =3D os.path.realpath(target_path,
++                                           strict=3Dos.path.ALLOW_MISSI=
NG)
+             if os.path.commonpath([target_path, dest_path]) !=3D dest_p=
ath:
+                 raise LinkOutsideDestinationError(member, target_path)
+     return new_attrs
+@@ -2291,30 +2308,58 @@ def extractall(self, path=3D".", members=3DNone,=
 *, numeric_owner=3DFalse,
+             members =3D self
+
+         for member in members:
+-            tarinfo =3D self._get_extract_tarinfo(member, filter_functi=
on, path)
++            tarinfo, unfiltered =3D self._get_extract_tarinfo(
++                member, filter_function, path)
+             if tarinfo is None:
+                 continue
+             if tarinfo.isdir():
+                 # For directories, delay setting attributes until later=
,
+                 # since permissions can interfere with extraction and
+                 # extracting contents can reset mtime.
+-                directories.append(tarinfo)
++                directories.append(unfiltered)
+             self._extract_one(tarinfo, path, set_attrs=3Dnot tarinfo.is=
dir(),
+-                              numeric_owner=3Dnumeric_owner)
++                              numeric_owner=3Dnumeric_owner,
++                              filter_function=3Dfilter_function)
+
+         # Reverse sort directories.
+         directories.sort(key=3Dlambda a: a.name, reverse=3DTrue)
+
++
+         # Set correct owner, mtime and filemode on directories.
+-        for tarinfo in directories:
+-            dirpath =3D os.path.join(path, tarinfo.name)
++        for unfiltered in directories:
+             try:
++                # Need to re-apply any filter, to take the *current* fi=
lesystem
++                # state into account.
++                try:
++                    tarinfo =3D filter_function(unfiltered, path)
++                except _FILTER_ERRORS as exc:
++                    self._log_no_directory_fixup(unfiltered, repr(exc))
++                    continue
++                if tarinfo is None:
++                    self._log_no_directory_fixup(unfiltered,
++                                                 'excluded by filter')
++                    continue
++                dirpath =3D os.path.join(path, tarinfo.name)
++                try:
++                    lstat =3D os.lstat(dirpath)
++                except FileNotFoundError:
++                    self._log_no_directory_fixup(tarinfo, 'missing')
++                    continue
++                if not stat.S_ISDIR(lstat.st_mode):
++                    # This is no longer a directory; presumably a later
++                    # member overwrote the entry.
++                    self._log_no_directory_fixup(tarinfo, 'not a direct=
ory')
++                    continue
+                 self.chown(tarinfo, dirpath, numeric_owner=3Dnumeric_ow=
ner)
+                 self.utime(tarinfo, dirpath)
+                 self.chmod(tarinfo, dirpath)
+             except ExtractError as e:
+                 self._handle_nonfatal_error(e)
+
++    def _log_no_directory_fixup(self, member, reason):
++        self._dbg(2, "tarfile: Not fixing up directory %r (%s)" %
++                  (member.name, reason))
++
+     def extract(self, member, path=3D"", set_attrs=3DTrue, *, numeric_o=
wner=3DFalse,
+                 filter=3DNone):
+         """Extract a member from the archive to the current working dir=
ectory,
+@@ -2330,41 +2375,56 @@ def extract(self, member, path=3D"", set_attrs=3D=
True, *, numeric_owner=3DFalse,
+            String names of common filters are accepted.
+         """
+         filter_function =3D self._get_filter_function(filter)
+-        tarinfo =3D self._get_extract_tarinfo(member, filter_function, =
path)
++        tarinfo, unfiltered =3D self._get_extract_tarinfo(
++            member, filter_function, path)
+         if tarinfo is not None:
+             self._extract_one(tarinfo, path, set_attrs, numeric_owner)
+
+     def _get_extract_tarinfo(self, member, filter_function, path):
+-        """Get filtered TarInfo (or None) from member, which might be a=
 str"""
++        """Get (filtered, unfiltered) TarInfos from *member*
++
++        *member* might be a string.
++
++        Return (None, None) if not found.
++        """
++
+         if isinstance(member, str):
+-            tarinfo =3D self.getmember(member)
++            unfiltered =3D self.getmember(member)
+         else:
+-            tarinfo =3D member
++            unfiltered =3D member
+
+-        unfiltered =3D tarinfo
++        filtered =3D None
+         try:
+-            tarinfo =3D filter_function(tarinfo, path)
++            filtered =3D filter_function(unfiltered, path)
+         except (OSError, FilterError) as e:
+             self._handle_fatal_error(e)
+         except ExtractError as e:
+             self._handle_nonfatal_error(e)
+-        if tarinfo is None:
++        if filtered is None:
+             self._dbg(2, "tarfile: Excluded %r" % unfiltered.name)
+-            return None
++            return None, None
++
+         # Prepare the link target for makelink().
+-        if tarinfo.islnk():
+-            tarinfo =3D copy.copy(tarinfo)
+-            tarinfo._link_target =3D os.path.join(path, tarinfo.linknam=
e)
+-        return tarinfo
++        if filtered.islnk():
++            filtered =3D copy.copy(filtered)
++            filtered._link_target =3D os.path.join(path, filtered.linkn=
ame)
++        return filtered, unfiltered
+
+-    def _extract_one(self, tarinfo, path, set_attrs, numeric_owner):
+-        """Extract from filtered tarinfo to disk"""
++    def _extract_one(self, tarinfo, path, set_attrs, numeric_owner,
++                     filter_function=3DNone):
++        """Extract from filtered tarinfo to disk.
++
++           filter_function is only used when extracting a *different*
++           member (e.g. as fallback to creating a symlink)
++        """
+         self._check("r")
+
+         try:
+             self._extract_member(tarinfo, os.path.join(path, tarinfo.na=
me),
+                                  set_attrs=3Dset_attrs,
+-                                 numeric_owner=3Dnumeric_owner)
++                                 numeric_owner=3Dnumeric_owner,
++                                 filter_function=3Dfilter_function,
++                                 extraction_root=3Dpath)
+         except OSError as e:
+             self._handle_fatal_error(e)
+         except ExtractError as e:
+@@ -2422,9 +2482,13 @@ def extractfile(self, member):
+             return None
+
+     def _extract_member(self, tarinfo, targetpath, set_attrs=3DTrue,
+-                        numeric_owner=3DFalse):
+-        """Extract the TarInfo object tarinfo to a physical
++                        numeric_owner=3DFalse, *, filter_function=3DNon=
e,
++                        extraction_root=3DNone):
++        """Extract the filtered TarInfo object tarinfo to a physical
+            file called targetpath.
++
++           filter_function is only used when extracting a *different*
++           member (e.g. as fallback to creating a symlink)
+         """
+         # Fetch the TarInfo object for the given name
+         # and build the destination pathname, replacing
+@@ -2453,7 +2517,10 @@ def _extract_member(self, tarinfo, targetpath, se=
t_attrs=3DTrue,
+         elif tarinfo.ischr() or tarinfo.isblk():
+             self.makedev(tarinfo, targetpath)
+         elif tarinfo.islnk() or tarinfo.issym():
+-            self.makelink(tarinfo, targetpath)
++            self.makelink_with_filter(
++                tarinfo, targetpath,
++                filter_function=3Dfilter_function,
++                extraction_root=3Dextraction_root)
+         elif tarinfo.type not in SUPPORTED_TYPES:
+             self.makeunknown(tarinfo, targetpath)
+         else:
+@@ -2536,10 +2603,18 @@ def makedev(self, tarinfo, targetpath):
+                  os.makedev(tarinfo.devmajor, tarinfo.devminor))
+
+     def makelink(self, tarinfo, targetpath):
++        return self.makelink_with_filter(tarinfo, targetpath, None, Non=
e)
++
++    def makelink_with_filter(self, tarinfo, targetpath,
++                             filter_function, extraction_root):
+         """Make a (symbolic) link called targetpath. If it cannot be cr=
eated
+           (platform limitation), we try to make a copy of the reference=
d file
+           instead of a link.
++
++          filter_function is only used when extracting a *different*
++          member (e.g. as fallback to creating a link).
+         """
++        keyerror_to_extracterror =3D False
+         try:
+             # For systems that support symbolic and hard links.
+             if tarinfo.issym():
+@@ -2547,18 +2622,38 @@ def makelink(self, tarinfo, targetpath):
+                     # Avoid FileExistsError on following os.symlink.
+                     os.unlink(targetpath)
+                 os.symlink(tarinfo.linkname, targetpath)
++                return
+             else:
+                 if os.path.exists(tarinfo._link_target):
+                     os.link(tarinfo._link_target, targetpath)
+-                else:
+-                    self._extract_member(self._find_link_target(tarinfo=
),
+-                                         targetpath)
++                    return
+         except symlink_exception:
++            keyerror_to_extracterror =3D True
++
++        try:
++            unfiltered =3D self._find_link_target(tarinfo)
++        except KeyError:
++            if keyerror_to_extracterror:
++                raise ExtractError(
++                    "unable to resolve link inside archive") from None
++            else:
++                raise
++
++        if filter_function is None:
++            filtered =3D unfiltered
++        else:
++            if extraction_root is None:
++                raise ExtractError(
++                    "makelink_with_filter: if filter_function is not No=
ne, "
++                    + "extraction_root must also not be None")
+             try:
+-                self._extract_member(self._find_link_target(tarinfo),
+-                                     targetpath)
+-            except KeyError:
+-                raise ExtractError("unable to resolve link inside archi=
ve") from None
++                filtered =3D filter_function(unfiltered, extraction_roo=
t)
++            except _FILTER_ERRORS as cause:
++                raise LinkFallbackError(tarinfo, unfiltered.name) from =
cause
++        if filtered is not None:
++            self._extract_member(filtered, targetpath,
++                                 filter_function=3Dfilter_function,
++                                 extraction_root=3Dextraction_root)
+
+     def chown(self, tarinfo, targetpath, numeric_owner):
+         """Set owner of targetpath according to tarinfo. If numeric_own=
er
+diff --git a/Lib/test/test_ntpath.py b/Lib/test/test_ntpath.py
+index 4924db983b5..93d70112845 100644
+--- a/Lib/test/test_ntpath.py
++++ b/Lib/test/test_ntpath.py
+@@ -2,9 +2,11 @@
+ import ntpath
+ import os
+ import string
++import subprocess
+ import sys
+ import unittest
+ import warnings
++from ntpath import ALLOW_MISSING
+ from test.support import cpython_only, os_helper
+ from test.support import TestFailed, is_emscripten
+ from test.support.os_helper import FakePath
+@@ -76,6 +78,27 @@ def tester(fn, wantResult):
+               %(str(fn), str(wantResult), repr(gotResult)))
+
+
++def _parameterize(*parameters):
++    """Simplistic decorator to parametrize a test
++
++    Runs the decorated test multiple times in subTest, with a value fro=
m
++    'parameters' passed as an extra positional argument.
++    Calls doCleanups() after each run.
++
++    Not for general use. Intended to avoid indenting for easier backpor=
ts.
++
++    See https://discuss.python.org/t/91827 for discussing generalizatio=
ns.
++    """
++    def _parametrize_decorator(func):
++        def _parameterized(self, *args, **kwargs):
++            for parameter in parameters:
++                with self.subTest(parameter):
++                    func(self, *args, parameter, **kwargs)
++                self.doCleanups()
++        return _parameterized
++    return _parametrize_decorator
++
++
+ class NtpathTestCase(unittest.TestCase):
+     def assertPathEqual(self, path1, path2):
+         if path1 =3D=3D path2 or _norm(path1) =3D=3D _norm(path2):
+@@ -363,6 +386,27 @@ def test_realpath_curdir(self):
+         tester("ntpath.realpath('.\\.')", expected)
+         tester("ntpath.realpath('\\'.join(['.'] * 100))", expected)
+
++    def test_realpath_curdir_strict(self):
++        expected =3D ntpath.normpath(os.getcwd())
++        tester("ntpath.realpath('.', strict=3DTrue)", expected)
++        tester("ntpath.realpath('./.', strict=3DTrue)", expected)
++        tester("ntpath.realpath('/'.join(['.'] * 100), strict=3DTrue)",=
 expected)
++        tester("ntpath.realpath('.\\.', strict=3DTrue)", expected)
++        tester("ntpath.realpath('\\'.join(['.'] * 100), strict=3DTrue)"=
, expected)
++
++    def test_realpath_curdir_missing_ok(self):
++        expected =3D ntpath.normpath(os.getcwd())
++        tester("ntpath.realpath('.', strict=3DALLOW_MISSING)",
++               expected)
++        tester("ntpath.realpath('./.', strict=3DALLOW_MISSING)",
++               expected)
++        tester("ntpath.realpath('/'.join(['.'] * 100), strict=3DALLOW_M=
ISSING)",
++               expected)
++        tester("ntpath.realpath('.\\.', strict=3DALLOW_MISSING)",
++               expected)
++        tester("ntpath.realpath('\\'.join(['.'] * 100), strict=3DALLOW_=
MISSING)",
++               expected)
++
+     def test_realpath_pardir(self):
+         expected =3D ntpath.normpath(os.getcwd())
+         tester("ntpath.realpath('..')", ntpath.dirname(expected))
+@@ -375,28 +419,59 @@ def test_realpath_pardir(self):
+         tester("ntpath.realpath('\\'.join(['..'] * 50))",
+                ntpath.splitdrive(expected)[0] + '\\')
+
++    def test_realpath_pardir_strict(self):
++        expected =3D ntpath.normpath(os.getcwd())
++        tester("ntpath.realpath('..', strict=3DTrue)", ntpath.dirname(e=
xpected))
++        tester("ntpath.realpath('../..', strict=3DTrue)",
++               ntpath.dirname(ntpath.dirname(expected)))
++        tester("ntpath.realpath('/'.join(['..'] * 50), strict=3DTrue)",
++               ntpath.splitdrive(expected)[0] + '\\')
++        tester("ntpath.realpath('..\\..', strict=3DTrue)",
++               ntpath.dirname(ntpath.dirname(expected)))
++        tester("ntpath.realpath('\\'.join(['..'] * 50), strict=3DTrue)"=
,
++               ntpath.splitdrive(expected)[0] + '\\')
++
++    def test_realpath_pardir_missing_ok(self):
++        expected =3D ntpath.normpath(os.getcwd())
++        tester("ntpath.realpath('..', strict=3DALLOW_MISSING)",
++               ntpath.dirname(expected))
++        tester("ntpath.realpath('../..', strict=3DALLOW_MISSING)",
++               ntpath.dirname(ntpath.dirname(expected)))
++        tester("ntpath.realpath('/'.join(['..'] * 50), strict=3DALLOW_M=
ISSING)",
++               ntpath.splitdrive(expected)[0] + '\\')
++        tester("ntpath.realpath('..\\..', strict=3DALLOW_MISSING)",
++               ntpath.dirname(ntpath.dirname(expected)))
++        tester("ntpath.realpath('\\'.join(['..'] * 50), strict=3DALLOW_=
MISSING)",
++               ntpath.splitdrive(expected)[0] + '\\')
++
+     @os_helper.skip_unless_symlink
+     @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
+-    def test_realpath_basic(self):
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_basic(self, kwargs):
+         ABSTFN =3D ntpath.abspath(os_helper.TESTFN)
+         open(ABSTFN, "wb").close()
+         self.addCleanup(os_helper.unlink, ABSTFN)
+         self.addCleanup(os_helper.unlink, ABSTFN + "1")
+
+         os.symlink(ABSTFN, ABSTFN + "1")
+-        self.assertPathEqual(ntpath.realpath(ABSTFN + "1"), ABSTFN)
+-        self.assertPathEqual(ntpath.realpath(os.fsencode(ABSTFN + "1"))=
,
++        self.assertPathEqual(ntpath.realpath(ABSTFN + "1", **kwargs), A=
BSTFN)
++        self.assertPathEqual(ntpath.realpath(os.fsencode(ABSTFN + "1"),=
 **kwargs),
+                          os.fsencode(ABSTFN))
+
+         # gh-88013: call ntpath.realpath with binary drive name may rai=
se a
+         # TypeError. The drive should not exist to reproduce the bug.
+         drives =3D {f"{c}:\\" for c in string.ascii_uppercase} - set(os=
.listdrives())
+         d =3D drives.pop().encode()
+-        self.assertEqual(ntpath.realpath(d), d)
++        self.assertEqual(ntpath.realpath(d, strict=3DFalse), d)
+
+         # gh-106242: Embedded nulls and non-strict fallback to abspath
+-        self.assertEqual(ABSTFN + "\0spam",
+-                         ntpath.realpath(os_helper.TESTFN + "\0spam", s=
trict=3DFalse))
++        if kwargs:
++            with self.assertRaises(OSError):
++                ntpath.realpath(os_helper.TESTFN + "\0spam",
++                                **kwargs)
++        else:
++            self.assertEqual(ABSTFN + "\0spam",
++                                ntpath.realpath(os_helper.TESTFN + "\0s=
pam", **kwargs))
+
+     @os_helper.skip_unless_symlink
+     @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
+@@ -408,19 +483,77 @@ def test_realpath_strict(self):
+         self.addCleanup(os_helper.unlink, ABSTFN)
+         self.assertRaises(FileNotFoundError, ntpath.realpath, ABSTFN, s=
trict=3DTrue)
+         self.assertRaises(FileNotFoundError, ntpath.realpath, ABSTFN + =
"2", strict=3DTrue)
++
++    @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
++    def test_realpath_invalid_paths(self):
++        realpath =3D ntpath.realpath
++        ABSTFN =3D ntpath.abspath(os_helper.TESTFN)
++        ABSTFNb =3D os.fsencode(ABSTFN)
++        path =3D ABSTFN + '\x00'
++        # gh-106242: Embedded nulls and non-strict fallback to abspath
++        self.assertEqual(realpath(path, strict=3DFalse), path)
+         # gh-106242: Embedded nulls should raise OSError (not ValueErro=
r)
+-        self.assertRaises(OSError, ntpath.realpath, ABSTFN + "\0spam", =
strict=3DTrue)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DTrue=
)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DALLO=
W_MISSING)
++        path =3D ABSTFNb + b'\x00'
++        self.assertEqual(realpath(path, strict=3DFalse), path)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DTrue=
)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DALLO=
W_MISSING)
++        path =3D ABSTFN + '\\nonexistent\\x\x00'
++        self.assertEqual(realpath(path, strict=3DFalse), path)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DTrue=
)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DALLO=
W_MISSING)
++        path =3D ABSTFNb + b'\\nonexistent\\x\x00'
++        self.assertEqual(realpath(path, strict=3DFalse), path)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DTrue=
)
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DALLO=
W_MISSING)
++        path =3D ABSTFN + '\x00\\..'
++        self.assertEqual(realpath(path, strict=3DFalse), os.getcwd())
++        self.assertEqual(realpath(path, strict=3DTrue), os.getcwd())
++        self.assertEqual(realpath(path, strict=3DALLOW_MISSING), os.get=
cwd())
++        path =3D ABSTFNb + b'\x00\\..'
++        self.assertEqual(realpath(path, strict=3DFalse), os.getcwdb())
++        self.assertEqual(realpath(path, strict=3DTrue), os.getcwdb())
++        self.assertEqual(realpath(path, strict=3DALLOW_MISSING), os.get=
cwdb())
++        path =3D ABSTFN + '\\nonexistent\\x\x00\\..'
++        self.assertEqual(realpath(path, strict=3DFalse), ABSTFN + '\\no=
nexistent')
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DTrue=
)
++        self.assertEqual(realpath(path, strict=3DALLOW_MISSING), ABSTFN=
 + '\\nonexistent')
++        path =3D ABSTFNb + b'\\nonexistent\\x\x00\\..'
++        self.assertEqual(realpath(path, strict=3DFalse), ABSTFNb + b'\\=
nonexistent')
++        self.assertRaises(OSError, ntpath.realpath, path, strict=3DTrue=
)
++        self.assertEqual(realpath(path, strict=3DALLOW_MISSING), ABSTFN=
b + b'\\nonexistent')
++
++    @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_invalid_unicode_paths(self, kwargs):
++        realpath =3D ntpath.realpath
++        ABSTFN =3D ntpath.abspath(os_helper.TESTFN)
++        ABSTFNb =3D os.fsencode(ABSTFN)
++        path =3D ABSTFNb + b'\xff'
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
++        path =3D ABSTFNb + b'\\nonexistent\\\xff'
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
++        path =3D ABSTFNb + b'\xff\\..'
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
++        path =3D ABSTFNb + b'\\nonexistent\\\xff\\..'
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
++        self.assertRaises(UnicodeDecodeError, ntpath.realpath, path, **=
kwargs)
+
+     @os_helper.skip_unless_symlink
+     @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
+-    def test_realpath_relative(self):
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_relative(self, kwargs):
+         ABSTFN =3D ntpath.abspath(os_helper.TESTFN)
+         open(ABSTFN, "wb").close()
+         self.addCleanup(os_helper.unlink, ABSTFN)
+         self.addCleanup(os_helper.unlink, ABSTFN + "1")
+
+         os.symlink(ABSTFN, ntpath.relpath(ABSTFN + "1"))
+-        self.assertPathEqual(ntpath.realpath(ABSTFN + "1"), ABSTFN)
++        self.assertPathEqual(ntpath.realpath(ABSTFN + "1", **kwargs), A=
BSTFN)
+
+     @os_helper.skip_unless_symlink
+     @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
+@@ -572,7 +705,62 @@ def test_realpath_symlink_loops_strict(self):
+
+     @os_helper.skip_unless_symlink
+     @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
+-    def test_realpath_symlink_prefix(self):
++    def test_realpath_symlink_loops_raise(self):
++        # Symlink loops raise OSError in ALLOW_MISSING mode
++        ABSTFN =3D ntpath.abspath(os_helper.TESTFN)
++        self.addCleanup(os_helper.unlink, ABSTFN)
++        self.addCleanup(os_helper.unlink, ABSTFN + "1")
++        self.addCleanup(os_helper.unlink, ABSTFN + "2")
++        self.addCleanup(os_helper.unlink, ABSTFN + "y")
++        self.addCleanup(os_helper.unlink, ABSTFN + "c")
++        self.addCleanup(os_helper.unlink, ABSTFN + "a")
++        self.addCleanup(os_helper.unlink, ABSTFN + "x")
++
++        os.symlink(ABSTFN, ABSTFN)
++        self.assertRaises(OSError, ntpath.realpath, ABSTFN, strict=3DAL=
LOW_MISSING)
++
++        os.symlink(ABSTFN + "1", ABSTFN + "2")
++        os.symlink(ABSTFN + "2", ABSTFN + "1")
++        self.assertRaises(OSError, ntpath.realpath, ABSTFN + "1",
++                            strict=3DALLOW_MISSING)
++        self.assertRaises(OSError, ntpath.realpath, ABSTFN + "2",
++                            strict=3DALLOW_MISSING)
++        self.assertRaises(OSError, ntpath.realpath, ABSTFN + "1\\x",
++                            strict=3DALLOW_MISSING)
++
++        # Windows eliminates '..' components before resolving links;
++        # realpath is not expected to raise if this removes the loop.
++        self.assertPathEqual(ntpath.realpath(ABSTFN + "1\\.."),
++                             ntpath.dirname(ABSTFN))
++        self.assertPathEqual(ntpath.realpath(ABSTFN + "1\\..\\x"),
++                             ntpath.dirname(ABSTFN) + "\\x")
++
++        os.symlink(ABSTFN + "x", ABSTFN + "y")
++        self.assertPathEqual(ntpath.realpath(ABSTFN + "1\\..\\"
++                                             + ntpath.basename(ABSTFN) =
+ "y"),
++                             ABSTFN + "x")
++        self.assertRaises(
++            OSError, ntpath.realpath,
++            ABSTFN + "1\\..\\" + ntpath.basename(ABSTFN) + "1",
++            strict=3DALLOW_MISSING)
++
++        os.symlink(ntpath.basename(ABSTFN) + "a\\b", ABSTFN + "a")
++        self.assertRaises(OSError, ntpath.realpath, ABSTFN + "a",
++                            strict=3DALLOW_MISSING)
++
++        os.symlink("..\\" + ntpath.basename(ntpath.dirname(ABSTFN))
++                + "\\" + ntpath.basename(ABSTFN) + "c", ABSTFN + "c")
++        self.assertRaises(OSError, ntpath.realpath, ABSTFN + "c",
++                            strict=3DALLOW_MISSING)
++
++        # Test using relative path as well.
++        self.assertRaises(OSError, ntpath.realpath, ntpath.basename(ABS=
TFN),
++                            strict=3DALLOW_MISSING)
++
++    @os_helper.skip_unless_symlink
++    @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_symlink_prefix(self, kwargs):
+         ABSTFN =3D ntpath.abspath(os_helper.TESTFN)
+         self.addCleanup(os_helper.unlink, ABSTFN + "3")
+         self.addCleanup(os_helper.unlink, "\\\\?\\" + ABSTFN + "3.")
+@@ -587,9 +775,9 @@ def test_realpath_symlink_prefix(self):
+             f.write(b'1')
+         os.symlink("\\\\?\\" + ABSTFN + "3.", ABSTFN + "3.link")
+
+-        self.assertPathEqual(ntpath.realpath(ABSTFN + "3link"),
++        self.assertPathEqual(ntpath.realpath(ABSTFN + "3link", **kwargs=
),
+                              ABSTFN + "3")
+-        self.assertPathEqual(ntpath.realpath(ABSTFN + "3.link"),
++        self.assertPathEqual(ntpath.realpath(ABSTFN + "3.link", **kwarg=
s),
+                              "\\\\?\\" + ABSTFN + "3.")
+
+         # Resolved paths should be usable to open target files
+@@ -599,14 +787,17 @@ def test_realpath_symlink_prefix(self):
+             self.assertEqual(f.read(), b'1')
+
+         # When the prefix is included, it is not stripped
+-        self.assertPathEqual(ntpath.realpath("\\\\?\\" + ABSTFN + "3lin=
k"),
++        self.assertPathEqual(ntpath.realpath("\\\\?\\" + ABSTFN + "3lin=
k", **kwargs),
+                              "\\\\?\\" + ABSTFN + "3")
+-        self.assertPathEqual(ntpath.realpath("\\\\?\\" + ABSTFN + "3.li=
nk"),
++        self.assertPathEqual(ntpath.realpath("\\\\?\\" + ABSTFN + "3.li=
nk", **kwargs),
+                              "\\\\?\\" + ABSTFN + "3.")
+
+     @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
+     def test_realpath_nul(self):
+         tester("ntpath.realpath('NUL')", r'\\.\NUL')
++        tester("ntpath.realpath('NUL', strict=3DFalse)", r'\\.\NUL')
++        tester("ntpath.realpath('NUL', strict=3DTrue)", r'\\.\NUL')
++        tester("ntpath.realpath('NUL', strict=3DALLOW_MISSING)", r'\\.\=
NUL')
+
+     @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
+     @unittest.skipUnless(HAVE_GETSHORTPATHNAME, 'need _getshortpathname=
')
+@@ -630,12 +821,65 @@ def test_realpath_cwd(self):
+
+         self.assertPathEqual(test_file_long, ntpath.realpath(test_file_=
short))
+
+-        with os_helper.change_cwd(test_dir_long):
+-            self.assertPathEqual(test_file_long, ntpath.realpath("file.=
txt"))
+-        with os_helper.change_cwd(test_dir_long.lower()):
+-            self.assertPathEqual(test_file_long, ntpath.realpath("file.=
txt"))
+-        with os_helper.change_cwd(test_dir_short):
+-            self.assertPathEqual(test_file_long, ntpath.realpath("file.=
txt"))
++        for kwargs in {}, {'strict': True}, {'strict': ALLOW_MISSING}:
++            with self.subTest(**kwargs):
++                with os_helper.change_cwd(test_dir_long):
++                    self.assertPathEqual(
++                        test_file_long,
++                        ntpath.realpath("file.txt", **kwargs))
++                with os_helper.change_cwd(test_dir_long.lower()):
++                    self.assertPathEqual(
++                        test_file_long,
++                        ntpath.realpath("file.txt", **kwargs))
++                with os_helper.change_cwd(test_dir_short):
++                    self.assertPathEqual(
++                        test_file_long,
++                        ntpath.realpath("file.txt", **kwargs))
++
++    @unittest.skipUnless(HAVE_GETFINALPATHNAME, 'need _getfinalpathname=
')
++    def test_realpath_permission(self):
++        # Test whether python can resolve the real filename of a
++        # shortened file name even if it does not have permission to ac=
cess it.
++        ABSTFN =3D ntpath.realpath(os_helper.TESTFN)
++
++        os_helper.unlink(ABSTFN)
++        os_helper.rmtree(ABSTFN)
++        os.mkdir(ABSTFN)
++        self.addCleanup(os_helper.rmtree, ABSTFN)
++
++        test_file =3D ntpath.join(ABSTFN, "LongFileName123.txt")
++        test_file_short =3D ntpath.join(ABSTFN, "LONGFI~1.TXT")
++
++        with open(test_file, "wb") as f:
++            f.write(b"content")
++        # Automatic generation of short names may be disabled on
++        # NTFS volumes for the sake of performance.
++        # They're not supported at all on ReFS and exFAT.
++        p =3D subprocess.run(
++            # Try to set the short name manually.
++            ['fsutil.exe', 'file', 'setShortName', test_file, 'LONGFI~1=
.TXT'],
++            creationflags=3Dsubprocess.DETACHED_PROCESS
++        )
++
++        if p.returncode:
++            raise unittest.SkipTest('failed to set short name')
++
++        try:
++            self.assertPathEqual(test_file, ntpath.realpath(test_file_s=
hort))
++        except AssertionError:
++            raise unittest.SkipTest('the filesystem seems to lack suppo=
rt for short filenames')
++
++        # Deny the right to [S]YNCHRONIZE on the file to
++        # force nt._getfinalpathname to fail with ERROR_ACCESS_DENIED.
++        p =3D subprocess.run(
++            ['icacls.exe', test_file, '/deny', '*S-1-5-32-545:(S)'],
++            creationflags=3Dsubprocess.DETACHED_PROCESS
++        )
++
++        if p.returncode:
++            raise unittest.SkipTest('failed to deny access to the test =
file')
++
++        self.assertPathEqual(test_file, ntpath.realpath(test_file_short=
))
+
+     def test_expandvars(self):
+         with os_helper.EnvironmentVarGuard() as env:
+diff --git a/Lib/test/test_posixpath.py b/Lib/test/test_posixpath.py
+index cc4fd2f4c95..7ae54d29b5e 100644
+--- a/Lib/test/test_posixpath.py
++++ b/Lib/test/test_posixpath.py
+@@ -3,7 +3,9 @@
+ import posixpath
+ import sys
+ import unittest
+-from posixpath import realpath, abspath, dirname, basename
++from functools import partial
++from posixpath import realpath, abspath, dirname, basename, ALLOW_MISSI=
NG
++from test import support
+ from test import test_genericpath
+ from test.support import import_helper
+ from test.support import cpython_only, os_helper
+@@ -37,6 +39,26 @@ def safe_rmdir(dirname):
+     except OSError:
+         pass
+
++def _parameterize(*parameters):
++    """Simplistic decorator to parametrize a test
++
++    Runs the decorated test multiple times in subTest, with a value fro=
m
++    'parameters' passed as an extra positional argument.
++    Does *not* call doCleanups() after each run.
++
++    Not for general use. Intended to avoid indenting for easier backpor=
ts.
++
++    See https://discuss.python.org/t/91827 for discussing generalizatio=
ns.
++    """
++    def _parametrize_decorator(func):
++        def _parameterized(self, *args, **kwargs):
++            for parameter in parameters:
++                with self.subTest(parameter):
++                    func(self, *args, parameter, **kwargs)
++        return _parameterized
++    return _parametrize_decorator
++
++
+ class PosixPathTest(unittest.TestCase):
+
+     def setUp(self):
+@@ -425,32 +447,35 @@ def test_normpath(self):
+                 self.assertEqual(result, expected)
+
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_curdir(self):
+-        self.assertEqual(realpath('.'), os.getcwd())
+-        self.assertEqual(realpath('./.'), os.getcwd())
+-        self.assertEqual(realpath('/'.join(['.'] * 100)), os.getcwd())
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_curdir(self, kwargs):
++        self.assertEqual(realpath('.', **kwargs), os.getcwd())
++        self.assertEqual(realpath('./.', **kwargs), os.getcwd())
++        self.assertEqual(realpath('/'.join(['.'] * 100), **kwargs), os.=
getcwd())
+
+-        self.assertEqual(realpath(b'.'), os.getcwdb())
+-        self.assertEqual(realpath(b'./.'), os.getcwdb())
+-        self.assertEqual(realpath(b'/'.join([b'.'] * 100)), os.getcwdb(=
))
++        self.assertEqual(realpath(b'.', **kwargs), os.getcwdb())
++        self.assertEqual(realpath(b'./.', **kwargs), os.getcwdb())
++        self.assertEqual(realpath(b'/'.join([b'.'] * 100), **kwargs), o=
s.getcwdb())
+
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_pardir(self):
+-        self.assertEqual(realpath('..'), dirname(os.getcwd()))
+-        self.assertEqual(realpath('../..'), dirname(dirname(os.getcwd()=
)))
+-        self.assertEqual(realpath('/'.join(['..'] * 100)), '/')
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_pardir(self, kwargs):
++        self.assertEqual(realpath('..', **kwargs), dirname(os.getcwd())=
)
++        self.assertEqual(realpath('../..', **kwargs), dirname(dirname(o=
s.getcwd())))
++        self.assertEqual(realpath('/'.join(['..'] * 100), **kwargs), '/=
')
+
+-        self.assertEqual(realpath(b'..'), dirname(os.getcwdb()))
+-        self.assertEqual(realpath(b'../..'), dirname(dirname(os.getcwdb=
())))
+-        self.assertEqual(realpath(b'/'.join([b'..'] * 100)), b'/')
++        self.assertEqual(realpath(b'..', **kwargs), dirname(os.getcwdb(=
)))
++        self.assertEqual(realpath(b'../..', **kwargs), dirname(dirname(=
os.getcwdb())))
++        self.assertEqual(realpath(b'/'.join([b'..'] * 100), **kwargs), =
b'/')
+
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_basic(self):
++    @_parameterize({}, {'strict': ALLOW_MISSING})
++    def test_realpath_basic(self, kwargs):
+         # Basic operation.
+         try:
+             os.symlink(ABSTFN+"1", ABSTFN)
+-            self.assertEqual(realpath(ABSTFN), ABSTFN+"1")
++            self.assertEqual(realpath(ABSTFN, **kwargs), ABSTFN+"1")
+         finally:
+             os_helper.unlink(ABSTFN)
+
+@@ -466,15 +491,122 @@ def test_realpath_strict(self):
+         finally:
+             os_helper.unlink(ABSTFN)
+
++    def test_realpath_invalid_paths(self):
++        path =3D '/\x00'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(ValueError, realpath, path, strict=3DTrue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++        path =3D b'/\x00'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(ValueError, realpath, path, strict=3DTrue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++        path =3D '/nonexistent/x\x00'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(FileNotFoundError, realpath, path, strict=3DT=
rue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++        path =3D b'/nonexistent/x\x00'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(FileNotFoundError, realpath, path, strict=3DT=
rue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++        path =3D '/\x00/..'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(ValueError, realpath, path, strict=3DTrue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++        path =3D b'/\x00/..'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(ValueError, realpath, path, strict=3DTrue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++
++        path =3D '/nonexistent/x\x00/..'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(FileNotFoundError, realpath, path, strict=3DT=
rue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++        path =3D b'/nonexistent/x\x00/..'
++        self.assertRaises(ValueError, realpath, path, strict=3DFalse)
++        self.assertRaises(FileNotFoundError, realpath, path, strict=3DT=
rue)
++        self.assertRaises(ValueError, realpath, path, strict=3DALLOW_MI=
SSING)
++
++        path =3D '/\udfff'
++        if sys.platform =3D=3D 'win32':
++            self.assertEqual(realpath(path, strict=3DFalse), path)
++            self.assertRaises(FileNotFoundError, realpath, path, strict=
=3DTrue)
++            self.assertEqual(realpath(path, strict=3DALLOW_MISSING), pa=
th)
++        else:
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DFalse)
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DTrue)
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DALLOW_MISSING)
++        path =3D '/nonexistent/\udfff'
++        if sys.platform =3D=3D 'win32':
++            self.assertEqual(realpath(path, strict=3DFalse), path)
++            self.assertEqual(realpath(path, strict=3DALLOW_MISSING), pa=
th)
++        else:
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DFalse)
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DALLOW_MISSING)
++        self.assertRaises(FileNotFoundError, realpath, path, strict=3DT=
rue)
++        path =3D '/\udfff/..'
++        if sys.platform =3D=3D 'win32':
++            self.assertEqual(realpath(path, strict=3DFalse), '/')
++            self.assertRaises(FileNotFoundError, realpath, path, strict=
=3DTrue)
++            self.assertEqual(realpath(path, strict=3DALLOW_MISSING), '/=
')
++        else:
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DFalse)
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DTrue)
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DALLOW_MISSING)
++        path =3D '/nonexistent/\udfff/..'
++        if sys.platform =3D=3D 'win32':
++            self.assertEqual(realpath(path, strict=3DFalse), '/nonexist=
ent')
++            self.assertEqual(realpath(path, strict=3DALLOW_MISSING), '/=
nonexistent')
++        else:
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DFalse)
++            self.assertRaises(UnicodeEncodeError, realpath, path, stric=
t=3DALLOW_MISSING)
++        self.assertRaises(FileNotFoundError, realpath, path, strict=3DT=
rue)
++
++        path =3D b'/\xff'
++        if sys.platform =3D=3D 'win32':
++            self.assertRaises(UnicodeDecodeError, realpath, path, stric=
t=3DFalse)
++            self.assertRaises(UnicodeDecodeError, realpath, path, stric=
t=3DTrue)
++            self.assertRaises(UnicodeDecodeError, realpath, path, stric=
t=3DALLOW_MISSING)
++        else:
++            self.assertEqual(realpath(path, strict=3DFalse), path)
++            if support.is_wasi:
++                self.assertRaises(OSError, realpath, path, strict=3DTru=
e)
++                self.assertRaises(OSError, realpath, path, strict=3DALL=
OW_MISSING)
++            else:
++                self.assertRaises(FileNotFoundError, realpath, path, st=
rict=3DTrue)
++                self.assertEqual(realpath(path, strict=3DALLOW_MISSING)=
, path)
++        path =3D b'/nonexistent/\xff'
++        if sys.platform =3D=3D 'win32':
++            self.assertRaises(UnicodeDecodeError, realpath, path, stric=
t=3DFalse)
++            self.assertRaises(UnicodeDecodeError, realpath, path, stric=
t=3DALLOW_MISSING)
++        else:
++            self.assertEqual(realpath(path, strict=3DFalse), path)
++        if support.is_wasi:
++            self.assertRaises(OSError, realpath, path, strict=3DTrue)
++            self.assertRaises(OSError, realpath, path, strict=3DALLOW_M=
ISSING)
++        else:
++            self.assertRaises(FileNotFoundError, realpath, path, strict=
=3DTrue)
++
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_relative(self):
++    @_parameterize({}, {'strict': ALLOW_MISSING})
++    def test_realpath_relative(self, kwargs):
+         try:
+             os.symlink(posixpath.relpath(ABSTFN+"1"), ABSTFN)
+-            self.assertEqual(realpath(ABSTFN), ABSTFN+"1")
++            self.assertEqual(realpath(ABSTFN, **kwargs), ABSTFN+"1")
+         finally:
+             os_helper.unlink(ABSTFN)
+
++    @os_helper.skip_unless_symlink
++    @skip_if_ABSTFN_contains_backslash
++    @_parameterize({}, {'strict': ALLOW_MISSING})
++    def test_realpath_missing_pardir(self, kwargs):
++        try:
++            os.symlink(os_helper.TESTFN + "1", os_helper.TESTFN)
++            self.assertEqual(
++                realpath("nonexistent/../" + os_helper.TESTFN, **kwargs=
), ABSTFN + "1")
++        finally:
++            os_helper.unlink(os_helper.TESTFN)
++
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+     def test_realpath_symlink_loops(self):
+@@ -518,37 +650,38 @@ def test_realpath_symlink_loops(self):
+
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_symlink_loops_strict(self):
++    @_parameterize({'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_symlink_loops_strict(self, kwargs):
+         # Bug #43757, raise OSError if we get into an infinite symlink =
loop in
+-        # strict mode.
++        # the strict modes.
+         try:
+             os.symlink(ABSTFN, ABSTFN)
+-            self.assertRaises(OSError, realpath, ABSTFN, strict=3DTrue)
++            self.assertRaises(OSError, realpath, ABSTFN, **kwargs)
+
+             os.symlink(ABSTFN+"1", ABSTFN+"2")
+             os.symlink(ABSTFN+"2", ABSTFN+"1")
+-            self.assertRaises(OSError, realpath, ABSTFN+"1", strict=3DT=
rue)
+-            self.assertRaises(OSError, realpath, ABSTFN+"2", strict=3DT=
rue)
++            self.assertRaises(OSError, realpath, ABSTFN+"1", **kwargs)
++            self.assertRaises(OSError, realpath, ABSTFN+"2", **kwargs)
+
+-            self.assertRaises(OSError, realpath, ABSTFN+"1/x", strict=3D=
True)
+-            self.assertRaises(OSError, realpath, ABSTFN+"1/..", strict=3D=
True)
+-            self.assertRaises(OSError, realpath, ABSTFN+"1/../x", stric=
t=3DTrue)
++            self.assertRaises(OSError, realpath, ABSTFN+"1/x", **kwargs=
)
++            self.assertRaises(OSError, realpath, ABSTFN+"1/..", **kwarg=
s)
++            self.assertRaises(OSError, realpath, ABSTFN+"1/../x", **kwa=
rgs)
+             os.symlink(ABSTFN+"x", ABSTFN+"y")
+             self.assertRaises(OSError, realpath,
+-                              ABSTFN+"1/../" + basename(ABSTFN) + "y", =
strict=3DTrue)
++                              ABSTFN+"1/../" + basename(ABSTFN) + "y", =
**kwargs)
+             self.assertRaises(OSError, realpath,
+-                              ABSTFN+"1/../" + basename(ABSTFN) + "1", =
strict=3DTrue)
++                              ABSTFN+"1/../" + basename(ABSTFN) + "1", =
**kwargs)
+
+             os.symlink(basename(ABSTFN) + "a/b", ABSTFN+"a")
+-            self.assertRaises(OSError, realpath, ABSTFN+"a", strict=3DT=
rue)
++            self.assertRaises(OSError, realpath, ABSTFN+"a", **kwargs)
+
+             os.symlink("../" + basename(dirname(ABSTFN)) + "/" +
+                        basename(ABSTFN) + "c", ABSTFN+"c")
+-            self.assertRaises(OSError, realpath, ABSTFN+"c", strict=3DT=
rue)
++            self.assertRaises(OSError, realpath, ABSTFN+"c", **kwargs)
+
+             # Test using relative path as well.
+             with os_helper.change_cwd(dirname(ABSTFN)):
+-                self.assertRaises(OSError, realpath, basename(ABSTFN), =
strict=3DTrue)
++                self.assertRaises(OSError, realpath, basename(ABSTFN), =
**kwargs)
+         finally:
+             os_helper.unlink(ABSTFN)
+             os_helper.unlink(ABSTFN+"1")
+@@ -559,13 +692,14 @@ def test_realpath_symlink_loops_strict(self):
+
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_repeated_indirect_symlinks(self):
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_repeated_indirect_symlinks(self, kwargs):
+         # Issue #6975.
+         try:
+             os.mkdir(ABSTFN)
+             os.symlink('../' + basename(ABSTFN), ABSTFN + '/self')
+             os.symlink('self/self/self', ABSTFN + '/link')
+-            self.assertEqual(realpath(ABSTFN + '/link'), ABSTFN)
++            self.assertEqual(realpath(ABSTFN + '/link', **kwargs), ABST=
FN)
+         finally:
+             os_helper.unlink(ABSTFN + '/self')
+             os_helper.unlink(ABSTFN + '/link')
+@@ -573,14 +707,15 @@ def test_realpath_repeated_indirect_symlinks(self)=
:
+
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_deep_recursion(self):
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_deep_recursion(self, kwargs):
+         depth =3D 10
+         try:
+             os.mkdir(ABSTFN)
+             for i in range(depth):
+                 os.symlink('/'.join(['%d' % i] * 10), ABSTFN + '/%d' % =
(i + 1))
+             os.symlink('.', ABSTFN + '/0')
+-            self.assertEqual(realpath(ABSTFN + '/%d' % depth), ABSTFN)
++            self.assertEqual(realpath(ABSTFN + '/%d' % depth, **kwargs)=
, ABSTFN)
+
+             # Test using relative path as well.
+             with os_helper.change_cwd(ABSTFN):
+@@ -592,7 +727,8 @@ def test_realpath_deep_recursion(self):
+
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_resolve_parents(self):
++    @_parameterize({}, {'strict': ALLOW_MISSING})
++    def test_realpath_resolve_parents(self, kwargs):
+         # We also need to resolve any symlinks in the parents of a rela=
tive
+         # path passed to realpath. E.g.: current working directory is
+         # /usr/doc with 'doc' being a symlink to /usr/share/doc. We cal=
l
+@@ -603,7 +739,8 @@ def test_realpath_resolve_parents(self):
+             os.symlink(ABSTFN + "/y", ABSTFN + "/k")
+
+             with os_helper.change_cwd(ABSTFN + "/k"):
+-                self.assertEqual(realpath("a"), ABSTFN + "/y/a")
++                self.assertEqual(realpath("a", **kwargs),
++                                    ABSTFN + "/y/a")
+         finally:
+             os_helper.unlink(ABSTFN + "/k")
+             safe_rmdir(ABSTFN + "/y")
+@@ -611,7 +748,8 @@ def test_realpath_resolve_parents(self):
+
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_resolve_before_normalizing(self):
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_resolve_before_normalizing(self, kwargs):
+         # Bug #990669: Symbolic links should be resolved before we
+         # normalize the path. E.g.: if we have directories 'a', 'k' and=
 'y'
+         # in the following hierarchy:
+@@ -626,10 +764,10 @@ def test_realpath_resolve_before_normalizing(self)=
:
+             os.symlink(ABSTFN + "/k/y", ABSTFN + "/link-y")
+
+             # Absolute path.
+-            self.assertEqual(realpath(ABSTFN + "/link-y/.."), ABSTFN + =
"/k")
++            self.assertEqual(realpath(ABSTFN + "/link-y/..", **kwargs),=
 ABSTFN + "/k")
+             # Relative path.
+             with os_helper.change_cwd(dirname(ABSTFN)):
+-                self.assertEqual(realpath(basename(ABSTFN) + "/link-y/.=
."),
++                self.assertEqual(realpath(basename(ABSTFN) + "/link-y/.=
.", **kwargs),
+                                  ABSTFN + "/k")
+         finally:
+             os_helper.unlink(ABSTFN + "/link-y")
+@@ -639,7 +777,8 @@ def test_realpath_resolve_before_normalizing(self):
+
+     @os_helper.skip_unless_symlink
+     @skip_if_ABSTFN_contains_backslash
+-    def test_realpath_resolve_first(self):
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_resolve_first(self, kwargs):
+         # Bug #1213894: The first component of the path, if not absolut=
e,
+         # must be resolved too.
+
+@@ -649,13 +788,70 @@ def test_realpath_resolve_first(self):
+             os.symlink(ABSTFN, ABSTFN + "link")
+             with os_helper.change_cwd(dirname(ABSTFN)):
+                 base =3D basename(ABSTFN)
+-                self.assertEqual(realpath(base + "link"), ABSTFN)
+-                self.assertEqual(realpath(base + "link/k"), ABSTFN + "/=
k")
++                self.assertEqual(realpath(base + "link", **kwargs), ABS=
TFN)
++                self.assertEqual(realpath(base + "link/k", **kwargs), A=
BSTFN + "/k")
+         finally:
+             os_helper.unlink(ABSTFN + "link")
+             safe_rmdir(ABSTFN + "/k")
+             safe_rmdir(ABSTFN)
+
++    @os_helper.skip_unless_symlink
++    @skip_if_ABSTFN_contains_backslash
++    @unittest.skipIf(os.chmod not in os.supports_follow_symlinks, "Can'=
t set symlink permissions")
++    @unittest.skipIf(sys.platform !=3D "darwin", "only macOS requires r=
ead permission to readlink()")
++    @_parameterize({'strict': True}, {'strict': ALLOW_MISSING})
++    def test_realpath_unreadable_symlink_strict(self, kwargs):
++        try:
++            os.symlink(ABSTFN+"1", ABSTFN)
++            os.chmod(ABSTFN, 0o000, follow_symlinks=3DFalse)
++            with self.assertRaises(PermissionError):
++                realpath(ABSTFN, **kwargs)
++            with self.assertRaises(PermissionError):
++                realpath(ABSTFN + '/foo', **kwargs),
++            with self.assertRaises(PermissionError):
++                realpath(ABSTFN + '/../foo', **kwargs)
++            with self.assertRaises(PermissionError):
++                realpath(ABSTFN + '/foo/..', **kwargs)
++        finally:
++            os.chmod(ABSTFN, 0o755, follow_symlinks=3DFalse)
++            os.unlink(ABSTFN)
++
++    @skip_if_ABSTFN_contains_backslash
++    @os_helper.skip_unless_symlink
++    def test_realpath_unreadable_directory(self):
++        try:
++            os.mkdir(ABSTFN)
++            os.mkdir(ABSTFN + '/k')
++            os.chmod(ABSTFN, 0o000)
++            self.assertEqual(realpath(ABSTFN, strict=3DFalse), ABSTFN)
++            self.assertEqual(realpath(ABSTFN, strict=3DTrue), ABSTFN)
++            self.assertEqual(realpath(ABSTFN, strict=3DALLOW_MISSING), =
ABSTFN)
++
++            try:
++                os.stat(ABSTFN)
++            except PermissionError:
++                pass
++            else:
++                self.skipTest('Cannot block permissions')
++
++            self.assertEqual(realpath(ABSTFN + '/k', strict=3DFalse),
++                             ABSTFN + '/k')
++            self.assertRaises(PermissionError, realpath, ABSTFN + '/k',
++                              strict=3DTrue)
++            self.assertRaises(PermissionError, realpath, ABSTFN + '/k',
++                              strict=3DALLOW_MISSING)
++
++            self.assertEqual(realpath(ABSTFN + '/missing', strict=3DFal=
se),
++                             ABSTFN + '/missing')
++            self.assertRaises(PermissionError, realpath, ABSTFN + '/mis=
sing',
++                              strict=3DTrue)
++            self.assertRaises(PermissionError, realpath, ABSTFN + '/mis=
sing',
++                              strict=3DALLOW_MISSING)
++        finally:
++            os.chmod(ABSTFN, 0o755)
++            safe_rmdir(ABSTFN + '/k')
++            safe_rmdir(ABSTFN)
++
+     def test_relpath(self):
+         (real_getcwd, os.getcwd) =3D (os.getcwd, lambda: r"/home/user/b=
ar")
+         try:
+@@ -835,9 +1031,12 @@ def test_path_normpath(self):
+     def test_path_abspath(self):
+         self.assertPathEqual(self.path.abspath)
+
+-    def test_path_realpath(self):
++    @_parameterize({}, {'strict': True}, {'strict': ALLOW_MISSING})
++    def test_path_realpath(self, kwargs):
+         self.assertPathEqual(self.path.realpath)
+
++        self.assertPathEqual(partial(self.path.realpath, **kwargs))
++
+     def test_path_relpath(self):
+         self.assertPathEqual(self.path.relpath)
+
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index e28d0311826..1c598e11642 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -2627,7 +2627,8 @@ def test__all__(self):
+             'PAX_NUMBER_FIELDS', 'stn', 'nts', 'nti', 'itn', 'calc_chks=
ums',
+             'copyfileobj', 'filemode', 'EmptyHeaderError',
+             'TruncatedHeaderError', 'EOFHeaderError', 'InvalidHeaderErr=
or',
+-            'SubsequentHeaderError', 'ExFileObject', 'main'}
++            'SubsequentHeaderError', 'ExFileObject', 'main',
++            "LinkFallbackError"}
+         support.check__all__(self, tarfile, not_exported=3Dnot_exported=
)
+
+     def test_useful_error_message_when_modules_missing(self):
+@@ -2642,6 +2643,31 @@ def test_useful_error_message_when_modules_missin=
g(self):
+             str(excinfo.exception),
+         )
+
++    @unittest.skipUnless(os_helper.can_symlink(), 'requires symlink sup=
port')
++    @unittest.skipUnless(hasattr(os, 'chmod'), "missing os.chmod")
++    @unittest.mock.patch('os.chmod')
++    def test_deferred_directory_attributes_update(self, mock_chmod):
++        # Regression test for gh-127987: setting attributes on arbitrar=
y files
++        tempdir =3D os.path.join(TEMPDIR, 'test127987')
++        def mock_chmod_side_effect(path, mode, **kwargs):
++            target_path =3D os.path.realpath(path)
++            if os.path.commonpath([target_path, tempdir]) !=3D tempdir:
++                raise Exception("should not try to chmod anything outsi=
de the destination", target_path)
++        mock_chmod.side_effect =3D mock_chmod_side_effect
++
++        outside_tree_dir =3D os.path.join(TEMPDIR, 'outside_tree_dir')
++        with ArchiveMaker() as arc:
++            arc.add('x', symlink_to=3D'.')
++            arc.add('x', type=3Dtarfile.DIRTYPE, mode=3D'?rwsrwsrwt')
++            arc.add('x', symlink_to=3Doutside_tree_dir)
++
++        os.makedirs(outside_tree_dir)
++        try:
++            arc.open().extractall(path=3Dtempdir, filter=3D'tar')
++        finally:
++            os_helper.rmtree(outside_tree_dir)
++            os_helper.rmtree(tempdir)
++
+
+ class CommandLineTest(unittest.TestCase):
+
+@@ -3202,6 +3228,10 @@ def check_files_present(self, directory):
+         got_paths =3D set(
+             p.relative_to(directory)
+             for p in pathlib.Path(directory).glob('**/*'))
++        if self.extraction_filter =3D=3D 'data':
++            # The 'data' filter is expected to reject special files
++            for path in 'ustar/fifotype', 'ustar/blktype', 'ustar/chrty=
pe':
++                got_paths.discard(pathlib.Path(path))
+         self.assertEqual(self.control_paths, got_paths)
+
+     @contextmanager
+@@ -3428,12 +3458,28 @@ def __exit__(self, *exc):
+         self.bio =3D None
+
+     def add(self, name, *, type=3DNone, symlink_to=3DNone, hardlink_to=3D=
None,
+-            mode=3DNone, size=3DNone, **kwargs):
+-        """Add a member to the test archive. Call within `with`."""
++            mode=3DNone, size=3DNone, content=3DNone, **kwargs):
++        """Add a member to the test archive. Call within `with`.
++
++        Provides many shortcuts:
++        - default `type` is based on symlink_to, hardlink_to, and trail=
ing `/`
++          in name (which is stripped)
++        - size & content defaults are based on each other
++        - content can be str or bytes
++        - mode should be textual ('-rwxrwxrwx')
++
++        (add more! this is unstable internal test-only API)
++        """
+         name =3D str(name)
+         tarinfo =3D tarfile.TarInfo(name).replace(**kwargs)
++        if content is not None:
++            if isinstance(content, str):
++                content =3D content.encode()
++            size =3D len(content)
+         if size is not None:
+             tarinfo.size =3D size
++            if content is None:
++                content =3D bytes(tarinfo.size)
+         if mode:
+             tarinfo.mode =3D _filemode_to_int(mode)
+         if symlink_to is not None:
+@@ -3447,7 +3493,7 @@ def add(self, name, *, type=3DNone, symlink_to=3DN=
one, hardlink_to=3DNone,
+         if type is not None:
+             tarinfo.type =3D type
+         if tarinfo.isreg():
+-            fileobj =3D io.BytesIO(bytes(tarinfo.size))
++            fileobj =3D io.BytesIO(content)
+         else:
+             fileobj =3D None
+         self.tar_w.addfile(tarinfo, fileobj)
+@@ -3481,7 +3527,7 @@ class TestExtractionFilters(unittest.TestCase):
+     destdir =3D outerdir / 'dest'
+
+     @contextmanager
+-    def check_context(self, tar, filter):
++    def check_context(self, tar, filter, *, check_flag=3DTrue):
+         """Extracts `tar` to `self.destdir` and allows checking the res=
ult
+
+         If an error occurs, it must be checked using `expect_exception`
+@@ -3490,27 +3536,40 @@ def check_context(self, tar, filter):
+         except the destination directory itself and parent directories =
of
+         other files.
+         When checking directories, do so before their contents.
++
++        A file called 'flag' is made in outerdir (i.e. outside destdir)
++        before extraction; it should not be altered nor should its cont=
ents
++        be read/copied.
+         """
+         with os_helper.temp_dir(self.outerdir):
++            flag_path =3D self.outerdir / 'flag'
++            flag_path.write_text('capture me')
+             try:
+                 tar.extractall(self.destdir, filter=3Dfilter)
+             except Exception as exc:
+                 self.raised_exception =3D exc
++                self.reraise_exception =3D True
+                 self.expected_paths =3D set()
+             else:
+                 self.raised_exception =3D None
++                self.reraise_exception =3D False
+                 self.expected_paths =3D set(self.outerdir.glob('**/*'))
+                 self.expected_paths.discard(self.destdir)
++                self.expected_paths.discard(flag_path)
+             try:
+-                yield
++                yield self
+             finally:
+                 tar.close()
+-            if self.raised_exception:
++            if self.reraise_exception:
+                 raise self.raised_exception
+             self.assertEqual(self.expected_paths, set())
++            if check_flag:
++                self.assertEqual(flag_path.read_text(), 'capture me')
++            else:
++                assert filter =3D=3D 'fully_trusted'
+
+     def expect_file(self, name, type=3DNone, symlink_to=3DNone, mode=3D=
None,
+-                    size=3DNone):
++                    size=3DNone, content=3DNone):
+         """Check a single file. See check_context."""
+         if self.raised_exception:
+             raise self.raised_exception
+@@ -3529,26 +3588,45 @@ def expect_file(self, name, type=3DNone, symlink=
_to=3DNone, mode=3DNone,
+             # The symlink might be the same (textually) as what we expe=
ct,
+             # but some systems change the link to an equivalent path, s=
o
+             # we fall back to samefile().
+-            if expected !=3D got:
+-                self.assertTrue(got.samefile(expected))
++            try:
++                if expected !=3D got:
++                    self.assertTrue(got.samefile(expected))
++            except Exception as e:
++                # attach a note, so it's shown even if `samefile` fails
++                e.add_note(f'{expected=3D}, {got=3D}')
++                raise
+         elif type =3D=3D tarfile.REGTYPE or type is None:
+             self.assertTrue(path.is_file())
+         elif type =3D=3D tarfile.DIRTYPE:
+             self.assertTrue(path.is_dir())
+         elif type =3D=3D tarfile.FIFOTYPE:
+             self.assertTrue(path.is_fifo())
++        elif type =3D=3D tarfile.SYMTYPE:
++            self.assertTrue(path.is_symlink())
+         else:
+             raise NotImplementedError(type)
+         if size is not None:
+             self.assertEqual(path.stat().st_size, size)
++        if content is not None:
++            self.assertEqual(path.read_text(), content)
+         for parent in path.parents:
+             self.expected_paths.discard(parent)
+
++    def expect_any_tree(self, name):
++        """Check a directory; forget about its contents."""
++        tree_path =3D (self.destdir / name).resolve()
++        self.expect_file(tree_path, type=3Dtarfile.DIRTYPE)
++        self.expected_paths =3D {
++            p for p in self.expected_paths
++            if tree_path not in p.parents
++        }
++
+     def expect_exception(self, exc_type, message_re=3D'.'):
+         with self.assertRaisesRegex(exc_type, message_re):
+             if self.raised_exception is not None:
+                 raise self.raised_exception
+-        self.raised_exception =3D None
++        self.reraise_exception =3D False
++        return self.raised_exception
+
+     def test_benign_file(self):
+         with ArchiveMaker() as arc:
+@@ -3633,6 +3711,80 @@ def test_parent_symlink(self):
+             with self.check_context(arc.open(), 'data'):
+                 self.expect_file('parent/evil')
+
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_realpath_limit_attack(self):
++        # (CVE-2025-4517)
++
++        with ArchiveMaker() as arc:
++            # populate the symlinks and dirs that expand in os.path.rea=
lpath()
++            # The component length is chosen so that in common cases, t=
he unexpanded
++            # path fits in PATH_MAX, but it overflows when the final sy=
mlink
++            # is expanded
++            steps =3D "abcdefghijklmnop"
++            if sys.platform =3D=3D 'win32':
++                component =3D 'd' * 25
++            elif 'PC_PATH_MAX' in os.pathconf_names:
++                max_path_len =3D os.pathconf(self.outerdir.parent, "PC_=
PATH_MAX")
++                path_sep_len =3D 1
++                dest_len =3D len(str(self.destdir)) + path_sep_len
++                component_len =3D (max_path_len - dest_len) // (len(ste=
ps) + path_sep_len)
++                component =3D 'd' * component_len
++            else:
++                raise NotImplementedError("Need to guess component leng=
th for {sys.platform}")
++            path =3D ""
++            step_path =3D ""
++            for i in steps:
++                arc.add(os.path.join(path, component), type=3Dtarfile.D=
IRTYPE,
++                        mode=3D'drwxrwxrwx')
++                arc.add(os.path.join(path, i), symlink_to=3Dcomponent)
++                path =3D os.path.join(path, component)
++                step_path =3D os.path.join(step_path, i)
++            # create the final symlink that exceeds PATH_MAX and simply=
 points
++            # to the top dir.
++            # this link will never be expanded by
++            # os.path.realpath(strict=3DFalse), nor anything after it.
++            linkpath =3D os.path.join(*steps, "l"*254)
++            parent_segments =3D [".."] * len(steps)
++            arc.add(linkpath, symlink_to=3Dos.path.join(*parent_segment=
s))
++            # make a symlink outside to keep the tar command happy
++            arc.add("escape", symlink_to=3Dos.path.join(linkpath, "..")=
)
++            # use the symlinks above, that are not checked, to create a=
 hardlink
++            # to a file outside of the destination path
++            arc.add("flaglink", hardlink_to=3Dos.path.join("escape", "f=
lag"))
++            # now that we have the hardlink we can overwrite the file
++            arc.add("flaglink", content=3D'overwrite')
++            # we can also create new files as well!
++            arc.add("escape/newfile", content=3D'new')
++
++        with (self.subTest('fully_trusted'),
++              self.check_context(arc.open(), filter=3D'fully_trusted',
++                                 check_flag=3DFalse)):
++            if sys.platform =3D=3D 'win32':
++                self.expect_exception((FileNotFoundError, FileExistsErr=
or))
++            elif self.raised_exception:
++                # Cannot symlink/hardlink: tarfile falls back to getmem=
ber()
++                self.expect_exception(KeyError)
++                # Otherwise, this block should never enter.
++            else:
++                self.expect_any_tree(component)
++                self.expect_file('flaglink', content=3D'overwrite')
++                self.expect_file('../newfile', content=3D'new')
++                self.expect_file('escape', type=3Dtarfile.SYMTYPE)
++                self.expect_file('a', symlink_to=3Dcomponent)
++
++        for filter in 'tar', 'data':
++            with self.subTest(filter), self.check_context(arc.open(), f=
ilter=3Dfilter):
++                exc =3D self.expect_exception((OSError, KeyError))
++                if isinstance(exc, OSError):
++                    if sys.platform =3D=3D 'win32':
++                        # 3: ERROR_PATH_NOT_FOUND
++                        # 5: ERROR_ACCESS_DENIED
++                        # 206: ERROR_FILENAME_EXCED_RANGE
++                        self.assertIn(exc.winerror, (3, 5, 206))
++                    else:
++                        self.assertEqual(exc.errno, errno.ENAMETOOLONG)
++
+     @symlink_test
+     def test_parent_symlink2(self):
+         # Test interplaying symlinks
+@@ -3855,8 +4007,8 @@ def test_chains(self):
+             arc.add('symlink2', symlink_to=3Dos.path.join(
+                 'linkdir', 'hardlink2'))
+             arc.add('targetdir/target', size=3D3)
+-            arc.add('linkdir/hardlink', hardlink_to=3D'targetdir/target=
')
+-            arc.add('linkdir/hardlink2', hardlink_to=3D'linkdir/symlink=
')
++            arc.add('linkdir/hardlink', hardlink_to=3Dos.path.join('tar=
getdir', 'target'))
++            arc.add('linkdir/hardlink2', hardlink_to=3Dos.path.join('li=
nkdir', 'symlink'))
+
+         for filter in 'tar', 'data', 'fully_trusted':
+             with self.check_context(arc.open(), filter):
+@@ -3872,6 +4024,129 @@ def test_chains(self):
+                     self.expect_file('linkdir/symlink', size=3D3)
+                     self.expect_file('symlink2', size=3D3)
+
++    @symlink_test
++    def test_sneaky_hardlink_fallback(self):
++        # (CVE-2025-4330)
++        # Test that when hardlink extraction falls back to extracting m=
embers
++        # from the archive, the extracted member is (re-)filtered.
++        with ArchiveMaker() as arc:
++            # Create a directory structure so the c/escape symlink stay=
s
++            # inside the path
++            arc.add("a/t/dummy")
++            # Create b/ directory
++            arc.add("b/")
++            # Point "c" to the bottom of the tree in "a"
++            arc.add("c", symlink_to=3Dos.path.join("a", "t"))
++            # link to non-existant location under "a"
++            arc.add("c/escape", symlink_to=3Dos.path.join("..", "..",
++                                                        "link_here"))
++            # Move "c" to point to "b" ("c/escape" no longer exists)
++            arc.add("c", symlink_to=3D"b")
++            # Attempt to create a hard link to "c/escape". Since it doe=
sn't
++            # exist it will attempt to extract "cescape" but at "boom".
++            arc.add("boom", hardlink_to=3Dos.path.join("c", "escape"))
++
++        with self.check_context(arc.open(), 'data'):
++            if not os_helper.can_symlink():
++                # When 'c/escape' is extracted, 'c' is a regular
++                # directory, and 'c/escape' *would* point outside
++                # the destination if symlinks were allowed.
++                self.expect_exception(
++                    tarfile.LinkOutsideDestinationError)
++            elif sys.platform =3D=3D "win32":
++                # On Windows, 'c/escape' points outside the destination
++                self.expect_exception(tarfile.LinkOutsideDestinationErr=
or)
++            else:
++                e =3D self.expect_exception(
++                    tarfile.LinkFallbackError,
++                    "link 'boom' would be extracted as a copy of "
++                    + "'c/escape', which was rejected")
++                self.assertIsInstance(e.__cause__,
++                                      tarfile.LinkOutsideDestinationErr=
or)
++        for filter in 'tar', 'fully_trusted':
++            with self.subTest(filter), self.check_context(arc.open(), f=
ilter):
++                if not os_helper.can_symlink():
++                    self.expect_file("a/t/dummy")
++                    self.expect_file("b/")
++                    self.expect_file("c/")
++                else:
++                    self.expect_file("a/t/dummy")
++                    self.expect_file("b/")
++                    self.expect_file("a/t/escape", symlink_to=3D'../../=
link_here')
++                    self.expect_file("boom", symlink_to=3D'../../link_h=
ere')
++                    self.expect_file("c", symlink_to=3D'b')
++
++    @symlink_test
++    def test_exfiltration_via_symlink(self):
++        # (CVE-2025-4138)
++        # Test changing symlinks that result in a symlink pointing outs=
ide
++        # the extraction directory, unless prevented by 'data' filter's
++        # normalization.
++        with ArchiveMaker() as arc:
++            arc.add("escape", symlink_to=3Dos.path.join('link', 'link',=
 '..', '..', 'link-here'))
++            arc.add("link", symlink_to=3D'./')
++
++        for filter in 'tar', 'data', 'fully_trusted':
++            with self.check_context(arc.open(), filter):
++                if os_helper.can_symlink():
++                    self.expect_file("link", symlink_to=3D'./')
++                    if filter =3D=3D 'data':
++                        self.expect_file("escape", symlink_to=3D'link-h=
ere')
++                    else:
++                        self.expect_file("escape",
++                                         symlink_to=3D'link/link/../../=
link-here')
++                else:
++                    # Nothing is extracted.
++                    pass
++
++    @symlink_test
++    def test_chmod_outside_dir(self):
++        # (CVE-2024-12718)
++        # Test that members used for delayed updates of directory metad=
ata
++        # are (re-)filtered.
++        with ArchiveMaker() as arc:
++            # "pwn" is a veeeery innocent symlink:
++            arc.add("a/pwn", symlink_to=3D'.')
++            # But now "pwn" is also a directory, so it's scheduled to h=
ave its
++            # metadata updated later:
++            arc.add("a/pwn/", mode=3D'drwxrwxrwx')
++            # Oops, "pwn" is not so innocent any more:
++            arc.add("a/pwn", symlink_to=3D'x/../')
++            # Newly created symlink points to the dest dir,
++            # so it's OK for the "data" filter.
++            arc.add('a/x', symlink_to=3D('../'))
++            # But now "pwn" points outside the dest dir
++
++        for filter in 'tar', 'data', 'fully_trusted':
++            with self.check_context(arc.open(), filter) as cc:
++                if not os_helper.can_symlink():
++                    self.expect_file("a/pwn/")
++                elif filter =3D=3D 'data':
++                    self.expect_file("a/x", symlink_to=3D'../')
++                    self.expect_file("a/pwn", symlink_to=3D'.')
++                else:
++                    self.expect_file("a/x", symlink_to=3D'../')
++                    self.expect_file("a/pwn", symlink_to=3D'x/../')
++                if sys.platform !=3D "win32":
++                    st_mode =3D cc.outerdir.stat().st_mode
++                    self.assertNotEqual(st_mode & 0o777, 0o777)
++
++    def test_link_fallback_normalizes(self):
++        # Make sure hardlink fallbacks work for non-normalized paths fo=
r all
++        # filters
++        with ArchiveMaker() as arc:
++            arc.add("dir/")
++            arc.add("dir/../afile")
++            arc.add("link1", hardlink_to=3D'dir/../afile')
++            arc.add("link2", hardlink_to=3D'dir/../dir/../afile')
++
++        for filter in 'tar', 'data', 'fully_trusted':
++            with self.check_context(arc.open(), filter) as cc:
++                self.expect_file("dir/")
++                self.expect_file("afile")
++                self.expect_file("link1")
++                self.expect_file("link2")
++
+     def test_modes(self):
+         # Test how file modes are extracted
+         # (Note that the modes are ignored on platforms without working=
 chmod)
+@@ -3985,7 +4260,7 @@ def test_tar_filter(self):
+         # The 'tar' filter returns TarInfo objects with the same name/t=
ype.
+         # (It can also fail for particularly "evil" input, but we don't=
 have
+         # that in the test archive.)
+-        with tarfile.TarFile.open(tarname) as tar:
++        with tarfile.TarFile.open(tarname, encoding=3D"iso8859-1") as t=
ar:
+             for tarinfo in tar.getmembers():
+                 filtered =3D tarfile.tar_filter(tarinfo, '')
+                 self.assertIs(filtered.name, tarinfo.name)
+@@ -3994,7 +4269,7 @@ def test_tar_filter(self):
+     def test_data_filter(self):
+         # The 'data' filter either raises, or returns TarInfo with the =
same
+         # name/type.
+-        with tarfile.TarFile.open(tarname) as tar:
++        with tarfile.TarFile.open(tarname, encoding=3D"iso8859-1") as t=
ar:
+             for tarinfo in tar.getmembers():
+                 try:
+                     filtered =3D tarfile.data_filter(tarinfo, '')
+@@ -4124,13 +4399,13 @@ def valueerror_filter(tarinfo, path):
+         # If errorlevel is 0, errors affected by errorlevel are ignored
+
+         with self.check_context(arc.open(errorlevel=3D0), extracterror_=
filter):
+-            self.expect_file('file')
++            pass
+
+         with self.check_context(arc.open(errorlevel=3D0), filtererror_f=
ilter):
+-            self.expect_file('file')
++            pass
+
+         with self.check_context(arc.open(errorlevel=3D0), oserror_filte=
r):
+-            self.expect_file('file')
++            pass
+
+         with self.check_context(arc.open(errorlevel=3D0), tarerror_filt=
er):
+             self.expect_exception(tarfile.TarError)
+@@ -4141,7 +4416,7 @@ def valueerror_filter(tarinfo, path):
+         # If 1, all fatal errors are raised
+
+         with self.check_context(arc.open(errorlevel=3D1), extracterror_=
filter):
+-            self.expect_file('file')
++            pass
+
+         with self.check_context(arc.open(errorlevel=3D1), filtererror_f=
ilter):
+             self.expect_exception(tarfile.FilterError)
+diff --git a/Misc/NEWS.d/next/Security/2025-06-02-11-32-23.gh-issue-1350=
34.RLGjbp.rst b/Misc/NEWS.d/next/Security/2025-06-02-11-32-23.gh-issue-13=
5034.RLGjbp.rst
+new file mode 100644
+index 00000000000..08a0087e203
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2025-06-02-11-32-23.gh-issue-135034.RLGj=
bp.rst
+@@ -0,0 +1,6 @@
++Fixes multiple issues that allowed ``tarfile`` extraction filters
++(``filter=3D"data"`` and ``filter=3D"tar"``) to be bypassed using craft=
ed
++symlinks and hard links.
++
++Addresses :cve:`2024-12718`, :cve:`2025-4138`, :cve:`2025-4330`, and :c=
ve:`2025-4517`.
++
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.9.bb b/meta/recipe=
s-devtools/python/python3_3.12.9.bb
index 8e03ff5f2b..bbba622b41 100644
--- a/meta/recipes-devtools/python/python3_3.12.9.bb
+++ b/meta/recipes-devtools/python/python3_3.12.9.bb
@@ -35,6 +35,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-ctypes-correct-gcc-check-in-test.patch \
+           file://0001-3.12-gh-135034-Normalize-link-targets-in-tarfile-=
add.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.40.0


