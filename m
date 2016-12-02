Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB3D871BFB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 21:09:30 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id h133so2211802ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2016 13:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=T0ux1R4em0xY03FrAlBqD3LlAYEiS1L3FbOkXnC5ixU=;
	b=ikLUIFBFOCHw7joIQuJhAM4lA6ihs4bk8vct6ddqk4ayzmBNmzIgHKr+HKhebRy8R2
	D0S3tFrUE12pk6Rqpd782ZFmdxkOnyz5ScU6D3HfCM4qNgtwVHktXLGV2K57mATxacx5
	yhhEol/OZFjG+K2PRfT19EA48QdwD2L3DeIEVAB0cNBYjcFLJ0G0gfe/2NyNwWzO1HRC
	fSym/C16MnL/L326ABJ/55AD7MIf+tG/QIR42mua/QJ4wyQdSfMn8R7V0EmEN268FDE+
	UifGMOV3CWX3OJMVP3MArvExaRhvHJBJ5kqCy5OEibuLF7/QTmKo15/3ySwUIJLhLM3R
	ziGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=T0ux1R4em0xY03FrAlBqD3LlAYEiS1L3FbOkXnC5ixU=;
	b=OX6foNOY5CCM2V5U7q4NUaddRvDug0NxbkLPatiFme4C1OamPtvM9CRiOQ6L4sqpSg
	CalFUt1Nomt+vy5RSRnSxhbxxXmWPrzlcNuahx4T0UYWDwoJb1K9F7mxNYnLCOXJmhKz
	jNUbzcjf5nZ+SDG/Dc6EdC4B9B7dyx4Tjxtqcg8Q5lSno5GgiiLisDVjmfqLLbYDRRor
	+G7lVB9QMuUTwjtBNjfgB10KDM+LIsWcRFcd6FEdlWceqsizMN9winLfUwK1fVz7CY5d
	1mR5aLGlFeoezaItp4uMSSVETpgxnHFS3IXnhHNzz0KR6MuSyY7nzWGdWpKCSJbk/yP+
	p6WA==
X-Gm-Message-State: AKaTC03lqyQKkwNTBmjSRyBoT1oCa3DTMr9zXNaZ85wkww4f96w7LWID/PYp2FyQPuc0Ug==
X-Received: by 10.107.3.83 with SMTP id 80mr39948327iod.52.1480712972594;
	Fri, 02 Dec 2016 13:09:32 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94]) by smtp.gmail.com with ESMTPSA id
	i62sm1696438itb.12.2016.12.02.13.09.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Dec 2016 13:09:31 -0800 (PST)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Dec 2016 16:09:24 -0500
Message-Id: <48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1480711764.git.bruce.ashfield@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1480711764.git.bruce.ashfield@windriver.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Fri, 02 Dec 2016 21:09:31 -0000

Lernel meta-data that has patches, but no branches, can trigger an
error due to no branch specific patch queue.

This error then cascades to more issues since the tools are using
a named file in /tmp to store and display error messages to the
user.

We fix both issues though the following kern tools tweaks:

  commit bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c
  Author: Bruce Ashfield <bruce.ashfield@windriver.com>
  Date:   Fri Dec 2 13:09:40 2016 -0500

    scc: use mktemp for consolidated output capture

    To provide useful error messages the tools dump pre-processed
    files and messages to a temporary file. If multiple users are
    doing builds, this means they either race, or can have permissions
    issues.

    By creating the temporary file via mktemp, we avoid both issues.
    (We also make sure to clean these up on exit, or /tmp will get
    polluted quickly).

  commit a287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26
  Author: Bruce Ashfield <bruce.ashfield@windriver.com>
  Date:   Fri Dec 2 13:08:08 2016 -0500

    patch: do not assume a branch specific patch queue is needed

    When processing input files per-branch and global patch queues are
    generated. If the meta-data has not created any branches in the
    repo, no branch specific queue is required.

    The tools assumed that one is always valid, and hence would throw a
    non-zero exit code and stop processing.

    By testing for a named per-branch queue, we avoid this issue.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 88b1aee729c9..0f8a786176f9 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "b36f6f9a5695f2084b83823393e13ca42284bed9"
+SRCREV = "bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


