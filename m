Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 09E8A71AC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 09:12:32 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v0O9CVS9006468
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 24 Jan 2017 10:12:32 +0100
Received: from [139.16.79.32] (MD1FZU9C.ad001.siemens.net [139.16.79.32])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id v0O9CVc9018909
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2017 10:12:31 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1484817397-7308-1-git-send-email-pascal.bach@siemens.com>
	<1484999072.9391.1.camel@linuxfoundation.org>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <5f10b43a-7df9-4084-9b64-7c9dd6f4a0e6@siemens.com>
Date: Tue, 24 Jan 2017 10:12:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484999072.9391.1.camel@linuxfoundation.org>
Subject: Re: Passing additional data from packages to be used during image creation
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
X-List-Received-Date: Tue, 24 Jan 2017 09:12:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 21.01.2017 12:44, Richard Purdie wrote:
> On Thu, 2017-01-19 at 10:16 +0100, Pascal Bach wrote:
>> I would like to pass some additional data generated during the
>> creation of a package to the image creation step.
>> The idea is to use this data to generate a more detailed manifest of
>> what is included in the image. In the concrete case
>> I would like to pass a list of required copyright files that need to
>> be checked for during image creation.
>>
>> My current approach is to add this list as a new variable COPYRIGHTS
>> to the pkgdata of each package.
>> Using the image manifest to determine the package this allows me to
>> compile a list of all required copyrights.
>>
>> The following patch allows to add extra variables to pkgdata and thus
>> allows to pass additional data
>>
>> - [PATCH] package.bbclass: allow additional variables to be added to
>>
>> Is this a valid approach or did a miss a simpler way to access any
>> package data during image creation?
> I'm curious if adding something to PACKAGEVARS would work or if not,
> why not?
Just adding it to PACKAGEVARS is not enough as the list of variables written to the pkgdata files is hard coded in emit_pkgdata here: https://github.com/openembedded/openembedded-core/blob/master/meta/classes/package.bbclass#L1365

However I notices an issue with the code as it seams the do_package step is not triggered if a variable in PACKAGE_EXTRA_PKGDATA changes. I'm not sure why as it should be
added as a vardeps to the do_package task. For example if I add "COPYRIGHTS" to PACKAGE_EXTRA_PKGDATA and than change the COPYRIGHTS variable in a recipe the do_package step doesn't get executed.
I'm trying to figure out why but if somebody can spot what I did wrong this would be appreciated.

Pascal



