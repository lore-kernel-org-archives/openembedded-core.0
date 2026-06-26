Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412ACCD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:42:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30041.1782456162372482201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=i+bZwFga;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=RwagmsSo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VPQV4193065
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UlYBe/G+zR4
	DvDaW3ZMwqXBjn8UWVlInJe8aYfKt7vo=; b=i+bZwFgarVz+fb5NZ1GNhB8zxjQ
	Ja4YpR3fjPVNOb1MQiPXiDQMRPUuACa7a4ghfanVWkFA/fCYQIjxLvegRuDoDoso
	BCn5v85MSQsI3CagimNuZWcKTGr6rvkdjShR52l+5Q5Nna4DK/Tfer8FoiLsifFX
	U7uPz4+8jsTdUYleRihEgQ+IYwUU82taTP7MJ9z0ghOy2EkXRV5eQevULgXfWQ4N
	r9zzO/kwan+v9629zUcJ3o6gCqAC+UtdYjbsWTjWRIUN4eIeiwynFBebS51d8wum
	UsIdr7Ie8MH+k2yY5uSaDjFw+x5H1Pugi0ay3spX2+RuBXwU+HdwN+2sKsw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgds650-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bd0d5f5a4so70689eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 23:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782456161; x=1783060961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlYBe/G+zR4DvDaW3ZMwqXBjn8UWVlInJe8aYfKt7vo=;
        b=RwagmsSorq8P76e5BledoQzflPwDeBHAu5kTH3hRy0mTzx8EfKS9fC18B3Nowek6KY
         A+sBfwxiH6BCspmRjWqFZBddD9w0yjGLd7nSliXm2j70pw5lESr0UmYWJadUFncPvERq
         suQcYjC7au8PS6hxmWrL6MU4j02wuuwjSsNm1+9UPzr5bExLvd1keHpMU5n6ShKL6m/b
         F8/le0n6Llw8DajscPFzXsrAZIVkWL0EvUz+xRY9afcPiRNrueewDYRbRt/+wZRL6zxK
         ptNx+CSTyOECC5zQlpHNcLfIcqrEvilLv4qp0cYC1n6jAOwbXnJqfOPNy7fQm5xsFk0J
         i+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456161; x=1783060961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlYBe/G+zR4DvDaW3ZMwqXBjn8UWVlInJe8aYfKt7vo=;
        b=I9SAPqXFwVl8PZAOpbIF4FbnGrt3tyHEQ+BQVfVeJqV4bWf7I/Xq8Z0ENYHBw/uU76
         qhJavVW9w+aoMZTYfKNmnCi8S+6ppMupEDhdEr5US5TI7TL4VXNLJXb2tcJa3x2FBoNg
         vKj2hAkgllLIh5sJvWzJxTcRp+QdNE4riaeIJDewvGkgksePnKFRg/ES6aupsH2AUYu7
         NtlD0SxMB4C660rIFUm+9O5JNrb+f59j/SM+NDn3OsSuLnZ3zJQuh6IBUmCXAvH6X6Rl
         +zf3qydUzxDNInIlLJZDcwuucKjo0iQQgmqM5VwZuLHLtfWx4l3lkX3JpTQdg+n5ABMh
         vbXg==
X-Gm-Message-State: AOJu0YxhWMkDoD4Z2AkWPRlLquWMRY5pVsiiVUj+4wrwis028Gq/H1n/
	JZl4AhmenYZNJd1V3B2+WKUwClDUP0AjxpIl2NKylTTW3YopEuVkd9MgNjwNmbUl/NqucSb5F2X
	4t85PM6VCn5g3HGfkF3kEmPMn7NfYr4b3ADpS9aWCg+QWBCFztZz6JA3Nbbig2xhuwOSmpq84uY
	T9jLiHVkXsno/X4HZ1kw==
X-Gm-Gg: AfdE7cn2e0Osa/Fz3hzCpsScBPgkuuaftL9X3mXc7L0BEnS7P00HGzetBIE7Y490pKl
	0A91WXZJ+ugGqGOuvQhmZ91JqUxWle7kFaqxsS3U68ZV+W6pnM4d1wuon2XBriuvkwrrSquip47
	osBMlwbXwlUe58g7X0w+xGOnC5OxflKxqXQXv4PcajEojyM9nA2OuOjyCEiLMdzq1OYIn8wAxCx
	D8aDTKauHZhZcdyXAad2BHhdX1SAusfgkCSygoYSFBYhSF8yqo0agUzbAcVamMZQ5yzldHbw0XO
	pspX84380jm4JQWCPLqcLsDJgOzL1SWjp5s7MCe6Gft+//cZqog9FjIJ+yUoSTSJxwAHz+C+MwU
	OEQk0PxcDJn3eS8OZg9YUL55icXSxeGnksB4a2sCuK7ARY9bv4vA36DlvXs11LA==
