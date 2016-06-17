Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 871827319C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:09:31 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160617130931046_0684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:09:31 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=58200 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bDtYG-00021v-KU for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2016 09:11:12 -0400
Date: Fri, 17 Jun 2016 09:08:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1606170904580.14083@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: should INITRD_IMAGE be INITRD_IMAGE_VM?
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
X-List-Received-Date: Fri, 17 Jun 2016 13:09:35 -0000
Content-Type: text/plain; charset=US-ASCII


  still tooling around the initramfs images, and noticed:

$ grep -rw INITRD_IMAGE *
meta/recipes-extended/images/core-image-testmaster.bb:INITRD_IMAGE = "core-image-testmaster-initramfs"
$

  however:

$ grep -r INITRD_IMAGE *
meta/recipes-extended/images/core-image-testmaster.bb:INITRD_IMAGE = "core-image-testmaster-initramfs"
meta/classes/image-vm.bbclass:# Using an initramfs is optional. Enable it by setting INITRD_IMAGE_VM.
meta/classes/image-vm.bbclass:INITRD_IMAGE_VM ?= ""
meta/classes/image-vm.bbclass:INITRD_VM ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_VM}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE_VM}' else ''}"
meta/classes/image-vm.bbclass:do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE_VM}:do_image_complete' if '${INITRD_IMAGE_VM}' else ''}"
meta/classes/image-live.bbclass:INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
meta/classes/image-live.bbclass:INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
meta/classes/image-live.bbclass:    initrd_i = d.getVar('INITRD_IMAGE_LIVE', True)
meta/classes/image-live.bbclass:        bb.error('INITRD_IMAGE_LIVE %s cannot use image live, hddimg or iso.' % initrd_i)
$

  so ... should that first line be setting INITRD_IMAGE_VM rather than
just INITRD_IMAGE? or am i misreading?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


