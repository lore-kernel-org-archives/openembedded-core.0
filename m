Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76706D78793
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:35:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.2829.1732206912767950002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V3/AlRfE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-431616c23b5so6510375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732206911; x=1732811711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gx3/8RGkU2n7vHvSEBxPPN4uLeeGnupd7bGwEFpjL6M=;
        b=V3/AlRfEYquIgjMuU2USvtRJl+zVFKH7bU/mQsb/hY3Qf1qxCMg4W8P1pTm/dhTLeB
         Uxo4Wau28lzB4JkjHWrrQgtMiKwh24xTWkrfA+LH6u9HSRB/c169+YuBAoS9qd9fh95o
         lXLUrIKQGL47LcPr67D90anqJ7vnnOOXSbOkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732206911; x=1732811711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gx3/8RGkU2n7vHvSEBxPPN4uLeeGnupd7bGwEFpjL6M=;
        b=F3lFCkEg8yMGdKTqWwgJh5NRXRVpCkXexdmcveIDWhIWWOvcBgryW9AOyYie4nt/E/
         z6Sbc9QIkZZy1QiiYRAMr7roAXgpCSoCKNsnX4oRWZqGkaEnHJcAn3qRAdynTCQfg7fd
         rVBHx2kBPLkUe2WjkBH8CmUiKKeltAexFWP+3ABYBu98/3HDQ9RuMxkPYYuq/cxMr5jC
         mXZBTsHeevvDE5+JlGZK2gGdRN15cDfvPwhwRx7+cPhdA3gdzwAnha/5u+YYXJPAHm/W
         saapKptWQ5f04uqiswilI4G4m2Mdl7zToC+pCgHgR43rXgxw9x7xbAJ85xCvpUZl3OzP
         9Dqw==
X-Gm-Message-State: AOJu0YzNBbgs9NRWddJayYOE90UlL72YkciujbthWVocqdhcD2z10xSC
	OehBaHmfhAVmyFpix9Y2PirERRNoDGylj+jxJiWE4y39QBIfJyK1Js7qk2zYnLkbSF22A7UuNI+
	wR0Y=
X-Gm-Gg: ASbGncvKCO1MrakIlj/j8z8nGVSFCglR8u2xZIZo2VF+B4nn8D4Lswm16M3jJiTM36M
	QwTclDOCOHzsyyy0cQugn84M5LCi+DXQ/k8BtMmm0b4WeyvoteKqYTm28d/dSXlKtc6HX4q/Hq7
	18WR9lREjS9X2STZhVp4SfUJF22eHc8QxeABwynrrThvWHNS5BRr3YPATZ25qyrjp0xeX+Z7b3D
	NbA0aTgfap41KP12NteTKoRQ2WzGav7vGCPpiKXx6W4qeOBLZzu51QSFnxwQEzfKQ0w+8Hz2ThP
	DEc=
X-Google-Smtp-Source: AGHT+IF144ei1zCe2BRMl/koNKAkVT+iA2heJY8gYvDWF+EQ6AuWh+Fu2JsjcSEc6Kc5EL2v4ebivA==
X-Received: by 2002:a7b:c355:0:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-433c5c956eamr32890335e9.5.1732206910822;
        Thu, 21 Nov 2024 08:35:10 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a4ee:c091:1f03:6404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1046sm64034945e9.4.2024.11.21.08.35.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:35:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] selftest/reproducible: Clean up pathnames
Date: Thu, 21 Nov 2024 16:35:08 +0000
Message-ID: <20241121163508.2628148-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241121163508.2628148-1-richard.purdie@linuxfoundation.org>
References: <20241121163508.2628148-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207549

There are several problems with these paths. Firstly they contain full
system paths which depend upon where the test was run. These are pretty
pointless and just take up a lot of space making the results files large.

Secondly, they contain the same path twice. The reference and target path
will always be the same thing in two different locations.

Strip off the prefix and remove the duplication. This does change the output
data but that can't really be avoided. It does shrink the results data and makes
it more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 1ea33cbe786..ee6f8cbdc25 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -205,7 +205,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def write_package_list(self, package_class, name, packages):
         self.extraresults['reproducible']['files'].setdefault(package_class, {})[name] = [
-                {'reference': p.reference, 'test': p.test} for p in packages]
+                p.reference.split("/./")[1] for p in packages]
 
     def copy_file(self, source, dest):
         bb.utils.mkdirhier(os.path.dirname(dest))

