Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 955E8736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 16:39:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAAGd4dZ032668
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 Nov 2015 08:39:04 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 08:39:03 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56421DA6.5080700@windriver.com>
Date: Tue, 10 Nov 2015 10:39:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56420F08.1050209@linux.intel.com>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 16:39:06 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/10/15 9:36 AM, Alexander Kanavin wrote:
> On 11/10/2015 04:31 PM, Mark Hatle wrote:
>> Is there a way that the qemu calls can be replaced by calls to an actual running
>> board (via SSH perhaps) to get the necessary information?  While inconvenient
>> this might be a valid workaround.
> 
> Theoretically, yes. Copy the sysroot and the build tree to the board (to 
> some safe location, obviously), then execute the arch-dependent bits of 
> the process remotely, then copy the output files back. Slow, but doable. 
> The executable wrapper mechanism for that is already provided by the 
> patchset.
> 
> I would however first seriously look into reengineering g-o so that it's 
> architecture-independent, and doesn't require such awful contortions. 

I don't disagree with you there...

> Primarily, two things:
> 1) It should be easy to build transient introspection binaries for the 
> native architecture, instead of building them for the target together 
> with the rest of the package. Those binaries produce textual output 
> (essentially a list of classes/signals/properties) which is 
> architecture-independent.
> 2) The binary introspection database in .typelib files should not be a 
> raw dump of a C structure, and should be actually the same on all 
> architectures.
> 
>> Also is there any facility to caching the gobject responses (other then standard
>> sstate-cache) so for machine that do not have QEMU support we can used a cached
>> set of responses?  (I'm not sure if these responses could be considered to be a
>> global cache, or if they are distribution specific in configuration.  Likely the
>> later.)
> 
> This requires custom bitbake support I'm afraid, a specialist needs to 
> answer this.
> 

Let me rephrase.  Instead of calling out to qemu (or a real target) for a
gobject and result.  Can the result be cached (like we do with the config-site
info?)  This would allow me to run say a MIPS64 n64 gobject build, cache the
results and use it on my octeon3 build (which can't run in QEMU.)

--Mark

> 
> Alex
> 


