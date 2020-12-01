Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.358.1606846332325516692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=EaCjTtXl;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=2536; q=dns/txt; s=axis-central1;
  t=1606846332; x=1638382332;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wUgx778p3aL6Zod+kGQ4old2G6uxuUhSj6YSA/plrUw=;
  b=EaCjTtXl5fZAZbLlbpnP1Zio7+z6r9+EvGCBcPqJjZ/Kqw0asCwUMCHJ
   Hiu0hQHto8aY4wk5qy01yGiATyHwKP08XVa4v4LUaMXQRK4pFMJYlIifk
   k+mkv+YAYTVBpAz7OI2emnUDkkfyEUlOpmPSOas+vWcbK9o5zYaTax6zW
   RvPQ7UQPNveUgYlfIh08HS8Ct7H5/awzleHSVKrTsykvwQIirL3HE3Hx3
   CXPbdylW89zTBhCKg8EaDRhtuRPAz6h1rterhDpYjcmTvJwj1NftEYkNy
   ACVx1YjhRH5+3guPbt5MnjdEVUk4eUy9kBcKEjqsD5qok4tCxN0JMPAhC
   w==;
IronPort-SDR: WeGdnAfWz3iuqUeUbxKyI6I+rgqP6U8jgdF8ZG0WVP0uM7w+5rn5Q6NAgRnhtGEOLFkOdH4O1o
 lgVy9T434j5STTeMXaXUFssyPP8vDaZDfNbf5M9lKHCPtFb9cshs7OsrHycUK9a9FtUL+I3C7I
 +FERfD4wxdmxCo/VkpOCH50dVQpj4dZgglo5VW/WBJmJxMGqxMaHB3dHwFlK5eLlER1rVivkJs
 8GLsELlxYkVIfo8g6JvxxWxX2hQzUM3kSdBQukcyM4/4xJrITRkoVE3AzvyIJ4gzEvzhJAfZtf
 iLY=
X-IronPort-AV: E=Sophos;i="5.78,385,1599516000"; 
   d="scan'208";a="15074581"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 0/5] Support symbolic links in paths in PSEUDO_IGNORE_PATHS
Date: Tue, 1 Dec 2020 19:11:46 +0100
Message-ID: <cover.1606846217.git.pkj@axis.com>
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
function oe.path.canonicalize(), which is then used when passing 
${PSEUDO_IGNORE_PATHS} to pseudo.

There is also one patch that adds two patches to pseudo to clean up
pseudo_client_ignore_path_chroot(), and they also plug a memory leak.
The patches were brought about as I initially intended to do the
canonicalization in pseudo itself in this function.

I have not tested the change to wic as we do not use it, though I do
not expect it to be problematic.

PATCHv2: 
  * Removed some unrelated changes in the second patch.
PATCHv3: 
  * Handle an edge case in pseudo_client_ignore_path_chroot() in case
    PSEUDO_IGNORE_PATHS contains ",," or leading/trailing commas.
  * Introduce oe.path.canonicalize() and use it instead of adding
    PSEUDO_IGNORE_REAL_PATHS as was previously done.
  * Add similar code to wic.

//Peter

The following changes since commit 0ac99625bf2c8a19d4ee746dc13e9c6b2e1956e2:

  python3-numpy: Add ptest (2020-11-30 14:42:22 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/pseudo-ignore

Peter Kjellerstedt (5):
  pseudo: Simplify pseudo_client_ignore_path_chroot()
  bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
  lib/oe/path: Add canonicalize()
  bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
  wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS

 meta/conf/bitbake.conf                        |  6 +-
 meta/lib/oe/path.py                           | 12 ++++
 ...ssen-indentation-of-pseudo_client_ig.patch | 69 +++++++++++++++++++
 ...mplify-pseudo_client_ignore_path_chr.patch | 50 ++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +
 scripts/lib/wic/partition.py                  |  6 +-
 6 files changed, 141 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch

