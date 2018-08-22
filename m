Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id C517779368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:42 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id q11-v6so3109377oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1eDJhNHwgB2M4Clbon9iXTrvVX2RJWcRcInDv15dvwo=;
	b=0kJKOL5Apy/A1KW9414q7vjQMdUPSombC4Y7iZ5ugP4PSyvapGSFitFBCkzaaWDrYm
	S7v0gphPiBf0WLQvxIRMT0q4hmex9Ao7wTAVB2OKiFq3jfhEymjD7XxhgUrSRTOmA5Cn
	VuHpO2xl6mlJc3bHAOPhore6YhmoBXWFNLAdc94o6aWaABv+WbkJCQhEaAHET0xj9TWQ
	lG64zmgvlL8gPcMGFK48NGUrkiKDkwQhks+J+lJ6CIGwIb5awLj0s1wNtbPuoEuZiN//
	yfGNcAwKzgtGLc6wu5xgXc6tEsdIa7sDbL0jRSJJYmZYoBwd6xn4+210F9Dmsdc2chGC
	/2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1eDJhNHwgB2M4Clbon9iXTrvVX2RJWcRcInDv15dvwo=;
	b=j3Vek3m4GImTQyyTcYm8dwOHAY6oU8BBC+TkLlZ6UiWjvNdbaTtcFE/ii69ji3mS0i
	rdIJ5NYZ9Xh7aI/VyPlHtyDXGB8PF2zrX6MNHlsFPcjTQ3R6dYHlqGNXLylmdll0G6st
	dsySTuQDxZzMaaWq3sPkZV3kvuqcZf/WsiR/QjpuKrOOLxtEwU541stbtBXs4i8Yhgcc
	RW7/TYRaW58+SUqkd203W/6NCb/c+6PY1HcirPIpJZZuYyie+jnYrg0bBegyYIXusQoU
	IqeqJkdU+RmACP8go2OStxvXSvWnR6ZbYcyZVOD1zboLkgB77SWzC/OCqlAHY2Tbq+P/
	SEjA==
X-Gm-Message-State: APzg51C4QFzcSfYtG2HrkpGbPIe4jm6uh4UZ2jRLcmk7GbLH7YtNzLJ8
	yFyZH9OYve8779AoyK5icj3JdhE85xY=
X-Google-Smtp-Source: ANB0VdbT97ujyvEc84nHF4ZhktfyO+tOsKhW77f5+X/esWqFYMtodkXjr6bmDaChtHpGoOiZvbl37g==
X-Received: by 2002:aca:cd41:: with SMTP id
	d62-v6mr4181394oig.207.1534945003701; 
	Wed, 22 Aug 2018 06:36:43 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:43 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:23 +0530
Message-Id: <1534944940-21566-17-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 17/34] qemu: CVE-2017-15119
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:42 -0000

nbd/server: CVE-2017-15119 Reject options larger than 32M

The NBD spec gives us permission to abruptly disconnect on clients
that send outrageously large option requests, rather than having
to spend the time reading to the end of the option.  No real
option request requires that much data anyways; and meanwhile, we
already have the practice of abruptly dropping the connection on
any client that sends NBD_CMD_WRITE with a payload larger than 32M.

For comparison, nbdkit drops the connection on any request with
more than 4096 bytes; however, that limit is probably too low
(as the NBD spec states an export name can theoretically be up
to 4096 bytes, which means a valid NBD_OPT_INFO could be even
longer) - even if qemu doesn't permit exports longer than 256
bytes.

It could be argued that a malicious client trying to get us to
read nearly 4G of data on a bad request is a form of denial of
service.  In particular, if the server requires TLS, but a client
that does not know the TLS credentials sends any option (other
than NBD_OPT_STARTTLS or NBD_OPT_EXPORT_NAME) with a stated
payload of nearly 4G, then the server was keeping the connection
alive trying to read all the payload, tying up resources that it
would rather be spending on a client that can get past the TLS
handshake.  Hence, this warranted a CVE.

Present since at least 2.5 when handling known options, and made
worse in 2.6 when fixing support for NBD_FLAG_C_FIXED_NEWSTYLE
to handle unknown options.

Affects qemu < 2.11

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../qemu/qemu/CVE-2017-15119.patch                 | 63 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-15119.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-15119.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-15119.patch
new file mode 100644
index 0000000..10da519
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2017-15119.patch
@@ -0,0 +1,63 @@
+From fdad35ef6c5839d50dfc14073364ac893afebc30 Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Wed, 22 Nov 2017 16:25:16 -0600
+Subject: [PATCH] nbd/server: CVE-2017-15119 Reject options larger than 32M
+
+The NBD spec gives us permission to abruptly disconnect on clients
+that send outrageously large option requests, rather than having
+to spend the time reading to the end of the option.  No real
+option request requires that much data anyways; and meanwhile, we
+already have the practice of abruptly dropping the connection on
+any client that sends NBD_CMD_WRITE with a payload larger than 32M.
+
+For comparison, nbdkit drops the connection on any request with
+more than 4096 bytes; however, that limit is probably too low
+(as the NBD spec states an export name can theoretically be up
+to 4096 bytes, which means a valid NBD_OPT_INFO could be even
+longer) - even if qemu doesn't permit exports longer than 256
+bytes.
+
+It could be argued that a malicious client trying to get us to
+read nearly 4G of data on a bad request is a form of denial of
+service.  In particular, if the server requires TLS, but a client
+that does not know the TLS credentials sends any option (other
+than NBD_OPT_STARTTLS or NBD_OPT_EXPORT_NAME) with a stated
+payload of nearly 4G, then the server was keeping the connection
+alive trying to read all the payload, tying up resources that it
+would rather be spending on a client that can get past the TLS
+handshake.  Hence, this warranted a CVE.
+
+Present since at least 2.5 when handling known options, and made
+worse in 2.6 when fixing support for NBD_FLAG_C_FIXED_NEWSTYLE
+to handle unknown options.
+
+CC: qemu-stable@nongnu.org
+CVE: CVE-2017-15119
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=fdad35ef6c5839d50dfc14073364ac893afebc30]
+
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ nbd/server.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/nbd/server.c b/nbd/server.c
+index 7d6801b427..a81801e3bc 100644
+--- a/nbd/server.c
++++ b/nbd/server.c
+@@ -673,6 +673,12 @@ static int nbd_negotiate_options(NBDClient *client, uint16_t myflags,
+         }
+         length = be32_to_cpu(length);
+ 
++        if (length > NBD_MAX_BUFFER_SIZE) {
++            error_setg(errp, "len (%" PRIu32" ) is larger than max len (%u)",
++                       length, NBD_MAX_BUFFER_SIZE);
++            return -EINVAL;
++        }
++
+         trace_nbd_negotiate_options_check_option(option,
+                                                  nbd_opt_lookup(option));
+         if (client->tlscreds &&
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index 89c68f2..a3cfb7c 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://ppc_locking.patch \
            file://memfd.patch \
            file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
+           file://CVE-2017-15119.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


