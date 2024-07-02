Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70104C31D97
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 16:34:50 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.29583.1719938082288942315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 09:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aa495KLV;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e7693c369so5967845e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719938080; x=1720542880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxUlgtDxhZy6RUl5KEyf+Dt1k1yusLO2USELdvXMDBs=;
        b=Aa495KLVvDNijOvUXY38Q1CRRrWGGu8XMt4GgcqnySvNFZ0laqmaYi3zAaNi41628i
         RenrdEflueN/HDRtlMdrJcyRDkth/Euhpe8F46vsHtn1rIW5n45vDoSgTPkOztUjJme1
         KDnvV37U8GZqSr+6ljq8Dnv1QuYzsmRaWUqqdpgawsKmp8fmsU8zDWuogZHicaeOmQsR
         g+GpG+paKuD5QK9rHz3NNMi35IT63BNNSJiKtE4pv52iGmhPv0UzqwvdA27X/4/Kxoz5
         ka/J7VVZepv4vM4gGEJwIGWP+Yeiu8z4UCSa1zeCPBOlb5SvBhNXGpuSidWrneixJ3oR
         1YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719938080; x=1720542880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxUlgtDxhZy6RUl5KEyf+Dt1k1yusLO2USELdvXMDBs=;
        b=QX+aIZvWNf0uPp2wVIUfTNzT4+HO0rYQmtIxu2S2C72nAE4dZQ/KOeYda2ruNWnkUs
         nSGum92MDjHMdqu7jneoW7+nipMyZbs+kS2WQK+15J4j8ZaEaRzd0ye+DtFZAZEftt4E
         aAMhghCuW5Fpv5UgbS835ORZ0DsOLMPKuS8LwtOxaRIsC/DO9WvJ86vLCiBn8bnLCkwX
         gSBE6ibi759Js5mS6F/AWEDfZK6bNTHGo1Fx/QZgNvvcP0Z9//IlBh6emWibGiDDzJfb
         8i7er1shFLkjvTCiFjgXG65DQpBjDYjoaChNrmVmZ6LZpBCsChmyKjTRvyAlPxywzayb
         8qLw==
X-Gm-Message-State: AOJu0YwiKel/xle4I1vQTixuOtO+SYlsOmfnz9sta8rvhYVfmECwUX4F
	z66ehw+1JFbg4vHscReSGhjpBREk9CikkTPcvIVA0RzSi9KVrTRtPlTqNA==
X-Google-Smtp-Source: AGHT+IGoo/b2Nr0S1bzOu3mnShdzNCe4njvN/rDqTO096VWxOjtQzGpABh4w0K8/pAgJrgqc5gjdCQ==
X-Received: by 2002:a05:6512:ba3:b0:52c:1298:7304 with SMTP id 2adb3069b0e04-52e82661f17mr6499067e87.26.1719938079782;
        Tue, 02 Jul 2024 09:34:39 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5b626sm202756505e9.15.2024.07.02.09.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:34:39 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH v2] openssh: fix CVE-2024-6387
Date: Tue,  2 Jul 2024 17:33:37 +0100
Message-ID: <20240702163336.75537-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201435

sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
Race condition resulting in potential remote code execution.
A race condition in sshd(8) could allow remote code execution as root on non-OpenBSD systems.
This attack could be prevented by disabling the login grace timeout (LoginGraceTime=0 in sshd_config)
though this makes denial-of service against sshd(8) considerably easier.
For more information, please refer to the release notes [1] and the
report from the Qualys Security Advisory Team [2] who discovered the bug.

[1] https://www.openssh.com/txt/release-9.8
[2] https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt

References:
https://www.openssh.com/security.html

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: include the missing cve tag: CVE: CVE-2024-6387

 .../openssh/openssh/CVE-2024-6387.patch       | 25 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
new file mode 100644
index 0000000000..9f8f6881e7
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
@@ -0,0 +1,25 @@
+Description: fix signal handler race condition
+Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2070497
+
+CVE: CVE-2024-6387
+
+Upstream-Status: Backport
+https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=applied/ubuntu/jammy-devel&id=b059bcfa928df4ff2d103ae2e8f4e3136ee03efc
+
+--- a/log.c
++++ b/log.c
+@@ -452,12 +452,14 @@ void
+ sshsigdie(const char *file, const char *func, int line, int showfunc,
+     LogLevel level, const char *suffix, const char *fmt, ...)
+ {
++#if 0
+ 	va_list args;
+ 
+ 	va_start(args, fmt);
+ 	sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
+ 	    suffix, fmt, args);
+ 	va_end(args);
++#endif
+ 	_exit(1);
+ }
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 6411a64eff..d2c477a062 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-48795.patch \
            file://CVE-2023-51384.patch \
            file://CVE-2023-51385.patch \
+           file://CVE-2024-6387.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.45.2


