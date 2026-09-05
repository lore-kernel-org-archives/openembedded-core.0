Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642F4C79FA7
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2591.1788641126193946377
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xx72ybeN;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so16598955e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641124; x=1789245924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=spGuQHW1dLggawfE9WDcF7r5TZVSjiHtmd3Nsle3jYA=;
        b=Xx72ybeNu8mafK25Snh5v/IY8Svd06in73vR/mKVWQxmriFh8v5juBGzM94MeSAt9A
         Ht6RVd0Gytro7HcBfTb1n3OnVsZtiV93pPZ9oOg2i+rC8hCuJqJyR2yc1F7QQNUwNgJk
         nEn4RC3kBCqT/02r0GwkOG8zkHFKXrjjfDw3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641124; x=1789245924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=spGuQHW1dLggawfE9WDcF7r5TZVSjiHtmd3Nsle3jYA=;
        b=MsA15zQv84IAfBfzzXALFStjSh0hswomaITWNBQyIjpa1Eiy6gUpxmlt1MqPER7QVc
         Tn+O4bG0hQZCpGq9c58dStGCDwGcGvpSco6OLb+BY0naKaRU7vXwWuD/WLZ5bY7XV/2v
         CIAZLOxhoiCjzDvxTpTEuqYt/sPEgJiNL72QWoyv5eQHXvdmEVbaVsRCNG/EctcMZhOZ
         qtcKpiZkenH/4L6KXFYcirfAVezJVFukA/Ty37U5OFxgcflXX5CD2qBwky4+sT0jQra0
         +FRew6Vg8Bl/f6ZE111MKdsbxkqdCj3bBwj8reO2b3TRnypsE4QVlIGoWJ17+YbtthTE
         yidQ==
X-Gm-Message-State: AFuF++lywWu7XAj3AiJUF8qiJSg1g8hoLDDEjHMSsWmcPFEt9iECs3Eq
	GCAaFLlyXR4I9FhBxe+kU27ppR5VdXVbTx3yde6iuicDoZtj3Oj2k6C4TwZdsUwTRM8sRDbyXmV
	jkD77GBM=
X-Gm-Gg: AYBFou1g7ebMxnSFlizJwTHrgC0uLmxgFtPf635qhQoSO1z1mILZqFgXMDlLRY3vBsO
	uCAaqo9TmFqwv25QHmm5O8jd0ByZdS0Oyz6AMx0NaTdS9Ee229RJH8ZyLMdXat6x2yOobNB2Zn/
	qVvaaRgeHuIkXOWncbzNC8/2oDfxECI5ib90QWcY2YRXvd0R0gbiwZQTtCDXHyYIOBQ1UpZjpNE
	gWNE4UxkweAPSdIuWXafCa6zV3rpkaDIA9c9xsceVs2UCL+jQyxEcxEGhWRCzRQeamAMQliG0dR
	zteS63L1pznFawDxNTUib3iJgSkAJBOutERPwoTU6RcgUOV3Amez3u8DJKbuRAGs7o7+Qh68Mje
	fU5OgbClmwo5PfZrlcMfKCHNntWYvMm0bi+lWwRKmVjhImce/0Zkys2HPWAxntOwvdXXbuDrmfQ
	QwoV76Byj2LpFeePqd2i/mOlTD7Yfu/eR9CV3JRfF1eh8Qt2jfmxl06nAl4ipO/ujEYfo/Zp1tE
	602cu9qw3oF/OWDBFToB5TvvPx3c4NmjAuJ2Hbaej1Y9lj4N+WvgJ/RDcc3sHfa8A==
X-Received: by 2002:a05:600c:1d1c:b0:49d:91d:d192 with SMTP id 5b1f17b1804b1-49d091dd358mr22839225e9.5.1788641124410;
        Sat, 05 Sep 2026 13:45:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/40] util-linux: Fix CVE-2026-3184
Date: Sat,  5 Sep 2026 22:44:25 +0200
Message-ID: <4aa5df104fd606fa21173ab7cd91d41ac40eaad3.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245176

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
index aec8721ca32..fdc62acc748 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
+           file://CVE-2026-3184.patch \
            "
 
 SRC_URI[sha256sum] = "f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728"
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

