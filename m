Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10289.1607533515279407702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 09:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=mcHRjCmf;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1607533515;
  x=1639069515;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uxSoiYzOEtYq9cwWj1UkOxKE3FGpAmO+KFAlh/Mqqn0=;
  b=mcHRjCmf1AjgyI3XDc4fGW32Xbl7QV/DrjZUux7QgOaIotLn1wT5mika
   ZgX2RO5fOyeXQvVWKqYBLrcJOAAivSAAlzbtGK1q6pVlwTQ5E8o069+rQ
   CHeua3dhLSa16ZKdVAMtapW+BSL9FxNegZ1pCkitDckQwjnCrmC40kLun
   vEB0seBFaMSkaNgvWRQ9O1kz0aQEJaxQwmLIGVb5DNUPx3Lde/SDgAqDC
   uwv05dJ3HJm9nB6BHO+uEZaZZl0ZJAag9W5A1jordOclBHimOowmpqsBh
   fmpozrk7bN3liMsubB8AA9ENtld86FvqNX02G3dbW/anZMSEUbBLnjM3Y
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv4 0/3] Support symbolic links in paths in PSEUDO_IGNORE_PATHS
Date: Wed, 9 Dec 2020 18:05:06 +0100
Message-ID: <cover.1607533369.git.pkj@axis.com>
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
PATCHv4:
  * Rewrote oe.path.canonicalize() to maintain trailing slashes
    present in the paths.

//Peter

The following changes since commit 9826881036191be6ffba98c9bc8a86d1b852ff41:

  build-appliance-image: Update to master head revision (2020-12-09 12:36:32 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/pseudo-ignore

Peter Kjellerstedt (3):
  lib/oe/path: Add canonicalize()
  bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
  wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS

 meta/conf/bitbake.conf       |  4 ++--
 meta/lib/oe/path.py          | 21 +++++++++++++++++++++
 scripts/lib/wic/partition.py | 12 +++++++++++-
 3 files changed, 34 insertions(+), 3 deletions(-)

