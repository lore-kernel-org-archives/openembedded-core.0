Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EF1EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:47:54 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.9477.1687186071325573303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=cRHdIt8P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f640e48bc3so4468459e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687186069; x=1689778069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPDzpP/3Q1HExrjxt6bQ6+B1fIy3OltNrV3TuI9dFWo=;
        b=cRHdIt8PfywNrnx7qV/FKHj/NF1TNvQxgyT63AleFh4F1Vn9wqjS//lhYU2iZaVkV8
         RDIBbfMJlHUtZ6Q3bdZg5zEpr+GPsXg3KJyu+86U+Ha7xLkXD1YVoszdgNEf+6vx1gHX
         IsgOtZP+ErNsU5oMjE0vGUUSxK6u1YNcAjNYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687186069; x=1689778069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPDzpP/3Q1HExrjxt6bQ6+B1fIy3OltNrV3TuI9dFWo=;
        b=j9zSpgEJagEJTvVkbTmLFHtqhbjLRi4YEtwTPW5Sxhb8lBfCNg/ysl3BkkSrmAi/xj
         KRatapzDb0wEPSKbJLz0XLP42t8OaCpfQ5DCUuUsS71WsXvo8SwEBoLRJuhpFzqKNhjX
         u+6scAWbueoyLG9PeRZcBMZeP29x5sDkOdFGzmbtmt85+eyhyRbkMldMY2LTJWq3Vi1O
         gMOrIr6ASgEYQSzIP7RQ0yYOqz1s08q407HE7tnHhFWSIFwEvpU7exOcbolylLNF8Lhl
         fl8E0qTjbxtpwP/ay8jdkNfMyKbs1CPBIOhmsLRJ9QEMW0CjYL4H5f4eMuGU1XzOilww
         FuoQ==
X-Gm-Message-State: AC+VfDyhuTUiqiFUaCfhHFuachxTcqPW8mc6sPuYBt+lmdDjr7zHFLnk
	6+b2mQcahkesWQQNkZnZMp3UnJge4iDrceS/tKo=
X-Google-Smtp-Source: ACHHUZ4aYeGLSf/IkGqbC3oomMFZLWt8E3kZeYAiNilfvNcSofTFBRtFmRIyIGrhinaHFuJJGwMZmQ==
X-Received: by 2002:a19:790e:0:b0:4f8:6e16:fca3 with SMTP id u14-20020a19790e000000b004f86e16fca3mr2017491lfc.28.1687186068165;
        Mon, 19 Jun 2023 07:47:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id i1-20020adfefc1000000b0030647449730sm32061035wrp.74.2023.06.19.07.47.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:47:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/runqemu-ifup: Fix extra parameter issue
Date: Mon, 19 Jun 2023 15:47:45 +0100
Message-Id: <20230619144746.2672706-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183117

The third parameter was dropped in a previous commit but changes were not made
to the argument checks. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu-ifup | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index bbd624596ed..e3aa16c97df 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -21,7 +21,7 @@
 #
 
 usage() {
-	echo "sudo $(basename $0) <uid> <gid> <native-sysroot-basedir>"
+	echo "sudo $(basename $0) <uid> <gid>"
 }
 
 if [ $EUID -ne 0 ]; then
@@ -29,7 +29,7 @@ if [ $EUID -ne 0 ]; then
 	exit 1
 fi
 
-if [ $# -ne 3 ]; then
+if [ $# -ne 2 ]; then
 	usage
 	exit 1
 fi
-- 
2.39.2


