Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.262.1592258526826717320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 15:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F3XVDpY3;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: danismostlikely@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id g7so8535047qvx.11
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 15:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eMSAfBoLQ0nkN0ZKGmGU77y9Z7fvyyyAoaILUeYx9SE=;
        b=F3XVDpY3gOJeA1dSbgczwXGGx02Arl0PO8i5SqgQkquACdMvxjaU5OZSyA9Jdh+YWk
         GGeYN4VqZ1f+XRPR4LAyRL4FT/hlYy6yvZfFBbTov1prjDFob0993tBRFDnlX2FrkvAb
         qvxQh2oYVNEwCfEvzvf7vEmMu2YFH2W7xgmrt+TZXkItDASpAQYeHn/LfbRfpVk/ADjE
         PbYWpNivGM7ZZynmIY4m3lBMQrRvdelDJAPfHi0n4Ca45dTYdtNO4KcXEroXnjVGeMpo
         eRBc0+y5WkbJlOWPBYyS0cck3ze69T6HNHIBlLCMoA6padOYlNQ/cthNvCxmx/WBvs3A
         +e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eMSAfBoLQ0nkN0ZKGmGU77y9Z7fvyyyAoaILUeYx9SE=;
        b=Oi+8OTqOCsjfLchVuecsqKAbT6UoICqE24O5gWuHTU2b5uONT07Bgc5X/XKBUdyZxI
         PElsQ57gPYKFuyPLTuf4RBFRThQ4f5ghV1LC92osug+9Taph88FG5F5R9PGlHkxbV/LF
         Y/t26oZPMcp9X1JwT2T5cxyFInUOvCmOGnNKfvEd1YeJaChJ+6SJKk4mr8vNE2tlLndb
         0EWeLSgHMJ0fUeeyVwKhPylITDRRn0efQ5EaGI4heznGuOCAfM5+1HMdwnxgOJkq6lxT
         T4Jog9SIQi2SDzM8iNvqSQ264ozqDypso9fHjacuJTe80ncDdV/fbMbBx/Cfh4UuZwB+
         BzPg==
X-Gm-Message-State: AOAM533PJb5ICgU0cLWusYcRvK65nR9K+da8sf49sf6tvfaYPwUMwl0n
	qLTkGnWfJ8dFiqP3QYywhwk2mM0rSSE=
X-Google-Smtp-Source: ABdhPJx5J1zhGW/FdshCcG+nUCiZqTD+P0OZz+9tyxBSvFThDsiSJb2FGgFd324UQ+NsHJHhoKazxg==
X-Received: by 2002:ad4:4572:: with SMTP id o18mr26704046qvu.204.1592258525786;
        Mon, 15 Jun 2020 15:02:05 -0700 (PDT)
Return-Path: <danismostlikely@gmail.com>
Received: from nebuchadnezzar.local ([2001:470:30f3:1:bafd:2698:c02f:136a])
        by smtp.gmail.com with ESMTPSA id 79sm12200056qkf.48.2020.06.15.15.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:02:05 -0700 (PDT)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danismostlikely@gmail.com>,
	Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 4/4] buildhistory-collect-srcrevs: sort directories
Date: Mon, 15 Jun 2020 16:01:43 -0600
Message-Id: <20200615220143.4018104-5-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615220143.4018104-1-danismostlikely@gmail.com>
References: <20200615220143.4018104-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

In order to allow consistent output of buildhistory-collect-srcrevs sort
the list of directories returned by os.walk. Otherwise the list of
SRCREVs is returned in an unspecified order.

We save the output of this command on build, so it creates smaller diffs
between builds.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 scripts/buildhistory-collect-srcrevs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index c4d203ff4d..340bee78bb 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -59,6 +59,7 @@ def main():
 
     all_srcrevs = collections.defaultdict(list)
     for root, dirs, files in os.walk(options.buildhistory_dir):
+        dirs.sort()
         if '.git' in dirs:
             dirs.remove('.git')
         for fn in files:
-- 
2.27.0

