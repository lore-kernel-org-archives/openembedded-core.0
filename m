Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B27BCC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32452.1792040656060358100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MngprPur;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so30091615e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040654; x=1792645454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=51K8GYXHEZ40M1ytDhdNb3Guo28JsMvpTXf+8AZ9wJQ=;
        b=MngprPurNS7EF2Yt5a5b/7FeQ242mf33+HklJlA21nUz32vw9HkB1gCHfaKNvGCGf/
         CiKxlRfbbq4hULlMEIpZ1ptFc4AYA2eMR+tA2YylRkqSrS5WMwVV64jEZ4fDk+BTkssm
         rsBsjY5aKr4OobndmSmUaoj/rH1TJWDeCyQBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040654; x=1792645454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=51K8GYXHEZ40M1ytDhdNb3Guo28JsMvpTXf+8AZ9wJQ=;
        b=DYW+Wkw8czAKVSmfzqQ+METXMC7R0GZUzqt7nAi/1ap/Cfy3qRLcpHGv8idsZ+Dcio
         6BNNc7UyF7TAGDmHD2O4GWqh2ACfSP8GoqsOgIarLFXrv6VZWbX9NrAiyRIuRLWZnvaa
         d2w+JnavQb9FJJroatTB0vDAtWhIGcGdjyih/JnQUW+kVPK/Q6G9HQ1+L8PLV6WXK2Dp
         /vnQinZ26Aw/o3M/230vxJANBRUYmENHjWj95kU2mKeWQwrjEKCcxWxvHmOVMi5YO1ps
         is/2y1wTccqr1kzMLEiOR8pS4INBeFF2PesI5UoNaXmA3EcOU5jqVw1HwZ6qhL6wc2qj
         n23w==
X-Gm-Message-State: AFq9FYLRr7OgFNRe8ZbN/YuTx7Upkj8ILUB80bBgE49oyWXDo1MxA3Bn
	HEIYzjnXZmhV2D0hy7ikQaIvQhKA/UDg69yDFr9qkNu7ABeJrM+Cyz0ddPwtQX+oLY8WmBt+Ttx
	Dg/l/z3g=
X-Gm-Gg: AYBFou2cEdkVTqAE7dIPS7+i2U+KwKCPS9dkcda6ZWvrDTakjJHkcNRw7rtNlHmdm49
	RX9X3f60eVqQc4mJzdaeCNY7tmJUCeHfwr9ZUhEGVra21tiEkCr6/lOUPZYVoDE51g2AN8ffdcp
	OokdUGOoQOyHwg8CFiSQEzO4cCzdisGKOoEeKMGYItzFlczuDg0sfM5br8SDW7lbyf08L01Ncxi
	8FnWrLCbnQisZmZDaqskMqjd6VJbY4hwSG6o9lSm71u7n1UrlE+t6s3uWsokJHtBYfZcWAEQAID
	KBuOZOm7PM4cCjj4xbjfuTeNHEkljcdDg4M+r98FaO2bl/WjN/jTM6BUXeDk7+OJEgFGwUddgpq
	GvHAGVCbDJDxtBfSE/ngYbhnsy/eYVzDVF8VE+x83KGWtnqH5w7WibHVU1kX3PpBFsrp4ZZiwTC
	z33VWPzZbEBcnGuWvpSaEwqIhrF5VHiNYtJJ94I0Lx8ahZUUEj0RfbIwbAQRyUrphkZkxOZp4C6
	agPYvALUyO7SY1o4eHZHUo0FjeyrC752fK5F5uad2RjQwIWH01sJGcO7x2f5Adf0sjOXub6eFBg
	4BTvUqW+
X-Received: by 2002:a05:600c:34d4:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a18e4d67d6mr341417235e9.32.1792040654280;
        Wed, 14 Oct 2026 22:04:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.04.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:04:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 51/55] libpcap: Fix CVE-2026-18313
Date: Thu, 15 Oct 2026 07:03:14 +0200
Message-ID: <6cdcaaf4c347a32d5408653f8eb343c8e4fb04ff.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247849

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18313
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/f9775af1a0ec76db60c7213241e6b48f1be10ac7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/06-CVE-2026-18313.patch   | 84 +++++++++++++++++++
 .../libpcap/libpcap_1.10.4.bb                 |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
