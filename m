Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1461DC982E8
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:29 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1706.1789682907540708641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MZlNNOwc;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso895385e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682906; x=1790287706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDnTLCfR8jUVeChMzhH25soy8TKlLpe/oTHCDfePfUk=;
        b=MZlNNOwcYCY2v40Hf1iYDoR5zO+5zXNfjhxxZX4nL+LVkhBfXUuG85lPlkPz5OCnhU
         NqAoIJmDE+7/EUwNWdm8OGe6UC1mvdlg8ytSi6QzeMwlgP42Hp+aX2oNWLVCiKqihIu9
         QS7yceliLtPFw6nCdL+3+js3cKfkWOvRTax08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682906; x=1790287706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDnTLCfR8jUVeChMzhH25soy8TKlLpe/oTHCDfePfUk=;
        b=bum0ncGkzVGSt4oBsQTXTLwDKaLpxxhecakHqMIFkkS+qEUAfmTlshVs/IeYuggGMZ
         9WRg+T18ZJZHm7vsaUb5QHUJyRRn12lduKutuI5aghBtVYteM/wJaXqfz5HRM/sr21Ot
         FQk1kLftvZi0Np7hkUWxdbvlMckjPjrWV+3x8DtmRY/Q6vvZ1x5nHa7dbzv3OWlplOLb
         oKPtwrlnIx+VVov40EAg937TJk4A+nwB7XaPGkKXHeamPypiFNguqwyw6O+bvYA7OAU5
         xQ2EkTDV56RxncOcgZuYGcLKxHkTwKX9l3Uol1hm+gDY8JLvg4whVW6NU7Azo3KYEu5Z
         ceag==
X-Gm-Message-State: AFuF++kCzTcvNN41+9A58H4sx27q0VVoHJkXXs3Twh4Wygpe3q/1nekt
	Bx7jsVqd1FkV2c3bms/1fZgyv8wDyRzPfEpIYbeCt95URZzZiZYihMyLrDJMLcYr0TZSBwt94Mh
	aGv2mfFo=
X-Gm-Gg: AYBFou3WM8PnEd7sgdOQAn7YHNYttAmrNnx/OsGy+9guu/3sJqORfh7KpOOPCZBHDoG
	rxSGu6Iv15uBBm/gKbOcdNBuP5mZIz/2Z7xvlMT3jdldjqJ7/wJhkaT3D90bWvrung2F9cLRdXW
	C5OGQbIEVuVUOa/YsZWKYByXjNUpShF24itrHH1eMj9N2jAuH53aF2aD7nIgN4l2VBs21Ctkb/e
	86o+aL5DMitqrmn1vxPbZQ0ZYtBmBoL3mU1wcjAHFVoSro1TKSi1rx6AGiM2uMW0xmXB9IE2qkm
	+q+GZavA6TFiOaab9JkejjIk325TXH1KvI9h8dC7snFCKQEppzHOxhFd5j6T+ZM41D5EGzXvORI
	hIk5JC2YlTf2j/uNVkyEAlRxD02KmKBL7MNMWrZkUFkh0Tjqhz3Bf3K043mb8cEtuzXlinN5bQR
	e2DY1QhhMKKfJ7kWrmZdiRWWbeBOwj3Btxzx2rJ03mf23XRM4Qfvtffik1hWVt+yZ8nLIZDa4Fd
	StQRgsC4YT+UjcvtWEf4uSvdqTAki231FFRBryvUlD9B87Wed/EZT1wbgkmpvLHyk+wraeH8yg=
X-Received: by 2002:a05:600c:6819:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49fc5728f8fmr3223925e9.19.1789682905822;
        Thu, 17 Sep 2026 15:08:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 67/79] libpcap: Fix CVE-2026-18313
Date: Fri, 18 Sep 2026 00:06:52 +0200
Message-ID: <42cbcfa507c1ecc140d2c9a62af48ab47385279d.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246162

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-18313
Upstream-commit: https://github.com/the-tcpdump-group/libpcap/commit/f9775af1a0ec76db60c7213241e6b48f1be10ac7
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcap/libpcap/06-CVE-2026-18313.patch   | 90 +++++++++++++++++++
 .../libpcap/libpcap_1.10.6.bb                 |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
new file mode 100644
index 00000000000..eae9aaa989b
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
@@ -0,0 +1,90 @@
+From b039b8b66616852673c21ec5c7e0bad3190eae59 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/the-tcpdump-group/libpcap/commit/f9775af1a0ec76db60c7213241e6b48f1be10ac7]
+CVE: CVE-2026-18313
+
+Notes on backporting to 1.10.6:
+ - The upstream commit was made after the "bogus instructions" -> "invalid
+   instructions" message change (commit 836d0fd0), which is not backported.
+   The 1.10.6 wording ("The filter contains bogus instructions") is therefore
+   kept; only the memory-leak fix (goto free_and_return_status / free()) is
+   applied.
+ - The upstream CHANGES/changelog hunk is not backported.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+diff --git a/rpcapd/daemon.c b/rpcapd/daemon.c
+index 87274665..b720cc45 100644
+--- a/rpcapd/daemon.c
++++ b/rpcapd/daemon.c
+@@ -2380,14 +2380,8 @@ daemon_unpackapplyfilter(PCAP_SOCKET sockctrl, SSL *ctrl_ssl, struct session *se
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
+@@ -2403,16 +2397,19 @@ daemon_unpackapplyfilter(PCAP_SOCKET sockctrl, SSL *ctrl_ssl, struct session *se
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
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
index 6ca75117e17..859897acc56 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://03-CVE-2026-31911.patch \
 	   file://04-CVE-2026-6244.patch \
 	   file://05-CVE-2026-6554.patch \
+	   file://06-CVE-2026-18313.patch \
           "
 SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
 

