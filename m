Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07ED26010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 02:21:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0I2LonQ021895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Jan 2016 18:21:50 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jan 2016 18:21:50 -0800
To: Mike Looijmans <mike.looijmans@topic.nl>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
	<1452856339.28375.139.camel@linuxfoundation.org>
	<5699D6FB.7040302@windriver.com> <569A248F.9030500@topic.nl>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569C4C3C.1080606@windriver.com>
Date: Mon, 18 Jan 2016 10:21:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <569A248F.9030500@topic.nl>
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Mon, 18 Jan 2016 02:21:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/16/2016 07:07 PM, Mike Looijmans wrote:
> On 16-01-16 06:36, Robert Yang wrote:
>>
>>
>> On 01/15/2016 07:12 PM, Richard Purdie wrote:
>>> On Thu, 2016-01-14 at 18:29 -0800, Robert Yang wrote:
>>>> There are a lot of binary packages have files in /etc/, but only a
>>>> few
>>>> of them have set CONFFILES, more than 180 packages are not set in a
>>>> world build.  So treat all the files in /etc/ as CONFFILES as Debian
>>>> does:
>>>> - All the files in /etc/ are CONFFILES
>>>> - Move the file out of /etc/ if it is not a conffile
>>>> - If /etc/foo can't be moved out, and is changed during
>>>>    runtime, then create a symlink /etc/foo -> /var/foo
>>>>
>>>> [YOCTO #8436]
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>   meta/conf/bitbake.conf |    1 +
>>>>   1 file changed, 1 insertion(+)
>>>
>>> We have discussed this before and we decided that setting CONFFILES
>>> globally seemed like a bad idea?
>
> That is how I recall it. Please please please don't do it. It will wreak havoc
> on all kinds of systems.
>
>> Sorry, but I can't find any emails which said this was a bad idea.
>> If we don't set CONFFILES by default, maybe we need mark a lot of
>> CONFFILES inside the recipes. I think that mark the CONFFILES under
>> /etc/ doesn't hurt anything, but help a lot when doing upgrade on
>> target:
>>
>> 1) When the old file is not changed, it will be replaced by new file.
>> 2) When the old file is changed, it will ask the user what to do (dpkg)
>>     or save a bak (rpm).
>
> In a perfect world, yeah.
>
> In the world other people have to live in, the GUI has to shut down to free up
> resources to get the upgrade to complete successfully. This means you cannot ask
> the user sitting on the couch holding the remote staring at a static "please
> wait upgrade in progress" screen any questions.
>
> Then if you could ask him questions, he'll just have no clue as to what to answer.
>
> You can create "backup" files all you like, but 99% of the users will never ever
> see the file system, and do not know how to rename, edit or copy a file. Which
> on the other hand does not stop them from trying, and they're quite used to the
> situation that a simple reinstall will bring things back in working order if
> they somehow "got it wrong".
>
> In the world I live in, things happen that change files that shouldn't be
> changed. Power outage (could be just the cleaning lady pulling the plug) just to
> name one.
>
> Manually fixing things up is fine if you're an experienced developer or power
> user. But remember that the majority of the end users are less tech savvy, and
> just use a "box" with software that happens to be built by OpenEmbedded, which
> they never heard of.


For apt-get, you can configure dpkg to use non-interactive when upgrade or
dist-upgrade:
--force-confnew or --force-confold

For ipkg, I think that you can use: --force-maintainer

For rpm, save a bak is the default action.

// Robert

>
>>> What has changed since the last discussion?
>
> Nothing relevant...
>
>

