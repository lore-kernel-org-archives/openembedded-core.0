Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6636.1606311051097155170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=pmBaBMqk;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=2307; q=dns/txt; s=axis-central1;
  t=1606311051; x=1637847051;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MpPu4podu2UKnnj56/VCUZpyaeUXc+ottPxtU7NWpP0=;
  b=pmBaBMqkzJc1lIgyR5xdMtHtaMZIM3cb/lhHYISkq1xyjCutO+gwfJT/
   EoKqlEAHtFU7S0a+QJruzMpS5cOac3Knwckfb2wpGgSs/ErDyCxFrnR6s
   pytIYGdwLOVWxtMOQQswThxbrMU5bVPdz8s0IN/9ks+x5DkUsu7zlODHM
   13I3oquSHrqZ9fnOrA4cwPuCYvctZY6BCqfJp1jssXEtSAQrBP9+y2Zbp
   H6rNpL46nWpTyp/oZIE4ZvpeDWgfawttmiypB13lOusX8Y7pM2oiB6mic
   OB01dFFLVG6u8ZSDpD8oGPtO0YWdu/406/0orwDYMerl/BOUfEDZMS5r6
   A==;
IronPort-SDR: vOu8R3JrZhhK1BCjbATfIvuuZ71izxhDvW7OWPc2Ot/kc+p9MBZX6HFvfclBwYRZffgRy5k94Y
 bieJMvwALQjssVRmvAcKSuCY7vB7Gmuzz0vts3PJ/WgGsFf0uHdloZzjhQHuEgPqczvQyJSgQ+
 R/6yD/XhFFEQDPLGZigm/D5wKr1k77SW01rxTS1BTBp7Y0o5gT/yW+FuV90H/0cklTza3YdCjC
 uQ7Qf6xPO9j7qT+o0CedcG8tPJ4HC9H9ojqA+LzYyymrjLoHZxTwvKMgPwWLPt+ub1t11iSoiR
 Wtg=
X-IronPort-AV: E=Sophos;i="5.78,368,1599516000"; 
   d="scan'208";a="15421897"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/4] Support symbolic links in paths in PSEUDO_IGNORE_PATHS
Date: Wed, 25 Nov 2020 14:30:36 +0100
Message-ID: <cover.1606310940.git.pkj@axis.com>
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
 meta/conf/machine/include/tune-thunderx.inc   |  2 +-
 ...ssen-indentation-of-pseudo_client_ig.patch | 69 +++++++++++++++++++
 ...mplify-pseudo_client_ignore_path_chr.patch | 50 ++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +
 scripts/contrib/bb-perf/bb-matrix-plot.sh     |  8 ++-
 scripts/lib/wic/partition.py                  |  2 +-
 8 files changed, 135 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch

