Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id C4AFD7FCEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 15:21:18 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id x129so7887948qke.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 07:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nZ1du9hf4CAOSaEgUqDZGkk7BzOiu+QBUsE/CyiVWrg=;
	b=c6fvGH9w5DUJhCatmUehC3smPqCGrZmx7xplC2Q6zsesoYznfAT3rtDaRhugDbaFa2
	NqW4kpw+jkJehZWtVv5DFVObeheEKr06fFYYViDAd+89SXa9WIVPKezUQfPtvaW7Vswb
	teXkvhMLBLPBVrfBSEW9B5Bjeig/Htj4wE+uQEEE4KfPzt43EAm32fREqB9v1dej/7wk
	z3TU2zYtnkXNWqrw3E6b6zATmzNH+D223A/4/L1cKhYmj66Ia6KXT19aY1/PHDGQRpWx
	JrAiL9XefH0rTWwEWsbspVEN/vJJD9L8wAxebGSiH4sEH/RvhNp+5wH8CooYcW7tVBTi
	3YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nZ1du9hf4CAOSaEgUqDZGkk7BzOiu+QBUsE/CyiVWrg=;
	b=m5n0mwfIUyCa9vyyYbOlYhJrm6qbnzzTRM3QLBWcTc+lOmvlplu9EEcqCoRhnteYN5
	Y0lPCzSBx7leUn1s3/9C9ASg+StD5SQ20y3Ftb3Yo6YDGqdgO4iJTp7PDgb5CbMVIxZc
	xMRxfrdo/GeOXD0n0PqBLA5F6VhLmBKDVCdbjXCdJflTcN06VwmE/eyPBmdBZJbUjzIj
	2sqF08cenIvw3uecnDx0CdyRx7y0sn+gBcnqK7TI2I+T81Vkp3AiuuEADh2GDZ9GTash
	UiyZ1ytt62KfplINfi0e+JVD/qCZ42smvenaezU1k+hQwYS+1XUpGMiJPDB4NoggyvNk
	AHsA==
X-Gm-Message-State: APjAAAXKFbceXtyh1e5jlaEgRux3xBsjU8DGZu1ZISt4culyEHOJ49jG
	zikZIG3cGyL4yF/aVThAw4hiFJBSvNFPLg==
X-Google-Smtp-Source: APXvYqyhZzwKQnzo0QtQpfXm/OhTF2/TMu+2eAina/W3oUPjvQv8hHvuAp2GWmvG71qhJfYkBIy+sw==
X-Received: by 2002:a05:620a:13e3:: with SMTP id
	h3mr13599271qkl.319.1576855279449; 
	Fri, 20 Dec 2019 07:21:19 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	u52sm3256776qta.23.2019.12.20.07.21.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 07:21:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 20 Dec 2019 10:21:16 -0500
Message-Id: <20191220152117.49850-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-yocto: allow external (aka non-integrated) BSPs to supply patches
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
X-List-Received-Date: Fri, 20 Dec 2019 15:21:19 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

By default, only explicitly specified .scc files or patches are applied
to a BSP as part of the patching phase. This allows the reference BSPs
to be integrated into a kernel tree, and use the same meta data for tree
generation and for runtime building. It also greatly simplies the
processing of kernel meta data.

That being said, if an external (and fully standalone) kmeta repository
is used, it very well may contain both patches and configuration. To
allow the BSP definition to supply patches and config, we introduce a
new kernel meta data definition:

  define KMETA_EXTERNAL_BSP t

This can be set in any .scc file that wants to specify both patches
and configuration.

If specifying this per-BSP is not desired, a secondary variable is
used:

  KMETA_EXTERNAL_BSPS

When that is set in a bbappend, any located BSP definitions will be used
for both patches and configuration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This was reported (and tested) by Joshua Watt. I'll send documentation
updates in a separate patch.

Bruce

 meta/classes/kernel-yocto.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6537cdf416..7f561f4842 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -220,6 +220,14 @@ do_kernel_metadata() {
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
 		fi
+
+		# if the bsp definition has "define KMETA_EXTERNAL_BSP t",
+		# then we need to set a flag that will instruct the next
+		# steps to use the BSP as both configuration and patches.
+		grep -q KMETA_EXTERNAL_BSP $bsp_definition
+		if [ $? -eq 0 ]; then
+		    KMETA_EXTERNAL_BSPS="t"
+		fi
 	fi
 	meta_dir=$(kgit --meta)
 
@@ -233,6 +241,13 @@ do_kernel_metadata() {
 		fi
 	fi
 
+	# if KMETA_EXTERNAL_BSPS has been set, or it has been detected from
+	# the bsp definition, then we inject the bsp_definition into the
+	# patch phase below.  we'll piggy back on the sccs variable.
+	if [ -n "${KMETA_EXTERNAL_BSPS}" ]; then
+		sccs="${bsp_definition} ${sccs}"
+	fi
+
 	# run2: only generate patches for elements that have been passed on the SRC_URI
 	elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
-- 
2.19.1


