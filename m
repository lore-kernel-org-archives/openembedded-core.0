Return-Path: <jpuhlman@gmail.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0322561170
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:04:53 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q65so4085760oif.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7+5m7h4iMSVVMcIh9OhzH5RZnFD6DctznfDrFCRS5v0=;
	b=XLXztLdZGHKTphLgUvenjRfWwxBPKc8aa8Z2QEnNTwnYm3Tm1MJqQoMKy4TEY4rFqM
	dDcG4DaPXZNrEloebNN8NOEza2S2rPwxf7w7jUzb23Jsn3NbeGdFnlNlCqxf5/djALIZ
	d7dyGPEkvJNwd34+EVjTd+3T74hg5giFdZrAttuH6eHyCv7KcUtdm98P7lM7zh9f9HzC
	GID0HlEDCleZrVYmm/60DrVyJYVj31/RRvh4NteqW5qSR7SepGuGvlSQJOFvZPF5BRsn
	2hhAPlP6av40bibqpvoTD2PPC/uDTcevydILayPiBLXpSR/zLDb54UTbaVs7muwSlsIR
	PAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=7+5m7h4iMSVVMcIh9OhzH5RZnFD6DctznfDrFCRS5v0=;
	b=Ttl0Zhkfl9w0QDwYKWChZ96ve9FLBE5oKMH7e1R6vLCW/pEZZ9sOHho5b7Y0qHxlk9
	URwUirnrSeX4IQLFMzR9uxCj+3oNJaeGzioCW+63pc/nn1Krr85V7bNzAAnIlagQqOmw
	3DmbisXke+A7D6AX696/86Sg5k3ekwV11A7m7RjrlsHZdb8ePOhiD8tZcWHhXxu9HVXs
	2UK8bwbV5pwbu2qjrQmcV9wlrvikthsGAJlriWlkybeXa5MaZUY2o7wYcswZtiPDN1p/
	CURVxDx9bUI2P9XzzANZpIaESBS85zwBSE6KEaE95IGBAYmxtBBcNdRGKOlCQSy8YJcd
	JNsg==
X-Gm-Message-State: ANhLgQ2PamB+3E0XuI1I09xA49C0RW43p7H3Sv3N2QR4ah04cVqoT+Dz
	JVSj35elTdSZZhDbiBCxQSrLtv+d9F0=
X-Google-Smtp-Source: ADFU+vs79+3xZ6acdIiD497RyjEe4vkriL2omy2xiN2uhUsOP6RrZxjkZqvO6E7jpFkPls8TI6/IVg==
X-Received: by 2002:aca:4cd8:: with SMTP id z207mr3417187oia.155.1583366694425;
	Wed, 04 Mar 2020 16:04:54 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	g17sm7497695otg.55.2020.03.04.16.04.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 16:04:52 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 6EC902A07BB; Wed,  4 Mar 2020 16:04:51 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 16:04:49 -0800
Message-Id: <20200305000449.6207-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gdbm: add depend on readline for consistent builds
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
X-List-Received-Date: Thu, 05 Mar 2020 00:04:54 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Whether readline is installed on the build host or not
influences the way gdbm builds. Depend on readline for
a consistent build.

This fails to build on a system with readline, and using
the buildtools-extended installer.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 7e2efe3c9b..5326184181 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
 
 inherit autotools gettext texinfo lib_package ptest
 
+DEPENDS_class-native += "readline"
+
 # Needed for dbm python module
 EXTRA_OECONF = "-enable-libgdbm-compat"
 
-- 
2.20.1


