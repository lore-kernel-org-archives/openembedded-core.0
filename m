Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1Ua3Mq-0003Xt-1P
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 14:21:13 +0200
Received: from atl4mhob10.myregisteredsite.com
	(atl4mhob10.myregisteredsite.com [209.17.115.48])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r48C36S5015267 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 08:03:07 -0400
Received: from mail.hostingplatform.com ([10.30.71.204])
	by atl4mhob10.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r48C359G028619 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 08:03:05 -0400
Received: (qmail 25097 invoked by uid 0); 8 May 2013 12:03:05 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 8 May 2013 12:03:05 -0000
Message-ID: <518A3EF8.20807@topic.nl>
Date: Wed, 08 May 2013 14:03:04 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1368002042.git.liezhi.yang@windriver.com>
	<ee7a94478d58f0f43640cf9ae97018545a4ce6b6.1368002042.git.liezhi.yang@windriver.com>
In-Reply-To: <ee7a94478d58f0f43640cf9ae97018545a4ce6b6.1368002042.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] bbclass: bb.fatal() clean up
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
X-List-Received-Date: Wed, 08 May 2013 12:21:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2013 11:06 AM, Robert Yang wrote:
> The bb.fatal() is defined as:
>
> def fatal(*args):
>      logger.critical(''.join(args))
>      sys.exit(1)
>
> So anything after bb.fatal() in the same code block doesn't have any
> effect, e.g.:
>
>      bb.fatal("%s_%s: %s" % (var, pkg, e))
>      raise e
>
> The "raise e" should be removed.

Just some random thoughts that occurred to me when I read this:

The "terminate" effect would be obvious if "fatal" were an exception to 
be raised instead of a function to call which does not really return. If 
I'm not mistaken, "sys.exit(1)" actually just raises a SystemExit exception.

So instead of:

bb.fatal("something went wrong")

the syntax would become:

raise bb.Fatal("something went wrong")


Having typed this, the next random thought I got was that a thing like

catch Exception, e:
    bb.fatal("Error: ", e)

isn't really adding anything useful, it just "translates" the exception, 
logs its message, and then throws an obscure system exit exception 
instead of the much more useful inner exception.




