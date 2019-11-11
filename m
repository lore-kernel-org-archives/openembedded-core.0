Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8857FBA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:26 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d13so11246687pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QaFVveUaioki+mNjrq5iWu55ySD8Fofp88iCF/w3oC4=;
	b=ABxKnHXkTM+lqwmfRKuDkBnZp9YKDEjyf2vEm0brovOdjJC3WoxDY5+KGeKxx6aQeZ
	opCj8lRE7rpRnGUY6+yEupNYk2mBWLZwHRULxONZdPsmHfwKa8DPexpAwSQNMtmmpAwW
	gIU9n/qhcyEKHs/w+pv325AdJZbaxExs4NEwvBGnD37/KVMTE5CYDmQPN+s58wE2GM7s
	hN9zAOLMgFfbewr4/W189dzF0Mq2DdMuN8PbHakhiqBntTjVkB1/gSCBa/dS+QaKZK1B
	eCTFs5v/+8bcD65hfqii7hvsogjaLCBRzlrGLhAo+ZudAR5k8mVchiEJuyV/KozRH2Pz
	sGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QaFVveUaioki+mNjrq5iWu55ySD8Fofp88iCF/w3oC4=;
	b=RYyJDH96Nn1yBFvudc3SdFfkxx5tyW1ZrQEfIVERT0BtdxHFQ7X5P6WASD3GGnuS+u
	kwjZ0nR+ZpEIrievQYzi6Ih80JtZDuYEVF56jgxnM/LWp0zHR1lJZ4foK2cTipVQTn82
	oDRS0fe0Z+JAAlHBSjrGKV5BA8h+4GfPaOF6lpB0gn5tFBu8KtWasJ7tJX6JGzT3bm9V
	uWkjR3pl5+815dIki27A/GE0RF6DI39nYkslYMy23UeB5PAjiBm8P4hewVumSgdrbwdz
	3swQezD8K18QKpQxAHgPaxou4CQM4TvPENChp4z3SysDOgry2bZVHjM51qnmE3h6oPuS
	zI6g==
X-Gm-Message-State: APjAAAVj3L7zpmGf7OfO5wVxjpMByvXC07ByePMKI5OUv2rG6kezv7jY
	H2etG/o2OL50xzG30ngMdEOufXzN
X-Google-Smtp-Source: APXvYqymUKrc9z/4I5FuiBUQZtrnUk/SG5ecRaMR3sbeBTXE1JvZrJGRG2v9YKVxjYbV+RkpIB9LHg==
X-Received: by 2002:a17:90a:bd0c:: with SMTP id
	y12mr535258pjr.108.1573497027493; 
	Mon, 11 Nov 2019 10:30:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:30:02 -0800
Message-Id: <adc0a31169f59d0183c327347b9ab3bcebb1aef2.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 20/21] initscripts/sysfs.sh: Mount /sys/firmware/efi/efivars when possible
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:26 -0000

From: Haris Okanovic <haris.okanovic@ni.com>

Without this change, efibootmgr is unable to recover BootOrder if lost
during a previous write operation, e.g. exceeded storage capacity. This
is problematic using EFI to manage boot flow from Linux (E.g. via RAUC).

https://www.kernel.org/doc/Documentation/filesystems/efivarfs.txt

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
index f5b5b99..4871ee9 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
@@ -26,6 +26,10 @@ if [ -e /sys/kernel/config ] && grep -q configfs /proc/filesystems; then
   mount -t configfs configfs /sys/kernel/config
 fi
 
+if [ -e /sys/firmware/efi/efivars ] && grep -q efivarfs /proc/filesystems; then
+  mount -t efivarfs efivarfs /sys/firmware/efi/efivars
+fi
+
 if ! [ -e /dev/zero ] && [ -e /dev ] && grep -q devtmpfs /proc/filesystems; then
   mount -n -t devtmpfs devtmpfs /dev
 fi
-- 
2.7.4


