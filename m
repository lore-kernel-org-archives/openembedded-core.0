Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 240F86BC3D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 13:45:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f188so3691888wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 05:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IdbGiJUKnKRIxB7qv+j5CyFup45pzdZG8obHEEq3v8k=;
	b=K9vvA8ninttdWYPsJixrOBHFlekavMsn291KrFVkpBkCBj4fNMQjlOEmdh7IZCunUZ
	LkcE4/fFAow2OgE7OBqGFzvfDt8rlWJWIOodssxSmYdfHJrxGSiNtOjVXox3IhpASgf+
	0W+EbvcfsyB6t8X6UVPuRWR4HYXArMFrpHeko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IdbGiJUKnKRIxB7qv+j5CyFup45pzdZG8obHEEq3v8k=;
	b=tbdJxjdoJqmS7C7kVzJ5tdWBZqnSwhJ3pYMiMSuJxBwSsCtIbRts1Dnm5awuKSr8W3
	4Uym6NG8eRUoQSMw/0JuafJEOf+LVPJqVghl0fN3iw/TDgOrV/Af7nFi+VhpouyrQntu
	2/p1BJ7+xVV/PYzaqilgKHMhrmRt3du9K3BbLToE6Umsfz4/0hbmw9y63sUFAfWETRmh
	yi1RsqzLRG1VA8Ud8vlIstYGC2a6WLvmwC9N5oRXfYWHC4v7rmbjZsg7OtXUl8HvRWbU
	nQDwGaBXYBK7TsoT75BgdstNqq/cgeiGeaO42ZYPoMIGR75nrxGKXr8/T73VTJvgW7b8
	1WHA==
X-Gm-Message-State: AHQUAuake3BNukHSaKr3/efKSpxjF8JoIPI3evQP1OergwgoASal+RFN
	/lcYqyArJ41OVtstI5u9NvhbLXxmzM0=
X-Google-Smtp-Source: AHgI3IZ1SgNqGBGcI5LVCYjVdNCA2YFJ6j/zWpIkigaBZWiX5PlLCxtN3+F67TKCRu4riyemyie/XQ==
X-Received: by 2002:a7b:c08b:: with SMTP id r11mr3665063wmh.29.1549374302052; 
	Tue, 05 Feb 2019 05:45:02 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s3sm11297389wmj.23.2019.02.05.05.45.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 05:45:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 13:44:58 +0000
Message-Id: <20190205134459.29230-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] package_rpm/archiver: Apply bandaid to src.rpm creation
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
X-List-Received-Date: Tue, 05 Feb 2019 13:45:02 -0000
Content-Transfer-Encoding: 8bit

| error: create archive failed on file /media/build1/poky/build/tmp/work/all-poky-linux/xcursor-transparent-theme/0.1.1+gitAUTOINC+23c8af5ba4-r0/deploy-sources/allarch-poky-linux/xcursor-transparent-theme-0.1.1+gitAUTOINC+23c8af5ba4-r0/xcursor-transparent-theme-0.1.1+git0+23c8af5ba4-r0.src.rpm: cpio: read failed - No such file or directory
| Building target platforms: noarch-poky-linux
| Building for target noarch-poky-linux

This is caused by:

$ cat log.task_order

do_cleansstate (24289): log.do_cleansstate.24289
do_deploy_archives_setscene (24395): log.do_deploy_archives_setscene.24395
do_fetch (24407): log.do_fetch.24407
[..]
do_package_write_rpm (25448): log.do_package_write_rpm.25448
do_package_qa (25451): log.do_package_qa.25451

So do_deploy_archives can run from sstate, created a .src.rpm in WORKDIR/deploy-sources,
then it was removed when rpm was running. This leads to a broken Source line in the
spec file as the original file was found by the os.listdir().

This fix is just a bandaid over much more fundamental problems sadly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 21ada348aaa..5dafb3e7cb6 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -113,6 +113,10 @@ python write_specfile () {
             source_list = os.listdir(ar_outdir)
             source_number = 0
             for source in source_list:
+                # do_deploy_archives may have already run (from sstate) meaning a .src.rpm may already 
+                # exist in ARCHIVER_OUTDIR so skip if present.
+                if source.endswith(".src.rpm"):
+                    continue
                 # The rpmbuild doesn't need the root permission, but it needs
                 # to know the file's user and group name, the only user and
                 # group in fakeroot is "root" when working in fakeroot.
-- 
2.20.1


