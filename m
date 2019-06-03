Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id EB0A47E3FB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:29:52 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id h9so13036811itk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dUPlXugPAdAmST6tK7eFTIwdfJi7pjUE9rbm0wYg9ag=;
	b=Uw4b9ef7HF88ettabNkKiyXYh4cLNMmkHzTyOUgBm0nSK7PU7d5f3NiX69osz0Pl9N
	3TMuAu9DyWSebTV1pL02iKBMSUKTdrIqcpkZAL4vUPLZpmguqEivh58JmTegtD1ZKRta
	8C7vJdGp/ENrb2R4gaxQDY5nGLgtZmXGIpcVzExzpTUTWAIACcbh6RZnLz2bWVtsrj6n
	UqoX03Fc4JCU3OTMyg+lNTnoLbmYuD5kL6D7vXn8zPiDK5uGR1SOkvGHqJ4f/byFHhYC
	gietvyV9SNm0OhyACdSgUk94qV9+hPT+XZCObzRjyZazgMuYAdXk92n4qfvN9WhG7gWg
	uxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dUPlXugPAdAmST6tK7eFTIwdfJi7pjUE9rbm0wYg9ag=;
	b=OQiiQKYTF5ERQPxDD65F6HkC0ijQKJLuzwVj640dphBmUChkTG8K2dAmklts+s4Pd6
	tzG++F5UeIdjYy/r2UR9zg49ETTj1tRqB7DfQMx8XNSj+NEF0sdt0Tw/fnRD5zb1L7h3
	j1kGCiEFqLJm+XT+h150xynCx11P+vRVWIhSzu1n3dXj0hLs7rqJBOs6Fd0dyPu82TSJ
	SeFajMKz+yvM2obCI73wSdXMAKeX41u21O76gMieM5KbdMHde1Bl7OpWvvVTSVQz0TEO
	LERzr3Tc8jj1OXAKHB+Voq/TaXald6v+C7ZeYR8lDw82A6nto9SA+wikW+435FtLvI73
	07qA==
X-Gm-Message-State: APjAAAXrp9XxZUQTwQYi/oi6sf+a9jWpYdnvK6zQVIH3gnhSZIl1Rj6J
	ONKqCuSgWvPdDjHahrabzuui6pBh
X-Google-Smtp-Source: APXvYqyPsptgE4XloGVYFurqbqyIGSupOJSgWU4LC4XCM9KfrDSB4zkrSoKYU66ADt52HA80bowUYw==
X-Received: by 2002:a02:7715:: with SMTP id g21mr17474437jac.24.1559575793690; 
	Mon, 03 Jun 2019 08:29:53 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 67sm2069727ith.16.2019.06.03.08.29.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jun 2019 08:29:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 10:29:47 -0500
Message-Id: <20190603152947.4921-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] classes/package: Sort ELF file list
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
X-List-Received-Date: Mon, 03 Jun 2019 15:29:53 -0000
Content-Transfer-Encoding: 8bit

Sorts the list of detected ELF files by path before processing. This
ensures that when multiple files are hardlinked together the first one
found is always the same. This is required to have reproducible builds.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/package.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4c0a8595363..06948555042 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1005,6 +1005,12 @@ python split_and_strip_files () {
                 symlinks[file] = target
 
         results = oe.utils.multiprocess_launch(oe.package.is_elf, checkelf.keys(), d)
+
+        # Sort results by file path. This ensures that the files are always
+        # processed in the same order, which is important to make sure builds
+        # are reproducible when dealing with hardlinks
+        results.sort(key=lambda x: x[0])
+
         for (file, elf_file) in results:
             # It's a file (or hardlink), not a link
             # ...but is it ELF, and is it already stripped?
-- 
2.21.0


