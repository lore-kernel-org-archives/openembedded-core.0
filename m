Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 37BD860670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 09:51:57 +0000 (UTC)
Received: by igbzc4 with SMTP id zc4so123223015igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 02:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=xx8yG+7YIrw7/l0q516pWI56sku72R/8I/dmPNQdkN4=;
	b=UCx4jZh08g4CIs8S+tcfzMASNcUrOawTvViy1GAo65lIJsmuz9pUv68NNtPOrVk7yz
	SbFIGQJoTUOPyFlvTbL5OQcsRJMvx4Ty60sC/hi8sxnUd/K3jczv6Fjwzl0b7zHTjQAv
	/zmGQyvD39DZPKkJX5+DvkbbX3PEJvLMt1gVeeMH0n8GymNeH6rTAFIJANUh5lrkGjda
	4xYPSqS1GWSmkZATqcWLermfRLSFSWoggNAiwRfxGIasOzdQGF6Iny7kb64pwL/7icp8
	uda/5+2nv9rlmAcMOwWdvvbS+xTyJmhe7kHw3NDTnuP4gYcnA92sckvQ/1BznYvXuuwJ
	Aj9Q==
X-Gm-Message-State: ALoCoQkP40izE2FFMEgZcmqdIfMWy7Fo8JgDRJtAedEt5VNhAHnIQEQpxKdL+B6Bp+GN4xGAesI0
X-Received: by 10.107.164.70 with SMTP id n67mr13851302ioe.8.1434621118576;
	Thu, 18 Jun 2015 02:51:58 -0700 (PDT)
Received: from pohly-mobl1 (p57A579B2.dip0.t-ipconnect.de. [87.165.121.178])
	by mx.google.com with ESMTPSA id h10sm4580730iod.44.2015.06.18.02.51.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jun 2015 02:51:57 -0700 (PDT)
Message-ID: <1434621114.29550.41.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 18 Jun 2015 11:51:54 +0200
In-Reply-To: <55802926.7020009@windriver.com>
References: <1434370643.9085.98.camel@intel.com>
	<557F2BF1.5000605@windriver.com> <1434441993.9085.152.camel@intel.com>
	<55802926.7020009@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: KCONF_AUDIT_LEVEL + kernel_configcheck
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
X-List-Received-Date: Thu, 18 Jun 2015 09:51:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-16 at 09:48 -0400, Bruce Ashfield wrote:
> On 2015-06-16 04:06 AM, Patrick Ohly wrote:
> > I cannot say how much noise it would create in practice, but at least I
> > had one specific case where I was using a non-hardware configuration not
> > supported by the kernel and would have appreciated a warning about
> > that ;-}
> 
> This is good feedback, and I am planning to expose more of the output,
> including some dependency information (since without giving hints on how
> to fix a warning .. more warnings are not all that helpful :)

FWIW, my use case is the meta-security-smack layer, which is intended to
be BSP independent, but needs to turn on certain kernel configuration
options:

https://github.com/01org/meta-intel-iot-security/tree/master/meta-security-smack/recipes-kernel/linux-yocto/linux-yocto

This depends on a recent enough kernel or with the right patches
back-ported, which is hard to test for in that layer, so warnings from
the kernel configuration phase would be useful.

Ideally, the warning should tell the user where the unsupported
configuration option came from, because that's where the README is which
explains the expectations of the layer regarding the underlying BSP.

Speaking of that layer, I understand that not all kernels are called
"linux-yocto", and not all kernels support configuration fragments, so
the linux-yocto_%.bbappend is not ideal, but the best I could come up
with.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




