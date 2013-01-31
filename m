Received: from mail-qe0-f47.google.com ([209.85.128.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <geiseri@geiseri.com>) id 1U0z0c-0008GC-Rr
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 19:37:27 +0100
Received: by mail-qe0-f47.google.com with SMTP id 2so1404811qea.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 10:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=DtF0/ZTjCB9uwVxcgQCICy8oaQfXWqeDPIjR1qacA+Y=;
	b=f6K91ZmpmZwsCbFa/1z/xOnWJb8VYvR9x4XjdjIymZNqCm6ueRq9Jut1p9TC0iF6uU
	k+/JPffU7W+FJg+aCKSRFiP5/MNLZXIljOlMlH9r758u99eaAS0q9U3iSjtgUJb5JOis
	7CMPB9DAkND3EjyTlTXRkpG07APMlGaJ4tHvCffJDgc6YaaGb5mQKFoPw6Ve71mpnPdT
	9YmFGXT+6pUU18RjE2icV9EzUd4uBSrPbX9Ce66zZJuQU7F3h3TGfF/kqwYPTUnxx2tF
	zkdlcXQmSQCDaQLUOKeqzpQden0k32ILtYS9JJbFw1szoYe79JR9uHXVWTHiA75P/DHZ
	EvHw==
X-Received: by 10.224.195.133 with SMTP id ec5mr9931984qab.85.1359656491466;
	Thu, 31 Jan 2013 10:21:31 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPS id gw9sm4936810qab.10.2013.01.31.10.21.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 10:21:30 -0800 (PST)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2013 13:22:41 -0500
Message-Id: <1359656561-9968-1-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkKSPa8FM979xC6tlkQNgRqLLPuEeIi5dVNxnXW1d9mHALFdc8IW+cM9zCkgHFIlrrIMoWJ
Subject: [PATCH v4] mesa-dri: add extra dri drivers
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
X-List-Received-Date: Thu, 31 Jan 2013 18:37:41 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

 * By default enable only swrast.  This needs to
   be here or for some reason qemuarm tries to
   detect the intel dri libraries and fails.
 * For x86 and x86-64 explicitly set all of
   the supported drm drivers.

 builds properly with qemux86 qemuarm and qemux86-64

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 1f6ec78..e43150b 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -2,8 +2,8 @@ DEPENDS += "libdrm expat udev"
 X11_DEPS += "dri2proto"
 
 DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86 = ",i915,i965"
-DRIDRIVERS_append_x86-64 = ",i915,i965"
+DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
-- 
1.7.9.5



