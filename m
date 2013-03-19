Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UHy3p-0005jy-4J
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 16:02:52 +0100
Received: from atl4mhob11.myregisteredsite.com
	(atl4mhob11.myregisteredsite.com [209.17.115.49])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r2JEju0W002233 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 10:45:56 -0400
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob11.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r2JEjtNp015720 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 10:45:55 -0400
Received: (qmail 5886 invoked by uid 0); 19 Mar 2013 14:45:54 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 19 Mar 2013 14:45:54 -0000
Message-ID: <51487A22.5080900@topic.nl>
Date: Tue, 19 Mar 2013 15:45:54 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20130228231551.3998F5022B@opal> <20130306062358.GC14869@jama>
	<5136F97E.1030906@topic.nl>
In-Reply-To: <5136F97E.1030906@topic.nl>
Subject: Busybox mdev INITSCRIPT_PARAMS gets lost
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
X-List-Received-Date: Tue, 19 Mar 2013 15:02:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In busybox.inc, the recipe says:

INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."

Actually "06" is alreay wrong, it should be "03" just like udev uses. 
The modules load at runlevel 04, so they'll fail to load correctly if 
they require firmware, soI amended this in a .bbappend to read

INITSCRIPT_PARAMS_${PN}-mdev = "start 03 S ."


But what ends up in the postinstall script is this (and that breaks the 
system):

update-rc.d $OPT mdev defaults

This used to work just fine about a month ago, but it's suddenly broken. 
Has something changed in update-rc handling?

Mike.



