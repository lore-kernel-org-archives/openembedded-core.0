Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id BCE1E73A1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 00:56:48 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so3368050iec.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 17:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u5rk6zX7mXMYpJpwGEG3sCmw16s7QAShDQ1oNRQHDf8=;
	b=WtA0UG818BDoMSbHUhMvfw4cReKaTDmdBB/L7uz/vVeGmvFpgkSW/729e00W7jEzd9
	aZLQG6VhGbPZ51JN/W6KDT4O5XhVTI77lcwGtVbzHZxPVaDR79QUpv2vFBf/O/pCiLW/
	hsDtoTqjCkzmu/kuIp83g3yCC2MFi7jDx4nMkqyfP6nuQ5Me8NccKyAviLUDv+NQ9Aar
	+YuhKtOUlf7bxnVhCAoXiztNNYJ9XJ+UWrD2TIGEM5zJfKeo+pld1bJO7KQ2r3bnvlAN
	XT2lQQagI8mHQm2gHFmRZEnn6qCqWnzpmWxXbjVitBv9UMlAACU6I1ytTg/eTXsk912A
	U+YQ==
X-Received: by 10.50.43.162 with SMTP id x2mr87410947igl.46.1426035410330;
	Tue, 10 Mar 2015 17:56:50 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	g195sm1512974iog.24.2015.03.10.17.56.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Mar 2015 17:56:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 17:56:27 -0700
Message-Id: <1426035387-18421-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJ86T=VcAgAVpk0EtU10miZzUjVb7RCqw1DQ0zgZHrktuyZ_DA@mail.gmail.com>
References: <CAJ86T=VcAgAVpk0EtU10miZzUjVb7RCqw1DQ0zgZHrktuyZ_DA@mail.gmail.com>
Subject: [PATCH] chrpath.bbclass: handle RUNPATH as well as RPATH
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
X-List-Received-Date: Wed, 11 Mar 2015 00:56:52 -0000

Binaries linked with gold may contain a RUNPATH instead of an RPATH.
Update chrpath.bbclass process_file_linux() to handle both cases.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/chrpath.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 77b1937..7a5d960 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -10,6 +10,8 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     if p.returncode != 0:
         return
 
+    # Handle RUNPATH as well as RPATH
+    err = err.replace("RUNPATH=","RPATH=")
     # Throw away everything other than the rpath list
     curr_rpath = err.partition("RPATH=")[2]
     #bb.note("Current rpath for %s is %s" % (fpath, curr_rpath.strip()))
-- 
1.9.1


