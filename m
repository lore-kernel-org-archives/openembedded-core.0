Received: from outbound.pv.icloud.com (outbound.pv.icloud.com [57.103.64.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.275.1793036110945992421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 10:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=M8I+3F67;
 spf=pass (domain: subset.ch, ip: 57.103.64.32, mailfrom: patrick.wicki@subset.ch)
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id 76A8B18002B2;
	Mon, 26 Oct 2026 17:35:08 +0000 (UTC)
X-ICL-RepId: 01a17947-c1b8-7bfe-bd9a-426b1c3c21db
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhICkMFWwBeC0kEQwVYEhVdRUMMQxlbE1JWRARUAFswSg1RHlIfHBNRWFUJChhHEkodR0NUAxICWkUBTV8OXh8EF0YZVQRHHl1WQxsZAlEcVg1XQ1QEX1BJDEFQbFoARxdIHV0ZWW9QXRwOHkIJQRVNVlAFFwZbFAREAV0FXQNAC04CWgRfAkYXSQdaAl4CQRRJHh1WH0AZWhMdGl4IWRl5C0YPRA5GXloQDU1DEkIVBBtGHkMEXy9dF14MXgU=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; t=1793036109; x=1824572109; bh=QDtkG3dW2m8MZFMo2DFgREiCUqZZUOUAz/e30wlmTGo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=M8I+3F67GI/BrKJI9MqWCafH914HvHVFbnT3aT/kaz5u3r+wftpx/r0a95fUsNHnD5xtGhdRJHcxQjWjwsq1kcAe9JieDqPY1gSLD8At+jdyYbTIsAYNfUnKKWqw/bosfWzZCFXDdpqhpzRqkBW+oFteB02AO0hT8PRe6XWRUGGHjB3CCZkG9DUU8JXobR7A5IoMqFnz85Z50EpbXqiWs5G9uiHyx+PHgsi409yC/4GAnlN3oF4yi22aufQ5RQAdF4v/6pLTbwi4PeZB5wk1t69sEm8JGrmvwK1V+5uG6LuuzJ6BW1CJNQNhGbotuauPdCl06FTwPH3vxqZGCQ6iiw==
mail-alias-created-date: 1663698038540
Received: from desk.internal (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id DCE9718000BF;
	Mon, 26 Oct 2026 17:35:06 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-core@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-networking][PATCH 1/2] squid: install systemd unit without executable bit
Date: Mon, 26 Oct 2026 18:34:05 +0100
Message-ID: <20261026173406.1475501-1-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: NFoX7Ceh2DV6xxDZn_ecmwt9CdT91Dz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MCBTYWx0ZWRfX5zowyCBkAWLa
 BtUwMGhAO04ABaM2idssB53dqeZL1yfx+XZ3csEdYuM+JuHSh3wgmvOjNzRyVybwcJ7CCIThIci
 kbtAYnBhzn+gpXRiGUqM+/CI0lfUBwruPE8+5waFAgRLfoDptyzJWmSxRIc/xV1PWJR0lB4W169
 cDHcN6y0FZ4/+FKUU4tKURxjJfAVGRsK6PplB/haeiouIDK6OyqaibmJ/riksqR+1EsK4T+t/8z
 Tc2Y6NIomC+NwMbK+Qp9oMuAQ0TZVa3K11P0SuoxsDaC3ehYQMoiSUnRLL3eN1HFAIYBLFk6APX
 Er6GT6jvk9Tt1fBI9P+GSjgrXyqGJ+7Mn/T61bfhUp+ioAjIXma9DyM2M2HOa0=
X-Authority-Info-Out: v=2.4 cv=Y8X1cxeN c=1 sm=1 tr=0 ts=6adf8f4c
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=a_U1oVfrAAAA:8 a=8tgSK7xUebHiGByt24EA:9
X-Proofpoint-GUID: NFoX7Ceh2DV6xxDZn_ecmwt9CdT91Dz0
X-JNJ: AAAAAAABr6I02fokjhVp/+CiqP9LKzZkOCpp7ovTgcpUIJdNMvgi2tokAv5dB2bcfbEVRQSndCaQHUQTHZl1HcPwrZyv3ISdL4L1A3dHgNh0CzlSIixNJwif4poNTnFsXmItAe4Tr/ukePZq7+8xwEO5PgyIKyyN9yDMH9OfQxJFawwPoc+kdVsPRWa9uh148XWJySSe6a/3CONd7Z1GY0qvy8bagwDJlAD5gfvkQDdwdgilylPu+vQLeoqwWgzUH1VfyBMz55BkBw072LewFgxmawJTdx90hMei85kOZRVIvSKjB+mG57YH/0l5knVVBGte/HiPVXi5plMPFTaGK8WtrqXW5QbVyNnraXJGxHEZgIOTrPA4KEpdeo2g33mfsdGF/0nWOmxBNFRaBLoWZRsj+jCrNMT+DC/8bhMGYwQe5vGyn9JtlJnQo3kOB6guDLvWbTDChgol8bNZAxfw6A1n9oEcBO117yFZD4XdumH+o32fo/UjRPojt6uZH+IdHuXNineFi+NX3Y8N4Chh/K/Fn7sXTtMPtEC4c2tqP0Ww+ACBht+ecwIVDf+906XTPEUIwMHZd5KYX5GkhC8Q7sikLH+l+zYX8ITXPedyqPDZ6i//MYF/DOMMIAjXjCnFqAtSDMRxHr0xauQmLx71oQ3sVABxxvodKn18z1fm/H5luMjjK17/wivHlscyLo/B6skp8Tf7u6h6OUBj3j//YBJmnljJ/3kY8t8DbhwYVFDdnmVFH4OzsfSGlx7531Sjc2YpvNRoKS/wUVsXmY3XZs3ek2OOTCVQ+f4TVyl+Q5+UNK03IFKxwjrNp+eryNYVWoah213vqZT3XbzchebcUBd7AJHi0ULM+VrhhJgJ1pLNswT1AA0+niYlSgerc8uXsS3JaVnJEfArQBjpzi85zSJ8/T5emqt+NANII92ME9Sbuk3t77zJ0yADPgarIlo3U7akO/rKRSvFcYnRcDUqo0B6+KTiEYW
 VmJezdG3ZEsQHLOVMm9DB89wse/GIDRnx6VcqZdsD+F0wycCzZgmJHXvchwZgcmBKAgt65Y1oIlIM4N3Qcs1E+gMq5HlqK3+VBP5VzqW/de5Tasu+q6UNszdQUMWw8GxQSb7CqGo+yQ2hUK/w/JIWn/O3nOVSYBR/FFt4dHJP8ge4cVv602xfJu2EXwlBEm4rdhKAiGFInMVC5xb6Tep9BJ3VmA7jC9CJzUAylltqeE+3rFNszJmBNP5HkPg4cckU/CNWuJUYkCEM
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 17:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248687
Content-Type: text/plain; charset="utf-8"

From: Patrick Wicki <patrick.wicki@siemens.com>

install defaults to mode 0755, which makes systemd complain:

  Configuration file /usr/lib/systemd/system/squid.service is marked
  executable. Please remove executable permission bits. Proceeding anyway=
.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_7.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.7.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_7.7.bb
index b657197fd7..bda8f124cb 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.7.bb
@@ -117,7 +117,7 @@ do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
         # Install service unit file
         install -d ${D}/${systemd_unitdir}/system
-        install ${S}/tools/systemd/squid.service ${D}/${systemd_unitdir}=
/system
+        install -m 0644 ${S}/tools/systemd/squid.service ${D}/${systemd_=
unitdir}/system
         sed -i 's:/var/run/:/run/:g' ${D}/${systemd_unitdir}/system/squi=
d.service
=20
         # Configure tmpfiles.d
--=20
2.56.0

