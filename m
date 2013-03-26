Received: from mail-we0-f174.google.com ([74.125.82.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXO1-00076w-6y
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:15 +0100
Received: by mail-we0-f174.google.com with SMTP id u12so555581wey.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=aIRwDtBGdjgBAl/snTeM3gq2P14p2DSAtQgwYSzRDF0=;
	b=ag0hFPP0oBfU6mDb1jLbE+nMeT26K2BE2RjGaCTkZjH9F5nbAoOOef68I3LbBfDF0x
	MHqooaA3LVrIU9JoGyq7OHibmzxGFFVeTh+F3d+56BTdGDEa/Ar1Im5kcod8/AW6+6z4
	2H8Nn871qjZy3V3dO/QJm45qoduH1G2FmsUW5UiMQCu0SyMpSxXANpSnJPUT3r2mE12y
	4lwVBf06OVJ3oV9kvSBcB1PA4uDpvI2Ar4cVrQ8Oza7OOSFQDTcMKxOl7WlSc6WbLEtd
	hqNGtnHHbVfnsqiZbliUBsXWwUQnA9DoxJg9Zhsw4c4MEhAqG4qjPI9rNhBfKbl1s83q
	M5Yw==
X-Received: by 10.180.108.3 with SMTP id hg3mr4452976wib.33.1364316793582;
	Tue, 26 Mar 2013 09:53:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:06 +0000
Message-Id: <bb1beda34324068fdf9118a37bed4601342b87cb.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmQXECyHuhwz4D0Z88ybpdCHyFraDNjekZCdCcvCKqkTqwDg51TAOkmMP2qexQiup9R/efG
Subject: [PATCH 08/24] default-providers: change udev selection logic
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:18 -0000

Change the logic so that the udev provider is the standalone udev, unless the
systemd DISTRO_FEATURE is set.  The previous logic was designed to fail if both
sysvinit and systemd were enabled, which we're supporting now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 39ce7cc..e3a44e6 100644
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



