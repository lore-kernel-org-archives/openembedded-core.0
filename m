Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37A3977F85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 14:59:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v95Ex3sY026241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Oct 2017 07:59:03 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 5 Oct 2017 07:59:02 -0700
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <67768df5-8082-3433-715c-1c2bfde6f973@windriver.com>
Date: Thu, 5 Oct 2017 09:59:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
Subject: Re: Recipe versions and layer confusion
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
X-List-Received-Date: Thu, 05 Oct 2017 14:59:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/5/17 9:49 AM, Mike Looijmans wrote:
> I'm confused.
> 
> Layer "meta-xilinx" defines:
> 
> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.1.bb
> 
> This recipe is too old for my liking, so I made a newer one in "meta-topic"
> 
> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.3.bb
> 
> 
> Much to my surprise, when I build, OE picks the 2017.1 version and not the 
> 2017.3 version.

Typically the version is selected by whichever PV is 'higher'.  However there
are many ways to change this behavior.

The primary way is for a configuration file (often the machine configuration) to
defined a preferred version.  I.e.

  PREFERRED_VERSION_arm-trusted-firmware = "2017.1"

Most likely there is a line like that someone in meta-xilinx.

Additional ways would be to have a recipe define itself as never the default
version.

> bitbake-layers show-layers reveils:
> ..
> meta-xilinx           /home/mike/projects/zynq-platform/meta-xilinx  5
> meta-topic            /home/mike/projects/zynq-platform/meta-topic  6
> ..

The layer priority does not directly affect recipe selection.  It may if you
have two layers of the -same- version.

--Mark

> so that means that my meta-topic should win even if my PV were lower, right?
> 
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> Visit us at the Space Tech Expo Europe (Stand E-71)
> 


