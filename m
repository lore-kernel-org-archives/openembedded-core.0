Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA7177326
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 23:04:26 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id w123so57667846pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 15:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EmIaSDSuqt+3NITK5JwpmYpzsi11zfJXfW8g0Bo9p78=;
	b=awBr9gcYR4oZY+gGGWsvuOhF6HYfV0n/D9/p+Pe0qE2CYLXnECe4asFfqDT7eXsYOZ
	AVeMe9/qZn+7TlM5G+HQpLp6asiWBQ3lO0Cc7HjPVR6kKl2SNNcH3iGnS/6Dnlkay3uf
	nQbDmbBf0xBng+mBaczesp3n0tidqfU5GKqQhlNRVhYpBYaW6aDyl9tgyZUECnG99A//
	O+OmtkhRCpzFj3Ce2AmeD7szOlnRGs7BsLhe4OnG4U7NJhRBGyx5kjogXrsVb6ljOdui
	TjujnwRszxzI21e/923kWGOYNTU2P59xC8VY5mAKGs+UKs1VsoZ96ivuWyhKeXNJu9UF
	UWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EmIaSDSuqt+3NITK5JwpmYpzsi11zfJXfW8g0Bo9p78=;
	b=D7nMh0SQXfWMEfGK5kVPzbIVAORgN1KdRC8grTuNzFJp9gH3E87nOMf3GULTI9pcWL
	Y3d8mqmrq8gySAWDVizjIMHZOf3dCoPOhZr5GRB/EZH5X7AZtubjFtOgLcAfWuOvOqqH
	0nmTZlAbyX5Thi1m+0Y2lqq55e6dLCQgmwtScGxZfLCs86M3lUv6eMtFlrVx59cJYU08
	9heL88WOhfxjR/QjjnH7tAio2PPdMNYdSIcEtvhhLpfijj3hSwvtXwVgwJS4GPpT8fg5
	T7az7VNVY+U/dh/zoPhzSBDY4rlZ1fzvcPdHnLPNITqJsfA18D0Oh/t47TU4VJBxmTnd
	zZjQ==
X-Gm-Message-State: AG10YOTWiLPSbL2NTAoYOd0OslD816lmFEj2NXOacQ0YzhHxcyv9YbnzoSeOQeiqVqM6rQ==
X-Received: by 10.98.72.130 with SMTP id q2mr15165071pfi.154.1454627067790;
	Thu, 04 Feb 2016 15:04:27 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	76sm19535589pft.44.2016.02.04.15.04.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 15:04:26 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 15:04:14 -0800
Message-Id: <1454627058-26663-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/5] gstreamer1.0_git: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Thu, 04 Feb 2016 23:04:29 -0000

musl libc generates warnings if <sys/poll.h> is included directly.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index 4fff533..77653af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -18,6 +18,9 @@ SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
+# musl libc generates warnings if <sys/poll.h> is included directly
+CACHED_CONFIGUREVARS += "ac_cv_header_sys_poll_h=no"
+
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


