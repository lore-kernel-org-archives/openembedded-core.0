Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.8.1623876538937910151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 13:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N0fhlt9A;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id u30so883464qke.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FBhs/ufx9n+Wtcysxz1xlI5BVehFe7xFBSrLMCPQAdo=;
        b=N0fhlt9Aly5FboFbMpM0FflnIw3J5k6xJ2u1IB7B2ZK4UorbAN/C+jiNUpFnmOM4RS
         TkWB+dhymMPYWsZDjaP/GoQjJxr6Sd8QwzrWrHLbAs3KPtXuc2mYfHZGNVSPTySQDLFU
         q6YTF6o+Ub9eNF35IV6zWCz71Iw/HC8GNZpOtb+KCbEpNDC0s9kiohT1slPJgyYnCErv
         eHQzDjr8WOCMHSUgY2YtgZTq7PGtGRwnKF87YV7qx09Ht1YDBmGVjKrulSRGv2Olduw1
         nt1MhTALnEcAJYRzlB5DOHcxfzKKMj8okYIFZub/2q3sG4mM76KvOW0pjioF8xleou8D
         WMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FBhs/ufx9n+Wtcysxz1xlI5BVehFe7xFBSrLMCPQAdo=;
        b=qfu6w1Vq2qtWEsOru7zHDYxgnEz9G4Ly0zi3l5r7ndJQDlAO3xDxTBgvd1JwnhrTSY
         /LMxeMrzUfbFfoN3h+JxDtZ/DHNtwtYsu0cJaynOyKZa6xeXrQ7X94aO6X2dLA3Wjn6m
         YDTNnB3SnYIf5NuZeHz5/sy3O3DuKoQm3nREaUZ+aBMYY/xlRV/KxSLB/LLEgHuAHKA5
         lqRnwlUJpY4eM2qDftj8ps9XPKuesQgm+OTlUrBqe/yTFMXpvHeo+8Cgo8upVQ/XLIxb
         p7v7J5oHCLnKqSfcScbRmWGZUh1rb/wkYIT1gvEay79po7VK6djAJBZSb/Ph3iOpxwMJ
         0mxw==
X-Gm-Message-State: AOAM533eOCpmNZeAte34HwnZtiwGdP6i6yMLJ3QYH3WcOQd59W2geDrP
	ud/M5HJNrOa2vc2cZeBP/mc=
X-Google-Smtp-Source: ABdhPJyIFUO5Kky5cIk26mtdEVakLz1O2EDaFNqHdYd7iVbI+A/pu19/9aObbCeg2V9d9uyhiwgGDw==
X-Received: by 2002:a37:6c04:: with SMTP id h4mr283088qkc.182.1623876537815;
        Wed, 16 Jun 2021 13:48:57 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id d10sm300237qko.73.2021.06.16.13.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 13:48:57 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto-dev: base AUTOREV on specified version
Date: Wed, 16 Jun 2021 16:48:49 -0400
Message-Id: <3b93416cddd4db742f8bd957614b11ce9b796e51.1623876372.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1623876372.git.bruce.ashfield@gmail.com>
References: <cover.1623876372.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

linux-yocto-dev tracks the latest mainline kernel, and uses
standard/* for that support.

Archived -dev versions are under v<kernel version>/standard/base.

This policy works, except that a released branch will still follow
the new kernel versions, causing potential breakage with newer
kernels than are supported in that release.

Rather than lock the SRCREVs and update branches in old releases,
we can preserve the AUTOREV nature of -dev, and allow them to
switch automatically to the archived branch based on the LINUX_VERSION
in the -dev recipe (which is unchanged in the release branch).

This is consistent with the other branch switching done for the
kernels and with the -dev workflow.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ba139dd7f8..0df61cdef0 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -631,7 +631,31 @@ do_validate_branches() {
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
 	if [ "${machine_srcrev}" = "AUTOINC" ]; then
+	    linux_yocto_dev='${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "1", "", d)}'
+	    if [ -n "$linux_yocto_dev" ]; then
+		git checkout -q -f ${machine_branch}
+		ver=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ *//)
+		patchlevel=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
+		sublevel=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ *//)
+		kver="$ver.$patchlevel"
+		bbnote "dev kernel: performing version -> branch -> SRCREV validation"
+		bbnote "dev kernel: recipe version ${LINUX_VERSION}, src version: $kver"
+		echo "${LINUX_VERSION}" | grep -q $kver
+		if [ $? -ne 0 ]; then
+		    version="$(echo ${LINUX_VERSION} | sed 's/\+.*$//g')"
+		    versioned_branch="v$version/$machine_branch"
+
+		    machine_branch=$versioned_branch
+		    force_srcrev="$(git rev-parse $machine_branch 2> /dev/null)"
+		    if [ $? -ne 0 ]; then
+			bbfatal "kernel version mismatch detected, and no valid branch $machine_branch detected"
+		    fi
+
+		    bbnote "dev kernel: adjusting branch to $machine_branch, srcrev to: $force_srcrev"
+		fi
+	    else
 		bbnote "SRCREV validation is not required for AUTOREV"
+	    fi
 	elif [ "${machine_srcrev}" = "" ]; then
 		if [ "${SRCREV}" != "AUTOINC" ] && [ "${SRCREV}" != "INVALID" ]; then
 		       # SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
-- 
2.19.1

