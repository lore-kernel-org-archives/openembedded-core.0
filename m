Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QbZKB-0007sf-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:31:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5SERr81012380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:27:53 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 28 Jun 2011 07:27:52 -0700
Message-ID: <4E09E4E6.9040703@windriver.com>
Date: Tue, 28 Jun 2011 09:27:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1309239001.git.dexuan.cui@intel.com>	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
In-Reply-To: <3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's	branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 14:31:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/28/11 1:45 AM, Koen Kooi wrote:
> 
> Op 28 jun 2011, om 07:37 heeft Dexuan Cui het volgende geschreven:
> 
>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>> ---
>> meta/classes/base.bbclass |   14 +++++++++++++-
>> 1 files changed, 13 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index 119b052..4766c77 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -165,9 +165,21 @@ python base_eventhandler() {
>> 			note(msg)
>>
>> 	if name.startswith("BuildStarted"):
>> +		corebase = data.getVar("COREBASE", e.data, 1)
>> +		corelayers = [corebase + "/meta", corebase + "/meta-yocto"]
>> +		layers = (data.getVar("BBLAYERS", e.data, 1) or "").split()
>> +		layers = [i for i in layers if i not in corelayers]
>> +		fmt_str = "%-27s = \"%s\""
>> +		layer_branches = [fmt_str % (os.path.basename(i)+"_BRANCH", \
>> +			base_get_metadata_git_branch(i, None).strip()) for i in layers]
>> +		layer_revisions = [fmt_str % (os.path.basename(i)+"_REVISION", \
>> +			base_get_metadata_git_revision(i, None)) for i in layers]
>> 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
>> 		statusvars = ['BB_VERSION', 'METADATA_BRANCH', 'METADATA_REVISION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TARGET_FPU']
>> -		statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
>> +		statuslines = [fmt_str % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
>> +		for i in range(len(layer_branches)):
>> +			statuslines.insert(3+2*i, layer_branches[i])
>> +			statuslines.insert(3+2*i+1, layer_revisions[i])
>> 		statusmsg = "\nOE Build Configuration:\n%s\n" % '\n'.join(statuslines)
>> 		print statusmsg
> 
> I tried this patch and I get:
> 
> OE Build Configuration:
> BB_VERSION                  = "1.13.1"
> METADATA_BRANCH             = "master"
> METADATA_REVISION           = "364ca0d2d0399c8cc6d3b3fc28308e1e14673544"
> meta-angstrom_BRANCH        = "master"
> meta-angstrom_REVISION      = "c19c342c62416752117c2dce4696840bc864f647"
...
> TARGET_ARCH                 = "arm"
> TARGET_OS                   = "linux-gnueabi"
> MACHINE                     = "beagleboard"
> DISTRO                      = "angstrom"
> DISTRO_VERSION              = "v2011.06-core"
> TARGET_FPU                  = "hard"
> 
> So it works as expected, but the output is a bit confusing. I have a few (conflicting) suggestions:
> 
> 1) replace _BRANCH and _REVISION with ' branch' and ' revision', e.g.:
> 
> 	meta-archos branch          = "master"
> 	meta-archos revision        = "413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
> 
> 2) for the extra layers put branch and revision on a single line:
> 
> 	meta-archos          = "master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
> 
> 3) Move the revision info down, e..g
> 
> OE Build Configuration:
> BB_VERSION                  = "1.13.1"
> TARGET_ARCH                 = "arm"
> TARGET_OS                   = "linux-gnueabi"
> MACHINE                     = "beagleboard"
> DISTRO                      = "angstrom"
> DISTRO_VERSION              = "v2011.06-core"
> TARGET_FPU                  = "hard"
> METADATA_BRANCH             = "master"
> METADATA_REVISION           = "364ca0d2d0399c8cc6d3b3fc28308e1e14673544"
> meta-angstrom_BRANCH        = "master"
> meta-angstrom_REVISION      = "c19c342c62416752117c2dce4696840bc864f647"
> 
> etc.
> 
> What do you think about that?

I think my preference is either 3 or a combination of 2 & 3.

To me the important bits are the configuration settings, followed by the
components that are being used as a secondary concern.  It will all help in
debugging and issue, but if the target/distro isn't correct then it doesn't
matter what the rest is.

--Mark

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



