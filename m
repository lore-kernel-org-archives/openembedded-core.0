Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SIilc-0004AI-SV
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 17:50:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3DFexiW020426
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 08:40:59 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 13 Apr 2012 08:40:58 -0700
Message-ID: <4F88490A.1070707@windriver.com>
Date: Fri, 13 Apr 2012 10:40:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1334265557.git.mark.hatle@windriver.com>
	<3d06ef85d583f8ef824cb7ca91ff070dcddd0e8b.1334265557.git.mark.hatle@windriver.com>
	<4F884293.6000101@linux.intel.com>
	<4F8844AD.8090406@windriver.com> <1334331230.7309.80.camel@ted>
In-Reply-To: <1334331230.7309.80.camel@ted>
Subject: Re: [PATCH 1/2] pseudo: Tell pseudo to avoid specifying an RPATH
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
X-List-Received-Date: Fri, 13 Apr 2012 15:50:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/13/12 10:33 AM, Richard Purdie wrote:
> On Fri, 2012-04-13 at 10:22 -0500, Mark Hatle wrote:
>>> We might still need this rpath or something similar since the nativesdk
>>> now breaks not finding the correct version of the included libc.so.6
>>
>> In this case, I don't think embedding a static RPATH makes sense, but perhaps a
>> $ORIGIN path might?
>>
>> Can chrpath be used to add an rpath after compilation and linking, if so that is
>> what I would suggest to do.  Otherwise I'm not exactly sure how to resolve this...
>>
>> Note, typically pseudo is -not- linked the "sdk" version of the libc, but is
>> linked to the host libc.  In the past when exporting and sdk with something like
>> pseudo you needed to either build on a common machine (where everything was
>> compatible) or have a way to rebuild pseudo on the final target system.  Perhaps
>> that is what is needed?
>
> We need to embed a full static rpath and then our nativesdk relocation
> code will then handle adding in the correct $ORIGIN for us.
>
> The way the sdk works, it will link against the sdk libc btw and this
> avoids the need to rebuild on the target system. We just need the rpath
> in there so it can figure things out correctly.

Ha, that is what we had (unintentionally) that triggered the QA failure.

If it's only for a nativesdk build, then we simply switch the --without-rpath

--Mark

> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



