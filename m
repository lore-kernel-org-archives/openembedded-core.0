Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 4D55177B3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:22:16 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170322132216353_0684
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:22:16 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=16934 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cqgDK-0007t5-6A for openembedded-core@lists.openembedded.org;
	Wed, 22 Mar 2017 09:22:10 -0400
Date: Wed, 22 Mar 2017 09:22:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703220907350.17218@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: another design question -- proper (meaningful) content of recipe patches?
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
X-List-Received-Date: Wed, 22 Mar 2017 13:22:20 -0000
Content-Type: text/plain; charset=US-ASCII


  got into an animated discussion the other day regarding proper
design of patch files associated with a recipe. as a demo, i can
actually use part of a recipe file ripped from the meta-digi-arm
layer, for "kernel-module-qualcomm", whose recipe file contains (in
part):

  SRC_URI = " \
    ${CAF_MIRROR};destsuffix=${PV};branch=${SRCBRANCH} \
    file://qualcomm-pre-up \
    file://modprobe-qualcomm.conf \
    file://0001-qcacld-Fix-compiling-errors-when-BUILD_DEBUG_VERSION.patch \
    file://0002-Update-cfg80211_vendor_event_alloc-call-for-newer-ke.patch \
    file://0003-wlan_hdd_main-Update-cfg80211_ap_stopped-to-nl80211_.patch \
    file://0004-qcacld-2.0-remove-unused-code.patch \
    file://0005-Including-header-file-for-regulatory_hint_user.patch \
    file://0006-Updating-calls-to-alloc_netdev_mq.patch \
    file://0007-wlan_hdd_cfg80211-update-cfg80211_inform_bss-params-.patch \
    file://0008-wlan_hdd_p2p-Update-call-to-cfg80211_rx_mgmt-for-dif.patch \
    file://0009-linux_ac-Fix-for-f_dentry.patch \
    file://0010-native_sdio-src-hif-Do-not-call-to-HIGH-SPEED-functi.patch \
    file://0011-osdep_adf.h-fix-for-undefined-ath_sysctl_pktlog_size.patch \
    file://0012-Kbuild-Add-compilation-flag-based-on-kernel-support.patch \
    file://0013-Kbuild-do-not-compile-the-DEBUG-version-inconditiona.patch \
    file://0014-Kbuild-Group-most-of-the-relevant-DEBUG-options.patch \
    file://0015-wlan_hdd_cfg80211-fix-missing-ifdef-clause.patch \
    file://0016-Add-.gitignore-rules.patch \
    file://0017-wlan_hdd_main-initialize-all-adapter-completion-vari.patch \
    file://0018-qcacld-Indicate-disconnect-event-to-upper-layers.patch \
    file://0019-wdd_hdd_main-Print-con_mode-to-clearly-see-if-in-FTM.patch \
    file://0020-Makefile-Pass-BUILD_DEBUG_VERSION-to-kbuild-system.patch \
    file://0021-cosmetic-change-log-level.patch \
    file://0022-fix-issue-with-_scan_callback.patch \
  "

  when i was presented with something resembling the above the other
day, my immediate reaction was , "yuck." at the time, i opined that,
if the purpose of the above was to simply add a qualcomm module, it
was silly to do that with a lengthy, numbered series of patches that
were almost certainly inter-dependent and even numbered to enforce a
particular processing order.

  i insisted that the above was unnecessarily messy and, if a
developer tried to examine the patches, it would be next to impossible
to do that easily, as it would require walking through each patch,
then mentally adding the next one, and so on and so on.

  i suggested that, in cases like this, adding a well-defined
functionality should be done with a single all-encompassing patch or,
at the very worst, a small number of patches that might be applied
independently. as in, "Add-qualcomm-driver.patch".

  the argument i got coming back was that the above made sense as it
reflected the *history* of how that driver came to be added. i
shuddered, and pointed out that if one wanted to see the history,
that's what version control is for -- there is no reason that the
information from version control should be used *verbatim* to generate
the patches for a recipe.

  in any event, i can appreciate the value of sometimes adding
numbering to patches to enforce a processing order, but when one has a
numbered series of patches getting up to 20 or 25, that strikes me as
time to collapse all that into larger and more modular and more
meaningful patches.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



