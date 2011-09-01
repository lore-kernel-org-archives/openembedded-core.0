Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QzB5S-0004d1-D0
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 19:29:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p81HP1qB006905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2011 10:25:01 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 1 Sep 2011 10:25:01 -0700
Message-ID: <4E5FBFEC.3060406@windriver.com>
Date: Thu, 1 Sep 2011 12:25:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
In-Reply-To: <1314896288.19905.199.camel@phil-desktop>
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 01 Sep 2011 17:29:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/1/11 11:58 AM, Phil Blundell wrote:
> On Thu, 2011-09-01 at 11:54 -0500, Mark Hatle wrote:
>> What is it depending on for the target?  Is the shadow-utils or something now
>> required?  That doesn't seem to make sense to me -- other then we need a
>> passwd/group/shadow/gshadow file to work with.  As long as something can provide
>> those, we should be ok.
> 
> I haven't investigated in detail, but the code from useradd.bbclass
> says:
> 
> # base-passwd-cross provides the default passwd and group files in the
> # target sysroot, and shadow -native and -sysroot provide the utilities
> # and support files needed to add and modify user and group accounts
> DEPENDS_append = " base-passwd shadow-native shadow-sysroot"
> RDEPENDS_${USERADDPN}_append = " base-passwd shadow"

Hmm, good point... I'd forgotten about that.

> And, I guess, if you want to support online package management then it
> does make some sense to have the shadow utils there.  But I don't
> need/want that in my configuration.

Does busybox or something else provide a compatible adduser?  If so maybe a
virtual RDEPENDS is more reasonable in this case.

I think we're caught in the case of we build packages.. as such we need to cover
what the package needs at runtime, this includes install time.  At least w/ a
virtual depend, we can likely fake it by providing it by something else.. but
I'm not sure..

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



