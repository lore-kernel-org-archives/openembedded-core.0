Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.10408.1607533515477315624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 09:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=HSmR5zmo;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1607533516;
  x=1639069516;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HWhC/a6PYzNNepg0t54RjlbeJZpAlhs9U1ETV0iT3bM=;
  b=HSmR5zmo/rLUrT01BLKaM5RQayK+nqBK4ApScoRMADiXqh64K+eo2mn4
   92BNhtl1CY9qj6DYawYy2tkaabE0YuQdBwTpBc65/x9E+wcYx8b+c8OMl
   410gsGVzuS1XN52hXiL3PGWqd+9/kdUuiG+uebVBoKG7vWvCE2PNfkyhQ
   XxH8WOOKpG/q9I3Ev7Cf9lfJS5ikVhKHBJMNHWRPAC3x9Piq8YNmTBmRm
   Yz0zTTg1mSpU96axcBmrlW2OH8bQKzaRy7T8HXJbKnwhXHKcclHUFPx3m
   0K4K/kFraGKrsGs/JCqOqAA//CvjHLnTnuItdKsxV2J2T6cLibqDNv8Ei
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv4 1/3] lib/oe/path: Add canonicalize()
Date: Wed, 9 Dec 2020 18:05:07 +0100
Message-ID: <70cdd65b31ebf453e84e8b01dd5d705d3883b5e6.1607533369.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1607533369.git.pkj@axis.com>
References: <cover.1607533369.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

oe.path.canonicalize() is used to canonicalize paths (i.e., remove
symbolic links and "..", and make them absolute). It takes a string
with paths separated by commas, and returns the canonicalized path in
the same format.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/path.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 082972457b..c8d8ad05b9 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -320,3 +320,24 @@ def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=F
 
     return files
 
+def canonicalize(paths, sep=','):
+    """Given a string with paths (separated by commas by default), expand
+    each path using os.path.realpath() and return the resulting paths as a
+    string (separated using the same separator a the original string).
+    """
+    # Ignore paths containing "$" as they are assumed to be unexpanded bitbake
+    # variables. Normally they would be ignored, e.g., when passing the paths
+    # through the shell they would expand to empty strings. However, when they
+    # are passed through os.path.realpath(), it will cause them to be prefixed
+    # with the absolute path to the current directory and thus not be empty
+    # anymore.
+    #
+    # Also maintain trailing slashes, as the paths may actually be used as
+    # prefixes in sting compares later on, where the slashes then are important.
+    canonical_paths = []
+    for path in (paths or '').split(sep):
+        if '$' not in path:
+            trailing_slash = path.endswith('/') and '/' or ''
+            canonical_paths.append(os.path.realpath(path) + trailing_slash)
+
+    return sep.join(canonical_paths)
