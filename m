Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S3HHn-0000ob-FZ
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 02:27:55 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 116ECF812FC; Thu,  1 Mar 2012 18:19:26 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 736FEF812FA;
	Thu,  1 Mar 2012 18:19:22 -0700 (MST)
Message-ID: <4F50201A.8050002@mlbassoc.com>
Date: Thu, 01 Mar 2012 18:19:22 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Image generation change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 01:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm having a problem after the recent change
   commit eacedb4f2afa98dbd2f5ea7a9f52e6ea952a72d2
   Author: Richard Purdie <richard.purdie@linuxfoundation.org>
   Date:   Wed Feb 29 16:24:26 2012 +0000

     image_types: Correctness fixes

     * Add a newline to improve the output formatting
     * Use set() to turn the list into a set of unique items to prevnt
       the same image code running twice (for e.g. IMAGE_FSTYPES = "tar.gz tar.bz2")
     * Support multiple compression extensions such as ".gz.u-boot"
     * Fix basetype/type typo and fix multiple image generation

     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I build initrd-style images which can be loaded by U-Boot.  This is a multi-step
process - first create the root image as ext3.gz, then pack it into the U-Boot
image.  Before this change, I could use this setup:

IMAGE_FSTYPES = "ext3.gz initrd"
IMAGE_CMD_initrd = " uboot_initrd;"
IMAGE_ROOTFS_SIZE = "24576"

where the 'uboot_initrd' command expected the ext3.gz image to be complete and
all it does is the U-Boot mkimage magic.

This no longer works as when uboot_initrd() runs, there is no ext3.gz image
yet built.  I'm not sure I understand the exact reason, but if I revert just
these lines, the process works again.

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5b48a09..8ea170a 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -29,7 +29,7 @@ def get_imagecmds(d):
      if d.getVar('IMAGE_LINK_NAME', True):
          cmds += "      rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"

-    for type in set(types):
+    for type in types:
          ccmd = []
          subimages = []
          localdata = bb.data.createCopy(d)

If there is another way to solve my problem, i.e. generate the wrapped
up initrd image, that will still work with the code as is, I'd be happy
to use it, but I'm not sure how to write such a process.

Any ideas gladly accepted, thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


