Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3237CCFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:37:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m1so9313722wml.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=70Zd+Q0mnIQ9u84JoPJieF2nCJ7heqxCkg5BjLbffbY=;
	b=JaxuttxyHmhRlRTYj7AzLH/BwOyY2HnS7smx4eaCD3KCXJCe1E9AOWJBKU0l+Myc4d
	7NirK6GFgnr6eS7W/6d2lr8qY79/WiQ+S+ufgs4I26D2b4uvj9wbLhpTnTsc/tj6oBse
	tDTw0wBfx0/qpqaIJFSgN6Z7Z9rdfnTJK2dbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=70Zd+Q0mnIQ9u84JoPJieF2nCJ7heqxCkg5BjLbffbY=;
	b=CRgUvcHK+pzvyow+jZmt5WTnfSlndOmCPVulhf8k8TFLZPxWrhWA1Hnr8sFxN10h96
	itQwSHP2meyd5OfOUl+Vw9ZRelLuQLRnOov+66qMz+Zt642eFXhONbu6XrS0D4LtCiE2
	TMfB+WQZeZO6bhqSBleVXM0Fci0KLGZnRhUOlAU1UvFf+aMsY2k+fGtDChDtnnQoCBll
	fCZxTDn3Nc3tbSRyUDG19cTg9zdNXZcvf2Pw6IxyvWEGE2iP+rH0DctC0QsWRPBGv5Mk
	Y1Law/7MevOoXEhcAfDIfHk+PkAcH5OkYtPeffSUqjrcYnnAl27F6LHvRUQ6PaKPAlMw
	JJyQ==
X-Gm-Message-State: APjAAAUBJQ+I7q6IZ27Q5FIMOLv2kAUQ7TSFYiw9gOeYemrodCmz4J9q
	7Ua8OONubw/ond+H4ok90z8TeLfncOs=
X-Google-Smtp-Source: AHgI3IY0w7Pgn98sRllbOSh6BbEcx6mLn2lzGfS/E+uqk651p6c1T4tS0EcDnAhMalDgk52GODrgfQ==
X-Received: by 2002:a7b:c352:: with SMTP id l18mr2849193wmj.127.1551361026506; 
	Thu, 28 Feb 2019 05:37:06 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k203sm4461214wmf.44.2019.02.28.05.37.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:37:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 13:37:02 +0000
Message-Id: <20190228133702.22445-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228133702.22445-1-richard.purdie@linuxfoundation.org>
References: <20190228133702.22445-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa/utils/metadata: Add commit_count to fallback logic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2019 13:37:06 -0000
Content-Transfer-Encoding: 8bit

Currently if python3-git isn't installed we can get odd behaviours when the
commit_count is absent. Avoid this set of bugs by adding a fallback here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/metadata.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index b7def772240..70a27569f26 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -72,8 +72,10 @@ def git_rev_info(path):
             info['commit'] = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=path).decode('utf-8').strip()
         except subprocess.CalledProcessError:
             pass
-        return info
-
+        try:
+            info['commit_count'] = int(subprocess.check_output(["git", "rev-list", "--count", "HEAD"], cwd=path).decode('utf-8').strip())
+        except subprocess.CalledProcessError:
+            pass
     try:
         repo = Repo(path, search_parent_directories=True)
     except (InvalidGitRepositoryError, NoSuchPathError):
-- 
2.20.1


