Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FE5E69E9C
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 23:21:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.7111.1733181694702776065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 15:21:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FDHX4qJk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a766b475so44788535e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 15:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733181692; x=1733786492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzCzQMkDr4PbfSTIq5MHybNnFzrUsqElZBp2sl9c/PY=;
        b=FDHX4qJk36M/rJM2GMw05kNBSl+VGgQom/cbszuHhBIjDMQVKCI7zN1SgBYFcXvELn
         ZNP+SJrVZ7u/Oi5e0ygtSxaUT+d7rWFJNOCtDref+DMZEbl4OWQh5FeWV3kragnwZqyI
         PqFVndPEKM3xNd60NWpDpg2aJcGRKTh2+sE+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733181692; x=1733786492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzCzQMkDr4PbfSTIq5MHybNnFzrUsqElZBp2sl9c/PY=;
        b=sLT9tQRtS6hgOn/OLKJck/KFXhTLreHMhm/nRkSwjDqcozQtSObMxfA2Pf2lvWPyVL
         LLm7hyF7EV15oy9anGRJzsEOovoFytDUc6jksMg84nlqBtHsxtEeZn2M+/WsTDqxy6/F
         QVkJV/TU17PyvOSvMaEmJjzUrxzExka65KptDTkjTkv+kM4T0E5TiPsRsxjPrEqAbJ72
         MRkw6pQeSjkC/SNuscR+mWUlqizfmvQ2Sjo/EUWC+drafX9/mVyFhWkzhs2LF5YyPoSV
         BzQ0tckD8vCL6EkoZOC84raDz1YJ/xC0LbdMoajDt/gNpDV1usi4ISaxpJzH0UokfwoG
         Fn8w==
X-Gm-Message-State: AOJu0YxBrNiKExhaZoUnFj945TKDVWuzMcfrGIPrmPkijDPmUzTdfZ4q
	7YxekG0y2y32+PfZRONjMJR2tj4WkllTEDjYmKDo4onFSO0NkfAp8h5s2Pxw+R63i75sqPdSSs1
	e
X-Gm-Gg: ASbGnctVLhdZxsAd7J71nON9gOb06LJ+EjIqTR7uteqT7nZQthBpxfmZrZDu364yUnA
	/9nxPViTgTCeDKnk92rGK/o23m0ehs3OLwEWC2Zr+1o/4nTShoXqMKK129JhIllkWQmxI1DjlBW
	nY1hnWN+Kj6ttj8QgOROB7yRUqVu65zq/rkaBER59rThc/28UH6NFeC+7xPCMLQHXe4L1dS5n6I
	iVcw6SJ1Dg58OdNSEsa2ePVHz1dVDWIr0V6kYj6fUOIho6HmNKC4HYqjherNEmKUef5tjqcVrwa
	7w==
X-Google-Smtp-Source: AGHT+IFxUi6ew7fQ3CfLVl8ih1zBe+yA2YoWCcRusGKUJ4cz8kUDVdzze0bzGM9tSsjkfJOnZhUweQ==
X-Received: by 2002:a05:600c:46ca:b0:434:a2a6:ed0d with SMTP id 5b1f17b1804b1-434d0a23a81mr2090295e9.29.1733181692447;
        Mon, 02 Dec 2024 15:21:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9d38:5367:893d:ab7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70cbfsm172236205e9.36.2024.12.02.15.21.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 15:21:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory: Drop git-gc call as obsolete
Date: Mon,  2 Dec 2024 23:21:30 +0000
Message-ID: <20241202232130.33442-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 23:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208162

buildhistory used to result in many individual objects in the repo which
could affect performance. This gc call was added over a decade ago to avoid
those performance issues. Modern git calls git-gc when needed and this kind
of workaround should no longer be needed.

There is a small chance this is contributing to problems with the autobuilder
buildhistory repositories, so simplifying the code may help that too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ce3abaa69d4..d735dd5fb5d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -877,7 +877,6 @@ END
 			# Porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
 			buildhistory_single_commit "$CMDLINE" "$HOSTNAME" dummy
-			git gc --auto --quiet
 		else
 			buildhistory_single_commit "$CMDLINE" "$HOSTNAME"
 		fi

