Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id EE3BD609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 19:09:49 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tr6so13797435ieb.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=DjOsAzhINO4MFBF7exw43kZ3y8XbnPAhljBjhwGj4NA=;
	b=gwN4RWSkWBMWsuItZBVYc/39NXlfOW3YGAygu8ip7cXNSybhVTT2VhurJiODyLMc+d
	mVMc1QgLu6FNOfyKHJrjZMsJ4lqR1geanLhasHADmvZh76LtYpx7UbYx615m0tRKA456
	/pA9Tyc7WrT+bBB/YCcmJpcI59dIRKRQb2a/53jmUrUBjgRRgXK1mP+Hg3lxCraDtBEG
	jhlMiJIh8arGRLPfeekRCEwwOwIK1qClfkD5rXoHDalTn28ZZDbTjs4Aekv4TFhW8pG1
	lHKyEklOTC9bHPlGuaiWy0bH7ykRjfj84QCPqZXIXbhn93nbMLZppdniWpVOTzQ08oeD
	9ivA==
X-Received: by 10.50.109.228 with SMTP id hv4mr7342437igb.13.1411672189858;
	Thu, 25 Sep 2014 12:09:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Thu, 25 Sep 2014 12:09:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Sep 2014 12:09:19 -0700
Message-ID: <CAMKF1soPhqozfNpzg3Vz_x3jkSMdvp9uX_7vEjy87hCD4bAbZQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: kernel cmdline mismatch for root= for vmdk and linux-yocto
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
X-List-Received-Date: Thu, 25 Sep 2014 19:09:55 -0000
Content-Type: text/plain; charset=UTF-8

commit 842a797460cd07b779ab588a4ece7e5d4d97417b
Author: Robert Yang <liezhi.yang@windriver.com>

Date:   Tue Jul 29 00:05:04 2014 -0700

    image-vmdk.bbclass: use sda rather than hda

    The modern kernels may not support IDE (CONFIG_IDE=y), but it should
    support SCSI in most of the cases. The boot-directdisk.bbclass uses
    sda, too.

    Remove an extra space from image-live.bbclass and image-vmdk.bbclass to
    not confuse the user.

    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>


changed

-SYSLINUX_ROOT = "root=/dev/hda2 "
+SYSLINUX_ROOT ?= "root=/dev/sda2"

but I see that linux-yocto ( 3.17) for qemu still expects /dev/hda2,
so I guess we also need to set this up in qemu machine conf to match
linux-yocto's expectation

