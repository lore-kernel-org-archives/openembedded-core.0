Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9H9-0002tN-0K
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:24:54 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so4118532pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=b+Z6pOfgBr9GY+ohVEp0e0OMMVOi8GkEL3tVD9IfXZA=;
	b=d7gsf+7Nqm9xFA4kjfyVcKsD6arrrD1H9cVMeCKlDKpu5AiOypFMHl++OB7lBYCYoZ
	C5zQzFb0QEE91I6EnId7ykoZUIuMBFq7bGXXp8VyWVibH/DsXwnUYEglOIuE9/T8K1Et
	M4DwHA+ZorfRrWtUwjcUYE5ugUMicVxlLXnowBsDw5yPrF72Ardw1dmMQrBzA3dv7RZq
	XFUDdBsnu+XB/zHkG9gVr3i2yjlsTSHaGBc6pwH2NgRXimkNS6R6peR2GHQgPLgD0gEi
	IhqbCcajYMEde6zIExypTzlbRLP0d0n/q5W1KNmLoIADsrVUq/NzTFqoh0WDzcY8xaL0
	2wsw==
X-Received: by 10.68.196.168 with SMTP id in8mr30684582pbc.61.1363032490441;
	Mon, 11 Mar 2013 13:08:10 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.08.09
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:08:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:34 -0700
Message-Id: <d27c2a42e86fbdb9869cbcd8e7d2dd6edf66db1b.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
In-Reply-To: <cover.1363031776.git.ross.burton@intel.com>
References: <cover.1363031776.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn33PpFErzb3Zn+HvbgRbMQEDi75KTxEWFC8KfdnkuNJgj0qloIR6+LlpU82pqJJOMkaAwr
Subject: [PATCH 4/9] default-providers: change udev selection logic
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
X-List-Received-Date: Mon, 11 Mar 2013 20:25:03 -0000

Change the logic so that the udev provider is the standalone udev, unless the
systemd DISTRO_FEATURE is set.  This is required so that hybrid distros with
both sysvinit and systemd will have a usable provider (in this case, systemd's
udev).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ebf2a09..f7ee789 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -38,4 +38,4 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
-PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','sysvinit','udev','',d)}${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
-- 
1.7.10.4



