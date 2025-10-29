Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8F6CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:29:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.27458.1761697772206531526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XN8mmSjI;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BroQDxom;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlgWv2525620
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RBTkzc6dMov
	eJc4Uohclom/DQ48xNDRSN1PuvteiySg=; b=XN8mmSjI/fBruOan8CbTQBUU9ws
	LYX1uLHp/a4s0X4Zcarw9R4DA4qFJ0aGUndlKoRNWd+Y5T36yxw0w3pZq67WuqS5
	sJZD9VoCK1tV2QjnM5QJl8MtWQTSxBg8fReysgneWg3KB/K8dDd/2lJYPnGtDss5
	5XIbNo0TepKRQ2nWz9Qrr4Z2Qxe+A/ro4D4j7hUmDsIgxb43PIUuVJwrkdqRQk1v
	nEeqA7OQf+47ibQWAB3Lv41BniyNkIIpcXQXI1a7+lxATFNc4VP/9P25kML6bTRu
	hncLOpQ9vXP4L8FTWCQN3t3mvdmBNgeSfcY/9GWYejFcJBiEWKg0E7fP51g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rmyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso165474401cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 17:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761697770; x=1762302570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=BroQDxomYDhpQZnjULjz/Yn5hFstUulTbV9+mHFS1XUfkpL8b6ftyyKu5L5HVAyDnb
         /BcZbQsnbTu/1IFacKENu1554UI/jA115MCG6BrE+uNNn+xtOXT+oeni36RWa5587VFf
         3DBl6OtLrYOUgBR9G6Jfht3zQJOT30Qd2B1uMVyu3mi1vN/6mqJ0sL2XNYLBk0DHOh4t
         3z4f7lketz+nxB3ptHFkuhah/fDvt1/UBlYisAqiTvCwAEeUNvTF1I0R8guJU9gctQxx
         SFWTQQEdX/G1pQv606sKYTI6C1R5ctg2a3SC2GdRHS91qiyE7rDmEOyKruHr5paKWEoM
         NTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761697770; x=1762302570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=D8ejTK0B49+agaLQzBmfHpaLxFmat629EA3COy1F12rqduAAIw9JfgYBAATKBe2Vv7
         YQZlF+yiULBMKUrTdVDcFqbP8Y+5Khby84otBP1/fFX7PmFgdoP6tfNhXHhaw7Bw7kml
         P3LAe2lUtRk+7eKb901OALlqyIXutQ7dXUNP2I3IfpdFxun2C6hl9+ZzCxjnWipU8EH+
         1Qw2TCszTufCq5zUV5CzaK8gznBZ0zUIg1Yv9F6cMmQNRrHw6IsLi9UOZM3HVL1Es4gF
         1rwny+UjxsR8MRuzaNfxs72dbHMGOon6C+eMiXd8+34/XZBRJ2lc0bAHC7Lo/H5S0CFt
         pncg==
X-Gm-Message-State: AOJu0Yzz/9pIQGbH2428zP0xgQKiAnc/3Bo40y38wV3taNp6eAdP0mcX
	fy4sIqe4EWjfdtpr+umqedMvL0OttbdwlvxYqTk1Ox1tuQMtKP0UJjM2HYeOGHTzlcq0noA8gHB
	Ab4FpMQapBlqUsrN2SPKBi/Mhzhiqriwd3Cfb5HGaq/o63ueBCzUO8wPqHakxOfMelwcc3Wmuc3
	/XqG/WnGA5yirXMvY=
X-Gm-Gg: ASbGncv1E116AOB4Y3f7oDAfSkrMD9oLDxwpZIBlnRfGlfQosvhrZhPYZdkzc4Em+xh
	k2SU1eIkD9ulFmQqNOT9zeH7Ogv1WL+N9W9q1rOo3ugisrdIvyQpIokWuhw+PP0XmWX31bz/5UN
	kFD7ss7iV+WzWi+4us2j0LfDV+2WWeeLy0Ejs+Kr1GQj0B7nSSJgFJDyAhhgDwk0t6yWux7Ary7
	pQbcwa9QYaG2H9J/bTHD1hN5jbgXhYD9druDzLch8F1dtmcXOE3Zw7r/sASGf8G133Uz4o9n0qj
	BcA/CoypNLxLC/vy0JoUuzf3LXyvWwhxvGGO0WE66EH7zWZAUrxOamEZsd+6pbh6q9P56Zf6Hyy
	FgR8fd5t8q0qfAYtz5b/M12dQFtju54PTWeXtQnR1n2UyLZBqQdG9ANOVea8aauFxDSFCANIjyN
	xjDLIoCh2ZAO4w
X-Received: by 2002:ac8:5a8d:0:b0:4eb:a8c0:43cf with SMTP id d75a77b69052e-4ed15c9802dmr16441581cf.60.1761697770097;
        Tue, 28 Oct 2025 17:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYGGqzLUe8tOwyR/sAAYJ96F5QI38ODOFJrE0OLF0eIJziDLEh0zyoC3l7uG3jdW7OpAsV6A==
X-Received: by 2002:ac8:5a8d:0:b0:4eb:a8c0:43cf with SMTP id d75a77b69052e-4ed15c9802dmr16441231cf.60.1761697769373;
        Tue, 28 Oct 2025 17:29:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09204esm32212511fa.8.2025.10.28.17.29.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:29:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] mesa: drop freedreno-fdperf PACKAGECONFIG
Date: Wed, 29 Oct 2025 02:29:18 +0200
Message-ID: <20251029002918.3728797-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QqrVQShpz1-hMjFleMOM7PRQspVAZGS7
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=69015feb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WcHs0SwSEHyATT4nbykA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfX5mad1+JmXJpA
 ULQxX7qxmrGbv2uevwnSlFkkYGAqxkGQYjCnI+8ZnvS2F8FuzwjpVVd3fRCvKTb/c+VD/U1z4QD
 aUqsvxR7powEh+Az9Jmzmq1pjZ/6xL+FUXTGAwgfnt/MkozP1qfDq7nDJuh7XNJfe8xDa0+Ahbd
 mHugC7EXaKMpru3YOTrNA7aP48ROKTV50wZDu/hojdcGptkB5+uMS5oalu8RFPjM7BKROn0QRYQ
 sm/XPAS5vaLsHJMVmbPO82FnMYTGNfqWQGZyhpiZ9w6lXbqBrlzaKXQXcxOqhfHNzTzrQikF3e4
 hlQw5AZvEj36QfNA2IS6xcV8T22u6hoUJWOBLaapPOuMUOxx+leQeD44WBgyMb9jBipUBxPTIvm
 Poe5Rn6aXLGoDUWNxtbcBAptUNHPtg==
X-Proofpoint-GUID: QqrVQShpz1-hMjFleMOM7PRQspVAZGS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 00:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225420

With libconfig being a part of OE-Core, we can now drop separate
freedreno-fdperf config option and merge the dependency into other
freedreno tools dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6a36aea259f0..fe778e58ee4d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -148,11 +148,7 @@ TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 # dependencies for tools.
-TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
-
-# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
-# treatment in addition to the usual 'freedreno tools'.
-PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
+TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libconfig libxml2 ', '', d)}"
 
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
-- 
2.47.3


