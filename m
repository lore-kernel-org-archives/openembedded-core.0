Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E01A745D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 19:25:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 143-v6so23453918wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 12:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=Nfqf2f3Rj93jUTUfYTKl3pL0z0xLeeUrja9f8G7HvFc=;
	b=guC4l3IyxNsVFk5E5yJ0READvrXz0yQX1GW1ck02pjAeE7AGBwFvambuEDeCXMF9Jz
	vS8XYqy4N92uLhwSQEXw/1106zZo45s7hy92gLPB9GOZqu7G6D1zBQssqOo8mHofWH0R
	N+im9uMM20Q9LhYN2m83VqqrMssrN3h+zAc5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Nfqf2f3Rj93jUTUfYTKl3pL0z0xLeeUrja9f8G7HvFc=;
	b=YZM7xG0lEeDQn2ElMmfmgmTk7voFDcXGiA8kWcaS6XKc0c1Mi+9A5x2lxrG0Unp0Bm
	udAgpgXoBMxFJzSEUvvnVZI+LXpX1uo8QrT3On8+wyfnCeGrSvch+c0l6cxyqmsGSSjx
	Oh4TpbKcNy5X/j6EpSv8CFgEztcg+ivlhBrFYC/EG0I67qNjQrqrCOpnf6yDJleISkLS
	+IiPB8FfP2ADU0VuqHd04RIzjVfUgKWE4XTXHegG611hYM+ybkkpSZU0OSxId7uiJTzZ
	44XRvS14I1Ij7/ZqOc3+T/fO+ENy/AmNsLtLNwSFaEa2qQ4IazlQNgiTGFhYrw64qdK6
	yrLw==
X-Gm-Message-State: ABuFfohsTC13+k5QamE2j+bpEVKCDgl+p5LJkxCaQSqkBMbrRqgDgGmZ
	EzqSCLXv5aI1mVdcUeo3rS9cdG3bG6A=
X-Google-Smtp-Source: ACcGV63x0WxwgY+J7hzsvWfwIFBViwp98EUK/AuPka5lLeNv4QZA03sPZnLd5Cs9TW0bL/dlng/INg==
X-Received: by 2002:a1c:dc0a:: with SMTP id
	t10-v6mr17752374wmg.105.1539717949496; 
	Tue, 16 Oct 2018 12:25:49 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c8-v6sm18671662wrb.6.2018.10.16.12.25.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 12:25:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Oct 2018 20:25:46 +0100
Message-Id: <20181016192546.15672-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemtap: Fix issues from 4.0 upgrade
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
X-List-Received-Date: Tue, 16 Oct 2018 19:25:49 -0000

4.0 adds systemd support but installs the unit files in the wrong location.
Fix this in do_install and inherit systemd to package them correctly.

Also fix ownership of files manually copied in to root:root to avoid QA warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 0b7833e901b..3c45bfa9374 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
 PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,python3-setuptools-native"
 
-inherit autotools gettext pkgconfig distutils3-base
+inherit autotools gettext pkgconfig distutils3-base systemd
 
 do_configure_prepend () {
     # Improve reproducibility for c++ object files
@@ -39,6 +39,14 @@ do_install_append () {
       rm -rf ${D}${datadir}/${PN}
       rm ${D}${libexecdir}/${PN}/stap-env
    fi
+
+   # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
+   install -d `dirname ${D}${systemd_unitdir}`
+   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
+   rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
+
+   # Ensure correct ownership for files copied in
+   chown root.root ${D}${sysconfdir}/stap-exporter/* -R
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.17.1


