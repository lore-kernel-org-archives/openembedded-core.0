Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03F2A74924
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:11 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 142-v6so810068itl.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gd0A3BxuMBXEPt6XxK8fIokcTy3wKQwHvoYoTQ/cqSY=;
	b=Q4O+s5fzjfgRIBHSoVIGA+C5J2Elj8Swka0uIWCy3nCfsaGrwg+d9Ae7Ca7+r4Bjoa
	lOR8+vYMHP97h2bvNVAOmSJZNfm061+fD2fYe/X/9GVj9kiYlpX/c3K/gntQ/aPK76HA
	xzbldlA9/ufR2rvuNe9tSyFi7wxphsZZ1a2vJqdWPmGWrHwirpHtpgPu6OPS3q7r84lU
	pv1nyUd27gN/944FeIZsDWVwlgV/kTpvhjI67D9ADONm7uhDxy8ewK1Ah8E6FomI9UES
	Sc6CzOM1/IBRZg+Q1nW6KmqXhUuTDZq5ICGrwp7K39YGJqXQsy48aM7sZ9dbhM3pmLzw
	kP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gd0A3BxuMBXEPt6XxK8fIokcTy3wKQwHvoYoTQ/cqSY=;
	b=s8ns/raQugw4PImz6yJzQHmC5/nQLhE/TkkEmzNP257Y5PkCIH1UakyUaBvCQhngap
	44eOQAI2EK9itmQOgKIQBoL+gpaJQ8rKtqzsmIyqXNDtvPpiKJqu9qvoQ7j2dTr8PBZM
	3WyDDOKljmFRUWPqUot9X3jRkp6qSI3bMwbxsQt05cR7SluMJJBovGjgGCladbQa9arP
	s5ITAfZIedgkBqRc+AQd5AVIaiy2RKV107Y1EomiquEwvCpsbNeBRl74nZSvdPCcY2gX
	5Gy/NrNcDmTdNBtQv09dTAtY3jtr2O7gwCSOE7ZTZeQ83/1DWesuYLrLjJAh2y5futnU
	ANJA==
X-Gm-Message-State: ALQs6tDaG9yV2Cl54EmPefpuE+tP5BD4+b98h3ebgP8eq/aNwW8FXwGJ
	unnMNqKYETR9Lb2hVteTAchdgXzh
X-Google-Smtp-Source: AIpwx49P9ghkkRPcPKWcPJOZiiunvmYXN2c+UjT9h9EjZbqd5D9v8jwmHPeBNezPLZeTjIe6mAqA3g==
X-Received: by 2002:a24:1ad8:: with SMTP id
	207-v6mr1860226iti.99.1523413332742; 
	Tue, 10 Apr 2018 19:22:12 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:21:55 -0500
Message-Id: <20180411022200.22277-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180411022200.22277-1-JPEWhacker@gmail.com>
References: <20180411022200.22277-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH 2/7] icecc-create-env: Fix RUNPATH files
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
X-List-Received-Date: Wed, 11 Apr 2018 02:22:12 -0000

Some newer libraries and programs use RUNPATH to specify the library
search path. These executables were being skipped by the rpath fixup
code because it was grepping the ELF header for RPATH only. A more
correct solution is to ask patchelf to report the rpath, as that tool
will properly report either RPATH or RUNPATH as appropriate.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-create-env/icecc-create-env/icecc-create-env                | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
index 074c7675c0b..3015f4e2155 100755
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env/icecc-create-env
@@ -42,11 +42,13 @@ fix_rpath ()
     if ! is_dynamic_elf "$path"; then
         return
     fi
-    local new_rpath="`readelf -w -d "$path" | grep RPATH | \
+    local old_rpath="`$PATCHELF --print-rpath "$path"`"
+    local new_rpath="`echo "$old_rpath" | \
         sed 's/.*\[\(.*\)\]/\1/g' | \
         sed "s,\\\$ORIGIN,/$origin,g"`"
 
     if test -n "$new_rpath"; then
+        print_debug "Converting RPATH '$old_rpath' -> '$new_rpath'"
         $PATCHELF --set-rpath "$new_rpath" "$path"
     fi
 }
-- 
2.14.3


