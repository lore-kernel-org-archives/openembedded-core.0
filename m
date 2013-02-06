Received: from smtp.knology.net ([64.8.71.112])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyle@farnsworthtech.com>) id 1U3iIt-00049r-3d
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 08:23:31 +0100
X_CMAE_Category: 0,0 Undefined,Undefined
X-CNFS-Analysis: v=2.0 cv=d9t3OGfE c=1 sm=0 a=UfEqCK7YscORm1DYeV5WLg==:17
	a=D6wcrpBcUpcA:10 a=yr5IbeYSnHoA:10 a=dWUxHrtDoX8A:10
	a=8nJEP1OIZ-IA:10 a=4Du6mIFzAAAA:8 a=SrShUXqpy0UA:10
	a=yNhuIm87Nps9aViqvFwA:9 a=wPNLvfGTeEIA:10
	a=UfEqCK7YscORm1DYeV5WLg==:117
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
Authentication-Results: smtp01.knology.synacor.com
	smtp.mail=kyle@farnsworthtech.com; spf=neutral;
	sender-id=neutral
Authentication-Results: smtp01.knology.synacor.com
	header.from=kyle@farnsworthtech.com; sender-id=neutral
Authentication-Results: smtp01.knology.synacor.com
	smtp.user=kfarns@knology.net; auth=pass (LOGIN)
Received-SPF: neutral (smtp01.knology.synacor.com: 24.214.129.45 is neither
	permitted nor denied by domain of farnsworthtech.com)
Received: from [24.214.129.45] ([24.214.129.45:63132]
	helo=host.farnsworthtech.com)
	by smtp.knlogy.net (envelope-from <kyle@farnsworthtech.com>)
	(ecelerity 2.2.3.47 r(39787)) with ESMTPA
	id 16/51-16665-8EFC2115; Wed, 06 Feb 2013 16:49:28 -0500
Received: from [192.168.1.66] (farntech1.farnsworthtech.com [192.168.1.66])
	by host.farnsworthtech.com (Postfix) with ESMTP id 8BBC58136B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2013 15:49:27 -0600 (CST)
Message-ID: <5112CFE7.8070300@farnsworthtech.com>
Date: Wed, 06 Feb 2013 15:49:27 -0600
From: Kyle Farnsworth <kyle@farnsworthtech.com>
Organization: Farnsworth Technology, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.5
Subject: tinylogin ends up with group/user id 1000
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
X-List-Received-Date: Fri, 08 Feb 2013 07:24:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

tinylogin installs the executable using the mode setting "-m 4755" which
sets the userID bit (-rwsr-xr-x).  From what I read that seems like the
right thing to do.  But when it gets added to the rootfs image it ends
up with a group and user id = 1000.  Then when getty attempts to login I
get this message:
    login: cannot set groups: Operations not permitted

I did enough debugging to find this occurs when it makes a syscall to
setgroups.  If I change the install to use mode "-m 0755" the group/user
id ends up being 0 and it works.

Where is the logic that determines group/user ids and why would it use
1000?  Can I override it?

Kyle


