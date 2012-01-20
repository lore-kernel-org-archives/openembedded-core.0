Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RoI1C-0004tq-1u for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 18:12:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KH518T020677;
	Fri, 20 Jan 2012 17:05:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20240-08; Fri, 20 Jan 2012 17:04:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KH4quI020670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 20 Jan 2012 17:04:53 GMT
Message-ID: <1327079091.4268.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 20 Jan 2012 17:04:51 +0000
In-Reply-To: <4F192381.1020603@linux.intel.com>
References: <1327001920.23015.1.camel@ted> <4F192381.1020603@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Ensure that the shared source directory shared the same sstate hashes
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
X-List-Received-Date: Fri, 20 Jan 2012 17:12:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-20 at 00:19 -0800, Saul Wold wrote:
> I tried both a sstate build with and existing tmp and a clean tmp, the 
> existing tmp seemed to work ok, but with a clean tmp (and sstate), I got 
> the following patch issue still.
> 
> This was with BB_SIGNATURE_HANDLER ?= 'basichash' set.
> 
> ERROR: Command Error: exit status: 1  Output:
> Could not link file 
> `.pc/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch/configure' to `configure': No 
> such file or directory
> Applying patch gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> patching file configure.ac
> Hunk #1 FAILED at 3073.
> 1 out of 1 hunk FAILED -- rejects in file configure.ac
> patching file configure
> Hunk #1 FAILED at 7594.
> 1 out of 1 hunk FAILED -- rejects in file configure
> Patch gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in: 
> /intel/poky2/builds/binutils/tmp/work-shared/gcc-4.6.2+svnr181430-r20/temp/log.do_patch.15457
> NOTE: package libgcc-4.6.2+svnr181430-r20: task do_patch: Failed
> ERROR: Task 882 
> (/intel/poky2/distro/meta/recipes-devtools/gcc/libgcc_4.6.bb, do_patch) 
> failed with exit code '1'
> 
> I have not tried a clean sstate / clean tmp.

This only happens with basichash and is due to the stamp mismatch
Lianhao mentions. I happens if the stamps are inconsistent and race
against each other with the same WORKDIR. My patches should address this
problem (although the posted patch has a small bug).

Cheers,

Richard



