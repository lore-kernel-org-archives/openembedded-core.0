Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0E1C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:38 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.11005.1645452877911768538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RvviukV8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id b8so15362112pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zsIruU171ObGgwXOgg2EzDBvlx4u/DcZugNn0Uxz4ak=;
        b=RvviukV8pT1eQ+8iIUrH8gXA+G6dH0Valdcie1ANQSf66B85d4n/NcRaZWNXkNSt1q
         19NVbVfIGKYwXIon/vfa/9JDGrD9vPT0qPDRoyhC6bRDtvL1yYe/8M7N9NjnM3aUKuWI
         OtI/BzJx4tEQGzU2kOW7mpYeTQDoKmqRRB3CfN3VDO6em8LcZAOqQLdtcXwpHNVh7ZtK
         28Ub/tL0B5jiY1i8HpOiXrWGCwNfH+xM8vNw5ETz0+udL8jqypQ/KIA4Fg+KiRYxe2G9
         EBwalAoMtvRldtVbOs69Ii3jf48OdkqKJ+w4wGj0jDg6MFJsg7myagtcdBlmEFFNC+6w
         CXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zsIruU171ObGgwXOgg2EzDBvlx4u/DcZugNn0Uxz4ak=;
        b=csVgv6SWM6do9+tj2062fNg86G8iusW67MNSpiY6fCNEs0qz6u86kSxMfUn42CRFin
         Q95CfZqpsjiHEag/pruyWdbr0zjkff2Jpbk/Y1poT/+a5SCqNDqBpiCXP6VRkTI4pRxV
         J7cuhf+WH80PZdWkn2lSjMKptclXdY7D5Q17KSBQ6zEECZ8rL8pEJI9b4NVXpQ4E7jLs
         4HrtnLtDupKnjgb4NzIPeM8bAPP9OdwZj5njEDNFzAgIOWs+lyMGTvfmY+o0QsVX+CnQ
         pjKgfr4TX/QlEtwrgTN0qgjHozi0ERT1ha/Ise2R7aKz6pExQUYup18v4Wh1crNgQxXH
         s5bw==
X-Gm-Message-State: AOAM531e1kLgtA+rDd3QMgjcNjQXTHU4b9Dj4SvMscYFIUPyLtFSMomf
	MPQYXDObdAi8YOzBTA7zjkRK45NwhivhZBTQ
X-Google-Smtp-Source: 
 ABdhPJytJSi7UVphlH3kpw8Z4a71YG2PHOqWB37PMFPH4Ef11zloblnlHDccrRYwzqCOszuPaRsAwQ==
X-Received: by 2002:a17:902:9b90:b0:14d:4c30:a66b with SMTP id
 y16-20020a1709029b9000b0014d4c30a66bmr18830697plp.22.1645452876929;
        Mon, 21 Feb 2022 06:14:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/20] connman: fix CVE-2022-23096-7
Date: Mon, 21 Feb 2022 04:14:00 -1000
Message-Id: 
 <b8d925c1443c84500df74958aa2f75113b992453.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162030

An issue was discovered in the DNS proxy in Connman through 1.40.
The TCP server reply implementation lacks a check for the presence
of sufficient Header Data, leading to an out-of-bounds read (CVE-2022-23096)

An issue was discovered in the DNS proxy in Connman through 1.40.
forward_dns_reply mishandles a strnlen call, leading to an out-of-bounds
read (CVE-2022-23097)

Backport patch from:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=e5a313736e13c90d19085e953a26256a198e4950

CVE: CVE-2022-23096 CVE-2022-23097

Signed-off-by: Steve Sakoman
---
 .../connman/connman/CVE-2022-23096-7.patch    | 121 ++++++++++++++++++
 .../connman/connman_1.37.bb                   |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-23096-7.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-23096-7.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-23096-7.patch
