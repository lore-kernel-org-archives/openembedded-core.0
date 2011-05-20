Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QNTlj-0003xI-FV
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 19:45:47 +0200
Received: by pvc30 with SMTP id 30so1835834pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 10:42:49 -0700 (PDT)
Received: by 10.68.16.100 with SMTP id f4mr7662902pbd.57.1305913369736;
	Fri, 20 May 2011 10:42:49 -0700 (PDT)
Received: from [192.168.1.64] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id q10sm2573085pbk.39.2011.05.20.10.42.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 10:42:48 -0700 (PDT)
Message-ID: <4DD6A817.6050701@mvista.com>
Date: Fri, 20 May 2011 10:42:47 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <RFC: Layer tooling brainstorming> <4DCBDC96.1080306@mvista.com>
	<4DCC1A0B.3040802@mvista.com>
	<201105201745.29497.paul.eggleton@linux.intel.com>
In-Reply-To: <201105201745.29497.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 20 May 2011 17:45:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> I think it's just about the placing of these defaults, I don't necessarily 
> object to having them in the first place. My main concerns are around the 
> defaults for variables like TMPDIR which may end up actually being used in 
> preference to what the user has set in local.conf. Obviously we have a 
> chicken-and-egg situation where we depend on having the main layer present to 
> read any configuration other than bblayers.conf - perhaps this indicates we 
> need to restructure some of the config files if we want to make this work 
> nicely.

So with regard to the code specifically:

TMPDIR really is the only major offender there as far as I can tell, all
the other variables are set in the local copy of the data and disappar
after the fetch. That variable setting could get moved over to the local
copy as well, though we would need to change the way LAYER_REMOTE_STASH
and LAYER_UNPACKDIR are set to make sure they are correct for the rest
of the parse but that is not a big deal. Or we could set those via
something relative other then TMPDIR, TOPDIR perhaps.

General case:

In reality looking at the bulk of the settings there, there are a couple
different groups there.

There is the stuff to make the fetchers work. I think those should
probably make their way in to the the code in general. Setifunset means
they can be changed early(bblayers), or overridden with the first
bitbake.conf and in general they are rarely used in any user
configurations(local.conf) or at least shouldn't. Having working
fetchers from the first parsed line of configuration data seems like a
generally good idea, but that is just me.

There is the stuff only related to the fiddling with remote layers,
which I talked above, can be changed to use any location in general.

> 
> I'd definitely be interested in seeing these tools and trying to incorporate 
> them into what we're doing for layer tooling in 1.1. Is there a lot of work 
> left to do before you can release these?

Work this week has been a bit slammed. Hopefully I will be able to post
something this weekend, maybe Monday.


