Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B69C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.4536.1661294159398691391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yRRM1+tN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id u22so14059972plq.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=YEE2LcN1ibZs1NflvORtO2xbJje8+LYawaWXOOYgaO0=;
        b=yRRM1+tNKVGroNE/Jq4uV/+92E60sw4ffQl3qozLKuAiFR6qp64bn8DReyy8u1wM57
         MSJqGwHWCZdLDf5CsQfp1KO2QC1eUH2pLhBN/fsfFm1IO10s0czxou0s24EHjcf1guzC
         bWr2sbpxIHzw++TL1wGivtEGjorx8ts+aEbb6CVQ09za+EbqosQ87vtUjC/mepC6AGJy
         S720i2uQhjjErZtX80wzpJkmBR+wquoMii2llvuoAYHFvKvXIVcFDicfhnsrV/wEZBwU
         OMJZ8f9CoUIdYaK0RWF3DWBXeEs6TYvl2t7nm32mUJf+GEoeAjWEpvoV1BVcaQCR99k0
         RYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=YEE2LcN1ibZs1NflvORtO2xbJje8+LYawaWXOOYgaO0=;
        b=5ooQ4tOYGMY92nXmxD5o/MK+Zng3xNp6ozY8GDX9KFJ7K4hv167PBDf47KwyBQoioQ
         P4lx1BA0Xess9OximELTCY0sRqAHTMbr57gnNY+1AnNTip8Q95HqUnS/yIZBYtnIxDXP
         +ZpkRqJZTtmEMW7tX0wSxjyVtAcuxYrpTGLZOg+nw4XH71+3rDzyfr9pmEYVrP6veFAA
         f6qT6Ia8G68JsSrG51Y/raR02iyLa+Bzmr++BIp4Unv+YkCMg4c6zIcgG6HbbcxDb3IP
         Yu8RKs82zgJe5uIlhBPRM2V2EReqIpa/9c45VE5PRmCByuIDO9qK+zm8pidxqzZoVzIL
         jFqg==
X-Gm-Message-State: ACgBeo3cs0GgvRum218IT1UohMiZaZz/7jnMIA7zVwO7QoGRcK3Lfw5A
	/JsjMHEKuGF8lu4tWiibAFL8hq1p3ROAV8/3
X-Google-Smtp-Source: 
 AA6agR58JIAngQxzpz0b15DgQCOIGGEEzqjccsVKBX+jGiI0lGg+qnbEPAHAlcD2f+Lfe1tAX4RcMQ==
X-Received: by 2002:a17:902:8643:b0:172:e067:d7ac with SMTP id
 y3-20020a170902864300b00172e067d7acmr13377425plt.164.1661294158215;
        Tue, 23 Aug 2022 15:35:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.35.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:35:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/28] u-boot: fix CVE-2022-30552
