Return-Path: <maksym.kokhan@globallogic.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF79793ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:59:08 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id v6-v6so8452513ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=KzRyajSPWGmNBl7d8XHZ7JZesMotQsGpGz43WCGYKGI=;
	b=I3XJ0q+Zx4Dm3UpULEF41XkAuHQ8ZmXdAO4ZVyLICOfKbYhfi9qBJeXlyeutMFkTLo
	4xMcX6ZeYcWoF1KwevPhBBejjudkGPQDvcWiZMgbghybZyRhULHZ2Nls6Md87kyeknUb
	nvBm2bRozQgNMIqJoj4tlcogCjJxwbRlqGZOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KzRyajSPWGmNBl7d8XHZ7JZesMotQsGpGz43WCGYKGI=;
	b=Xa3+smKTm0QJ3KNeCEEIzwDe0WOg8QeOL6dW2ujWMyeXpEPurp10eu1RBjWqvAAKge
	dc1/DKiG8S1fOhiyhfR7BT7D9JX6kJAXjQ57A8krucfaj2kUgR+gJJnpCk1AWx6VgzFK
	+GM0Je0lgpXas2aMpv0bT30mLOurguEW6BxkOOhFW3ApkENqinBNTfWHFVyIoUw6S1Mu
	GEd2OWfusd3GDcG89H84MEL2EajALdZPCfBL+P/MbX2wjTyX7ggn/le01gxhtUDJFEP5
	7cAazSEDMBoyFNFaJ+GE35YVBuDbpvbPyxtZnyPvcgOB42Khxtrp3XSBIjJc59MdR/yI
	g3WA==
X-Gm-Message-State: ABuFfohpG++ITYUYZWUtYqct0KVXeBDZ0tE7LQhmu1PEG2UApudnPk1A
	W5KWDTCZezwUePjcwNpvGAxv1sdYrb4=
X-Google-Smtp-Source: ACcGV63nlQQoBZIDa94hVY3MVopXlb4e4DxfJ5Gy21+9TnxVGSeJj4SXK/VFksr1+xFHst07hO3USg==
X-Received: by 2002:a2e:7a19:: with SMTP id
	v25-v6mr4632127ljc.147.1538661548806; 
	Thu, 04 Oct 2018 06:59:08 -0700 (PDT)
Received: from kbp1-lhp-f55466.synapse.com ([195.238.92.77])
	by smtp.gmail.com with ESMTPSA id
	q85-v6sm1047686lfg.20.2018.10.04.06.59.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Oct 2018 06:59:08 -0700 (PDT)
From: Maksym Kokhan <maksym.kokhan@globallogic.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 16:59:01 +0300
Message-Id: <1538661541-20882-1-git-send-email-maksym.kokhan@globallogic.com>
X-Mailer: git-send-email 2.7.4
Cc: Ruslan Bilovol <ruslan.bilovol@globallogic.com>,
	Andrii Bordunov <andrii.bordunov@globallogic.com>,
	Maksym Kokhan <maksym.kokhan@globallogic.com>
Subject: [PATCH] libusb: ptest: don't skip debug output and fix failures processing
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
X-List-Received-Date: Thu, 04 Oct 2018 13:59:08 -0000

Current run-ptest script prints nothing, when stress tests fail.
Fix it in new implementation, discarding external dependency on sed.
Also leave in place all stress output, just add standard ptest result.

Fixes: 3f0106bf2e41 ("libusb: Add ptest")
Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
Reviewed-by: Andrii Bordunov <andrii.bordunov@globallogic.com>
---
 meta/recipes-support/libusb/libusb1/run-ptest | 32 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1/run-ptest b/meta/recipes-support/libusb/libusb1/run-ptest
index 646a966..eaa47a2 100755
--- a/meta/recipes-support/libusb/libusb1/run-ptest
+++ b/meta/recipes-support/libusb/libusb1/run-ptest
@@ -4,12 +4,26 @@ echo
 echo "---------------------------- libusb1 tests ---------------------------"
 echo
 
-./stress | tr '\n' ' '  | \
-sed 's/Starting test run: \([a-zA-Z_]*\)\.\.\. \([a-zA-Z_]*\) (.) /\2 \1\n/g' | \
-sed '$d' | \
-sed '{
-	s/^Success/PASS:/g
-	s/^Failure/FAIL:/g
-	s/^Error/FAIL:/g
-	s/^Skip/SKIP:/g
-}' 
+./stress | { \
+while read -r str
+do
+	echo "$str"
+	if [ "${str#*Starting test run:}" != "$str" ]
+	then
+		name="${str#Starting test run: }"
+		name="${name%...}"
+	else
+		case "$str" in
+			"Success (0)")
+				echo "PASS: $name"
+			;;
+			"Failure (1)" | "Error (2)")
+				echo "FAIL: $name"
+			;;
+			"Skip (3)")
+				echo "SKIP: $name"
+			;;
+		esac
+	fi
+done
+}
-- 
2.7.4


