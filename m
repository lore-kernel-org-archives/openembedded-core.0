Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2E12C77D81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:34:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7GDYLx1015153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 16 Aug 2017 14:34:22 +0100
Message-ID: <1502890461.13978.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 14:34:21 +0100
In-Reply-To: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 16 Aug 2017 14:34:22 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: peter.kjellerstedt@axis.com
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Wed, 16 Aug 2017 13:34:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-15 at 16:41 -0500, Mark Hatle wrote:
> From the comments to the original patch, the only not addressed was
> adding an OE self-test for this behavior.  I tried to do this, but I
> don't see any existing tests that build a recipe and inspect the
> results of the built package.  I'm not sure of any other way to
> identify if things are working or not.

oe-selftest can do this.

> I have built and tested this for:
> 
> core-image-base core-image-minimal core-image-full-cmdline 
> core-image-kernel-dev core-image-lsb core-image-lsb-dev 
> core-image-lsb-sdk core-image-testmaster core-image-clutter 
> core-image-weston core-image-x11 core-image-sato core-image-sato-dev 
> core-image-sato-sdk core-image-sato-sdk-ptest

As we both suspected there are some issues with enabling this again,
many are showcased here:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/builds/1156/steps/BuildImages/logs/stdio

* ltp has ksh/csh requirements in ptest
* package dhcp-client-4.3.5-r0.0.armv5e requires libdns.so.170, but none of the providers can be installed
* nothing provides /usr/bin/python33 needed by bind-9.10.5+P3-r0.0.armv5e
ERROR: openssl-1.1.0f-r0 do_package_qa: QA Issue: /usr/lib/openssl/ptest/util/find-unused-errs contained in package openssl-ptest requires /bin/bash, but no providers found in RDEPENDS_openssl-ptest? [file-rdeps]
ERROR: openssl-1.1.0f-r0 do_package_qa: QA Issue: /usr/lib/openssl/ptest/fuzz/helper.py contained in package openssl-ptest requires /usr/bin/python, but no providers found in RDEPENDS_openssl-ptest? [file-rdeps]
ERROR: bind-9.10.5-P3-r0 do_package_qa: QA Issue: /usr/sbin/dnssec-checkds contained in package bind requires /usr/bin/python33, but no providers found in RDEPENDS_bind? [file-rdeps]

I suspect the key piece of testing you were missing may have been ptest enablement?

I might try and sort a few patches for pieces of this.

Cheers,

Richard


