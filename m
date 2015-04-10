Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA386ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:17:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2015 02:17:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,555,1422950400"; d="scan'208";a="554022862"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 10 Apr 2015 02:17:03 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A83266A408D;
	Fri, 10 Apr 2015 02:16:39 -0700 (PDT)
Date: Fri, 10 Apr 2015 12:16:56 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: =?iso-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Message-ID: <20150410091656.GA23029@linux.intel.com>
References: <1428400661-19372-1-git-send-email-ed.bartosh@linux.intel.com>
	<5525A940.5040600@gmail.com>
	<20150409191235.GA19415@linux.intel.com>
	<5526FC10.4080806@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5526FC10.4080806@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic: Implement --build-rootfs command line option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Apr 2015 09:17:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 09, 2015 at 07:24:16PM -0300, João Henrique Ferreira de Freitas wrote:
> 
> >>- What will be the behavior if: wic create test-image-4Gb -e
> >>test-image --rootfs rootfs1=test-image --rootfs
> >>rootfs2=bringup-image -f. A believed that only 'test-image' will be
> >>build. Right?
> >>
> >I don't fully understand command line options in your example, but generally you're right.
> >wic will take image name from -e option and run "bitbake test-image" in this case.
> 
> This thread explain the above command line options: http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091185.html
> 
> Usually I run this sequence:
> 
> bitbake test-image
> bitbate bringup-image
> 
> wic create test-image-4Gb -e test-image --rootfs rootfs1=test-image --rootfs rootfs2=bringup-image
> 
> So wic will create a directdisk with two images where each one will
> be place on specific partition.
> 
> I  guess if '-f' is used, wic could call bitbake to 'test-image' and
> 'bringup-image'.

Thank you for explanations. I missed your patches somehow.

Can we do the same by implementing handling of multiple -e/--image-name options in command line and .wks?
e.g. wic create directdisk-multi-rootfs.wks -e core-image-minimal -e core-image-minimal-dev

directdisk-multi-rootfs.wks:
part / --image-name core-image-minimal --ondisk sda --fstype=ext3 --label primary --align 1024
part /standby --image-name core-image-minimal-dev --ondisk sda --fstype=ext3 --label secondary --align 1024

--
Regards,
Ed

