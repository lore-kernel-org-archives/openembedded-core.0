Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDD27F387
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 03:16:15 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x127so8233315pfb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Sep 2019 20:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6hUN0g8fkk1r6QcwTc7EdRryUbZ219CUjLXWlMt0Vsk=;
	b=YzTBAOa5l5k4XDyIAz1H4mJdeUhpQ698GRr6pZmexPt97y9YRsAshnOuZ2d/p8wgrq
	BnX8x/2wFoJmE+03/9OBJlx++TLkPFGh1fpWuDHYf+O8GnIhvx9no/F+pKaagvAi9wFc
	E7wWvIkuysHYu8+3RkFfM01xnF7Mp2WZa35UNzlvo/unuHJH4cfZfpSL6qHjR+7sa9NK
	xe4/H6OdMvv4sLZhzsAu1HMkZjS0wLHItiDBPmGfM4Zf7tqZlLRTlkqdTN/Cuhy6DuZJ
	V33IKrVEoWdeX5UQekijUW3ZIyC0PkDtyhRTyB62yeGbfX5ursL2QSBt6391oQpM1+13
	aNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6hUN0g8fkk1r6QcwTc7EdRryUbZ219CUjLXWlMt0Vsk=;
	b=Tur8uDoUK7pNLGRlaM4p2uX2GVykW3QRjVr4O59+dobwEx5opqdG7W04dVg+oQAqUm
	PskIxXNennXWk06LGi5oFc3IIF3QBHKPLiuTOSLZjCrbU8bEwOFbbv7FgPT9upcn3zLz
	J4F81Y7tdl/OfWjodzYNgKjLe/265JeOfVuH26l+n1dkDVoWjmD3WhNj+N/7irvEKrnx
	N5KtDvR9kk5I69E5hhCQ7AGwXZiT+nI6fKQkNrC/MpB9+t/PQFts5YrAECasK8iaXTMV
	8rsdMWIsncRVS3Vape8d56kjCbjiwWTCu4/njkL0jNLTOvW5p8Wll4BhUPQ+ZDhOZqt4
	W+xQ==
X-Gm-Message-State: APjAAAWS1BFS8mYgpmuRek7u6u5RkrPsT1qBKa2mzt32WMJwY2XjWzMM
	ffuDgOx0WWTrFZKOYZw+CqlrHvpqJt4=
X-Google-Smtp-Source: APXvYqyoLWwNXG1B1IUvOErSJuGQi7ASBekE+frLSOX3nddojrTU0rV1h9PBc9vsad/78HYsu5ARjg==
X-Received: by 2002:a62:aa0e:: with SMTP id e14mr26094451pff.182.1567998975886;
	Sun, 08 Sep 2019 20:16:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id g8sm11097212pgk.1.2019.09.08.20.16.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Sep 2019 20:16:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Sep 2019 20:16:07 -0700
Message-Id: <20190909031607.1806186-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] python3native, pythonnative: Separate definition and export of PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Mon, 09 Sep 2019 03:16:15 -0000
Content-Transfer-Encoding: 8bit

This helps recipes where they need to explicitly pass the variable and
does not entertain the ones from environment

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/python3native.bbclass | 6 ++++--
 meta/classes/pythonnative.bbclass  | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index d98fb4c758..bed04bd941 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -14,8 +14,8 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
+PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
 export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 
@@ -24,3 +24,5 @@ export PYTHONNOUSERSITE = "1"
 
 # autoconf macros will use their internal default preference otherwise
 export PYTHON
+export PYTHON_LIBRARY
+export PYTHON_INCLUDE_DIR
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index 0e9019d1e2..5fa42aaeff 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -17,11 +17,13 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
+PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
 
 # autoconf macros will use their internal default preference otherwise
 export PYTHON
+export PYTHON_LIBRARY
+export PYTHON_INCLUDE_DIR
-- 
2.23.0


