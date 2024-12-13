Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2090E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 19:48:28 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.4075.1734119303933183112
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 11:48:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3eb4ac63dc2so1075488b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 11:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734119303; x=1734724103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qQ862O8lGOdX/5bWAxynpGbNDgJU+k+522qdACH/Pw=;
        b=DTO2s/dE7/FUyU70Bck35Yd2z01pk4LdLhLq5gTolbIrRZnwhL2PGMb1n1LbliBd0i
         48uY7e2IBwOlVeYJkfzbfo/5DrHFd7kst5UHpt5VSC6TKSjPcIg10bVEgaEMV1C4iPV6
         KWzVmFW11DnuoWXxRI2+FUSUHrFLglvRLNhadv5yAbentMRfYf2wHLpV0fjfz7lkJBqO
         YtHr8057+x53J16cJxWykm3FdUl9CDzNv+0SNQ2s/Uu9LeWTRcjNvlQw8p7fC9ztNHXO
         h0w9Ze8gbPEqkuILWVYsANhIxi2LRy4ZJXFl2Nnkd5rki0JsXJw97hdx8A9wfuSVgpF/
         gIvw==
X-Gm-Message-State: AOJu0YzfbtjboktYkm8c26BAzoNxzMvX7PHF3nTxPZjltn+lNMwqlGap
	g/J9c05ZVMCx10vnhWFuM8Yf8tTyt0y83YirXLON2FF6EkvvqBa0Mtr1eg==
X-Gm-Gg: ASbGncvAxchJMcKZmlQTFMMo7mxUJsYNc4UpsV3LsiPX+wIDNVBMRQzlSbD+g/3LnBt
	cQbEXmPP6QcQBioQvTCwPEzUyXKsQZ+rJ2C8HTdKw3bqgvgrE41PQc2GZjlPUkeyW/7zU620XHs
	GlCQbxYOiZI2GSLS5cUgNNJAR9aiFq26/ICugZzYEx75ZR3efXFEYJzyIaYWr9QECEeSqANMFPU
	Zk3xezZDSeNvpoVUG4lLsaOnCQoRw0SYlRcCuSG8uMz9HwoYNW4Ltix7XGD6AW7SuibJvYpcehI
	7tWcZvBOZaHRdbtKtJcIWTzSjQ==
X-Google-Smtp-Source: AGHT+IEKgghsgy4grfVFGH5ylBBEwkL2LQoN31QEk2R9h95Gj4zHG27qXQCsnBix0svakcd0E56sdg==
X-Received: by 2002:a05:6808:2384:b0:3ea:431c:4f70 with SMTP id 5614622812f47-3eba65cb9e1mr1923421b6e.0.1734119302541;
        Fri, 13 Dec 2024 11:48:22 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ebb493a875sm13895b6e.46.2024.12.13.11.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 11:48:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCHv3 1/2] classes/pypi: update the default UPSTREAM_CHECK_URI to use the simple repo API
Date: Fri, 13 Dec 2024 19:48:01 +0000
Message-Id: <20241213194802.2416431-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 19:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208692

Update the UPSTREAM_CHECK_URI to leverage the simple repo API.  The
project URLs require javascript which breaks the version checking fetch
and subsequent logic.  The simple repo API provides similar
functionality with a well defined spec which is used by tools such as
pip.  Also update the UPSTREAM_CHECK_REGEX to be compatible with the
information retrieved via the API

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/classes-recipe/pypi.bbclass | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index c6bbe8119a..b0bc167cdf 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -28,6 +28,14 @@ def pypi_src_uri(d):
     archive_downloadname = d.getVar('PYPI_ARCHIVE_NAME_PREFIX') + archive_name
     return 'https://files.pythonhosted.org/packages/source/%s/%s/%s;downloadfilename=%s' % (package[0], package, archive_name, archive_downloadname)
 
+def pypi_normalize(d):
+    """"
+        Normalize the package names to match PEP625 (https://peps.python.org/pep-0625/).
+        For non-compliant packages, maintainers can set UPSTREAM_CHECK_PYPI_PACKAGE to override the normalization
+    """
+    import re
+    return re.sub(r"[-_.]+", "-", d.getVar('PYPI_PACKAGE')).lower()
+
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 
 HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
@@ -36,8 +44,14 @@ SRC_URI:prepend = "${PYPI_SRC_URI} "
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 # Replace any '_' characters in the pypi URI with '-'s to follow the PyPi website naming conventions
-UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@d.getVar('PYPI_PACKAGE').replace('_', '-')}"
-UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${UPSTREAM_CHECK_PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?= "/${UPSTREAM_CHECK_PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@pypi_normalize(d)}"
+
+# Use the simple repository API rather than the potentially unstable project URL
+# More information on the pypi API specification is avaialble here:
+# https://packaging.python.org/en/latest/specifications/simple-repository-api/
+#
+# NOTE: All URLs for the simple API MUST request canonical normalized URLs per the spec
+UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}"
+UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.34.1


