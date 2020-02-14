Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 702EC6101D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 13:04:50 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:38108 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>) id 1j2aeJ-005awS-13
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Feb 2020 08:04:51 -0500
Date: Fri, 14 Feb 2020 08:04:49 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2002140758340.2874577@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: what is MACHINE_HWCODECS used for these days?
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
X-List-Received-Date: Fri, 14 Feb 2020 13:04:50 -0000
Content-Type: text/plain; charset=US-ASCII


  was documenting the use of [EXTRA_]IMAGE_FEATURES, and noticed that
while the oe-core layer defines a related feature:

  core-image.bbclass:FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
  core-image.bbclass:MACHINE_HWCODECS ??= ""

i see no actual usage of that variable in oe-core (the git log goes
way back to 2013:

  commit 1cb370587fd72e3f0f69678748108cc4116767fb
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Wed Jan 23 21:56:11 2013 -0800

    core-image: Add hwcodecs IMAGE_FEATURE

    Currently hardware codecs are being injected in rather ugly ways and end up
    either in no or all images. This adds a dedicated IMAGE_FEATURE for them based
    on the MACHINE_HWCODECS variable. We may need to refine this in due course
    but this patch at least illustrates the concept.

i looked through other layers on my system, and found some references
in meta-intel:

conf/machine/intel-core2-32.conf:MACHINE_HWCODECS ?= "intel-vaapi-driver gstreamer1.0-vaapi"
conf/machine/intel-corei7-64.conf:MACHINE_HWCODECS ?= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'intel-media-driver
intel-mediasdk', d)} intel-vaapi-driver gstreamer1.0-vaapi"
conf/machine/intel-skylake-64.conf:MACHINE_HWCODECS ?= "intel-media-driver intel-mediasdk intel-vaapi-driver
gstreamer1.0-vaapi"

but i see nothing in *that* layer that actually does anything with
that variable after setting it. what is it used for? and how is it
processed?

rday


