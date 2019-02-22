Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34B857CBF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 15:19:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f14so2805543wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pGN3/c3QGHh6cjXHQF8MWQt6Jf1lrM+1TzwiXHJg2f8=;
	b=qkFboOrLB6uFq6/4b6dxeXROl3jODBe7XdUpHx1RIiSnfAcVi0TxzTMkX8Nef20JaI
	Ptan9gUWd599NRrgGk10hkA8k5pVHpQZk5KEO71FV9/WSo9SsSaSWcLUWFlTuIc0+aIp
	9JnKhz9FJ0rB86KoBD8NQel24S1+oabFF4Ue8o/mN05aBCVC+232jAhB2+3Pg+ZoK145
	WsVCXRMdxJUH4Gd0kZiUiMyqu7aM2RVB9C3NRLddQOEl+YXg72hQgocA0eBhufx0x9gA
	2zApHp2WvurcKxHYbUFKf0CeKVoRlkuZ92zbaqF9c7i3P8YgbKA7b0fTyRFrRQo8oDoX
	nPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pGN3/c3QGHh6cjXHQF8MWQt6Jf1lrM+1TzwiXHJg2f8=;
	b=uHKNdSXXosgJ2iptlqNmVXE1xiP/Vsd6E05b8fvvUSZll49+IV66UefAEmAyxp0HWH
	nmaWjVJtKWOars5G9GOYfIX/0ByB0bYVtb0q8aSgI/kEwaVTEYwGRUIkNdu5n7jtTlE7
	tKWSIAjeuLFxWjxbvTKKseZd0b+gUu9Ujrrg7s8/fhv6+tY9Rpp+aWWaTpKj7c4p2bSu
	a0p7O3Ge0h7CAYwdV3rlH5G0gYPeA06pcQSEPdT2WF0+7RtKEQm6XC3C1U4UEHeOfABP
	AQP4R6TrOwcVMyHAZHC2S52uMoC/kvMyGgTLTU2SOpmnnHJsOgxRTIPp/nyQZ9luVOXk
	XQqg==
X-Gm-Message-State: AHQUAuYiIx1k6znFyCRdnJOgFVRUyXA+SHJU5tQDKbygmZOn9U2Fc7hW
	N9dsLACE/2/tacFk/N/VCUUu0laG1Fc=
X-Google-Smtp-Source: AHgI3IaRLQS8Ppyv2piI6jLxtxmbxH+zUVrl9hNKIqhFV948uGuk/WFlMn1+XhTcKOccm9aOLbW79A==
X-Received: by 2002:adf:e949:: with SMTP id m9mr3574241wrn.1.1550848756606;
	Fri, 22 Feb 2019 07:19:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	p68sm1069848wmp.17.2019.02.22.07.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 07:19:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 16:19:08 +0100
Message-Id: <20190222151908.70732-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190222151908.70732-1-alex.kanavin@gmail.com>
References: <20190222151908.70732-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] lib/oe/package_manager.py: turn nativesdk postinst warnings into notes
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
X-List-Received-Date: Fri, 22 Feb 2019 15:19:16 -0000

The warnings deal with two specific cases of failure:
1) unable to execute nativesdk postinsts for mingw SDKs because
they need to be run under wine
2) unable to execute target postinsts when there is no qemu
usermode support for the target

Neither of these should be a big problem as mingw issue was never
found to problematic, and target postinsts deal with things that
are needed at runtime and not at build time which is the purpose
of SDKs.

The specific reason to do this is to reduce the amount of warnings
shown by the Yocto autobuilder, to zero eventually.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f5cd7454d7e..2835c1ddf8e 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -440,7 +440,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 continue
 
             if populate_sdk == 'host' and self.d.getVar('SDK_OS') == 'mingw32':
-                bb.warn("The postinstall intercept hook '%s' could not be executed due to missing wine support, details in %s/log.do_%s"
+                bb.note("The postinstall intercept hook '%s' could not be executed due to missing wine support, details in %s/log.do_%s"
                                 % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                 continue
 
@@ -455,7 +455,7 @@ class PackageManager(object, metaclass=ABCMeta):
                     bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                 elif populate_sdk == 'target':
                     if "qemuwrapper: qemu usermode is not supported" in e.output.decode("utf-8"):
-                        bb.warn("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"
+                        bb.note("The postinstall intercept hook '%s' could not be executed due to missing qemu usermode support, details in %s/log.do_%s"
                                 % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
                     else:
                         bb.fatal("The postinstall intercept hook '%s' failed, details in %s/log.do_%s" % (script, self.d.getVar('T'), self.d.getVar('BB_CURRENTTASK')))
-- 
2.17.1


