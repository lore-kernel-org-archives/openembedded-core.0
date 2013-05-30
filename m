Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1525B60881
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 16:45:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UGnuBJ005686; Thu, 30 May 2013 17:49:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d64qswPyPAe6; Thu, 30 May 2013 17:49:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UGnq8s005681
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 17:49:53 +0100
Message-ID: <1369932321.14887.320.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>, "saul.wold"
	<saul.wold@intel.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, "Georgescu, Alexandru C"
	<alexandru.c.georgescu@intel.com>, "Flanagan, Elizabeth"
	<elizabeth.flanagan@intel.com>, "Hart, Darren" <darren.hart@intel.com>
Date: Thu, 30 May 2013 17:45:21 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Issues with gcc 4.8 sstate "contamination" on the autobuilder
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
X-List-Received-Date: Thu, 30 May 2013 16:45:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I want to make people aware we're seeing some issues with gcc 4.8 on the
autobuilder.

gcc is a whitelisted dependency in sstate so it is *not* accounted for
in the sstate checksums.

This means if you run a build with gcc 4.8, switch to 4.7 and then run a
similar build, you can reuse sstate between the two. This has lead to
failures on the autobuilder recently which have been rather confusing
and is why the weekly test report is as red.

I want to highlight the problem and make it clear this isn't an sstate
bug, the sstate class is explicitly allowing this as things stand.

In normal usage, you don't want a small change to gcc changing your
world around so the class is probably ok as it is but we are going to
have to be careful with builds going forwards. 1.5M1 may need clean
sstate, just to be sure.

Cheers,

Richard


