Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 907 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 24 Jan 2015 17:55:12 UTC
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0336872CD5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Jan 2015 17:55:12 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1YF4gk-0000q8-NG for openembedded-core@lists.openembedded.org;
	Sat, 24 Jan 2015 18:40:03 +0100
Received: from client-199.115.184.47.tlo.skybeamtx.com
	([client-199.115.184.47.tlo.skybeamtx.com])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Jan 2015 18:40:02 +0100
Received: from walt by client-199.115.184.47.tlo.skybeamtx.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Jan 2015 18:40:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Walt <walt@giroir.com>
Date: Sat, 24 Jan 2015 17:30:08 +0000 (UTC)
Message-ID: <loom.20150124T182655-678@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 199.115.184.47 (Mozilla/5.0 (Macintosh;
	Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko)
	Chrome/39.0.2171.99 Safari/537.36)
Subject: create_image() fails with cannot concatenate 'str' and 'NoneType'error
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
X-List-Received-Date: Sat, 24 Jan 2015 17:55:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


I have search the web and found a few references to this problem but I have 
not yet found a solution.

This is the latest commit.
--------
commit 745cebd635002618d7edd0a109ff07dd2953621a
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Jan 23 14:38:12 2015 +0000

    bitbake: siggen: Ensure taskdata default functions exist in base class
    
    The get/set_taskdata functions are now part of the API of the class,
    ensure they exist in the base class definition so the noop handler
    works.
    
    [YOCTO #7233]
    
    (Bitbake rev: 9b5b1bd7d77e3f5886f6c557d3b750de1f6d6025)
    
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


And here is the error
=====================
File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py', 
lineno: 355, function: create_image
     0351:        execute_pre_post_process(self.d, post_process_cmds)
     0352:
     0353:
     0354:def create_image(d):
 *** 0355:    Image(d).create()
     0356:
     0357:if __name__ == "__main__":
     0358:    """
     0359:    Image creation can be called independent from bitbake 
environment.
File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py', 
lineno: 333, function: create
     0329:        execute_pre_post_process(self.d, pre_process_cmds)
     0330:
     0331:        self._remove_old_symlinks()
     0332:
 *** 0333:        image_cmd_groups = self._get_imagecmds()
     0334:
     0335:        for image_cmds in image_cmd_groups:
     0336:            # create the images in parallel
     0337:            nproc = multiprocessing.cpu_count()
File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py', 
lineno: 303, function: _get_imagecmds
     0299:                print "************************"
     0300:                print localdata.getVar("IMAGE_CMD", True)
     0301:                print "************************"
     0302:                print "************************"
 *** 0303:                cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
     0304:                cmds.append(localdata.expand("\tcd 
${DEPLOY_DIR_IMAGE}"))
     0305:
     0306:                if type in cimages:
     0307:                    for ctype in cimages[type]:
Exception: TypeError: cannot concatenate 'str' and 'NoneType' objects

ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in: /home/walt/workspace/wwrelay-
rootfs/yocto/build/tmp/work/cubietruck-poky-linux-gnueabi/wigwag-prod-
lsb/1.0-r0/temp/log.do_rootfs.13308
ERROR: Task 6 (/home/walt/workspace/wwrelay-
rootfs/yocto/build/recipes/images/wigwag-prod-lsb.bb, do_rootfs) failed with 
exit code '1'
NOTE: Tasks Summary: Attempted 3977 tasks of which 3976 didn't need to be 
rerun and 1 failed.



