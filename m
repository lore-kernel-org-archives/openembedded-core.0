Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.6953.1606312098313518383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IuldzEN8;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=2257; q=dns/txt; s=axis-central1;
  t=1606312098; x=1637848098;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0gsAXQgNXIXtAr2sXTe6FTXrZPTcpmJf4emvR+detXg=;
  b=IuldzEN84lo44rwxgkbblxRJK3c/q7CAujUvRtwL48yTAzMpW7xK3CZW
   RUs6hlC58bdCe7CG5mrGpy8vbQ/uzbfD9MK95zOInXiWH136B+5TiqzTq
   7W1dmNGz2YWzk52Ptk8NK8Q0bqqvgNCOWAdRFxC0Bqv+W4tMfXucbfz2E
   uIRqeoEomGFuhYPwasBLcVkJvicmkr5ZRK+yN9Qdb6hJ0/sk1X33ANZAs
   uOyheB3QE9KeOlwxHgv0+W8mRIb5VUFXofeP38YO7oJbEFouyMOD0sB51
   ip0FEpMYdlpXSwBxcE88pkGmDtuXBrAS9WN3D2LzK6vfdUTQI1f4QGkoJ
   Q==;
IronPort-SDR: bPgn6LX/rm/K3J7GfD2D1tJZHR7S5BqzSFLuRWUW+vIy/VE8upFivGfcB7bqS//G9Tzuo6kOzK
 X3qbmwySjHELLwVzd6A9EaHcgNiucPu8szKH8DI0ixY+YuA7CLerr3gnnklSqqIFFrpTmzLkNf
 B8Q/loOy12dL+m0RtxPffwtxzVbJvt5XmxVxQ+WRDHf66q5A76VB6Ui9DokBR5LKBm70bxncTF
 sNI5zU9IgtB5FGZMOwTnw84sCPm09tIC0kPqL4ovFaXc1mFJ6f39+AAdTp5vlN8wLT+UM063V5
 xtw=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="15422710"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 0/4] Support symbolic links in paths in PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:48:09 +0100
Message-ID: <cover.1606312002.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The changes in this patch series aim to rectify a problem with pseudo
and its support for ignoring paths. When pseudo compares a path to the
paths specified in PSEUDO_IGNORE_PATHS, it uses a path that has been
canonicalized. However, it does not canonicalize the paths in
PSEUDO_IGNORE_PATHS itself and unless they are canonicalized, they
will not match as intended. Thus the paths in PSEUDO_IGNORE_PATHS
needs to be canonicalized. These patches do that by adding a new
PSEUDO_IGNORE_REAL_PATHS variable, which contains the paths from
PSEUDO_IGNORE_PATHS after having run them through os.path.realpath().

There is also one patch that adds two patches to pseudo to clean up
pseudo_client_ignore_path_chroot(), and they also plug a memory leak.
The patches were brought about as I initially intended to do the
canonicalization in pseudo itself in this function.

I have not tested the change to wic as we do not use it, though I do
not expect it to be problematic.

PATCHv2: Removed some unrelated changes in the second patch.

//Peter

The following changes since commit 3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292:

  uninative: Don't use single sstate for pseudo-native (2020-11-24 15:53:07 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/pseudo-ignore

Peter Kjellerstedt (4):
  pseudo: Simplify pseudo_client_ignore_path_chroot()
  bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
  bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
  wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS

 meta/classes/image_types_wic.bbclass          |  2 +-
 meta/conf/bitbake.conf                        | 10 +--
 ...ssen-indentation-of-pseudo_client_ig.patch | 69 +++++++++++++++++++
 ...mplify-pseudo_client_ignore_path_chr.patch | 50 ++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +
 scripts/lib/wic/partition.py                  |  2 +-
 6 files changed, 129 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch

