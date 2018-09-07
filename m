Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D018F7970E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 11:40:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s14-v6so5673467wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=6nXWdznswnO/Kye+RtEyvdUbqT3m75IxdgEyYC2Bu8s=;
	b=OECnaLLvh3ocHrN5xNWdT4oU6YhLZG27uomQpZfLv+rd4UjY0e9vESXNnOb/gKi3xO
	9HpvQIMWtFadvU2fvFa7oLRS86vlbcWQ/XznAvlQaW7CH0K3VRyLoVmi7B/P3/ZzGxmC
	1sqK4ryM+mPN5Lkvb++9iPPAiBgutn3mjxiPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6nXWdznswnO/Kye+RtEyvdUbqT3m75IxdgEyYC2Bu8s=;
	b=dMAhLx4fPU8QDLfIS8m4wAPFTR0dmCGJUOT02zFSvFMabE9oexKklEjCgIIBTaXNWi
	pVSC9j0NRcXWb/5N3Ltw4qKrIByOtrIMgVZMSxoP6sz1lFmxP3QO9FPLFWZO0K65Tsxu
	A0nK4I+YI5SLsaEFJu534xlhKiNKzpzs94o3yGbLJGY0hjGkjnKvObH01Viqrq9aqyqD
	TZVKWCdH9oA8j6fLQThcnfsPdzyT/tyuOlg//6uj9X1Ykn7wdZ0rvOh6Vk+d9Xyt5xvF
	8Sb5QWxQt2v2ljW4gZeZz1RjHJod8pA1ejtaPtzrNn7Wy6CqV8jvesXg4R7wEWh/X+mw
	WDSQ==
X-Gm-Message-State: APzg51B1GqwJh8X2T/PQxUHidopBPH/7iXmxi5tdQJr/A2CkFAourEt4
	PQ7NVz3gSAdBigbZhjvuvQ2nbbEgi7Q=
X-Google-Smtp-Source: ANB0VdZhgsNetD04QimU7jtPCjdFB9Wl+aOf83Xg3EqoDERPSosV7bc7aUWQAGEl+fnxrFhDcr4/7w==
X-Received: by 2002:adf:959a:: with SMTP id
	p26-v6mr5662168wrp.202.1536320440197; 
	Fri, 07 Sep 2018 04:40:40 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g7-v6sm6642694wrw.30.2018.09.07.04.40.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 04:40:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 12:40:34 +0100
Message-Id: <20180907114036.16685-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] staging: Ensure we handle glibc-locale do_stash_locale correctly
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
X-List-Received-Date: Fri, 07 Sep 2018 11:40:40 -0000

Occasionally we see warnings like:

WARNING: core-image-sato-1.0-r0 do_populate_sdk: Manifest /home/pokybuild/yocto-worker/nightly-qa-extras/build/build/tmp/sstate-control/manifest-allarch-nativesdk-linux-libc-headers.populate_sysroot not found in i686_linux allarch (variant '')?

which occur when do_populate_sdk is run in an otherwise empty TMPDIR.

It occurs because do_stash_locale is not recognised as a setscene task
and is removed from the taskgraph meaning the dependency chains fed
through setscene_depvalid don't match what was actually setscene'd.

That task is recipe specific and not in the global SSTATETASKS so we
hardcode the value for now to stop the build warnings. This is going to
need to be revisited for a more generic solution.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 27b012ecbdd..a1e4cf70900 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -294,6 +294,8 @@ python extend_recipe_sysroot() {
     start = set([start])
 
     sstatetasks = d.getVar("SSTATETASKS").split()
+    # Add recipe specific tasks referenced by setscene_depvalid()
+    sstatetasks.append("do_stash_locale")
 
     def print_dep_tree(deptree):
         data = ""
-- 
2.17.1


