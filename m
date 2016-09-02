Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEBF77087
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 11:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u82BidBS006802; Fri, 2 Sep 2016 12:45:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aCuFMfDXLian; Fri,  2 Sep 2016 12:45:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u82BjKkq006848
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 2 Sep 2016 12:45:22 +0100
Message-ID: <1472816720.29583.157.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 02 Sep 2016 12:45:20 +0100
In-Reply-To: <cover.1472719962.git.ed.bartosh@linux.intel.com>
References: <cover.1472719962.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 0/6] Provide list of deployment artifacts
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
X-List-Received-Date: Fri, 02 Sep 2016 11:45:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-09-01 at 11:55 +0300, Ed Bartosh wrote:
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

There were multiple issues here:

* Duplicate file overlap in DEPLOY_DIR/sdk causing build failures
* Overlap of the DEPLOYDIR namespace breaking builds (between 
  do_image_complete, do_populate_sdk and do_populate_sdk_ext but could 
  potentially conflict with a do_deploy task added to an image too)
* Breakage of do_populate_sdk_ext since it calls do_populate_sdk
* No sstate coverage of do_populate_sdk_ext
* no cleandirs on do_populate_sdk DEPLOYDIR

I've a revised patch set I'll test which addresses these issues.

Cheers,

Richard



