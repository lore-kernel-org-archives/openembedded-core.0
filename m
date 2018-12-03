Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5670C6C57A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 16:34:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y139so6517953wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 08:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Ao+lfe25arfG1xPlnPveryvUUIsHbWgQ1ajr9Q8Egys=;
	b=TkHEPpguyLwVWsqJPji9rwtzfROvExBRC2oVJ3IJoKUSR8TI3m5Z2jsT4yNA/n6iIw
	+soC0mgDYcvGLvm5AxSE9gFCHpOpKbwY0WjQ/HLWrnfXJIUVhKyR2/ArMFkNHFDwfB2b
	zs1boIFEQXp53k9ujZFdd/0JUAPOtT0U6xA48o8j18T+MSnud7FDf5oAo2cyiK86HnN6
	9fYpia2QpD+mM6Izmld//J1LM/o+xpAoWQJraJIr7t4ZT+KSfHwlBD4E2BIVAqEXD9ar
	pufrjprz8opoCPwM/bWmEXt52LtDz9KfZDfqGIRZgj8EH831+ww4mFTjiRh4O/ePGwFb
	b6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ao+lfe25arfG1xPlnPveryvUUIsHbWgQ1ajr9Q8Egys=;
	b=KBJwtuDUtHNklgBEnE/+fMRBJbYyRYfnNlI2EbGjARguD5/yvbiOSUZpKoNtSu7Lo4
	U0CtkWMzJvbkEXjowL+1Oq7ie54kGMdZDvIFGdQZu6IKWe0DU6PF5aJOdxJBB3eJ99UC
	IxSCt3nxxEfkxCQOoJFVIejy7/bRyJn2TL0aSEWPPYxJNnNGiU4MicUJ9CAU/gGLnVJ3
	lSd3AEVAxsSce+hc1ySlDk/YRtrOfDYPSKmMnKx9cAanPT0AHrytyJiJ2MS0hwzVhzuk
	Lxfxhb4PeurjDSys+D4WxWvaDT+b0GLR+q5Tt1hKCISR/73P4ns7gjpApq8g2c6ULPH4
	0Ubw==
X-Gm-Message-State: AA+aEWZh8THXlkZj0a3bs48g89pKO7kiKJNijO5MR1vHQJ6J5S4Q7Nbw
	WFFe7fSBeTCPnYtFQgpjsmI6r2Bmki0=
X-Google-Smtp-Source: AFSGD/UG0JPz4VLLgp3jppHLiP1Z6xB5n/u3XWSAOySbhQz9NNXGVTVHX5qKXQBxKyG/5Bsj/DA7YA==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr9291271wmg.51.1543854855739; 
	Mon, 03 Dec 2018 08:34:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j20sm6288372wme.20.2018.12.03.08.34.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 08:34:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 16:34:12 +0000
Message-Id: <20181203163412.25214-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] insane: clarify GNU_HASH warning
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
X-List-Received-Date: Mon, 03 Dec 2018 16:34:15 -0000

We have a fatal error if ELF objects don't have GNU_HASH segments don't don't
explain what the problem is.  At least give a hint to users by suggesting that
LDFLAGS wasn't passed to the compiler.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4644221bc6b..6718feb3af5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -383,7 +383,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
             sane = True
 
     if has_syms and not sane:
-        package_qa_add_message(messages, "ldflags", "No GNU_HASH in the elf binary: '%s'" % path)
+        package_qa_add_message(messages, "ldflags", "No GNU_HASH in the ELF binary %s, didn't pass LDFLAGS?" % path)
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
-- 
2.11.0


