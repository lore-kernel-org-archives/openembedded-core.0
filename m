Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C116771B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:38:58 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id w143so35377747oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Gragqw5jOGsw9MxWqHZtKAvgFjgVPvwgag6zQfjZfyY=;
	b=0YWtJ2VD30QpxyPdHL/lxBbiKAj6w3+a5aRI1+BZad8Sl9F1Fa9UaqhWHJYJT8DiI6
	nt4kFyqMgEg0pASKgeLhlchZH8H21eWuVw6ukfTklNY0n6eB3sKM3nVxeJlZrqspd75c
	ptLGD2WbUwU84Jha4m3BAP0hJzyn69qWdz0o5ibE7VBFU/OI/t7hAWZXVrPL7i16dgf0
	VTyqlDfGR+hCKICmGziaIMNc8K5EYuZQbx/qtPWy2H6QKI9FzC4N/z9BZILDqWPvKk8n
	4U6VLRl3k1MxBN8XJ0bKiyrsdDLkoywdp/UFuZLT5CqCo8hRnFxCYebsRxIIL3omerf4
	9S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Gragqw5jOGsw9MxWqHZtKAvgFjgVPvwgag6zQfjZfyY=;
	b=cKMjcC4JzdVk5tWMnggmUzLCZkq6EsXo4CCWNhp5bEIZ1jnFdmPoLvpjZN95YR87Nv
	Iihz6rQSc4yZEoXL8ae6dE3tX0b3/AUMYx+lBKtQWEtEShA/yNCeGWhs9k6wtVvp783+
	DjkkmzHeQgvzsfHyECkGgNAbDly+PWf3yvEcSbfMLjdQKIcUh82SH9QsYt6kL0LL0Xly
	nGO+JXZwNvHK0Sb1mmFyk60Tczsl2RPtmNaMPAbL2G/x8X9F5K52gRqsfHZw8HrAglEp
	ZEIYiKyw6mvalFa/Q1yKo1owRtwmuhuEhAot41yEGEbA1SbUvTZhX1VO/g/i5lljjB9J
	yS1A==
X-Gm-Message-State: AEkooutSJ8GM3j1EJ+rIoWL9XS8Af/h1SmRhT3vx4iOtVfezcLZURUSkQmgMTOfjFCfmxA==
X-Received: by 10.157.2.10 with SMTP id 10mr6499811otb.11.1470674338936;
	Mon, 08 Aug 2016 09:38:58 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	e195sm12516486oic.21.2016.08.08.09.38.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:38:58 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 11:37:53 -0500
Message-Id: <da75f7dd900ec6188699011a2d49ca8afbaffefb.1470672689.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
Cc: marex@denx.de, trini@konsulko.com, andrew.bradford@kodakalaris.com,
	denys@ti.com
Subject: [PATCH 1/5] kernel-fitimage.bbclass: do_assemble_fitimage(): cd to $B
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
X-List-Received-Date: Mon, 08 Aug 2016 16:38:58 -0000

From: Andrew Bradford <andrew.bradford@kodakalaris.com>

Prior to assembling the fitimage, ensure that $B is the cwd due to
bitbake commit 67a7b8b021badc17d8fdf447c250e79d291e75f7 "build: don't
use $B as the default cwd for functions".

Without this change, do_assemble_fitimage() fails like:

Log data follows:
| DEBUG: Executing shell function do_assemble_fitimage
| arm-ka-linux-gnueabi-objcopy: 'vmlinux': No such file
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_assemble_fitimage

Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9a3caf5..7cca180 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -189,6 +189,7 @@ EOF
 }
 
 do_assemble_fitimage() {
+	cd ${B}
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		kernelcount=1
 		dtbcount=""
-- 
2.8.0


