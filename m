Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QchP1-00021d-PI
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 19:21:15 +0200
Received: by iym10 with SMTP id 10so3246758iym.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 10:17:30 -0700 (PDT)
Received: by 10.42.94.6 with SMTP id z6mr3776076icm.91.1309540649806;
	Fri, 01 Jul 2011 10:17:29 -0700 (PDT)
Received: from [192.168.1.174] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id s2sm3524541icw.17.2011.07.01.10.17.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 10:17:28 -0700 (PDT)
Message-ID: <4E0E0122.5070801@mvista.com>
Date: Fri, 01 Jul 2011 10:17:22 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <RFC: Layer tooling brainstorming>
	<201105201745.29497.paul.eggleton@linux.intel.com>
	<4DD6A817.6050701@mvista.com>
	<201107011424.27821.paul.eggleton@linux.intel.com>
In-Reply-To: <201107011424.27821.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
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
X-List-Received-Date: Fri, 01 Jul 2011 17:21:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 7/1/2011 6:24 AM, Paul Eggleton wrote:
> Hi Jeremy
> 
> Have looked at this further and I really think this needs to be a separate 
> utility, but one still written in python using bitbake's infrastructure (like 
> bitbake-layers). The advantages of this approach:
> 
> 1) Avoids reworking bitbake's initialisation and avoids possible re-execution.

Neither of those are issues in the current patch. Setting up the
fetchers so they work, inside a local copy of the data is hardly
reworking the initialization.

> A separate utility can take advantage of a full parse and utilise all of the 
> user's configuration.

This is certainly the case, however in the time that we have used this
type of structure we have never needed all of the config data because
you are always more less very early in the process. More or less you
could create a bitbake-layers style "utilty" with the current patch. In
the current patch, there is only a single line of code in the cooker,
everything else is competely isolated.

> 2) Fetching/updating layers should be (able to be) a conscious action rather 
> than something that happens implicitly as part of the build process

This seems rather arbitrary. As noted this is not some theoretical
process that I am proposing. We have tons of customers already use, and
have used this type of model for a very long time. While I can certainly
see the advantages of an external tool, why is it an either or? the
reality is with the current patch, we already have bitbake-layers style
utility. Its called bitbake. :) Run it with no argument and the first
thing it does is fetch everything.


> I'm trying to put something together that does this at the moment, with a view 
> to there being components that allow integration with the content tools you 
> posted earlier. Will keep you posted.

For what it is worth, I would still like to see something like the patch
get integrated. The single line in the cooker could be surrounnded by a
BB_ var, and you more or less wouldn't know the difference. Also if
BBLAYERS is just directories like it is now, every line is more or less
ignored and passed back untouched.



-- 
Jeremy Puhlman
Montavista Sofware, LLC.


