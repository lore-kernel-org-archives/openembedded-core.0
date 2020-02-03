Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 15EB360CE4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 20:50:47 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id u131so8416583pgc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 12:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pQQT2//vE/zB4jbZ5QplludSDTs9pA+bLaiLGkSRWsE=;
	b=EDbT5vGKD0Jth9651utrX65C2ay/36TlXfs6ccWYVPTUfSlJTKw/9HebSNIrcg8sJY
	8IN7sEIZrVfdVJUzHDTTLYrjEN6LRdH+7eUha0Pbuybuoztdgzjf9R39fmAY2JjwzBBn
	9dSLX9hm5D+ebgX3UC+T5B4jY7NQBtfQtWqQ0shKKp9aQewA6hk6XQ3y3P1UIriuR75y
	P77UTRVTbOT6T/99GoGSeymb90m7zqamwZpIMQCLHbZVZCTppI5y6BfIDHqfNkPPinMZ
	ifC17iObhm49y7s1v1PGSXTGbOxbxa3HCaSfqiJIOBlJRQkjIhEM76tfyLOVcpqKg0aT
	njcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pQQT2//vE/zB4jbZ5QplludSDTs9pA+bLaiLGkSRWsE=;
	b=TWet52ax6cmtbG/RNF9/3E+dJh4TTj/g/MKhwcbKT6YNjX0FzIbss+0Azr6mxmKEx5
	yU5N0P1avt5t/em4XAFZ0CF3IddbhqCUlXlv6wxq0UfjJoD8boE4hiKxmLoN2bD/HJhr
	igbWnK6vy5ObWSU91ArSrV0x116bL6bJkVu8gEjRHfUSZnidmwi7Zfy3YS5Yb44/wTol
	LQJbERrrXfViQ+iAYIWGeuiLYkwZD11wrBd4xBJoNhzGRJ1EHnQM7jmuflowCs+3QJFe
	hDXdWPDOsTXCFLS+93ShBBbZLHY8YJvkQPsv5koutTZq3Gr+O6DrNpqCf9MiL3co6m1l
	JhZA==
X-Gm-Message-State: APjAAAWAAbAOHNQ4g0jG3lFgst2gfQMR8YbpadNlAHPKFk0XWOM15OB9
	TlR67iQk5k72kZC42XYzidTjIwLFsok=
X-Google-Smtp-Source: APXvYqzV4FErsV7AHeLWeAOxgXvwFnyeRE5WbmwG/nIq7AfdZj9dW/HHUr6BXIXFTg0WyTFH3Zr7nw==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr25388801pfn.181.1580763048561; 
	Mon, 03 Feb 2020 12:50:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id s23sm353660pjq.17.2020.02.03.12.50.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 12:50:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 12:50:49 -0800
Message-Id: <20200203205049.1324254-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] python3-six: Move src_uri checks to recipe main
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
X-List-Received-Date: Mon, 03 Feb 2020 20:50:48 -0000
Content-Transfer-Encoding: 8bit

.inc is used by other versions of recipe as well, therefore putting
checksums in .inc will break them unless the version is same as in
oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python-six.inc        | 3 ---
 meta/recipes-devtools/python/python3-six_1.14.0.bb | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
index bbbddbec50..05b32810bd 100644
--- a/meta/recipes-devtools/python/python-six.inc
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -4,9 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d"
 
-SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
-SRC_URI[sha256sum] = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
-
 inherit pypi
 
 RDEPENDS_${PN} = "${PYTHON_PN}-io"
diff --git a/meta/recipes-devtools/python/python3-six_1.14.0.bb b/meta/recipes-devtools/python/python3-six_1.14.0.bb
index 99e6629b2f..151c366caa 100644
--- a/meta/recipes-devtools/python/python3-six_1.14.0.bb
+++ b/meta/recipes-devtools/python/python3-six_1.14.0.bb
@@ -1,3 +1,5 @@
 inherit setuptools3
 require python-six.inc
 
+SRC_URI[md5sum] = "21674588a57e649d1a6d977ec3122140"
+SRC_URI[sha256sum] = "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
-- 
2.25.0


