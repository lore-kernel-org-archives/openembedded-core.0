Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD58CA9ED6
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23434.1791708072524345039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SBDUJ7/Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso518373f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708071; x=1792312871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jkewcsiStxqki59oytX2BNCLMj8Re1sRm78Vsv2XkVs=;
        b=SBDUJ7/Zhd8YBk6GuzGycwnRqzMgnsrf8jZaQ58ddvVOl/3+1CRA72Pd5pLz+PyPeB
         +JNLNgEO2awbRIzy/xUYQ0aP3LrDGTIB/40io8Sb3qLhP2w2EV1UR+IQNafSRwUuDMeq
         t7W5O98BdQeylWgmAzAPYm9EDRJAeqegJQQEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708071; x=1792312871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jkewcsiStxqki59oytX2BNCLMj8Re1sRm78Vsv2XkVs=;
        b=O5qq5RM6FBSSMjMKXX9/qxC+ikRAbvfV6p136/KeYxf6cDvK/IZJcTMBhcKKZtGo9j
         yH0uYlBcdRL95/a6McboQiQa04TfVdsAV58ezsBL/QcdhasymyHsBxTIhswYb9KyWbxX
         /qA1qQhUgUZ2pbi4/P1ty3t95Xy21wB8jPzOJjbLxal+E1EakYDbp6+wGfZT6P2fZ2my
         o8N4Tdv6oR8SvquHUeRKiaaKy5yP4a1zLWexHBxiKhvI3NICz3SLnx5BIV1nn6edZwl5
         hQ8KkNUJ+W7sy7hRbd5CRjvHTUNjHWdRgFEgvzfqkrU10mHNqiCzzM+b5Bf18iUg/sEX
         5BPw==
X-Gm-Message-State: AFq9FYIaZHWnpX24o6W9iUtuviGKqdDDw+xfxbCBfUwiaKpOu7PdAaXK
	WjiHmqnn3fzAZTugmocF04NId4aB0IhHs/xtyabyxHAWh14Xd/rUMcBpBOJFtjXT6TFe8t40av8
	YbQ11Kd8=
X-Gm-Gg: AYBFou2ajKd7tOmvf/i49+9HKq35WNvionvJNGNEjguVeVUCEChFw6APcckm/bNW235
	rew1ysSkGq1CDFYiduqo+VABoLVCBqPqU/aXagtB1tBoih5RkZEuzavoLAb51kMLvqtc85sOfzU
	z4MC+OuJ5tbx6YJrwjzAmwF+ZDgSHp1EsKbYWcjZqnray+S0ofC/1chB7dJBiF3cj+s8+MuuWrU
	2vu5QnyoPyqntsjsYwHT53e9QOvltikh0t+IjshuFlbtPwkNq2vvRCIk3eYHo5OFXOPZVtyUFWR
	kVzaiCEJNnZ6wq9dFhF9dxkL8cTuWEiG1o55YfoesKqAW9lC2NMQcGekxYMjzloUYjpKLyK0srL
	yJasvf3cO00i6dAsvU88bUXgVe1B3LtpTviyU/lM9YcbnNiX+mF2tcp5m29B2MMlCgRRv+fH29a
	CqT1oVhp7/+3P+FAfTQxwa1mQ6zfC5GvZWl++W7JXTk9XsrZpFFetr6Rx2qK47+UL8zzfbbgEeE
	q9FhzQ4YBNY7wwco9+x3SepCF5CVUl9ccY9xgzLBjkhBXTStzCAY8Q3P2hQ1tdGcTrhfy0Vxw==
X-Received: by 2002:a05:6000:11c8:b0:487:da0:df5a with SMTP id ffacd0b85a97d-48dbaae370emr8769966f8f.42.1791708070624;
        Sun, 11 Oct 2026 01:41:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/60] openssh: fix CVE-2026-73283
Date: Sun, 11 Oct 2026 10:39:50 +0200
Message-ID: <b2123ebcf41872eb84fd77014b0c62a3dc823a1a.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247526

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix that makes the authorized_keys
restrict keyword apply to tunnel forwarding. The upstream fix commit
is referenced in [1], and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b
[2] https://www.cve.org/CVERecord?id=CVE-2026-73283

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-73283.patch      | 42 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
new file mode 100644
index 00000000000..d2660149e31
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
@@ -0,0 +1,42 @@
+From d322f2ccf7da095ce94d1d99cb563246f61487b Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 14 Jul 2026 01:05:05 +0000
+Subject: [PATCH] upstream: make authorized_keys "restrict" keyword apply
+ correctly
+
+to tunnel forwarding (which is administratively disabled by default).
+
+Reported by Erichen, Institute of Computing Technology,
+Chinese Academy of Sciences
+
+OpenBSD-Commit-ID: 5b3cc987a64749c94b20e12755db32a83f8f01e6
+
+CVE: CVE-2026-73283
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk and retained the Wrynose
+  OpenSSH 10.3p1 revision.
+
+(cherry picked from commit d322f2ccf7da095ce94d1d99cb563246f61487b)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ serverloop.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index 8e63480ec..9d8a3429 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -523,7 +523,8 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding ||
++	    auth_opts->restricted) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index c53100cd99f..e3c8c1944d0 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
+           file://CVE-2026-73283.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

