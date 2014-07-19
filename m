Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 603 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 19 Jul 2014 12:20:41 UTC
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4BC705C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 12:20:41 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id D6D028E4FF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 14:10:37 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 14:10:37 +0200 (CEST)
Message-ID: <53CA603D.4050900@topic.nl>
Date: Sat, 19 Jul 2014 14:10:37 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
Subject: PRSERVER is killing settop boxes
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
X-List-Received-Date: Sat, 19 Jul 2014 12:20:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

For a hobby project (openpli.org) there are about a million boxes 
running software built with OE.

I recently upgraded its core to the current master. What now happens is 
that if a package like gcc has been changed, it will not only rebuild 
everything, but it will also give all packages a new PR number. When a 
box in the field now runs "opkg upgrade", it will get 286 "new" packages 
and will try to squeeze them into its flash filesystem (even though only 
about 5 of these packages actually have different content). This is 
likely to kill the box, as the packages installed later on will take up 
more room in the flash system than when they were initially installed 
from scratch, and many models are using over 90% of the NAND flash space 
available already.

Before the PRSERVER was made mandatory, we never had this problem.

Is there a way we can get the old behaviour of having to explicitly set 
the PR of each package?
Or at least, distinguish between "the package itself was modified" and 
"some library it depended upon was altered and we built a new one just 
to make sure, but it'll likely work just fine with the previously built 
one, so don't update the PR of the dependent packages".


-- 
Mike Looijmans

