Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0612161773
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:16:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id t14so3200953wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 12:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RP2pd3gamMebfWwgHAWUOTis5uFzOGKjA/DXgWrfhQ0=;
	b=BbTZo9UN7/Fp1ebWqjbRDSqV/DZeWCl9OGW9JYxx5pBpqILE8YbYxJhDn9rrrjmFOE
	iStNnJLhTIx0n9ES8Z8fIcndNv6217YYdY1dg/IPmEma33Aeo3V9dce0Hs0y3BbKPYPH
	1an6kWNnz7z6bl0m8u/nIzMZeih0a48Gg9p6p6j+xMXYCMfK+0VPgwRDjyEp0m5NMAXJ
	hWQeXkwd1jmFFu18z0MGmQC+Xvf9ZIQP9rIamQc7wb/Lyd54F8KO97WJI+4AbonsUhN8
	AwSSK437Wpx+Z0aHXOptNQyXpUpLCZNz87auC4yMOOB4vz6azjIoXG97geJAa5zFt4Zf
	4TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RP2pd3gamMebfWwgHAWUOTis5uFzOGKjA/DXgWrfhQ0=;
	b=MEv52CsQ8yneU63GA94D+b94DiVNjHcDxCIiXzrjaeksZJtDH3YU4A36jrwIIH1qlM
	aCWR56Mvw73MFNhn7CdWgalS9uhdeioRduk922teX5peiOd/+zKzMiDCVM+SsD/9u2SA
	rRyM2AHi7kLHCTBQy4h3evBxr/aaAKCEOiVI27zUofp5kv6MEYuC9BAzc3oaWS84K+n4
	DpFkUn+ATuM2+GPCMvK9JCchO8z1fCHVr7fS+4BMYa2YL/4jfbq8Yg/MMhX8C4lSFytr
	5cXtv4w/jFHHDuUBTu4YbR7Ftc0TiSeIVb4f1IAnUphJ9ZC7Wla9sjO8DQvGBhmQSwS0
	cGBw==
X-Gm-Message-State: APjAAAXnft505rrHZJHT5M7yM7epSefO1Kep63L0C2JrChymV/1u3J+3
	QMuG1bmA3XhwURPDc1Amu/KZ8r54
X-Google-Smtp-Source: APXvYqyHJRS2MmZ7/tSPUAxQHvWFI0yAeVVV9eHUoZyv9JjDIad3AvrBZZ3UqkAyBT3nW+1UElS9kw==
X-Received: by 2002:a1c:dc08:: with SMTP id t8mr5465906wmg.139.1582316191187; 
	Fri, 21 Feb 2020 12:16:31 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	o77sm5531431wme.34.2020.02.21.12.16.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 12:16:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 21:15:43 +0100
Message-Id: <20200221201543.4364-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221201543.4364-1-alex.kanavin@gmail.com>
References: <20200221201543.4364-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/logparser: correctly set test result markers
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
X-List-Received-Date: Fri, 21 Feb 2020 20:16:31 -0000
Content-Transfer-Encoding: 8bit

I spotted this by noticing ptests started to unexpectedly pass,
which shouldn't happen yet.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/utils/logparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 5403721073..60e16d500e 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -26,7 +26,7 @@ class PtestParser(object):
         section_regex['timeout'] = re.compile(r"^TIMEOUT: .*/(.+)/ptest")
 
         # Cache markers so we don't take the re.search() hit all the time.
-        markers = ("PASSED", "FAILED", "SKIPPED", "BEGIN:", "END:", "DURATION:", "ERROR: Exit", "TIMEOUT:")
+        markers = ("PASS:", "FAIL:", "SKIP:", "BEGIN:", "END:", "DURATION:", "ERROR: Exit", "TIMEOUT:")
 
         def newsection():
             return { 'name': "No-section", 'log': [] }
-- 
2.25.0


