Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 194D26E898
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 00:20:55 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id t59so9283144yho.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ytpSQQ1w4V2vUe0SfDcpxFrlY+csHAj0HGVKI/aMXgk=;
	b=KflaOMdxbRF2W1pRWSEITp4Q9v9kFV6sZaDewDrbpNYMwNyvRnu4jsG9NY3yj1xJcc
	n7+vBfrlMa8JjMnFbTm2b1i46iMMSsWVUEm3G//bOoAhkeiuJVjTCaajWvUW6BTtNDk/
	GpNiMxoQZFcQkmSQeNjPdPWKKMVg1AEZkfk11LhkTmB8i4fYOHWqUK6FSLUcfDyTohbr
	bAmkc36CumpX46+N8auBuFCiAQQnrz4+Enk5MWaxqRxz2SmRUxX+1gDmnKitu2bVgeVn
	rs2SQxYWTeu6JGxBqSQ1qhaj6YqNSrnRB6HJ/fx71Of4+xaw5T3z/SXnccWX1ExgVQCL
	vNXQ==
X-Received: by 10.236.131.163 with SMTP id m23mr10569542yhi.61.1392250855962; 
	Wed, 12 Feb 2014 16:20:55 -0800 (PST)
Received: from localhost.localdomain ([201.53.197.242])
	by mx.google.com with ESMTPSA id a67sm162469yhj.10.2014.02.12.16.20.54
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 16:20:55 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 22:20:18 -0200
Message-Id: <1392250819-10123-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 1/2] kernel-yocto: Add do_fragmentconfig task
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
X-List-Received-Date: Thu, 13 Feb 2014 00:20:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of using 'diff' command between two kernel config files,
the task fragmentconfig does the job creating the file
$WORKDIR/fragment.cfg that user should review and use.

[YOCTO #3862]

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8f79932..6597e54 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -411,3 +411,5 @@ do_kernel_link_vmlinux() {
 OE_TERMINAL_EXPORTS += "GUILT_BASE KBUILD_OUTPUT"
 GUILT_BASE = "meta"
 KBUILD_OUTPUT = "${B}"
+
+do_fragmentconfig[depends] += "virtual/kernel:do_kernel_configme"
-- 
1.8.3.2


