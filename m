Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9F2C79FB0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:04 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34912.1788788154946793998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R3pXGIvZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4858303de5dso4420596f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788153; x=1789392953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x+6t8ZaFdZbzG2cSApYkxSeK0IOMVKmI6B11ZOPBmd4=;
        b=R3pXGIvZUamiqpTJ6xHZFGypTFeP5F0zXwfGCA05/ur7akr1tNM7PNdzvKX1vb2CHR
         ucsAM/MJbNKDv/7OWAToFynxAzxW0myROL2maJgJGQ7IjlBWb7mKFMN+ln6JifQCZkLZ
         +lv1iBeAgR3RD8Yy7LJec2aa0JLP1hk4DlHgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788153; x=1789392953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x+6t8ZaFdZbzG2cSApYkxSeK0IOMVKmI6B11ZOPBmd4=;
        b=gCSo8tgglq5r37A5aOVp/JPPMp33o3pqUme4XJIAGAlXg4HFosFnI7mhSpNFHkToNX
         V7DSwx3f785s8/dneziWNrPBuCfWqt8QaZobzrGRgp/E69XQh7iSH6stqRJBLbLpvMsI
         M1YFolEl3xrVMjgtffGyc83QlJnjr9mMyPAZoNFEFhJwWJ27equr7k2oCtrkK+ZSGKnB
         9I9NchxN9fhkQQKiwrBYMhe1Yn5GNebaHIvyfUzGIpZDBPD4a0+M7m410ndvPVA9mk4r
         qHm9uvFI3EUosxgW/WxpZce6e7/6mkdNrzSHUZSBvs10dudzcuokgHATReAfbGdyNeaO
         5yrg==
X-Gm-Message-State: AFuF++k7oajpzfVW6bx1ztz4fsieJzX1IUojKY6ErQmYuqfyU5kGBEyT
	Xwjdx+kc+UKbow8gWiuhBWgBBlzaieCllpgbIcAhKxdFVIn3StVM8XCl3WgJrolcK13iNjGdF0y
	u3St1kSY=
X-Gm-Gg: AYBFou0bZ3/c86yITsTeb9RFl4geH8M08lJ15+PzK6g9HWOmpnXZnisU6jP4dmHkv/k
	Mk/D3F09mg2QE4Rz6r24jlAvLJ9lsRxiZiW324XpoDbhWdZ3wq02KQr5fx490Z8Bc0OQkdmtIel
	7mQ0VLqjVSJ8LpzvK2MvBKffVqaepSYDiQxQWtlerHWy7FlLWI2KGTWxfvk7FaXYonl4l854meM
	310KPQyQRzQ3JAdblm12PxyL+yZiHB3oGuPBBqpiHLf5j0vNZx96gyR/k+ahK+1l7drM+5JI7ku
	QWSyHckfxAd9shZbGdSi5TPOSivYWjQIM55XCbwg4eDyz+9YyZxtlsqCcODr9DqBP1oUNmEivH9
	gDpN5r3z05ZFtuzzBrc/pdEmabmBWwvlSEVrlcVKfPFHDowDeWN8noSugkafH14swDVlcfToYTF
	yXc+lcFOnRZcuYLwxa/bCJiJLZKNVJWrQzKneXRwQFaq+mRoKI+AepETl3KvPyz54VFYNDCqR3a
	O5dtEQMFOxFOWECx1jmHjH9yFTiGnwyMai2+kbmoRpdaNwMXD5NU7AnE5Gtvwjx
X-Received: by 2002:a05:6000:471a:b0:484:3311:3176 with SMTP id ffacd0b85a97d-485872899a7mr25937629f8f.23.1788788153174;
        Mon, 07 Sep 2026 06:35:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/35] util-linux: Fix CVE-2026-3184
Date: Mon,  7 Sep 2026 15:35:00 +0200
Message-ID: <2b3600a80144dcf4ca2632b010c59e8df254a6f9.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245262

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-3184
[2] https://github.com/util-linux/util-linux/commit/8b29aeb081e297e48c4c1ac53d88ae07e1331984

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/util-linux/CVE-2026-3184.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 753d032976d..f651dc2dab4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -48,6 +48,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2025-14104-02.patch \
            file://CVE-2026-27456.patch \
            file://CVE-2026-13595.patch \
+           file://CVE-2026-3184.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
new file mode 100644
index 00000000000..6dbfebe4b91
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-3184.patch
@@ -0,0 +1,61 @@
+From 3fb64ddbffbc9442dca56eb6d4f263d525708b64 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 19 Feb 2026 12:20:28 +0100
+Subject: [PATCH] login: use original FQDN for PAM_RHOST
+
+When login -h <remotehost> is invoked, init_remote_info() strips the
+local domain suffix from the hostname (FQDN to short name) before
+storing it in cxt->hostname. This truncated value is then used for
+PAM_RHOST, which can bypass pam_access host deny rules that match on
+the FQDN.
+
+Preserve the original -h hostname in a new cmd_hostname field and use
+it for PAM_RHOST, while keeping the truncated hostname for utmp/wtmp
+and logging unchanged.
+
+Note, the real-world impact is low -- login -h is only used by legacy
+telnet/rlogin daemons, and exploitation requires FQDN-specific
+pam_access rules on a system still using these obsolete services.
+
+Reported-by: Asim Viladi Oglu Manizada <manizada@pm.me>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 8b29aeb081e297e48c4c1ac53d88ae07e1331984)
+
+CVE: CVE-2026-3184
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/8b29aeb081e297e48c4c1ac53d88ae07e1331984]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ login-utils/login.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/login-utils/login.c b/login-utils/login.c
+index 321f9d6ce..0c5c805aa 100644
+--- a/login-utils/login.c
++++ b/login-utils/login.c
+@@ -128,6 +128,7 @@ struct login_context {
+ 	char		*thishost;		/* this machine */
+ 	char		*thisdomain;		/* this machine's domain */
+ 	char		*hostname;		/* remote machine */
++	char		*cmd_hostname;		/* remote machine as specified on command line */
+ 	char		hostaddress[16];	/* remote address */
+ 
+ 	pid_t		pid;
+@@ -906,7 +907,7 @@ static pam_handle_t *init_loginpam(struct login_context *cxt)
+ 
+ 	/* hostname & tty are either set to NULL or their correct values,
+ 	 * depending on how much we know. */
+-	rc = pam_set_item(pamh, PAM_RHOST, cxt->hostname);
++	rc = pam_set_item(pamh, PAM_RHOST, cxt->cmd_hostname);
+ 	if (is_pam_failure(rc))
+ 		loginpam_err(pamh, rc);
+ 
+@@ -1249,6 +1250,8 @@ static void init_remote_info(struct login_context *cxt, char *remotehost)
+ 
+ 	get_thishost(cxt, &domain);
+ 
++	cxt->cmd_hostname = xstrdup(remotehost);
++
+ 	if (domain && (p = strchr(remotehost, '.')) &&
+ 	    strcasecmp(p + 1, domain) == 0)
+ 		*p = '\0';

