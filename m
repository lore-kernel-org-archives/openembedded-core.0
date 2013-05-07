Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZlhV-0004U1-Uz
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:29:23 +0200
Received: by mail-wi0-f182.google.com with SMTP id m6so910033wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 10:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=PK1PBc3lYxna3fl2vGpI3wU5LTCoq/tt6sVzdu//eUk=;
	b=ZTrGD8iORpi4nu7s/SL/rsr3IXvFvIGK0fOlvQqX09SLLTctp6eUWZZ+9QPGfJacZO
	4d/sB5uCoxLQf7/YJrw+wfK1ZNcQ/xW0vdfHvZZdS0UDfb2h+vQ8PnevC78geAeiQ0W8
	bjNflL8LJoeoURfiuOBQpx6x/I5v/UkT8aqFkDapDUUFZwzA+tHbOe5/oDUn9KHy9H5y
	LaVcY0TK2wbl9MLG9TCG9zGqpf8Fcc6zgW8tFUQ76Tbtyd9O4T19OXTGezlwtQODxnvH
	c8omYqG894tmJhnOybEg5FQhTO7tgbvIW9cmtbtzTnB4BDhxKUjzhmpw0wNMBUQySvVv
	oCkA==
X-Received: by 10.180.188.141 with SMTP id ga13mr16407905wic.9.1367946674590; 
	Tue, 07 May 2013 10:11:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id a4sm4351915wic.5.2013.05.07.10.11.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 May 2013 10:11:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 18:08:10 +0100
Message-Id: <1367946490-9159-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQl7Ke02SVyPGJOzbXmX+ztAykZDDKbf8v014SjNAGZMntBtgN4pEHjsmmlYJF+DlgrwuiLJ
Cc: dvhart@linux.intel.com
Subject: [PATCH] qemux86: disable paravirt guest in linux 3.4, causes test failures
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
X-List-Received-Date: Tue, 07 May 2013 17:29:23 -0000

The shutdown sanity test that we previously saw on qemux86-64 in 2.6.37 have
started to re-appear reproducably on qemux86 in 3.4 in the Danny series.  Until
this can be root-caused and fixed in the kernel, disable paravirtualisation
across all kernels and all qemu machines.

[ YOCTO #4196 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index b81b9ac..18d665a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -26,5 +26,4 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4



