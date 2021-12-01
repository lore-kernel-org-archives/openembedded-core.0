Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FB0C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 16:44:08 +0000 (UTC)
Received: from avasout-ptp-001.plus.net (avasout-ptp-001.plus.net
 [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web12.94356.1638377037240706851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=KC4vGM7B;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id sShxmbYv1tAwOsShzm52BE; Wed, 01 Dec 2021 16:43:53 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=TNsm93pa c=1 sm=1 tr=0 ts=61a7a649
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=IOMw9HtfNCkA:10 a=CNncwcfLXTKsnqQ8L4QA:9
 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=jDsyqGG1izUdBK1AXaORaoHEqaFZeWZtrPtNp7zzPYw=; b=KC
	4vGM7BkRIycLdmHQ0Z1cUMgpY42ll2qbeaVYwVtDD5rpSBs1huJLbbzNCWdNEH2pbzfnEEvJgnFna
	cBHov3i3lRbsIupjU4IjCBocDCpvY33FAgmDCqM+sedraXrep4V9vIQESHldytNZFvywR/6tTCi2g
	1acK2CMuW+a+1HFvtKr0YbarLdASvLZt99mnx0I2GCR+SiSzyzzSikQWmhBzeIhdl1uBedxGEpCGe
	skUMc9JQnrMbejxLqm7SE9Ss4A7RhgZyBRJwxjnUgHa1YhZ7va9kptZ5BHGcSzsK30WF+uOPdxlxj
	WrxcaMAAy0YzqhBD+5af7qb5sOcmKLiw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1msShx-007Els-Ko
	for openembedded-core@lists.openembedded.org; Wed, 01 Dec 2021 16:43:49 +0000
Date: Wed, 1 Dec 2021 16:43:49 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: Correct way to set DRIDRIVERS and GALLIUMDRIVERS from mesa bbappend
Message-ID: <YaemRcD22hUhkQrq@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: 
 MS4xfEogtV7wynTHt1GOCyKUAJwX+9lR6jYuy7bb5C+9E8jVMXWiA2kbHCwC54TLcwQp9/0JnwsWYx3fRL1WKj593VTSEL+hTS+DLihpweSlineDKvFrbk9n
 52EJ4whtxlfiK9fX6GBzO/BLiicOyGk059v0B2za2OmPOvAkMhlo+eOMkcgO2zpAwTrUMrn5eYRRwrzORfSin6GpGPGEu3UCXUw=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 16:44:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159048

I'm building for a specific chip and therefore don't wish to waste time and
electricity building and disk space on the target installing unwanted mesa
drivers. However, mesa.inc contains:

 GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS:x86-x32 = ""
 GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
 GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"

and mesa_21.3.0.bb contains:

 DRIDRIVERS ??= ""
 DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
 DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"

I'm unable to find a way to override these values. Using (for example):

 DRIDRIVERS:forcevariable = ""
 GALLIUMDRIVERS:forcevariable = "swrast"

doesn't work because the append still happens after the forcevariable
override takes effect. :(

Is there a way that I can override GALLIUMDRIVERS and DRIDRIVERS with my
own values for x86 and x86-64 without modifying oe-core itself?

If not, should the oe-core recipe being using something like:

 GALLIUMDRIVERS_DEFAULT = "swrast"
 GALLIUMDRIVERS_DEFAULT:x86-x32 = ""
 GALLIUMDRIVERS_DEFAULT:append:x86:class-target = ",i915,iris,crocus"
 GALLIUMDRIVERS_DEFAULT:append:x86-64:class-target = ",i915,iris,crocus"
 GALLIUMDRIVERS ?= "${GALLIUMDRIVERS_DEFAULT}"

and similar for DRIDRIVERS to support this?

Thanks.

Mike.

