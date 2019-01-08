Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3806BE3A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 20:42:59 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t13so2230030pgr.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 12:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FWtsiIpTB7N7AUoSVZSre5vIrEAEOKwIg97RwYvKCSA=;
	b=IBWd2kzoTSnoQzR4qTGbP21WZ7vfJm9Ve+bIxmCzKVnHGkv0m+mhUgB1S2mbo05mBB
	FE2H8IrVfeIl8D07JwbmZlZyyYAu8kVCtrLNYvTtuEwjhwDdzcPlo9jn8HOl1MyeAkeN
	S0WcZ/7MsT733TfS4q2e8ITqUdiB/av9LjzrvJZI4KuXBCrF3YN/yWTFxQ3t1E3SjlUP
	wsYE7DFL47FgMwq966U4Rb41BqQy+5iDlC48UIcseEvveIurvk2zzn2hyQjYWWaxVDci
	D/eVOub3fdMTU5Ldz9Wv0SHqCPiORdNWVnTj1ELx17kEOt+IzAd8Cg22DXKXKVyX5uRx
	Hmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FWtsiIpTB7N7AUoSVZSre5vIrEAEOKwIg97RwYvKCSA=;
	b=XfzDjRMVB7xY/ky6SMjH0VHwv6cecGmYMm7VoBBXHDkPKzV9LUmmTzVbSYSSZ+Kpsn
	ELXqEFojZR57Ju6LPtO+2XbUWK8YCoqDMFQOUYIN8kUPOcxvYXHcs8kDBeLWI1VAuMT5
	DXnD+WCdzE0CpN50cYvjJh5teJAmx7wqTVlBSZIqxhV2GnsiUHC+YWF17WR7nNb+4/q7
	Jxaz4l+ofhZcje42HuJ/p2v/0JfNHeTPjq7gJieFgXj3qgodqJfSZ9kgBIkaCvtRmT1w
	TzA7xetEV4dmpw1TM4vFeD07jdoNsMQVkgISnloeQXZwYlrb3arUFjKofei/9Vp91GwX
	/eGQ==
X-Gm-Message-State: AJcUukc/2RUKIXgJQAoKeTnuOHQbGKFS+TSTs2qs+jMR1U8mRq6eNabf
	XgzP0IlEJfwJgAxqev9Pp+7FvQ1TSe4=
X-Google-Smtp-Source: ALg8bN5jVddfX4kr9nrgDc2Q2+bqTd/JzYhPJ0VyXkr8xmQO82IsOXLjZl4RbDXt7b4AM2Snr0cO7w==
X-Received: by 2002:a63:6704:: with SMTP id b4mr2887165pgc.100.1546980179707; 
	Tue, 08 Jan 2019 12:42:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	t5sm109789607pfb.60.2019.01.08.12.42.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 12:42:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 12:42:49 -0800
Message-Id: <20190108204249.8087-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190108204249.8087-1-raj.khem@gmail.com>
References: <20190108204249.8087-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 3/3] linux-libc-headers_4.19.bb: Backport patch to fix clockid_t in UAPI
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
X-List-Received-Date: Tue, 08 Jan 2019 20:42:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...kernel_clockid_t-in-uapi-net_stamp.h.patch | 49 +++++++++++++++++++
 .../linux-libc-headers_4.19.bb                |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch
new file mode 100644
index 0000000000..3684cc21bf
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch
@@ -0,0 +1,49 @@
+From e2c4cf7f98a519eb4d95532bfa06bcaf3562fed5 Mon Sep 17 00:00:00 2001
+From: Davide Caratti <dcaratti@redhat.com>
+Date: Mon, 17 Dec 2018 11:26:38 +0100
+Subject: [PATCH] net: Use __kernel_clockid_t in uapi net_stamp.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Herton reports the following error when building a userspace program that
+includes net_stamp.h:
+
+ In file included from foo.c:2:
+ /usr/include/linux/net_tstamp.h:158:2: error: unknown type name
+ ‘clockid_t’
+   clockid_t clockid; /* reference clockid */
+   ^~~~~~~~~
+
+Fix it by using __kernel_clockid_t in place of clockid_t.
+
+Fixes: 80b14dee2bea ("net: Add a new socket option for a future transmit time.")
+Cc: Timothy Redaelli <tredaelli@redhat.com>
+Reported-by: Herton R. Krzesinski <herton@redhat.com>
+Signed-off-by: Davide Caratti <dcaratti@redhat.com>
+Tested-by: Paolo Abeni <pabeni@redhat.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+---
+Upstream-Status: Backport [https://github.com/torvalds/linux/commit/e2c4cf7f98a519eb4d95532bfa06bcaf3562fed5]
+
+ include/uapi/linux/net_tstamp.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/uapi/linux/net_tstamp.h b/include/uapi/linux/net_tstamp.h
+index 97ff3c17ec4d..e5b39721c6e4 100644
+--- a/include/uapi/linux/net_tstamp.h
++++ b/include/uapi/linux/net_tstamp.h
+@@ -155,8 +155,8 @@ enum txtime_flags {
+ };
+ 
+ struct sock_txtime {
+-	clockid_t	clockid;	/* reference clockid */
+-	__u32		flags;		/* as defined by enum txtime_flags */
++	__kernel_clockid_t	clockid;/* reference clockid */
++	__u32			flags;	/* as defined by enum txtime_flags */
+ };
+ 
+ #endif /* _NET_TIMESTAMPING_H */
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
index 8fd427efef..48f25ebc1a 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
@@ -10,6 +10,7 @@ SRC_URI_append_libc-musl = "\
    "
 
 SRC_URI_append = "\
+    file://0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch \
     file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
     file://0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch \
-- 
2.20.1