Date: Tue, 23 Aug 2022 12:35:16 -1000
Message-Id: 
 <db5212cbe7537036108682f0f3a9316ca3c06fc1.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169736

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to fix CVE-2022-30552.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-minimum-IP-fragmented-datagram-siz.patch | 207 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch b/meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch
new file mode 100644
index 0000000000..3f9cc7776b
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch
@@ -0,0 +1,207 @@
+From c7cab39de5e4b22620248a190b3d2ee46cff38c2 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Thu, 26 May 2022 11:14:37 -0300
+Subject: [PATCH] net: Check for the minimum IP fragmented datagram size
+
+Nicolas Bidron and Nicolas Guigo reported the two bugs below:
+
+"
+----------BUG 1----------
+
+In compiled versions of U-Boot that define CONFIG_IP_DEFRAG, a value of
+`ip->ip_len` (IP packet header's Total Length) higher than `IP_HDR_SIZE`
+and strictly lower than `IP_HDR_SIZE+8` will lead to a value for `len`
+comprised between `0` and `7`. This will ultimately result in a
+truncated division by `8` resulting value of `0` forcing the hole
+metadata and fragment to point to the same location. The subsequent
+memcopy will overwrite the hole metadata with the fragment data. Through
+a second fragment, this can be exploited to write to an arbitrary offset
+controlled by that overwritten hole metadata value.
+
+This bug is only exploitable locally as it requires crafting two packets
+the first of which would most likely be dropped through routing due to
+its unexpectedly low Total Length. However, this bug can potentially be
+exploited to root linux based embedded devices locally.
+
+```C
+static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+{
+     static uchar pkt_buff[IP_PKTSIZE] __aligned(PKTALIGN);
+     static u16 first_hole, total_len;
+     struct hole *payload, *thisfrag, *h, *newh;
+     struct ip_udp_hdr *localip = (struct ip_udp_hdr *)pkt_buff;
+     uchar *indata = (uchar *)ip;
+     int offset8, start, len, done = 0;
+     u16 ip_off = ntohs(ip->ip_off);
+
+     /* payload starts after IP header, this fragment is in there */
+     payload = (struct hole *)(pkt_buff + IP_HDR_SIZE);
+     offset8 =  (ip_off & IP_OFFS);
+     thisfrag = payload + offset8;
+     start = offset8 * 8;
+     len = ntohs(ip->ip_len) - IP_HDR_SIZE;
+```
+
+The last line of the previous excerpt from `u-boot/net/net.c` shows how
+the attacker can control the value of `len` to be strictly lower than
+`8` by issuing a packet with `ip_len` between `21` and `27`
+(`IP_HDR_SIZE` has a value of `20`).
+
+Also note that `offset8` here is `0` which leads to `thisfrag = payload`.
+
+```C
+     } else if (h >= thisfrag) {
+         /* overlaps with initial part of the hole: move this hole */
+         newh = thisfrag + (len / 8);
+         *newh = *h;
+         h = newh;
+         if (h->next_hole)
+             payload[h->next_hole].prev_hole = (h - payload);
+         if (h->prev_hole)
+             payload[h->prev_hole].next_hole = (h - payload);
+         else
+             first_hole = (h - payload);
+
+     } else {
+```
+
+Lower down the same function, execution reaches the above code path.
+Here, `len / 8` evaluates to `0` leading to `newh = thisfrag`. Also note
+that `first_hole` here is `0` since `h` and `payload` point to the same
+location.
+
+```C
+     /* finally copy this fragment and possibly return whole packet */
+     memcpy((uchar *)thisfrag, indata + IP_HDR_SIZE, len);
+```
+
+Finally, in the above excerpt the `memcpy` overwrites the hole metadata
+since `thisfrag` and `h` both point to the same location. The hole
+metadata is effectively overwritten with arbitrary data from the
+fragmented IP packet data. If `len` was crafted to be `6`, `last_byte`,
+`next_hole`, and `prev_hole` of the `first_hole` can be controlled by
+the attacker.
+
+Finally the arbitrary offset write occurs through a second fragment that
+only needs to be crafted to write data in the hole pointed to by the
+previously controlled hole metadata (`next_hole`) from the first packet.
+
+ ### Recommendation
+
+Handle cases where `len` is strictly lower than 8 by preventing the
+overwrite of the hole metadata during the memcpy of the fragment. This
+could be achieved by either:
+* Moving the location where the hole metadata is stored when `len` is
+lower than `8`.
+* Or outright rejecting fragmented IP datagram with a Total Length
+(`ip_len`) lower than 28 bytes which is the minimum valid fragmented IP
+datagram size (as defined as the minimum fragment of 8 octets in the IP
+Specification Document:
+[RFC791](https://datatracker.ietf.org/doc/html/rfc791) page 25).
+
+----------BUG 2----------
+
+In compiled versions of U-Boot that define CONFIG_IP_DEFRAG, a value of
+`ip->ip_len` (IP packet header's Total Length) lower than `IP_HDR_SIZE`
+will lead to a negative value for `len` which will ultimately result in
+a buffer overflow during the subsequent `memcpy` that uses `len` as it's
+`count` parameter.
+
+This bug is only exploitable on local ethernet as it requires crafting
+an invalid packet to include an unexpected `ip_len` value in the IP UDP
+header that's lower than the minimum accepted Total Length of a packet
+(21 as defined in the IP Specification Document:
+[RFC791](https://datatracker.ietf.org/doc/html/rfc791)). Such packet
+would in all likelihood be dropped while being routed to its final
+destination through most routing equipment and as such requires the
+attacker to be in a local position in order to be exploited.
+
+```C
+static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+{
+     static uchar pkt_buff[IP_PKTSIZE] __aligned(PKTALIGN);
+     static u16 first_hole, total_len;
+     struct hole *payload, *thisfrag, *h, *newh;
+     struct ip_udp_hdr *localip = (struct ip_udp_hdr *)pkt_buff;
+     uchar *indata = (uchar *)ip;
+     int offset8, start, len, done = 0;
+     u16 ip_off = ntohs(ip->ip_off);
+
+     /* payload starts after IP header, this fragment is in there */
+     payload = (struct hole *)(pkt_buff + IP_HDR_SIZE);
+     offset8 =  (ip_off & IP_OFFS);
+     thisfrag = payload + offset8;
+     start = offset8 * 8;
+     len = ntohs(ip->ip_len) - IP_HDR_SIZE;
+```
+
+The last line of the previous excerpt from `u-boot/net/net.c` shows
+where the underflow to a negative `len` value occurs if `ip_len` is set
+to a value strictly lower than 20 (`IP_HDR_SIZE` being 20). Also note
+that in the above excerpt the `pkt_buff` buffer has a size of
+`CONFIG_NET_MAXDEFRAG` which defaults to 16 KB but can range from 1KB to
+64 KB depending on configurations.
+
+```C
+     /* finally copy this fragment and possibly return whole packet */
+     memcpy((uchar *)thisfrag, indata + IP_HDR_SIZE, len);
+```
+
+In the above excerpt the `memcpy` overflows the destination by
+attempting to make a copy of nearly 4 gigabytes in a buffer that's
+designed to hold `CONFIG_NET_MAXDEFRAG` bytes at most which leads to a DoS.
+
+ ### Recommendation
+
+Stop processing of the packet if `ip_len` is lower than 21 (as defined
+by the minimum length of a data carrying datagram in the IP
+Specification Document:
+[RFC791](https://datatracker.ietf.org/doc/html/rfc791) page 34)."
+
+Add a check for ip_len lesser than 28 and stop processing the packet
+in this case.
+
+Such a check covers the two reported bugs.
+
+Reported-by: Nicolas Bidron <nicolas.bidron@nccgroup.com>
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+
+Upstream-Status: Backport [b85d130ea0cac152c21ec38ac9417b31d41b5552]
+CVE: CVE-2022-30552
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ include/net.h | 2 ++
+ net/net.c     | 3 +++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/include/net.h b/include/net.h
+index cec8c98618..09d7e9b9e8 100644
+--- a/include/net.h
++++ b/include/net.h
+@@ -397,6 +397,8 @@ struct ip_hdr {
+ 
+ #define IP_HDR_SIZE		(sizeof(struct ip_hdr))
+ 
++#define IP_MIN_FRAG_DATAGRAM_SIZE	(IP_HDR_SIZE + 8)
++
+ /*
+  *	Internet Protocol (IP) + UDP header.
+  */
+diff --git a/net/net.c b/net/net.c
+index c2992a0908..f5400e6dbc 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -907,6 +907,9 @@ static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+ 	int offset8, start, len, done = 0;
+ 	u16 ip_off = ntohs(ip->ip_off);
+ 
++	if (ip->ip_len < IP_MIN_FRAG_DATAGRAM_SIZE)
++		return NULL;
++
+ 	/* payload starts after IP header, this fragment is in there */
+ 	payload = (struct hole *)(pkt_buff + IP_HDR_SIZE);
+ 	offset8 =  (ip_off & IP_OFFS);
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index a6a15d698f..04f60adaa5 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -5,6 +5,7 @@ SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
                    file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
                    file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
+                   file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.25.1


