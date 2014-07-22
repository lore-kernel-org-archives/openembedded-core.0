Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 648C070734
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 17:04:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6MH44OB002405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 10:04:05 -0700 (PDT)
Received: from msp-dhcp53.wrs.com (172.25.34.53) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 10:04:04 -0700
Message-ID: <53CE9984.3090106@windriver.com>
Date: Tue, 22 Jul 2014 12:04:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.11.1407221229210.8547@localhost>	<CABcZAN=XYZTXYRuR1AdaD_NdeYwzDv8DyvrQaSnyqbtLC_OC7A@mail.gmail.com>
	<alpine.LFD.2.11.1407221250500.9028@localhost>
In-Reply-To: <alpine.LFD.2.11.1407221250500.9028@localhost>
Subject: Re: why conditional assignment of DEPLOY_DIR_IMAGE in bitbake.conf?
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
X-List-Received-Date: Tue, 22 Jul 2014 17:04:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/14, 11:53 AM, Robert P. J. Day wrote:
> On Tue, 22 Jul 2014, Christopher Larson wrote:
>
>>
>> On Tue, Jul 22, 2014 at 9:36 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>          quite possibly another silly question, but i'm perusing poky's
>>        version of bitbake.conf and i see this:
>>
>>        DEPLOY_DIR ?= "${TMPDIR}/deploy"
>>        DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
>>        DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
>>        DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
>>        DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
>>        DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
>>        DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
>>
>>          now, what is the value of using "?=" to set DEPLOY_DIR_IMAGE, rather
>>        than just "=". i know what "?=" represents, but i normally expect to
>>        see it in a context where someone might have set it earlier to some
>>        other value, but this is in bitbake.conf, before any of the "include"
>>        or "require" directives to pull in any of the other .conf files. so in
>>        the midst of all those other DEPLOY_DIR_* hard assignments, why is the
>>        images directory a conditional install?
>>
>>
>> s/install/define/
>
>    um, quite so. :-P
>
>> If there's a ?= done before any includes in bitbake.conf, either its
>> position in the file has changed, or it's set that way to allow the
>> user to add those variables to the env whitelist and set them in the
>> environment, as the env is set before bitbake.conf is parsed.
>
>    ah, gotcha. so the obvious question is, who decides which variables
> merit this sort of behaviour and which don't? why two variables out of
> the DEPLOY_DIR_* variables and not the rest? seems sort of arbitrary.

Who, whoever sends patches with a need.

I know I've used both the DEPLOY_DIR and DEPLOY_DIR_IMAGE before to simplify a 
few things on the command line.. (but I don't use them regularly).

The others being based on those have not caused me problems the few times I've 
wanted to override it from the command line.

--Mark

> rday
>
>
>


