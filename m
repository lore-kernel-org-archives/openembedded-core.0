Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7D16E71985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:32:34 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l66so19565112ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 06:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=vVvD39XkHsSgVdQT2DqfrobVET3DBRHcH9QonH6fqC0=;
	b=RahH8PM3qzkjdmRe5SdQFsRvH80dYtUWzF+WRq7l9khU8pSubQxToKjuZGjh+Dauuc
	gIjyRHnN67zGu+mw6WpgYtxQA4IJewYvhdOjzKVphT+PoLnSR9fDvAQslwWKHc9G4Njt
	LVLYmq4V/FGg3V8u6f09YJKj7QKqe+18+WEAuwSfxZSgsd4/X8Rjl6tH1j0ain2irrSX
	4s6rQvhQw7pXo4j/NEJy/X36M8gTFS2bbH8Lqde3Ctg6fLfiTo2ljPO2za21TmInvVKA
	cJvlMnv+iwfcUyoYrWlES7uxZ17tVFHxxTveKCuFFDbLY6+ouoGzRckU4H8SuFj4C8A6
	PN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=vVvD39XkHsSgVdQT2DqfrobVET3DBRHcH9QonH6fqC0=;
	b=jjRwMXWO1pSmQUfyOgioJGuRnqlWaefVav50N/gTQVGUEgKXn1+FLp/zf3MosnHuK0
	/DbBFKNF1tCwLyPBKHBF8JpEIxY5bYInAps6GWJVU8kxRkO1CbtncXBgmfaCLRjGMjd5
	hJgCxvdxisgrmzsCnwWn/fLyOGm4xokMbad6W+3ILsU0V1oavbW+FT5NSPo3a7suiur9
	1FOhcgESLfTZZdgSI8VIoTIbX5L5MkJctQq7/5H3p39YKrfBfjC5NuiYEM1Z6v3g/1OA
	UtuRe+C7qX5GNvHKp5/2jl8OA1+1Viw/EdHVqE0FWg1tnPdBMXFRaoIKmJfDob7bY1gg
	0GWg==
X-Gm-Message-State: AIkVDXLJ/CtlId3PlRXczrq00fdGEjH+xgPMOrCjI7ZLGul+qivTFhSoubu4CsKLfVgUBJ/j
X-Received: by 10.107.178.5 with SMTP id b5mr7050707iof.230.1484231554133;
	Thu, 12 Jan 2017 06:32:34 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F981.dip0.t-ipconnect.de. [93.232.249.129])
	by smtp.gmail.com with ESMTPSA id
	w192sm1146418itw.3.2017.01.12.06.32.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 06:32:32 -0800 (PST)
Message-ID: <1484231550.2137.141.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2017 15:32:30 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: runqemu + multiconfig
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
X-List-Received-Date: Thu, 12 Jan 2017 14:32:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

runqemu works okay in a multiconfig setup, but one has to be careful
about how one sets MACHINE in the base configuration (aka local.conf):
it has to be done with ?= and not =

Example:

local.conf:
MACHINE ?= "intel-corei7-64"
BBMULTICONFIG = "core2 quark"

conf/multiconfig/quark.conf:
MACHINE = "intel-quark"

conf/multiconfig/core2.conf:
MACHINE = "intel-core2-32"

$ runqemu refkit-image-noswupd dsk intel-core2-32 ovmf
runqemu - INFO - Assuming MACHINE = intel-core2-32
runqemu - INFO - Running MACHINE=intel-core2-32 bitbake -e...
runqemu - INFO - MACHINE: intel-core2-32
runqemu - INFO - DEPLOY_DIR_IMAGE: .../tmp-glibc/deploy/images/intel-core2-32
runqemu - INFO - CONFFILE: .../tmp-glibc/deploy/images/intel-core2-32/...-intel-core2-32.qemuboot.conf

When using MACHINE = "intel-corei7-64" in local.conf, overriding the
MACHINE with "MACHINE=intel-core2-32 bitbake -e..." fails and runqemu
ends up using the image directory of the base configuration:

$ runqemu refkit-image-noswupd dsk intel-core2-32 ovmf
runqemu - INFO - Assuming MACHINE = intel-core2-32
runqemu - INFO - Running MACHINE=intel-core2-32 bitbake -e...
runqemu - INFO - MACHINE: intel-core2-32
runqemu - INFO - DEPLOY_DIR_IMAGE: .../tmp-glibc/deploy/images/intel-corei7-64
Traceback (most recent call last):
....
Exception: Failed to find <image>.qemuboot.conf!

This was with the patch for qemu support in meta-intel and the OVMF
firmware, but should also apply to the normal qemux86/qemux86-64.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




