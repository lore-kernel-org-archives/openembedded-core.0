Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0446057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UA87hE012840; Tue, 30 Aug 2016 11:08:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fu7KV0g6_aYf; Tue, 30 Aug 2016 11:08:07 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UA85oR012835
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Aug 2016 11:08:06 +0100
Message-ID: <1472551684.29583.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 11:08:04 +0100
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/18] Provide list of deployment artifacts
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
X-List-Received-Date: Tue, 30 Aug 2016 10:10:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ed,

On Tue, 2016-08-30 at 12:29 +0300, Ed Bartosh wrote:
> This is a fix for Bug #9869 - Provide a per-target manifest of files
> which were, or would have been, produced
> 
> The list of artifacts produced by deployment tasks (do_deploy,
> do_image_complete and do_populate_sdk[_ext] is
> obtained from sstate manifests and fired as a TaskArtifacts metadata
> event. This should allow Toaster to
> handle artifacts in simple way and remove a lot of current Toaster
> code doing guess work.
> 
> To generate manifests for do_image_complete and do_populate_sdk they
> have been put under sstate control.
> 
> To avoid storing big files(images and sdk installer) in sstate new
> variable SSTATE_SKIP_CREATION has been
> set in image.bbclass and populate_sdk_base.bbclass and sstate code
> was modified to avoid adding files
> to sstate if SSTATE_SKIP_CREATION is set.

I'd like to see this series reordered to:

a) Set DEPLOYDIR in image.bbclass/populate_sdk_base.bbclass to point at
DEPLOY_DIR_IMAGE
b) Add SSTATE_SKIP_CREATION support
c) Make all the DEPLOY_DIR_IMAGE -> DEPLOYDIR changes in one patch
d) Enable sstate for images (change DEPLOYDIR definition, add the flags
including cleandirs, stamp-extra, set SSTATE_SKIP_CREATION)
e) As per d but for populate_sdk_base

That way it applies incrementally and like changes are all grouped
together. It will mean some commit messages are longer and squashed
together but I think that is fine.

Cheers,

Richard


