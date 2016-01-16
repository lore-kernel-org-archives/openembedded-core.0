Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 858BD6011A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 11:08:02 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id E6930280042;
	Sat, 16 Jan 2016 12:07:59 +0100 (CET)
To: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
	<1452856339.28375.139.camel@linuxfoundation.org>
	<5699D6FB.7040302@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <569A248F.9030500@topic.nl>
Date: Sat, 16 Jan 2016 12:07:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <5699D6FB.7040302@windriver.com>
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
X-List-Received-Date: Sat, 16 Jan 2016 11:08:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 16-01-16 06:36, Robert Yang wrote:
>
>
> On 01/15/2016 07:12 PM, Richard Purdie wrote:
>> On Thu, 2016-01-14 at 18:29 -0800, Robert Yang wrote:
>>> There are a lot of binary packages have files in /etc/, but only a
>>> few
>>> of them have set CONFFILES, more than 180 packages are not set in a
>>> world build.  So treat all the files in /etc/ as CONFFILES as Debian
>>> does:
>>> - All the files in /etc/ are CONFFILES
>>> - Move the file out of /etc/ if it is not a conffile
>>> - If /etc/foo can't be moved out, and is changed during
>>>    runtime, then create a symlink /etc/foo -> /var/foo
>>>
>>> [YOCTO #8436]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/conf/bitbake.conf |    1 +
>>>   1 file changed, 1 insertion(+)
>>
>> We have discussed this before and we decided that setting CONFFILES
>> globally seemed like a bad idea?

That is how I recall it. Please please please don't do it. It will wreak 
havoc on all kinds of systems.

> Sorry, but I can't find any emails which said this was a bad idea.
> If we don't set CONFFILES by default, maybe we need mark a lot of
> CONFFILES inside the recipes. I think that mark the CONFFILES under
> /etc/ doesn't hurt anything, but help a lot when doing upgrade on
> target:
>
> 1) When the old file is not changed, it will be replaced by new file.
> 2) When the old file is changed, it will ask the user what to do (dpkg)
>     or save a bak (rpm).

In a perfect world, yeah.

In the world other people have to live in, the GUI has to shut down to 
free up resources to get the upgrade to complete successfully. This 
means you cannot ask the user sitting on the couch holding the remote 
staring at a static "please wait upgrade in progress" screen any questions.

Then if you could ask him questions, he'll just have no clue as to what 
to answer.

You can create "backup" files all you like, but 99% of the users will 
never ever see the file system, and do not know how to rename, edit or 
copy a file. Which on the other hand does not stop them from trying, and 
they're quite used to the situation that a simple reinstall will bring 
things back in working order if they somehow "got it wrong".

In the world I live in, things happen that change files that shouldn't 
be changed. Power outage (could be just the cleaning lady pulling the 
plug) just to name one.

Manually fixing things up is fine if you're an experienced developer or 
power user. But remember that the majority of the end users are less 
tech savvy, and just use a "box" with software that happens to be built 
by OpenEmbedded, which they never heard of.

>> What has changed since the last discussion?

Nothing relevant...


-- 
Mike Looijmans

