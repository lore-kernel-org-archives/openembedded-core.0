Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1U5yy4-0007KG-BP
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 14:35:24 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6A106F81233; Thu, 14 Feb 2013 06:19:15 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4EEC5F81231;
	Thu, 14 Feb 2013 06:19:14 -0700 (MST)
Message-ID: <511CE466.40905@mlbassoc.com>
Date: Thu, 14 Feb 2013 06:19:34 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Broken dependency processing?
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
X-List-Received-Date: Thu, 14 Feb 2013 13:35:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have an customized image which explicitly names 'pulseaudio-server'
Building my image will break if I don't also explicitly name 'consolekit'

root@my_target:~# opkg whatdepends consolekit
Root set:
   consolekit
What depends on root set
         pulseaudio-module-console-kit 2.1-r15   depends on consolekit
root@my_target:~# opkg whatdepends pulseaudio-module-console-kit
Root set:
   pulseaudio-module-console-kit
What depends on root set
         pulseaudio-server 2.1-r15       depends on pulseaudio-module-console-kit

I can see that building pulseaudio does not force consolekit although it
will be required in order to install pulseaudio-server.

[gthomas@titan p82_soft]$ bitbake -g pulseaudio
Loading cache: 100% |####################################################################################| ETA:  00:00:00
Loaded 1415 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: PN build list saved to 'pn-buildlist'
NOTE: PN dependencies saved to 'pn-depends.dot'
NOTE: Package dependencies saved to 'package-depends.dot'
NOTE: Task dependencies saved to 'task-depends.dot'
[gthomas@titan p82_soft]$ grep consolekit pn-buildlist
    ... nothing (not present)

Note: my image/system does not normally include 'consolekit' and this behaviour
causes the image to fail to build.

I'm using the Poky/Yocto tree from a few weeks ago in case that matters:
   meta              = "master:09359e6ec00901abfe49157f1f9730117b4d284b"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


