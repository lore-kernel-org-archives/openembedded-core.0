Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.228.1626377416068800117
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kGUlDNHu;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id t185so6325721qkd.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9F6Arbva3gIWnyhp0nYUCzDBzjSUVMgQ9ZD5O5LQrN4=;
        b=kGUlDNHuiyNRNfpQ0O//PPXrBjrp4seas/92zAnTeCCiMk+XiCOUpeEUrdbYwsANxx
         /l1uEdseTnqHr5hawdpvwSy1qt0xqgOsUxRbFWChG0BKd/SeS6wGbWbfqQgvfHcBLfxg
         ISD03gpMMzZv59HurKAuA6QfZ+kveVp6c1ZVErNwyDyL0EnW+fJGr6gYu+yF496JHoJM
         tK2xQCoos4a02tgmqU9gEkMIkp1NHOzsZJ5MCCsWTwYIJBBeHz1zlYpY0Z94/Q+urfag
         wHLdCFRwWQaedKV9zracwr1Bktm0YZd7lEQ4XpNnx77jfwoqH8tL7kENGgXxXzYUa2DM
         73vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9F6Arbva3gIWnyhp0nYUCzDBzjSUVMgQ9ZD5O5LQrN4=;
        b=MHI/L/8xPaZyPO71vHjvVOPFwrgI1nlrD+0BWB5XwWjxyVih6yBPBhDNWuLwygwMtg
         Po6Or1knQ+ggYRqmEyPUkYSSe3znSmKqzAcdG45Kq5v2u2E717Ukd5cP++oU26IQ/rAj
         CIaphLE0HkUX77+9bRKPCeIITqn4fY7ryXcjvtLhKTJ213+03EkFJMnTEKvgm7AIBBYN
         CrgBR6G1wBRwa7u5zt0hIJi506hY2b2x7QDNOvFQcLWnI4L53ppyipQwJC8Cd6QdaWlN
         G2vsjy7f2QJrtH0qyFr6v3r1kHhRPsSezGLRZpEIORtt5Sfh2K6OpYX9PFte3T7tDfyB
         Abnw==
X-Gm-Message-State: AOAM5330SfexxTnfcdwhknj3NuuG4Fz1oqwMtijywUWA2ZSNwroEDmp4
	ONxLgmJeAXwKY0p62vH9MW0=
X-Google-Smtp-Source: ABdhPJwKtqYZBdu8EmXgzc4Hbzw0CehDHadjW8vbo6mrKgspUtUzm3R1Sd7seHbgOzjrvZrYuPvGWQ==
X-Received: by 2002:ae9:f702:: with SMTP id s2mr5709726qkg.475.1626377415212;
        Thu, 15 Jul 2021 12:30:15 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f36sm2340670qtb.40.2021.07.15.12.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:30:14 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/5.13: add devupstream support
Date: Thu, 15 Jul 2021 15:30:05 -0400
Message-Id: <e61ea2b89a1919b8b61d3d3c4ee08252c2e7782c.1626377295.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626377295.git.bruce.ashfield@gmail.com>
References: <cover.1626377295.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We are always getting questions about building -stable, or mainline
master. Rather than introducing a separate set of recipes, we can
facilitate this sort of usecase by using the existing devupstream
bbclass support.

To build an unpatched or otherwise modifed -stable of 5.13, simply
set the linux-yocto preferred provider to:

  linux-yocto-upstream

and the PREFERRED_VERSION_linux-yocto-upstream to one with support.

And your wish will be granted, as the build will use v5.13/base
which matches the main linux-yocto version, simply with no extra
changes applied.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index 66384d8f7d..74699d03ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -25,6 +25,16 @@ SRCREV_machine_qemumips64 ?= "b74fe3dcca0653609fcb75aad883b1db07619081"
 SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
 SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
 
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+DEFAULT_PREFERENCE_class-devupstream = "-1"
+SRCREV_class-devupstream = "62fb9874f5da54fdb243003b386128037319b219"
+PN_class-devupstream = "linux-yocto-upstream"
+KBRANCH_class-devupstream = "v5.13/base"
+
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
 
-- 
2.19.1

