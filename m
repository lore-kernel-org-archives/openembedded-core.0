Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8460B6AC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 18:46:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 26 Jan 2015 10:43:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,470,1418112000"; d="scan'208";a="517807903"
Received: from jcarrol-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.23])
	by orsmga003.jf.intel.com with ESMTP; 26 Jan 2015 10:39:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Walt <walt@giroir.com>
Date: Mon, 26 Jan 2015 18:46:09 +0000
Message-ID: <3742973.ifrIKYg27M@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <loom.20150124T182655-678@post.gmane.org>
References: <loom.20150124T182655-678@post.gmane.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: create_image() fails with cannot concatenate 'str' and 'NoneType'error
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
X-List-Received-Date: Mon, 26 Jan 2015 18:46:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Walt,

On Saturday 24 January 2015 17:30:08 Walt wrote:
> I have search the web and found a few references to this problem but I have
> not yet found a solution.
> 
> This is the latest commit.
> --------
> commit 745cebd635002618d7edd0a109ff07dd2953621a
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Fri Jan 23 14:38:12 2015 +0000
> 
>     bitbake: siggen: Ensure taskdata default functions exist in base class
> 
>     The get/set_taskdata functions are now part of the API of the class,
>     ensure they exist in the base class definition so the noop handler
>     works.
> 
>     [YOCTO #7233]
> 
>     (Bitbake rev: 9b5b1bd7d77e3f5886f6c557d3b750de1f6d6025)
> 
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> 
> And here is the error
> =====================
> File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',
> lineno: 355, function: create_image
>      0351:        execute_pre_post_process(self.d, post_process_cmds)
>      0352:
>      0353:
>      0354:def create_image(d):
>  *** 0355:    Image(d).create()
>      0356:
>      0357:if __name__ == "__main__":
>      0358:    """
>      0359:    Image creation can be called independent from bitbake
> environment.
> File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',
> lineno: 333, function: create
>      0329:        execute_pre_post_process(self.d, pre_process_cmds)
>      0330:
>      0331:        self._remove_old_symlinks()
>      0332:
>  *** 0333:        image_cmd_groups = self._get_imagecmds()
>      0334:
>      0335:        for image_cmds in image_cmd_groups:
>      0336:            # create the images in parallel
>      0337:            nproc = multiprocessing.cpu_count()
> File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',
> lineno: 303, function: _get_imagecmds
>      0299:                print "************************"
>      0300:                print localdata.getVar("IMAGE_CMD", True)
>      0301:                print "************************"
>      0302:                print "************************"
>  *** 0303:                cmds.append("\t" + localdata.getVar("IMAGE_CMD",
> True)) 0304:                cmds.append(localdata.expand("\tcd
> ${DEPLOY_DIR_IMAGE}"))
>      0305:
>      0306:                if type in cimages:
>      0307:                    for ctype in cimages[type]:
> Exception: TypeError: cannot concatenate 'str' and 'NoneType' objects
> 
> ERROR: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: /home/walt/workspace/wwrelay-
> rootfs/yocto/build/tmp/work/cubietruck-poky-linux-gnueabi/wigwag-prod-
> lsb/1.0-r0/temp/log.do_rootfs.13308
> ERROR: Task 6 (/home/walt/workspace/wwrelay-
> rootfs/yocto/build/recipes/images/wigwag-prod-lsb.bb, do_rootfs) failed with
> exit code '1'
> NOTE: Tasks Summary: Attempted 3977 tasks of which 3976 didn't need to be
> rerun and 1 failed.

What have you got in your value of IMAGE_FSTYPES? It looks to me like there is 
an invalid value in there. If you aren't sure what it's set to, this command 
should tell you: 

  bitbake -e | grep ^IMAGE_FSTYPES=

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

