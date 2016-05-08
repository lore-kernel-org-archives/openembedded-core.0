Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 5D85860670
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 16:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 3B9021EE081B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:05:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id hDX86l15kPqj
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:05:57 +0200 (CEST)
Received: from bluemind.smile.fr (bluemind.prod.vitry.intranet [10.10.1.35])
	by idris.smile.fr (Postfix) with ESMTP id 1271E1EE07CA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:05:57 +0200 (CEST)
Received: from localhost.localdomain (localhost [127.0.0.1])
	by bluemind.smile.fr (Postfix) with ESMTP id 0FF0C5460416
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 18:05:57 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 08 May 2016 18:05:57 +0200
From: Jeremy ROSEN <jeremy.rosen@smile.fr>
To: <openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1462216694.git.chris_larson@mentor.com>
References: <cover.1462216694.git.chris_larson@mentor.com>
Message-ID: <e9b4b7a9c7391a30eb2c08ef245e70d8@smile.fr>
X-Sender: jeremy.rosen@smile.fr
User-Agent: Roundcube Webmail/0.8.5
Subject: Re: [for-master][RFC PATCH 0/3] Support template files for wic wks
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
X-List-Received-Date: Sun, 08 May 2016 16:05:58 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit





Le 02/05/2016 21:23, Christopher Larson a écrit :
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This adds support for .wks.in files as WKS_FILE.
> 
> These files are treated as the contents of a bitbake variable, so 
> usual
> bitbake variable references are supported. I considered using another
> templating mechanism, for example the one used by yocto-layer, but 
> then we'd
> end up largely mapping metadata variables to template fields anyway, 
> which is
> a pointless indirection. Let bitbake expand the variables directly 
> instead.
> 
> This feature lets us, for example, reference ${APPEND} in --append, 
> and avoid
> hardcoding the serial console tty in the wks file, and let the user's 
> changes
> to APPEND affect wic the way they do the other image construction 
> mechanisms.
> 
> The template is read in and set in a variable at parse time, so 
> changes to the
> variables referenced by the template will result in rebuilding the 
> image.
> 
> It's been suggested that the name should better reflect how its 
> contents are
> used, i.e. .bbin or so. I've also considered including something like 
> 'bbv' or
> similar, to indicate its contents are that of a bitbake value. I think 
> this
> should be discussed.
> 
> I'd love to hear questions or comments on this. I think the value is 
> clear,
> and it's something we need to solve, but I'd like to hear if others 
> agree or
> disagree on that, and whether this implementation is appropriate.
> 
> 


We have been discussing this a bit with Chris on IRC and i'll add a 
couple of thoughts we had so that discussion isn't completely lost.

As a final user of yocto, I find the need for templating in wic very 
usefull, it would allow me to specify disk size in the machine 
specification and adapt the wic image accordingly, or use different disk 
names ( mmcblk vs sda)

however my need is more generic and I think it would be interesting to 
consider a bigger problem : using yocto variables in configuration 
files. (I mean files in /etc/ here, not yocto configuration)

It is a pretty common problem to have to tailor configuration files for 
particular machines, distro features, optional dependencies etc... this 
is possible to do using OVERRIDES but it can only be done at the 
whole-file level, not within a configuration file. Moreover it makes 
some complex cases very tricky. let's present an example

It is pretty common to need to include the build-machine's ip address 
in a configuration file. This can be usefull to send logs if the build 
machine is also the developer's machine. The ip address of the build 
machine can be easily obtained via python and put into the bitbake 
environement, but using that variable to set a value in a random file in 
/etc is pretty tricky.

similarly, I like to include my public ssh key as an authorized key for 
root on my builds, il makes testing way easier

I think having a generic templating mechanism that would recognise some 
source files as needing template extension would be awesome. I don't 
understand fully how bitbake/yocto works, so I can't design a complete 
archtecture, but here are a couple of thought we had with Chris on IRC

* recognise *.in in the same way *.patch are recognized. Is there a 
risk of improper expansion ? maybe specify that templating is needed as 
a parameter in SRC_URI
* should expansion be in do_fetch or do_patch or somewhere else... 
images tend to skip do_patch, but do_fetch is on the bitbake side IIUC. 
would that be a problem ?
* interaction with sstate and rebuilding needs to be considered... 
changes need to be detected post-templating obviously

Overall, I really like the idea of this patch, there are lot of things 
in a .wks that need expansion, but I think there is even more in every 
other configuration file of the system.

Hope my random thoughts helped

Regards

Jérémy Rosen


