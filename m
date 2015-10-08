Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7280765CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 16:09:26 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so35559238wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 09:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bS1mkasDHndpfPHhekcXFL9f7/5+OziyFp45JUpsklM=;
	b=L1il6jgJJqaRnUFUCmzrhsq2eXQ1PPUUrsSbU6K8ZKR7DLaKP6S4HYTwz6WVGXEDR5
	PVXRigPsEs6B2DyXRkz1UmQV4iRpknWOtwVVreryW4QecXRCdyr/V1fVm6pZ8UfJioRs
	2PO1mekE9UFge/tSth3v0xKwn0p5nJPFAe40viwJQ/e8TIplrzu2N1/u5tfIBI4PbUof
	DQUda3OUUgLkQMjmrnP1Ymxjz8wICpT5V822EkdmCqmn5pLCkMUeHrFwbh44ToM91aGG
	kzLdGk34x1rtUAxFCD3oOTS4UYIH43WEhh5ZVE8wAfebWgzLOFY4Et+l9T97OnSMN0EX
	LlwA==
X-Gm-Message-State: ALoCoQlhky8eI928onYETYtv0jE/Za9Q6jJMt+6drxSmmiGmd1c1KxpTMjfG9ZYtJbQZgu92/9Z9
X-Received: by 10.180.87.102 with SMTP id w6mr5284780wiz.88.1444320566226;
	Thu, 08 Oct 2015 09:09:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id gs8sm7833108wib.5.2015.10.08.09.09.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Oct 2015 09:09:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Oct 2015 17:02:05 +0100
Message-Id: <1444320125-19118-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe/image: use apparent size of artifacts, not disk usage
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
X-List-Received-Date: Thu, 08 Oct 2015 16:09:26 -0000

When collecting the size of the root file system get the apparent size of the
files not the actual disk usage, as disk usage on the host file system can be
affected by file system compression or sparse files.

[ YOCTO #8430 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/image.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index b0d81a6..9199e36 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -164,6 +164,7 @@ class Image(ImageDepGraph):
         rootfs_maxsize = self.d.getVar('IMAGE_ROOTFS_MAXSIZE', True)
 
         output = subprocess.check_output(['du', '-ks',
+                                          '--apparent-size',
                                           self.d.getVar('IMAGE_ROOTFS', True)])
         size_kb = int(output.split()[0])
         base_size = size_kb * overhead_factor
-- 
2.1.4


