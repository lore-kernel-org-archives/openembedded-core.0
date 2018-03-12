Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD3A71AB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 19:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2CJnSDt027961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 12 Mar 2018 12:49:28 -0700
Received: from soho-mhatle-m.local (147.11.119.245) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 12:48:48 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Zhang Xiao
	<xiao.zhang@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
	<a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
	<dcc91a62-07a3-9374-5f5c-41fae23fb682@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <cc14195a-81df-190f-23fa-9c914e21e6d9@windriver.com>
Date: Mon, 12 Mar 2018 12:48:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <dcc91a62-07a3-9374-5f5c-41fae23fb682@linux.intel.com>
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
X-List-Received-Date: Mon, 12 Mar 2018 19:49:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/12/18 11:55 AM, Alexander Kanavin wrote:
> On 03/12/2018 08:38 PM, Mark Hatle wrote:
>> In this case, because the user specifically asked for BOTH 32-bit and 64-bit
>> development components to be installed onto the target for their application
>> development.  (This isn't a theoretical problem, but a specific problem from one
>> of our customers.)
> 
> Fair enough, but you should explain to the customer that Unix-type 
> systems are not designed for this. There are hardcoded assumptions 
> everywhere, that for each component there's only one set of header 
> files, one .pc file, and one -config-style helper binary. Desktop 
> distributions mutually exclude multilib -dev packages for this reason.

The desktop distribution I used (CentOS and Fedora) support this type of
multilib-dev.  I have to use the header file stuff all the time.  I don't know
how they handle the -config case.

But for the .pc files, they are typically installing in the libdir (not the
datadir) for anything that is arch specific.  So that resolves the multilib
issue for that piece.

>> The under the hood it can rename the 'python3.5m-config' to a nonconflicting
>> name (based on the base_libdir, since we know that will be unique)... and then
>> invoke a post-install script that will define an appropriate priority to ensure
>> that python3.5m-config will match the final 'python3.5m' version.  (Possibly
>> using update-alternatives to manage this.)
> 
> Here's something I don't get. When the user starts actual development, 
> and calls python3.5-config to fetch configuration values, how do we 
> ensure that the 'right' python3.5m-config is called, from the two that 
> are installed? Same question for pkgconfig - how do we make sure it 
> would look in the 'right' library directory of the two that are available?

For the pkgconfig side, pkgconfig (used to) check gcc for the libdir.  I say
used to cause, I don't know if this was implemented in OE or not.  I don't
remember.  At one time, I believe this was done using "PKG_CONFIG_LIBDIR" and
re-execing the program... but it's been a long time since I looked or cared
specifically.  Most '.pc' files I know of are identical for all multilibs..
having differences is really strange, and makes me really wonder if there are
other issues with the package producing them.

For the python3.5m-config stuff, (assuming we create a general purpose system to
resolve this).  It should be able to query the executable that was installed and
figure out which base_libdir it is associated with, and then use that
information to switch to the correct '-config'.  If the user knows they want a
specific libdir version, then that would be up to the specific user to invoke.

This way the user can run a version of the default with reasonable expectations
the default will match their running system -- or manually specific the file and
type they want to execute and get the exact version they care about.


I think my objective is, primarily, that the 'default' behavior of the system
needs to be reasonable.   So for any user who does not declare a specific
'version to be used', the 'right thing happens automatically'.   Where the right
thing would be:

*) Use a common configuration that works everywhere.
*) Determine [automatically] the configuration that matches the system.
*) Stop and tell the user that it does not know the right solution. (Error)

Then an advanced user to select a specific version of the 'alternatives'.  The
key with all of this is that it needs to be 'reasonable' for both the recipe
maintainer and the end user.  Having to manually rename things, use the existing
update-alternatives, etc really isn't a good idea -- even if it solves (some of)
the user issues.

--Mark

> Alex
> 


