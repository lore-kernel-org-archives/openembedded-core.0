Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8793D7F282
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 00:56:04 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y5so6661573pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 17:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n16kDzKYM0iW+s7UkdEj4KpAwJ0hDIQAfTB66hA+dmk=;
	b=S8cNvgWyDG1fC0ZxeOpSnjAh6JumPjb4VKKWvkB2Rem3nMQ84+1lnmBpLjYbH6lIXS
	LP7xkOnwd+xRhhUeCKCaFrvwHxIw7dqlNuMvZpEE0tdCKGsKPlwPexFghswfoDeNZ2rE
	b/FrnuGSyz10GsZWnhfrGzvCeXY+N3FpPuyKThxpF4hkbRtUsyJ6099WsObYg8K06hGW
	DUTCiEYdka80vWTvfM1t0c0/W1YTtkWSD7wzwbEJl5FX7t53HKWrGEyn2ySPto099Asj
	aVhWMI/iLbBbThpaUJwTrXJPyS8WN2bAUDg7NxMM8I20xsql6NvYy7jru7Qrk6j4mjx3
	kATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n16kDzKYM0iW+s7UkdEj4KpAwJ0hDIQAfTB66hA+dmk=;
	b=YIrM2mNthG3pjXgGqIxQytFilQghz1gcDFk89VxRYGJhiunqi+caQFjZP2c43Ylmjs
	YLXJHQ/9Yn9PGIRVAF6Pzl66tm3u5r/iSHkxCJZd1n5vY3jA+jO1xcBUEBGG2i6ozk/k
	SS7fe9EeG8Ww0fshMGuFLnjk65Dz7YoCcebc0e5kLJYwVQALiQi9h36Da+kllS2+V6ph
	5LX1p4gVrpsvoS8XrS1yc/dDXzRm3vVKlD8njp1LA/4c72FMMiiPR7gBRApLO3acYa8q
	2evBb631YduAL5c6X0P+oz2pH5uoORGroHyyzUVg40SoBvDua3Q+55/gOFdldHA/RpU2
	0aEQ==
X-Gm-Message-State: APjAAAX68TNwqdy95R4NfhS8zgIfnpjW4zIbjzQA5jTI9fpgadaHDgc8
	7RiDZIubUBIBnrhIW79bhRrAd5aIA/E=
X-Google-Smtp-Source: APXvYqxxxx+lvsebu659tiyLxo6AugaBPDvMaL1qBRxdrFZbi7Bf0qK5c/BsJlT5IUe25wzFp0UMGg==
X-Received: by 2002:a63:408:: with SMTP id 8mr27786837pge.334.1569891365748;
	Mon, 30 Sep 2019 17:56:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a9c1:2a99:4c55:de93])
	by smtp.gmail.com with ESMTPSA id a7sm702881pjv.0.2019.09.30.17.56.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Sep 2019 17:56:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2019 17:55:59 -0700
Message-Id: <4e91513eec2c091aa676b8395e7eebe3fac58022.1569891224.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569891224.git.akuster808@gmail.com>
References: <cover.1569891224.git.akuster808@gmail.com>
Subject: [warrior-next 1/2] qemuarm64: Add QB_CPU_KVM to allow kvm acceleration
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
X-List-Received-Date: Tue, 01 Oct 2019 00:56:05 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This allows kvm acceleration on arm systems that support it. "host" is the
best option I can find right now to attempt to use the acceleration. It
potentially might not be correct but arm systems are sensitive to the
correct values and I don't want to encode the autobuilders CPU type here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f13788541f64774a586971ed57699e4397b38b32)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/qemuarm64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 5c8aac1..353ac92 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -14,6 +14,7 @@ QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
+QB_CPU_KVM = "-cpu host"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-- 
2.7.4