new file mode 100644
index 00000000000..2a9df12e2aa
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
@@ -0,0 +1,84 @@
+From f9775af1a0ec76db60c7213241e6b48f1be10ac7 Mon Sep 17 00:00:00 2001
+From: Denis Ovsienko <denis@ovsienko.info>
+Date: Sat, 1 Aug 2026 18:24:48 +0100
+Subject: [PATCH] CVE-2026-18313: Fix a memory leak in rpcapd.
+
+This vulnerability was originally reported publicly, hence no credit is
+given.
+
+daemon_unpackapplyfilter() can allocate a temporary buffer for up to
+RPCAP_BPF_MAXINSNS (8192) BPF instructions (65536 bytes) per each
+received RPCAP_MSG_UPDATEFILTER_REQ or RPCAP_MSG_STARTCAP_REQ message.
+It never frees the memory, so repeated messages from a client will
+eventually leak enough memory on the server to cause problems.  This
+holds for all connections that pass the validation and some connections
+that do not.
+
+48 bytes in 1 blocks are definitely lost in loss record 2 of 2
+   at 0x4844818: malloc (vg_replace_malloc.c:446)
+   by 0x111AAB: daemon_unpackapplyfilter (daemon.c:2372)
+   by 0x113279: daemon_msg_startcap_req.constprop.0 (daemon.c:2139)
+   by 0x114808: daemon_serviceloop (daemon.c:901)
+   by 0x115BC7: accept_connection (rpcapd.c:1321)
+   by 0x115BC7: accept_connections (rpcapd.c:1118)
+   by 0x115BC7: main_startup (rpcapd.c:709)
+   by 0x1112BD: main (rpcapd.c:567)
+
+To fix this, after a successful malloc() return exactly once, after the
+free() call.
+
+(backported from commit 26a1c75702b105ac8788014f35f1b5c57fa6043b)
+
+(cherry picked from commit f9775af1a0ec76db60c7213241e6b48f1be10ac7)
+
+Notes on backporting to 1.10.4:
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/f9775af1a0ec76db60c7213241e6b48f1be10ac7]
+CVE: CVE-2026-18313
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
+index 9b0f8285..b0268688 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2378,14 +2378,8 @@ daemon_unpackapplyfilter(SOCKET sockctrl, SSL *ctrl_ssl, struct session *session
+ 	{
+ 		status = rpcapd_recv(sockctrl, ctrl_ssl, (char *) &insn,
+ 		    sizeof(struct rpcap_filterbpf_insn), plenp, errmsgbuf);
+-		if (status == -1)
+-		{
+-			return -1;
+-		}
+-		if (status == -2)
+-		{
+-			return -2;
+-		}
++		if (status == -1 || status == -2)
++			goto free_and_return_status;
+ 
+ 		bf_insn->code = ntohs(insn.code);
+ 		bf_insn->jf = insn.jf;
+@@ -2401,16 +2395,19 @@ daemon_unpackapplyfilter(SOCKET sockctrl, SSL *ctrl_ssl, struct session *session
+ 	if (bpf_validate(bf_prog.bf_insns, bf_prog.bf_len) == 0)
+ 	{
+ 		snprintf(errmsgbuf, PCAP_ERRBUF_SIZE, "The filter contains bogus instructions");
+-		return -2;
++		status = -2;
++		goto free_and_return_status;
+ 	}
+ 
+ 	if (pcap_setfilter(session->fp, &bf_prog))
+ 	{
+ 		snprintf(errmsgbuf, PCAP_ERRBUF_SIZE, "RPCAP error: %s", pcap_geterr(session->fp));
+-		return -2;
++		status = -2;
+ 	}
+ 
+-	return 0;
++free_and_return_status:
++	free(bf_prog.bf_insns);
++	return status;
+ }
+ 
+ static int
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
index f7ba1bf3eac..5f1506f8fc9 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
            file://03-CVE-2026-31911.patch \
            file://04-CVE-2026-6244.patch \
            file://05-CVE-2026-6554.patch \
+           file://06-CVE-2026-18313.patch \
           "
 
 SRC_URI[sha256sum] = "ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f"

