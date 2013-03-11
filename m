Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fW-00007v-GL
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:41:56 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so4041345pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=vRbTxIxAjSQp3UvBsAfUK5PU2ZdwywqMZ6nKQzLq6js=;
	b=JY9Kixv3DeqoLNvdfYdgcJy5UMKewyt1UDf2FrzBG0y16jaMxFbdESyZAhMkEptHuz
	WNLY+smN8UF+wv+YBT0d+ypBno245qZRQq2dkUwD8yYizJkJGTh5cxcUoetLFmuxOfQx
	4bM2LRZHz0uKxSHaDThJyQfKZmSIUgp4A9asM4/dJH0oXqKVVnOGdSMFQEd4Jnb1y0kF
	xsOaiObcoRFPSy/lhTt8B6GH2hzAXb46txxMKuZIY26KVTXVUAqHhATTyl8y8grzg+HV
	QtVP5TKww7Q7mko3P6VCpkqOwn0S/FYQ/HlbWOD8b1kmu1EUiiZKja/vYPNVXpiH1ELH
	SQmg==
X-Received: by 10.68.42.9 with SMTP id j9mr30662404pbl.142.1363026311402;
	Mon, 11 Mar 2013 11:25:11 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:45 -0700
Message-Id: <ba851d0aa397becbc7778a3b5394e34a4ee1cb2b.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmCZdZ7Mymh3fF3e2yuDYGTPP1JyDPuxltItAArke7hp+zNDKsjq3sSt7tFC1tLhzfwm7dr
Subject: [PATCH 02/12] polkit: explicitly disable systemd if we're using consolekit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index ab2547b..342fbe1 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -12,8 +12,9 @@ PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
 
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
-PACKAGECONFIG[consolekit] = ",,,consolekit"
+# There is no --enable/--disable option for consolekit, so disable systemd to
+# force it.  ConsoleKit is accessed via DBus, so add it to RDEPENDS.
+PACKAGECONFIG[consolekit] = "--disable-systemd,,,consolekit"
 
 PR = "r9"
 
-- 
1.7.10.4



