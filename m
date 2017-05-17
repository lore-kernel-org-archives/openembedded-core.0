Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00CE260750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 12:58:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 05:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1131373281"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2017 05:58:38 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
	<8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
	<6d634eb4-a0e6-7f56-0d6e-b1324eece035@linux.intel.com>
	<1495018023.28624.38.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b06241d4-97c2-a272-7d38-95091bdb66e7@linux.intel.com>
Date: Wed, 17 May 2017 15:56:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1495018023.28624.38.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] image-mode.bbclass: common infrastructure for choosing image defaults
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
X-List-Received-Date: Wed, 17 May 2017 12:58:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/17/2017 01:47 PM, Patrick Ohly wrote:

> I know that you prefer defining more image recipes over allowing the
> reconfiguration of the same image recipe. I disagree on that, because
> when you have independent aspects (like content and login
> configuration), then you end up with various combinations of those
> configuration options. Writing down all combinations in pre-defined
> image recipes just doesn't scale. But you are welcome to proof me wrong
> by showing how the existing image recipes in OE-core should be changed
> so that they not only cover different content selection, but also what's
> currently done via EXTRA_IMAGE_FEATURES in local.conf.sample.

I disagree that it doesn't scale. It scales just fine with a 
well-constructed include files hierarchy. I'd even argue that's the only 
way to stay sane when there's more than a few product configurations:

all-products.inc
(things common to all products)

product1.inc
(things specific for product1)

product2.inc
(things specific for product2)

production.inc
(where serious security is configured)

development.inc
(where things are made easy for developers)

and then you have

product1-development.bb
====
include product1.inc
include development.inc
====

product2-development.bb
====
include product2.inc
include development.inc
====

product1-production.bb
====
include product1.inc
include production.inc
====

product2-production.bb
====
include product2.inc
include production.inc
====

This pattern is used throughout openembedded. Take a look at machine or 
distro configurations for example, or how both python 2 and 3 can be 
supported with a single recipe include and two very short recipes in 
meta-python. What does IMAGE_MODE do that include files cannot?

Alex