X-Received: by 2002:a05:7300:80d0:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c84d6c82emr3267048eec.7.1782456161089;
        Thu, 25 Jun 2026 23:42:41 -0700 (PDT)
X-Received: by 2002:a05:7300:80d0:b0:30b:d2f5:d503 with SMTP id 5a478bee46e88-30c84d6c82emr3267036eec.7.1782456160497;
        Thu, 25 Jun 2026 23:42:40 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm16628270eec.31.2026.06.25.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:42:40 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH 1/4] bluez5: fix set volume failure
Date: Fri, 26 Jun 2026 12:12:30 +0530
Message-Id: <20260626064233.704350-2-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
References: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e1f61 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=e8bRT_GSZmf0kOtY9XgA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfXyZfpHpJnmfP9
 fqzXUiXqFI24G9AkDZgbXyqZdXJQultVGRh2uMAZ6H/jGLROfrG9Ho/9fmOE5ne3YDVNxkZ1F+M
 Fk7hk6lae5v4ocp0weuEuLrIIM7wClpf2Q7tXDXr174UABb2pEKjgkLVPBeg4P7TLTCYeFBrRAg
 xw9reDzIDcYNIesYA5N/bUxzYZ1tOkh/DkjA6uKziOizfe9//S1JnaB247cXgiil+iWNkBlWBma
 wjjILXLsYywsrYKuu2YBBJ3BOLwUtMSiJSHbZyHPQRR7Q55Q4ZtqWuTT3FqSKlLNPUQ3tztYv2M
 WEu4ckGuDCsv2B/UnfDtf8bAF0jpCZ+wW25hE7+Oj/sl6xdzkQqDmHCYEnoPBZ+kCnLCotfFOmL
 h6UxtyKFqudY0dO6xDe/9ja0iYPgCtl4XDW/qmqjar8L4tYG26V5jC90r5wziFoAeDlcGJb+7aM
 M8rGBPPKIIgto92jWAQ==
X-Proofpoint-ORIG-GUID: 5uU5vcRiQvySZGxJUqxAME5eSLiXdkLl
X-Proofpoint-GUID: 5uU5vcRiQvySZGxJUqxAME5eSLiXdkLl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfXzAhHY/EAWrm+
 XVbf8KsBo5D3NKhIQOePSM2MpRyLwe2IDMx1oYCN9FDApZ2Svt4ArkY4Os0q5t0UMcbEfUmOr0G
 NgBzKGK67CrSkH4qBgGICAmu2poKrE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239604

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

Backport upstream fix for AVRCP volume initialization failure when
AVRCP connects before AVDTP.

Upstream-Status: Backport [bluez/bluez@121e5ca]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...t-volume-failure-with-invalid-device.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c792cc9c66c..c09a759244e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -71,6 +71,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
+           file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
new file mode 100644
index 00000000000..b5846dec47f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
@@ -0,0 +1,46 @@
+From 8a80f70c23ca5f93b1db7e3956cc7ee28c1fa767 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Mon, 9 Mar 2026 19:18:26 +0800
+Subject: [PATCH] transport: Fix set volume failure with invalid device volume
+
+When AVRCP is connected before AVDTP, an invalid device volume causes
+the target to reject registration for the EVENT_VOLUME_CHANGED
+notification, which breaks subsequent volume updates.
+
+Fix this by initializing the volume to the maximum value in the AVRCP
+target init path when it is invalid, allowing the controller to
+subscribe to AVRCP_EVENT_VOLUME_CHANGED.
+
+Fixes: fa7828bddd21 ("transport: Fix not being able to initialize volume properly")
+Suggested-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/121e5ca79be559c5374f8a54c6fb6e233e383379]
+---
+ profiles/audio/avrcp.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 724b46c59..326dfdab7 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -4296,9 +4296,16 @@ static void target_init(struct avrcp *session)
+ 	if (target->version < 0x0104)
+ 		return;
+ 
+-	if (avrcp_volume_supported(target))
++	if (avrcp_volume_supported(target)) {
+ 		session->supported_events |=
+ 				(1 << AVRCP_EVENT_VOLUME_CHANGED);
++		/* Check if transport volume hasn't been initialized then set it
++		 * to max so it works properly if the controller attempts to
++		 * subscribe to AVRCP_EVENT_VOLUME_CHANGED.
++		 */
++		if (media_transport_get_a2dp_volume(session->dev) < 0)
++			media_transport_set_a2dp_volume(session->dev, 127);
++	}
+ 
+ 	session->supported_events |=
+ 				(1 << AVRCP_EVENT_ADDRESSED_PLAYER_CHANGED) |
+-- 
+2.34.1
+
-- 
2.34.1


