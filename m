Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id C9D5F792C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 00:06:11 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d4-v6so3028977pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 17:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pqiXdvS1f+0VEn6CBhOEjtsCBeC4av4AMBd7e1OkBXg=;
	b=bL9zD7RrdcML2qDU+Wl9lLPN4LliderQwDlILoo1tdDSIzTgqT8u1KTY/AnL2WjnOR
	c2FLMjwCxHrCQcKsXhpmLHXIsHdJvQnlgVa9LTPglCgrUpevSLSrcw6r02NyfoD44uQ9
	xrRLQmosZFnlw2lVqkXDACrTgZSwQNOernKeWw7esaI71yZGqB3pAYwcazn32US6ck6o
	AM9/3wNFWdRFBUmWOGDdTWBWlXRN0h7dNv+Kg5FEQXp5z7yWQX9v6yHbYbJZ89q1D3JJ
	t3362yphG4mOlvFjB8TeZxOHiBV+JlxGIL9ukkdMKJtllyd4+7/IhSAz9B54sfN+fWW/
	RFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pqiXdvS1f+0VEn6CBhOEjtsCBeC4av4AMBd7e1OkBXg=;
	b=fIWdlZmc6oxolYtlapV1cCvnD7/l8vhCgWVPqbBUy3vj5fww3CipLoHV+OoQdj6/kW
	84uIuMu2P7jVigkcHjKBj+kN21QJY1EPSKcfgrIrlGQfJUmmaOVIw1q9Q1iVMrXAVCDd
	oB3oRwf95FOaIjorvpyHGLvcLXEOC7zegoG4M3XkBvYJSKa7a5qb5XaGFzejWbP1hmoy
	vjX3yzpJN9FRMkC4sk6zCieOYP0k9tMWsZHRW0egOFfi0p8cvWobHGnrCm8N2HRucARc
	RItr1lki83rQQetKQ3FNLGKRwmdNUwwi4Eko5GYnPGhiFcpCKsHcyjnVhU4zg+YIYuRY
	ueqQ==
X-Gm-Message-State: APzg51Adn6da4vdjl8N+1AxfWlSJuFiBBCJhWbHx8t/7ClgPu6TPKFnj
	Ad/hykWpzzsqExeZhtPBWrTo0AGy
X-Google-Smtp-Source: ANB0VdaAnUwlEal409RJWqLNB9W3Cgwc2Z6gJ3jUmB68TiT/LttVbKThOxCxuHNOpqRbOx1g8q8gdQ==
X-Received: by 2002:a65:5288:: with SMTP id
	y8-v6mr7533018pgp.284.1535587572332; 
	Wed, 29 Aug 2018 17:06:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	x65-v6sm8295727pfk.140.2018.08.29.17.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 17:06:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 17:06:01 -0700
Message-Id: <fae07991f994982404930e78c225db460bd14ae6.1535587162.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535587162.git.raj.khem@gmail.com>
References: <cover.1535587162.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] sysklogd: Use update-alternatives
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
X-List-Received-Date: Thu, 30 Aug 2018 00:06:11 -0000

busybox also provides klogd and syslogd, this change makes it coexist
peacefully. Currently rootfs fails in situations where both of them are
providing these binaries and busybox postinsts fail

update-alternatives: Error: not linking
/mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-cmdline/1.0-r0/rootfs/sbin/klogd
to /bin/busybox.nosuid since
/mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-cmdline/1.0-r0/rootfs/sbin/klogd
exists and is not a link

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index fc4e67c18e..2a8bed00f3 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d systemd
+inherit update-rc.d systemd update-alternatives
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
@@ -70,3 +70,9 @@ python () {
     if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "klogd syslogd"
+ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
+ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
+
-- 
2.18.0


