Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 57D0C7710C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:27:01 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f6so3857864ith.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7z84DZtDpzj0YO2yY5/MVjOiAvpzYeZ21ehEcCuze0E=;
	b=jkel8zN63nBBPQ4iMKd8i/AQTkh8QhQ2tzVBbqj9aAEvlbS6jtuWAlbAl3ZOiC5MT7
	YrJ3Clv+RhEL2O/akd0XM1oLNR944L/6YjmjdwmOMdn0yVqJj0kFbcYFZLm0fZIxbaL6
	8xo4gyo9f2oWxRNJUp+Ao3Tb+U2gkfsUNoG6y0DUplY6AYzHoqZsElRm5diHWTYBU/ph
	E4jOdXzEWvrLjMvZ7kMYKq/lDiNXOvBo12KUORoBl739nbRXaP07P13KszdUlehoriWK
	rYY6MvJCYpvJaQek+pvF1n3u/Kv9bZM+wWyKwQkPzzHgrx0+Re5XbFVEEnTtkPsXI0mJ
	VkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=7z84DZtDpzj0YO2yY5/MVjOiAvpzYeZ21ehEcCuze0E=;
	b=J7AcoR2R8qm0sAhULDy1tJE4zbcM8yBLz2ErlAfEAqFUZwADkri3/3DvJahBBCV8sf
	lxMxA6AgsV68aBh8+9enf96Iyt28KOkfbZKKXXcs3z7HmK4bccZD6GB4n6pwb8zkCLRR
	0zRUrEO0oDBvZvH0hA4x5yozax/M+e4y2AOM/73Y2VRC94SRg/Vdt7W3prGE+06yWxO6
	6191euMRTv7oL2NhYSU2hA23TEI1Eb/KCFks9ptNGAN2rzj9AW40YzQVV7dT/fIYcc2t
	ZojOg8qk7iwKRr0NZ+MR6yi/eMwiy09QQs0J6/0rhWVgqCuxcD8lz5iNCeIkhIqMU/Ft
	szow==
X-Gm-Message-State: AEkoouuLY1inJBoJmWoRshYM/Hw8rLBwk4NUXt0VFoA2VDIcLyA2YzbcbxdsfYbaDmpa3Q==
X-Received: by 10.36.37.197 with SMTP id g188mr1750235itg.89.1471285622258;
	Mon, 15 Aug 2016 11:27:02 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94])
	by smtp.gmail.com with ESMTPSA id 65sm7908858itl.16.2016.08.15.11.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 11:27:01 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2016 14:26:55 -0400
Message-Id: <74a692eac405b6a4ec769795831baac8ead7dc78.1471281772.git.bruce@zedd.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/4.1: netfilter: x_tables: fix stable backport
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
X-List-Received-Date: Mon, 15 Aug 2016 18:27:02 -0000

There was an issue with a netfilter backport in 4.1.28-stable. To
address it, we backport the -stable fix:

    netfilter: x_tables: fix stable backport

    Stable-4.1 backport of mainline commit 364723410175 ("netfilter:
    x_tables: validate targets of jumps") doesn't handle correctly the fact
    that 4.1 kernel is missing commit 482cfc318559 ("netfilter: xtables:
    avoid percpu ruleset duplication") so that t->entries is still a per-cpu
    array in find_jump_target().

    Use the same fix as e.g. stable-3.14 backport.

    Fixes: 8163327a3a92 ("netfilter: x_tables: validate targets of jumps")
    Signed-off-by: Michal Kubecek <mkubecek@suse.cz>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 4171062..6411175 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0b68498784da5defb7658675e37d9bc615cd4c50"
+SRCREV_machine ?= "5772feaf5827e42e1950a91d95b2fc3c1845b5c6"
 SRCREV_meta ?= "0d6de63d4603b9cc3a4a68391bcb5156b9b0cf96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 08b931c..9eae2e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.28"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_machine ?= "f6ab3612272bb22bac371403121609c66c50cd45"
 SRCREV_meta ?= "0d6de63d4603b9cc3a4a68391bcb5156b9b0cf96"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index ef3d000..8ba0bea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "460340f28dd4ed608fd66692bcbac0bb24fe4aaf"
-SRCREV_machine_qemuarm64 ?= "44af900716206d4cae283aa74e92f4118720724a"
-SRCREV_machine_qemumips ?= "0ff21b2a5e92defa32b7cb76d39980b63a2eb5ca"
-SRCREV_machine_qemuppc ?= "6bd2872ce7e397d285f7df00f4d0efac286e2401"
-SRCREV_machine_qemux86 ?= "44af900716206d4cae283aa74e92f4118720724a"
-SRCREV_machine_qemux86-64 ?= "44af900716206d4cae283aa74e92f4118720724a"
-SRCREV_machine_qemumips64 ?= "248861985b609d1cd24e8d23b7d15abfb31cbdc2"
-SRCREV_machine ?= "44af900716206d4cae283aa74e92f4118720724a"
+SRCREV_machine_qemuarm ?= "2f133a201f2bbde4ce33731d1596d5144360bf87"
+SRCREV_machine_qemuarm64 ?= "f6ab3612272bb22bac371403121609c66c50cd45"
+SRCREV_machine_qemumips ?= "d1cbc627631f706d19e8e4518bfc38b266f3fb9f"
+SRCREV_machine_qemuppc ?= "d1699ce26291a3e07113057ad7e235f7891e73fb"
+SRCREV_machine_qemux86 ?= "f6ab3612272bb22bac371403121609c66c50cd45"
+SRCREV_machine_qemux86-64 ?= "f6ab3612272bb22bac371403121609c66c50cd45"
+SRCREV_machine_qemumips64 ?= "725278e5cbc402139051032a7b2137f6707c46d6"
+SRCREV_machine ?= "f6ab3612272bb22bac371403121609c66c50cd45"
 SRCREV_meta ?= "0d6de63d4603b9cc3a4a68391bcb5156b9b0cf96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


