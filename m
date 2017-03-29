Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8D73277C78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 10:52:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170329105221012_0684;
	Wed, 29 Mar 2017 10:52:21 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=31099 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ctBD3-0003R4-Pe; Wed, 29 Mar 2017 06:52:13 -0400
Date: Wed, 29 Mar 2017 06:52:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Rick Altherr <raltherr@google.com>
In-Reply-To: <CAPLgG==F8OV8U6CVZ2yEyErUhCJw+UwHmbEaCmaXpJBaBeLHaA@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1703290647590.19269@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703281817440.27955@localhost.localdomain>
	<CAPLgG==F8OV8U6CVZ2yEyErUhCJw+UwHmbEaCmaXpJBaBeLHaA@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there OE support for building multi-image/component FIT image files?
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
X-List-Received-Date: Wed, 29 Mar 2017 10:52:23 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Mar 2017, Rick Altherr wrote:

> kernel-fitimage.bbclass loops through all the DTBs listed in
> KERNEL_DEVICETREE and adds a FIT section for each one.  It looks
> like only the first one is put into a config section though.

  that's not what i'm seeing based on a test with YP-provided
beaglebone reference board. that machine config file includes the
line for two dtb files:

  KERNEL_DEVICETREE="am335x-bone.dtb am335x-boneblack.dtb"

and the resulting .its file generated contains two configurations --
using the same kernel, and for each dtb file. i just need to read the
code more carefully to verify that it appears to loop through all the
dtb files.


images {
        kernel@1 {
                description = "Linux kernel";
                data = /incbin/("linux.bin");
                type = "kernel";
                arch = "arm";
                os = "linux";
                compression = "none";
                load = <0x80008000>;
                entry = <0x80008000>;
                hash@1 {
                        algo = "sha1";
                };
        };
        fdt@am335x-bone.dtb {
                description = "Flattened Device Tree blob";
                data = /incbin/("arch/arm/boot/dts/am335x-bone.dtb");
                type = "flat_dt";
                arch = "arm";
                compression = "none";
                hash@1 {
                        algo = "sha1";
                };
        };
        fdt@am335x-boneblack.dtb {
                description = "Flattened Device Tree blob";
                data = /incbin/("arch/arm/boot/dts/am335x-boneblack.dtb");
                type = "flat_dt";
                arch = "arm";
                compression = "none";
                hash@1 {
                        algo = "sha1";
                };
        };
	};

configurations {
        default = "conf@am335x-bone.dtb";
        conf@am335x-bone.dtb {
			description = "1 Linux kernel, FDT blob";
			kernel = "kernel@1";
			fdt = "fdt@am335x-bone.dtb";


                hash@1 {
                        algo = "sha1";
                };
        };

        conf@am335x-boneblack.dtb {
			description = "0 Linux kernel, FDT blob";
			kernel = "kernel@1";
			fdt = "fdt@am335x-boneblack.dtb";


                hash@1 {
                        algo = "sha1";
                };
	};
};


rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


