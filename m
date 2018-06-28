Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 16B837469C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 11:26:42 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id c13-v6so5137683wrq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=c12lPprtV3oWrwOAqV8wJ+pH4wkBbh+tti4VKJo1QD0=;
	b=HOIBRP0j5+7cnY2eLVP0iIxLjGSIS1+UAg1B56nlKEGbdWA+IIhJrSDemjzDPzHmgA
	Kwa4uxMY1gMieEgnV2Dw8gJjDeBEDav9ySm/rOa4BzLA3F03drQFTe2lTbcHptPZNsLY
	3GkV4WR/4hrLcEioK9UzwOqQzBg4CBi3i4uKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=c12lPprtV3oWrwOAqV8wJ+pH4wkBbh+tti4VKJo1QD0=;
	b=XlA/gjsu86jgSsoD1WnfRtGZh94+/dwywo4BkDymsDnBRdFKy3wmmzqW6+HqxJyngZ
	55jCg9P2JFnU5HLIs9/nEpfzH/p97ELWlvwJxjAz+hgfJS5pLTeKMgTXJW4qsIKhVvvi
	yKSK8ko8WcBq50yvcPSXZSC1M9zsnC5YmQUnj4hCwaZAV0XaYQ1TkrAJwJM8JAF2duyX
	/odbHB80cy0kXlnwlGli3nwV8otTTVmwhdyUXSPAasZyeVdHhObq3XH2wt+4olchZDUX
	ru0TxexS9gwIQWEvN/uy4YJnY0lGMVAJE7zITVUy1qCerM2ga+Z5Qzhwnn+LRO/4aTIs
	mW2Q==
X-Gm-Message-State: APt69E0SDW8yjk/eXokmHjbSuHIWyQGIhbd0d1TIodEZpqz5CbGUgT8m
	K0QFlaa4vvrJjzm++sH8faEy0QLoiG0=
X-Google-Smtp-Source: AAOMgpfdYsDBhtU56rG72+NRryS0dEgR1LTgviapvvmI1Av+n76bLjrfwVEhvnO+Rs7KvdC9unwGTQ==
X-Received: by 2002:adf:fd4c:: with SMTP id
	h12-v6mr6367075wrs.280.1530185203429; 
	Thu, 28 Jun 2018 04:26:43 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s184-v6sm7462379wmf.5.2018.06.28.04.26.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Jun 2018 04:26:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 12:26:41 +0100
Message-Id: <20180628112641.15674-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bitbake.conf: Allow BBINCLUDED to be unset
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
X-List-Received-Date: Thu, 28 Jun 2018 11:26:43 -0000

For some reason the layer index is expanding HOSTTOOLS before BBINCLUDED is
set so recent changes break it. This adds in a simple workaround to stop it b
reaking allowing the index to function correctly again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fbf5669dddf..8f738545995 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -487,7 +487,7 @@ HOSTTOOLS += " \
 "
 
 # Tools needed to run testimage runtime image testing
-HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in d.getVar("BBINCLUDED") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
+HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
-- 
2.17.1


