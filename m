Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q8Dse-0001KM-LT for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 17:45:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38FhhGV008651;
	Fri, 8 Apr 2011 16:43:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08536-02; Fri,  8 Apr 2011 16:43:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38FhUvK008641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Apr 2011 16:43:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, poky
	<poky@lists.yoctoproject.org>
Date: Fri, 08 Apr 2011 08:41:02 -0700
Message-ID: <1302277262.22904.136.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Illustration of task latency
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
X-List-Received-Date: Fri, 08 Apr 2011 15:45:53 -0000
Content-Type: multipart/mixed; boundary="=-ok2I1kpa37HbnsEGydmr"

--=-ok2I1kpa37HbnsEGydmr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've done a lot of good work in optimising task execution and latency
however I was looking at some of our build data and I think we still
have work to do. The attached picture is a "bootchart" style picture
showing the task execution at the start of a build. Each vertical
division represents one second. As you can see, the fetch/patch tasks
themselves run very quickly. Those markers are from the task entry/exit.

The worrying part is the empty space between the tasks which looks to be
about 1.5 seconds in size *per task*. This is a scary amount of latency
to be losing for task execution when you consider we have 4500 of these
for our reference build.

More investigation is needed to figure out where this time is being
spent but I'm guessing a significant fraction is in parsing the recipe
of the task that is about to be executed. We need to confirm that but if
that is the case but one possible optimisation is we should ensure we're
not parsing every BBCLASSEXTEND variant of the recipe, just the one we
want to run. I'm sure there are other ways we might be able to improve
this too.

Cheers,

Richard

--=-ok2I1kpa37HbnsEGydmr--
