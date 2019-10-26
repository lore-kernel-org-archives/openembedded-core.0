Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 36F297FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c22so4148392wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cH9DWh0FdZQZIW+7IeMRksAONBi/7KgFHSi+tq81C9g=;
	b=MdvC5gzREk16r6zpPVfZio0fl4zq5GFfi3rT58Jd9U2+a5vGKUvMB8L8RT2NcdHjON
	MRtmdTEXqrK3fnavEkR/1y2/R6v5oCSYrqK4iuf7cuboYg++uHEixgHM23NpqjQZ2QYW
	4X8B+f7Xnrb7viZWEG1saDMJcBXzzELvTdG6i+bTk7CaxPIq8EoOowBCkK2xFDk89QA5
	hIoDsuvPDMQqueMg6uQ5unVUPTJjVdq9NlLDROxK6mtlrjMLzqgW6LTDbXCZ20f67Zm9
	U+oWE3FOQZoMhI5I6imcnSTvRUBwI/GpIgjfhO0VK5JEjv5FaJnGBdHaQUDEMeyZ8CeX
	48nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cH9DWh0FdZQZIW+7IeMRksAONBi/7KgFHSi+tq81C9g=;
	b=WWaDfK4wp28D/U9tDF7RRvoVuDd79SoJldBsynz2b6i8CONh1OSNtiFHSI65d2g5UP
	2xnLhgCXayNLDmnUjmt3dUK64RK2tzJALgeDdHSITKUleYf1XiNBKLnyOTRNvZ8XM25f
	ohaLvaRfuY+d5zBQwMrHnPBlGH/1a6Q5v10eTjypjtlA50/l/QdrP3SYubub8TcA3j20
	qud2KUOSGh4l26CdvMExpNT99rs53Y5Qt79NCDQ1G/voWe+YcXN5HsSNOMsJOoHEnSM3
	Dv1ck0cAIBbmg/Rs36tsqYAHBFiyEVGwU0szhxMfL5O1rlXFHiSF8lcVdRjzd58s5Ji0
	gf+w==
X-Gm-Message-State: APjAAAXJ6NiKsA8fiPxLZ8yo1Dp6YZb1W/PLBzvnAdtBryOdEEif1IPw
	0QaqmL+xI7u/tedF+cGjRC4YefkZucI=
X-Google-Smtp-Source: APXvYqyks+dcBHSGEWMS7H7K3NXPMRE2EFZ1cCacouq8e5HRZYB2rTCkC7dX6UAiSRBDKgHrBOGh/w==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr6251423wmj.36.1572072609734;
	Fri, 25 Oct 2019 23:50:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:38 -0700
Message-Id: <f71b1a96529d658d1c6c7dc04dca1957ea647e4e.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 06/28] runqemu: Remove disabling of high resolution timer
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:09 -0000

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The option 'highres=off' sneaked itself into the runqemu script for all
configurations, where the root filesystem type is not 'cpio' or 'cpio.gz'.
See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13590

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 46087b8..a05facd 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1198,12 +1198,12 @@ class BaseConfig(object):
 
                 # All branches above set vm_drive.
                 self.rootfs_options = '%s -no-reboot' % vm_drive
-            self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('QB_KERNEL_ROOT'))
+            self.kernel_cmdline = 'root=%s rw' % (self.get('QB_KERNEL_ROOT'))
 
         if self.fstype == 'nfs':
             self.rootfs_options = ''
             k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, os.path.abspath(self.rootfs), self.unfs_opts)
-            self.kernel_cmdline = 'root=%s rw highres=off' % k_root
+            self.kernel_cmdline = 'root=%s rw' % k_root
 
         if self.fstype == 'none':
             self.rootfs_options = ''
-- 
2.7.4


