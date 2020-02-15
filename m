Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD9E8610B0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 10:26:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so13500310wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 02:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zWsRSX5R8WJ5BffYpM269qLTb8f3psQCXKd/vhJrCVU=;
	b=DdDJWwAtol7pBwren/RHKVYuLWvCyq1N2VcqIZDbOxi1RrACdwYa+DvlhPFqaipuuo
	ARr4BFJS+y62J5qJL3OkBN5upDXfzAs/5iGOdpO0cREfi75OsXI6w/v10ODVO+V9uCXq
	ULUN2TibHdSQZTz14aX3fUYLXUwpJNcBJ3E8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zWsRSX5R8WJ5BffYpM269qLTb8f3psQCXKd/vhJrCVU=;
	b=MCFWIiFkxgbULVYBuIAHDv1gnNeiJ83k/doY/zAZYJa76AFaNwYBprS64FIzX0eiLA
	vaZepkHf25oT8Zagkojbef5X0eH/YNL5AWEHM/7MjGLdXc5z7ghnArhvE91VeZocDj3k
	AyaohE2lOZZaXsTdhIuK3Tf6TAgqlRp+DPZnDSWzUjU5Huwcb+vMnVTZ+eYge2aiCAx8
	wfA3EmsyJfJ5HgnuCpDLBFjUCKkCjHiz1Ee3d7Raxcb4kPT9hP6199NcfcLbQqvLBdLp
	EU8ofX7M7IbfAWP+OkZKDgWZ4YxLmeJPKs+8KtuYa9UHLIx3SchAZPyNSTKlh5rk+pYf
	NlJQ==
X-Gm-Message-State: APjAAAVMY/QIKspFbeaxQBClWSOn8EiczIOwXRbZK2fN80BrVk2FLjoE
	ngFInnWBmo5H9Kx7LMtN7WwZwdOjDb4=
X-Google-Smtp-Source: APXvYqyDj6weS7FwDkC0hnFN/NQYCvORjohHM1SMfdtGUo1Cr3ccQXV+H9r2TjsnEUp00WIs9Iwnxg==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr10401148wmb.73.1581762397118; 
	Sat, 15 Feb 2020 02:26:37 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y8sm10663581wma.10.2020.02.15.02.26.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 02:26:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 10:26:35 +0000
Message-Id: <20200215102635.27436-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] populate_sdk_ext: We now require python3, not python
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
X-List-Received-Date: Sat, 15 Feb 2020 10:26:37 -0000
Content-Transfer-Encoding: 8bit

We no longer expect a "python" binary in PATH so update the eSDK's
expectations to match. This was the only failure on autobuilder test
systems with python missing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9511e553f56..57fd29b1bbd 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -613,8 +613,8 @@ sdk_ext_preinst() {
 		exit 1
 	fi
 	# The relocation script used by buildtools installer requires python
-	if ! command -v python > /dev/null; then
-		echo "ERROR: The installer requires python, please install it first"
+	if ! command -v python3 > /dev/null; then
+		echo "ERROR: The installer requires python3, please install it first"
 		exit 1
 	fi
 	missing_utils=""
-- 
2.20.1


