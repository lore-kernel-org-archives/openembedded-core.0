Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 52FA5610B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 14:21:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r15so6362142wrx.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4Tb3oRMJrqfGWV85J64bcUA3h+JqRDmMfPWum/t1GuY=;
	b=AA8wjIMgfioz/pWN16syp4pvN4sJhoCYciRG7tbPV/JhUZmRQ9P/0gG6niXJNaeXu9
	q8/Vc0aVAXHucRcIEaBlsRBqUX9hKmSgZUqtrQMH1n4tdKwWVXzCu8GRfydYQi3KXNlu
	z5eSOrzN33XrTUZQAacqQlntpmf9UlF7oRaeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4Tb3oRMJrqfGWV85J64bcUA3h+JqRDmMfPWum/t1GuY=;
	b=beVYgK5ifU6neuTmiUkKYWxf295F4VOZ9qZrohrxnifAckyyXP3lQXSqU0zmU4mQLB
	EEbEbYvtzSQAMus1AojsI0oesGgqPGnPG06AfCeb8SIvZEJ213Vnmr9iJswtpuPsaMKP
	/0+GyPaUWqVHBkWue3mh1Tx0umoeZKF5Q3pWnY7ptAHvoa/OYp+jsFOnEU8Mtg7+9afa
	IfXN4CKR7imR3gnhOQJ3p+VfzD5dpMZYnIgV5JkAtB3l4aynH/tZ3aHPUP+tkKn2W2DN
	NYcbYHBLxfbIXJTfC6D81J4B3YQ6uSGCoE9vJ6PNYF1r+j364iH9FZexcvZhUtnz5CUS
	36Ng==
X-Gm-Message-State: ANhLgQ1H1y+81l5wd/XdTk5xDIjqVvZBHYXivKEppjxyl0tmO9bkq6tJ
	4X2vWpy7ie7+zndeSWPHtA4cg/FCOugmC3DQ
X-Google-Smtp-Source: ADFU+vsZeomJR+ELlhh0eNNBUUx7SnyzrEAep7zK12k/c2PTojljty6ZqVUm5jZFQ7UDF9LNe1IaqA==
X-Received: by 2002:adf:f2cf:: with SMTP id d15mr21325292wrp.397.1583763713865;
	Mon, 09 Mar 2020 07:21:53 -0700 (PDT)
Received: from ub1910.Hitronhub.home ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	z10sm25780577wmk.31.2020.03.09.07.21.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 07:21:52 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 14:21:37 +0000
Message-Id: <20200309142139.15741-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309142139.15741-1-pbarker@konsulko.com>
References: <20200309142139.15741-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] kernelsrc.bbclass: Fix externalsrc support
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
X-List-Received-Date: Mon, 09 Mar 2020 14:21:53 -0000
Content-Transfer-Encoding: 8bit

When the externalsrc class is used the tasks listed in
SRCTREECOVEREDTASKS are deleted to prevent them being executed. If
externalsrc is used for the kernel then this will include
virtual/kernel:do_patch.

We can depend on do_shared_workdir instead as this will survive when
externalsrc is used.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/kernelsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index 675d40ec9a..a951ba3325 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,7 +1,7 @@
 S = "${STAGING_KERNEL_DIR}"
 deltask do_fetch
 deltask do_unpack
-do_patch[depends] += "virtual/kernel:do_patch"
+do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.20.1


