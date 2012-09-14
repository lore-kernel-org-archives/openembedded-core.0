Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TCJwG-0001jh-Oi
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 02:39:21 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 13 Sep 2012 17:26:45 -0700
Received: by pbcwy7 with SMTP id wy7so4534749pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 17:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Wu9wPgo+gxqrgJ9EX4lvszjsJmxcHlcbNBlVJAsZeTI=;
	b=Kv8J+4yZjuDJUKMRVIP4/Tqqf084mShr6VJ0RSTllITQ4E+Dy2lsyOIkVMXXXgQ2SI
	dO1GI0hNvjJOKi1yNFfehbgmb9BgTenebeCGCQQOCEFGj52wM4WIK2KN3LDc0K68pGTo
	YlIuXsMWGm/CUT+iLXj4PZKiA7Ah6sbFlS/ENPFwm4TVwxwm3X/ZAFfqXEF4uglkNVcU
	uJjPUuUgBv4ozApm5vQbL/N0IIvQPwWnAcffdaMfH+Hmt9hdHVbBapmK5gqDH2/2lyLM
	20faWpfw3cknUl3xPthdILadAOYeorVkGDj/4QLmC8iI3pwVUNFFsae/5wPKCTtGTTyE
	UVRw==
Received: by 10.66.88.233 with SMTP id bj9mr1259691pab.72.1347582404226;
	Thu, 13 Sep 2012 17:26:44 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id ih2sm108598pbc.65.2012.09.13.17.26.39
	(version=SSLv3 cipher=OTHER); Thu, 13 Sep 2012 17:26:43 -0700 (PDT)
Message-ID: <505279BB.8040201@intel.com>
Date: Thu, 13 Sep 2012 17:26:35 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1347373349.2122.35.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A66FF3F@039-SN1MPN1-001.039d.mgd.msft.net>
	<1347459386.11710.23.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A674D1E@039-SN1MPN1-001.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A674D1E@039-SN1MPN1-001.039d.mgd.msft.net>
X-Gm-Message-State: ALoCoQm226DtNblhMUz7jnHqHY1zeueqOAq+PdjYB/GnnSWohNFwAXA3iSJg+ihMEfkoLQQKmtMb
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 00:39:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2012 10:47 AM, McClintock Matthew-B29882 wrote:
> On Wed, Sep 12, 2012 at 9:16 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2012-09-11 at 19:01 +0000, McClintock Matthew-B29882 wrote:
>>> On Tue, Sep 11, 2012 at 9:22 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> Unfortunately whilst rerunning configure and make against a project will mostly
>>>> work there are situations where it does not correctly do the right thing.
>>>>
>>>> In particular, eglibc and gcc will fail out with errors where settings
>>>> do not match a previously built configuration. It could be argued they are
>>>> broken but the situation is what it is. There is the possibility of more subtle
>>>> errors too.
>>>>
>>>> This patch adds removal of the build directory (${B}) when configure is
>>>> rerunning, the sstate checksum for do_configure has changed and ${S} != ${B}.
>>>> We could simply use a stamp but saving out the previous configuration checksum
>>>> adds some data at no real overhead.
>>>>
>>>> If we find there are things where we want to disable this behaviour with
>>>> CONFIGURESTAMPFILE = "" in the recipe, or users could disable it globally.
>>>>
>>>> [YOCTO #2774]
>>>> [YOCTO #2848]
>>>>
>>>> This is particularly helpful for eglibc and gcc which use split builds by default and
>>>> are a particular source of reconfigure type problems.
>>>>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> Is it feasible to back port this to denzil? I've encountered what I
>>> think are similar issues reconfiguring gcc for example.
>>
>> One of the bugs above is open against denzil and the issue certainly
>> exists there. The patch should apply equally well there.
>>
>> I'd suggest we let this settle in master for a week or two and then add
>> it to the backport queue if no problems arise.
>>
>> Cc'ing Scott so he's aware of this.
>
> I've added this to my denzil branch and will start doing build testing.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=mattsm/denzil

I'll be returning from travel tomorrow and hope to catch up with my 
denzil backlog, and queue up a new build on the autobuilder.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


