Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C518271C69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 18:38:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2CIcEPk026017
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 12 Mar 2018 11:38:15 -0700
Received: from soho-mhatle-m.local (147.11.116.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 11:37:35 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Zhang Xiao
	<xiao.zhang@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
Date: Mon, 12 Mar 2018 11:38:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
Subject: Re: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 18:38:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/12/18 3:13 AM, Alexander Kanavin wrote:
> On 03/12/2018 11:12 AM, Zhang Xiao wrote:
>> Config file udev.pc conflicts between 32 and 64 bit packages.
>> Use update-alternatives to add base_libdir as suffix to avoid it.
>> -inherit autotools update-rc.d qemu pkgconfig distro_features_check
>> +inherit autotools update-rc.d qemu pkgconfig distro_features_check update-alternatives
>> +
>> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
>> +
>> +ALTERNATIVE_${PN}-dev = "udev.pc"
>> +ALTERNATIVE_LINK_NAME[udev.pc] = "${datadir}/pkgconfig/udev.pc"
>> +ALTERNATIVE_TARGET[udev.pc] = "${datadir}/pkgconfig/udev.pc-${MULTILIB_SUFFIX}"
>> +
>> +PACKAGE_PREPROCESS_FUNCS += "eudev_alternative_rename"
>> +
>> +eudev_alternative_rename() {
>> +       # rename udev.pc
>> +       mv ${PKGD}${datadir}/pkgconfig/udev.pc ${PKGD}${datadir}/pkgconfig/udev.pc-${MULTILIB_SUFFIX}
>> +}
> 
> I'm afraid, I have to say no to the entire patchset. It's abusing 
> update-alternatives to do what it was never meant for, and effectively 
> renders one of the -dev packages broken, just so that package manager 
> can satisfy dependencies.
> 
> Let's first take a look at why dnf wants to install two different -dev 
> packages in the first place, and why these seven recipes need to be 
> fixed in particular. My understanding is multilib feature should be used 
> only for libraries, and not for supporting development files.

In this case, because the user specifically asked for BOTH 32-bit and 64-bit
development components to be installed onto the target for their application
development.  (This isn't a theoretical problem, but a specific problem from one
of our customers.)

I had a chance to talk to RP a bit about this today at ELC.  We agree we need a
generic mechanism to handle these types of problems.

For a '.pc' file, there really should be no reason (under normal circumstances)
for them to conflict.  Since if they are are specific they don't belong in the
datadir, but belong in the libdir.

For non-.pc files, if they are 'pkgconfig like', they should be converted to
package config (for the most part this seems to have happened, with a few things
'missed'.)

The remainder then are things that can't be converted for some reason.  So the
'config', or helper or whatever files really need to 'match' the installed binary.

There is no way to predict ahead of time which binary is going to be installed
-- so we really need some type of automated processing that can be used to say:

1) This is a known multilib issue.
2) This file is related to this other file, and should be installed to match.

Under the hood if it uses update-alternatives or anything else doesn't matter --
but in the recipe it should not explicitly require the rename, the ALTERNATIVE
and related declarations etc...

Perhaps something like:

MULTILIB_CONFLICT = "${bindir}/python3.5m-config:${bindir}/python3.5m"

The under the hood it can rename the 'python3.5m-config' to a nonconflicting
name (based on the base_libdir, since we know that will be unique)... and then
invoke a post-install script that will define an appropriate priority to ensure
that python3.5m-config will match the final 'python3.5m' version.  (Possibly
using update-alternatives to manage this.)

--Mark

> Alex
> 


