Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB267FC57
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 10:57:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 43351A3ADD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 12:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:mime-version:date:date:message-id:subject:subject
	:from:from:received; s=mail20150812; t=1572087469; bh=DxJGgidGK0
	/h9SckVdcO2Ap2DKWVzdfergQUi3TMG5k=; b=knEG9hlEYpGK1Nwg/1zf8490UB
	+tlLndaJ9TuWwQEhgyjnZQ8QIbezUk0u5VcPJtkLVzz/8LV/mLPvJuYkfUcUqJaS
	RE8g+HnLiOUraU/F1nZh5hFNTQ52tG4rm3Ebz9x72SZwI+HPog7XLMDrjUNwBHcK
	xhVT66hcCYw3qeQ3hMbO3+Vzl1t98XU9gz/HhMf1WEPDJR5qqa+HnvYNeBtbgrzv
	6CNBs18WrvsxL/J8UZ82YDxzsbOvyGU3vsCAjFyE7fXiiQ0g/v9tbpSVWrm3w8bt
	2xZRjjO8NpKkKZCP0D7q327KfbDWJORzSPzbofxbTZy4sANcTRgl3KQgUuPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1572087475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=h6aUfhFvgfewY6l8qaVg4Y6vlvnpkBIAI8Zn0KMBb9I=;
	b=xkZGqwHdIjscJNTEMbkahCr8bd5aEOcBZWdL4WAahwyToVticWOGc9YgwOyY5l57RzDVI9
	6P7sMglbf7fEVSBYpCLnBPPKpiQ1ZDu3AfZn7byTHglBgIswrHJmfg4xWev9dhp4QXj/5M
	5ZciyfjkUbUJ+mXR/VnS+ZMX4omeIuifxOa+FaUqHHnxsaoVUAScAh03gEOru8pP0VleuC
	S5PlL9M6VdK1FLkbctOyPaBzwEXOEcFkelWBPYf/n2hvxqmmHBJNQ/zvj+vI/kMURukITk
	n9Q8WFWkNmbuLVlP9sc9b0ht7SPEX7V7lbnGM59Qj+G/iSseiz0OVo6SvR69mg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
	(amavisd-new, port 10030) with ESMTP id t-6Wrhr3BOHR
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 12:57:49 +0200 (CEST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <f6132fd4-18d0-aba5-96d5-c259928a113d@mailbox.org>
Date: Sat, 26 Oct 2019 12:57:47 +0200
MIME-Version: 1.0
Subject: GStreamer 1.0 meson build transition
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
X-List-Received-Date: Sat, 26 Oct 2019 10:57:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I've been working on migrating the GStreamer 1.0 recipes from autotools 
to meson.

As expected, it is far from a straightforward change. Obviously, 
autotools/m4 specific patches need to be discarded or replaced. But 
there are also other differences, like how the OpenGL platforms and APIs 
get selected, or how the unit tests are built and run. Some of these 
changes are severe, and break not only the current way we do things in 
the recipes, but also some gstreamer1.0 bbappends. Some packageconfigs 
also changed. Certain checks are again done automatically without the 
ability to explicitely enabling/disabling them (like valgrind checks), 
so this needs patching again (ugh). gst-libav no longer has its own 
libav/FFmpeg copy, and relies on an external one now. Furthermore, I've 
had to create new nontrivial meson.build patches for proper ptest 
functionality.

I think it would make sense to not try to get a meson based build done 
for GStreamer 1.16, and instead target it for 1.18. Minor version 
upgrades like 1.16.0 -> 1.16.1 aren't expected to bring major changes 
with them, while major upgrades like 1.16 -> 1.18 are generally known to 
potentially bring such changes. Also, there's a chance that new patches 
might make their way into 1.18 before its release.

I write this in case anybody else is also working on meson, and/or 
planning on upgrading the existing recipes once 1.18 is out, to avoid us 
working in parallel on the same recipes without knowing. I'll push my 
changes to a development branch in the meta-gstreamer1.0 recipes in a 
few days so that people can bring in input if they want.

cheers,
   Carlos


