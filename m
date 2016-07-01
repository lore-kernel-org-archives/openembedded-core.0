Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id E48F460111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 13:54:00 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id g127so8291849ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Np2fgnv5uUsFWmth0LjtLpbRXW1Yl1nTWaoISD2j2EA=;
	b=yCGNsnhldlo6w0nWWZ2hfLQAvsBHM/Oz2K7axcZbvVmvvNdgHMGPpsHdPeazICddzW
	eDmlr19xhWxYy949zrbz0CyE86g+ea7JBeo6qBb4TOOKmj+vqv0xkdp5z3wqOx2nbx/Q
	8FIRg0PpJbaLt52fFGpywf1v48DjJqHidRy1xJROp+2+NaqJRIqVcxph/Dl9Wzzk5KXs
	wSxfL1l51W821owfdeGIHNusKuH3X+1F6EfAKVJs+m/irpcYs9u2ODEdt6QjXuYP2uhj
	rwDjsYa/mGBpEcUDrPMzumqE37q1+yfdIWPL08f4sp5xM41DD+D5KiaJg+qeyGBCJAZI
	Oc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Np2fgnv5uUsFWmth0LjtLpbRXW1Yl1nTWaoISD2j2EA=;
	b=QjDvBUsiMRdOxhZtB/wYK+RG5hPMCquEj+PBOhWmeGf+MuOevM2Qd15ks4NvmfbQw3
	1fsc+KfZCkTFPTvnLLfBcDI3E+OwdDCez9T0AHgYHrz+lq6eZnqIqPBw+a8Tb8DTYq2v
	hHvXUgxHsxUuAx32fP0OXI+5FrkbfWDpb4SlXUjyDCGUfbRWxed7Ke88X+Y9Ke/a3PSR
	Hk9slMFskGQbW4iGolOma0qp+uJkFu9f2kPG78uGYROjihORtx2k4tlUDeF44uhSbnYJ
	Mil1E1NH4NYWwD+FcynKB/Pzs+zA7LS9JryLgbti4enqxhX0QqD9sThM9e5joBiTBpUv
	fNOA==
X-Gm-Message-State: ALyK8tJ8BYZ05OEja6bwwHMGFM7Mpd+0oqv5J8jFj++GpnUIV+RS7h3/17xG04WhTlX4qLQB
X-Received: by 10.36.124.131 with SMTP id a125mr16718037itd.13.1467381241729; 
	Fri, 01 Jul 2016 06:54:01 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56DC4.dip0.t-ipconnect.de.
	[87.165.109.196])
	by smtp.gmail.com with ESMTPSA id f85sm2066194ita.6.2016.07.01.06.54.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 06:54:01 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 15:53:52 +0200
Message-Id: <9346b010f3e35d0306082ff8d16cf59cdbdd55cf.1467378176.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
References: <25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1467378176.git.patrick.ohly@intel.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
Cc: Igor Stoppa <igor.stoppa@intel.com>
Subject: [PATCH 2/2] meta-ostro-fixes: initramfs-framework: Add support for PartUUIDs
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
X-List-Received-Date: Fri, 01 Jul 2016 13:54:01 -0000

From: Igor Stoppa <igor.stoppa@intel.com>

The rootfs can be addressed also by referring to the PartUUID
value from the GPT.
This patch enables such type of reference.

Signed-off-by: Igor Stoppa <igor.stoppa@intel.com>
Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 5790d8c..14768f1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -26,6 +26,11 @@ rootfs_run() {
 				bootparam_root="/dev/disk/by-uuid/$root_uuid"
 			fi
 
+			if [ "`echo ${bootparam_root} | cut -c1-9`" = "PARTUUID=" ]; then
+				root_uuid=`echo $bootparam_root | cut -c10-`
+				bootparam_root="/dev/disk/by-partuuid/$root_uuid"
+			fi
+
 			if [ -e "$bootparam_root" ]; then
 				flags=""
 				if [ -n "$bootparam_ro" ] && ! echo "$bootparam_rootflags" | grep -w -q "ro"; then
-- 
2.1.4


