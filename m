Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61DDC7016E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 21:27:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u29LRY5h002357
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Mar 2016 13:27:34 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 13:27:34 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
	<56E09460.9070105@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56E09545.6020602@windriver.com>
Date: Wed, 9 Mar 2016 15:27:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E09460.9070105@windriver.com>
Subject: Re: [PATCH] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 21:27:36 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/9/16 3:23 PM, Mark Hatle wrote:
> On 3/9/16 2:33 PM, Burton, Ross wrote:
>>
>> On 9 March 2016 at 18:19, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com
>> <mailto:ricardo.ribalda@gmail.com>> wrote:
>>
>>     +                        bb.warn("Package %s rdepends on itself. Ignoring
>>     this dependency" % pkg)
>>
>>
>> Depending on yourself seems wrong no matter what packaging backend you're using,
>> even if it isn't fatal.  Maybe this should be added to the general sanity checks
>> in insane.bbclass?
>>
>> Ross
>>
>>
> 
> I disagree.. it's quite common for an automatic dependency to trigger a
> dependency on one's self.  I.e.:
> 
> python provides /usr/bin/python
> 
> python includes a script that uses /usr/bin/python
> 
> depends system now has a provide and dependency for /usr/bin/python in the same
> package.  This is 'fine'.
> 
> Since opkg/deb can't handle file based dependencies, it would be reasonable for
> a dependency on /usr/bin/python to be translated to 'python'.
> 
> And now you have the python package depending on the python package.
> 
> 
> If the package manager interface does not support this, then it should be the
> package manager .bbclass that should filter out these items.
> 
> This is what we've had to do in the rpm backend... I think it's reasonable for
> the deb and opkg backends as well.

Just wanted to clarify the above.  RPM -does- support self-referencing
dependencies.  Circular dependencies are different, in that A -> B -> C -> A..
those are detected and there is some basic logic to break those.

The RPM backend has rule checks where the RPM rules differ from the OE/deb/opkg
and translates to the correct RPM style rules.  This is what I think deb/opkg
should be doing.. checking RPM/OE style rules and translating.

--Mark

> --Mark
> 


