Return-Path: <nandojve@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF787810C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 17:15:48 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id s18so325576qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NIgknkuEio0nVsVSKj9gXBApDYE53UH6IQa2JIhex4I=;
	b=l7J9EaGN/TD3IQKT1vhD80WbIFN+vit3QbxB6NRvrNtWKemSokpbOltCIsl0tmDh3C
	PFlZSXn4x4yILqM1CZ2krhP31fl3eJAdasRBdctcLgQnTzJUTmbFqXmSKx6+iVRwQ/Hn
	ntAwyEW8JTihXuR22seZmmk5AkRrU2h01O4KQrw/FNxqKzkW9eI7LEeLmTccVMiotFQ9
	jw2eBha8SuV/qVHgJ95xts29tsq+yU5pvI87XHTM7iZLoJWHkmnZKKWc7P7tQnZDSNMc
	9SJUIvz5lm1ZgFpvLxjU8gPtJ0GwM2xRKTSZyqHiZRfpqmLO4J3P+avtzrabD6CudSX+
	CgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NIgknkuEio0nVsVSKj9gXBApDYE53UH6IQa2JIhex4I=;
	b=I5/d/HCUxefoGFnQ4cfOrXgwvwn+MerRkSBJVRRqZUv+JvuHjD2Wv4toU7qyFCxqLg
	OAPAQp/tM7pmM5nNgooiGLtUZ8XOFH6dWAIxJ4ePQlm0blkeOAR5vx+dogQdiRS7pCYF
	Y3n2nQZFCLMFOTcxsW8p6HsYOvzauc1b//VKeE81+hAw8A2ctuEdzHNFHoI1p3MQtVJI
	r3sKE3cmOFDi19/a9/gZ9y4b76yXhoMUn+x4Q3+ZKOMCH79mUfaH08SzyJ8bLbGtHgMM
	xFTr9OKhk6UI2WOjXK+y5N9662m9V1xDZuRngYnpmHSsCp44HaDSOVa6saMWPmQQiQWG
	a/iQ==
X-Gm-Message-State: AHPjjUiTzUYfSTPz2uAmmv0lhLMO9aec7CXdL+zrGUJEHnrsb2DUD4PY
	hIpKAyQJ0ivmb4it9BKGJkKv6A==
X-Google-Smtp-Source: AOwi7QAxeGyXseoMffwNABRXIG3Ct30eJqDOcd+MC2dAYemYd88W11DL6NgBVsQlMinBWm/hTpJUHg==
X-Received: by 10.200.51.12 with SMTP id t12mr3030949qta.303.1505841349150;
	Tue, 19 Sep 2017 10:15:49 -0700 (PDT)
Received: from localhost.localdomain ([192.100.206.183])
	by smtp.gmail.com with ESMTPSA id
	m93sm4025034qte.96.2017.09.19.10.15.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 10:15:48 -0700 (PDT)
From: Gerson Fernando Budke <nandojve@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 14:15:36 -0300
Message-Id: <1505841336-6415-1-git-send-email-nandojve@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] image.bbclass: Sorted ctypes to avoid basehash error
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
X-List-Received-Date: Tue, 19 Sep 2017 17:15:48 -0000

When selected multiple subimages a similar error could happend:
  Variable do_image_cpio[subimages] value changed \
    from 'cpio.gz.u-boot cpio.gz' to 'cpio.gz cpio.gz.u-boot'
To avoid this, 'ctypes' should be sorted at 'gen_conversion_cmds'.

This garantee that 'CONVERSION_CMD_xxx' are always written in tha same
order and consequently 'do_image_cpio' have the same hash.

Signed-off-by: Gerson Fernando Budke <nandojve@gmail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3639aa4..bef634b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -452,7 +452,7 @@ python () {
 
         rm_tmp_images = set()
         def gen_conversion_cmds(bt):
-            for ctype in ctypes:
+            for ctype in sorted(ctypes):
                 if bt.endswith("." + ctype):
                     type = bt[0:-len(ctype) - 1]
                     if type.startswith("debugfs_"):
-- 
2.7.4


