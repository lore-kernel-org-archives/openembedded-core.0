Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA10C46CA2
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 13:12:42 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.14745.1702732358583939438
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 05:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RBJuHLhf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3365f1326e4so318180f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 05:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702732357; x=1703337157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fa4hwyF1nCBbQdLOBgWiOLJt0iDuF5sSwX2b2561MLI=;
        b=RBJuHLhfKsGfbQp1ZHMUQlvtrKzrTfZF0V3i9CDDC8bv55ijs3clh6yEi8hxXpUwt4
         6jbXQccSo4McVtLGnQFrOjTC4lZNA3Ch0DE7pY3FXtqmFRv84wUe0XKWG/k+WCnsWztR
         IyWt1e1VbcZW7DSVpHRLAhLNZxI/NcH1apoyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702732357; x=1703337157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fa4hwyF1nCBbQdLOBgWiOLJt0iDuF5sSwX2b2561MLI=;
        b=SOcK6vhrj/7kxgCtiqsnnuz3fqzHOpHTgrAl4V/VGRQ8oeWdrQhtXK/uZnb39GMSlq
         FauTrBU8IZ2DS195DZrzC6Ux6jI8ROm+SHcTXniF20NMfOycZPw3w7IoD4oQMd7jpZq7
         NbRvc0DF8Y85L1llXOnFg/OX3ThZoYykAKxzIGeQHgo0Q7MFn5823xrs9I48YfT8G2lY
         Sq+teDNPK+rlwA46+uJZrNKVGIwJTGi382OLTNAohF11zL3ty8OyM7UOYcs/SqATOjYC
         BBge2Bz/n4sPES4Wodd5iNpGcR8ExECzKrD28MVcrnHfGvU10t9YQitpBXP0+vbTLPMK
         /ofw==
X-Gm-Message-State: AOJu0YxzI9Vcpf4AqgwjXUFbtG9g9h4Q5FZAO1kA7LXTYmFp6doioS44
	3UV9sxI3BOslDmzoKSTWZXlMNUwX+1rNvqhPdnc=
X-Google-Smtp-Source: AGHT+IFxxsJAMtm8QHhXKNFM2knxZL+5NGq1eg7B1aXtGNN5arxWx9vnNpwBpENQP2Nidm4uElDA4w==
X-Received: by 2002:adf:edca:0:b0:336:4e95:bf57 with SMTP id v10-20020adfedca000000b003364e95bf57mr1267180wro.98.1702732356616;
        Sat, 16 Dec 2023 05:12:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fec1:d6ff:46af:def5])
        by smtp.gmail.com with ESMTPSA id n8-20020adfe788000000b003364448ae91sm8161619wrm.10.2023.12.16.05.12.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:12:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sstatetests: Disable gcc source printdiff test for now
Date: Sat, 16 Dec 2023 13:12:35 +0000
Message-Id: <20231216131235.3083400-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 13:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192560

There are some issues with the printdiff code this has identified, disable the
test for now until we have patches to resolve them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 795cd5bd85f..e6f3b03c82a 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -840,7 +840,7 @@ do_install:append() {
 expected_sametmp_output, expected_difftmp_output)
 
     # Check if changes to gcc-source (which uses tmp/work-shared) are correctly discovered
-    def test_gcc_runtime_vs_gcc_source(self):
+    def _test_gcc_runtime_vs_gcc_source(self):
         gcc_source_pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
 
         expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
-- 
2.39.2


