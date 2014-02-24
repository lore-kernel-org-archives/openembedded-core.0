Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8D43B605F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:42:39 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 562A4F811F1; Mon, 24 Feb 2014 08:42:40 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C5EF6F811E6;
	Mon, 24 Feb 2014 08:42:38 -0700 (MST)
Message-ID: <530B6876.5040209@mlbassoc.com>
Date: Mon, 24 Feb 2014 08:42:46 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1393255080-12382-1-git-send-email-gary@mlbassoc.com>	
	<1393255080-12382-3-git-send-email-gary@mlbassoc.com>
	<1393256224.31769.11.camel@ted>
In-Reply-To: <1393256224.31769.11.camel@ted>
X-Enigmail-Version: 1.5.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] scripts/oe-setup-builddir: Keep track of TEMPLATECONF setting
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
X-List-Received-Date: Mon, 24 Feb 2014 15:42:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2014-02-24 08:37, Richard Purdie wrote:
> On Mon, 2014-02-24 at 08:18 -0700, Gary Thomas wrote:
>> Keeping track of the TEMPLATECONF variable in the build
>> tree will let this script produce the same output when
>> listing 'conf-notes.txt' every time the script is run,
>> regardless of whether or not TEMPLATECONF has been provided
>> by the user.
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>  scripts/oe-setup-builddir |    8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
>> index a869fdc..4322158 100755
>> --- a/scripts/oe-setup-builddir
>> +++ b/scripts/oe-setup-builddir
>> @@ -37,8 +37,16 @@ fi
>>  
>>  cd "$BUILDDIR"
>>  
>> +if (test -f "$BUILDDIR/conf/template.conf") then
>> +    TEMPLATECONF=$(cat $BUILDDIR/conf/template.conf)
>> +fi
>> +
>>  TEMPLATECONF=${TEMPLATECONF:-meta/conf}
>>  
>> +if ! (test -f "$BUILDDIR/conf/template.conf") then
>> +    echo "$TEMPLATECONF" >$BUILDDIR/conf/template.conf
>> +fi
>> +
> 
> Can you please call this something other than xxx.conf? I don't fancy
> someone trying to load this ".conf" file with bitbake...
> 
> Since you're also looking in this area, there is one piece I've meant to
> add for a long time but never quite got to. I think something like a
> hidden top level ".templatepointer" style file might be a good idea for
> repos like poky and for anyone else trying to customise the build. This
> would allow us to point directly at poky's template configuration files
> without having to hack the scripts which is currently what happens
> there.

Do you mean for things like this line which is different in Poky?
  TEMPLATECONF=${TEMPLATECONF:-meta/conf}
vs.
  TEMPLATECONF=${TEMPLATECONF:-meta-yocto/conf}

Do you have a list of where such differences are so I can address them?

> 
> That hacking has long since bothered me, equally, I tend to have more
> pressing issues to deal with so its never been done as yet.

I'll see what I can do to improve on this and send a new [set of] patches.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

