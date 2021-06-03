Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.810.1622759038746438088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 15:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S18n9Kh4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id f2so7311371wri.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 15:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mlogxq+e0QRGSRiI5BYrJ+k9HXWSB5dBbs9HW/rl9dY=;
        b=S18n9Kh4Jk7QW55JLom2EGmOSrVEdhW2rhwjJ/EiCG7gWzun8FDO9DL84f3hcVHzE1
         fj6Hxi6CcXWWjkQUXZH+AKRcSzyWsk+gH3YQup5TsBr8mDoUizyG7B9miEfXlrLWJnwP
         r7NaEdFc0g0SqK8PK/Hin8fVjS304n0yCH5Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mlogxq+e0QRGSRiI5BYrJ+k9HXWSB5dBbs9HW/rl9dY=;
        b=c1DIlV31GqmnS9ahgE8WoyNJPBAcd+z1h8tStQ5KSmzREb+ukQy9kmlSxal7rh7DeV
         v+2hzo1fZG1H5Ed5Oa796yEkxQ6vP6jlICohbLu45QtW9Jbtg9F3HpEgsDMYztQ90k/r
         NxrctYHu5jUkvbERMU+S4Cq7DuRa40JXHJBdh/yO1F7dvNknJx8UwN3egqlX0BunwoVM
         F9C+iPNMT6zEYMlEGBHvhqSiMpNLoIewL7AyVo/q7Vw/chm4rHMuiXnp2bOkwwlzb5k2
         zA0p2iqy5zquYZYS+SRJUirfATm2O1TIbbVvhWpqk76KS7s6cBb4vh8fpyjc4ApU3bgj
         PDaQ==
X-Gm-Message-State: AOAM532Eo/MnEPwVYh4fNlVol2Ai7HrXUjKACaANCyGl69WCZnOo/oI2
	dAO/pCMqYmnvLoXLP8odB4cedp9fOq0AbQ==
X-Google-Smtp-Source: ABdhPJwFLtYRSZEMdu7/TTpetvEQyPz/2SV3zcSa8K3dijO0dT3+CjtyNg7PiEHf13N8S7ZJXSaoWQ==
X-Received: by 2002:a05:6000:1b8f:: with SMTP id r15mr585014wru.119.1622759036764;
        Thu, 03 Jun 2021 15:23:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1fce:265d:903f:2948])
        by smtp.gmail.com with ESMTPSA id o129sm6837497wmo.22.2021.06.03.15.23.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:23:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/fetch: Avoid occasional selftest failure from poor temp file name choice
Date: Thu,  3 Jun 2021 23:23:56 +0100
Message-Id: <20210603222356.2971294-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The temp file name may contain "_" characters. Avoid this to avoid errors like:

bb.data_smart.ExpansionError: Failure expanding variable PN, expression was
${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}
which triggered exception ParseError:
ParseError in /tmp/tmpd_f2__to.bb: Unable to generate default variables from
filename (too many underscores)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/fetch.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index 67e85d3e4c7..1d223c0778f 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -57,6 +57,8 @@ MIRRORS_forcevariable = "git://.*/.* http://downloads.yoctoproject.org/mirror/so
 class Dependencies(OESelftestTestCase):
     def write_recipe(self, content):
         f = tempfile.NamedTemporaryFile(mode="wt", suffix=".bb")
+        while "_" in f.name:
+            f = tempfile.NamedTemporaryFile(mode="wt", suffix=".bb")
         f.write(content)
         f.flush()
         return f
-- 
2.30.2

