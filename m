Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PxBR8-0005zU-OR
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 05:55:50 +0100
Received: by pxi1 with SMTP id 1so42939pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2011 20:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=2RzkHLD1eLW1yHZ6NKSMBTVR3ghtdukE81W0IIpX6EA=;
	b=WNNyNK6YOQcItS3eisnJkc8kN14+5e2ecp55LOfGJ3ZrestIy7HCKje4zyRLCJ3QV4
	IctfpFSF9gGDPY8kIYMqTyrEl7LNI1YV3WpxgaDuqtvjiD7An2sodW9qEBlEZOY3T1D4
	KJezt/e0Ux2SPPZHvkKkZciNWH02b60rryF7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=o5S6nt24dJ/3JPhAhlmZLbB3Kl4FqS8TD2I48e6Y5SocE/r56O+FFG4UJPsOVQ13lV
	ijRdaZKlSEChJFdDBs0ODmZguKkSDj4aslIcjddQPKfP+sZp/7Hg76nBHIcon294cNn3
	7SE5iyDKkWI0+sMpNdgv7I2s9yoHkUmX15XbA=
Received: by 10.142.165.21 with SMTP id n21mr5075238wfe.310.1299646450312;
	Tue, 08 Mar 2011 20:54:10 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o11sm1910047wfa.0.2011.03.08.20.54.06
	(version=SSLv3 cipher=OTHER); Tue, 08 Mar 2011 20:54:08 -0800 (PST)
Message-ID: <4D7707E9.3080702@gmail.com>
Date: Tue, 08 Mar 2011 20:54:01 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: Nitin A Kamble <nitin.a.kamble@intel.com>
References: <cover.1299633840.git.nitin.a.kamble@intel.com>
	<33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
In-Reply-To: <33b26ba051fa171e480bce3a1e4497a619241176.1299633840.git.nitin.a.kamble@intel.com>
Cc: poky@yoctoproject.org, Jingdong Lu <jingdong.lu@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gcc-runtime: fix LSB library checks for libstdc++.so.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Mar 2011 04:55:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/2011 5:26 PM, Nitin A Kamble wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> [YOCTO #795]
>
> When we run library check of LSB on qemux86 and qemuppc, we got some failures
> about 'libstdc++.so.6'.
>
> Test environment:
> Platform: Qemu-x86, Qemu-ppc
> lsb image: poky-image-lsb-qemux86-test.ext3(Feb 26th, auto-build server)
> Library check of LSB: 4.1.0-1
>
> The error log:
> Did not find _ZNKSt5ctypeIcE8do_widenEPKcS2_Pc (GLIBCXX_3.4) in libstdc++.so.6
> Unmangled symbol name: std::ctype<char>::do_widen(char const*, char const*,
> char*) const
> ...
>
>   found that some weak symbols ('W') change into local ('t') during link time
> and be stripped. According to compiling log, the option
> "-fvisibility-inlines-hidden" is used for gcc. And this option caused some weak
> symbols change into local.
>
> see http://bugzilla.pokylinux.org/show_bug.cgi?id=795 for more information on the bug.
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> Signed-off-by: Jingdong Lu<jingdong.lu@windriver.com>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

thank you. Applied it to openembedded-core


