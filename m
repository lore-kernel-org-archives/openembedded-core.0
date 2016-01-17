Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 969DF731AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:50 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 65so142176010pff.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BYfiM9XsliS++ShRkecvP/3KXuTfzUiGGhQqsEP/axM=;
	b=oqy7N9Pd2/CjD8fGbbFEI8Laje/TzhYb+atQUw3rspp+YRhIN/WT3n/GWyjLsk17rw
	DGr6f3dvJprRBpbI4HH1WD3uQD5sKuYvFGEEhvfUJHIXMpKc6mxEEUkznL8mnieR9g7Z
	c5VUAwGqSD3QqhjcLfjrCegU7DzFDemen9sGoZLJXDwEW5aW5WrgJdqjOfpZRollECEJ
	CrKZtRnZygv9UwUhJ4T3Mj7wFVSvGxrZtC5NaYKWRuQrfYRDBRZwUvDphj32QhMhgl7E
	pt+n0nireBTRCo150zmv86gspsR8XiCFvIWqct1CdiY7k3T9Snkavd6sxDvL1rm6ttaZ
	ncLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=BYfiM9XsliS++ShRkecvP/3KXuTfzUiGGhQqsEP/axM=;
	b=X02zS4c6vNEM/oW8EIxNkLNP3Cbphi/QE8jf6OwVmwV/IPCaqiPFqU40wJexv+arT1
	45pJyT2Q2laHxw2vpxvVRUvECNxDe2pXJz/J/UOKzh7fBGRyLpKhCRpzcv0dbyA4lgPK
	oGEK/FtD9XP4waRZ4zOJFA7Huymma1pCpgwaS8E3QXXiqqp588eBaZUNBUt6Fv9gOeuR
	cOcENz9+JRvUzdLaA55Wn8Vf/8dQtOvopggrnI82G4ugvOd0OFIAjz6YccUdAl9TQuzx
	QzVaYSLUXScCKpVleA+wioFcNCdDBWsrq+RlV12n2SpPksHm8us+rpB2datRj3KNT1zE
	962g==
X-Gm-Message-State: ALoCoQkIY7M5w7c3X3qDatnlgadiwhgzdS7ICm82u2vgKbIwmNFF+EqhK4koudbkXY5goSCP4HBN9wEzNmfvp9yI5elzAw23KQ==
X-Received: by 10.98.74.71 with SMTP id x68mr28363694pfa.80.1453030671672;
	Sun, 17 Jan 2016 03:37:51 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:31 -0800
Message-Id: <a10e5d18e2023874d124b3c65ba85df6ed285912.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 58/73] fts: Fix linker hash-style option
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:50 -0000

pass --hash-style explicitly to linker
and ensure that mips does not use gnu hash style
This inoculates fts when compiler does not pass
hash style option e.g. clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/fts/fts.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/fts/fts.bb b/meta/recipes-core/fts/fts.bb
index d8b4ed2..2539e5d 100644
--- a/meta/recipes-core/fts/fts.bb
+++ b/meta/recipes-core/fts/fts.bb
@@ -22,9 +22,15 @@ S = "${WORKDIR}/${BPN}"
 
 do_configure[noexec] = "1"
 
+HASHSTYLE_mips = "sysv"
+HASHSTYLE_mipsel = "sysv"
+HASHSTYLE_mips64 = "sysv"
+HASHSTYLE_mips64el = "sysv"
+HASHSTYLE = "gnu"
+
 VER = "0"
 do_compile () {
-    ${CC} -I${S} -fPIC -shared -o libfts.so.${VER} -Wl,-soname,libfts.so.${VER} ${S}/fts.c
+    ${CC} -I${S} -fPIC -shared -Wl,--hash-style=${HASHSTYLE} -o libfts.so.${VER} -Wl,-soname,libfts.so.${VER} ${S}/fts.c
 }
 
 do_install() {
-- 
2.7.0


