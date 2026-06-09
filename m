Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB6BCD8CAC
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:43:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74768.1780994582919262828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NqdkMAaf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2783760f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 01:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780994581; x=1781599381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEcj9dfNf+4x7IJAQyzqHSbeRvaJ3p1L543Yhe2J1cE=;
        b=NqdkMAaf0zFmzcFxYDm3jMBuXS5CuXeddnGMp/jtPqvgPqmFQhZIthzJX6Uy6YkK7C
         3BivUO8Q+BWCrLxis7N1e18SehkIvIwuZOzVA0p8lcRSgXzqwmqblEAwAVRS1LvWaofM
         g1oCG/Yhq40b9RrTf2Lp2zwRGqqAiQn8jDvV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994581; x=1781599381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEcj9dfNf+4x7IJAQyzqHSbeRvaJ3p1L543Yhe2J1cE=;
        b=UmHbkwTNEZqdau9YB6HCSc4pIsk2UzaBG03FAsjOwYOs+xi/FWJ9ZJyL1VXbOHSRS8
         1gRYXqs0y2Oq6Odq51mmafu0a0g5kR4SFpkjWxvCztr4mN37s3Luk+GYiR34S1xYiqOD
         W/FpIZHy3wBPwo+kGVVeuGPD1yk3oK62BXXLaoezvH0RaAtndKEHL5GNVhHW8AtgdveY
         ek8Ti4Hwnr2p/HElLTBFZtbQUh8R5yzCalAqbTWkCS4XLAB2LqmoykbP3ovX0TyX3KIS
         T6DHaiEmYzhH8oXMvVyVa7D/RDAi0IbbdKcUVFyR6+txnHx7C+9NH6AG+DC8C3c/PfKs
         CN8Q==
X-Gm-Message-State: AOJu0Yz5+XKLPhv9ZiIKdQi6iWtv3fi0xDJ60oTC7jUmuElqyQSZNClT
	6NP34UZT7ph8E8kptgRSYBmnP3H2tFnBuax9LuZrA5AYs6Lxkj/qER7KbGwzhgOTWhcoIOR48sg
	VhWoY
X-Gm-Gg: Acq92OGnNtbkxJl0QVi71qOGbjybeiEyT/ysrp5S7BkNBNTp25SRSvPTz7FKmPocRPh
	Blo4vyXoNnMInF/1deYKqq5bM+vdmie/wEo/jEpkrSnor+2scbkE0D8Z96A2GSlcQmaIWFHJJvf
	MYUlhMVzhNG1LrEdur7SqIxnA1vyKiHueNmnPJxmB+BvFW7AFrf60XLFFv6oP+5a6n3HQ7pLvUy
	qJZ06F1DGPL06Y3P+vETPcObH75DX1+70HR64gK63ms6mOV/NM3TPV3mot/kXt4CVGsYVsIhHo5
	S42Sj5obmugjKIOCfXJJEpEACUvxyBqFEcB2bCu9sR1l4RHR5e++3PuAF8ksBx2l05Vn39lPEPJ
	n4BUIdVkRgV9CDqP8w+irne2/S9iK5nRi47YwTBXNgLy3nioWuChvOKTeaUSa0DSEmWecILQhSz
	SgmEGTJpE7dC1r4elSlyRtB9s4X/qVxwsWcSdvs6vDHdqpTykP7+HqPYvAaEU9z1Q=
X-Received: by 2002:adf:e00c:0:10b0:45e:ea46:3346 with SMTP id ffacd0b85a97d-460304f0a0bmr19981128f8f.6.1780994581131;
        Tue, 09 Jun 2026 01:43:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fd33sm66331912f8f.35.2026.06.09.01.43.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:43:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] checklayer: Improve debug output
Date: Tue,  9 Jun 2026 09:42:59 +0100
Message-ID: <20260609084259.1532075-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238276

When tasks don't match, the printdiff output alone can be misleading about
which tasks didn't match. Print the mismatches explicitly to aid debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/checklayer/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 046a146de06..bd9b1714a0f 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -425,6 +425,9 @@ def compare_signatures(old_sigs, curr_sigs):
     if not sig_diff:
         return None
 
+    for task in sig_diff:
+        print("%s changed %s -> %s" % (task, sig_diff[task][0], sig_diff[task][1]))
+
     # Beware, depgraph uses task=<pn>.<taskname> whereas get_signatures()
     # uses <pn>:<taskname>. Need to convert sometimes. The output follows
     # the convention from get_signatures() because that seems closer to

