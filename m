Return-Path: <jpuhlman@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED5160B31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 18:20:51 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k8so3776987oik.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=FHcrR7cPrt2jx9KJIdMTaEE07QAPLIHxi+pR6Gq1lQc=;
	b=VGKjebfmlxfer/ExwUUkmT5Hdt7XTtBHgF0juWVQJsFg0xkt6PzCWlbcUofcJRSpVk
	zsvcsEcqpEA8xaJhyuUH258MHlay25xfuEufEqqHgzHPk1Rkwu89gkX2Qts/J8jYvVQd
	GZKI73z9bTdj4eiVyAaPNibCANVtNbVqhBc/FwZcvX9rpzpYYp8New9w/fTc0iHO5r9g
	z/uejULO035dXSHZPKyvAERM2O5yJq9nWILMvfAN1aUu/dzpw/bFUb624uaU63ZnCEmF
	cnNN+PTfaLPJsDafT61I5KrJW/HtcXCwDBAw5d1CxkWEfsYbWGJ8zGvvq+Woz+HPVnoh
	VW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=FHcrR7cPrt2jx9KJIdMTaEE07QAPLIHxi+pR6Gq1lQc=;
	b=ZIWt8dGKIHnWmnyf+kBQ98nX6jStIf563/dJN6GD3QyxbQ1hikJ74h2vqAW9XxJpd7
	J3Vzg3buUXpW1boDxqewQpxd8C0Ph2UGQt1sW/sWudRIw0c6UACVPFLbOYHXtL+mGcxz
	vxL9Oxks3wfjnt+tFkQv0L2comz7kAyrI60/lZkgjimZpMBO7ZonV9rJRHaEJNIKlMRt
	niJKXz2x+AOcXUs2iyhzFn/bBf9ppmdAS4vBnLVsSgcl6bTN0WhEr+CzisQhjM37XLUu
	4OcXn7LBI3zoIbvf8tJHqb4YuPa5fEIHeSaKPCw6gBTtgxbvG/9LmqmDEUm+fyRJ/u0A
	SIxw==
X-Gm-Message-State: ANhLgQ2P/sm7a8udUicFAFgWYab5lZZBtQ/slicZ3yXTbl26/kVffRqm
	E9c3GNjGpMljfTdzF6rmOWIlTF1X
X-Google-Smtp-Source: ADFU+vsVhomSmil4x2MTeUv/IBfQaRhoAmshbHosE1gPjw2gk3ochXI4HBlbi+7UIs7lFckxy+yeDw==
X-Received: by 2002:aca:37c3:: with SMTP id e186mr3469393oia.155.1584642051758;
	Thu, 19 Mar 2020 11:20:51 -0700 (PDT)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id i5sm1071447otk.0.2020.03.19.11.20.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 11:20:51 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id DD1042A042C; Thu, 19 Mar 2020 11:20:49 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 11:20:48 -0700
Message-Id: <20200319182048.28380-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] toolchain-shar-extract: check for available python
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
X-List-Received-Date: Thu, 19 Mar 2020 18:20:51 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

centos7 doesn't have python3 intalled by default, so running
the script errors in novel ways if it is not installed.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/files/toolchain-shar-extract.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 2e0fe94963..04527f891f 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,8 +1,13 @@
 #!/bin/sh
 
 export LC_ALL=en_US.UTF-8
+#Make sure at least one python is installed
+INIT_PYTHON=$(which python3 2>/dev/null )
+[ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(which python2 2>/dev/null)
+[ -z "$INIT_PYTHON" ] && echo "Error: The SDK needs a python installed" && exit 1
+
 # Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
-PATH=`python3 -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
+PATH=`$INIT_PYTHON -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
 
 tweakpath () {
     case ":${PATH}:" in
-- 
2.13.3


