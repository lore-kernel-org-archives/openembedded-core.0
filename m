Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrXfI-0001vO-CY
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 17:59:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7BFsqEn004893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 08:54:52 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 11 Aug 2011 08:54:51 -0700
Message-ID: <4E43FB4A.20605@windriver.com>
Date: Thu, 11 Aug 2011 10:54:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
	<1313061918.6733.120.camel@phil-desktop>
In-Reply-To: <1313061918.6733.120.camel@phil-desktop>
Subject: Re: [PATCH 2/3] Add basic Mips core tune config
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
X-List-Received-Date: Thu, 11 Aug 2011 15:59:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/11/11 6:25 AM, Phil Blundell wrote:
> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
>> +# MIPS Architecture definition
>> +# 12 defined ABIs, all combinations of:
>> +# *) Big/Little Endian
>> +# *) Hardware/Software Floating Point
>> +# *) o32, n32, n64 ABI
>> +
>> +DEFAULTTUNE ?= "mips"
>> +
>> +# Endianess
>> +TUNEVALID[bigendian] = "Enable big-endian mode"
>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel", d
> 
> I've just been trying to do a mips build for the first time since these
> patches were landed and I'm a little bit unclear about what the "right"
> way to declare endianness is nowadays.
> 
> The new tuning system has introduced the idea of endianness as an ABI
> tune parameter and, by implication, if I don't have "bigendian" in
> TUNE_FEATURES then presumably this is meant to mean little-endian.
> However, there seem to be at least some places in OE which are still
> expecting endianness to be encoded into TARGET_ARCH, i.e. a
> little-endian system would be TARGET_ARCH=mipsel rather than mips. 

My understanding of MIPS and how everything should have been configured.

canonical arch = mips = big endian -- mipsel = little endian.  Anything else is
incorrect.

As for the CCARGS, the versions of gcc that I am used to, little endian is the
default tuning.  But we still want to provide -mel to ensure we've got the right
one.

> Right now, building a little-endian MIPS32 doesn't seem to work either
> way around.  If I set TARGET_ARCH=mips and exclude bigendian from
> TUNE_FEATURES then (among other issues) uclibc-config.inc decides that
> my system is bigendian and sticks -Wl,-EB back into LDFLAGS.
> Conversely, if I set TARGET_ARCH=mipsel then I don't get "mips" in
> OVERRIDES and I end up with the wrong uClibc.machine and associated
> -mips1 lossage.

The TUNE you should be using is "mipsel" instead of "mips".  (The DEFAULTTUNE)
parameter.  The TUNE_ARCH, made up of
"mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}", should result in mipsel.

> That latter failure is at least relatively easy to work around and so
> that's what I'm doing at the moment.  But I don't know whether this is
> the "right" way to proceed or whether TARGET_ARCH is expected to be
> endian-agnostic in this newly tuned-up world.

TARGET_ARCH is results from TUNE_ARCH, which should be encoding the right values.

The default tune of mipsel sets the values of: TUNE_FEATURES_tune-mipsel = "o32
fpu-hard"

Which is expected to work, for mips, little endian, o32, with hard-float.

--Mark


> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



