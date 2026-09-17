Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C496C982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1673.1789682881649114162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WpKh/3kM;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so557315e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682880; x=1790287680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8p+v+n/3TOQIwIybuDH5sS6ombHaDjY49hD+Y99mwKs=;
        b=WpKh/3kM3La1MT0KtmG8GWLET3Lg3Jdf7MrGtEfocb0MEvP3w5ovbtFxvDnPPheq+v
         zbL2if0f248V5tGx/kBrGY/6/maIhUOhivTSd+9H0Q0UsRdounomOI1gCyst8e/GRyqX
         shOBPujgiy4IbJQ+7Qp1YpSatNvtd+fIXpdaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682880; x=1790287680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8p+v+n/3TOQIwIybuDH5sS6ombHaDjY49hD+Y99mwKs=;
        b=k8yt1y3Z18LQtJcBFmovvGi0BwjpqJxqx8qjj9v/S+/f+QI5j/jbCqpK9TQE3627Hi
         BlaU5VRZMmog630O+VsC2YJRmzsDoHrVA9HDY4b8FsIIPIXvrRUjV+kqPjDztzn2hXy0
         1HxHdmPFR/CEBhGWipF8nCfEAJM1H8GFKPN3Kac7TYEuZx9cpXpjNHKxLx6cAfP0+30B
         EgDXdz5/1JgxUqyiLIYEbEwe3ORdz06q3pPij9uYXb/GNmw82G8JoLxb0lHE6v/Fw1n7
         gCHtSgRqzYjulFm+4eLWxz1k2SfcFgj7VEidt9XgGky0XUmUh+wS4z+7YUXcV/+5QnPy
         6IWw==
X-Gm-Message-State: AFuF++lMSJxPbVQVKEUNPWx+hxbz9x5/hFwYGcZYHIQQzs3CmTSgZRv4
	S2Kfpb2MiRFIPDSC/Fb+6QvOfM/+ZtGVrArlkFmJT8eVew2santE6TTlEyQgcLiHunr1PTlq55s
	iXHEWUEY=
X-Gm-Gg: AYBFou09ktK9DeG0FZHd4Np5VjOQ6sZnGXc6OzP7MMf9AWvVSIgBXT/WZiiQTIzibqp
	Fef+VTEHcVtobad1AHKv+6xUj8m+Q38B1KWspemSGh/+UOs5PmQ9SvYO4+OmcORfRWoJu76zh7f
	sTWdj1z+FxBSWLG/DNEeXRQyiicjthwgUYfyelC1EHR+Yd3zI1NAKCo0/MOREq54KUUbL91akg2
	OCFfgSgMzfWm2ttaTO8LmpblU5R1N6KOqdG55LwGLJxmONT+k3I3SM4Bp4nexvyB+1AoLjVT/6E
	4rh3nicRB36o5pol8bCsdnuKjXlCHzIahGMNgr6oynYMgnbep+O3JU5eNd7w6W6w7yLHt3W0w5G
	/w4tg03fri/AKu/Vqh1uLPfEwZd9bNYbuj0k2oD05xwfiIHvwKX8Fnk6CUWW6rqADilERpzpqin
	ZEYHTDKHMYysKdtmpVP6O1Ii5aPdXWAFUJxXz2IenlA6o+zsuzlFkTWsOy14Y8ERsu+opqXxKdz
	wwPI0cyRoVziSaoiB/Zjr1Wt6ukRmx52uzB8icuA1rujAZYWJDL/7zv8u343lTdqL+aIdfIbQs=
X-Received: by 2002:a05:600c:4e89:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fc4ff40a9mr6622575e9.9.1789682879932;
        Thu, 17 Sep 2026 15:07:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/79] sbom-cve-check-update-nvd-native: -> 2026.07.23-000007
Date: Fri, 18 Sep 2026 00:06:06 +0200
Message-ID: <19a4405ba0a94e83d93535426bba85a9b4ce5870.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246116

From: Tim Orling <ticotimo@gmail.com>

The diff is quite large, but a partial comparison can be seen:
https://github.com/fkie-cad/nvd-json-data-feeds/compare/v2026.06.24-000003..v2026.07.23-000007

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9d89b3b802bab144afa30e03b0411ae58232ef11)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.07.23-000007.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.06.24-000003.bb => sbom-cve-check-update-nvd-native_2026.07.23-000007.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
index 73d9e776929..cf35b169235 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "11e62eba27133a54836b7a081d05ff96f72d879b"
+SRCREV = "64a0cea215628d780438fba8bfe0f3300db1b702"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

