Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD1BE7F818
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 00:06:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so47949482wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2020 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2wcovtnHd32Nt8FSIZX3t5BojLw5FvnEyiDzCrTy/VM=;
	b=eRP47YuE/vVOoPk3ie1Cx4ZXbvtzfPRWQbKpXG7ZzFD8+4yr6NuLrnLS6kw3ybtOBk
	DZlPFgphCMWevaOYqABP1XTkZICoi643+N53iXylQTzkvvxKf2rFoJrxbkUpBKRiYIrc
	dSgIWj0CrUDOVERjBAL3/Q35eystwC2JbL0gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2wcovtnHd32Nt8FSIZX3t5BojLw5FvnEyiDzCrTy/VM=;
	b=CXKF3m1ZntBqaqhIND1ta1e3qDCuFuRDF1CDm6Mgz+AXqm39QRz/8EMSixEWWuuFne
	gVA/TpZpJy45PNrCatTd2N4Ta31SkMoA8g+miC55kHNX2QpxV+wEvtja/2fYr4a/dUWR
	+KkWm3edN4n3biRhYZkqlvY8iOzhC7jACCr3w2kI67yU0Q/C3DQvNB4csM4nRaa26DMl
	YxMZzTX/zhdFrQ2WSx6jAUsSJSxCadgR5C1lVnp38+OBAglF3Ly6yC3Ewb3KvNpvaW2k
	HKub68v27BGDvVFEqqcns0q3Y3kRyrSGFd0AEhVzbVwbRLclwfAdklBJlOXV3k5tsrwZ
	ejLQ==
X-Gm-Message-State: APjAAAXcRCswJasbolUOBvfvrxjhzNYk6ONE1tZ4uDKliaaySMbxt1ob
	PFvyMns37g1J3Lp9j6HUpRYWiqetyag=
X-Google-Smtp-Source: APXvYqyM25Q+7tTzpNda5wll54AH5dwNOrMVtOCAd0x53bnOLGCbUyYc1k/RYXK6z0g1sRtIUu58BA==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr12968921wrn.356.1578269215433;
	Sun, 05 Jan 2020 16:06:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n10sm69174229wrt.14.2020.01.05.16.06.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 05 Jan 2020 16:06:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 00:06:50 +0000
Message-Id: <20200106000650.26105-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
References: <20200106000650.26105-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/4] sstate: Handle sstate filenames longer than 255 characters
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
X-List-Received-Date: Mon, 06 Jan 2020 00:06:55 -0000
Content-Transfer-Encoding: 8bit

Many filesystems can't cope with filenames longer that 255 characters.
Add code to detect this and truncate non-essential elements of the filename
to stay within the limit.

[YOCTO #13268]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 71ae0900777..241dace6d9a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -7,11 +7,28 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
     if taskname is None:
        return ""
     extension = ".tgz"
+    # 8 chars reserved for siginfo
+    limit = 254 - 8
     if siginfo:
+        limit = 254
         extension = ".tgz.siginfo"
     if not hash:
         hash = "INVALID"
-    return hash[:2] + "/" + hash[2:4] + "/" + spec + hash + "_" + taskname + extension
+    fn = spec + hash + "_" + taskname + extension
+    # If the filename is too long, attempt to reduce it
+    if len(fn) > limit:
+        components = spec.split(":")
+        # Fields 0,5,6 are mandatory, 1 is most useful, 2,3,4 are just for information
+        # 7 is for the separators
+        avail = (254 - len(hash + "_" + taskname + extension) - len(components[0]) - len(components[1]) - len(components[5]) - len(components[6]) - 7) / 3
+        components[2] = components[2][:avail]
+        components[3] = components[3][:avail]
+        components[4] = components[4][:avail]
+        spec = ":".join(components)
+        fn = spec + hash + "_" + taskname + extension
+        if len(fn) > limit:
+            bb.fatal("Unable to reduce sstate name to less than 255 chararacters")
+    return hash[:2] + "/" + hash[2:4] + "/" + fn
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
-- 
2.20.1


