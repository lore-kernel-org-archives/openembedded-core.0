Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web08.4389.1627076741556932975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jul 2021 14:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=I5e1kswO;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1344; q=dns/txt; s=iport;
  t=1627076741; x=1628286341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UWsB334+rejr45yoo/eC2yWsQOACBKsv5I1Bi6rF4+4=;
  b=I5e1kswOfQZVU6wWCwTFqYqqiAL5ifoYkXHNPUbl0pr+Rb/6gZykHZ0h
   lYZXIxE8gz2ovaIpaSFFMdpFzzEk0V5PLJvptst23haH4rNRyfArJLaXV
   1YfMTMJyiVlkr9oH5ic5T5zs7kKteGWp3O1DU0SxOGa9JdqoVWW8dU5lY
   E=;
X-IronPort-AV: E=Sophos;i="5.84,265,1620691200"; 
   d="scan'208";a="725692441"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 23 Jul 2021 21:45:40 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 16NLjehI011994
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 23 Jul 2021 21:45:40 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id 0E4DECC128E; Fri, 23 Jul 2021 14:45:40 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ruslan Babayev <fib@cisco.com>
Subject: [OE-core][dunfell][PATCH v2 2/3] qemu.inc: Add seccomp PACKAGECONFIG option
Date: Fri, 23 Jul 2021 14:45:26 -0700
Message-Id: <20210723214527.2225841-3-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <20210723214527.2225841-1-fib@cisco.com>
References: <20210723214527.2225841-1-fib@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

Add the seccomp PACKAGECONFIG option to allow building seccomp features
in QEMU. The libseccomp library is available in additional layers (e.g.
meta-security).

Additionally this serves as a way to disable seccomp by default to avoid
the configure of QEMU automatically finding it (via pkg-config) on the
build host when building qemu-system-native and auto enabling the
feature.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ruslan Babayev <fib@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8f927bdf54..e25c2524aa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -210,6 +210,7 @@ PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
 PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.26.2.Cisco

