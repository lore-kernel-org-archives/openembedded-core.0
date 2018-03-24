Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10C5F7888A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 04:55:23 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id f10so5174090pgs.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 21:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a9JZT2RUMkPukcu87kDVFozl0xon3OPxtnm0ZaR/Kec=;
	b=LiwLlYoXSxPF8IWNuIBDA9vCer33MF7V8LaykN6p0mJtlpH4wn/++PHYjS8lUZi+iE
	/Nd/5KMrgw6JMmBWC7wgUtcJFNjtxpCLFGccD4x1hVO5HdFfKaX2o4df9mrhKPrdKZ7y
	TsRYtiG6t5Blj8Gt+QEnZfaecsZKKB+oYfG88XcIjj0QOioW8Zc8mTl7ZGwekNAzIx1z
	DF3hJnod6HJQxOUJCLQBFD9Axo5MAmCW4rFJhHrf84pWSAKdxSP/j93jU8rvIxiRs1jY
	bjF1UIoCNmS3vb6peXrP7talWk1EQjs7A5v37DrC/EtG1tfRO1x4CZ42VNXjg29I+qIj
	mHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a9JZT2RUMkPukcu87kDVFozl0xon3OPxtnm0ZaR/Kec=;
	b=AoBnX0ZRfv5P5eVEzzFW2/VM0/c0KroajSAxFpaxAESa+oIFcdXNS7mQ6lhzPvmfCb
	FW00+AwiCyRZriilwQVcbSQlWYB1igCK4567Ih8EUzIZEIii8IpZlaiGrZy1nHJ7g9/x
	4i/OuJw8T71p6OFfxOYVH7cB7OMJ0Q3JyB+zeu+eBNufVpVP2UT/1z5PyejCvHJrWhWq
	ejineVoYtCEP8Alx7owOCyyN2OOmqlIvUtx8BuTV68x86SNiy20YBFaeqKOgfsktkPmM
	Uh3iv8g8Kosi0ulS/wf0G6xnllHanpvpZWZhtBAhAX4lw8Jx8G7C16wST4AuT3JwAvo7
	R7ag==
X-Gm-Message-State: AElRT7FhzEA/0pzEgY4pN966KtquHmtxvSWXLPBhYCwMiSb50LY1HjUz
	DOUf1WUO54FHx4jYfQS/s31pAw==
X-Google-Smtp-Source: AG47ELuKRyEz7ApYgATQclBhgvX6ANiRG/xs/0lOnNdCUVTHsu+F4uvu7bPMGCCTWQTd/+2MN8W82g==
X-Received: by 10.98.165.4 with SMTP id v4mr26332776pfm.51.1521867324897;
	Fri, 23 Mar 2018 21:55:24 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	t66sm20685699pgc.0.2018.03.23.21.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Mar 2018 21:55:23 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 21:55:14 -0700
Message-Id: <1521867314-1511-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521867314-1511-1-git-send-email-armccurdy@gmail.com>
References: <1521867314-1511-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] package.bbclass: use single quotes for path passed to file in isELF()
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
X-List-Received-Date: Sat, 24 Mar 2018 04:55:24 -0000

Apparently there are recipes in the wild which generate files with
filenames containing '$' characters - which cause errors during
packaging.

Instead of adding another special case to escape '$' characters when
constructing the command passed to oe.utils.getstatusoutput(), switch
to using single quotes to quote the path - and therefore make isELF()
consistent with the way filenames and paths are quoted by every other
caller of oe.utils.getstatusoutput() in oe-core.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 83f53a4..504c023 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -918,7 +918,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
-- 
1.9.1


