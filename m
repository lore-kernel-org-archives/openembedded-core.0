Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC376AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:20:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 Apr 2015 02:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,629,1422950400"; d="scan'208";a="684429532"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2015 02:20:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Thu, 23 Apr 2015 10:20:16 +0100
Message-ID: <2822728.eQSAVmuFvh@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429771148-1545-1-git-send-email-cristian.iorga@intel.com>
References: <1429771148-1545-1-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] testimage: regenerate rootfs before testing
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
X-List-Received-Date: Thu, 23 Apr 2015 09:20:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 April 2015 09:39:08 Cristian Iorga wrote:
> While starting a test with testimage, changes
> of the image under test don't trigger a rebuild,
> so fix that.
> 
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/classes/testimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index dc163c7..ce7f5c1 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -53,7 +53,7 @@ TESTIMAGELOCK_qemuall = ""
>  python do_testimage() {
>      testimage_main(d)
>  }
> -addtask testimage
> +addtask testimage after do_rootfs
>  do_testimage[nostamp] = "1"
>  do_testimage[depends] += "${TESTIMAGEDEPENDS}"
>  do_testimage[lockfiles] += "${TESTIMAGELOCK}"

I can't remember for certain, but I suspect the lack of this dependency was 
intentional, so that you could e.g. copy in an image built elsewhere and run 
tests on it. Maybe we can take the decision we don't need that, but it should 
be a conscious decision.

On the other hand, testimage-auto.bbclass does set up this dependency, 
although it also adds a dependency from do_build on do_testimage as well. 
There is a bug open to integrate testimage-auto.bbclass with testimage.bbclass 
as well (https://bugzilla.yoctoproject.org/show_bug.cgi?id=6155).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

