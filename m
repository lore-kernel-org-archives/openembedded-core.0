Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C74D96FFC0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 14:43:00 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so183694558wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 06:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=y8xudFliH+XnRHwMkIqm2e8R/fj8qdSsuVyp2DPY0a4=;
	b=apwLXjIEb33WjKQ+jvAY6qlDD53/2CvshYop3ZiZw35mdgrsJoBT1s1XltlKhDPVbq
	56Sn4mPc9mmjsu2QSwYDTOXK2x0S9RkW8YsNFFyMVyoeBe/US3/VI9RAFqdqh0RWACdi
	u9SkfHRazi7OKGrVrFEnwyXmhKEgYi8ka/SCudRNhJsO5LTA0VwFvnhcvL39lwwL3Atu
	HCDazEPEjL8psh0M43sXo8CcJlqMcar2AdYSmygjOU55Ieo2XbDqSRd8wUTLQWFja8fM
	nlsozlPPh+hg0eUx7H4q8arNlBP6GCV5Gc5BJ/t8Ha7wda3752cvPeDvZX7I6UkOwy4K
	/+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=y8xudFliH+XnRHwMkIqm2e8R/fj8qdSsuVyp2DPY0a4=;
	b=TaS/FFEV6OCxcvpJxivDfztp0TPdzLRq4UOqbSt/KxyRllCRPuKys7978Q14fVue0q
	nKrQCrnWixcIWGivpoJcJVd/7ar+od/zaTOMhSlCJXLaJQCBELRAZ1kG3LiCMERHOKXx
	ZGGS1M1Lk8btr+a70eSNIlnh8uefjymnR3kXtT/LiV56v7lQz3D5S2MmnDgDwI3463EF
	wv6KKaSIHw6Zj9TyGYWLAj1ShdwSEndL+ye7UHN7uQpnQbEuCvl48u6uV2Z0v2n3Eiri
	R7Xb+L2Twqw8/Ud8wDqo0TOFg7lx+AcdB3T+Di45yNfJZGgSQaiBzOzyEPQHnhSwEiy5
	Raqg==
X-Gm-Message-State: ALoCoQkik+OhoEx1HMigriWQntQuXd3OA641UuWriGH5eQ2e3Yyfrt0BetS0wlSGF/atrF19MmYAYuPGqju5FXLnHDtbi0iD1Q==
X-Received: by 10.28.226.86 with SMTP id z83mr29710008wmg.77.1449585780414;
	Tue, 08 Dec 2015 06:43:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	cs4sm3297442wjc.10.2015.12.08.06.42.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 06:42:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 14:42:57 +0000
Message-Id: <1449585777-6697-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][RFC] bitbake: set libexecdir to prefix/libexec
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
X-List-Received-Date: Tue, 08 Dec 2015 14:43:01 -0000

Hi,

This is very much a RFC as currently systemd images with this fail to boot
(logind fails to start), but once that is sorted I really want to see this
merged.

tl;dr: our definition of libexecdir is fundamentally wrong because it embeds
$BPN.  The prevailing trend (and default in GNU tools) is to use /usr/libexec,
so this patch changes it.

Ross

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 06971da..ccc781d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -41,7 +41,7 @@ export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
 export bindir = "${exec_prefix}/bin"
 export sbindir = "${exec_prefix}/sbin"
 export libdir = "${exec_prefix}/${baselib}"
-export libexecdir = "${libdir}/${BPN}"
+export libexecdir = "${exec_prefix}/libexec"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
 localedir = "${libdir}/locale"
@@ -55,7 +55,7 @@ bindir_native = "${prefix_native}/bin"
 sbindir_native = "${prefix_native}/sbin"
 includedir_native = "${prefix_native}/include"
 libdir_native = "${prefix_native}/lib"
-libexecdir_native = "${libdir_native}/${BPN}"
+libexecdir_native = "${prefix_native}/libexec"
 base_libdir_native = "/lib"
 datadir_native = "${prefix_native}/share"
 bindir_cross = "/bin"
-- 
2.1.4


