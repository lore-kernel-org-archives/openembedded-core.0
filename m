Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TJAiF-0003xK-Uf
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 00:13:12 +0200
Received: by padfa11 with SMTP id fa11so5719763pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 15:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=ZTWUfCPP/b5h5pfM0IJ1sgvCtKBYnze+UagQ2DKbKGA=;
	b=OoD8mJ4J067ixkto+uRkN13EsI3yX4Ehl0BT9zGYfGF5SlDM93C9hWbl9wS7n7zP1Z
	MCdHFEGld1KMRjsoA2q9AJwdn5EgixFPth4bp7xn/1YXqjgQKkW++MRw8jAUBGse2Mvm
	P6jPO/X5yB3w8NSnWOshNr8cVXWI3u3DTKLFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ZTWUfCPP/b5h5pfM0IJ1sgvCtKBYnze+UagQ2DKbKGA=;
	b=edsw4haMxLjxlThVkCXd8sGoSG5K4mSagrfdW1qS/U5GqGHMeychFnZ7m7Ts9gYGuV
	fWKuQKuDdeXNGjl8OFjfiszgI54sqFBi0BlHQPBqTs3K/ek7c1jAZBPD4MIWx2ka7RkG
	XDkUNeVDzV2/oyouUWwbGBqQkq8HVTFuRRjbtbMqnNWEQFojY9/O6Z4hupVoKHqcMVhY
	pvezpl9mUTFVHc+ukUMep45BF/SSobr5HOF87a57XLwVN8d75NKr+G9mQ5+3ZyJCo7SZ
	W0oiArnuSPtq9yjBMLMYnLeUxyNKMzh5I72M/1M+eKLUKcrlNydg+sy03/+XmxdT4a1y
	rXKA==
Received: by 10.68.217.67 with SMTP id ow3mr7861021pbc.26.1349215212017;
	Tue, 02 Oct 2012 15:00:12 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id mz10sm1479634pbc.37.2012.10.02.15.00.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 15:00:11 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 15:00:01 -0700
Message-Id: <1349215201-30117-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnwqY2rUtwchlAdDY2hIyhygsIzeVGqPJ6CaZbJWa2NNiGfmMf3kVmdUl8F5wKJDbRpxmNV
Subject: [PATCH] sstate: Add detail to shared area warning
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
X-List-Received-Date: Tue, 02 Oct 2012 22:13:12 -0000

[YOCTO #3191]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 03f083e..ca50483 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -158,7 +158,7 @@ def sstate_install(ss, d):
             if realmatch:
                 match.append(f)
     if match:
-        bb.warn("The recipe is trying to install files into a shared area when those files already exist. Those files are:\n   %s" % "\n   ".join(match))
+        bb.warn("The %s recipe is trying to install files into a shared area when those files already exist (please fix %s). Those files are:\n   %s" % (d.getVar('PN', True), d.getVar('FILE', True), "\n   ".join(match)))
 
     # Write out the manifest
     f = open(manifest, "w")
-- 
1.7.9.5