new file mode 100644
index 0000000000..7f27474830
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-23096-7.patch
@@ -0,0 +1,121 @@
+From e5a313736e13c90d19085e953a26256a198e4950 Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <wagi@monom.org>
+Date: Tue, 25 Jan 2022 10:00:24 +0100
+Subject: dnsproxy: Validate input data before using them
+
+dnsproxy is not validating various input data. Add a bunch of checks.
+
+Fixes: CVE-2022-23097
+Fixes: CVE-2022-23096
+
+Upstream-Status: Backport
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=e5a313736e13c90d19085e953a26256a198e4950
+
+CVE: CVE-2022-23096 CVE-2022-23097
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ src/dnsproxy.c | 31 ++++++++++++++++++++++++++-----
+ 1 file changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index cdfafbc2..c027bcb9 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1951,6 +1951,12 @@ static int forward_dns_reply(unsigned char *reply, int reply_len, int protocol,
+ 
+ 	if (offset < 0)
+ 		return offset;
++	if (reply_len < 0)
++		return -EINVAL;
++	if (reply_len < offset + 1)
++		return -EINVAL;
++	if ((size_t)reply_len < sizeof(struct domain_hdr))
++		return -EINVAL;
+ 
+ 	hdr = (void *)(reply + offset);
+ 	dns_id = reply[offset] | reply[offset + 1] << 8;
+@@ -1986,23 +1992,31 @@ static int forward_dns_reply(unsigned char *reply, int reply_len, int protocol,
+ 		 */
+ 		if (req->append_domain && ntohs(hdr->qdcount) == 1) {
+ 			uint16_t domain_len = 0;
+-			uint16_t header_len;
++			uint16_t header_len, payload_len;
+ 			uint16_t dns_type, dns_class;
+ 			uint8_t host_len, dns_type_pos;
+ 			char uncompressed[NS_MAXDNAME], *uptr;
+ 			char *ptr, *eom = (char *)reply + reply_len;
++			char *domain;
+ 
+ 			/*
+ 			 * ptr points to the first char of the hostname.
+ 			 * ->hostname.domain.net
+ 			 */
+ 			header_len = offset + sizeof(struct domain_hdr);
++			if (reply_len < header_len)
++				return -EINVAL;
++			payload_len = reply_len - header_len;
++
+ 			ptr = (char *)reply + header_len;
+ 
+ 			host_len = *ptr;
++			domain = ptr + 1 + host_len;
++			if (domain > eom)
++				return -EINVAL;
++
+ 			if (host_len > 0)
+-				domain_len = strnlen(ptr + 1 + host_len,
+-						reply_len - header_len);
++				domain_len = strnlen(domain, eom - domain);
+ 
+ 			/*
+ 			 * If the query type is anything other than A or AAAA,
+@@ -2011,6 +2025,8 @@ static int forward_dns_reply(unsigned char *reply, int reply_len, int protocol,
+ 			 */
+ 			dns_type_pos = host_len + 1 + domain_len + 1;
+ 
++			if (ptr + (dns_type_pos + 3) > eom)
++				return -EINVAL;
+ 			dns_type = ptr[dns_type_pos] << 8 |
+ 							ptr[dns_type_pos + 1];
+ 			dns_class = ptr[dns_type_pos + 2] << 8 |
+@@ -2040,6 +2056,8 @@ static int forward_dns_reply(unsigned char *reply, int reply_len, int protocol,
+ 				int new_len, fixed_len;
+ 				char *answers;
+ 
++				if (len > payload_len)
++					return -EINVAL;
+ 				/*
+ 				 * First copy host (without domain name) into
+ 				 * tmp buffer.
+@@ -2054,6 +2072,8 @@ static int forward_dns_reply(unsigned char *reply, int reply_len, int protocol,
+ 				 * Copy type and class fields of the question.
+ 				 */
+ 				ptr += len + domain_len + 1;
++				if (ptr + NS_QFIXEDSZ > eom)
++					return -EINVAL;
+ 				memcpy(uptr, ptr, NS_QFIXEDSZ);
+ 
+ 				/*
+@@ -2063,6 +2083,8 @@ static int forward_dns_reply(unsigned char *reply, int reply_len, int protocol,
+ 				uptr += NS_QFIXEDSZ;
+ 				answers = uptr;
+ 				fixed_len = answers - uncompressed;
++				if (ptr + offset > eom)
++					return -EINVAL;
+ 
+ 				/*
+ 				 * We then uncompress the result to buffer
+@@ -2257,8 +2279,7 @@ static gboolean udp_server_event(GIOChannel *channel, GIOCondition condition,
+ 
+ 	len = recv(sk, buf, sizeof(buf), 0);
+ 
+-	if (len >= 12)
+-		forward_dns_reply(buf, len, IPPROTO_UDP, data);
++	forward_dns_reply(buf, len, IPPROTO_UDP, data);
+ 
+ 	return TRUE;
+ }
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index bdab4c4f18..e3ea3cd065 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -9,6 +9,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://CVE-2021-26675.patch \
             file://CVE-2021-26676-0001.patch \
             file://CVE-2021-26676-0002.patch \
+            file://CVE-2022-23096-7.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1


