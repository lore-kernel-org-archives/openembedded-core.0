Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 67B6065CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 12:13:56 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so11503846wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 04:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jpdODW0I/Qz2snZqBkOCS9353xxaSZbPEtfa8gU1H04=;
	b=YrwPNeHtyhfuCeVosmQrnu6EFKRHZkHrRw89sX7U4MVK2jUc1DJfPLEeEaOYVhR8JL
	gOPdcolfw+4awcohbSfWnnIrY2LI6bw30shZOTyigeP5nJ8OzM768lJKD5afrkh79P1F
	+DB+/fzJSfcIR3p4GQmv22Zj53ttVk7ip7IMv8fEz9D6QFZDpn8fgggADu+CfmnXq3jO
	BIRMlwFlkxvHcwJaxunW8Nk0VHMZHXtyY5PYwWIEuAdfHU/vGG5GEBRSQp1nzNZu9zWZ
	35S/oT7zvYuD4zowjruE869kJAt0aOC/wvWI/RgM3DoRqy+fZ1sWHl0gvE/bSz1d5+hj
	jUHQ==
X-Gm-Message-State: ALoCoQm4opCPZuNdA/4sZ2JlpP2aYgwYWNB5UdaWxw7x2KXwBp3oFMVrxZGzhKynVOWLfXrNwzN7
X-Received: by 10.180.92.234 with SMTP id cp10mr6739877wib.16.1415708037031;
	Tue, 11 Nov 2014 04:13:57 -0800 (PST)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id fr6sm17275124wic.1.2014.11.11.04.13.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Nov 2014 04:13:56 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 13:13:52 +0100
Message-Id: <1415708032-28510-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH][daisy][backport] kernel: Prevent from installing so files into source dir
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
X-List-Received-Date: Tue, 11 Nov 2014 12:14:06 -0000

From: Yang Shi <yang.shi@windriver.com>

vdso build could generate so files, avoid installing such so files into kernel
source dir, otherwise the below package QA error might be hit:

ERROR: QA Issue: File '/usr/src/kernel/arch/x86/vdso/vdso64.so' from
linux-yocto was already stripped, this will prevent future
debugging! [already-stripped]

Signed-off-by: Yang Shi <yang.shi@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

This is needed to build 3.6.16+ on the daisy branch

 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 58b0ec8..acb2bbd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -232,7 +232,7 @@ kernel_do_install() {
 	# dir. This ensures the original Makefiles are used and not the
 	# redirecting Makefiles in the build directory.
 	#
-	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
+	find . -depth -not -name "*.cmd" -not -name "*.o" -not -name "*.so.dbg" -not -name "*.so" -not -path "./Documentation*" -not -path "./source*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
 	cp .config $kerneldir
 	if [ "${S}" != "${B}" ]; then
 		pwd="$PWD"
-- 
1.9.0


