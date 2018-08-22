Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90FA17943C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:38 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id y207-v6so3661488oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1eDJhNHwgB2M4Clbon9iXTrvVX2RJWcRcInDv15dvwo=;
	b=X983ez5AHey2VY4IOwcnZe8drFYXQrEor2lJr3MdPYGYcqM0RwUoMicFm+8lR+OXe9
	tWhYa/G7N/v2p2+SKxixzMiw3Da/fZX1toyHKzY3j/MTggP5zq20vGGcHUm1Kbm5X9BX
	K98R3VrATQJVGubWoWyFgJ5g1QOLMYSSJqZPDvg2OeHH49SBnuwOtpHbLAajq3cIxJFu
	ukmFt9AMi6ThwuOLupg8RQHUvysF5+Ylp1Xh7FoaoycfD25tWWuKpnzSvruMplt3DwvO
	YsdxkM+fRCb6Vt7ZCfqatG5UpyBLoQ+/4tbGKCcB8X5FjIqyA9CJSK8U6PkmkC2czyHf
	v9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1eDJhNHwgB2M4Clbon9iXTrvVX2RJWcRcInDv15dvwo=;
	b=JloMP4JyxnyWdtui+RPWMPm6HUwDPO6OWEOHBHC4KWMxxbcJL/I12MG2FEEVUEAzdl
	PhPYgI94Lj/GFTeHkwd5hqEqqvAR5qRzhTxrqZUaWNTqV0XHEqANEW/FXO2CtMfw+2fT
	rzThk9/ad7xI/va0TMOAQZA0nGg1iiFDIFKgOvGEsfAVWAfNOIisW2iAHKQoz0DHmz77
	NGDZQU8q+VkBuOGHbM0qR/0tMuT2db6+5qrTT6VPGI+ZsI4H04hneO/awRQO0KKL3YBl
	fHzk9sK7oSWixEFJsxx1Fx5arAKsbO/KcB1ZWJbAzeMuj2as7E9zj+x14AtsXLNzNcS1
	ePVg==
X-Gm-Message-State: APzg51DyzKSbxli4AnppVUqb28a3lrP0DgBb4z+ZLjskBSXb3TZNWGMn
	PAHT3B6bBMtaPq38q1FRo2PHCiTP5eI=
X-Google-Smtp-Source: ANB0VdatLjvP4XiNWpYxrGiultHBhdWsb+LxpYuq9HZiTIdur5OhZ0Fld94mDuA3i4ndwVCbfV09LA==
X-Received: by 2002:aca:3357:: with SMTP id
	z84-v6mr4063292oiz.49.1534950579066; 
	Wed, 22 Aug 2018 08:09:39 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:38 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:35 +0530
Message-Id: <1534950532-23850-17-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 17/34] qemu: CVE-2017-15119
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:38 -0000

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


