Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC0427F639
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 11:17:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f129so6969561wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=82uD1iWJgXZxZZxZtlM801gB1PFTAM1AoOAZFGmZ5NE=;
	b=hrnvUEjMY+Ua4qwuEpiYgRVU4QjDk3RyBRyvxcoxbM8lJatA+1y6qjYc6KrFJJv7PH
	gh2gjIKiZb2wAvjcwUaHQxpUtEBbOg9m1D9VnTfWjWXFDs9+PecDW//QCfl4+0knEL9v
	gU/C050sZ31orJGAN008G612vx8GUTSawzxGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=82uD1iWJgXZxZZxZtlM801gB1PFTAM1AoOAZFGmZ5NE=;
	b=oZrqA3ANJJT5ra9Byz2oe+r5O6BtaTuswHI3kUEKld3CrowMOg3ZQ24tZlLgvMBqzk
	g1jhqHdPY+vnUpqEK01Jz/n3qNoPC7HW2vURzY80kY48UaIQteDjXtjnGiiNKJHIVPLR
	VkjE+gY3uifjdrQRUpXBljOIwn0iht9SYAx5CnXb0KHRfco8+WcDxbz7kT/d3ylU3Plb
	58wZlRuAEpU+xzG8kBjMqcKkWU90tAYaBZEhCwo1rVjfhym5/CXlwCrNmlBbRjXw2R11
	3n6/NfMLw4oCPriRLsFoRWgrmCjl9Yzu08pl5/gW8CxsOwidYk6/NdYhOpmUEdZta+ME
	WNZw==
X-Gm-Message-State: APjAAAXNnZ1pJVH1j8ffvFdHeEG+5LLS13Li+4Znpl1NZROy6AWHMzYP
	sY9nXA7iB6/TcMfnMgsvmkkytqoT0Ng=
X-Google-Smtp-Source: APXvYqznMLuxkz2NNsSVG3vtgKwj6kMylN4SqwA6uUkBahRV0a7INYYItDRFpWR8VjiY0LQCyfnHTg==
X-Received: by 2002:a05:600c:230d:: with SMTP id
	13mr9921856wmo.12.1575631044280; 
	Fri, 06 Dec 2019 03:17:24 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c4sm3091097wml.7.2019.12.06.03.17.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 03:17:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 11:17:22 +0000
Message-Id: <20191206111722.25307-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] qemu-helper-native/systemtap-native: Ensure sysroots are populated with dependencies
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
X-List-Received-Date: Fri, 06 Dec 2019 11:17:24 -0000
Content-Transfer-Encoding: 8bit

As Alex Kanavin found, dependencies aren't always populated, particularly
with the hash equivalence server enabled locally:

'bitbake core-image-minimal' with gtk+ disabled.
can confirm with: $ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
qemu-system-x86_64: Display 'gtk' is not available.
Enable gtk in local.conf with: PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
'bitbake core-image-minimal', without deleting tmp/
$ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
qemu-system-x86_64: Display 'gtk' is not available.

This change ensures the dependencies are correctly handled as the full
sysroot is always depended upon even if things come from sstate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross.bbclass  | 1 +
 meta/classes/native.bbclass | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index f832561daf8..6dcddd6f2e6 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -97,3 +97,4 @@ python do_addto_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
+do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index d5b6f6af8bb..3a4f572552e 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -186,6 +186,7 @@ python do_addto_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
+do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
 
 inherit nopackages
 
-- 
2.20.1


