Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 401667F26C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:41:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so9984081wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5gIyeKoGyW6fKD4FBXh4432/2Q3XnaCdD2CxtkkJAOI=;
	b=vOAhrcTBKzen8xvCp1w5ElfFSUmPzivrAtxL8u2/iam+Oux40tdpX4QleHqFcUcO9H
	xhbQU4k05eGOvcLcYG/NyFqDHOW8IhIh8CNFVcwgSXmoh+xlrarsK/UV7TfDsu1xDbQb
	qpuqG9OL+HMSBNd7FwR6IMZuuwr7RDm0ed+f0QK/gb7igIl28UjFNkh1WPbaFaWJtVkK
	ZsWNOaoDaAUTDhA9UAMWKlO/ZvRz2pHYiAD3d4QpVNk/BQZCv9vDu2vCBeZFDGvC4qHM
	oQMcAINJrB9rXWeDG+lxEInE34xagsNxso0aoc3FOpBPRuUdPQIGoHEv+hpEf8GxmUXC
	jK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5gIyeKoGyW6fKD4FBXh4432/2Q3XnaCdD2CxtkkJAOI=;
	b=Mw3SEcTtQI13v5N7doTZ4BGokswquddzhlO8Y716V25jj2AFsZVaLysxlMzjKexQqO
	bA4nSSpCVvGIXvqblqPh+tKQCb0LKzwrKuDvHFI+PIaNYcsNPNNlv1pIvLY1nwtdQPPY
	60KO/q7FZkIEVx+18jm5iPCxLzWnV5YXKwW5ru58K2qULXKhSFfwpW7GKo7POLFSPWXx
	iNxHQj8n3Y2Bt/C1/aSjlrFNcko0XIKLGWf/JK7DJaFkI/AGH0GGvZCqh82aiybilfDg
	cPjq/gpoa/PGDOQqjiIgkQxdx+TeViAZevPu7vqq8kyylD/MC99ySJFajn6rfL57OgT2
	pTWw==
X-Gm-Message-State: APjAAAXuKgMoBPd3Gj9UTiD4w6qRjCauth+UjyNmy1oD1OX+wXIHxiFS
	lxHvmIdvjUVh4tmZFbAgCZL+LOpMpyc=
X-Google-Smtp-Source: APXvYqyeMEQOeUf+ZrA1mkMOgUQH3JThI/sjZpAGPSNgg5C8vwgStep7NxuOrg1xHfXcJkVC2HfsiA==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr8462523wml.169.1568637714143; 
	Mon, 16 Sep 2019 05:41:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q66sm16016954wme.39.2019.09.16.05.41.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 05:41:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 13:41:44 +0100
Message-Id: <20190916124144.28576-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] kernel: do verbose builds
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
X-List-Received-Date: Mon, 16 Sep 2019 12:41:54 -0000
Content-Transfer-Encoding: 8bit

Pass V=1 to kernel builds so that the compile log is more useful if it all goes
wrong.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ebcb79a5286..9d2e1e476d4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -324,7 +324,7 @@ kernel_do_compile() {
 	fi
 	cc_extra=$(get_cc_option)
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
-		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} V=1 $use_alternate_initrd
 	done
 	# vmlinux.gz is not built by kernel
 	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
-- 
2.20.1


