Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2779078493
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:53:41 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id w2so4028200ywa.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tK9CWjcII7SoJu0V2lJH9I81EDE4TCLuGslrZKT+V2w=;
	b=bzTOdmkBdWJQ7IYTpdc+FAMuMo0/L+mRH9kiF2t/v4zQ1wYtxWY7sNBmhqE7BIqLTe
	5TGMuAnyk0ei6PE+pzSnBhsGPElBaXoAr9LbB+8pX182AxN68Ryhrs0CSyq9UFPFG/dq
	yMGoQu2rlB4WXnf+I9kbLeA/X2PaLH56v7aRJVlE49AiYIOizQYso4lFRc2wRiPP/PBe
	S3hVTDWKcEjrEvtJunztGRELkyoe2DRwfD9h2gGGOiZLXWPhDVLPhukP7K2uuhhFPTUy
	sZF3MKStwHTUVo8OXtvqdK9Pdhh7xFN5mujDk873in0rtempwmCz1CXwmNHZPa7eBcmi
	Jt6Q==
X-Gm-Message-State: AJaThX6MXeersYsS/GkFPMStjdrBek4r5HXdgwup8lm9HbFxqVfh4tNJ
	S/8Zc+vmjxXsiosBa3+fthu3
X-Google-Smtp-Source: ABhQp+Qb4FdMyqFwzCY51KvTcwu/F0HtqPmF4iJbU1EA+t/nH9jtOoYIqoYVoUUuAL5idbBOWtASLA==
X-Received: by 10.129.182.102 with SMTP id h38mr1709007ywk.175.1510192422921; 
	Wed, 08 Nov 2017 17:53:42 -0800 (PST)
Received: from opus.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	h26sm2850736ywk.67.2017.11.08.17.53.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Nov 2017 17:53:42 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 20:53:30 -0500
Message-Id: <1510192412-5065-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510192412-5065-1-git-send-email-trini@konsulko.com>
References: <1510192412-5065-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 1/3] wic: kparser.py: Check for SquashFS and use-uuid
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
X-List-Received-Date: Thu, 09 Nov 2017 01:53:42 -0000

The SquashFS filesystem does not support UUIDs so make this combination
be an error.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 scripts/lib/wic/ksparser.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7850e81d2f37..4fb6868531df 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -195,6 +195,11 @@ class KickStart():
                         raise KickStartError('%s:%d: %s' % \
                                              (confpath, lineno, err))
                     if line.startswith('part'):
+                        # SquashFS does not support UUID
+                        if parsed.fstype == 'squashfs' and parsed.use_uuid:
+                            err = "%s:%d: SquashFS does not support UUID" \
+                                  % (confpath, lineno)
+                            raise KickStartError(err)
                         # using ArgumentParser one cannot easily tell if option
                         # was passed as argument, if said option has a default
                         # value; --overhead-factor/--extra-space cannot be used
-- 
2.7.4


