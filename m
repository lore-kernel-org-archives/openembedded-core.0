Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QgLdd-00078e-1z
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 20:55:25 +0200
Received: by iwn4 with SMTP id 4so3991641iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 11:51:27 -0700 (PDT)
Received: by 10.42.132.132 with SMTP id d4mr4220377ict.325.1310409955428;
	Mon, 11 Jul 2011 11:45:55 -0700 (PDT)
Received: from [192.168.1.7] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id x4sm7097374ibm.8.2011.07.11.11.45.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 11:45:53 -0700 (PDT)
Message-ID: <4E1B44DE.2050209@mvista.com>
Date: Mon, 11 Jul 2011 11:45:50 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <RFC: Layer tooling brainstorming>
	<201107041339.15672.paul.eggleton@linux.intel.com>
	<4E13A081.2020904@mvista.com>
	<201107111846.26118.paul.eggleton@linux.intel.com>
In-Reply-To: <201107111846.26118.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Mon, 11 Jul 2011 18:55:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> I am aiming for this use case to be supported with my utility. What I would 
> also like to handle though is that if you have chosen to set up some 
> configuration, then it will be able to be read in before the fetching starts.

Sounds reasonable.

>> I get it you don't want it to be automatic. Do you have something I can look
>> at that addresses the remote layering? 
> 
> I've thrown together a proof-of-concept "bitbake-fetchlayers"  in the 
> "paule/remotelayers" contrib branch:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-
> contrib/log/?h=paule/remotelayers
> 
> This is by no means a finished utility, may have hideous bugs, etc. This 
> requires nothing more than vanilla bitbake to operate. Some notes:
> 
>  * BBPATH needs to be set, LAYER_UNPACKDIR also.
> 
>  * Currently it requires conf/bitbake.conf, classes/ etc., which are shipped 
> with bitbake master but are not present with the copy of bitbake that's in 
> Poky; I hope to be able to address this in such a way that the utility does 
> not require these.
> 
>  * "init" is the command used to fetch multiple layers. I've also provided 
> "fetch" as a way to test a single fetch operation; I would expect the latter 
> to be removed at some point. (Also, none of these command names are final.)
> 
>  * Update is not yet implemented. For your use case, update is no more than a 
> re-fetch; however where you are intending to interact with the layers as SCM 
> working directories it would be better to do an update in-place. I'm still 
> thinking about how best to implement this.

I will try and check this out later this week.

>  * Output is rather noisy, this needs to be fixed also.

k.

>  * I did have to patch the fetchers as Richard suggested so they have default 
> values for the configurable fetch commands. (We'd have to have done this 
> anyway.)

Great.

> 
> I think we can support this without any issues - any of bitbake's fetchers 
> should be able to be used, including wget and local. You won't need to grab 
> oe-core first.

Okay.

> Hmm. For simplicity I've only supported fetch2 in bitbake-fetchlayers - in 
> fact it forces it at startup. It would not be hard to support fetch also, 
> however I hope we could avoid having to do so.

That is fine. The legacy code is likely not going to be moving over to
this anyways. It was more of a response to why did you do it, rather
then it needs to support it. Don't bother unless it is really needed by
someone else.


-- 
Jeremy Puhlman
Montavista Sofware, LLC.


